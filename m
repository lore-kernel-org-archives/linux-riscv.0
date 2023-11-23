Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF95C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvXodfBtRb6e7Xk8wx0D0zYtzouhbUAI/Vb8Vyodx4Q=; b=0gp6i7AjHKPEkz
	uWQ7Q9DxPRM5PqRjGKl4Fa4NI34lqe3y5Q9JpFZjsqfWjDP0KvilT7BqJjNX87d+Gpu4ApsbX75KE
	ILYWDoWLbX77Q0DJzslx2ZZIKzSqOw6SucdPa4ZOyt4ApX6azrD/tFY4pSx3Jh7NCqPZHrL33Zl/B
	ykij2rnoh5CZj1rF1+jygO7FAeI3M4lrfNvG7oEUUmZ5igIGiu3vxLsxMRiRH5KImH2KpAqmA6ZQP
	CLZ3mwSjpCJ+nCg52zygOt9SqNm6olkNZRazV2qs9/YmBTYquoKpoGNpW9Oz8IqiSz6div2kbKh1h
	UCmihvy0BHJ9oFE8+tYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63fN-003xdb-1D;
	Thu, 23 Nov 2023 06:58:25 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63fJ-003xZv-29
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:58:23 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d67d32adc2so353360a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722700; x=1701327500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzxcE+HP292pep10tUlqLGBeuvx8vBA9uQw9Wbs1mQo=;
        b=bU7JraRPxS9aIonh6RAmtPOYg7KdDrpnQEYBUi7vRMi4k51ZhlGtqAs8axy1BPvowC
         Y3gFPemvrrmZZ6+jRPrTAFQVyBaW3fK/uY2CZWPjaG6BhjzX1i8+l0b23t0Tbt82LC3R
         3BH7cDoWC/AwuZWYuxCTRFIgp9ylD2mAaTmJPV71hjDvC6LDNjPZMTlDwUu5YpUKde6W
         TNwBDWLUoSwECYSuVvELvPSC9/qKB3rcScZoc8N9HthGgNU4LHWJ8IGPg3iYvsXdUUGw
         cSpvV0IDb/YqOWWxdk9O1iGu08p1xf4gVn50F6fRpd6FlNGpSwnVf4yu38bo94s5xTko
         LYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722700; x=1701327500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzxcE+HP292pep10tUlqLGBeuvx8vBA9uQw9Wbs1mQo=;
        b=C0Kym03XHdHa6a/ol2JTIz+pFdfuZLRvyvXxFFQ2DwynuzOPZWxHie7IkmOdEYr0hP
         SvNVNeZ2kcswh8TgBncG1EeaHUN7vBZZ9khMH1fhXDQt7d4I9CD+HAXVhctbo8hU85SX
         bJ8YJJ8VEiOWyPP8rCHjfXBF0vDpIdbg6MkuOiS4ZBBvM+d9mGt05P83JvKnMuhte5KN
         tosMHxpFjwqNcx+qR8UT6MuvB3NksHxi8LW5+VFvvkoLxNoIULu8/s4xu5tFOYoWNeZz
         wFYCJmE9AiOdHUa+wDVQy1v4oZLCXwy9+KZLhtskHx1ZIR7Xp4MHXhuf4eClUKulp0xn
         uEtQ==
X-Gm-Message-State: AOJu0YwzYbHp/DKpM7DIvvI0MjPrMUMp2lxqu7+1SKVjCyXsV7iZMm6a
	wxgTdu3YCCFxjTwkpyYMV73C6g==
X-Google-Smtp-Source: AGHT+IHfN56opjKVRtmf8nkhgYvS+GzTzNtB590B3ZTYABAvfpqWqq/B6z3vd8AMP9SjHn+EpQsRvw==
X-Received: by 2002:a05:6830:2646:b0:6d7:f8c1:e473 with SMTP id f6-20020a056830264600b006d7f8c1e473mr1973461otu.19.1700722700289;
        Wed, 22 Nov 2023 22:58:20 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.58.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:58:19 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 10/11] riscv: kvm: Adapt kvm to gap between hw page and sw page
Date: Thu, 23 Nov 2023 14:57:07 +0800
Message-Id: <20231123065708.91345-11-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225821_718617_0785590E 
X-CRM114-Status: GOOD (  20.10  )
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

Existing mmu code in kvm handles middle level page table entry and the
last level page table entry in the same way, which is insufficient when
base page becomes larger. For example, for 64K base page, per pte_t
contains 16 page table entries while per pmd_t still contains one and
thus needs to be handled in different ways.

This commit refines kvm mmu code to handle middle level page table
entries and last level page table entries distinctively.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h |   7 ++
 arch/riscv/kvm/mmu.c             | 198 +++++++++++++++++++++----------
 2 files changed, 145 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 803dc5fb6314..9bed1512b3d2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -220,6 +220,13 @@ static inline unsigned long make_satp(unsigned long pfn,
 		((asid & SATP_ASID_MASK) << SATP_ASID_SHIFT) | satp_mode);
 }
 
+static inline unsigned long make_hgatp(unsigned long pfn,
+		unsigned long vmid, unsigned long hgatp_mode)
+{
+	return ((pfn_to_hwpfn(pfn) & HGATP_PPN) |
+			((vmid << HGATP_VMID_SHIFT) & HGATP_VMID) | hgatp_mode);
+}
+
 static __always_inline int __pte_present(unsigned long pteval)
 {
 	return (pteval & (_PAGE_PRESENT | _PAGE_PROT_NONE));
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 068c74593871..f26d3e94fe17 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -36,22 +36,36 @@ static unsigned long gstage_pgd_levels __ro_after_init = 2;
 			 gstage_pgd_xbits)
 #define gstage_gpa_size	((gpa_t)(1ULL << gstage_gpa_bits))
 
+#define gstage_pmd_leaf(__pmdp) \
+	(pmd_val(pmdp_get(__pmdp)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
+
 #define gstage_pte_leaf(__ptep)	\
-	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
+	(pte_val(ptep_get(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
 
-static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
+static inline unsigned long gstage_pmd_index(gpa_t addr, u32 level)
 {
 	unsigned long mask;
 	unsigned long shift = HGATP_PAGE_SHIFT + (gstage_index_bits * level);
 
+	BUG_ON(level == 0);
 	if (level == (gstage_pgd_levels - 1))
-		mask = (PTRS_PER_PTE * (1UL << gstage_pgd_xbits)) - 1;
+		mask = (PTRS_PER_PMD * (1UL << gstage_pgd_xbits)) - 1;
 	else
-		mask = PTRS_PER_PTE - 1;
+		mask = PTRS_PER_PMD - 1;
 
 	return (addr >> shift) & mask;
 }
 
+static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
+{
+	return (addr >> PAGE_SHIFT) & (PTRS_PER_PTE - 1);
+}
+
+static inline unsigned long gstage_pmd_page_vaddr(pmd_t pmd)
+{
+	return (unsigned long)pfn_to_virt(__page_val_to_pfn(pmd_val(pmd)));
+}
+
 static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
 {
 	return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));
@@ -60,9 +74,13 @@ static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
 static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)
 {
 	u32 i;
-	unsigned long psz = 1UL << 12;
+	unsigned long psz = 1UL << HW_PAGE_SHIFT;
 
-	for (i = 0; i < gstage_pgd_levels; i++) {
+	if (page_size == PAGE_SIZE) {
+		*out_level = 0;
+		return 0;
+	}
+	for (i = 1; i < gstage_pgd_levels; i++) {
 		if (page_size == (psz << (i * gstage_index_bits))) {
 			*out_level = i;
 			return 0;
@@ -77,7 +95,11 @@ static int gstage_level_to_page_order(u32 level, unsigned long *out_pgorder)
 	if (gstage_pgd_levels < level)
 		return -EINVAL;
 
-	*out_pgorder = 12 + (level * gstage_index_bits);
+	if (level == 0)
+		*out_pgorder = PAGE_SHIFT;
+	else
+		*out_pgorder = HW_PAGE_SHIFT + (level * gstage_index_bits);
+
 	return 0;
 }
 
@@ -95,30 +117,40 @@ static int gstage_level_to_page_size(u32 level, unsigned long *out_pgsize)
 }
 
 static bool gstage_get_leaf_entry(struct kvm *kvm, gpa_t addr,
-				  pte_t **ptepp, u32 *ptep_level)
+				  void **ptepp, u32 *ptep_level)
 {
-	pte_t *ptep;
+	pmd_t *pmdp = NULL;
+	pte_t *ptep = NULL;
 	u32 current_level = gstage_pgd_levels - 1;
 
 	*ptep_level = current_level;
-	ptep = (pte_t *)kvm->arch.pgd;
-	ptep = &ptep[gstage_pte_index(addr, current_level)];
-	while (ptep && pte_val(*ptep)) {
-		if (gstage_pte_leaf(ptep)) {
+	pmdp = (pmd_t *)kvm->arch.pgd;
+	pmdp = &pmdp[gstage_pmd_index(addr, current_level)];
+	while (current_level && pmdp && pmd_val(pmdp_get(pmdp))) {
+		if (gstage_pmd_leaf(pmdp)) {
 			*ptep_level = current_level;
-			*ptepp = ptep;
+			*ptepp = (void *)pmdp;
 			return true;
 		}
 
+		current_level--;
+		*ptep_level = current_level;
+		pmdp = (pmd_t *)gstage_pmd_page_vaddr(pmdp_get(pmdp));
 		if (current_level) {
-			current_level--;
-			*ptep_level = current_level;
-			ptep = (pte_t *)gstage_pte_page_vaddr(*ptep);
-			ptep = &ptep[gstage_pte_index(addr, current_level)];
+			pmdp = &pmdp[gstage_pmd_index(addr, current_level)];
 		} else {
-			ptep = NULL;
+			ptep = (pte_t *)pmdp;
+			ptep = &ptep[gstage_pte_index(addr, current_level)];
 		}
 	}
+	if (ptep && pte_val(ptep_get(ptep))) {
+		if (gstage_pte_leaf(ptep)) {
+			*ptep_level = current_level;
+			*ptepp = (void *)ptep;
+			return true;
+		}
+		ptep = NULL;
+	}
 
 	return false;
 }
@@ -136,40 +168,53 @@ static void gstage_remote_tlb_flush(struct kvm *kvm, u32 level, gpa_t addr)
 
 static int gstage_set_pte(struct kvm *kvm, u32 level,
 			   struct kvm_mmu_memory_cache *pcache,
-			   gpa_t addr, const pte_t *new_pte)
+			   gpa_t addr, const void *new_pte)
 {
 	u32 current_level = gstage_pgd_levels - 1;
-	pte_t *next_ptep = (pte_t *)kvm->arch.pgd;
-	pte_t *ptep = &next_ptep[gstage_pte_index(addr, current_level)];
+	pmd_t *next_pmdp = (pmd_t *)kvm->arch.pgd;
+	pmd_t *pmdp = &next_pmdp[gstage_pmd_index(addr, current_level)];
+	pte_t *next_ptep = NULL;
+	pte_t *ptep = NULL;
 
 	if (current_level < level)
 		return -EINVAL;
 
 	while (current_level != level) {
-		if (gstage_pte_leaf(ptep))
+		if (gstage_pmd_leaf(pmdp))
 			return -EEXIST;
 
-		if (!pte_val(*ptep)) {
+		if (!pmd_val(pmdp_get(pmdp))) {
 			if (!pcache)
 				return -ENOMEM;
-			next_ptep = kvm_mmu_memory_cache_alloc(pcache);
-			if (!next_ptep)
+			next_pmdp = kvm_mmu_memory_cache_alloc(pcache);
+			if (!next_pmdp)
 				return -ENOMEM;
-			*ptep = pfn_pte(PFN_DOWN(__pa(next_ptep)),
-					__pgprot(_PAGE_TABLE));
+			set_pmd(pmdp, pfn_pmd(PFN_DOWN(__pa(next_pmdp)),
+						__pgprot(_PAGE_TABLE)));
 		} else {
-			if (gstage_pte_leaf(ptep))
+			if (gstage_pmd_leaf(pmdp))
 				return -EEXIST;
-			next_ptep = (pte_t *)gstage_pte_page_vaddr(*ptep);
+			next_pmdp = (pmd_t *)gstage_pmd_page_vaddr(pmdp_get(pmdp));
 		}
 
 		current_level--;
-		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
+		if (current_level) {
+			pmdp = &next_pmdp[gstage_pmd_index(addr, current_level)];
+		} else {
+			next_ptep = (pte_t *)next_pmdp;
+			ptep = &next_ptep[gstage_pte_index(addr, current_level)];
+		}
 	}
 
-	*ptep = *new_pte;
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (current_level) {
+		set_pmd(pmdp, pmdp_get((pmd_t *)new_pte));
+		if (gstage_pmd_leaf(pmdp))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	} else {
+		set_pte(ptep, ptep_get((pte_t *)new_pte));
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
@@ -182,6 +227,7 @@ static int gstage_map_page(struct kvm *kvm,
 {
 	int ret;
 	u32 level = 0;
+	pmd_t new_pmd;
 	pte_t new_pte;
 	pgprot_t prot;
 
@@ -213,10 +259,15 @@ static int gstage_map_page(struct kvm *kvm,
 		else
 			prot = PAGE_WRITE;
 	}
-	new_pte = pfn_pte(PFN_DOWN(hpa), prot);
-	new_pte = pte_mkdirty(new_pte);
-
-	return gstage_set_pte(kvm, level, pcache, gpa, &new_pte);
+	if (level) {
+		new_pmd = pfn_pmd(PFN_DOWN(hpa), prot);
+		new_pmd = pmd_mkdirty(new_pmd);
+		return gstage_set_pte(kvm, level, pcache, gpa, &new_pmd);
+	} else {
+		new_pte = pfn_pte(PFN_DOWN(hpa), prot);
+		new_pte = pte_mkdirty(new_pte);
+		return gstage_set_pte(kvm, level, pcache, gpa, &new_pte);
+	}
 }
 
 enum gstage_op {
@@ -226,9 +277,12 @@ enum gstage_op {
 };
 
 static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
-			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
+			  void *__ptep, u32 ptep_level, enum gstage_op op)
 {
 	int i, ret;
+	pmd_t *pmdp = (pmd_t *)__ptep;
+	pte_t *ptep = (pte_t *)__ptep;
+	pmd_t *next_pmdp;
 	pte_t *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
@@ -239,11 +293,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 
 	BUG_ON(addr & (page_size - 1));
 
-	if (!pte_val(*ptep))
+	if (ptep_level && !pmd_val(pmdp_get(pmdp)))
+		return;
+	if (!ptep_level && !pte_val(ptep_get(ptep)))
 		return;
 
-	if (ptep_level && !gstage_pte_leaf(ptep)) {
-		next_ptep = (pte_t *)gstage_pte_page_vaddr(*ptep);
+	if (ptep_level && !gstage_pmd_leaf(pmdp)) {
+		next_pmdp = (pmd_t *)gstage_pmd_page_vaddr(pmdp_get(pmdp));
 		next_ptep_level = ptep_level - 1;
 		ret = gstage_level_to_page_size(next_ptep_level,
 						&next_page_size);
@@ -251,17 +307,33 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 			return;
 
 		if (op == GSTAGE_OP_CLEAR)
-			set_pte(ptep, __pte(0));
-		for (i = 0; i < PTRS_PER_PTE; i++)
-			gstage_op_pte(kvm, addr + i * next_page_size,
-					&next_ptep[i], next_ptep_level, op);
+			set_pmd(pmdp, __pmd(0));
+		if (next_ptep_level) {
+			for (i = 0; i < PTRS_PER_PMD; i++)
+				gstage_op_pte(kvm, addr + i * next_page_size,
+						&next_pmdp[i], next_ptep_level, op);
+		} else {
+			next_ptep = (pte_t *)next_pmdp;
+			for (i = 0; i < PTRS_PER_PTE; i++)
+				gstage_op_pte(kvm, addr + i * next_page_size,
+						&next_ptep[i], next_ptep_level, op);
+		}
 		if (op == GSTAGE_OP_CLEAR)
-			put_page(virt_to_page(next_ptep));
+			put_page(virt_to_page(next_pmdp));
 	} else {
-		if (op == GSTAGE_OP_CLEAR)
-			set_pte(ptep, __pte(0));
-		else if (op == GSTAGE_OP_WP)
-			set_pte(ptep, __pte(pte_val(*ptep) & ~_PAGE_WRITE));
+		if (ptep_level) {
+			if (op == GSTAGE_OP_CLEAR)
+				set_pmd(pmdp, __pmd(0));
+			else if (op == GSTAGE_OP_WP)
+				set_pmd(pmdp,
+					__pmd(pmd_val(pmdp_get(pmdp)) & ~_PAGE_WRITE));
+		} else {
+			if (op == GSTAGE_OP_CLEAR)
+				set_pte(ptep, __pte(0));
+			else if (op == GSTAGE_OP_WP)
+				set_pte(ptep,
+					__pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
+		}
 		gstage_remote_tlb_flush(kvm, ptep_level, addr);
 	}
 }
@@ -270,7 +342,7 @@ static void gstage_unmap_range(struct kvm *kvm, gpa_t start,
 			       gpa_t size, bool may_block)
 {
 	int ret;
-	pte_t *ptep;
+	void *ptep;
 	u32 ptep_level;
 	bool found_leaf;
 	unsigned long page_size;
@@ -305,7 +377,7 @@ static void gstage_unmap_range(struct kvm *kvm, gpa_t start,
 static void gstage_wp_range(struct kvm *kvm, gpa_t start, gpa_t end)
 {
 	int ret;
-	pte_t *ptep;
+	void *ptep;
 	u32 ptep_level;
 	bool found_leaf;
 	gpa_t addr = start;
@@ -572,7 +644,7 @@ bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
+	void *ptep;
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
@@ -585,12 +657,15 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 				   &ptep, &ptep_level))
 		return false;
 
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+	if (ptep_level)
+		return pmdp_test_and_clear_young(NULL, 0, (pmd_t *)ptep);
+	else
+		return ptep_test_and_clear_young(NULL, 0, (pte_t *)ptep);
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
+	void *ptep;
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
@@ -603,7 +678,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 				   &ptep, &ptep_level))
 		return false;
 
-	return pte_young(*ptep);
+	if (ptep_level)
+		return pmd_young(pmdp_get((pmd_t *)ptep));
+	else
+		return pte_young(ptep_get((pte_t *)ptep));
 }
 
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
@@ -746,11 +824,11 @@ void kvm_riscv_gstage_free_pgd(struct kvm *kvm)
 
 void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 {
-	unsigned long hgatp = gstage_mode;
+	unsigned long hgatp;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
-	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
-	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
+	hgatp = make_hgatp(PFN_DOWN(k->pgd_phys), READ_ONCE(k->vmid.vmid),
+			   gstage_mode);
 
 	csr_write(CSR_HGATP, hgatp);
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
