Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B17C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzA3r+iXe39vz6Z3zSpNyAG92mNK92suIihE2FlBaAc=; b=vgcEaAxudY2v2m
	qlgFLdHT45WRobd18UpF8T71CHGv1SW+OgYNcGHUlt0cGofX57PK82dmLqSuZpxeT8J2y+k/kWES2
	4AhKNT0NlE5lAOyqd/+bEjCpfH+W4C5qySlSRZkk8Zp9dJhGxjCRhCzOk2c1VqfAdEdT+16evCpFE
	0l7jR8EaESjWwTJ+2zmGhYBho0RnZuUIsDT5sMTlGIKHML6WLqmWTSBdZy4qt07jo+VIaTqrymH5S
	eQDwBImgy8JzXqnLHznOJciTL7E6CwW1vsOgHP/Bka3fXYRBw1mR0Vclov9uBs6e8H3JTY+zn5tw2
	nGMfLOa9SH4HyGZzhVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fi3-0000000FJc5-3kxE;
	Wed, 08 May 2024 11:43:43 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fi0-0000000FJZ9-47Ca
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:43:42 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2e3f6166e4aso39577511fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715168617; x=1715773417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkDF3kPVXJf4AqMK0ZqTYH7UgAMmNVObdoVU0G1Ynu8=;
        b=auyXZZ2OoxyzUJulyGEttscpD+3o48XtefOEErS+UW8/eZasWSmy+MffV9Rcoa7TCA
         GTdegiIklLgor9GvOJtzUZSrDCd5WMkrGqMpQ9dUtTDRcuqqu5H7AZM961OBcHCLef47
         XJrEs692tzJq/UfMs5GJHi3cUrOP/S+Rq5MNOnG3Vg9IIgPhNHouyCmuhgQx3cUMn+Va
         37FCtRcb3MOwLqZOXrOojMlealdPKfNzqiAfJXTl17IJlhrYgOX46sfDc2ntD+iJKOIs
         /llkZKPDqh8DFpr2vwks93+e1VaxJykDnWyBXtJ7Fqpclt8PjcbQCeTHAdLyrjR30OMC
         Ur7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715168617; x=1715773417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkDF3kPVXJf4AqMK0ZqTYH7UgAMmNVObdoVU0G1Ynu8=;
        b=G75Xqytwc8FUC4NgB3o2/2fFr4Hu/b5jBBNJrxTpilOxc42/CuhFxnr2pRFfKmFKCk
         gwM0z63Lfn4/VXcxm64SJ9wkYz22Dd/O3eS0CORtO6gJAnB7juf8Nj2xdxJgtFmXJSap
         ed1CDoYPMmqamVJL+FsaRejPiRGtMpC4Xj8vZtw1ryHLEMtMvdVdKVvoF576AtTZJ4ql
         AtU17h3Zfk8q5WfKNSxT/5rCx8gEiL0CrnSZHjjxBLlfitaNBAqXW6QcNHZ3BxNMRpca
         XPkIfTHwOYKDRDWvCFrtfosrWVvPfBd0LP86TpVE0yfw4ca3NLo54Lsc7E9ELu5Oru7c
         ACeg==
X-Forwarded-Encrypted: i=1; AJvYcCX1kb9YyrDiVAVYtsEkipexv/OFtMRrAI6ZW54Y57H8VcFu//upMfVc178wUg2mn6w9Rl093y17m1YZYaUpe89RpEAJWqU0s9sktxvoEZiN
X-Gm-Message-State: AOJu0Yxx7Q1tRczY3DRkbE5bwcbYz4t12OieIL3jIeGhdQivzaFAG/Gt
	ycm87MiFetZ9OSwnMOzfKtSrhD6tqMk39fyafvdsz0Mk6HU/9480jwC3xqnwuT0=
X-Google-Smtp-Source: AGHT+IGXkVEaOMFBHx/baYrBz9derdknpbq9as3brbpiTEdPwh/hYAl2dlBH3Ljix5Ca772CLWwlVQ==
X-Received: by 2002:a2e:9257:0:b0:2e1:a504:f9ec with SMTP id 38308e7fff4ca-2e44708423amr19911671fa.23.1715168616936;
        Wed, 08 May 2024 04:43:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88111028sm20610245e9.33.2024.05.08.04.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:43:36 -0700 (PDT)
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
Subject: [PATCH RESEND v2 9/9] mm: Use common huge_ptep_clear_flush() function for riscv/arm64
Date: Wed,  8 May 2024 13:34:19 +0200
Message-Id: <20240508113419.18620-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508113419.18620-1-alexghiti@rivosinc.com>
References: <20240508113419.18620-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_044341_118922_A3DC3B27 
X-CRM114-Status: GOOD (  15.60  )
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
 arch/arm64/mm/hugetlbpage.c | 61 -------------------------------------
 arch/riscv/mm/hugetlbpage.c | 51 -------------------------------
 mm/contpte.c                | 15 +++++++++
 3 files changed, 15 insertions(+), 112 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index e56f2c8ec7e7..5869f20ca28e 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -112,53 +112,6 @@ int find_num_contig(struct mm_struct *mm, unsigned long addr,
 	return CONT_PTES;
 }
 
-/*
- * Changing some bits of contiguous entries requires us to follow a
- * Break-Before-Make approach, breaking the whole contiguous set
- * before we can change any entries. See ARM DDI 0487A.k_iss10775,
- * "Misprogramming of the Contiguous bit", page D4-1762.
- *
- * This helper performs the break step.
- */
-static pte_t get_clear_contig(struct mm_struct *mm,
-			     unsigned long addr,
-			     pte_t *ptep,
-			     unsigned long pgsize,
-			     unsigned long ncontig)
-{
-	pte_t orig_pte = __ptep_get(ptep);
-	unsigned long i;
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
-		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
-
-		/*
-		 * If HW_AFDBM is enabled, then the HW could turn on
-		 * the dirty or accessed bit for any page in the set,
-		 * so check them all.
-		 */
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-	return orig_pte;
-}
-
-static pte_t get_clear_contig_flush(struct mm_struct *mm,
-				    unsigned long addr,
-				    pte_t *ptep,
-				    unsigned long pgsize,
-				    unsigned long ncontig)
-{
-	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-
-	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
-	return orig_pte;
-}
-
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, unsigned long sz)
 {
@@ -277,20 +230,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-			    unsigned long addr, pte_t *ptep)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	size_t pgsize;
-	int ncontig;
-
-	if (!pte_cont(__ptep_get(ptep)))
-		return ptep_clear_flush(vma, addr, ptep);
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-}
-
 static int __init hugetlbpage_init(void)
 {
 	if (pud_sect_supported())
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 440d3bde88f2..47333efa2d83 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -121,42 +121,6 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 	return 0UL;
 }
 
-static pte_t get_clear_contig(struct mm_struct *mm,
-			      unsigned long addr,
-			      pte_t *ptep,
-			      unsigned long pte_num)
-{
-	pte_t orig_pte = ptep_get(ptep);
-	unsigned long i;
-
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++) {
-		pte_t pte = ptep_get_and_clear(mm, addr, ptep);
-
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-
-	return orig_pte;
-}
-
-static pte_t get_clear_contig_flush(struct mm_struct *mm,
-				    unsigned long addr,
-				    pte_t *ptep,
-				    unsigned long pte_num)
-{
-	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pte_num);
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-	bool valid = !pte_none(orig_pte);
-
-	if (valid)
-		flush_tlb_range(&vma, addr, addr + (PAGE_SIZE * pte_num));
-
-	return orig_pte;
-}
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 {
 	unsigned long order;
@@ -173,21 +137,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-			    unsigned long addr,
-			    pte_t *ptep)
-{
-	pte_t pte = ptep_get(ptep);
-	int pte_num;
-
-	if (!pte_napot(pte))
-		return ptep_clear_flush(vma, addr, ptep);
-
-	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
-
-	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
-}
-
 static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
diff --git a/mm/contpte.c b/mm/contpte.c
index 8ad2a3099dfd..15791f6d9c41 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -27,6 +27,7 @@
  *   - huge_ptep_get_and_clear()
  *   - huge_ptep_set_access_flags()
  *   - huge_ptep_set_wrprotect()
+ *   - huge_ptep_clear_flush()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -255,3 +256,17 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
 }
+
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+			    unsigned long addr, pte_t *ptep)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	size_t pgsize;
+	int ncontig;
+
+	if (!pte_cont(__ptep_get(ptep)))
+		return ptep_clear_flush(vma, addr, ptep);
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
