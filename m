Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A0B606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xu2MYj9A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jY9Bgmbj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7W08t1UbdwTh0y4QWim0EDV+HiG8RIHYnKFx9tyjpy4=; b=Xu2MYj9AbAIqy3nArimpnktq4E
	ZMjGjNj6eGEyDdm2jWda8slw0VrEw+UeEOsN3Bp+LD4Cu8QBaIwtd5KbIFleS+d1bcmwTsWzz0Mnj
	WL2Hs7cMLlL0h9Isbpk8sc5KdSPKx85KehxtPdPWkGo3zLKGrwUrZHwERKKM4Vralbv7yHM4xJg/u
	K6gw6mxRNV2UJLOiCGdqvUMM7ihEJs/dZNkuysNS7qe3ebikVFywfyGTYvgNGh5WdAFM+iYzDP59b
	R1AoDl2uoZlAKNsxESgkkkZ7+qHS8ELbE6S4EvHingfHuYtYWm7+8WeL8KJlCt3EecDYnIwqJUT3R
	SFyhyhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXUH-0000000CsrA-1I0J;
	Thu, 26 Nov 2026 11:18:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXTr-0000000CsR6-2yRj;
	Thu, 26 Nov 2026 11:17:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21C35632DF;
	Thu, 26 Nov 2026 11:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2023B1F000F0;
	Thu, 26 Nov 2026 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691854;
	bh=tsZcDHYJK5xQY1AZ6rNSzamubDQEkyzDUEGfJqOoyt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jY9BgmbjdSzqYPZEwVVx32U1Z2rmyJJCSMz+8zDM0PBz+OWSgUouHUuJgRACl0qyR
	 dKFSM989UO42fUy299LgLYe4ZWDc9NDXzbanLVA3/4a1XbOSqHRV3ovGAjeXfOi7MS
	 VLr+BrE/W8gtmMHEWNmDjN7+slO5G7HabusamgO4h4+waLLwerJl2DZniVI4nnZ1/D
	 mSwP0wHTvXaFm5yG0hbEYa5SWa/HQ5qDwZjbsET2gU41xUd7YoP+sEDT9M8jvAElYo
	 x/YUx9knewGg4miRfuZkKFpo1KY6dRalA7cZV1Dt9XpvQARgcGAOiQJ/1ON6124rFM
	 NLAZqvJgCAm2g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:32 +0200
Subject: [PATCH RFC v2 19/54] x86/mm/pat: use enum pgtable_level in CPA
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-19-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The core of CPA is going to become generic. Generic code cannot use the x86
enum pg_level to denote the page table levels.

Switch CPA, its statistics and the direct map counters to enum
pgtable_level, and add a CPA private lookup that returns it.

Add pgtable_level_size() and pgtable_level_mask() helpers so that x86 could
use them instead of page_level_size() and page_level_mask() to determine
the size of the range that a level maps.

Add PGTABLE_LEVEL_NUM to replace PG_LEVEL_NUM in the declaration of the
array of the direct map counters.

lookup_address_in_pgd() stays unchanged because it has users outside of CPA
that expect enum pg_level.

The new lookup duplicates it for now. It will move to the generic code
together with the rest of core CPA logic.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/init_32.c        |  4 +-
 arch/x86/mm/init_64.c        | 14 +++----
 arch/x86/mm/pat/set_memory.c | 98 +++++++++++++++++++++++++++++++-------------
 include/linux/pgtable.h      | 26 ++++++++++++
 4 files changed, 104 insertions(+), 38 deletions(-)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 8323c1f599f2..1895a71316c2 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -367,8 +367,8 @@ kernel_physical_mapping_init(unsigned long start,
 		 * update direct mapping page count only in the first
 		 * iteration.
 		 */
-		update_page_count(PG_LEVEL_2M, pages_2m);
-		update_page_count(PG_LEVEL_4K, pages_4k);
+		update_page_count(PGTABLE_LEVEL_PMD, pages_2m);
+		update_page_count(PGTABLE_LEVEL_PTE, pages_4k);
 
 		/*
 		 * local global flush tlb, which will flush the previous
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a68998f359bf..7587b8ef88bb 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -508,7 +508,7 @@ phys_pte_init(pte_t *pte_page, unsigned long paddr, unsigned long paddr_end,
 		paddr_last = (paddr & PAGE_MASK) + PAGE_SIZE;
 	}
 
-	update_page_count(PG_LEVEL_4K, pages);
+	update_page_count(PGTABLE_LEVEL_PTE, pages);
 
 	return paddr_last;
 }
@@ -592,7 +592,7 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 		pmd_populate_kernel_init(&init_mm, pmd, pte, init);
 		spin_unlock(&init_mm.page_table_lock);
 	}
-	update_page_count(PG_LEVEL_2M, pages);
+	update_page_count(PGTABLE_LEVEL_PMD, pages);
 	return paddr_last;
 }
 
@@ -680,7 +680,7 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		spin_unlock(&init_mm.page_table_lock);
 	}
 
-	update_page_count(PG_LEVEL_1G, pages);
+	update_page_count(PGTABLE_LEVEL_PUD, pages);
 
 	return paddr_last;
 }
@@ -1116,7 +1116,7 @@ remove_pte_table(pte_t *pte_start, unsigned long addr, unsigned long end,
 	/* Call free_pte_table() in remove_pmd_table(). */
 	flush_tlb_all();
 	if (direct)
-		update_page_count(PG_LEVEL_4K, -pages);
+		update_page_count(PGTABLE_LEVEL_PTE, -pages);
 }
 
 static void __meminit
@@ -1162,7 +1162,7 @@ remove_pmd_table(pmd_t *pmd_start, unsigned long addr, unsigned long end,
 
 	/* Call free_pmd_table() in remove_pud_table(). */
 	if (direct)
-		update_page_count(PG_LEVEL_2M, -pages);
+		update_page_count(PGTABLE_LEVEL_PMD, -pages);
 }
 
 static void __meminit
@@ -1196,7 +1196,7 @@ remove_pud_table(pud_t *pud_start, unsigned long addr, unsigned long end,
 	}
 
 	if (direct)
-		update_page_count(PG_LEVEL_1G, -pages);
+		update_page_count(PGTABLE_LEVEL_PUD, -pages);
 }
 
 static void __meminit
@@ -1228,7 +1228,7 @@ remove_p4d_table(p4d_t *p4d_start, unsigned long addr, unsigned long end,
 	}
 
 	if (direct)
-		update_page_count(PG_LEVEL_512G, -pages);
+		update_page_count(PGTABLE_LEVEL_P4D, -pages);
 }
 
 /* start and end are both virtual address. */
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 068ab1e2bbc8..36f5031f1a0e 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -82,7 +82,7 @@ static inline pgprot_t cachemode2pgprot(enum page_cache_mode pcm)
 }
 
 #ifdef CONFIG_PROC_FS
-static atomic_long_t direct_pages_count[PG_LEVEL_NUM];
+static atomic_long_t direct_pages_count[PGTABLE_LEVEL_NUM];
 
 void update_page_count(int level, unsigned long pages)
 {
@@ -95,9 +95,9 @@ static void split_page_count(int level)
 		return;
 
 	if (system_state == SYSTEM_RUNNING) {
-		if (level == PG_LEVEL_2M)
+		if (level == PGTABLE_LEVEL_PMD)
 			count_vm_event(DIRECT_MAP_LEVEL2_SPLIT);
-		else if (level == PG_LEVEL_1G)
+		else if (level == PGTABLE_LEVEL_PUD)
 			count_vm_event(DIRECT_MAP_LEVEL3_SPLIT);
 	}
 	atomic_long_add(PTRS_PER_PTE, &direct_pages_count[level - 1]);
@@ -107,9 +107,9 @@ static void collapse_page_count(int level)
 {
 	atomic_long_inc(&direct_pages_count[level]);
 	if (system_state == SYSTEM_RUNNING) {
-		if (level == PG_LEVEL_2M)
+		if (level == PGTABLE_LEVEL_PMD)
 			count_vm_event(DIRECT_MAP_LEVEL2_COLLAPSE);
-		else if (level == PG_LEVEL_1G)
+		else if (level == PGTABLE_LEVEL_PUD)
 			count_vm_event(DIRECT_MAP_LEVEL3_COLLAPSE);
 	}
 	atomic_long_sub(PTRS_PER_PTE, &direct_pages_count[level - 1]);
@@ -123,17 +123,17 @@ static unsigned long direct_pages(int level)
 void arch_report_meminfo(struct seq_file *m)
 {
 	seq_printf(m, "DirectMap4k:    %8lu kB\n",
-		   direct_pages(PG_LEVEL_4K) << 2);
+		   direct_pages(PGTABLE_LEVEL_PTE) << 2);
 #if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
 	seq_printf(m, "DirectMap2M:    %8lu kB\n",
-		   direct_pages(PG_LEVEL_2M) << 11);
+		   direct_pages(PGTABLE_LEVEL_PMD) << 11);
 #else
 	seq_printf(m, "DirectMap4M:    %8lu kB\n",
-		   direct_pages(PG_LEVEL_2M) << 12);
+		   direct_pages(PGTABLE_LEVEL_PMD) << 12);
 #endif
 	if (direct_gbpages)
 		seq_printf(m, "DirectMap1G:    %8lu kB\n",
-			   direct_pages(PG_LEVEL_1G) << 20);
+			   direct_pages(PGTABLE_LEVEL_PUD) << 20);
 }
 #else
 static inline void split_page_count(int level) { }
@@ -167,7 +167,7 @@ static inline void cpa_inc_4k_install(void)
 
 static inline void cpa_inc_lp_sameprot(int level)
 {
-	if (level == PG_LEVEL_1G)
+	if (level == PGTABLE_LEVEL_PUD)
 		cpa_1g_sameprot++;
 	else
 		cpa_2m_sameprot++;
@@ -175,7 +175,7 @@ static inline void cpa_inc_lp_sameprot(int level)
 
 static inline void cpa_inc_lp_preserved(int level)
 {
-	if (level == PG_LEVEL_1G)
+	if (level == PGTABLE_LEVEL_PUD)
 		cpa_1g_preserved++;
 	else
 		cpa_2m_preserved++;
@@ -839,12 +839,51 @@ pte_t *lookup_address(unsigned long address, unsigned int *level)
 }
 EXPORT_SYMBOL_GPL(lookup_address);
 
+static pte_t *cpa_lookup_in_pgd(pgd_t *pgdp, unsigned long address,
+				enum pgtable_level *level)
+{
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
+
+	*level = PGTABLE_LEVEL_PGD;
+	if (pgd_none(*pgdp))
+		return NULL;
+
+	*level = PGTABLE_LEVEL_P4D;
+	p4dp = p4d_offset(pgdp, address);
+	p4d = p4dp_get(p4dp);
+	if (p4d_none(p4d))
+		return NULL;
+	if (p4d_leaf(p4d) || !p4d_present(p4d))
+		return (pte_t *)p4dp;
+
+	*level = PGTABLE_LEVEL_PUD;
+	pudp = pud_offset(p4dp, address);
+	pud = pudp_get(pudp);
+	if (pud_none(pud))
+		return NULL;
+	if (pud_leaf(pud) || !pud_present(pud))
+		return (pte_t *)pudp;
+
+	*level = PGTABLE_LEVEL_PMD;
+	pmdp = pmd_offset(pudp, address);
+	pmd = pmdp_get(pmdp);
+	if (pmd_none(pmd))
+		return NULL;
+	if (pmd_leaf(pmd) || !pmd_present(pmd))
+		return (pte_t *)pmdp;
+
+	*level = PGTABLE_LEVEL_PTE;
+	return pte_offset_kernel(pmdp, address);
+}
+
 static pte_t *_lookup_address_cpa(struct cpa_data *cpa, unsigned long address,
-				  unsigned int *level)
+				  enum pgtable_level *level)
 {
 	pgd_t *pgd = cpa_pgd(cpa, address);
 
-	return lookup_address_in_pgd(pgd, address, level);
+	return cpa_lookup_in_pgd(pgd, address, level);
 }
 
 /*
@@ -974,11 +1013,11 @@ static pgprot_t pgprot_clear_protnone_bits(pgprot_t prot)
  * in the 4K and large page formats, and _PAGE_PSE is only valid for present
  * large pages.
  */
-static pte_t cpa_pte(enum pg_level level, unsigned long pfn, pgprot_t prot)
+static pte_t cpa_pte(enum pgtable_level level, unsigned long pfn, pgprot_t prot)
 {
 	prot = pgprot_clear_protnone_bits(prot);
 
-	if (level != PG_LEVEL_4K) {
+	if (level != PGTABLE_LEVEL_PTE) {
 		prot = pgprot_4k_2_large(prot);
 		if (pgprot_val(prot) & _PAGE_PRESENT)
 			pgprot_val(prot) |= _PAGE_PSE;
@@ -988,7 +1027,8 @@ static pte_t cpa_pte(enum pg_level level, unsigned long pfn, pgprot_t prot)
 }
 
 static int should_split_large_page(pte_t *kpte, unsigned long address,
-				   enum pg_level level, struct cpa_data *cpa)
+				   enum pgtable_level level,
+				   struct cpa_data *cpa)
 {
 	unsigned long numpages, pmask, psize, lpaddr, pfn, old_pfn;
 	pgprot_t old_prot, new_prot, req_prot;
@@ -998,12 +1038,12 @@ static int should_split_large_page(pte_t *kpte, unsigned long address,
 		return 1;
 
 	switch (level) {
-	case PG_LEVEL_2M:
+	case PGTABLE_LEVEL_PMD:
 		old_prot = pmd_pgprot(*(pmd_t *)kpte);
 		old_pfn = pmd_pfn(*(pmd_t *)kpte);
 		cpa_inc_2m_checked();
 		break;
-	case PG_LEVEL_1G:
+	case PGTABLE_LEVEL_PUD:
 		old_prot = pud_pgprot(*(pud_t *)kpte);
 		old_pfn = pud_pfn(*(pud_t *)kpte);
 		cpa_inc_1g_checked();
@@ -1012,8 +1052,8 @@ static int should_split_large_page(pte_t *kpte, unsigned long address,
 		return -EINVAL;
 	}
 
-	psize = page_level_size(level);
-	pmask = page_level_mask(level);
+	psize = pgtable_level_size(level);
+	pmask = pgtable_level_mask(level);
 
 	/*
 	 * Calculate the number of pages, which fit into this large
@@ -1099,7 +1139,7 @@ static int should_split_large_page(pte_t *kpte, unsigned long address,
 
 static int
 __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
-		   unsigned int level, pte_t *pbase)
+		   enum pgtable_level level, pte_t *pbase)
 {
 	unsigned long ref_pfn, pfn, pfninc = 1;
 	struct page *base = virt_to_page(pbase);
@@ -1109,7 +1149,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 	paravirt_alloc_pte(&init_mm, page_to_pfn(base));
 
 	switch (level) {
-	case PG_LEVEL_2M:
+	case PGTABLE_LEVEL_PMD:
 		ref_prot = pmd_pgprot(*(pmd_t *)kpte);
 		/*
 		 * Clear PSE (aka _PAGE_PAT) and move
@@ -1119,7 +1159,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 		ref_pfn = pmd_pfn(*(pmd_t *)kpte);
 		break;
 
-	case PG_LEVEL_1G:
+	case PGTABLE_LEVEL_PUD:
 		ref_prot = pud_pgprot(*(pud_t *)kpte);
 		ref_pfn = pud_pfn(*(pud_t *)kpte);
 		pfninc = PMD_SIZE >> PAGE_SHIFT;
@@ -1176,7 +1216,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 			    unsigned long address)
 {
-	unsigned int level;
+	enum pgtable_level level;
 	pte_t *pte;
 	int ret = 0;
 
@@ -1272,7 +1312,7 @@ static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
 
 	if (within(addr, PAGE_OFFSET,
 		   PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT)))
-		collapse_page_count(PG_LEVEL_2M);
+		collapse_page_count(PGTABLE_LEVEL_PMD);
 
 	return 1;
 }
@@ -1320,7 +1360,7 @@ static int collapse_pud_page(pud_t *pud, unsigned long addr,
 
 	if (within(addr, PAGE_OFFSET,
 		   PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT)))
-		collapse_page_count(PG_LEVEL_1G);
+		collapse_page_count(PGTABLE_LEVEL_PUD);
 
 	return 1;
 }
@@ -1802,10 +1842,10 @@ static int __cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr)
 
 static int __change_page_attr(struct cpa_data *cpa)
 {
+	enum pgtable_level level;
 	unsigned long address;
-	int do_split, err;
-	unsigned int level;
 	pte_t *kpte, old_pte;
+	int do_split, err;
 
 	address = __cpa_addr(cpa, cpa->curpage);
 repeat:
@@ -1817,7 +1857,7 @@ static int __change_page_attr(struct cpa_data *cpa)
 	if (pte_none(old_pte))
 		return __cpa_process_fault(cpa, address);
 
-	if (level == PG_LEVEL_4K) {
+	if (level == PGTABLE_LEVEL_PTE) {
 		pte_t new_pte;
 		pgprot_t old_prot = pte_pgprot(old_pte);
 		pgprot_t new_prot = pte_pgprot(old_pte);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..1f33e34a059f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2294,6 +2294,7 @@ enum pgtable_level {
 	PGTABLE_LEVEL_P4D,
 	PGTABLE_LEVEL_PGD,
 };
+#define PGTABLE_LEVEL_NUM	(PGTABLE_LEVEL_PGD + 1)
 
 static inline const char *pgtable_level_to_str(enum pgtable_level level)
 {
@@ -2313,6 +2314,31 @@ static inline const char *pgtable_level_to_str(enum pgtable_level level)
 	}
 }
 
+#ifdef CONFIG_MMU
+static inline unsigned long pgtable_level_size(enum pgtable_level level)
+{
+	switch (level) {
+	case PGTABLE_LEVEL_PTE:
+		return PAGE_SIZE;
+	case PGTABLE_LEVEL_PMD:
+		return PMD_SIZE;
+	case PGTABLE_LEVEL_PUD:
+		return PUD_SIZE;
+	case PGTABLE_LEVEL_P4D:
+		return P4D_SIZE;
+	case PGTABLE_LEVEL_PGD:
+		return PGDIR_SIZE;
+	}
+
+	return 0;
+}
+
+static inline unsigned long pgtable_level_mask(enum pgtable_level level)
+{
+	return ~(pgtable_level_size(level) - 1);
+}
+#endif
+
 void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
 
 #define ptval_to_str(buf, val)								\

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
