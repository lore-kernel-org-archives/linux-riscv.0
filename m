Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569CAC02190
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKytl+WBMvweVjrRNrBuIz4WptmEU6RwCsjHprIHUF8=; b=oVuFEPKdiB6xGG
	Rnzn/8c0JvpnKgzX4s6EfRdJgGEIcsk6riP9nv78zkqqkH7WeAyRvEOSlPXg6HyaZv2vXzzYdUuAz
	NVCNE7wHqmqY2ULgFRzTOPRb2nrYIL306HG9tkwKek+ZAoFGjiZBzc7QZ+EANxmDrhbAEZqR86Z4g
	o3ajgVDZ+M18gtobR88q14ppUGmdu8RfVmLUwOR59YMrtzwQFdJi6A/NMeIzsrZovcf+bLt7q/WLc
	9t0ObTSBKh0oclduUT6Dq3nVsFiPJVzeZS+b5j3ilGqBwFxKS2Yi7dQBHJVsSf9ib4eKFUyPX9hLB
	P/NdyDsYDcFa4W21hjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLfq-000000023Rr-46vv;
	Mon, 27 Jan 2025 09:44:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLds-00000002302-1uAr
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 09:42:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so48504705e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 01:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970971; x=1738575771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkmyUQAgkdeDfCGOVLuC8IWvmfEC8o5jHyW1gtJjCzs=;
        b=Mp8/ysZkGLTnOSR8t40ymYnbHsuleB/vMyKPbI7FCVenFIgm7S1Z1cjbnNtxkH1Z2H
         zI+lEMBMOdvBiZbEP+0wbRJSqYpgW2FccTXQ54Fp0+5yOTFYBf1eSqmqRHvp3ubMH6Pt
         twQjiOBfiOw9mc97x8FB84ttA/FJITdDfR1aS4Bjyv7pYcytyh//NwjMvByh2OSaqiFE
         CLsCwdxYRP3nfMcPX2il9YFWnXcS42ww9m2P7wjtRd2v1Dj+PoHFbYoY1oNjsQu1FbVX
         6wKMDvi8A2i2+llN/+VCDDrMuh5QMDJ9ytsRrXcUe4ddqwIwmw6txL/JZwfyNmqnLBNI
         PbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970971; x=1738575771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkmyUQAgkdeDfCGOVLuC8IWvmfEC8o5jHyW1gtJjCzs=;
        b=mzVHeaVj/jBPEiPLuOHQAGZogMYAduiUaO94A268PcuD9puJtNkCy/RAn+ZjrWCx4t
         psxIbWlreW9+tvMu4qIMeCb+XtFuMvWLDOf420iBvTAK8Ep0tQImv7PooWJzYv1zictk
         1T1kCWgdyI7ceUxpR0JG5Nm2ZdaG443OMBZSZtYIDw1BKpwYtH0Xg54yYtOGHlFYVHsq
         MrQU7bU5H1Up/PlfNayI0wZ4ZPg5dvZoLOKtuVtNfQ6+OJZoxincjqgBmUMPdU//375w
         ebKNwrZJheG8rQymCWXSbFUrw3UGZElVy5EoNTHekbobr6JIhWbJnOyzGHD+wzz112Ox
         zamw==
X-Forwarded-Encrypted: i=1; AJvYcCUS0cAdpKwp4/OK9H77xlyw6tUZGhyMXcAGctsYuZgknpecQw7M87uOHyw/7ts/QKMXzuO67XPVlGuDUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9uHw9UUz1VNx9iMYMxSqRxyqys2QZvZVXO0PVuVJiztGWLujM
	0iKBlJJwS7qlH0PW+DMSkP6IOhuFoHGLGz9gSnV1PqVR39CoBxiwF+O+m9/SlKc=
X-Gm-Gg: ASbGncuCIh2YwGd/0sDqVrdnRdJRTUxozqCCVz9CQTw7mNy6VtuS8B4h956e8DvSlFv
	cWZ/yYZHwPlOCfsmzlb6fMlj89VlJ1iXHYSvoJsQkDH3N0a99dY3jwCk/b3rcrG8cMW/4ktIpcp
	4heyvPlVCZTmiMcpDt+LQJW5+YBPXQaoi/M2oKIRNJVB0q0dYY0gcmusi61oRBAL7hRa7NBDA0/
	bxkCEkdJesTXVVxEZR7gaKuFv94DCKAijmNAsYTMsMi7jzECDB8ox1hoJW87b1TgfChCvCyAv3I
	cOV1n3sgxYRa9PJpz8xXmcyDKGaPrpM=
X-Google-Smtp-Source: AGHT+IFkGD+876PDgJO8tAmQAHU0ol+3F5plCgX8+RfXXi3SGv5kqaXmgh3Sp+SaS77G8Nc/FNbA7g==
X-Received: by 2002:a05:6000:1ac6:b0:385:f07b:93da with SMTP id ffacd0b85a97d-38bf57bf69bmr33979049f8f.47.1737970970947;
        Mon, 27 Jan 2025 01:42:50 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6edsm10380540f8f.40.2025.01.27.01.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:42:50 -0800 (PST)
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
Subject: [PATCH v4 7/9] mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:28 +0100
Message-Id: <20250127093530.19548-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_014252_523668_0D6D3FDF 
X-CRM114-Status: GOOD (  22.37  )
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
index 5c605a0a2017..654f5f2f03a3 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -35,10 +35,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
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
index 0b7a53fee55d..643ba2043f0f 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -277,71 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
index 705d666e014d..290d5fbfe031 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -629,9 +629,8 @@ static inline void __pte_clear(struct mm_struct *mm,
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
@@ -740,6 +739,8 @@ static inline pte_t ptep_get(pte_t *ptep)
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
index 4ae67324f992..af8b3769a349 100644
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
 	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
 		 : : : : svvptc);
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
index 0c86c6f77c29..49950c1ce615 100644
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
