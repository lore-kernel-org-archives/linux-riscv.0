Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1420C0218C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BW94Cjo7yQ9dYoINH40Tw4gGAuqwMUCjBuZYIrewFA=; b=JqRt0fmlZCgMAL
	izE2gK2Nv7aO4MjgjUg2dALOYoeHnqBy94ENJdkYFrASTeyfaYCbi+Yxa/F/7j7Ki145SjuyFL0dI
	aBf0wBV2N1b+Qsz5DNj/UoJxQWuSfMPzEKuL9Dcve7OmzsbMkOATUEo1U6aYBlYkEGjlNI0uyEN08
	fLLhMt/p554y3sfiLcNSQeHotPzWkt8DqEkWEbxZ5vl2JkdQzWbRcU1MNGhS7M8qZIZCdiRSQTeC7
	y+CfwWpsDdz3a4o8oCNgUJKKrdcH1j4ZPb2JQCtUt0/Ec6AOi3Rmmighcn9UJQodl2zPYgAYuX0ix
	CcpyvXUaXEtDGja7aqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxG4-0000000CWCV-2v9B;
	Thu, 23 Jan 2025 13:28:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxG1-0000000CW8v-1UjA
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 13:28:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-219f8263ae0so16873265ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 05:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638908; x=1738243708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDJpscd5iDH1/vb94JK69W34zwsdKCnkCWvmFoEl4dc=;
        b=A/13PZBj2WHITRvuauA8jSoIPtgDDqFZk+zBbtdCUczz+8TNOrLmYjTZG/wDhpWgin
         awOIrdOMQcBbrDyKZIOZ9dxD0oovzcVz9NTuhm88pzmM4SOgqDPRHiFcKFtnwhhgNNhl
         HKNbKU06EsftycgMe3ju/vyxA2h8V0MSqpbaB7q/uQ98MSab8ls9YqHnds0iR5/dJrGk
         LbmouQps64ameYQFmiI6if/SE4mP9zEMlJwczXypzBE0SqqrVSyHgOzoPLl7G00fgges
         g1TNQ0VVL8wa4T4PIm36iL4SIYXK5MxY6rVS4c7jl2BWCcpzly6Iz/OyQO8N76w8NM6Q
         gBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638908; x=1738243708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDJpscd5iDH1/vb94JK69W34zwsdKCnkCWvmFoEl4dc=;
        b=eIRNSHR9SMqbDKwyDKIuXAPJLlKpLYJDZZ64rUPpS2u0asl1XS6RRjvkVvmlPrvAyW
         dz/yLCqO7Go73NYTj2Uujf1X5a2251sXEAn/vGTPN+/N02xOjmhlljFPOzAIYUapk6TV
         hkWQNm1weWEg7+5NwC71aVZjKe1APrsRCw7tiEUdbybukS2QyNi7vL8rL2uN0G2cC+oh
         cIE6h78a3Anzk+FxYugrRmL5Z5sRRTgn5jeM5bvt+2D/E6UjDOr2TcE3PQEPjPxm36h8
         JALEpX693j6v+B7tYw8gAosf7jIH0QF3o/t4XPgtJPq53ZLc5Y3XSHrVD0R/VNEleqES
         8L1A==
X-Forwarded-Encrypted: i=1; AJvYcCU4fMMXBT4XWFvQaZIwntkodHQ06fmTf0O+rQ7dtBBtMlhGDPnUC2o7rNx9YMH8ujABhuRg4eg5iaAQ9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN2O08cAGZL/xlwEtvnlrozUGjrWRC07dBumyoVBUt3yfcOSbt
	P3Qk3ej6hTN5AdjyUGg4vKHbG25tGj94vzUJbEw/0Bn9Y2QTnGrbeCTKMosT20M=
X-Gm-Gg: ASbGnct+dY5acHpRHUA53lPI7xSYuPoWnwQSWXtZvsBWwLQ8QD0v0rWSVC9poZZ0Dm9
	CruMoO1WX8Gson8Cf64olJtR4T3wAJmJ8WGuiQlsRdhljgDsLX0QO0lnOFrE0SRAGA2lgY77ssf
	xxDeTuuGPJBlIkSLQR9jr/jJ7EogdE3ilFUJ4o4giQZJ8x0NRr8WppR65Y2qir7fYUI6+wsyWDn
	q053CjF1YdKxMR79CbPnzzD8H3SLQm9/JXj62jRrux2jkbVIjRsuU0E6Fyo3idCPD8nVBf+Fivn
	WElWDnwYxZMxAX592JYvBYVS4rbp1QqcaKownU5mnzdQ
X-Google-Smtp-Source: AGHT+IGvH4jPt9gEk2i8wJlEQCGHtq7Z8F/nhrt9cHdxqXKECEeUfNk2qVC/Ig+lLuwaqRjslO9WHQ==
X-Received: by 2002:a17:902:da8d:b0:216:386e:dd8 with SMTP id d9443c01a7336-21c3540cd05mr367659545ad.17.1737638908563;
        Thu, 23 Jan 2025 05:28:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:28 -0800 (PST)
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
Subject: [PATCH 1/5] mm: pgtable: make generic tlb_remove_table() use struct ptdesc
Date: Thu, 23 Jan 2025 21:26:14 +0800
Message-Id: <e2a1b07eda16eb84bdc51f6227fec02f2c0a54f7.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_052829_392155_D478921F 
X-CRM114-Status: GOOD (  11.34  )
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

Now only arm will call tlb_remove_ptdesc()/tlb_remove_table() when
CONFIG_MMU_GATHER_TABLE_FREE is disabled. In this case, the type of the
table parameter is actually struct ptdesc * instead of struct page *.

Since struct ptdesc still overlaps with struct page and has not been
separated from it, forcing the table parameter to struct page * will not
cause any problems at this time. But this is definitely incorrect and
needs to be fixed. So just like the generic __tlb_remove_table(), let
generic tlb_remove_table() use struct ptdesc by default when
CONFIG_MMU_GATHER_TABLE_FREE is disabled.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/asm-generic/tlb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index e402aef79c93e..10cdbe0e7adfe 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -228,10 +228,10 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
  */
 static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	struct page *page = (struct page *)table;
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(page_ptdesc(page));
-	tlb_remove_page(tlb, page);
+	pagetable_dtor(ptdesc);
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
