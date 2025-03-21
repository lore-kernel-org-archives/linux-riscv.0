Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CADCC36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9J/Hi3PZD7vecm0BTGkMpuI+d5iAEuue70RaidKPqE=; b=EILWUMCVcv+ScT
	VyC7XSATz1HIkf9xsQ9ycWz9nA2ahd+RRjtENOUNTO9/+m8uyjdb6SMZ0n24Ui+X9rgkpHyawRDph
	8LRP35eFNnkEqZ8605zjDuV1OzKGldiZIL1MQ6BZXSTsSKmv0ddl4eFVJTwPh/liPLEkQxDuAqQHV
	yr5pTrYKdiiC4ZsuRKPG+HUq0uOUhxWSbf+2q+/hsHsXaD0wc30IbZqO109JiqYa7/8u4lK6axeuv
	TAY62cRELcI34/64IgQ2SorGHscTOXr2hLE37byYRtQry0S7Ffecgj3rGE0v/h1U8yl8yspiY6vJ6
	e/VDofMf5DR+Df2wRQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc8f-0000000Ertl-0wvA;
	Fri, 21 Mar 2025 13:10:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc79-0000000ErcF-2vY3
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 13:08:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso14141385e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562522; x=1743167322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHcTeoTN4G5JoOrCU+WuSXOyCDmNaouJRLSJHK0ciYw=;
        b=yxD+T443pJ4HV1SnCCh3624EWLVyFkGWsRO5+qg5lpvNzdl1gKp6m3dwO3JU7RIybl
         YDirTn1M8pmvfW3CeFRvrOJP3LvcPGx+tD5fzshXcCcpnV1nGg3yGTbgFoDSKLiKjftF
         uh2tzEsoh4uvElUkdi7Jn/MhNqur9jEP6bFNvta9zD6enAXr1JePuBW2sAoHjDidQrhp
         I2iz6AJ/CYfNtpF9WobNDfQAvVoLzrmWBK1yzvJ5ZL/uUHz33nuIAj7ldDQaVj0hv4UD
         YWAAsv3mwb5pz6qEa8V83YgUZzOcPda4+S9GC1geBinHuEW+ZsY+G7pRLs2pIMhBOSdf
         Ecpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562522; x=1743167322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHcTeoTN4G5JoOrCU+WuSXOyCDmNaouJRLSJHK0ciYw=;
        b=LB0iOt5z76PEoY61TowW04wXynB5JCdWpdOSnA8fiTF/rEvgKwqVKsZ//ew1psWE/k
         a7qFPMd7MTVA2T+O+LyROYtN9jyzzd+XdmOryvxRb434GziX2GTkdOFMuu3ccSCrDvSg
         DeM9S7IRPjWztNrNqfcV2DJplY1T8ckv/Rwnl5A148SCKOc60kAN+3EArOdEGYhcMNq8
         Ro4Kaw9da6mdp61jc3OXf9bmmmhYGsL9/e1lABiTZ4/yX8DYzHZW/9W2rFZ239dafPpB
         GrVaJ5TmbA5sS+v2r/RxpdkkqtCyxkrVoPWwSihOSHttulhJfQFhnTmDlmb9ytH74Cni
         EGrg==
X-Forwarded-Encrypted: i=1; AJvYcCW0UwUZU7iWA/YMpRhI9Xtdvy1AcMxQ5uadVUqKLoZxr7XPpvkP9xrVTFFqTq1LpWPitlEV3OEJxP4NIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRqIepWv+RIm0njexXQPgKjend8wTTq8LUbT0B6NXviKHhAUqI
	IHmmJvAqP9KQvr7LIKeVRRH/QnV8GBOl7m5CzmRVht4sQowQTLuJW53PusCKixI=
X-Gm-Gg: ASbGncsdG2Q+e0HXx/Q7PEpN0skl2iKVqu1GEuViCrfGDLsnwoJc68gz+ZylT16iHJp
	JCfuJGEKKUuQg+kYPVnW6+OU7MQ2Q4HaiprKuJQfz9zAMGQmj6dldW6vSnr8GDnSwePgv1wZ7Ba
	vBV6vzudurpzlLh9nRBLlAlDusFwVVxJEpwnlsNTdTyOkNRrrMRFFT+9P1lrpn3LSRYHDLTQDa5
	hvoXpPPfdCSNpZYbwCmwMkEjyYPw35MHjE4MFeMjPLYe+Ny1+raDzmXf2m1OD1iI4YH2sP41XfN
	rJtI2/nXl/C2WqTPhd2TZzVaVEoUjn+F9/tL77EG73TgOqB7B2WhpsWRw6UpjXcBlIHYAtCa6fy
	oO5/L
X-Google-Smtp-Source: AGHT+IEMJBrD5VHSiFntLl7eq4OXY9R2l0VvwmSKG3LcIwl+yD5imfUnEeI+G2u9jHEtl52hrfshfg==
X-Received: by 2002:a05:600c:46d4:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-43d50a3b62emr18553825e9.26.1742562521606;
        Fri, 21 Mar 2025 06:08:41 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdec51sm78104015e9.27.2025.03.21.06.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:08:41 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 2/9] riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
Date: Fri, 21 Mar 2025 14:06:28 +0100
Message-Id: <20250321130635.227011-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_060843_740959_172C217A 
X-CRM114-Status: GOOD (  26.66  )
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

The core mm code expects to be able to extract the pfn from a pte. NAPOT
mappings work differently since its ptes actually point to the first pfn
of the mapping, the other bits being used to encode the size of the
mapping.

So modify ptep_get() so that it returns a pte value that contains the
*real* pfn (which is then different from what the HW expects) and right
before storing the ptes to the page table, reset the pfn LSBs to the
size of the mapping.

And make sure that all NAPOT mappings are set using set_ptes().

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable-64.h |  11 ++
 arch/riscv/include/asm/pgtable.h    | 155 ++++++++++++++++++++++++----
 arch/riscv/mm/hugetlbpage.c         |  15 ++-
 3 files changed, 152 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 0897dd99ab8d..cddbe426f618 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -104,6 +104,17 @@ enum napot_cont_order {
 #define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
 #define napot_pte_num(order)	BIT(order)
 
+static inline bool is_napot_order(unsigned int order)
+{
+	unsigned int napot_order;
+
+	for_each_napot_order(napot_order)
+		if (order == napot_order)
+			return true;
+
+	return false;
+}
+
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 #define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
 #else
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad..2e62d7e607db 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -296,6 +296,17 @@ static inline unsigned long pte_napot(pte_t pte)
 	return pte_val(pte) & _PAGE_NAPOT;
 }
 
+#define pte_valid_napot(pte)	(pte_present(pte) && pte_napot(pte))
+
+/*
+ * contpte is what we expose to the core mm code, this is not exactly a napot
+ * mapping since the size is not encoded in the pfn yet.
+ */
+static inline pte_t pte_mkcont(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_NAPOT);
+}
+
 static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
 {
 	int pos = order - 1 + _PAGE_PFN_SHIFT;
@@ -305,6 +316,12 @@ static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
 	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
 }
 
+/* pte at entry must *not* encode the mapping size in the pfn LSBs. */
+static inline pte_t pte_clear_napot(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~_PAGE_NAPOT);
+}
+
 #else
 
 static __always_inline bool has_svnapot(void) { return false; }
@@ -314,17 +331,24 @@ static inline unsigned long pte_napot(pte_t pte)
 	return 0;
 }
 
+static inline pte_t pte_clear_napot(pte_t pte)
+{
+	return pte;
+}
+
+static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+{
+	return pte;
+}
+
+#define pte_valid_napot(pte)	false
+
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	unsigned long res  = __page_val_to_pfn(pte_val(pte));
-
-	if (has_svnapot() && pte_napot(pte))
-		res = res & (res - 1UL);
-
-	return res;
+	return __page_val_to_pfn(pte_val(pte));
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
@@ -559,8 +583,13 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 
 #define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
 
-static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
-		pte_t *ptep, pte_t pteval, unsigned int nr)
+static inline pte_t ___ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+
+static inline void ___set_ptes(struct mm_struct *mm, unsigned long addr,
+			       pte_t *ptep, pte_t pteval, unsigned int nr)
 {
 	page_table_check_ptes_set(mm, ptep, pteval, nr);
 
@@ -569,10 +598,13 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		if (--nr == 0)
 			break;
 		ptep++;
+
+		if (unlikely(pte_valid_napot(pteval)))
+			continue;
+
 		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
 	}
 }
-#define set_ptes set_ptes
 
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
@@ -587,17 +619,6 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long addre
 extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
 				     pte_t *ptep);
 
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
-{
-	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
-
-	page_table_check_pte_clear(mm, pte);
-
-	return pte;
-}
-
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
@@ -627,6 +648,100 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+static inline pte_t pte_napot_clear_pfn(pte_t *ptep, pte_t pte)
+{
+	/*
+	 * The pte we load has the N bit set and the size of the mapping in
+	 * the pfn LSBs: keep the N bit and replace the mapping size with
+	 * the *real* pfn since the core mm code expects to find it there.
+	 * The mapping size will be reset just before being written to the
+	 * page table in set_ptes().
+	 */
+	if (unlikely(pte_valid_napot(pte))) {
+		unsigned int order = napot_cont_order(pte);
+		int pos = order - 1 + _PAGE_PFN_SHIFT;
+		unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
+		pte_t *orig_ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * napot_pte_num(order));
+
+		pte = __pte((pte_val(pte) & napot_mask) + ((ptep - orig_ptep) << _PAGE_PFN_SHIFT));
+	}
+
+	return pte;
+}
+
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
+				       unsigned long address, pte_t *ptep)
+{
+	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
+
+	pte = pte_napot_clear_pfn(ptep, pte);
+
+	page_table_check_pte_clear(mm, pte);
+
+	return pte;
+}
+
+static inline pte_t __ptep_get(pte_t *ptep)
+{
+	pte_t pte = ___ptep_get(ptep);
+
+	return pte_napot_clear_pfn(ptep, pte);
+}
+
+static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, pte_t pteval, unsigned int nr)
+{
+	if (unlikely(pte_valid_napot(pteval))) {
+		unsigned int order = ilog2(nr);
+
+		if (!is_napot_order(order)) {
+			/*
+			 * Something's weird, we are given a NAPOT pte but the
+			 * size of the mapping is not a known NAPOT mapping
+			 * size, so clear the NAPOT bit and map this without
+			 * NAPOT support: core mm only manipulates pte with the
+			 * real pfn so we know the pte is valid without the N
+			 * bit.
+			 */
+			pr_err("Incorrect NAPOT mapping, resetting.\n");
+			pteval = pte_clear_napot(pteval);
+		} else {
+			/*
+			 * NAPOT ptes that arrive here only have the N bit set
+			 * and their pfn does not contain the mapping size, so
+			 * set that here.
+			 */
+			pteval = pte_mknapot(pteval, order);
+		}
+	}
+
+	___set_ptes(mm, addr, ptep, pteval, nr);
+}
+
+#define ptep_get			__ptep_get
+#define set_ptes			__set_ptes
+#define set_contptes(mm, addr, ptep, pte, nr, pgsize)			\
+			set_ptes(mm, addr, ptep, pte, nr)
+#else
+#define ptep_get			___ptep_get
+#define __ptep_get			___ptep_get
+#define set_ptes			___set_ptes
+#define __set_ptes			___set_ptes
+
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
+				       unsigned long address, pte_t *ptep)
+{
+	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
+
+	page_table_check_pte_clear(mm, pte);
+
+	return pte;
+}
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 3192ad804279..60b7e738b31a 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -190,7 +190,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 
 	for_each_napot_order(order) {
 		if (shift == napot_cont_shift(order)) {
-			entry = pte_mknapot(entry, order);
+			entry = pte_mkcont(entry);
 			break;
 		}
 	}
@@ -267,8 +267,7 @@ void set_huge_pte_at(struct mm_struct *mm,
 
 	clear_flush(mm, addr, ptep, pgsize, pte_num);
 
-	for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
-		set_pte_at(mm, addr, ptep, pte);
+	set_ptes(mm, addr, ptep, pte, pte_num);
 }
 
 int huge_ptep_set_access_flags(struct vm_area_struct *vma,
@@ -280,7 +279,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long order;
 	pte_t orig_pte;
-	int i, pte_num;
+	int pte_num;
 
 	if (!pte_napot(pte))
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
@@ -295,8 +294,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (pte_young(orig_pte))
 		pte = pte_mkyoung(pte);
 
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
-		set_pte_at(mm, addr, ptep, pte);
+	set_ptes(mm, addr, ptep, pte, pte_num);
 
 	return true;
 }
@@ -324,7 +322,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	pte_t pte = ptep_get(ptep);
 	unsigned long order;
 	pte_t orig_pte;
-	int i, pte_num;
+	int pte_num;
 
 	if (!pte_napot(pte)) {
 		ptep_set_wrprotect(mm, addr, ptep);
@@ -337,8 +335,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	orig_pte = pte_wrprotect(orig_pte);
 
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
-		set_pte_at(mm, addr, ptep, orig_pte);
+	set_ptes(mm, addr, ptep, orig_pte, pte_num);
 }
 
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
