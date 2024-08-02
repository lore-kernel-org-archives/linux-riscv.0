Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95EDC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8nehsw/xbgokP97bttEbOsl89yy07zBo9S8Ol6Qb+Q=; b=CS6WxbbwMzQnS1
	PtgV6wHnDs9MZm442r0pZ/dMeIb4hQVi/oRXwZ4jzu9enbIo3mtRDUCOx+++OQPkoJOZpHznAnzP3
	pz7mqgphn4Ba/RE/XLlTSlR9zYZZZm020VwLthoz6AvjtakWL0nHU+Qf5cQyVEhXw+XPtUfmlioD0
	BTGmjgfPCQgGFa4orXOpOwN2DlDolcNa71QlrVeNiOajh/M0xaRYRNJ55TevAOiApRw3IzKQFmNCv
	w4uktjmFm003M7SVNcHt1WGpu7sPbzVg853rpSLBjxYNhfZ2kYbXuceYDrtjUhG3W7sbI1N7wVKxy
	Sl9HrIYd3Ti/euU3CvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuAa-00000009H1x-2MEF;
	Fri, 02 Aug 2024 15:26:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu6E-00000009FNW-18JD
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:21:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42809d6e719so56360925e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722612104; x=1723216904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJwxj4Q/epTCsuuoDx5TluW633PRo5bWcwGJkWSnI+E=;
        b=mK2LMcrGEiElyCzQR1fVk7TfekTuWSTRu5uhEkxN/kI46RTF78iUpPjK4HaoyUbIMq
         Cvbfp2U6BUTmccCdwwzdH4WFt8bMNsA9rt0kcUPE9WljEFqYkkFlYxzoMeHX801u/iGi
         zytdohRhtMN9ZUSycMSNyLsjMqhh4PW0oxAeoY/5ybRvc7hrRO9nusVTXD6Sr9SGBHwA
         qp+X5YVuYx4d9ozeAAeaUkVu7fWwpeGLcdHNuP3bqrpPNiNhbpQxIWU0b4sGsP/lU/RD
         dMof3pGdOMt1XksMdVprxauV6y6kKE4jAeKIXiXSgyLCSplDTXM5pcKy49nZ0PplPZjE
         35oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612104; x=1723216904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJwxj4Q/epTCsuuoDx5TluW633PRo5bWcwGJkWSnI+E=;
        b=ptSaqsJyIwzQDz1dL/rdmJL2/5D+dHK2NlDG2S4sWYgqJ7hxhyz0KOkB7UU2XRKGYa
         9MOjC50wor3C8BLnQ339+R2fID7b/taD6oVA9KektY2iKotUHBbyFr5RkBO3lIeU+Yvr
         q/roa4u/2z30tMW6EMFoAT6T4pZOadOAhM6n+qsEwH7YHriFuXEJV/3N9Mz826zA3V2D
         ZDcwnXulHwDU0UNcsQK8WeB/lDo9mvURRDV8LxGrZVP4nnEoPsfdV8m2VcuD2eH/IJVp
         umyulp4Z5LUX5ugMT1dR35f0CfWGw0RjCUMS1KTO6+loWd2EOIxT5vgBBjXEkk/YHZ/K
         uCeA==
X-Forwarded-Encrypted: i=1; AJvYcCXxK2VC1ehHTfvuDVJ0dLinf0MlkOl5St2v6T8RmrHGSHbhCFagTT/gYwh2Nzr5TmtQHyYgKm4XLaz+k7rJ42r5Ktal0sH6vJMOBIY6d5tb
X-Gm-Message-State: AOJu0Yxu+108mcRHbUIH3AFlFjQSn4JnsYCHSH85xGGAlYBvgQ6kVf4f
	2Irg7u4l9HiWx1svRoUlga6RXpW20QjxZL+cZA0w/q+T9uoPwcFlZweWrXPee+k=
X-Google-Smtp-Source: AGHT+IHs8c35/MVJPJWHbhThNLdZDWmclnMPyTlHp9e2Mj7pB+l3jgAdGFRRGTJ474zJ6huZaRujOg==
X-Received: by 2002:a05:600c:a45:b0:428:1694:bd8c with SMTP id 5b1f17b1804b1-428e6b938dcmr22007775e9.37.1722612103839;
        Fri, 02 Aug 2024 08:21:43 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb9d464sm98619985e9.42.2024.08.02.08.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:21:43 -0700 (PDT)
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
Subject: [PATCH v3 7/9] mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
Date: Fri,  2 Aug 2024 17:14:28 +0200
Message-Id: <20240802151430.99114-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802151430.99114-1-alexghiti@rivosinc.com>
References: <20240802151430.99114-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_082146_357442_D796E138 
X-CRM114-Status: GOOD (  22.80  )
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

Both architectures have almost the same implementation:
__cont_access_flags_changed() is also correct on riscv and brings the
same benefits (ie don't do anything if the flags are unchanged).

As in the previous commit, get_clear_contig_flush() is duplicated in both
the arch and the generic codes, it will be removed from the arch code when
the last reference there gets moved to the generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  4 --
 arch/arm64/mm/hugetlbpage.c      | 65 ---------------------------
 arch/riscv/include/asm/hugetlb.h |  5 ---
 arch/riscv/include/asm/pgtable.h |  7 +--
 arch/riscv/mm/hugetlbpage.c      | 28 ------------
 arch/riscv/mm/pgtable.c          |  6 +--
 include/linux/hugetlb_contpte.h  |  5 +++
 mm/hugetlb_contpte.c             | 75 ++++++++++++++++++++++++++++++++
 8 files changed, 87 insertions(+), 108 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 04117a84dc04..6b84e287b72d 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -27,10 +27,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
-extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
-				      unsigned long addr, pte_t *ptep,
-				      pte_t pte, int dirty);
 #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 2f3753c10c1f..658635022e4d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -266,71 +266,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-/*
- * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
- * and write permission.
- *
- * For a contiguous huge pte range we need to check whether or not write
- * permission has to change only on the first pte in the set. Then for
- * all the contiguous ptes we need to check whether or not there is a
- * discrepancy between dirty or young.
- */
-static int __cont_access_flags_changed(pte_t *ptep, pte_t pte, int ncontig)
-{
-	int i;
-
-	if (pte_write(pte) != pte_write(__ptep_get(ptep)))
-		return 1;
-
-	for (i = 0; i < ncontig; i++) {
-		pte_t orig_pte = __ptep_get(ptep + i);
-
-		if (pte_dirty(pte) != pte_dirty(orig_pte))
-			return 1;
-
-		if (pte_young(pte) != pte_young(orig_pte))
-			return 1;
-	}
-
-	return 0;
-}
-
-int huge_ptep_set_access_flags(struct vm_area_struct *vma,
-			       unsigned long addr, pte_t *ptep,
-			       pte_t pte, int dirty)
-{
-	int ncontig, i;
-	size_t pgsize = 0;
-	unsigned long pfn = pte_pfn(pte), dpfn;
-	struct mm_struct *mm = vma->vm_mm;
-	pgprot_t hugeprot;
-	pte_t orig_pte;
-
-	if (!pte_cont(pte))
-		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
-
-	if (!__cont_access_flags_changed(ptep, pte, ncontig))
-		return 0;
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-
-	/* Make sure we don't lose the dirty or young state */
-	if (pte_dirty(orig_pte))
-		pte = pte_mkdirty(pte);
-
-	if (pte_young(orig_pte))
-		pte = pte_mkyoung(pte);
-
-	hugeprot = pte_pgprot(pte);
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-
-	return 1;
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 0fbb6b19df79..bf533c2cef84 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -28,11 +28,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr, pte_t *ptep);
 
-#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
-int huge_ptep_set_access_flags(struct vm_area_struct *vma,
-			       unsigned long addr, pte_t *ptep,
-			       pte_t pte, int dirty);
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 13e89348a46a..5d9b051ac51c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -623,9 +623,8 @@ static inline void __pte_clear(struct mm_struct *mm,
 	__set_pte_at(mm, ptep, __pte(0));
 }
 
-#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS	/* defined in mm/pgtable.c */
-extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
-				 pte_t *ptep, pte_t entry, int dirty);
+extern int __ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
+				   pte_t *ptep, pte_t entry, int dirty);
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG	/* defined in mm/pgtable.c */
 extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
 				     pte_t *ptep);
@@ -734,6 +733,8 @@ static inline pte_t ptep_get(pte_t *ptep)
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
 #define pte_clear		__pte_clear
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+#define ptep_set_access_flags	__ptep_set_access_flags
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index b44023336fd9..0e2ca7327479 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -173,34 +173,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-int huge_ptep_set_access_flags(struct vm_area_struct *vma,
-			       unsigned long addr,
-			       pte_t *ptep,
-			       pte_t pte,
-			       int dirty)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	pte_t orig_pte;
-	int pte_num;
-
-	if (!pte_napot(pte))
-		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
-
-	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-
-	if (pte_dirty(orig_pte))
-		pte = pte_mkdirty(pte);
-
-	if (pte_young(orig_pte))
-		pte = pte_mkyoung(pte);
-
-	set_ptes(mm, addr, ptep, pte, pte_num);
-
-	return true;
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 533ec9055fa0..e86df7ef193c 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -5,9 +5,9 @@
 #include <linux/kernel.h>
 #include <linux/pgtable.h>
 
-int ptep_set_access_flags(struct vm_area_struct *vma,
-			  unsigned long address, pte_t *ptep,
-			  pte_t entry, int dirty)
+int __ptep_set_access_flags(struct vm_area_struct *vma,
+			    unsigned long address, pte_t *ptep,
+			    pte_t entry, int dirty)
 {
 	if (!pte_same(ptep_get(ptep), entry))
 		__set_pte_at(vma->vm_mm, ptep, entry);
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index 20d3a3e14e14..fea47035ac38 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -22,4 +22,9 @@ extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 				     unsigned long addr, pte_t *ptep);
 
+#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
+extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+				      unsigned long addr, pte_t *ptep,
+				      pte_t pte, int dirty);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index 9df98d1a59a1..21f5c89daa6b 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -13,6 +13,7 @@
  *   - __set_ptes()
  *   - __ptep_get_and_clear()
  *   - __pte_clear()
+ *   - __ptep_set_access_flags()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -23,6 +24,7 @@
  *   - set_huge_pte_at()
  *   - huge_pte_clear()
  *   - huge_ptep_get_and_clear()
+ *   - huge_ptep_set_access_flags()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -157,3 +159,76 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 
 	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
 }
+
+/*
+ * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
+ * and write permission.
+ *
+ * For a contiguous huge pte range we need to check whether or not write
+ * permission has to change only on the first pte in the set. Then for
+ * all the contiguous ptes we need to check whether or not there is a
+ * discrepancy between dirty or young.
+ */
+static int __cont_access_flags_changed(pte_t *ptep, pte_t pte, int ncontig)
+{
+	int i;
+
+	if (pte_write(pte) != pte_write(__ptep_get(ptep)))
+		return 1;
+
+	for (i = 0; i < ncontig; i++) {
+		pte_t orig_pte = __ptep_get(ptep + i);
+
+		if (pte_dirty(pte) != pte_dirty(orig_pte))
+			return 1;
+
+		if (pte_young(pte) != pte_young(orig_pte))
+			return 1;
+	}
+
+	return 0;
+}
+
+static pte_t get_clear_contig_flush(struct mm_struct *mm,
+				    unsigned long addr,
+				    pte_t *ptep,
+				    unsigned long pgsize,
+				    unsigned long ncontig)
+{
+	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+
+	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
+	return orig_pte;
+}
+
+int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+			       unsigned long addr, pte_t *ptep,
+			       pte_t pte, int dirty)
+{
+	int ncontig;
+	size_t pgsize = 0;
+	struct mm_struct *mm = vma->vm_mm;
+	pte_t orig_pte;
+
+	if (!pte_cont(pte))
+		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+
+	ncontig = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
+
+	if (!__cont_access_flags_changed(ptep, pte, ncontig))
+		return 0;
+
+	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+
+	/* Make sure we don't lose the dirty or young state */
+	if (pte_dirty(orig_pte))
+		pte = pte_mkdirty(pte);
+
+	if (pte_young(orig_pte))
+		pte = pte_mkyoung(pte);
+
+	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
+
+	return 1;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
