Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662A5C25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAJ+mSsM1hfPxBc/fHuKygOa0oHihL2mSfPNHpLAkv8=; b=ySVzctZiPxWEZW
	Oqblo4G3qN7fhjWaXfmFHFphkACj4/PYRDTV2X0yOc80wrUuYChPs3CbEdQq10bffjJ6RDexUvOx4
	jcnICAhAq31Ik6UsGTmua92R0gZY+/fTGWEfyElKkCq6TrSKizxDQD0MfAzOgxLP5LfNYWrfwDBdX
	dLjfPkwDXfwIY0qaS8CWprY0tfpKMM7fOSDZwRbQeuXk5kv2dajcCnmh6gMutbT0Ojvzka9g3wEb8
	2aFJTS7hvJp9L4bN9HoYIm/c9r3Z3HtBBoNQvqTPMdr/rJPH8YVERbdq9+NArkveSVbIoWqU6ypKk
	V7W0Y5Zrc01adzfe9CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4n0F-0000000Gkxe-29NL;
	Wed, 08 May 2024 19:30:59 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4n07-0000000GktZ-1vbD
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:30:53 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e0a34b2899so1964771fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715196649; x=1715801449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1s8quCXzhpwj2tdUrwB8sMaHFPnndxHFKfGkIDXtWo=;
        b=QcUpKHm2C5Z2YEYsURvZ2S9P8DWZ+oF7mecbKm4winzL5yxvqDa4SaaWII8IfClolv
         DtQ6b2vJFSZq8f2v88dyfIu9QBmsV0Y3l5McxObwuT1cU3qsTi2dowzTx+pWtGqhm9C5
         vLl7u3010bmgwLsz3oAifR3MGj8pl70JHS9d8596khXbKrMRgqd8ZLnIWo91aXLJdz8g
         L2OU+wI8mHgXA7yPO23dsOHInJJfoqgcuyh8Rm5ZxiYew/vHnKAr9P+ekJpb80ayjTU6
         unBnzUVrK9gND4+NTBXC0D0xlmr/AHhpDfKFt1WIbXjlkspXmr+HX1dMAoLhfi4t1Ya4
         bgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196649; x=1715801449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1s8quCXzhpwj2tdUrwB8sMaHFPnndxHFKfGkIDXtWo=;
        b=aASMqBOqzb58O80WTbZ/Js1lacx9CpKAHZHdOkGm1p5SgnbAow+LrxadIF4tYpjjC+
         /Hk3SP9Dh4Od/cwwOMuUf6zXKFg86V6JOCCHPpl0+c+Pqi5qE1eFv6oLPgPo+I+HslR1
         mFY8JCGqVfJK5uSAAi2MIlwQpBJvN7aiVLf4F0l+Lhnlwrzv+ANfNBL+2BJs95PzGMhP
         GqA0BnbLhPtKLxYIYSDo9V1OnwqL20J9e9myEEq5mNBUk8yRWA8UAzslJ/TnM6c1SK9F
         8kTZgF/l+dy2enjoRWNxZY6r2t5O9nBPLbX8e9rDkyIKhx39USWTNVPAajt4jYAWLLV3
         bsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnGDFSc+Z9UNDXQ5IrXt+mbGrGl9o8FzhH3y0WVOQKQxmNwYfUwbshe7XAE9BKMfBdpQTn1T7H8FVA06M/LdyavxcC2nK1zDtSvB8qXsPj
X-Gm-Message-State: AOJu0YwYvSlnQZ1vRkTWX06unwEIweGRHKF/wyVBDekZrtLI5qM/6dHY
	9lUVW1gOD9g4YyTJMop4g33B7BithbIt+rzA2YL3oQrwU0PDNgNG9GiD7CKpB0w=
X-Google-Smtp-Source: AGHT+IGXrMpV3e8NWTuY3a54mvQHDm5XG0kBaIk0g0HXiaoXOXDbgZBz/5WZyQXp8WNGVe1a2PspPg==
X-Received: by 2002:a05:651c:1541:b0:2df:e192:47ec with SMTP id 38308e7fff4ca-2e447081ef2mr37890971fa.29.1715196648606;
        Wed, 08 May 2024 12:30:48 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b15-20020a05600c4e0f00b0041aa79f27a0sm3273819wmq.38.2024.05.08.12.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:30:48 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 11/12] mm, riscv, arm64: Use common ptep_set_wrprotect()/wrprotect_ptes() functions
Date: Wed,  8 May 2024 21:19:30 +0200
Message-Id: <20240508191931.46060-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_123051_550069_507A8009 
X-CRM114-Status: GOOD (  21.67  )
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

Make riscv use the contpte aware ptep_set_wrprotect()/wrprotect_ptes()
function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 56 ++++++------------------
 arch/arm64/mm/contpte.c          | 18 --------
 arch/riscv/include/asm/pgtable.h | 25 +++++++++--
 include/linux/contpte.h          |  2 +
 mm/contpte.c                     | 75 +++++++++++++++++++++++++++++++-
 5 files changed, 110 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6591aab11c67..162efd9647dd 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1208,7 +1208,11 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
+/*
+ * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
+ * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
+ */
+static inline void __ptep_set_wrprotect(struct mm_struct *mm,
 					unsigned long address, pte_t *ptep,
 					pte_t pte)
 {
@@ -1222,23 +1226,13 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
 	} while (pte_val(pte) != pte_val(old_pte));
 }
 
-/*
- * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
- * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
- */
-static inline void __ptep_set_wrprotect(struct mm_struct *mm,
-					unsigned long address, pte_t *ptep)
-{
-	___ptep_set_wrprotect(mm, address, ptep, __ptep_get(ptep));
-}
-
 static inline void __wrprotect_ptes(struct mm_struct *mm, unsigned long address,
 				pte_t *ptep, unsigned int nr)
 {
 	unsigned int i;
 
 	for (i = 0; i < nr; i++, address += PAGE_SIZE, ptep++)
-		__ptep_set_wrprotect(mm, address, ptep);
+		__ptep_set_wrprotect(mm, address, ptep, __ptep_get(ptep));
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -1246,7 +1240,7 @@ static inline void __wrprotect_ptes(struct mm_struct *mm, unsigned long address,
 static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pmd_t *pmdp)
 {
-	__ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
+	__ptep_set_wrprotect(mm, address, (pte_t *)pmdp, __ptep_get((pte_t *)pmdp));
 }
 
 #define pmdp_establish pmdp_establish
@@ -1389,8 +1383,6 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep,
 				unsigned int nr, int full);
-extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
-				pte_t *ptep, unsigned int nr);
 
 #define pte_batch_hint pte_batch_hint
 static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
@@ -1478,35 +1470,12 @@ extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep);
 
 #define wrprotect_ptes wrprotect_ptes
-static __always_inline void wrprotect_ptes(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep, unsigned int nr)
-{
-	if (likely(nr == 1)) {
-		/*
-		 * Optimization: wrprotect_ptes() can only be called for present
-		 * ptes so we only need to check contig bit as condition for
-		 * unfold, and we can remove the contig bit from the pte we read
-		 * to avoid re-reading. This speeds up fork() which is sensitive
-		 * for order-0 folios. Equivalent to contpte_try_unfold().
-		 */
-		pte_t orig_pte = __ptep_get(ptep);
-
-		if (unlikely(pte_cont(orig_pte))) {
-			__contpte_try_unfold(mm, addr, ptep, orig_pte);
-			orig_pte = pte_mknoncont(orig_pte);
-		}
-		___ptep_set_wrprotect(mm, addr, ptep, orig_pte);
-	} else {
-		contpte_wrprotect_ptes(mm, addr, ptep, nr);
-	}
-}
+extern void wrprotect_ptes(struct mm_struct *mm,
+			   unsigned long addr, pte_t *ptep, unsigned int nr);
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep)
-{
-	wrprotect_ptes(mm, addr, ptep, 1);
-}
+extern void ptep_set_wrprotect(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
@@ -1528,7 +1497,8 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma,
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define ptep_clear_flush_young			__ptep_clear_flush_young
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-#define ptep_set_wrprotect			__ptep_set_wrprotect
+#define ptep_set_wrprotect(mm, addr, ptep)					\
+			__ptep_set_wrprotect(mm, addr, ptep, __ptep_get(ptep))
 #define wrprotect_ptes				__wrprotect_ptes
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags			__ptep_set_access_flags
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 5675a61452ac..1cef93b15d6e 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -44,21 +44,3 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 	return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
 }
 EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
-
-void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
-					pte_t *ptep, unsigned int nr)
-{
-	/*
-	 * If wrprotecting an entire contig range, we can avoid unfolding. Just
-	 * set wrprotect and wait for the later mmu_gather flush to invalidate
-	 * the tlb. Until the flush, the page may or may not be wrprotected.
-	 * After the flush, it is guaranteed wrprotected. If it's a partial
-	 * range though, we must unfold, because we can't have a case where
-	 * CONT_PTE is set but wrprotect applies to a subset of the PTEs; this
-	 * would cause it to continue to be unpredictable after the flush.
-	 */
-
-	contpte_try_unfold_partial(mm, addr, ptep, nr);
-	__wrprotect_ptes(mm, addr, ptep, nr);
-}
-EXPORT_SYMBOL_GPL(contpte_wrprotect_ptes);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b151a5aa4de8..728f31da5e6a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -755,11 +755,21 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 }
 
 static inline void __ptep_set_wrprotect(struct mm_struct *mm,
-					unsigned long address, pte_t *ptep)
+					unsigned long address, pte_t *ptep,
+					pte_t pte)
 {
 	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
 }
 
+static inline void __wrprotect_ptes(struct mm_struct *mm, unsigned long address,
+				    pte_t *ptep, unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++, address += PAGE_SIZE, ptep++)
+		__ptep_set_wrprotect(mm, address, ptep, __ptep_get(ptep));
+}
+
 static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
 					   unsigned long address, pte_t *ptep)
 {
@@ -807,6 +817,12 @@ extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
 				 pte_t entry, int dirty);
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+extern void ptep_set_wrprotect(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep);
+extern void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, unsigned int nr);
+#define wrprotect_ptes	wrprotect_ptes
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -822,12 +838,13 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma,
 #define ptep_clear_flush_young	__ptep_clear_flush_young
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+#define ptep_set_wrprotect(mm, addr, ptep)					\
+			__ptep_set_wrprotect(mm, addr, ptep, __ptep_get(ptep))
+#define wrprotect_ptes		__wrprotect_ptes
 
 #endif /* CONFIG_THP_CONTPTE */
 
-#define __HAVE_ARCH_PTEP_SET_WRPROTECT
-#define ptep_set_wrprotect	__ptep_set_wrprotect
-
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 76244b0c678a..d1439db1706c 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -26,5 +26,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep,
 				  pte_t entry, int dirty);
+void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, unsigned int nr);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index 9cbbff1f67ad..fe36b6b1d20a 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -49,6 +49,8 @@
  *   - ptep_get_and_clear()
  *   - ptep_test_and_clear_young()
  *   - ptep_clear_flush_young()
+ *   - wrprotect_ptes()
+ *   - ptep_set_wrprotect()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -266,7 +268,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	pte_t pte;
 
 	if (!pte_cont(__ptep_get(ptep))) {
-		__ptep_set_wrprotect(mm, addr, ptep);
+		__ptep_set_wrprotect(mm, addr, ptep, __ptep_get(ptep));
 		return;
 	}
 
@@ -832,4 +834,75 @@ __always_inline int ptep_set_access_flags(struct vm_area_struct *vma,
 
 	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
 }
+
+static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
+				       pte_t *ptep, unsigned int nr)
+{
+	/*
+	 * Unfold any partially covered contpte block at the beginning and end
+	 * of the range.
+	 */
+	size_t pgsize;
+	int ncontig;
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+
+	if (ptep != arch_contpte_align_down(ptep) || nr < ncontig)
+		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+
+	if (ptep + nr != arch_contpte_align_down(ptep + nr)) {
+		unsigned long last_addr = addr + pgsize * (nr - 1);
+		pte_t *last_ptep = ptep + nr - 1;
+
+		contpte_try_unfold(mm, last_addr, last_ptep,
+				   __ptep_get(last_ptep));
+	}
+}
+
+void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, unsigned int nr)
+{
+	/*
+	 * If wrprotecting an entire contig range, we can avoid unfolding. Just
+	 * set wrprotect and wait for the later mmu_gather flush to invalidate
+	 * the tlb. Until the flush, the page may or may not be wrprotected.
+	 * After the flush, it is guaranteed wrprotected. If it's a partial
+	 * range though, we must unfold, because we can't have a case where
+	 * CONT_PTE is set but wrprotect applies to a subset of the PTEs; this
+	 * would cause it to continue to be unpredictable after the flush.
+	 */
+
+	contpte_try_unfold_partial(mm, addr, ptep, nr);
+	__wrprotect_ptes(mm, addr, ptep, nr);
+}
+EXPORT_SYMBOL_GPL(contpte_wrprotect_ptes);
+
+__always_inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, unsigned int nr)
+{
+	if (likely(nr == 1)) {
+		/*
+		 * Optimization: wrprotect_ptes() can only be called for present
+		 * ptes so we only need to check contig bit as condition for
+		 * unfold, and we can remove the contig bit from the pte we read
+		 * to avoid re-reading. This speeds up fork() which is sensitive
+		 * for order-0 folios. Equivalent to contpte_try_unfold().
+		 */
+		pte_t orig_pte = __ptep_get(ptep);
+
+		if (unlikely(pte_cont(orig_pte))) {
+			__contpte_try_unfold(mm, addr, ptep, orig_pte);
+			orig_pte = pte_mknoncont(orig_pte);
+		}
+		__ptep_set_wrprotect(mm, addr, ptep, orig_pte);
+	} else {
+		contpte_wrprotect_ptes(mm, addr, ptep, nr);
+	}
+}
+
+__always_inline void ptep_set_wrprotect(struct mm_struct *mm,
+					unsigned long addr, pte_t *ptep)
+{
+	wrprotect_ptes(mm, addr, ptep, 1);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
