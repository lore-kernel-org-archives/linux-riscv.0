Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E5C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 21:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpSTgLM3/3Zmilw6cYxlR65qd354Gh6RZrD2poGeA0M=; b=zLtbz9dB/bEgzn
	HipzIpDac68AJD8JncxpxitJzfr0xooE+VyIat8zqoeCov0B3x+Y3W88R2XIH3x+ct+GmcyTIaQR1
	J79VEdBWLz/uSFiQFRXupaTGwPirK5Id2fzdaaqu2vNe4oVC0Sb1I+t0DjJ22AZMUSxV+xbTybm79
	kFAIqC1OKpOQHMSIdwg6DLtfAoljvPOSRAXQYkGu3c4/iVmgXN7hdrsWrvLKMlbdy5I/W3lYntD0S
	chd2zSbSHyzQr1bbxMqOZ+6IBp0iyfdgSWx9FogJD757n2X2NSrsN5peQ1xWht4e82R5AqwY6epTs
	Lqwnm2RXlgtwr5KOVsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAQA-00Cpba-0P;
	Tue, 12 Dec 2023 21:36:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAQ6-00Cpag-2p
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 21:36:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso30669045e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 13:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702416961; x=1703021761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLS75Mo77acz6k4jx++nul4Z+bTVnVv2nm8SBcxb6zo=;
        b=DRyecMce4mulEErpBfr1W5ES37mANDCcJUFXrIDH0T6TRKTj7NVTnH5rV0gKjtRWph
         bfswd9AE675YIVHIvPk7aV6dJZW17cuhAxrU/dNrA/SdaORhDJL48ibWERtl7PZL+gr7
         3/D6F14KgP9231/LeZZIaI23I/KRfbM5EGyEJjBCGPq+7Z+2TxVElMYO2exDOT+H6xhN
         V4wXYNVu9XNdIWLRS0Qqb2cZmxtvOnK8GoG+Fd+zYs/rzIho/9JyLIx4zuuBDMD7UsQA
         qQoY/vntYtYR8CcDck8gunjTFxfQLOjqBuPjaxvqjI+X89v2trv1C8LfBNPFGjxDV1PZ
         YmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702416961; x=1703021761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLS75Mo77acz6k4jx++nul4Z+bTVnVv2nm8SBcxb6zo=;
        b=SXFwvtP//JD5Tm8IvhmZPczipBdG47N2XNHnaVStLIVPCNjNh9GYAM2eQbdZAAY5jA
         7sIuI//urU10RxND3AkLaJBo0OF/c/0cZvIMKnqwg75cW/lp8ofTCCwTOkmqygEluh6M
         kvAWu2vwsyLYt+/pTgaxSK+e0Csh/OmYx5Q5IWIXYaMv+BEjTQovyZtaP3qU1HTzIzQv
         RtaIm4Ewvs2Z7thHDuTXpfPqQQH4KHJwhHIiCCYcG/HjoBeOWtxhFq62Hy37Qw67ZjLI
         rI1SD8i2LlIdBC2HJ9DHwnmXZCEFZyr816F/ksUWIXqYeymKFBRfdiXEmRmsEgdUkKDc
         TNJA==
X-Gm-Message-State: AOJu0YwImdzXJFUpNti91k/EIDXz9A+dFqBE1yqIn0jvdM/ZZGESxFFL
	89D53m1iVjNMS4M9t/E9Pt5zHg==
X-Google-Smtp-Source: AGHT+IESLuoBQNsAkgxVuWPb1AKal27QjvlJbqXJPQE4veBnAzTcYr3uBF9MZ4rqSOkrlsCnVLUuRA==
X-Received: by 2002:a7b:c456:0:b0:40b:5e4a:2365 with SMTP id l22-20020a7bc456000000b0040b5e4a2365mr3632834wmi.103.1702416960633;
        Tue, 12 Dec 2023 13:36:00 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b00405d9a950a2sm19994483wmf.28.2023.12.12.13.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 13:36:00 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/2] mm: Introduce flush_cache_vmap_early()
Date: Tue, 12 Dec 2023 22:34:56 +0100
Message-Id: <20231212213457.132605-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212213457.132605-1-alexghiti@rivosinc.com>
References: <20231212213457.132605-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_133602_920451_44350BD2 
X-CRM114-Status: GOOD (  18.17  )
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

The pcpu setup when using the page allocator sets up a new vmalloc
mapping very early in the boot process, so early that it cannot use the
flush_cache_vmap() function which may depend on structures not yet
initialized (for example in riscv, we currently send an IPI to flush
other cpus TLB).

But on some architectures, we must call flush_cache_vmap(): for example,
in riscv, some uarchs can cache invalid TLB entries so we need to flush
the new established mapping to avoid taking an exception.

So fix this by introducing a new function flush_cache_vmap_early() which
is called right after setting the new page table entry and before
accessing this new mapping. This new function implements a local flush
tlb on riscv and is no-op for other architectures (same as today).

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arc/include/asm/cacheflush.h      | 1 +
 arch/arm/include/asm/cacheflush.h      | 2 ++
 arch/csky/abiv1/inc/abi/cacheflush.h   | 1 +
 arch/csky/abiv2/inc/abi/cacheflush.h   | 1 +
 arch/m68k/include/asm/cacheflush_mm.h  | 1 +
 arch/mips/include/asm/cacheflush.h     | 2 ++
 arch/nios2/include/asm/cacheflush.h    | 1 +
 arch/parisc/include/asm/cacheflush.h   | 1 +
 arch/riscv/include/asm/cacheflush.h    | 3 ++-
 arch/riscv/include/asm/tlbflush.h      | 1 +
 arch/riscv/mm/tlbflush.c               | 5 +++++
 arch/sh/include/asm/cacheflush.h       | 1 +
 arch/sparc/include/asm/cacheflush_32.h | 1 +
 arch/sparc/include/asm/cacheflush_64.h | 1 +
 arch/xtensa/include/asm/cacheflush.h   | 6 ++++--
 include/asm-generic/cacheflush.h       | 6 ++++++
 mm/percpu.c                            | 8 +-------
 17 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
index bd5b1a9a0544..6fc74500a9f5 100644
--- a/arch/arc/include/asm/cacheflush.h
+++ b/arch/arc/include/asm/cacheflush.h
@@ -40,6 +40,7 @@ void dma_cache_wback(phys_addr_t start, unsigned long sz);
 
 /* TBD: optimize this */
 #define flush_cache_vmap(start, end)		flush_cache_all()
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		flush_cache_all()
 
 #define flush_cache_dup_mm(mm)			/* called on fork (VIVT only) */
diff --git a/arch/arm/include/asm/cacheflush.h b/arch/arm/include/asm/cacheflush.h
index f6181f69577f..1075534b0a2e 100644
--- a/arch/arm/include/asm/cacheflush.h
+++ b/arch/arm/include/asm/cacheflush.h
@@ -340,6 +340,8 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 		dsb(ishst);
 }
 
+#define flush_cache_vmap_early(start, end)	do { } while (0)
+
 static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
 {
 	if (!cache_is_vipt_nonaliasing())
diff --git a/arch/csky/abiv1/inc/abi/cacheflush.h b/arch/csky/abiv1/inc/abi/cacheflush.h
index 908d8b0bc4fd..d011a81575d2 100644
--- a/arch/csky/abiv1/inc/abi/cacheflush.h
+++ b/arch/csky/abiv1/inc/abi/cacheflush.h
@@ -43,6 +43,7 @@ static inline void flush_anon_page(struct vm_area_struct *vma,
  */
 extern void flush_cache_range(struct vm_area_struct *vma, unsigned long start, unsigned long end);
 #define flush_cache_vmap(start, end)		cache_wbinv_all()
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		cache_wbinv_all()
 
 #define flush_icache_range(start, end)		cache_wbinv_range(start, end)
diff --git a/arch/csky/abiv2/inc/abi/cacheflush.h b/arch/csky/abiv2/inc/abi/cacheflush.h
index 40be16907267..6513ac5d2578 100644
--- a/arch/csky/abiv2/inc/abi/cacheflush.h
+++ b/arch/csky/abiv2/inc/abi/cacheflush.h
@@ -41,6 +41,7 @@ void flush_icache_mm_range(struct mm_struct *mm,
 void flush_icache_deferred(struct mm_struct *mm);
 
 #define flush_cache_vmap(start, end)		do { } while (0)
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		do { } while (0)
 
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
diff --git a/arch/m68k/include/asm/cacheflush_mm.h b/arch/m68k/include/asm/cacheflush_mm.h
index ed12358c4783..9a71b0148461 100644
--- a/arch/m68k/include/asm/cacheflush_mm.h
+++ b/arch/m68k/include/asm/cacheflush_mm.h
@@ -191,6 +191,7 @@ extern void cache_push_v(unsigned long vaddr, int len);
 #define flush_cache_all() __flush_cache_all()
 
 #define flush_cache_vmap(start, end)		flush_cache_all()
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		flush_cache_all()
 
 static inline void flush_cache_mm(struct mm_struct *mm)
diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
index f36c2519ed97..1f14132b3fc9 100644
--- a/arch/mips/include/asm/cacheflush.h
+++ b/arch/mips/include/asm/cacheflush.h
@@ -97,6 +97,8 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 		__flush_cache_vmap();
 }
 
+#define flush_cache_vmap_early(start, end)     do { } while (0)
+
 extern void (*__flush_cache_vunmap)(void);
 
 static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
diff --git a/arch/nios2/include/asm/cacheflush.h b/arch/nios2/include/asm/cacheflush.h
index 348cea097792..81484a776b33 100644
--- a/arch/nios2/include/asm/cacheflush.h
+++ b/arch/nios2/include/asm/cacheflush.h
@@ -38,6 +38,7 @@ void flush_icache_pages(struct vm_area_struct *vma, struct page *page,
 #define flush_icache_pages flush_icache_pages
 
 #define flush_cache_vmap(start, end)		flush_dcache_range(start, end)
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		flush_dcache_range(start, end)
 
 extern void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index b4006f2a9705..ba4c05bc24d6 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -41,6 +41,7 @@ void flush_kernel_vmap_range(void *vaddr, int size);
 void invalidate_kernel_vmap_range(void *vaddr, int size);
 
 #define flush_cache_vmap(start, end)		flush_cache_all()
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		flush_cache_all()
 
 void flush_dcache_folio(struct folio *folio);
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 3cb53c4df27c..a129dac4521d 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -37,7 +37,8 @@ static inline void flush_dcache_page(struct page *page)
 	flush_icache_mm(vma->vm_mm, 0)
 
 #ifdef CONFIG_64BIT
-#define flush_cache_vmap(start, end)	flush_tlb_kernel_range(start, end)
+#define flush_cache_vmap(start, end)		flush_tlb_kernel_range(start, end)
+#define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
 #endif
 
 #ifndef CONFIG_SMP
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8f3418c5f172..a60416bbe190 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -41,6 +41,7 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end);
 void flush_tlb_kernel_range(unsigned long start, unsigned long end);
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e6659d7368b3..8aadc5f71c93 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -66,6 +66,11 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
 }
 
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	local_flush_tlb_range_asid(start, end, PAGE_SIZE, FLUSH_TLB_NO_ASID);
+}
+
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
diff --git a/arch/sh/include/asm/cacheflush.h b/arch/sh/include/asm/cacheflush.h
index 878b6b551bd2..51112f54552b 100644
--- a/arch/sh/include/asm/cacheflush.h
+++ b/arch/sh/include/asm/cacheflush.h
@@ -90,6 +90,7 @@ extern void copy_from_user_page(struct vm_area_struct *vma,
 	unsigned long len);
 
 #define flush_cache_vmap(start, end)		local_flush_cache_all(NULL)
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		local_flush_cache_all(NULL)
 
 #define flush_dcache_mmap_lock(mapping)		do { } while (0)
diff --git a/arch/sparc/include/asm/cacheflush_32.h b/arch/sparc/include/asm/cacheflush_32.h
index f3b7270bf71b..9fee0ccfccb8 100644
--- a/arch/sparc/include/asm/cacheflush_32.h
+++ b/arch/sparc/include/asm/cacheflush_32.h
@@ -48,6 +48,7 @@ static inline void flush_dcache_page(struct page *page)
 #define flush_dcache_mmap_unlock(mapping)	do { } while (0)
 
 #define flush_cache_vmap(start, end)		flush_cache_all()
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		flush_cache_all()
 
 /* When a context switch happens we must flush all user windows so that
diff --git a/arch/sparc/include/asm/cacheflush_64.h b/arch/sparc/include/asm/cacheflush_64.h
index 0e879004efff..2b1261b77ecd 100644
--- a/arch/sparc/include/asm/cacheflush_64.h
+++ b/arch/sparc/include/asm/cacheflush_64.h
@@ -75,6 +75,7 @@ void flush_ptrace_access(struct vm_area_struct *, struct page *,
 #define flush_dcache_mmap_unlock(mapping)	do { } while (0)
 
 #define flush_cache_vmap(start, end)		do { } while (0)
+#define flush_cache_vmap_early(start, end)	do { } while (0)
 #define flush_cache_vunmap(start, end)		do { } while (0)
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/xtensa/include/asm/cacheflush.h b/arch/xtensa/include/asm/cacheflush.h
index 785a00ce83c1..38bcecb0e457 100644
--- a/arch/xtensa/include/asm/cacheflush.h
+++ b/arch/xtensa/include/asm/cacheflush.h
@@ -116,8 +116,9 @@ void flush_cache_page(struct vm_area_struct*,
 #define flush_cache_mm(mm)		flush_cache_all()
 #define flush_cache_dup_mm(mm)		flush_cache_mm(mm)
 
-#define flush_cache_vmap(start,end)	flush_cache_all()
-#define flush_cache_vunmap(start,end)	flush_cache_all()
+#define flush_cache_vmap(start,end)		flush_cache_all()
+#define flush_cache_vmap_early(start,end)	do { } while (0)
+#define flush_cache_vunmap(start,end)		flush_cache_all()
 
 void flush_dcache_folio(struct folio *folio);
 #define flush_dcache_folio flush_dcache_folio
@@ -140,6 +141,7 @@ void local_flush_cache_page(struct vm_area_struct *vma,
 #define flush_cache_dup_mm(mm)				do { } while (0)
 
 #define flush_cache_vmap(start,end)			do { } while (0)
+#define flush_cache_vmap_early(start,end)		do { } while (0)
 #define flush_cache_vunmap(start,end)			do { } while (0)
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
diff --git a/include/asm-generic/cacheflush.h b/include/asm-generic/cacheflush.h
index 84ec53ccc450..7ee8a179d103 100644
--- a/include/asm-generic/cacheflush.h
+++ b/include/asm-generic/cacheflush.h
@@ -91,6 +91,12 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 }
 #endif
 
+#ifndef flush_cache_vmap_early
+static inline void flush_cache_vmap_early(unsigned long start, unsigned long end)
+{
+}
+#endif
+
 #ifndef flush_cache_vunmap
 static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
 {
diff --git a/mm/percpu.c b/mm/percpu.c
index 7b97d31df767..4e11fc1e6def 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3333,13 +3333,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 		if (rc < 0)
 			panic("failed to map percpu area, err=%d\n", rc);
 
-		/*
-		 * FIXME: Archs with virtual cache should flush local
-		 * cache for the linear mapping here - something
-		 * equivalent to flush_cache_vmap() on the local cpu.
-		 * flush_cache_vmap() can't be used as most supporting
-		 * data structures are not set up yet.
-		 */
+		flush_cache_vmap_early(unit_addr, unit_addr + ai->unit_size);
 
 		/* copy static data */
 		memcpy((void *)unit_addr, __per_cpu_load, ai->static_size);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
