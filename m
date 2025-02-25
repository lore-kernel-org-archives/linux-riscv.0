Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17367C021B8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 03:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dpP1zN5P8G4NOakBbkhnBdUIi9dZMbtn43AORbNOUU=; b=2k2kYGy5xVHDKr
	ddpTsLutQiilHFCRf8SXR6+WpBYhr3w8TkOl+YCdHXPUHuoNH0DPc0QB6mpjm+ibR1YZqf02i/GL8
	YJpPfRLaAB+E1IgsOSAupLVPsuHsfvBNj6yaXLSwWjJ+VwhJwbKHbVuHL4pJVfy2i++QUAilKC0+G
	WpWWuZZqJsQYSbtvUP5Fvei3s2Ig3YlsnsIY4t9VewPLrrp9Zgk3GkZoR9OTZUU5HL/7IJOiV5Jay
	OsiKGESOegeibAYpXNXc+iKeK7Z0Ie/Xc9X54I0FPGe2ktGeYaw6MdtRbejnTJsXtiz079utq9+wb
	DPNL7Usr8h/jnShhZGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlu6-0000000FtWv-0UUM;
	Tue, 25 Feb 2025 03:46:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlu3-0000000FtUY-1DJE
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 03:46:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-220c4159f87so72120555ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 19:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455199; x=1741059999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=X3OkspkbTWOzjOZIRl5pUIycoang0a11pfuSTCtlzNDriQ0v0A8Mc0F5VVt1/hDedH
         pO8NKFqwbE7B6TxS0dPUGhdRKa9B0XtB5IrDvbywv2l16X4qY+1GrSR5IRCf5BBKiY7q
         IM/CqmKT2S4nl55yvOjK5OStj/pJiwvOsjUa0D1j+L/pYGnvx419D+zkkN3a4KFS0j4F
         kOmA40QAKFYNL4CnJLb5e8sIYB/9AsO8VnlCT+dwD9RlfUO5pM1Mw9ZERPHTIvtO2JoR
         EKuugu7ebyVB+6sAr8xyXWUmgedm/sTI+ST6vYCPVO38qFmdiEHcWglPRjBgXDyYQ32P
         dDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455199; x=1741059999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=kfaK9mSzMp+Rv7eLwC0AfhGeb1y3Q65xtSuKsY7cyzyxO5jIC16arPhdevyJzxhlcu
         txkJg+lir3Kg4ikwo8k4+7K4H/86zvRhOaMfx30ckm90vWO+nQ77mlKVLjoji3DN5dfD
         lSdzzK2Y1bsfXowXaPC1zGBy+m0weQCZdV6RwdF8PZaJrgBvlj7mHL43Ecn+Yfl/Y4tg
         H6cJlP4q6IbLXfSMan0st0M+E4bb8u/S2VmA7bCSRZXwMhlzWvtYHa2qR9qMJlJ9zynB
         iQieOFWFiHI1RpWkEqnpXVImW9SAbPIgMe7J5yIuqcCuGzujfrnY3vkRKnlSIqVKZxP9
         GVBw==
X-Forwarded-Encrypted: i=1; AJvYcCX69w/nzapWXHJprLoPFUNY35Hxv1PujFUy26U0/t1xKtZ2xLSH39/JaQDJnCeSfLLiVNucWS2rhnxmsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQn0Y21IAL1sk5KhyDTApRpOjzIGUlUFP2ht7b/yR0bNzobR88
	1LnVNCy9uCTTW+iFWh69EUsbWMGNa9ER5Mj3Ic0Gel+pvHv1XvzSQvDvDg584Kk=
X-Gm-Gg: ASbGnctbvt804r3IKWnH8BLDaTxVQC833P8nDfhH1uz/+QBkXMsqtYDVX369rjrjI/E
	Mv2jnOGjZ9bsPY9rrUalm+FSyIjj2UGoNjxKGssT2oWiAUhtUSzN8RmxB71MHF0dX3CauXbj197
	qhNr/i2Cyg8jsFGDIhQCRR258sm2An5PQm8X/LEWXg8823H31L7Q+8Vy45BVWKT4I4DrkObNRMA
	LoE2vTVWHzB3gjkpOEgyqC7UGMu76Hb4uAVnDSvZvtpa0kKpxcUfrYDEq+3ZoG9Ssgcn9gmaxEU
	vHMG0ebZTV4tBeq3kMC36SA18NLnIRlPABb/BaHNcoppdalAew0k0Tm+FU3Pngi7NA==
X-Google-Smtp-Source: AGHT+IFHXm4yz9k/q53vQDLsSd2kyUiUDLPeAK4sNAWc/t1WzpyNSO/kW4XJ16gHc0dMjVe/gJ+ItQ==
X-Received: by 2002:a05:6a00:230b:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-734791ab6bfmr3168643b3a.21.1740455198810;
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
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
Subject: [PATCH v2 2/6] mm: pgtable: change pt parameter of tlb_remove_ptdesc() to struct ptdesc *
Date: Tue, 25 Feb 2025 11:45:52 +0800
Message-Id: <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_194639_338533_C4D9192B 
X-CRM114-Status: UNSURE (   9.92  )
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

All callers of tlb_remove_ptdesc() pass it a pointer of struct ptdesc, so
let's change the pt parameter from void * to struct ptdesc * to perform
a type safety check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 54f579750c8e5..18bf499ef8801 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -506,7 +506,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
 }
 
-static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 {
 	tlb_remove_table(tlb, pt);
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
