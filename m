Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5474BC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3Gsx2xAfN42BObcUVKQsacpvivb6HeU0mNIfhL1E4Q=; b=S+T0e5gDLvCxZ8
	R//8LSBPcWm9LPe7oEQC9wmmJIIWI8Sm1n+rOdZwRl9enULFXI29O9Y6pLJVZfRYDOVQ7EJpS3DeM
	+F06NkfH8kIOSpe+nMGeYb9rEClTmgFXGIgs/62sows9qJmwY1Pymu9gfnPldgSALEVuweOl7NJnp
	xwukCfFYH5DYm1N4oMJ0NKL/BRCV2ZbRYZJsr2PvINwAy0Ks81Y6g4mbBmZ1DyVfdnpAlg/1Q7tnN
	WjEd1NLIZhN/b6YndzmOYg8RKK3hIQAmwx56X9WWGzbl6JP2dh2Tn/ZAQCRal+wwmozCJPQrWHegX
	f2PVzbKXOqXpmSIODDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpje-0000000FaB9-0NCz;
	Thu, 29 Feb 2024 23:22:42 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjI-0000000FZvD-2zK3
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:22 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e4f5e84abeso1037892b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248939; x=1709853739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLB9vlYe9JfwQMhDb14nNgv57tMyr8X6yVrB4e0zcQU=;
        b=gGxmRQnJbnoM8OpNGlZ731YQ574YSJgcexqaLlm+wLnYrKRLQ8cbLSA8jVIjQZWhMY
         vMEECT6gHiLYt8zk+P10uZMRSTzeQByGBCvnJvgiBHgQLbIF5SgrMvHd0XPSrIp3ry/2
         oc634tihZOPDU5rW3ed0ZRXJoLa2+BGITMXZkLT5Lncxtpvjog9Fn9ZaCykpyUKRjlTj
         O5/LqN2sgB7N4apwjO/2KWX78RhT5Rd8QR2eHixktV8fQML9py+PnzQHzcIBEtteg3eO
         W8+qsaVmRIYBQ9TTVCyZcMDTrnEXv1+2sc2lUlTncMa9kTmxkaMhbc4p2NUmodkaRbMZ
         kQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248939; x=1709853739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLB9vlYe9JfwQMhDb14nNgv57tMyr8X6yVrB4e0zcQU=;
        b=viuDAHZdJM83Ogl5gSWs9Pm7LsG2RR1fTfLPLGjpNX/cUoPE2hE1k1af0R/N0nIJRy
         LpGhd+4v3/uaUCIMob1kJm8t0XL1nrqg7rhlyCVDDFeKQHMiBMKJPHAMbD+uMjhfeSpG
         EsH+rq3uY0z7/TI2uV/fBKqwOLITKeb07HJiaTldWkRt6VlnH9VWNz2webNRQBXzZIhk
         5WE4ROI/hgKl75hbjatspmkIT1gIlo0Jl5PC3Ua+3ABasAe8uLHKme8KDGkE3rQpOyBl
         4afXlGD2hMK3cQOhJLnVxjKlb++Y1h4yS80+W09M2W43FotLLwONiYR5pQMHsXfXK1Ue
         aaZA==
X-Forwarded-Encrypted: i=1; AJvYcCVsvXZTM9bNz0cs4G6KuUofTRvT7CeNu0Sz7jleSbr2Ym099wDN6M85mU68DukjTwqfRaXSSX7WrYsZBxnQbN0ReHvhBUoQHP2bwFe359fp
X-Gm-Message-State: AOJu0YwXWa2XL9irD8T6aiXMZCN+AuW8tWBLEpp3Vex6IFjQQjzcuINO
	v4tu4JHyJQwdUFbdi2EzP6Ab8vn0D/KeDGqGSebcyuWQJu+GJ8J+FLsprEQmhYg=
X-Google-Smtp-Source: AGHT+IFNMqThgNRh63sPPm1+a+RZC7oBqAsJKeQJ9ncYhwlwuRqR+WMAL4ZrZQk20TebpNdIS4mveg==
X-Received: by 2002:a05:6a00:2354:b0:6e5:80a4:2ff2 with SMTP id j20-20020a056a00235400b006e580a42ff2mr152068pfj.30.1709248939492;
        Thu, 29 Feb 2024 15:22:19 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:19 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 06/13] riscv: mm: Combine the SMP and UP TLB flush code
Date: Thu, 29 Feb 2024 15:21:47 -0800
Message-ID: <20240229232211.161961-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152220_876973_93947F93 
X-CRM114-Status: GOOD (  13.17  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

Changes in v4:
 - Merge the two copies of __flush_tlb_range() and rely on the compiler
   to optimize out the broadcast path (both clang and gcc do this)
 - Merge the two copies of flush_tlb_all() and rely on constant folding

Changes in v2:
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

 arch/riscv/Kconfig                |  2 +-
 arch/riscv/include/asm/tlbflush.h | 30 +++---------------------------
 arch/riscv/mm/Makefile            |  5 +----
 3 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0bfcfec67ed5..de9b6f2279ff 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -60,7 +60,7 @@ config RISCV
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
-	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if SMP && MMU
+	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 928f096dca21..4f86424b1ba5 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -27,12 +27,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
-#else /* CONFIG_MMU */
-#define local_flush_tlb_all()			do { } while (0)
-#define local_flush_tlb_page(addr)		do { } while (0)
-#endif /* CONFIG_MMU */
 
-#if defined(CONFIG_SMP) && defined(CONFIG_MMU)
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
@@ -54,27 +49,8 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       unsigned long uaddr);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
-
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
index 2c869f8026a8..cbe4d775ef56 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,14 +13,11 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pmem.o
 
-ifeq ($(CONFIG_MMU),y)
-obj-$(CONFIG_SMP) += tlbflush.o
-endif
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_KASAN)   += kasan_init.o
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
