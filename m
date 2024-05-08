Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90FAC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oARgQO6gtab+MhmCmpqysLl3BRI8UfLKIfZ5WAHSYM=; b=nW8mNi2WjCyOk5
	x6IFII+0S86OjE0K0SBM3aGPz+S0XvQXy4gWgLv/fqAgcirs+4IuVRX+VPuN/udKpsDIGhya1xhOZ
	Q7DxsqkE28Gkl4xyGkl4gvxE1EYY+YYKpO9+lxHkAPxkEgUUAenZ0ZQqdDuBbbAZcgs8CGwDatAm+
	uSLHbFzh/ILgoKj3Z08CtnQYnb1UhTUMQcawge14ipsMrxFv2avri6fOlBVNN4JqRPO2Zwxv0Z56b
	9R9b+3ubjGq9x0SNx/524ZHKNCpnrN1ANseD0CwFvbeGgIx3rcHQ04ifpl3Xg1CN6K2RDNQ5JygvV
	AwBvC1za7N3J8n4kVPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fPk-0000000FD5s-3al7;
	Wed, 08 May 2024 11:24:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fPh-0000000FD4i-2cLH
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:24:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-34e0d47bd98so379808f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715167484; x=1715772284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7TbOelFCBPjD//aDEZ907vn9YCYdQxapVfhTuFqwGo=;
        b=ctyTEpv3mBmkPMRTYZ6iZOl6dwt50g3QIoTwIkL7cDMph+wGhH4IV+DU40YPbafBdk
         NRPmLJzPAS5DHqGzedTl/fsfEv3bneIQ9WTIZIUI0DV4os0llgS4kxonOcZIHqAuirZZ
         SxtyJk8Y12E0IKUCMeLUzOXT1RpY2KmKM6ZLvozMIXE6ZgnvqCGIxxiw/FZFkVpaeTdO
         /YWnqwLcYQkCcmhtfXQt/WbyV+SpXS2Ijs/Vg1e0OyTI+wQekm7VnkzlvGF/gygC2iQv
         EwQvrkwBLdCJSJLygWrLSRtdTna171jHPxbl5ts+vS2ciPPZt/YEVgVKMPiLb81IvB2A
         QuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167484; x=1715772284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7TbOelFCBPjD//aDEZ907vn9YCYdQxapVfhTuFqwGo=;
        b=PlgTDLdSAIMLArOM3V9YEdEFWVJQ8tXDsEakPKH6OnHOxehg7sMVjyoxGwIrj1w6K3
         JXc5ZH6CN9VvZE60aOiZqa3y1YJeNw9/t4b1ttIQfkYv0Zr9aYv9f/Q1iDJqVfQGF6jQ
         6WAmtTCpCmDaVjvrIH9XU8qzWOL4ltAck1TfViY/+Cz5dw2ESHRaGO0Nzh3TiZ7sC23c
         W/dPQrfgEZfFaQ+PAHF5UULNPEC78i+41q8XEah5BpnOpNBoMOGlzJRx4YrSFQBlpyuM
         s2/DnGxaOj9dQ1eY/vthAL/6EJjEdWvEJi5tMItYJzRogER3P+R+READcemaRQdF0K8k
         mDlg==
X-Forwarded-Encrypted: i=1; AJvYcCVeZX6VMEirnovlnJG8+3zbxk4Rkj5v81O2sD9izrSpsRw7EfwXdlFgfNUCi7nM3wVurgdM7Z8mzb9usrSrzsBpbEQ7iB0RIDzj0/345yqC
X-Gm-Message-State: AOJu0YyacLlMJdUzZzAcXnw1hfmzGFU5TOmgW15V35+wIH1SO3/d/l5G
	QL0b9rgLw/HLdq5XTku5je5tu6U27ggy02OljCTHhGVowLNoKScAv0Nvx/WiL4HwBu4yUOKjlSY
	6
X-Google-Smtp-Source: AGHT+IGIT5fRmSU5mTHAtfUSvBO8bSYE3S8hCevxI+ZKnPLL6EPNP04SFEUKamUPrL/Drlv8BwdKKg==
X-Received: by 2002:a5d:6d52:0:b0:34d:b3a0:5614 with SMTP id ffacd0b85a97d-34fca4326b6mr2190198f8f.8.1715167483962;
        Wed, 08 May 2024 04:24:43 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id dn15-20020a0560000c0f00b0034d9012e74bsm15257565wrb.72.2024.05.08.04.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:24:43 -0700 (PDT)
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
Subject: [PATCH v2 6/9] mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
Date: Wed,  8 May 2024 13:18:26 +0200
Message-Id: <20240508111829.16891-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508111829.16891-1-alexghiti@rivosinc.com>
References: <20240508111829.16891-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_042445_687452_74CD6584 
X-CRM114-Status: GOOD (  20.03  )
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
 arch/arm64/include/asm/pgtable.h | 14 +++++++++-
 arch/arm64/mm/hugetlbpage.c      | 19 ++-----------
 arch/riscv/include/asm/pgtable.h |  4 ++-
 arch/riscv/mm/hugetlbpage.c      | 21 ++------------
 mm/contpte.c                     | 48 ++++++++++++++++++++++++++++++--
 5 files changed, 66 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 2e0415fd5083..7c2938cb70b9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1644,11 +1644,23 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
-static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
+int find_num_contig(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, size_t *pgsize);
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
 	*pgsize = size;
 
 	switch (size) {
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index cf44837369be..5ace4bf7ce35 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -93,8 +93,8 @@ int pud_huge(pud_t pud)
 #endif
 }
 
-static int find_num_contig(struct mm_struct *mm, unsigned long addr,
-			   pte_t *ptep, size_t *pgsize)
+int find_num_contig(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, size_t *pgsize)
 {
 	pgd_t *pgdp = pgd_offset(mm, addr);
 	p4d_t *p4dp;
@@ -277,21 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0847a7fb8661..d976113a370d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -532,7 +532,9 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 #define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
+static inline int arch_contpte_get_num_contig(struct mm_struct *mm,
+					      unsigned long addr,
+					      pte_t *ptep, unsigned long size,
 					      size_t *pgsize)
 {
 	unsigned long hugepage_shift;
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 437b1df059eb..a757e0b2f090 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -187,7 +187,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
+	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
 
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
@@ -202,21 +202,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
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
@@ -231,7 +216,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		return;
 	}
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
+	pte_num = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
 
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 	orig_pte = pte_wrprotect(orig_pte);
@@ -249,7 +234,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_clear_flush(vma, addr, ptep);
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
+	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
 
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
diff --git a/mm/contpte.c b/mm/contpte.c
index 22e0de197bd3..68eb1634b922 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -22,6 +22,7 @@
  *   - huge_ptep_get()
  *   - set_huge_pte_at()
  *   - huge_pte_clear()
+ *   - huge_ptep_get_and_clear()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -33,7 +34,7 @@ pte_t huge_ptep_get(pte_t *ptep)
 	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
 		return orig_pte;
 
-	ncontig = arch_contpte_get_num_contig(ptep,
+	ncontig = arch_contpte_get_num_contig(NULL, 0, ptep,
 					      page_size(pte_page(orig_pte)),
 					      &pgsize);
 
@@ -87,7 +88,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	int i;
 	int ncontig;
 
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
@@ -111,8 +112,49 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
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
+		 * If HW_AFDBM (arm64) or svadu (riscv) is enabled, then the HW
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
