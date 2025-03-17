Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507A5C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9iu6hhauc2ryE6ehtPCSUDpKLZbGSsE7a/K77f/i95Y=; b=a33VyGuXS8/cqQ
	a23jI/TLcI5pe9eLmr3IsMO5Quwnzpv8ZVw0MRTRGYAAYVRERIJFshk4HKyZcC22GRYI2vUJc59SC
	2+EbEuKpW5NOPeDX82T6HEeS11H67unHZzWnxUdeeoentdjJcLtMmFAGs8PNRQdDxDoITI/RZZ5w7
	fsvlOKigA70rQcfhoGgZCVB4v7lasrET4reC6Q+yDxNkkoZOAbPZSKG2S+yILBJ1haiviA34gBDes
	sA0dB2dblpEmzwC8HOuFnF7I9L4LvHV6xta/vQ06f3R6cQj9tIc/yzNF9P86xnFtx9gEjA4Dt5TfE
	rs1yUzg/C6MjZueM7OBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4vo-00000001aIL-364w;
	Mon, 17 Mar 2025 07:30:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4rH-00000001Ypt-0Che
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 07:26:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso2260681f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742196357; x=1742801157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2Rgxfmy4wvi0IV1iIeDi36GnLsMRf14zDXApk09KVM=;
        b=b5pyx7xJVJw+EzJUUEF6Rqlvhs6K7GPiQIg3o+t3G4ElsuzQIdrkyaY5VDgCSxNkMf
         FKfHYL9YhGn1wkcPRBWj1z/USgzPZZPO0n/vxAjjiCO6cDDTmmdSuujxBYSHEeOE8wl+
         eDVd37vKiYF7YQlNLW6be6GjwoS/CwUZ0wk2dAk7SNnFqgFEWWi7O0cumRpo52hkhEzc
         /ftN62NmP/EiCyrvUzcGggcNZpwtmYVQCtNchIkUMCKZoE6a2sEvqgvFjpeZJcyztiGW
         L7KCc9J9mTTI+pT1EH67VGiw7X5m+/4VjhxoTsdeoqZP4gEn2wb+69XqzjueoUgSQ5ZX
         dHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742196357; x=1742801157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2Rgxfmy4wvi0IV1iIeDi36GnLsMRf14zDXApk09KVM=;
        b=ZWOYXdUY7UOAmkKFvOLCE/bqTjNcXEx6YQ/BwXi2pcBgmqEyFajaPMsu9ZlLfZVSGh
         54zv2rxMPEqz7aKusz4Xy5rx46Iy+0w5GIeSqAegrQOA1/WpVrvUTVQTTOf0RD62RndV
         rmKDtn+RNlxEd0pBL+b4oidZxbQqYjOhXQO3awOVwXhdQpaABznyRpD8LU7cvHokC+R/
         liU0Iy9yIFBXE9zn+B0hzEOvx3cnUohyGrO4/Lc9HYFHQ6BrmcZEWF/BUm7UlZWlDQgj
         WlNSiuxRacgOriqETYpnXqQi8hb162VVHZC20S53SB68m1rsu5dRv+TwSM60Sbyh7Ixw
         2SoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+rZbi9DjT9cNNU267rAc5Cyp9WeKVfYW3WZCssT3nJvTQOwhXOMM4LXbl9vrYXx78/SRZ6xVclB8vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkkvGzkCMTaf/Pmu9IbB7oe420yN1Q4haQeFkev68Key51zm6i
	iFaTtiW7Dfu/IlyUmWxLE+DibZ1K+GYBhApe8muADU27n2J1Suy56dFJulk2oqA=
X-Gm-Gg: ASbGncuJuM5y0LsJ3bPwo4nkK1CubyM8xIkp3f4E91hkwDMZI6ZDJ6VeXAPc7eJiZp0
	/Rou+PN6qh5gxBvYgDj6tv7KX5Yx4VXK7aamZv0qfuaxaWDNZoR4wVAxb8krz8cEN24TjBJvdEM
	ysdwo5tp7Ja+Q6CfKja322n6fhHrnok56wQkguVyd0fOMNagHdSitkNgxpflNCBRxf2Rpg+GMnk
	YKnPsNYA2sGtniNzwNV8GQV3pALNC/X5z/eu0yulINm+3EkRCxklzHhJDSQNbmsIIleP84CO0fy
	fq+jjub3vxpCsHQYBEoHiTJVC5trkHJDBabyqr4IwZQac0iZpvuJBTC8GwjSy76pIw==
X-Google-Smtp-Source: AGHT+IGFDMFLc6+xi+GWz3Dc64P/p7dYSStQUrPd9vMMUlqPXgkzGWncVuX7U3JZiTVznPWilKKpOg==
X-Received: by 2002:a05:6000:18a8:b0:391:2d8f:dd56 with SMTP id ffacd0b85a97d-3971ded3840mr11909327f8f.29.1742196356823;
        Mon, 17 Mar 2025 00:25:56 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8881187sm13887907f8f.41.2025.03.17.00.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 00:25:56 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Fix hugetlb retrieval of number of ptes in case of !present pte
Date: Mon, 17 Mar 2025 08:25:51 +0100
Message-Id: <20250317072551.572169-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_002559_290526_EFE3C072 
X-CRM114-Status: GOOD (  15.18  )
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

Ryan sent a fix [1] for arm64 that applies to riscv too: in some hugetlb
functions, we must not use the pte value to get the size of a mapping
because the pte may not be present.

So use the already present size parameter for huge_pte_clear() and the
newly introduced size parameter for huge_ptep_get_and_clear(). And make
sure to gather A/D bits only on present ptes.

Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
Link: https://lore.kernel.org/all/20250217140419.1702389-1-ryan.roberts@arm.com/ [1]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 76 ++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index b4a78a4b35cf..375dd96bb4a0 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -148,22 +148,25 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 static pte_t get_clear_contig(struct mm_struct *mm,
 			      unsigned long addr,
 			      pte_t *ptep,
-			      unsigned long pte_num)
+			      unsigned long ncontig)
 {
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
+	pte_t pte, tmp_pte;
+	bool present;
+
+	pte = ptep_get_and_clear(mm, addr, ptep);
+	present = pte_present(pte);
+	while (--ncontig) {
+		ptep++;
+		addr += PAGE_SIZE;
+		tmp_pte = ptep_get_and_clear(mm, addr, ptep);
+		if (present) {
+			if (pte_dirty(tmp_pte))
+				pte = pte_mkdirty(pte);
+			if (pte_young(tmp_pte))
+				pte = pte_mkyoung(pte);
+		}
 	}
-
-	return orig_pte;
+	return pte;
 }
 
 static pte_t get_clear_contig_flush(struct mm_struct *mm,
@@ -212,6 +215,26 @@ static void clear_flush(struct mm_struct *mm,
 	flush_tlb_range(&vma, saddr, addr);
 }
 
+static int num_contig_ptes_from_size(unsigned long sz, size_t *pgsize)
+{
+	unsigned long hugepage_shift;
+
+	if (sz >= PGDIR_SIZE)
+		hugepage_shift = PGDIR_SHIFT;
+	else if (sz >= P4D_SIZE)
+		hugepage_shift = P4D_SHIFT;
+	else if (sz >= PUD_SIZE)
+		hugepage_shift = PUD_SHIFT;
+	else if (sz >= PMD_SIZE)
+		hugepage_shift = PMD_SHIFT;
+	else
+		hugepage_shift = PAGE_SHIFT;
+
+	*pgsize = 1 << hugepage_shift;
+
+	return sz >> hugepage_shift;
+}
+
 /*
  * When dealing with NAPOT mappings, the privileged specification indicates that
  * "if an update needs to be made, the OS generally should first mark all of the
@@ -226,22 +249,10 @@ void set_huge_pte_at(struct mm_struct *mm,
 		     pte_t pte,
 		     unsigned long sz)
 {
-	unsigned long hugepage_shift, pgsize;
+	size_t pgsize;
 	int i, pte_num;
 
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
+	pte_num = num_contig_ptes_from_size(sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
@@ -295,13 +306,14 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr,
 			      pte_t *ptep, unsigned long sz)
 {
+	size_t pgsize;
 	pte_t orig_pte = ptep_get(ptep);
 	int pte_num;
 
 	if (!pte_napot(orig_pte))
 		return ptep_get_and_clear(mm, addr, ptep);
 
-	pte_num = napot_pte_num(napot_cont_order(orig_pte));
+	pte_num = num_contig_ptes_from_size(sz, &pgsize);
 
 	return get_clear_contig(mm, addr, ptep, pte_num);
 }
@@ -351,6 +363,7 @@ void huge_pte_clear(struct mm_struct *mm,
 		    pte_t *ptep,
 		    unsigned long sz)
 {
+	size_t pgsize;
 	pte_t pte = ptep_get(ptep);
 	int i, pte_num;
 
@@ -359,8 +372,9 @@ void huge_pte_clear(struct mm_struct *mm,
 		return;
 	}
 
-	pte_num = napot_pte_num(napot_cont_order(pte));
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+	pte_num = num_contig_ptes_from_size(sz, &pgsize);
+
+	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
 		pte_clear(mm, addr, ptep);
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
