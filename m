Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D6BC0218C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 09:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gdn3xfyvWiyfQY+IjxBA23hd2Qy3KMaDgMuvdiQ5ouY=; b=Wu8SnqYzNHGfnE
	wFu1CbGfewfdZ5rNA5JjWg7E7H5/a9qylF2aC5bMAW2XFHZwjZEYZ9xj7d8N1xj5R3iEN69dlhTHX
	TZS/rqvvFlVVytoUKN6FIPPvwc2cC6PgBx5156zv1iaVXavbZcLvOlsPwn9RJdWg9/B4G1nKiy93V
	nxeLvfPAN7NUxhwpt5+baeoZfOdsTHXxlkOfqODWb/yH01vSzccZkEUszdfutLV0ONzP/bfS+Gl/U
	qmAxJmjEEBpYsbk2yBUL79a2RHFYLRi2IeNZmDPOf4Eqm/h7WeC4BFl2+BMw44/Rgd0fNyY+8Yaqi
	zYjw1q+3WNXAkLYfB/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLiW-000000024HQ-0ByU;
	Mon, 27 Jan 2025 09:47:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLes-000000023Do-0mwg
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 09:43:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-386329da1d9so2116873f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 01:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737971032; x=1738575832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5hVtVN5ts8qRfTru3U6IxaXR2nRBQvNb9/UQuUojb8=;
        b=fX9bd/0O9A8gsb5s5gsmSyBZf8wUDqUzXo6aDtGwG3CZesAU1UdGHGthq1PWMFkn7r
         JReEXjAzq4TD4RsctKoHwBZY34QxfMmehdJxKY+JPxVkBNcURWwtsyrMIKOqMkyU3BCh
         6O7f9B0WJL8CaPedFRDFZatakwp5cJltcplbKDDv6ojOnrOAddu6XcgXqJNgYU2gEEQm
         6wjuDwmP/vji0du3Rl4cOvIlIZvnBIwNBLfviZsJnILKWyKmdZ2hH3CRxDDzhgqrdCBi
         7kuJo/x8cHS7TUdP9k2F1sjr0XOamB1f9PcaNtKhKm+smMljXDS1Uv2shxzytFcPUQpH
         FA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971032; x=1738575832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5hVtVN5ts8qRfTru3U6IxaXR2nRBQvNb9/UQuUojb8=;
        b=Snag1aTelIKV+uRLMpnj8XaRefmYRgcXMUwa8/wA8u+dO+PkrESkW0t94/zsPy8q5O
         uJeEvAuaA+mU323zFS59rYT1Fr7jf/zp7klQ7G9S3nrK4dEIs4d/Fy5WgyCp5ewhafm0
         xU7pz1SBrd0Afp/KIn2WhdCtfpGXWmi/QxxWNtMvQYueBlK85722EIt0NAJ3e6TBK5/r
         B3T/YWzLsHnlALgNfa1aN+KIQBDZewWhWRji6mpdwYYh03u17TSF2CS4d0AG+SWsxOkB
         PxcP4sIlPVGTU92KBXfJ3XvoAFSH4e1AcTKTlgaos8hIt81vnl9+GtNGgG8mHsNPe5uO
         6rdA==
X-Forwarded-Encrypted: i=1; AJvYcCXm8pfP41djFmpJoiIjkRrJ9OBcdbb116Zb1ofPThvPByXW/9z4mnzU1jD2PA2syEJa6gmkudNfxQoqhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2zs0GXS9uC8dRl0zqW9hxZKKs1/f4BvP6+LsiMi+T7sjdWBvD
	OjpRA+i8PJmmNbNLW6P37QdrfaddKQMIL6T9rFGr5WVwhSO8dayDiC7scBlXdp4=
X-Gm-Gg: ASbGnctEeNwHsrW+YL5mXIFeMw7WcIdoLDw+7kjvcAqnRb0H6eUiFvl2peDPuDdsoGE
	LRNyfj6DViOoXzugFHMPURa2CUbs1Gy1yUCBgdy/M2dgtF1PDTLc+l5BDk56MfNStAPaGMOlHsq
	R+ypPHaRjWlFJQaH/jxHxI24m5A7ueDjNLd9d+gy/fkooH+ZZ5sp22LXxh7ER8V9QTmQje3WsfQ
	/PF2BOvxycSHWuApcCeBKoYIN2u9vc1jBhCh125bXNnT14IZqJLSxvSe0yRW7RXyZDcY5BD+ZGt
	14vIn+TfqhQs9d229/Cn12Cfu5iwUNs=
X-Google-Smtp-Source: AGHT+IFXkE/IMZA1k4v5FDtRJn2j5Onh6MT51lwkeaLHVsBqz96ACklS2Q489STBeMVgKrxepukPbg==
X-Received: by 2002:a05:6000:18a8:b0:385:f69a:7e5f with SMTP id ffacd0b85a97d-38bf57a9a86mr46329622f8f.38.1737971032476;
        Mon, 27 Jan 2025 01:43:52 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6a6sm10405111f8f.26.2025.01.27.01.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:43:52 -0800 (PST)
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
Subject: [PATCH v4 8/9] mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:29 +0100
Message-Id: <20250127093530.19548-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_014354_224581_B8FDF0E0 
X-CRM114-Status: GOOD (  13.33  )
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
 arch/arm64/include/asm/hugetlb.h |  3 ---
 arch/arm64/mm/hugetlbpage.c      | 27 ---------------------------
 arch/riscv/include/asm/hugetlb.h |  4 ----
 arch/riscv/include/asm/pgtable.h |  7 ++++---
 arch/riscv/mm/hugetlbpage.c      | 22 ----------------------
 include/linux/hugetlb_contpte.h  |  4 ++++
 mm/hugetlb_contpte.c             | 22 ++++++++++++++++++++++
 7 files changed, 30 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 654f5f2f03a3..fd1de0caad3f 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -35,9 +35,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
-extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
-				    unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 643ba2043f0f..0430cb41f381 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -277,33 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr, pte_t *ptep)
-{
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
-	int ncontig, i;
-	size_t pgsize;
-	pte_t pte;
-
-	if (!pte_cont(__ptep_get(ptep))) {
-		__ptep_set_wrprotect(mm, addr, ptep);
-		return;
-	}
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
-
-	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-	pte = pte_wrprotect(pte);
-
-	hugeprot = pte_pgprot(pte);
-	pfn = pte_pfn(pte);
-
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-}
-
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index bf533c2cef84..4c692dd82779 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -24,10 +24,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep);
 
-#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr, pte_t *ptep);
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 290d5fbfe031..5a29153a4013 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -645,9 +645,8 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 	return pte;
 }
 
-#define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				      unsigned long address, pte_t *ptep)
+static inline void __ptep_set_wrprotect(struct mm_struct *mm,
+					unsigned long address, pte_t *ptep)
 {
 	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
 }
@@ -741,6 +740,8 @@ static inline pte_t ptep_get(pte_t *ptep)
 #define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+#define ptep_set_wrprotect	__ptep_set_wrprotect
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 0e2ca7327479..8963a4e77742 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -173,28 +173,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr,
-			     pte_t *ptep)
-{
-	pte_t pte = ptep_get(ptep);
-	pte_t orig_pte;
-	int pte_num;
-
-	if (!pte_napot(pte)) {
-		ptep_set_wrprotect(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(mm, addr, ptep, 0, NULL);
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-
-	orig_pte = pte_wrprotect(orig_pte);
-
-	set_ptes(mm, addr, ptep, orig_pte, pte_num);
-}
-
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr,
 			    pte_t *ptep)
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index fea47035ac38..02bce0ed93d8 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -27,4 +27,8 @@ extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
 				      pte_t pte, int dirty);
 
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
+				    unsigned long addr, pte_t *ptep);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index 49950c1ce615..de505350ef48 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -14,6 +14,7 @@
  *   - __ptep_get_and_clear()
  *   - __pte_clear()
  *   - __ptep_set_access_flags()
+ *   - __ptep_set_wrprotect()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -25,6 +26,7 @@
  *   - huge_pte_clear()
  *   - huge_ptep_get_and_clear()
  *   - huge_ptep_set_access_flags()
+ *   - huge_ptep_set_wrprotect()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -232,3 +234,23 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	return 1;
 }
+
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+			     unsigned long addr, pte_t *ptep)
+{
+	int ncontig;
+	size_t pgsize;
+	pte_t pte;
+
+	if (!pte_cont(__ptep_get(ptep))) {
+		__ptep_set_wrprotect(mm, addr, ptep);
+		return;
+	}
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+
+	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+	pte = pte_wrprotect(pte);
+
+	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
