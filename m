Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38EAC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WCoFgWXt72ObxbHjPZQgxVNvZdFumhn1mJ1adInapM=; b=S6mqiGtcF3FxA4
	cvFX+ZCw9jV12ZZBvttqBLESgH2ukxVLWquTMa0dR9imLX3ZDfoT8qlObclHxRgQ6hyeFD0db6dlt
	4QvdzPJRhYnl5oiTip7RlKxEue6T6EvSS4fx5AKpb78viakrx+/H83byuN6JtbG7gkCIb1o5P8Bi5
	RW4cDQ1eNKOno7D9fjK00b+3IpmZyZyojI1XK18Lbk4mFb6oJ5GEbGm7FFBdl8JWijOB3W5LIHUy2
	rs/7EmVv3ANGBMxVifSTySjSMfwFaVZ+dfNzcn8/yxmvOZEeA7XFV5Yo0ktCTzZI3tlo54GRo/VtS
	Nh+I94X8HiRust6OMRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6Ak-000EnX-0q;
	Thu, 27 Jul 2023 18:57:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6Ag-000ElQ-2g
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 18:57:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbfa811667so17472385e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 11:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690484222; x=1691089022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNM2lfApDpDHo6wA+erk64IwXrZaYOnl0F5llP9QRbw=;
        b=rezn/W64XZNrrJy+iA17PP4dY7NEgyDtF1IgTecXk40RddgHRKdjQdVLO3Dm1uiPer
         A/Ii0X04NrJUwOnHByd4OTxbucNLBTZMeUCmg0Q0dLf4NOeYY4NIOM5/xemrnEQdHqM3
         3PO1vT7NS3Pz3oSI0IdeDTeUN+MRrZJlAnsoxNG5N9A0RJP7xFhKTwCS9xEYMFj4sKiK
         upS7cJ6ZI05fw/KrM4vQe5n5xeNNgCxUW9CbTnUp9OdMXMunKs1O9Hg3Uyk0EhlxrNcE
         bPoSbeW9PJMxsO5k7dAJnx7DOdPk0t+LTa6vDnZpQDrikaZlST3yBaYyPG73FlWwmYXH
         6j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484222; x=1691089022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNM2lfApDpDHo6wA+erk64IwXrZaYOnl0F5llP9QRbw=;
        b=STRTTz3W6zlME1Jv9bP1PMFHDDeBX7CpB01iEr7AM58DGtcJDtU534sFj933EOrzJS
         cyBt4LPK1Wj1dF7rnMT3/6F0ygv8nBMa6jpGj2ok6lCSaJ3JgyioV5dv9gvE083Ar0Dn
         YF44U++sDFAETnUZ8gi7LmWbYEtPvvWCSKAzeeFHOMt9m1jVvwCD7Bwn2C8hmMi5WcHm
         uGWWN4NwaxPIvBj8Sj7KhYENFrbqyMaJksANXzahDm6efRkA+0QF6MDGEbb7p+lTUzeC
         ApTurEcOD7RxWpzuDkOUVD0twVOgeiOw1PCqM3JfC/tNRdTdKKT838fQ4G5xBSFoX8Fu
         lZgA==
X-Gm-Message-State: ABy/qLY/HiDaGjdj00mbtfpdAAvJSthLxG/xX+NG+Ntkp3imJ8yXJ2mG
	AJq2hTl8flsuGptl/6QvOoc7KQ==
X-Google-Smtp-Source: APBJJlFWr7cvkbR875xoBGCgLZGqrfaKgfeUiW96reSFz9d+/NwsOjVFOGJrqCp4Ny2X3+qOxY92VA==
X-Received: by 2002:adf:e692:0:b0:317:36d8:d6e8 with SMTP id r18-20020adfe692000000b0031736d8d6e8mr2479276wrm.25.1690484222369;
        Thu, 27 Jul 2023 11:57:02 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z15-20020a05600c114f00b003fbb5506e54sm2443379wmz.29.2023.07.27.11.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 11:57:02 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/4] riscv: Improve flush_tlb()
Date: Thu, 27 Jul 2023 20:55:50 +0200
Message-Id: <20230727185553.980262-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727185553.980262-1-alexghiti@rivosinc.com>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_115710_869008_B90DC360 
X-CRM114-Status: GOOD (  12.57  )
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

For now, flush_tlb() simply calls flush_tlb_mm() which results in a
flush of the whole TLB. So let's use mmu_gather fields to provide a more
fine-grained flush of the TLB.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/tlb.h      | 8 +++++++-
 arch/riscv/include/asm/tlbflush.h | 3 +++
 arch/riscv/mm/tlbflush.c          | 7 +++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 120bcf2ed8a8..1eb5682b2af6 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -15,7 +15,13 @@ static void tlb_flush(struct mmu_gather *tlb);
 
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
-	flush_tlb_mm(tlb->mm);
+#ifdef CONFIG_MMU
+	if (tlb->fullmm || tlb->need_flush_all)
+		flush_tlb_mm(tlb->mm);
+	else
+		flush_tlb_mm_range(tlb->mm, tlb->start, tlb->end,
+				   tlb_get_unmap_size(tlb));
+#endif
 }
 
 #endif /* _ASM_RISCV_TLB_H */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..f5c4fb0ae642 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -32,6 +32,8 @@ static inline void local_flush_tlb_page(unsigned long addr)
 #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
+void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
+			unsigned long end, unsigned int page_size);
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end);
@@ -52,6 +54,7 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 }
 
 #define flush_tlb_mm(mm) flush_tlb_all()
+#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
 #endif /* !CONFIG_SMP || !CONFIG_MMU */
 
 /* Flush a range of kernel pages */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..fa03289853d8 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -132,6 +132,13 @@ void flush_tlb_mm(struct mm_struct *mm)
 	__flush_tlb_range(mm, 0, -1, PAGE_SIZE);
 }
 
+void flush_tlb_mm_range(struct mm_struct *mm,
+			unsigned long start, unsigned long end,
+			unsigned int page_size)
+{
+	__flush_tlb_range(mm, start, end - start, page_size);
+}
+
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	__flush_tlb_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
