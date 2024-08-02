Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E136C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZ+21hmNuMZfqQTd4rSblkHrXbigWrdQj/OtyxAi+tc=; b=EFMHJOd0+RW8Gi
	8CZCU6hcA3gtNkjwGkePDCAMjrTjF6oMHhdPcgA26/wAP21jxO2fIfKi8XhY5ZYiWTPnovQ75GpwM
	Z/lrwROLjyYFbdQVLVkS4OaWhDd4gvEBT2YRRbncb+FN6bY/dZ7qlC4YDij4cPxGqqhA36JC/X1jP
	qINe0+HQj6xITAcgSbzmMEpQ7mZkli4rFRIXnhvPIoHAqJF5dH/3A9jFemASf6I3hvbEh+bN2Z93o
	RsI0d/4CXBw1JR11XfvkP/LpiL8FF70xId3NWVFpGCL8/TChq35HU1py0d4jbBoIHWzw/078cLTCR
	1fHMaJXvEKu6tfJR/Urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuBX-00000009HMA-25ku;
	Fri, 02 Aug 2024 15:27:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu7D-00000009Fh0-1mwG
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:22:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-368313809a4so1971735f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722612165; x=1723216965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1cBbOZt36mdcwgOJ6aPskHFTTaexGabCNqRxjg6Oh0=;
        b=DNzRkngBbaXbjT0gw1V0yQNeUpTF+tRIS2Zn60BZ/g9fQ7Bjo/RVL/p6XpMWK7Avy0
         JlYK/XIvuO7tifQ9lLcj3UAWMwxvmkU8Bu+3VprQ2VQALMWqBOy6QzZV8Un+n4yos16M
         E6/61tRby1LzjFTCJntOB4XyPYxnSOiZY0Kk3cOcFHcezCHP3HJjqeG1AyFiNEXqKq5Z
         gG3qXsIi430htEOoNy9+ncVGB/gbM5Z0jZPBAAxM8bv3xNLu1KwaZBF1YdRbKNJmGCYD
         kF3UMfZlBZZQG5SEUBzwaZSA33YVWHQLK+lMsUz7J9WT6zAuNjjJ2X0h4bsc+9lCsULD
         dA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612165; x=1723216965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1cBbOZt36mdcwgOJ6aPskHFTTaexGabCNqRxjg6Oh0=;
        b=ptUuyTsQ1elJbQdQUWL7UX6KF0iA28DmBMP80XkG9tSRtmrbi3X0cWPW/b4SGfSLdW
         el7Trrkdul5JwM7cKB9Cjio6qcaVX8pE0G6egHPsma0Ss1Vtu/UMLB/4vhdwHpOOr49d
         QZ6M8Z0rZsTVpo1EpDovGlHfQ+3eoc2TFQEP2gRtMdwfE6RBjaAoas9Q6lzU4wG+ijfN
         QAY2qhuB+Gb/6ibZzgb9np5Y8hfYVStOVJ293pEdD2bGMHUnA2oRJDFWODLvWXNwyjgl
         U7LDMH4xTRvGDL5G5wn2YxilQsLDFipEstJfoW3FKZa+4QjT9h8+6yq8tnyG3TTosClm
         olsg==
X-Forwarded-Encrypted: i=1; AJvYcCUN7kG6Is7a4zy1qmF8++ZmSN8iCRi3ij/RM5OSbTmXaBLaU0TXXcRZjsH/+6GLJOPXf7MuO7uhhHXoUGn5Jx9jTIsIJSgrSUG02OBjYT5q
X-Gm-Message-State: AOJu0YyJgmUC0Td/kz7rEQ5aYIsRiSa4OJ4LJbQ+TfatI46r/eZJLR/o
	a0dsJWmnYybK2tqPI4sxpMyU49Sn0tv8mc6bNgDlQHgEMm6dXEOafS95HOYTgxA=
X-Google-Smtp-Source: AGHT+IGevEgshEH6AuLTp8Bo7gjdyVs7Lhu/RR9IyqwSflPacf3rHkteywexmhQW20qeFqo6GEOMhQ==
X-Received: by 2002:a05:6000:400d:b0:367:8f89:f7c9 with SMTP id ffacd0b85a97d-36bbbef1261mr3849953f8f.33.1722612165098;
        Fri, 02 Aug 2024 08:22:45 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01619csm2202892f8f.36.2024.08.02.08.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:22:44 -0700 (PDT)
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
Subject: [PATCH v3 8/9] mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
Date: Fri,  2 Aug 2024 17:14:29 +0200
Message-Id: <20240802151430.99114-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802151430.99114-1-alexghiti@rivosinc.com>
References: <20240802151430.99114-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_082247_520123_9CC65669 
X-CRM114-Status: GOOD (  13.54  )
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
index 6b84e287b72d..4ceb6cb1bec5 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -27,9 +27,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
-extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
-				    unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 658635022e4d..8d271e175848 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -266,33 +266,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
index 5d9b051ac51c..f4bb0c971bd8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -639,9 +639,8 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
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
@@ -735,6 +734,8 @@ static inline pte_t ptep_get(pte_t *ptep)
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
index 21f5c89daa6b..b00bbcc2d939 100644
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
