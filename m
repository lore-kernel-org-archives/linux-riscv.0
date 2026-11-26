Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF7606A33B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=glkzryIK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcbFXVnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FCFrtISa2XurIaW0MlDaId5IoOnCVUmf56z1LoSUItk=; b=glkzryIKZttjK+hH4BTALb0+vX
	Momq3ycfmkptzULeMw0sWL1jenlJkVDnWjeFQHT/N9diDxXqTmM4qCudtTkXPEy07m/fkfW4RTKuq
	Z+q6OjR/kOAB/hhi/p4YfR+RTgWRF/ih9cSpHUC+ume+j/wR27rcxdNQLD/B45Oxi8WIDBmBjnZYx
	XI1GFY5cb6ooosMfpmlXXOtdrs8XuDzuTHx69Thk2+e8BAsQAdmm2byuy+V4t41aDBAi1+fcRdq2C
	2m3rkoWSKZ/d1nsl5oB57gnWJ9QeKyH/nMw81QWKTmYb/TD2EHYNXKVMts/ouJ/y1fAq/oBwoii5t
	qSZ0lKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXUm-0000000CtWJ-01ip;
	Thu, 26 Nov 2026 11:18:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXUA-0000000CsiT-2ZFX;
	Thu, 26 Nov 2026 11:17:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D698446A6;
	Thu, 26 Nov 2026 11:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611F21F000E1;
	Thu, 26 Nov 2026 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691873;
	bh=9zfNRstAKqDcmy9+oyhz/qeqyjNth/cpMelt2bCIyNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dcbFXVnBfT1s7qKP7tGcScBMYsU83rp+fAcwT8XfmGgLYSyRFs2M34BJKHaYR1hx1
	 vp8GF7QJE3guwpFZAe++MU3SqjiPtcOiwRin1GwI799quo5MZHZHBaRkVOdTdWfWWd
	 GMHQ5SBrChd4mT0GlRsOOR7pMITn4eIhjeoWzeBjsmXB0VBQ6c4OKtSnxPyAl75j2S
	 wDOmfVxdRgbTFn+2BPKktPtPiMe0wf1JoVKZ1WwQgDhLKTyq9iQKDhorfgp+xK9wAn
	 uqVNctkLJRbanUPFy8ocO3T2Kmt9oyn3dnUyJU1cHp3jR+GoT1mD4ysP5dke6uFihc
	 xuzDO44U7LRBA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:34 +0200
Subject: [PATCH RFC v2 21/54] x86/mm/pat: introduce struct cpa_leaf
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-21-723f1e33c3d8@kernel.org>
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

The functions that handle a mapping found by the CPA lookup get the page
table entry, its level and the address. Each of them decodes the pfn and
the protection again.

Add struct cpa_leaf that describes the mapping and is filled once by
cpa_lookup().

The leaf keeps the protection in the 4K format at every level, so the large
page path applies the requested changes as is and converts the resulting
protection to the large page format only to write a page table entry.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 194 ++++++++++++++++++++++---------------------
 1 file changed, 100 insertions(+), 94 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 44e350c54899..304b7ad26c45 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -51,6 +51,15 @@ struct cpa_data {
 	unsigned int	state;
 };
 
+struct cpa_leaf {
+	pte_t			*kpte;
+	enum pgtable_level	level;
+	unsigned long		addr;
+	unsigned long		size;
+	unsigned long		pfn;
+	pgprot_t		prot;
+};
+
 enum cpa_warn {
 	CPA_PROTECT,
 	CPA_DETECT,
@@ -887,12 +896,53 @@ static pte_t *cpa_lookup_in_pgd(pgd_t *pgdp, unsigned long address,
 	return pte_offset_kernel(pmdp, address);
 }
 
-static pte_t *_lookup_address_cpa(struct cpa_data *cpa, unsigned long address,
-				  enum pgtable_level *level)
+static void cpa_decode_leaf(struct cpa_leaf *leaf)
+{
+	enum pgtable_level level = leaf->level;
+	pte_t *kpte = leaf->kpte;
+	pte_t pte;
+	pmd_t pmd;
+	pud_t pud;
+
+	switch (level) {
+	case PGTABLE_LEVEL_PTE:
+		pte = *kpte;
+		leaf->pfn = pte_pfn(pte);
+		leaf->prot = pte_pgprot(pte);
+		break;
+	case PGTABLE_LEVEL_PMD:
+		pmd = *(pmd_t *)kpte;
+		leaf->pfn = pmd_pfn(pmd);
+		leaf->prot = pgprot_large_2_4k(pmd_pgprot(pmd));
+		break;
+	case PGTABLE_LEVEL_PUD:
+		pud = *(pud_t *)kpte;
+		leaf->pfn = pud_pfn(pud);
+		leaf->prot = pgprot_large_2_4k(pud_pgprot(pud));
+		break;
+	default:
+		leaf->pfn = 0;
+		leaf->prot = __pgprot(0);
+		break;
+	}
+}
+
+static pte_t *cpa_lookup(struct cpa_data *cpa, unsigned long address,
+			 struct cpa_leaf *leaf)
 {
 	pgd_t *pgd = cpa_pgd(cpa, address);
 
-	return cpa_lookup_in_pgd(pgd, address, level);
+	leaf->kpte = cpa_lookup_in_pgd(pgd, address, &leaf->level);
+	if (!leaf->kpte)
+		return NULL;
+	if (leaf->level == PGTABLE_LEVEL_PTE && pte_none(ptep_get(leaf->kpte)))
+		return NULL;
+
+	leaf->size = pgtable_level_size(leaf->level);
+	leaf->addr = address & pgtable_level_mask(leaf->level);
+	cpa_decode_leaf(leaf);
+
+	return leaf->kpte;
 }
 
 /*
@@ -1035,53 +1085,36 @@ static pte_t cpa_pte(enum pgtable_level level, unsigned long pfn, pgprot_t prot)
 	return pfn_pte(pfn, prot);
 }
 
-static int should_split_large_page(pte_t *kpte, unsigned long address,
-				   enum pgtable_level level,
-				   struct cpa_data *cpa)
+static int should_split_large_page(struct cpa_data *cpa, struct cpa_leaf *leaf)
 {
-	unsigned long numpages, pmask, psize, lpaddr, pfn, old_pfn;
-	pgprot_t old_prot, new_prot, req_prot;
+	unsigned long address = __cpa_addr(cpa, cpa->curpage);
+	enum pgtable_level level = leaf->level;
+	unsigned long lpaddr = leaf->addr;
+	unsigned long old_pfn = leaf->pfn;
+	unsigned long psize = leaf->size;
+	pgprot_t old_prot = leaf->prot;
+	unsigned long numpages, pfn;
+	pgprot_t new_prot, req_prot;
+	pte_t *kpte = leaf->kpte;
 	pte_t new_pte;
 
 	if (cpa->flags & CPA_REQ_SPLIT)
 		return 1;
 
-	switch (level) {
-	case PGTABLE_LEVEL_PMD:
-		old_prot = pmd_pgprot(*(pmd_t *)kpte);
-		old_pfn = pmd_pfn(*(pmd_t *)kpte);
-		break;
-	case PGTABLE_LEVEL_PUD:
-		old_prot = pud_pgprot(*(pud_t *)kpte);
-		old_pfn = pud_pfn(*(pud_t *)kpte);
-		break;
-	default:
+	if (level != PGTABLE_LEVEL_PMD && level != PGTABLE_LEVEL_PUD)
 		return -EINVAL;
-	}
 
 	cpa_inc_pxd_checked(level);
 
-	psize = pgtable_level_size(level);
-	pmask = pgtable_level_mask(level);
-
 	/*
 	 * Calculate the number of pages, which fit into this large
 	 * page starting at address:
 	 */
-	lpaddr = (address + psize) & pmask;
-	numpages = (lpaddr - address) >> PAGE_SHIFT;
+	numpages = (lpaddr + psize - address) >> PAGE_SHIFT;
 	if (numpages < cpa->numpages)
 		cpa->numpages = numpages;
 
-	/*
-	 * We are safe now. Check whether the new pgprot is the same:
-	 * Convert protection attributes to 4k-format, as cpa->mask* are set
-	 * up accordingly.
-	 */
-
-	/* Clear PSE (aka _PAGE_PAT) and move PAT bit to correct position */
-	req_prot = pgprot_large_2_4k(old_prot);
-
+	req_prot = old_prot;
 	pgprot_val(req_prot) &= ~pgprot_val(cpa->mask_clr);
 	pgprot_val(req_prot) |= pgprot_val(cpa->mask_set);
 
@@ -1092,11 +1125,6 @@ static int should_split_large_page(pte_t *kpte, unsigned long address,
 	pfn = old_pfn + ((address & (psize - 1)) >> PAGE_SHIFT);
 	cpa->pfn = pfn;
 
-	/*
-	 * Calculate the large page base address and the number of 4K pages
-	 * in the large page
-	 */
-	lpaddr = address & pmask;
 	numpages = psize >> PAGE_SHIFT;
 
 	/*
@@ -1105,7 +1133,7 @@ static int should_split_large_page(pte_t *kpte, unsigned long address,
 	 * required independent of alignment and length of the requested
 	 * range.
 	 */
-	if (pgprot_val(req_prot) == pgprot_val(pgprot_large_2_4k(old_prot))) {
+	if (pgprot_val(req_prot) == pgprot_val(old_prot)) {
 		cpa_inc_pxd_sameprot(level);
 		return 0;
 	}
@@ -1147,44 +1175,25 @@ static int should_split_large_page(pte_t *kpte, unsigned long address,
 }
 
 static int
-__split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
-		   enum pgtable_level level, pte_t *pbase)
+__split_large_page(struct cpa_data *cpa, struct cpa_leaf *leaf, pte_t *pbase)
 {
-	unsigned long ref_pfn, pfn, pfninc = 1;
+	unsigned long address = __cpa_addr(cpa, cpa->curpage);
 	struct page *base = virt_to_page(pbase);
-	pgprot_t ref_prot;
+	enum pgtable_level level = leaf->level;
+	unsigned long pfn = leaf->pfn;
+	pgprot_t prot = leaf->prot;
+	pte_t *kpte = leaf->kpte;
+	unsigned long pfninc;
 	unsigned int i;
 
-	paravirt_alloc_pte(&init_mm, page_to_pfn(base));
-
-	switch (level) {
-	case PGTABLE_LEVEL_PMD:
-		ref_prot = pmd_pgprot(*(pmd_t *)kpte);
-		/*
-		 * Clear PSE (aka _PAGE_PAT) and move
-		 * PAT bit to correct position.
-		 */
-		ref_prot = pgprot_large_2_4k(ref_prot);
-		ref_pfn = pmd_pfn(*(pmd_t *)kpte);
-		break;
-
-	case PGTABLE_LEVEL_PUD:
-		ref_prot = pud_pgprot(*(pud_t *)kpte);
-		ref_pfn = pud_pfn(*(pud_t *)kpte);
-		pfninc = PMD_SIZE >> PAGE_SHIFT;
-		ref_prot = pgprot_large_2_4k(ref_prot);
-		break;
-
-	default:
+	if (level != PGTABLE_LEVEL_PMD && level != PGTABLE_LEVEL_PUD)
 		return -EINVAL;
-	}
 
-	/*
-	 * Get the target pfn from the original entry:
-	 */
-	pfn = ref_pfn;
+	paravirt_alloc_pte(&init_mm, page_to_pfn(base));
+
+	pfninc = pgtable_level_size(level - 1) >> PAGE_SHIFT;
 	for (i = 0; i < PTRS_PER_PTE; i++, pfn += pfninc)
-		set_pte(pbase + i, cpa_pte(level - 1, pfn, ref_prot));
+		set_pte(pbase + i, cpa_pte(level - 1, pfn, prot));
 
 	if (within(address, PAGE_OFFSET,
 		   PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT)))
@@ -1222,10 +1231,11 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 	return 0;
 }
 
-static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
-			    unsigned long address)
+static int split_large_page(struct cpa_data *cpa, struct cpa_leaf *leaf)
 {
-	enum pgtable_level level;
+	unsigned long address = __cpa_addr(cpa, cpa->curpage);
+	pte_t *kpte = leaf->kpte;
+	struct cpa_leaf tmp;
 	pte_t *pte;
 	int ret = 0;
 
@@ -1239,10 +1249,11 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 	 * Check for races, another CPU might have split this page
 	 * up for us already:
 	 */
-	if (_lookup_address_cpa(cpa, address, &level) != kpte)
+	if (cpa_lookup(cpa, address, &tmp) != kpte)
 		goto out;
+	*leaf = tmp;
 
-	ret = __split_large_page(cpa, kpte, address, level, pte);
+	ret = __split_large_page(cpa, leaf, pte);
 	if (ret)
 		goto out;
 
@@ -1851,26 +1862,21 @@ static int __cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr)
 
 static int __change_page_attr(struct cpa_data *cpa)
 {
-	enum pgtable_level level;
 	unsigned long address;
-	pte_t *kpte, old_pte;
-	int do_split, err;
+	struct cpa_leaf leaf;
+	int do_split, ret;
 
 	address = __cpa_addr(cpa, cpa->curpage);
 repeat:
-	kpte = _lookup_address_cpa(cpa, address, &level);
-	if (!kpte)
+	if (!cpa_lookup(cpa, address, &leaf))
 		return __cpa_process_fault(cpa, address);
 
-	old_pte = *kpte;
-	if (pte_none(old_pte))
-		return __cpa_process_fault(cpa, address);
-
-	if (level == PGTABLE_LEVEL_PTE) {
+	if (leaf.level == PGTABLE_LEVEL_PTE) {
+		pte_t old_pte = *leaf.kpte;
+		pgprot_t old_prot = leaf.prot;
+		pgprot_t new_prot = leaf.prot;
+		unsigned long pfn = leaf.pfn;
 		pte_t new_pte;
-		pgprot_t old_prot = pte_pgprot(old_pte);
-		pgprot_t new_prot = pte_pgprot(old_pte);
-		unsigned long pfn = pte_pfn(old_pte);
 
 		pgprot_val(new_prot) &= ~pgprot_val(cpa->mask_clr);
 		pgprot_val(new_prot) |= pgprot_val(cpa->mask_set);
@@ -1887,13 +1893,13 @@ static int __change_page_attr(struct cpa_data *cpa)
 		 * after all we're only going to change its attributes
 		 * not the memory it points to
 		 */
-		new_pte = cpa_pte(level, pfn, new_prot);
+		new_pte = cpa_pte(leaf.level, pfn, new_prot);
 		cpa->pfn = pfn;
 		/*
 		 * Do we really change anything ?
 		 */
 		if (pte_val(old_pte) != pte_val(new_pte)) {
-			set_pte_atomic(kpte, new_pte);
+			set_pte_atomic(leaf.kpte, new_pte);
 			cpa->state |= CPA_ST_FLUSHTLB;
 		}
 		cpa->numpages = 1;
@@ -1904,7 +1910,7 @@ static int __change_page_attr(struct cpa_data *cpa)
 	 * Check, whether we can keep the large page intact
 	 * and just change the pte:
 	 */
-	do_split = should_split_large_page(kpte, address, level, cpa);
+	do_split = should_split_large_page(cpa, &leaf);
 	/*
 	 * When the range fits into the existing large page,
 	 * return. cp->numpages and cpa->tlbflush have been updated in
@@ -1916,11 +1922,11 @@ static int __change_page_attr(struct cpa_data *cpa)
 	/*
 	 * We have to split the large page:
 	 */
-	err = split_large_page(cpa, kpte, address);
-	if (!err)
+	ret = split_large_page(cpa, &leaf);
+	if (!ret)
 		goto repeat;
 
-	return err;
+	return ret;
 }
 
 static int __change_page_attr_set_clr(struct cpa_data *cpa);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
