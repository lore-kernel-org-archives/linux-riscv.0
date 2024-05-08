Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37412C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5IBL/7bGmti4ET3GER0eX5m6MUKVicDnzwn4FvEhgc=; b=ozwVpUYNhKTaT7
	iTKvF4J6WCY3wvXesUrzXW3ZJ4XxD3xKtJBRaW6vxxITGYv9ldQSx+dbPoYa8M6CzCdI2PL9ytMCc
	gW69EQTu/XRXbWGzAv+XB2EKj5CM78WdlRRccDeXyjSQvPRvBS2kgHN9tpRcAL9iod62nmWnVyLyI
	rz7i6J6TrxQE4rnk9OCkwV6fXUTViMrZL8eqCSm7SZJJSYNl1Zf1NSZX5x3YCMreBve7wydouAX6V
	rp19f35YUKHQIPxvvuTQwP06lOMNMA7l8y8Q4NXmY3s+BF3Gi9m4yFHtbrmsjmJ78g/sWbbYYxgRt
	wjUBJOV3QgNbXc3qzJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fh5-0000000FJC5-0bEi;
	Wed, 08 May 2024 11:42:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fh0-0000000FJ7t-2Nos
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:42:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-41b79450f8cso27142975e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715168556; x=1715773356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3J74NkW9ioW00Pqnp327XZ4SYUtOBKlfZoGCCQmZ+M=;
        b=C3QwSEkQb/iv9K0WDBtk/FW6bN33tBJ2IxY4mCDX3La8/jvmCNfswT5Jzvk9kkmJhp
         1X8JlR2WjzPiWEivr47RxueDzSGyo5JeplhAdQ9XIqbTmwdSHXT7bw7Qt8AmT5/s2mQZ
         q/tEbv3sKgt8J9IC/k1bi6TlofeBNQjWgdil+2T96TUmqQxRXJLhaAd/+dFGYPxs4s91
         vd3EoFZRb5JpN0CTuj91jknhA8mO5i3fDYwBFVxZ0qYhb0V00siCqrTKGhDFGvZS4Cxo
         c3nP8/+HQt3IWwl/u98SphcMA/RBxaJgP8oPzGdJLkFyB9BkgeE1lnIMfEikzUnRrxyf
         rcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715168556; x=1715773356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3J74NkW9ioW00Pqnp327XZ4SYUtOBKlfZoGCCQmZ+M=;
        b=CwaCWjSyVZvxVYAt/n/k6l+GWzOUeGd/ftY+zhCC3QDvZxfbpPrgNelZ82CbPK6nvD
         a6zjnXoPfRnzmMxS+hcIf5Fb9XPiNXT9rqbi1qqvEhiXPAqaW85CGJhWX0k5pdtmtHlj
         m1l3MPhi9QbojlNEvhVqUPq+ZAvQ74i6Ok6iRUhdI1wvztMewvHd2YlmpznHGlrHGNDo
         xOc0ifvsa9DKLQS8BRiAkwWH3OZM7SkgfhP1fMl4cc/EBIvyZI4/XoKQTKgGcnX1jeIC
         lYjZmHJNCoN3W1z6EP9RvZwbgnalPmdoIsgBAkiPhPRvDTGTKauwXwAdjplb6jR7uZ3U
         q7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfaHUW8lojoODCsfXXqWyuvq01VNZiJ8BRrAjU+D5TbTau4Du1z7A2a89q5ZAFygxj45FsdZhF0X5OgE+cgIDu5/wZbrzVUGEo7EuwMBr1
X-Gm-Message-State: AOJu0YyNvInVgFevRYE2E5UIbw7kyA8hY2qsIc6mrlTW+bi8Enmou5+f
	wbY/zkTF80PNOvRWjYCS5kSG8sAt+9kPQPsrRPaRjEsf5yzDXr8BrAin31+f4LA=
X-Google-Smtp-Source: AGHT+IHE8o6Es8ZSc8TwRFtN83wex84gZARiN4tVTDQiUBBDnfszL6lfcSMLSwFM5H55V+vhK3nrvQ==
X-Received: by 2002:adf:b1d1:0:b0:34f:6c9c:19a3 with SMTP id ffacd0b85a97d-34fcade2a1cmr2221817f8f.15.1715168555855;
        Wed, 08 May 2024 04:42:35 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h1-20020a056000000100b0034e0b56a62bsm15118070wrx.44.2024.05.08.04.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:42:35 -0700 (PDT)
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
Subject: [PATCH RESEND v2 8/9] mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
Date: Wed,  8 May 2024 13:34:18 +0200
Message-Id: <20240508113419.18620-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508113419.18620-1-alexghiti@rivosinc.com>
References: <20240508113419.18620-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_044238_645771_7732194A 
X-CRM114-Status: GOOD (  12.60  )
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
 arch/arm64/mm/hugetlbpage.c      | 27 ---------------------------
 arch/riscv/include/asm/pgtable.h |  7 ++++---
 arch/riscv/mm/hugetlbpage.c      | 22 ----------------------
 mm/contpte.c                     | 22 ++++++++++++++++++++++
 4 files changed, 26 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 052a5bf2926c..e56f2c8ec7e7 100644
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
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 20f62505d0bc..9e397935536e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -668,9 +668,8 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
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
@@ -704,6 +703,8 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+#define ptep_set_wrprotect	__ptep_set_wrprotect
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a59b776e9c8b..440d3bde88f2 100644
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
-	size_t pgsize;
-	pte_t orig_pte;
-	int pte_num;
-
-	if (!pte_napot(pte)) {
-		ptep_set_wrprotect(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-	orig_pte = pte_wrprotect(orig_pte);
-
-	set_ptes(mm, addr, ptep, orig_pte, pte_num);
-}
-
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr,
 			    pte_t *ptep)
diff --git a/mm/contpte.c b/mm/contpte.c
index 9c7a9f250bca..8ad2a3099dfd 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
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
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -233,3 +235,23 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
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
