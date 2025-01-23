Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F328FC02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btwZ9Uz1DvkX8yBlhQmnpGsry/01RRs0lmOA5XrWQU8=; b=Id8fcTM7aV5M6T
	+89A1wg9g+9FJzvo8hLnQiz0asjSXEn3O1gqE7Qmvq8N9weSyAQgrOIuXxq4PFgak4BMr3T30ML/S
	A7rcMY73zVwzo1+bFb/b+eKQU0RbN+QT8GssSoFM2L1k+AYvYAiGsmmhaY2vOK0QTwJDA4FI0vYWX
	F/6IaYLdZGzj/Pt0PszTQB/Z7nWOFNL3bAHi0bZQ7SwMEj/WHYOF+ZA690T5/Iok6xgG1DueMBuax
	q0T40D66O6ggcYHgZt5kTSpO7nBdF7oUoIWnE0Kc1/OKSvWmJYRwhTGA1ktcHRFwPdbQSlUdyLabW
	lGVIcBUnyBhDvtEKMTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxGi-0000000CWd1-0L4I;
	Thu, 23 Jan 2025 13:29:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxGf-0000000CWa1-0mGM
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 13:29:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216728b1836so13931615ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 05:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638948; x=1738243748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=dZmriKqVdLkRsJYb9RCNJZvdzO+mo/QpnmTqNckodE2SQ78rkhe9QBZpfsIvf3Me8f
         TBJOiSuOz7b0eI3AK6bGiGH2GCLt9HCEAB20eemNpl9YTyc1T5y7TjGYjzw//f1CPP4Y
         AaKOzNwS+hAOYLA1r/91+tgXaGH4eKBB3D+wGcaOwR7HZDMmQn6lpeGOy5Z/tFVYIOcJ
         rwEfkss2axLRmk68Q8+rZr6+TgWPL9tqUkHcGgyRtLNc0l2miyUYVgjeZn+8mHo59vfu
         QBRhJDAEa7Tr0y6ilaMF23T1RD/oAvMfkmStftu9v8MzJ7c82UO7SAwJF022hJMU3dnw
         dYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638948; x=1738243748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=EsrPtTUsfeGr7Ffnt9s8esTkZW7Lbbo30M4AfUtg5H48t4jPstr865yzJmxKVfQ17d
         QnHLlZih3eIUz5QUhapycn6mcS5ZD93GmjH7Rvu7lq/0eZgn0GbgevBmcumTeedsuptv
         emz4EE2mYqes4VEaPutoRLhLDQz6aPS6koNpMVh5chYY8kbyI09/SifYTDcCLmwKH/7M
         PjxMkbKl5lwGgk+1GxN8QRNbhSdSYNKsForv+OMuo8XKZHWWJZGXEXXESBb2qATeKOHe
         K2F8nQjuIsO7WSCihWK44H8M5LSoRIwLzwrJ7mhULjGcdxGAuBcVHP7r6kMBE+tPxrjT
         As5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGqCE6ZW3PLMFH5rTL9xgwkXL1mRInY4SIJCeEBd2LiHvry4dN8XKnmRniPBzOfnm2ztAfJFj9UDc8nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxxwyuTG/6PKui+V3hQJES5STB7aatC0zN/qNu5Ho7+xhjqKGg
	Q1G1wTvNeav9jTOR0HWusuIiQ0c1WcXJtRZbjH9IKV8WL8yp6x/t2AS7nHMGQsg=
X-Gm-Gg: ASbGncu8pCL4kGR8XxA6+MsQ9Rs7x0c5MzgSVY/rCb2EXxKOHqoQS0HEtucvamtezGB
	O5c3r0JOyLLZ2r2XvuBH+HbBOFWpye+8AK/9dEH8tdFCFLGeRQIbLnSZAMLCMv5mZ1ad0Htozgh
	uhG0wjr5jvQ6j3ntyClzCXOD/EBnw4ly8BSG7tnYDg6q1p8zWpaSW6sWzdjTux+ukOECKVIBALH
	zlieaiHoZposUDt6SNemkCHcmitzzEqAf9urJF950yPfyHb3kspoUhOQb1aCyvNNS/FepDsPYiN
	+LD+8MdZFXQBHVuUhtugbfX2OmqWnxgQ2X13Qyuu3vZL
X-Google-Smtp-Source: AGHT+IFkSdO3UtmG5jKkAJtanqQZSHufZoNoVtMFPHl42HZUz79kP6iB5Pw4LWGczfrtYHtt4kZUXA==
X-Received: by 2002:a17:902:f54f:b0:215:b468:1a33 with SMTP id d9443c01a7336-21c351c67acmr376126085ad.4.1737638948337;
        Thu, 23 Jan 2025 05:29:08 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:29:07 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 5/5] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:18 +0800
Message-Id: <62d6a04c3a0e70efd435cc2c8a4d9d07d94e7ece.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_052909_221096_9225FB8F 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The tlb_remove_ptdesc()/tlb_remove_table() is specially designed for page
table pages, and now all architectures have been converted to use it to
remove page table pages. So let's remove tlb_remove_page_ptdesc(), it
currently has no users and should not be used for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 10cdbe0e7adfe..dec030cb12108 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -509,12 +509,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 	tlb_remove_table(tlb, pt);
 }
 
-/* Like tlb_remove_ptdesc, but for page-like page directories. */
-static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
-{
-	tlb_remove_page(tlb, ptdesc_page(pt));
-}
-
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
