Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4059C52D70
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osxELyfMI6ydvcJwS/Kf8/ArI3MjXh5g1g7xL1bna7Y=; b=gI58kAEQ3aHCeh
	BRl3kaueEuDh5jDeTvEg6vPCkQhSU+Sj288wOVASv/EKnFLQoBEchIiOqgWT0aB+MTV5gFKI7vMqT
	8sfsHrElvVjh7ebCIDuCcmS7KfayvyrWkLDy4XQO65neOH2QVZHzADHfcEJXc2iTxR3O8/KHj5Wee
	xbJWS+yq4MXETEL7gmvN5wneSS2SEXoF5hDfdqTJ8wckRaXnRwG2XpURyU3Q5wxKbjU6PD/gPUbEE
	le9V70jT9iWXl3heRGbQnKyLw9uAMXV4ukcw4NotPFcI+gyCHrQz3suGPDXfZFy5NdOLzRlX23MwD
	t594EEVZfOQFxtqmIGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu4I-00000009EQO-0wH3;
	Fri, 02 Aug 2024 15:19:46 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu3G-00000009DwR-0veX
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:18:44 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef23d04541so95770211fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722611919; x=1723216719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGB1X3sQQ3LKpfi0jpo5C6FpBS7I6wNMeoGCJ6BimlY=;
        b=bchwAmbIBJJ7n+fxIgHgIpT84H07fmmCo97REbxVULNXf6nvtTzlES/5KWNagPM8+H
         jL+V4M5TKXpux70Cy4Mo1iP9uQGgWm3GAh5miMxwsBRK0AeJW+GLIyDmNr23YIiuPl4J
         OZuHHa4UA9kV9vr2x7wc0ZXmF1qA4WVH8DVWhiTxgeFHyj77gLmPF/zYW+uicSVd7O0e
         r2FOkrMtfDbMtdVA/7hcxZUxUYOFzBnaSwjA7F235MWJpt3RwSccdCZdSS+Kh9ex+p+w
         bSQ2O0VU16vykUc2Co3w2SwjWvw270gBwwGNmvD2PaQiMul2tTZ5EJkLGoQIXY96MPq2
         obng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722611919; x=1723216719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGB1X3sQQ3LKpfi0jpo5C6FpBS7I6wNMeoGCJ6BimlY=;
        b=BRtgS4XrSZXnyr0jnhoLWKilvFKPbqGrYq9sbLgwXnB2c2cDIQIWX8fmoLn2e3ltJB
         WU2mTrplERzK2mUOwComwz97MZXrSiOO4duUb5EmKMZeNfnHEck670lVVrMBBF5h6T7M
         GcLMkYuyvwwS/TX59f7lzgpA+j7pxWiFzJk3ga9Yfgx+UKfIGarFLsR9Yr2tjK+fO395
         dIHPWOlScSN5SgevKM+P611f7oL7NMAGQQphKjVCOgzOeA5B8Hn3cIMvxWzUQQ0UPiNu
         vBG7TIgqKodszACTfjCveCUt6RatDx0SpSFOtkZphwyoRdCkHGuthkpAIYnn40VKfcbX
         gvgA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAuXdwOCWpLAORgh349AwMqm2jed8cAuVK6EZF1fDOoewd+obqt2rb9v2Jj1CQ2xOkSkH2Gf9GUPbweyvJ2KadQgRe8yo6MupU/OEEoxe
X-Gm-Message-State: AOJu0Yww8ACMWCHOqrLFTvQnIgXXlpqjaAMRgUWrYfkwXtqLrko+zW1s
	D5949hqfDn1L9qTUgxOq96gOcncwIUzz9i8r0hA3OkD9g7C8pqD7hSvgAdGtpbw=
X-Google-Smtp-Source: AGHT+IFLYojfl67dZHCnARw4zAZgsB8CSLUwEfcrwOW6i95dP1Od+Eh6wNfB4OrwDg1Qyouoqg9rsQ==
X-Received: by 2002:a2e:b170:0:b0:2ef:1bd5:bac3 with SMTP id 38308e7fff4ca-2f15ab419camr28122861fa.41.1722611918703;
        Fri, 02 Aug 2024 08:18:38 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42824af5410sm97336045e9.1.2024.08.02.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:18:38 -0700 (PDT)
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
Subject: [PATCH v3 4/9] mm: Use common set_huge_pte_at() function for riscv/arm64
Date: Fri,  2 Aug 2024 17:14:25 +0200
Message-Id: <20240802151430.99114-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802151430.99114-1-alexghiti@rivosinc.com>
References: <20240802151430.99114-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_081842_412650_D1E4C7C5 
X-CRM114-Status: GOOD (  20.48  )
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

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  3 --
 arch/arm64/mm/hugetlbpage.c      | 56 -----------------------------
 arch/riscv/include/asm/hugetlb.h |  5 ---
 arch/riscv/include/asm/pgtable.h |  8 +++--
 arch/riscv/mm/hugetlbpage.c      | 62 --------------------------------
 include/linux/hugetlb_contpte.h  |  5 +++
 mm/hugetlb_contpte.c             | 59 ++++++++++++++++++++++++++++++
 7 files changed, 69 insertions(+), 129 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 80d25b4eff25..d35093b7ab59 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -27,9 +27,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-			    pte_t *ptep, pte_t pte, unsigned long sz);
 #define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
 extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 58cb5e06dcb2..c7130d1f07c4 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -145,62 +145,6 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
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
-		__ptep_get_and_clear(mm, addr, ptep);
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
-			__set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	if (!pte_cont(pte)) {
-		__set_ptes(mm, addr, ptep, pte, 1);
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
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-}
-
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, unsigned long sz)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index d9f9bfb84908..28cbf5d761e1 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -24,11 +24,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 		    pte_t *ptep, unsigned long sz);
 
-#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm,
-		     unsigned long addr, pte_t *ptep, pte_t pte,
-		     unsigned long sz);
-
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 412ccebcdee9..46b409e558b3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -628,9 +628,8 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long addre
 extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
 				     pte_t *ptep);
 
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+					 unsigned long address, pte_t *ptep)
 {
 	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
 
@@ -730,6 +729,9 @@ static inline pte_t ptep_get(pte_t *ptep)
 #define ptep_get			__ptep_get
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+#define ptep_get_and_clear	__ptep_get_and_clear
+
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index d51863824540..0ecb2846c3f0 100644
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
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index ec4189cd65b8..7acd734a75e8 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -9,4 +9,9 @@
 #define __HAVE_ARCH_HUGE_PTEP_GET
 extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+extern void set_huge_pte_at(struct mm_struct *mm,
+			    unsigned long addr, pte_t *ptep, pte_t pte,
+			    unsigned long sz);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index 0e3ba6f97c58..9a3a376784b0 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -10,6 +10,8 @@
 /*
  * Any arch that wants to use that needs to define:
  *   - __ptep_get()
+ *   - __set_ptes()
+ *   - __ptep_get_and_clear()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -17,6 +19,7 @@
 /*
  * This file implements the following contpte aware API:
  *   - huge_ptep_get()
+ *   - set_huge_pte_at()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -42,3 +45,59 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
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
+		__ptep_get_and_clear(mm, addr, ptep);
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
+			__set_ptes(mm, addr, ptep, pte, 1);
+		return;
+	}
+
+	if (!pte_cont(pte)) {
+		__set_ptes(mm, addr, ptep, pte, 1);
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
