Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591BCC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VuXcIXWrhjL98Acn6PkvriuNtsBxV1grm930wOacmw=; b=201wQxSAv7LEdl
	KMw2rLTRzQSGqi/s+j1t5YO4KLBpAs1Ly8ywAgrzdSNf/0YXLq3MWYhRrgTRIjKdDfg95e6++wBNo
	CGjJJ29xdTh6hkLED3Odw2AnWeaQvcP8IgIgW1k0kaeU4RCVRbE+QBWFUSJlxy3b305nGZWcCkW3h
	/DQ3RadF+LdY0y+bnmpx98S7dsMVuB+BxdwBdttfRrOMtuLwjWc98HX55n8RmJUXcTa5rOR/kUJKS
	p1oz55w0CMuEeCiyg7vZu5v77hyN9HQtTBdGjU+wzrg8ZKcVxASP4OcX2lcPafiNu69b2j4982jv/
	92MURWyD6xj7aaWj/dAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu5J-00000009ExT-1cLt;
	Fri, 02 Aug 2024 15:20:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu5E-00000009Etj-22QV
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:20:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3686b554cfcso4187945f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722612043; x=1723216843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMaYL2MnyzMLNeppKABE7xd1gAuHqwYBgzfb7XbILdY=;
        b=b9YGC0ZYvl2F/xBYyswZgcda0Jp2HdX7fgMUOkcFuA7YNae9O7cobUaHak2QceZEVm
         J9K9aJbqohuSrsM+6IwonPdnwKfHc7zAi+onAuUguNCkJGxRQLmb4WyCqOWDrNMxr6CP
         QmcBWILmD9TWbK+hm78SLrbGOdrxwRAg3EnW49G0c7tJaM2DITdcLec5Hq2cLdZE9K7d
         51xb6FDSgelIAs/2fCyB35tsdYnQs2uk23pv+AnYzN/AR+cvwNNTsxX/B/dDfD0nBWDm
         ay1UPjXbrQ38hcpt5QiImleaMkZIrsc4IX8AYBEjmABtGfoidC9GqUwtjYt4hOHZjgWV
         jxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612043; x=1723216843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMaYL2MnyzMLNeppKABE7xd1gAuHqwYBgzfb7XbILdY=;
        b=gU+sReTbWHQAd+wj33VOGT/haRXTBPxPiDKHpNLWOQAdwash1SB4hQDldJJgh/5UJT
         VbS5HWhvoUZ5N/vKJSyF2e3XXfG3iNPTofq3Bnk7DITiA2R0P1vjIQf8+2aZFY6H4zkH
         3XuwKNpio0F+Ns8AhvMeFqKvDsFUDLyCXOhDvwyBx/JNv6s9EqnFGc0es/mUJJk3uMyz
         TzB1zU/28ncN9VeNweB0Zop6GH5AAaF4zRAF1iV31PfnYsq3y88kp0cj10M4PckFo87Y
         0154WBzOmHq6mpHyQrzp+6QtVm6sDc9JGmEng87iwrlEdTblbRCzNNW7ORvRrjED8zhn
         vrhg==
X-Forwarded-Encrypted: i=1; AJvYcCW1Pj5xvCavzTUBh6RT3ikTodO8qlUAvICE/rqmTLYsU6Blp8TbGhzGXtqDd6xflJotL1Y90x7PW+Xau4rn7rtSOXoAn6sHFKGyRO9MoLlV
X-Gm-Message-State: AOJu0YxG001/xMSB8mQjLyXdo6ItifP/g/PTZ7a0akGbMznwGDy7gVis
	7D3FZDBDJSNbZO/LBOu6tmqkF1n0o/E4geRafvDAanvftS99N5EhsacZaDEYupw=
X-Google-Smtp-Source: AGHT+IGTa0t3MKbLVg4kZPwSxPiJXdJvhDxgkhF/gxXss7ykdb1ycHNk2hMqIUX7HnfDufjyI9Oq4w==
X-Received: by 2002:adf:fc03:0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-36bbc11bb28mr2076124f8f.31.1722612042502;
        Fri, 02 Aug 2024 08:20:42 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd06d078sm2177020f8f.94.2024.08.02.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:20:42 -0700 (PDT)
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
Subject: [PATCH v3 6/9] mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
Date: Fri,  2 Aug 2024 17:14:27 +0200
Message-Id: <20240802151430.99114-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802151430.99114-1-alexghiti@rivosinc.com>
References: <20240802151430.99114-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_082044_553979_F4DA715E 
X-CRM114-Status: GOOD (  20.29  )
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
so move it to the generic code.

Note that get_clear_contig() function is duplicated in the generic and
the arm64 code because it is still used by some arm64 functions that
will, in the next commits, be moved to the generic code. Once all have
been moved, the arm64 version will be removed.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  3 --
 arch/arm64/include/asm/pgtable.h | 15 ++++++++--
 arch/arm64/mm/hugetlbpage.c      | 19 ++-----------
 arch/riscv/include/asm/hugetlb.h |  4 ---
 arch/riscv/include/asm/pgtable.h |  4 ++-
 arch/riscv/mm/hugetlbpage.c      | 23 ++++-----------
 include/linux/hugetlb_contpte.h  |  4 +++
 mm/hugetlb_contpte.c             | 48 ++++++++++++++++++++++++++++++--
 8 files changed, 72 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index fab0afbe4eea..04117a84dc04 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -31,9 +31,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
 				      pte_t pte, int dirty);
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-				     unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 2a6a01b447df..4b277ff9810d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1766,12 +1766,23 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
-static inline int arch_contpte_get_num_contig(pte_t *ptep,
-					      unsigned long size,
+extern int find_num_contig(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, size_t *pgsize);
+
+static inline int arch_contpte_get_num_contig(struct mm_struct *mm,
+					      unsigned long addr,
+					      pte_t *ptep, unsigned long size,
 					      size_t *pgsize)
 {
 	int contig_ptes = 0;
 
+	/*
+	 * If the size is not passed, we need to go through the page table to
+	 * find out the number of contiguous ptes.
+	 */
+	if (size == 0)
+		return find_num_contig(mm, addr, ptep, pgsize);
+
 	if (pgsize)
 		*pgsize = size;
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 495f706e0170..2f3753c10c1f 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -79,8 +79,8 @@ bool arch_hugetlb_migration_supported(struct hstate *h)
 }
 #endif
 
-static int find_num_contig(struct mm_struct *mm, unsigned long addr,
-			   pte_t *ptep, size_t *pgsize)
+int find_num_contig(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, size_t *pgsize)
 {
 	pgd_t *pgdp = pgd_offset(mm, addr);
 	p4d_t *p4dp;
@@ -266,21 +266,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr, pte_t *ptep)
-{
-	int ncontig;
-	size_t pgsize;
-	pte_t orig_pte = __ptep_get(ptep);
-
-	if (!pte_cont(orig_pte))
-		return __ptep_get_and_clear(mm, addr, ptep);
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-
-	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
-}
-
 /*
  * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
  * and write permission.
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index ca9930cdf2e6..0fbb6b19df79 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -20,10 +20,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr, pte_t *ptep);
-
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5ab0559b0bd2..13e89348a46a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -584,7 +584,9 @@ static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 }
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
+static inline int arch_contpte_get_num_contig(struct mm_struct *mm,
+					      unsigned long addr,
+					      pte_t *ptep, unsigned long size,
 					      size_t *pgsize)
 {
 	unsigned long hugepage_shift;
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index e2093e7266a5..b44023336fd9 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -186,7 +186,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
+	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
+
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -200,21 +201,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	return true;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr,
-			      pte_t *ptep)
-{
-	pte_t orig_pte = ptep_get(ptep);
-	int pte_num;
-
-	if (!pte_napot(orig_pte))
-		return ptep_get_and_clear(mm, addr, ptep);
-
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
-
-	return get_clear_contig(mm, addr, ptep, pte_num);
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
@@ -228,7 +214,8 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		return;
 	}
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
+	pte_num = arch_contpte_get_num_contig(mm, addr, ptep, 0, NULL);
+
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
@@ -246,7 +233,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_clear_flush(vma, addr, ptep);
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
+	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
 
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index d9892a047b2b..20d3a3e14e14 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -18,4 +18,8 @@ extern void set_huge_pte_at(struct mm_struct *mm,
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
 
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+				     unsigned long addr, pte_t *ptep);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index b9634ffa1bad..9df98d1a59a1 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -22,6 +22,7 @@
  *   - huge_ptep_get()
  *   - set_huge_pte_at()
  *   - huge_pte_clear()
+ *   - huge_ptep_get_and_clear()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -32,7 +33,7 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
 		return orig_pte;
 
-	ncontig = arch_contpte_get_num_contig(ptep,
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep,
 					      page_size(pte_page(orig_pte)),
 					      NULL);
 
@@ -86,7 +87,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	int i;
 	int ncontig;
 
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
@@ -110,8 +111,49 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 	int i, ncontig;
 	size_t pgsize;
 
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, sz, &pgsize);
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__pte_clear(mm, addr, ptep);
 }
+
+static pte_t get_clear_contig(struct mm_struct *mm,
+			      unsigned long addr,
+			      pte_t *ptep,
+			      unsigned long pgsize,
+			      unsigned long ncontig)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+	unsigned long i;
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
+		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
+
+		/*
+		 * If HW_AFDBM (arm64) or Svadu (riscv) is enabled, then the HW
+		 * could turn on the dirty or accessed bit for any page in the
+		 * set, so check them all.
+		 */
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+	return orig_pte;
+}
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr, pte_t *ptep)
+{
+	int ncontig;
+	size_t pgsize;
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (!pte_cont(orig_pte))
+		return __ptep_get_and_clear(mm, addr, ptep);
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+
+	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
