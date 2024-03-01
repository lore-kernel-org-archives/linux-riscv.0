Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807A4C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stOjYDIGLcqT1vPmj88Ljl3nt4HzwX1Ds98ieWKZNy8=; b=qDuOj8pjHX81td
	k2I3kgyXa4xbgclKfVw6SUc7dnCELNXKJikyBRbJqVcfBhxXHWIAmQtwg8+VyzYXChmNk3veC3cJx
	9hHy3Qeh7wv6iKvL4zgHbLFV/yKtckjHGNvcSD7vPYmj/sD8XTfYwp0BF5MctMUS7wmyoCkpPmCOw
	J0lgd+8heo0xd0lpDI/ug+jx3HUpgvEMQ4XQ59HKkcZZ51DFTXufqHXD84uzhtUWen14qIm5usuBs
	xeWkYiK6gC/tYF499PttQQ8YIYXIVQnKvwqxqnmn8YqVw0MRCptCgK6Cxln9vKea0JQ6TpE2lgkAi
	nat3g9xHRryupMxluRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz8A-0000000H8wy-3mS6;
	Fri, 01 Mar 2024 09:24:39 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz80-0000000H8qL-1z7v
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:24:30 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2d28464c554so22619181fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709285061; x=1709889861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K12kuYfal65hYkuTm7CnsK9zS+VdU7mNn9HZDxR8IYY=;
        b=VDQ0CCWFZEADSAs3oKIJtUcpiHr+ktQ5Dl77nm9oEsZVnQC2vhITYVhm0VUPgQ1L/4
         jg46UZw4oQJ8P5s2VHgUPbzruICtDv/RmEjFM8Lv/zziY1nDQHfWy4triDwooQTGl6Cz
         2J2DIWdvhpZR2FdJimI4NtPqpL7U0eCuMKrIUZXb4KobbG7AJYgALMPT+tdyx7QMf1vr
         LvN5kq9jreAFNqHZWDzUWKiTOq39H3KX0TDjD2s3WfrzxWQJYgQbaB8MA/xTNA2DF14G
         6jNxsL1Fyhyrz/pe3KX9loP9vgnaX1oyeNA2NU9g2ftNLfm9rw6OkX8FycCipnHEsNnw
         VfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709285061; x=1709889861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K12kuYfal65hYkuTm7CnsK9zS+VdU7mNn9HZDxR8IYY=;
        b=q6KnNoDTuIkyoCMdywHTBrn0lrj0Ai7hTX8me+6eTdw3Ja5ZTJM8oRdONnd14fv8CM
         GktP427Y2Zcffd02CngSH+yjuK/kDdX1gqMeU6l8yzndXD5rsKXkWO8Ad1nHCx6rVSYA
         Iqz784nlennN85WSC2WPdcmF2SUqRrvCPkgS9Rig5JuFalsOayJk0Tb6ARdqLZl5hsUF
         72/RRS4N/BYz5D6btPRAJmNRCHmFPAyDIxpW+w16ekd3cW5TL27jR4fUoK3HKUHXrMKL
         Tu4nCnlW9IEdoK7IsD6N/A9V3ute2dWG+uMFCTyZb0fe/hWA17laHb8y+h+OjAVZbRjX
         UuyA==
X-Forwarded-Encrypted: i=1; AJvYcCX1mp7N7qKqkuhQkI1ALG+DUdSxTM2Rlp+xSESQk4+irGXErg9PjTAJS3TDWSKVuf2QujzHrBV20aNmPV74qCni0J52HgM5+8ZrHLyXsPWN
X-Gm-Message-State: AOJu0YylTRP+gPbjZkaUK1ybKT/zmliRI6cpLyvXnInUKSzxnaLhYEpD
	H8j4tquw8ki8OgXdMfbW5PlDlpDng++dRdarTk7Sz234Einux5OGtLw8JiCMJpU=
X-Google-Smtp-Source: AGHT+IFt+kCs8abRI8MZlthQ5rKNhpeiYCQtIBul4mlcyfPmRwi1Z8kSKZm+NO/gjQvAypId4axWxw==
X-Received: by 2002:a2e:9909:0:b0:2d2:92a2:9a84 with SMTP id v9-20020a2e9909000000b002d292a29a84mr731669lji.43.1709285061585;
        Fri, 01 Mar 2024 01:24:21 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w15-20020a05600c474f00b00412ca1dc2e4sm649267wmo.7.2024.03.01.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:24:21 -0800 (PST)
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
Subject: [PATCH 9/9] mm: Use common huge_ptep_clear_flush() function for riscv/arm64
Date: Fri,  1 Mar 2024 10:14:55 +0100
Message-Id: <20240301091455.246686-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240301091455.246686-1-alexghiti@rivosinc.com>
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_012429_014658_16F031E6 
X-CRM114-Status: GOOD (  15.52  )
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
index d6ddaf282a94..8a273b9816d7 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -119,53 +119,6 @@ int find_num_contig(struct mm_struct *mm, unsigned long addr,
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
-	pte_t orig_pte = ptep_get(ptep);
-	unsigned long i;
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
-		pte_t pte = ptep_get_and_clear(mm, addr, ptep);
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
@@ -284,20 +237,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-			    unsigned long addr, pte_t *ptep)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	size_t pgsize;
-	int ncontig;
-
-	if (!pte_cont(READ_ONCE(*ptep)))
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
index e6cbb6fb2904..caf1db6f8f20 100644
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
index f7f26d2cfa23..445e5ebe46b4 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -23,6 +23,7 @@
  * huge_ptep_get_and_clear()
  * huge_ptep_set_access_flags()
  * huge_ptep_set_wrprotect()
+ * huge_ptep_clear_flush()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -251,3 +252,17 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
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
+	if (!pte_cont(ptep_get(ptep)))
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
