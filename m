Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825FBC001B2
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2rd1gZXId6htHBPaudLwIQXbx2S1eD5QVtUdyy7LPo=; b=r7/05BDIIexUJq
	TrYhq/hjtxXxALua9Jy7aF2nJodLvBlmkdnSK3OVmq+Sjc4YwFjK6NxBUyqT/9Jfr8qSH9douNsqh
	bHa01UvJ/eBt8XYUVgCexDK0Zt+K7RnbdUFUycROLX0UX+QN3nEBWV5sA07KfL/vp0mRtbhuU3fPi
	ZMzxoGnQBzvE/I8WS9wcdzQ7cPfdrP/NTzFi0e98TehL0sJB172QI+Rpl17Pfwe59Ezga22ORqelL
	nJQqQz1ls6kYsWXod6zXrQUb1eCJ8ye54OHxvMCrNLI3A9a3id1FzCyTmi2W++7vkuwoXQOByTBDI
	6EUA/UQdDW/hZ9wHb7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVC-000vZH-1B;
	Sat, 28 Oct 2023 23:13:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV3-000vTJ-0r
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc20df5187so12487395ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534829; x=1699139629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iD5kVeuyzksz9qFDj4nk3gJEMMhm0SiL+jEgfo9gAo=;
        b=g3A+5bVkMqxwFOBTngd9Uh7BPn4awyGxnrFN+vzOlm9z9yr3KYjbHLFv7AdNF2d+0G
         hpEcEQRZl2vy3GbgC0XvhBUIul2v0h1KUu5KpjrqGB3HuHRsJ3rHrTbZeHeLoiD1h/pp
         ggtxzjHyzxPZ+AUAo9Q2HwuYI5/OMCts+SABuL2sR/o3tA4ZiHa0xucYV5/Ku1R3ZtWc
         nDbNoDXS5kiztBs67zoCpRS07V+h8fFiDXLz+MBLt12KNBGUamYOBLPlIFVgFsel4M+0
         LEXRAv/vJcRJKaSpSi+/AnXunvajVpgiSBnbUyNjvaNjKqJtVfG7/mvj1SIT8h7x+PHy
         14uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534829; x=1699139629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iD5kVeuyzksz9qFDj4nk3gJEMMhm0SiL+jEgfo9gAo=;
        b=ggVCCHsyzOFvMsz5e1KHrxT3pUKpsj4EzyPDuiznthYRq0PPYDUMLet/0LboAG76nX
         Vc/+kCyKvhGfU0n+ql34Lzo8g3m+Wth03aEKS4jIAxseOlCsSzdHQjHAxsGfCvT63ILq
         +HqIGGQt2w/DPllG70FygCZXtvLap9wcOfH+Y6eoHJS7LDAiZI558ozhr9csMmfV5Mco
         eTb8mJJ0F08FDMQD1kRLXhXwFGIiM5jc2ag7NPdSAQfoBJb1hi/yttM6PwbaibyPMwqx
         Q8LIT4XuggLILJfjFFqpwm0+H9/Em9v3lIIRHD+4rJDpFfqEwBLgSZCu/wBPEJD6+OcA
         9F6g==
X-Gm-Message-State: AOJu0Ywnnjzso1hfkQt4BPHkr7+ONvE2uew00YFzjNepzG1HGeFVvkmk
	v1c2Pc9qWBQZKtGuttSWhyZe2g==
X-Google-Smtp-Source: AGHT+IGZfjM6oWIducpDDQ7hM02X3ekD2Mrbs3+cVpCJdtVQrXLcSNbo2i119+LD0HVTSm0uB+XkgQ==
X-Received: by 2002:a17:903:11d1:b0:1cc:f41:8f82 with SMTP id q17-20020a17090311d100b001cc0f418f82mr8777913plh.16.1698534828754;
        Sat, 28 Oct 2023 16:13:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 05/11] riscv: mm: Combine the SMP and UP TLB flush code
Date: Sat, 28 Oct 2023 16:12:03 -0700
Message-ID: <20231028231339.3116618-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161349_319524_CD71C271 
X-CRM114-Status: GOOD (  13.75  )
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

In SMP configurations, all TLB flushing narrower than flush_tlb_all()
goes through __flush_tlb_range(). Do the same in UP configurations.

This allows UP configurations to take advantage of recent improvements
to the code in tlbflush.c, such as support for huge pages and flushing
multiple-page ranges.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

 arch/riscv/include/asm/tlbflush.h | 33 +++++++------------------------
 arch/riscv/mm/Makefile            |  5 +----
 arch/riscv/mm/tlbflush.c          | 13 ++++++++++++
 3 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8f3418c5f172..317a1811aa51 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -27,13 +27,12 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
-#else /* CONFIG_MMU */
-#define local_flush_tlb_all()			do { } while (0)
-#define local_flush_tlb_page(addr)		do { } while (0)
-#endif /* CONFIG_MMU */
 
-#if defined(CONFIG_SMP) && defined(CONFIG_MMU)
+#ifdef CONFIG_SMP
 void flush_tlb_all(void);
+#else
+#define flush_tlb_all() local_flush_tlb_all()
+#endif
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 			unsigned long end, unsigned int page_size);
@@ -46,26 +45,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
-#else /* CONFIG_SMP && CONFIG_MMU */
-
-#define flush_tlb_all() local_flush_tlb_all()
-#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
-
-static inline void flush_tlb_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-/* Flush a range of kernel pages */
-static inline void flush_tlb_kernel_range(unsigned long start,
-	unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-#define flush_tlb_mm(mm) flush_tlb_all()
-#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
-#endif /* !CONFIG_SMP || !CONFIG_MMU */
+#else /* CONFIG_MMU */
+#define local_flush_tlb_all()			do { } while (0)
+#endif /* CONFIG_MMU */
 
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 9c454f90fd3d..64f901674e35 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,15 +13,12 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pgtable.o
 obj-y += pmem.o
 
-ifeq ($(CONFIG_MMU),y)
-obj-$(CONFIG_SMP) += tlbflush.o
-endif
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_KASAN)   += kasan_init.o
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e6659d7368b3..22d7ed5abf8e 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -66,6 +66,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
 }
 
+#ifdef CONFIG_SMP
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
@@ -138,6 +139,18 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 	if (mm)
 		put_cpu();
 }
+#else
+static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
+			      unsigned long size, unsigned long stride)
+{
+	unsigned long asid = FLUSH_TLB_NO_ASID;
+
+	if (mm && static_branch_unlikely(&use_asid_allocator))
+		asid = atomic_long_read(&mm->context.id) & asid_mask;
+
+	local_flush_tlb_range_asid(start, size, stride, asid);
+}
+#endif
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
