Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28397C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ic8gYaanvzZa3YbFASA0kBVw2Z0ik+/fbPzTb67tjl4=; b=ucFk/CmOKSm9T4
	O+LWPQi5SFUOcc4zImoX7mn2mX7H6O66V4DilsukP4Sdo8RyHzMwsSf44N9lXiiBPGRqxUmNVIiEM
	GiF8USU6rBGtvkANAP1txZ73pcHeRIlYZ/oaemomEVXl0trxMEJ07TRBWCLszJWB3FaGJ2IXNZz8t
	aUGG5L1OsVj+VtMfju5wUqByCIr9U2UxnPc1+jZbGrEWF0bPg2w9wKney7OKYFJ3Gw2lPiAdRbjW6
	QoQt1XTtH2tyxD7uKpgcVq76Q+CGE0Ltb3KcEwtYVUGzvLevP7pMj+HHNAaAkzjrbVrc5wXfHvhxU
	NT6XTCJ/dwt0dJIsR5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz33-0000000H6S2-3Vw0;
	Fri, 01 Mar 2024 09:19:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz31-0000000H6Pb-0cgP
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:19:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-412a9e9c776so17902785e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709284756; x=1709889556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mB8cpSFUHI2v28tFlR/YUHSb5lk45+n/9IYk3vd50wk=;
        b=yO44BNRqjdmhweskNbJYRv+vg2WQJ6F+t1LZ4Em/vJKWChXq6X4JeN1W9AXqs4G+qj
         953cIWfP57c2WoUXa67fDM10tg6EtUDKE0G9Y3y3O3oO+ZC5RBuQexWgBUraOqRuADVK
         tpCgqDE7NxipQij8O+tUW5dIoWPh8N5S/Ft8PLZ64N71kiVP0SvuR5kAJZNNEkkZMeKz
         S4fENVJPhu2Zl7Pc98U1jET7o5zPUg509mJS/dQoR1PVgH0U40OTJx779hyRJpesqA6M
         gxZCkvPoEmZmuWsjThdGyJppVSWUxfyGO4Qnr8FHBVePGPnjez3e8U2FgF/PmzyUnDgv
         PfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709284756; x=1709889556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mB8cpSFUHI2v28tFlR/YUHSb5lk45+n/9IYk3vd50wk=;
        b=hWzKBlgmY3oyiHiAoanEi4QML6cODrmTpzzB/yXy2SnBGavnT8USie8AzJHxWRsnyf
         HBN17q2pGSoxmr69PZ4gDt3xN2f5xgBWL2j3yR0EUOzqiNmpLW1vDipwXuKy9/HbfcvH
         nFfZzpPO1xPev6x+PXL2c12W8TBq6uokHnkCC8Pa0a00Tlj14Ka2SZm3wHbFeYiisWxL
         9/fK13fpLQIlIAzZhjFLFKnc3Y8d67I6T+1SwXQHAVqypl4yJOzjjLQawYpsQo+6foNp
         4uYOUN073be//dKDS4nE2WLFmFWqSW/DZgKldiFyHFaHnL0Ks2MiHERIWin/1fOTXqq0
         OuCg==
X-Forwarded-Encrypted: i=1; AJvYcCWBJpv5BBqZFCX2OGM1XHvta74PyOiW5vPmveNLLLPJsgUOZn7k+kUnQInJq0SXMe9Hr3WapWSkkSDCzW5BD8/C0F+cOB1IxdbU+WjvXm+w
X-Gm-Message-State: AOJu0YyBZsXKsdUFmxAR4C/kzwrIl3dNuxL85bRwAGin4ZhYZ+59aMGm
	5mVp0ZIMmP7jzNKWlYtSWY5icAO2WCUgDsXg9vQAClug8Ft94J4+heqmbq8nu70=
X-Google-Smtp-Source: AGHT+IHpEyM7pTJk28YugLtMmnzHnlZqFOrfhIPrp2GM/yv98BwZmlX0jtBa8/Iqo86IkfuCuT/7uw==
X-Received: by 2002:adf:9dca:0:b0:33e:1a3f:44b4 with SMTP id q10-20020adf9dca000000b0033e1a3f44b4mr1239957wre.26.1709284756335;
        Fri, 01 Mar 2024 01:19:16 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id bv16-20020a0560001f1000b0033e0523b829sm4144440wrb.13.2024.03.01.01.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:19:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 4/9] mm: Use common set_huge_pte_at() function for riscv/arm64
Date: Fri,  1 Mar 2024 10:14:50 +0100
Message-Id: <20240301091455.246686-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240301091455.246686-1-alexghiti@rivosinc.com>
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_011919_216976_3BD443CE 
X-CRM114-Status: GOOD (  22.28  )
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

After some adjustments, both architectures have the same implementation
so move it to generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 16 ++++++---
 arch/arm64/mm/hugetlbpage.c      | 56 -----------------------------
 arch/riscv/include/asm/pgtable.h | 26 ++++++++++----
 arch/riscv/mm/hugetlbpage.c      | 62 --------------------------------
 mm/contpte.c                     | 58 ++++++++++++++++++++++++++++++
 5 files changed, 88 insertions(+), 130 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3003a10547de..437e9638b2b9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -341,9 +341,10 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 		mte_sync_tags(pte, nr_pages);
 }
 
-static inline void set_ptes(struct mm_struct *mm,
-			    unsigned long __always_unused addr,
-			    pte_t *ptep, pte_t pte, unsigned int nr)
+static inline void __set_ptes(struct mm_struct *mm,
+			      unsigned long __always_unused addr,
+			      pte_t *ptep, pte_t pte, unsigned int nr,
+			      unsigned long pgsize)
 {
 	page_table_check_ptes_set(mm, ptep, pte, nr);
 	__sync_cache_and_tags(pte, nr);
@@ -354,10 +355,15 @@ static inline void set_ptes(struct mm_struct *mm,
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte_val(pte) += PAGE_SIZE;
+		pte_val(pte) += pgsize;
 	}
 }
-#define set_ptes set_ptes
+
+#define set_ptes(mm, addr, ptep, pte, nr)				\
+			__set_ptes(mm, addr, ptep, pte, nr, PAGE_SIZE)
+
+#define set_contptes(mm, addr, ptep, pte, nr, pgsize)			\
+			__set_ptes(mm, addr, ptep, pte, nr, pgsize)
 
 /*
  * Huge pte definitions.
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 6b61714d7726..4da951e81bde 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -166,62 +166,6 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
 	return orig_pte;
 }
 
-/*
- * Changing some bits of contiguous entries requires us to follow a
- * Break-Before-Make approach, breaking the whole contiguous set
- * before we can change any entries. See ARM DDI 0487A.k_iss10775,
- * "Misprogramming of the Contiguous bit", page D4-1762.
- *
- * This helper performs the break step for use cases where the
- * original pte is not needed.
- */
-static void clear_flush(struct mm_struct *mm,
-			     unsigned long addr,
-			     pte_t *ptep,
-			     unsigned long pgsize,
-			     unsigned long ncontig)
-{
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-	unsigned long i, saddr = addr;
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		ptep_clear(mm, addr, ptep);
-
-	flush_tlb_range(&vma, saddr, addr);
-}
-
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-			    pte_t *ptep, pte_t pte, unsigned long sz)
-{
-	size_t pgsize;
-	int i;
-	int ncontig;
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
-
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-
-	if (!pte_present(pte)) {
-		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
-			set_pte_at(mm, addr, ptep, pte);
-		return;
-	}
-
-	if (!pte_cont(pte)) {
-		set_pte_at(mm, addr, ptep, pte);
-		return;
-	}
-
-	pfn = pte_pfn(pte);
-	dpfn = pgsize >> PAGE_SHIFT;
-	hugeprot = pte_pgprot(pte);
-
-	clear_flush(mm, addr, ptep, pgsize, ncontig);
-
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		set_pte_at(mm, addr, ptep, pfn_pte(pfn, hugeprot));
-}
-
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, unsigned long sz)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ddff4a56e12d..03f8ced8b26a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -533,29 +533,39 @@ static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
 static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
 					      size_t *pgsize)
 {
+	unsigned long hugepage_shift;
 	pte_t __pte;
 
 	/* We must read the raw value of the pte to get the size of the mapping */
 	__pte = READ_ONCE(*ptep);
 
-	if (pgsize) {
-		if (size >= PGDIR_SIZE)
+	if (size >= PGDIR_SIZE) {
+		if (pgsize)
 			*pgsize = PGDIR_SIZE;
-		else if (size >= P4D_SIZE)
+		hugepage_shift = PGDIR_SHIFT;
+	} else if (size >= P4D_SIZE) {
+		if (pgsize)
 			*pgsize = P4D_SIZE;
-		else if (size >= PUD_SIZE)
+		hugepage_shift = P4D_SHIFT;
+	} else if (size >= PUD_SIZE) {
+		if (pgsize)
 			*pgsize = PUD_SIZE;
-		else if (size >= PMD_SIZE)
+		hugepage_shift = PUD_SHIFT;
+	} else if (size >= PMD_SIZE) {
+		if (pgsize)
 			*pgsize = PMD_SIZE;
-		else
+		hugepage_shift = PMD_SHIFT;
+	} else {
+		if (pgsize)
 			*pgsize = PAGE_SIZE;
+		hugepage_shift = PAGE_SHIFT;
 	}
 
 	/* Make sure __pte is not a swap entry */
 	if (pte_valid_napot(__pte))
 		return napot_pte_num(napot_cont_order(__pte));
 
-	return 1;
+	return size >> hugepage_shift;
 }
 #endif
 
@@ -631,6 +641,8 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 	}
 }
 #define set_ptes set_ptes
+#define set_contptes(mm, addr, ptep, pte, nr, pgsize)			\
+			set_ptes(mm, addr, ptep, pte, nr)
 
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 51ec80cf2028..ebc735f5d325 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -173,68 +173,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-static void clear_flush(struct mm_struct *mm,
-			unsigned long addr,
-			pte_t *ptep,
-			unsigned long pgsize,
-			unsigned long ncontig)
-{
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-	unsigned long i, saddr = addr;
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		ptep_get_and_clear(mm, addr, ptep);
-
-	flush_tlb_range(&vma, saddr, addr);
-}
-
-/*
- * When dealing with NAPOT mappings, the privileged specification indicates that
- * "if an update needs to be made, the OS generally should first mark all of the
- * PTEs invalid, then issue SFENCE.VMA instruction(s) covering all 4 KiB regions
- * within the range, [...] then update the PTE(s), as described in Section
- * 4.2.1.". That's the equivalent of the Break-Before-Make approach used by
- * arm64.
- */
-void set_huge_pte_at(struct mm_struct *mm,
-		     unsigned long addr,
-		     pte_t *ptep,
-		     pte_t pte,
-		     unsigned long sz)
-{
-	unsigned long hugepage_shift, pgsize;
-	int i, pte_num;
-
-	if (sz >= PGDIR_SIZE)
-		hugepage_shift = PGDIR_SHIFT;
-	else if (sz >= P4D_SIZE)
-		hugepage_shift = P4D_SHIFT;
-	else if (sz >= PUD_SIZE)
-		hugepage_shift = PUD_SHIFT;
-	else if (sz >= PMD_SIZE)
-		hugepage_shift = PMD_SHIFT;
-	else
-		hugepage_shift = PAGE_SHIFT;
-
-	pte_num = sz >> hugepage_shift;
-	pgsize = 1 << hugepage_shift;
-
-	if (!pte_present(pte)) {
-		for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
-			set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	if (!pte_napot(pte)) {
-		set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	clear_flush(mm, addr, ptep, pgsize, pte_num);
-
-	set_ptes(mm, addr, ptep, pte, pte_num);
-}
-
 int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr,
 			       pte_t *ptep,
diff --git a/mm/contpte.c b/mm/contpte.c
index c3f4b8039b19..f7bfa861c6a1 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -12,11 +12,13 @@
  * * contpte macros
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
+ *   - set_contptes()
  */
 
 /*
  * This file implements the following contpte aware API:
  * huge_ptep_get()
+ * set_huge_pte_at()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -43,3 +45,59 @@ pte_t huge_ptep_get(pte_t *ptep)
 	}
 	return orig_pte;
 }
+
+/*
+ * ARM64: Changing some bits of contiguous entries requires us to follow a
+ * Break-Before-Make approach, breaking the whole contiguous set
+ * before we can change any entries. See ARM DDI 0487A.k_iss10775,
+ * "Misprogramming of the Contiguous bit", page D4-1762.
+ *
+ * RISCV: When dealing with NAPOT mappings, the privileged specification
+ * indicates that "if an update needs to be made, the OS generally should first
+ * mark all of the PTEs invalid, then issue SFENCE.VMA instruction(s) covering
+ * all 4 KiB regions within the range, [...] then update the PTE(s), as
+ * described in Section 4.2.1.". That's the equivalent of the Break-Before-Make
+ * approach used by arm64.
+ *
+ * This helper performs the break step for use cases where the
+ * original pte is not needed.
+ */
+static void clear_flush(struct mm_struct *mm,
+			unsigned long addr,
+			pte_t *ptep,
+			unsigned long pgsize,
+			unsigned long ncontig)
+{
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long i, saddr = addr;
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
+		ptep_clear(mm, addr, ptep);
+
+	flush_tlb_range(&vma, saddr, addr);
+}
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		     pte_t *ptep, pte_t pte, unsigned long sz)
+{
+	size_t pgsize;
+	int i;
+	int ncontig;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	if (!pte_present(pte)) {
+		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
+			set_pte_at(mm, addr, ptep, pte);
+		return;
+	}
+
+	if (!pte_cont(pte)) {
+		set_pte_at(mm, addr, ptep, pte);
+		return;
+	}
+
+	clear_flush(mm, addr, ptep, pgsize, ncontig);
+
+	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
