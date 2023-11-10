Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D45C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLpQtCn7WDMSqBMFLxWPdQTuD8XB4Zcnl+8RtrRSDh8=; b=EiUN6YIn9uNH3f
	Xk3L+C25+iPYie+LJApsT5Rf/7RGtzRQTxjeIRnvPGkcUIJBxWsnPdlkqqI27gvEa8qQep9Egy+IA
	ptwCLmXTWd2JFRkiuy/9GX+803VIUxnBPWiy4KCfpTrZGQG4E5hD4AubK6m1HcsLQ/Yo6CfpvJiiI
	M94X6FMPlEbbkOrCLsKedi6/ihoFFOUcWpbZxdKxvvwy8rgeu5jix9KcPH1Q5tuXtc/HJ5uawoSob
	r33My4EuIjfk/K6hrz9JJfdWiD1ObcbuJRnldv/Si+d3xUBJfgFsi5S7Wi4B+hLctv0tTaKh27ugh
	VQyRQ6i95TtR9TwsgIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SBT-008tgl-09;
	Fri, 10 Nov 2023 14:08:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SBP-008tfp-2t
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 14:08:29 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50970c2115eso2768163e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699625304; x=1700230104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AMKJOgOBU+36iIxGMD9Trqw8IVdjZaTyhAA3F26Egw=;
        b=mPUc8i/tViO9SOL4X3xmKRuoEENxH04WAr08fTCikATCChm+f8ydfeoqwTFDmGuyRz
         xdr1ABdspHUXQVi0AuQBpRh2w+LXC6MeE+p6a+UdStcO9fi5zvtbTbjgEBZzFbyEYdWm
         yN7H/Aa6S9UUcK09VOTeM0zDJ+GuNf8lwtYlqvBrF76dQyZGHGuZEQ72ckeO+WrL0Yee
         bIao2ygQJKjT7s3A0QYwzv3RaDvOdeNvSt1ZhMqSvVYmTYD4kTtOAcugfPLLCA1juhMr
         rwnAcvS6jXCz66NOuDEKB/9ZOfHj8S2HLwvC8inHC7DmlrSUPiEqMAthdCiriDxDYfis
         VZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699625304; x=1700230104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AMKJOgOBU+36iIxGMD9Trqw8IVdjZaTyhAA3F26Egw=;
        b=OYqftgsTyGI1WyMtqh4coLmjBN5Uz8/k5n+zl/FlRu+4PQe8L+JEXZvNbPSqOkqXVd
         CTLxH8mOp9WCKgiz4WyRhK4KOQmZpwitA7q0O1MRVfrGiCDu9/+tQ8H9emYBplnt5AtA
         bn221P330lRmpnv0/BRiZ789okXsoLJU8TSp6mfUJzcA5hP9se0oI6cFASMVC4dMQHvC
         HDVHi8y2m5mhWljH3NdlvVrP6nSyY3tsVhuok6CaMG39MWdTHNCgeGxP4uII8NuVCffI
         OXJiHACJ4UW/jVXF0/ZhwW/sojMEKSPlcTnGm0dPMLi/3hNGMQ5+oXElX98CVJJGtqAi
         4lNA==
X-Gm-Message-State: AOJu0Yw9oVpkOJN+VuFCBlr0PYs3xdlpX+E0Kro6DBLRnOCHfceZwMHi
	p4hhgjozk24M73ePFiR3nqAG6w==
X-Google-Smtp-Source: AGHT+IEGn96XLIR0ZFAsjYB2eJfL/m69l1crDYV4Ee9Qc9cnFj8KCnXUpx20enm/StvHsssXdR1xaw==
X-Received: by 2002:ac2:5209:0:b0:503:1783:d5a9 with SMTP id a9-20020ac25209000000b005031783d5a9mr3895555lfl.3.1699625304483;
        Fri, 10 Nov 2023 06:08:24 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c451200b004076f522058sm5366438wmo.0.2023.11.10.06.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 06:08:24 -0800 (PST)
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
Subject: [PATCH 1/2] mm: Introduce flush_cache_vmap_early() and its riscv implementation
Date: Fri, 10 Nov 2023 15:07:20 +0100
Message-Id: <20231110140721.114235-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110140721.114235-1-alexghiti@rivosinc.com>
References: <20231110140721.114235-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_060827_934110_745A77E2 
X-CRM114-Status: GOOD (  16.64  )
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
 arch/riscv/include/asm/cacheflush.h | 3 ++-
 arch/riscv/include/asm/tlbflush.h   | 2 ++
 arch/riscv/mm/tlbflush.c            | 5 +++++
 include/asm-generic/cacheflush.h    | 6 ++++++
 mm/percpu.c                         | 8 +-------
 5 files changed, 16 insertions(+), 8 deletions(-)

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
index 8f3418c5f172..f0d6328076b6 100644
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
@@ -64,6 +65,7 @@ static inline void flush_tlb_kernel_range(unsigned long start,
 	local_flush_tlb_all();
 }
 
+#define local_flush_tlb_kernel_range(start, end) flush_tlb_kernel_range(start, end)
 #define flush_tlb_mm(mm) flush_tlb_all()
 #define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
 #endif /* !CONFIG_SMP || !CONFIG_MMU */
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
index a7665de8485f..d287cebd58ca 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3306,13 +3306,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
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
