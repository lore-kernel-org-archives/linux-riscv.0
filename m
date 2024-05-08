Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4782DC19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEUat0iqir3m/BwW8pN+ZJiIZ0Z8EXP6prqKCnmIK1I=; b=o0OOcRtLdPZkgL
	ctm8BB0Ry1TuRO6uar3mu4N/AwM3oNa9Wt/1VzvD2I7XMPCD4/pv+RzUxi/N6ov/Qsr0KTJBAsPfr
	zURbd0V0aG3Z90P1ohMl2COH72lVbwQB9XnChnQg6nHyFoL5qHYhNLISDjBfUXzNcioTjt1f0GsdY
	1f2CorHyeXk3pW8aNKNJojmgWnljE4Z1Xn/dulgp3b3QyVw+iJswpzKB/llROE5znk0GBorggPXa8
	WXTpQDoG/d5U5roizo0834wWPVTDM+OemV7kSZmC/lexJOTCW50tDy6q1Kfmp5sJYilb+ms0O/5nz
	PuV4688fS4UBmr80dkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fe3-0000000FHij-1MBL;
	Wed, 08 May 2024 11:39:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fdz-0000000FHfU-35j3
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:39:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34d9c9f2cf0so3261900f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715168370; x=1715773170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkOJ479CewvDdU5HWPEgLgm2sAjKEVUPHaCHVUUKnDI=;
        b=2nxcZn5cVmLT9pgJQr7vN8EFuJouRBsRgjXTlxhHFhjMzvWPxYIxEc0kneqs+H4MFt
         5+GyP1+IBNfCfz0QTVCWuBaMXLRPLdvW6luPWJdB/J2lJKBhCxcoacYL00FNuKWiabHr
         tNrZd/+X7qW5cXHk1x5NR9BXyB51E5GILGbmpTswyGL32NUX1L9ICobXHyutYtPcz48i
         1v2UNtsnJ1cosu0Vrfh47SMGMOOxwXXX983FKWZYqp/J+8enmWjfMRfCymZHjmRCTgc9
         /HsB9V31D3M7l3Brc80VOxgNekofTkvvYZKCoZBjAFqyPZLB8D5cJRc15tT8oV9549wu
         yDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715168370; x=1715773170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkOJ479CewvDdU5HWPEgLgm2sAjKEVUPHaCHVUUKnDI=;
        b=jwlOHEwFU1GIDfhw/AooTYDAnQXT/yyuvenx80cfLcTiRoT6Ju2VR6BLj8+91BBlyy
         6Qa3apq35VtYAC+lvsoHQNPeizXJaHAQwiJpUXUH3JzTGhiz5I6S4HkBvGiMGzjSMC8N
         LRLasa/irbM/NYWRcSio8s5jhkcxhl4ljaR9wFqQCYdoc2T/m1eBx9DXjvaVFI10wKZj
         R3xP9+ykENRzJ2NQC4YSLnabNVBmCZZ0aaH2wteDFXUdSPm2XYUlUdJ41lxrZ5J+XXeG
         WtdZpFGLsx7AZH0Vo7vevKF2jK8nur+8f/Vk/P/VEmpHscGE+lNGox0o7LvsZQRX59uZ
         cGKw==
X-Forwarded-Encrypted: i=1; AJvYcCXLIrFG2UcXhmlm2Dg8QPUCijqHM8WdzciBzxXc4AkvCrDS1A2uoc62szGjLH4eV383TqlrWeKvRG8EdMZaBj6eaX5polD71cgjdxkLA9eS
X-Gm-Message-State: AOJu0YzrlfSiZXauHRlLJnxbUq7W53e+95Ukk9DKKbk9XYlLfGcU74Jw
	WqDB58xCr78iRWwRvlheh3jD3HfkE12uA+RgJHfpeFrd7EYGIVPYuMFB0w1XqoQ=
X-Google-Smtp-Source: AGHT+IEZS4ddGwIWcQuhI1g6wktPlm5wrgDKEngfcuzPllSn67aCj73nYZBEmuYd+HrBwCZhVDrutw==
X-Received: by 2002:adf:e752:0:b0:34d:17f2:956d with SMTP id ffacd0b85a97d-34fca80dffcmr2356969f8f.66.1715168369782;
        Wed, 08 May 2024 04:39:29 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88110ff8sm20241365e9.38.2024.05.08.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:39:29 -0700 (PDT)
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
Subject: [PATCH RESEND v2 5/9] mm: Use common huge_pte_clear() function for riscv/arm64
Date: Wed,  8 May 2024 13:34:15 +0200
Message-Id: <20240508113419.18620-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508113419.18620-1-alexghiti@rivosinc.com>
References: <20240508113419.18620-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_043931_792353_808D11D6 
X-CRM114-Status: GOOD (  12.44  )
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

Both architectures have the same implementation so move it to generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/mm/hugetlbpage.c      | 12 ------------
 arch/riscv/include/asm/pgtable.h |  5 +++--
 arch/riscv/mm/hugetlbpage.c      | 19 -------------------
 mm/contpte.c                     | 14 ++++++++++++++
 4 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index b8353b0a273c..cf44837369be 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -277,18 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-		    pte_t *ptep, unsigned long sz)
-{
-	int i, ncontig;
-	size_t pgsize;
-
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__pte_clear(mm, addr, ptep);
-}
-
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d1d3a6c7c44..0847a7fb8661 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -644,8 +644,8 @@ static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 #define set_contptes(mm, addr, ptep, pte, nr, pgsize)			\
 			__set_ptes(mm, addr, ptep, pte, nr)
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
@@ -700,6 +700,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define set_ptes		__set_ptes
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define pte_clear		__pte_clear
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index d8f07aef758b..437b1df059eb 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -254,25 +254,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
 
-void huge_pte_clear(struct mm_struct *mm,
-		    unsigned long addr,
-		    pte_t *ptep,
-		    unsigned long sz)
-{
-	size_t pgsize;
-	pte_t pte = ptep_get(ptep);
-	int i, pte_num;
-
-	if (!pte_napot(pte)) {
-		pte_clear(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
-	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
-}
-
 static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
diff --git a/mm/contpte.c b/mm/contpte.c
index 2320ee23478a..22e0de197bd3 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -12,6 +12,7 @@
  *   - __ptep_get()
  *   - __set_ptes()
  *   - __ptep_get_and_clear()
+ *   - __pte_clear()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -20,6 +21,7 @@
  * This file implements the following contpte aware API:
  *   - huge_ptep_get()
  *   - set_huge_pte_at()
+ *   - huge_pte_clear()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -102,3 +104,15 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
 	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
 }
+
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, unsigned long sz)
+{
+	int i, ncontig;
+	size_t pgsize;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
+		__pte_clear(mm, addr, ptep);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
