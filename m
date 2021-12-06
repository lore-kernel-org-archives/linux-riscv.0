Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F227C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiOf9bmQcB973zN0C1zl967WCRxykQJCYTujvaRDdVM=; b=e90hmZ55o6oG5M
	nfCEfeoSBG1Wkl5hOUFmcqI6ESjxjZ6ToGiGdDWNkuVPR/OfanyR0HPvyDmQU0Ly8seApvS1Z7XSs
	RUpAQy45La7pRhHOi6cdgmZ+XTt3bYF4yhxDQo5sg2plw/PCs1YVurmNd7bp3iC2LfvG0kiXc3kWU
	nmmAjOUrnctlJkCvgYq0+MHBSeM0cduWTe7zXWHPiEzCbYgZOWYJLnTAj9sHMLv1EiThrA97Mun07
	e/yThFNcAqA3FkrIFhuQAj4ZStzSxGRr9QiRehaaOm6++JkK7bkVVIbhhIEfp1aoaPvUZdWnAT8Bo
	fqS//2Fx2peMcwAOlYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBYj-003PXQ-K2; Mon, 06 Dec 2021 10:49:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBYe-003PUt-Pi
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:49:24 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 92CA44003E
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638787759;
 bh=SRQqaE+eBxp32u4NFRGojAHgHUNJ3nLFCtcyJRkcDak=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ON5x4H32DL7iFfMDjKak37R5EvXV1OTCDssBUtuvypiFAAV2yxzuyzSy7cxLFv/F5
 8e/ckmzOpEOX0eblCL+x88PKWqBdOYZA05wS0mUPnsvvsZ7SM7ZP4tzlu8i99jwCVc
 Yjet7izjrpMpEDzRgqwoONKQgwukvnUrnnIPTpc/xOmA5P5a6YbCCT68XMVMO/eD8R
 vT0fruZUGUKSKBB4KPL6IKcTQeMIxNQljJGDXwOuNXU0YzzktXdTCzfdYyGlTqjUtx
 UGA2EFzEljoaIW33N2A80KCbR4Pf5RLWNr9SD2b88/aLIGJ5AfSJAZ3QL4yT0L5wRi
 IDGiMs7mkBkxQ==
Received: by mail-wr1-f72.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso1904721wrw.7
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRQqaE+eBxp32u4NFRGojAHgHUNJ3nLFCtcyJRkcDak=;
 b=31rfD4ho7s/HGPDf7MguDzZMOqrmbcn1p1tbR7LccG1j0Gk9GfRhcOzgZVs9kZHRw+
 KzQlFI96jnIhkunV2YhT9m2efmvRTl4y7W1BIS3yZlfNtmxovHf9k4msp1KVNmi4vwkQ
 JawaEHKSGq0YPwsg3x6xyQn2IJ3gl2rZCZL2poYV1YsvLRTX0EHZNRVI2OgdwC7x+bKQ
 XejAkmKf3BLR5YVbkFbalIAzI2RFWwlCAogqvhB6KSXY/qeuPem9grCM8HrzomUmVjJz
 OkajHmvkqOvo+mwCxWvMhZBPkFc/J+z7cx7tXUbckEjY5VRxYXWFfb+tmprgh8RPHhVW
 MoYA==
X-Gm-Message-State: AOAM530d0OXHAGEgtVtM3WzgWfXiFl5l2rDwpE/4okjHNrEfrFIMrX6V
 +3n91mc8vtTSzljRpXwm87OFgBB+L6ZGTC9kMakUJ5IGfkd+0/r69ycpVD2pocCDnCxxrhwhsLz
 Ieu7C/1ynyaRpK4XgrNl/ybq+cw5UR+TkfOxyy/2lioFgNw==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr40936999wrp.428.1638787759181; 
 Mon, 06 Dec 2021 02:49:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznPINTNi+CBmI6j3DvMVzbUi0EZHd70V319Ww/yUFGyrZPp9xplgSNEH+A7OmkTV1qLyNB6A==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr40936958wrp.428.1638787758943; 
 Mon, 06 Dec 2021 02:49:18 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id m21sm11197860wrb.2.2021.12.06.02.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:49:18 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 02/13] riscv: Split early kasan mapping to prepare sv48
 introduction
Date: Mon,  6 Dec 2021 11:46:46 +0100
Message-Id: <20211206104657.433304-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_024921_027336_7031D4BC 
X-CRM114-Status: GOOD (  22.96  )
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

Now that kasan shadow region is next to the kernel, for sv48, this
region won't be aligned on PGDIR_SIZE and then when populating this
region, we'll need to get down to lower levels of the page table. So
instead of reimplementing the page table walk for the early population,
take advantage of the existing functions used for the final population.

Note that kasan swapper initialization must also be split since memblock
is not initialized at this point and as the last PGD is shared with the
kernel, we'd need to allocate a PUD so postpone the kasan final
population after the kernel population is done.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/kasan.h |   1 +
 arch/riscv/mm/init.c           |   4 ++
 arch/riscv/mm/kasan_init.c     | 113 ++++++++++++++++++---------------
 3 files changed, 67 insertions(+), 51 deletions(-)

diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index 257a2495145a..2788e2c46609 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -34,6 +34,7 @@
 
 void kasan_init(void);
 asmlinkage void kasan_early_init(void);
+void kasan_swapper_init(void);
 
 #endif
 #endif
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4224e9d0ecf5..5010eba52738 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -742,6 +742,10 @@ static void __init setup_vm_final(void)
 	create_kernel_page_table(swapper_pg_dir, false);
 #endif
 
+#ifdef CONFIG_KASAN
+	kasan_swapper_init();
+#endif
+
 	/* Clear fixmap PTE and PMD mappings */
 	clear_fixmap(FIX_PTE);
 	clear_fixmap(FIX_PMD);
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 54294f83513d..1434a0225140 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -12,44 +12,6 @@
 #include <asm/pgalloc.h>
 
 extern pgd_t early_pg_dir[PTRS_PER_PGD];
-asmlinkage void __init kasan_early_init(void)
-{
-	uintptr_t i;
-	pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
-
-	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
-		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
-
-	for (i = 0; i < PTRS_PER_PTE; ++i)
-		set_pte(kasan_early_shadow_pte + i,
-			mk_pte(virt_to_page(kasan_early_shadow_page),
-			       PAGE_KERNEL));
-
-	for (i = 0; i < PTRS_PER_PMD; ++i)
-		set_pmd(kasan_early_shadow_pmd + i,
-			pfn_pmd(PFN_DOWN
-				(__pa((uintptr_t) kasan_early_shadow_pte)),
-				__pgprot(_PAGE_TABLE)));
-
-	for (i = KASAN_SHADOW_START; i < KASAN_SHADOW_END;
-	     i += PGDIR_SIZE, ++pgd)
-		set_pgd(pgd,
-			pfn_pgd(PFN_DOWN
-				(__pa(((uintptr_t) kasan_early_shadow_pmd))),
-				__pgprot(_PAGE_TABLE)));
-
-	/* init for swapper_pg_dir */
-	pgd = pgd_offset_k(KASAN_SHADOW_START);
-
-	for (i = KASAN_SHADOW_START; i < KASAN_SHADOW_END;
-	     i += PGDIR_SIZE, ++pgd)
-		set_pgd(pgd,
-			pfn_pgd(PFN_DOWN
-				(__pa(((uintptr_t) kasan_early_shadow_pmd))),
-				__pgprot(_PAGE_TABLE)));
-
-	local_flush_tlb_all();
-}
 
 static void __init kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
 {
@@ -108,26 +70,35 @@ static void __init kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned
 	set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_pmd)), PAGE_TABLE));
 }
 
-static void __init kasan_populate_pgd(unsigned long vaddr, unsigned long end)
+static void __init kasan_populate_pgd(pgd_t *pgdp,
+				      unsigned long vaddr, unsigned long end,
+				      bool early)
 {
 	phys_addr_t phys_addr;
-	pgd_t *pgdp = pgd_offset_k(vaddr);
 	unsigned long next;
 
 	do {
 		next = pgd_addr_end(vaddr, end);
 
-		/*
-		 * pgdp can't be none since kasan_early_init initialized all KASAN
-		 * shadow region with kasan_early_shadow_pmd: if this is stillthe case,
-		 * that means we can try to allocate a hugepage as a replacement.
-		 */
-		if (pgd_page_vaddr(*pgdp) == (unsigned long)lm_alias(kasan_early_shadow_pmd) &&
-		    IS_ALIGNED(vaddr, PGDIR_SIZE) && (next - vaddr) >= PGDIR_SIZE) {
-			phys_addr = memblock_phys_alloc(PGDIR_SIZE, PGDIR_SIZE);
-			if (phys_addr) {
-				set_pgd(pgdp, pfn_pgd(PFN_DOWN(phys_addr), PAGE_KERNEL));
+		if (IS_ALIGNED(vaddr, PGDIR_SIZE) && (next - vaddr) >= PGDIR_SIZE) {
+			if (early) {
+				phys_addr = __pa((uintptr_t)kasan_early_shadow_pgd_next);
+				set_pgd(pgdp, pfn_pgd(PFN_DOWN(phys_addr), PAGE_TABLE));
 				continue;
+			} else if (pgd_page_vaddr(*pgdp) ==
+				   (unsigned long)lm_alias(kasan_early_shadow_pgd_next)) {
+				/*
+				 * pgdp can't be none since kasan_early_init
+				 * initialized all KASAN shadow region with
+				 * kasan_early_shadow_pud: if this is still the
+				 * case, that means we can try to allocate a
+				 * hugepage as a replacement.
+				 */
+				phys_addr = memblock_phys_alloc(PGDIR_SIZE, PGDIR_SIZE);
+				if (phys_addr) {
+					set_pgd(pgdp, pfn_pgd(PFN_DOWN(phys_addr), PAGE_KERNEL));
+					continue;
+				}
 			}
 		}
 
@@ -135,12 +106,52 @@ static void __init kasan_populate_pgd(unsigned long vaddr, unsigned long end)
 	} while (pgdp++, vaddr = next, vaddr != end);
 }
 
+asmlinkage void __init kasan_early_init(void)
+{
+	uintptr_t i;
+
+	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
+		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+
+	for (i = 0; i < PTRS_PER_PTE; ++i)
+		set_pte(kasan_early_shadow_pte + i,
+			mk_pte(virt_to_page(kasan_early_shadow_page),
+			       PAGE_KERNEL));
+
+	for (i = 0; i < PTRS_PER_PMD; ++i)
+		set_pmd(kasan_early_shadow_pmd + i,
+			pfn_pmd(PFN_DOWN
+				(__pa((uintptr_t)kasan_early_shadow_pte)),
+				PAGE_TABLE));
+
+	if (pgtable_l4_enabled) {
+		for (i = 0; i < PTRS_PER_PUD; ++i)
+			set_pud(kasan_early_shadow_pud + i,
+				pfn_pud(PFN_DOWN
+					(__pa(((uintptr_t)kasan_early_shadow_pmd))),
+					PAGE_TABLE));
+	}
+
+	kasan_populate_pgd(early_pg_dir + pgd_index(KASAN_SHADOW_START),
+			   KASAN_SHADOW_START, KASAN_SHADOW_END, true);
+
+	local_flush_tlb_all();
+}
+
+void __init kasan_swapper_init(void)
+{
+	kasan_populate_pgd(pgd_offset_k(KASAN_SHADOW_START),
+			   KASAN_SHADOW_START, KASAN_SHADOW_END, true);
+
+	local_flush_tlb_all();
+}
+
 static void __init kasan_populate(void *start, void *end)
 {
 	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
 	unsigned long vend = PAGE_ALIGN((unsigned long)end);
 
-	kasan_populate_pgd(vaddr, vend);
+	kasan_populate_pgd(pgd_offset_k(vaddr), vaddr, vend, false);
 
 	local_flush_tlb_all();
 	memset(start, KASAN_SHADOW_INIT, end - start);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
