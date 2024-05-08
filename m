Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F317CC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6/UZ25zpsAUu/1AmocbDDJD14dG27D4OHidMM9AIdo=; b=5ExnQ/xnAP6nN0
	4C3w7lgdRktJjogl4v+i7hMiBGFlQrozo+VHcD4Q1xVM06dXMWkvIrbAQWyb44zakFXGpiWEUde2+
	IhjX89a/1bF0+TdLtZbxPjlqHA5ZX7ADCvHYBSnaTNYhfigQJuvCMtMG0tMnO/iK0gDrD7rh19jNO
	z8g3mjTf+8ZEoHCyGPDNIGrcU88qXjvtjgnmi8FrtKjQn7WS+kTD3zDF0Oe+MoC0Qic/Wd2x1EspL
	iNZ850Q4ALak+1SFOYYaVQiGDSbvK8V492s1YWE8PRRf2TnrkzdrdvhGK7cfrZjd9xwsiDu35Pvk6
	015ASSA9kKxjEkveseXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mxF-0000000Gju6-13gy;
	Wed, 08 May 2024 19:27:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mx9-0000000Gjqc-4C6r
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:27:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-41ebcf01013so899225e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715196465; x=1715801265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcfQWqIQyCa6XQTZ9KciN3KqArzYv/m686IwSCSxNEA=;
        b=biaup3lXOls5HVRQjMhn8UsqPRxZm2xe/UYlhZLeNfWVvuiYOWOoB/pUDEhtF+EngV
         WquRkLfgQrZRLoOX/8adAApDztI5D+imQjA3cFpDNdqJ+PI3hjRHdry55ePRyAowuCwA
         30IkXgxROlafJIjx8mn6ST1Oqo7KqJ6q94Yg34GQcdp+rfEfnESf5rC4xetHH2LEJ3xk
         yxZZF5rE9tlsRQmBkN9cSX6np0SZQIn4kmeOmDUzz6gA3UKD2ITGmHjZz1Cz9AcLVHWh
         frxxfEJek40/mX3X9tZ0Eh7sZwRRwcDvmdYddfZRIxLQHNtuFDaU5t/AndOMml88jWnm
         MRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196465; x=1715801265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcfQWqIQyCa6XQTZ9KciN3KqArzYv/m686IwSCSxNEA=;
        b=pbXmXV5r/mZ4eKt8q2M7AgDOM5Z5qpzZeTsbAGPkko0wHaWdvI64fdLzROI0dAQqCB
         wam9I5zSSyTJ35Hrs3XI9qigB/SRH8kxxVhNm2jrYZlphSRVyqT4URYzJefLcdwTtOAI
         qAhH1uxgX4w1y2dSq0Uh7ERUbgNi4skKmw8CUe7QsvF7acOfjUKPpra25qO5YBtU814A
         Z42oNHWe00JsUizLMEXeyVQh9kZEBASphycAG9h+MquAA2PgyUNUsVqFC3MvtrMBhwck
         ijf0o9nQ3ytXvPH4DCwtlBvHLOs4rXjcBa8Kh8PbMUr1Np567RbYI0F84LMmCakftci1
         M4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXh7HfmJxQMhComZ+HBn4KRuFiAnNHRv8UfARuZlkbdmLn+Ym/LQ6j8gZ9qBzufJwjwM1EXQeIg80TajlbJdVlUY24hxfRjTJU1G6OXJ4G4
X-Gm-Message-State: AOJu0YwqHnviV8ylbz1MOWd/POetM15LavpI47wVPr1KPeM4BF4mNlBX
	sWABxaGMphB4wIsKSplGo12/91kCJtsSY/gpE9QlMSb5T86if9uxxUJ27RJ4TI7zMsX0uPKowPH
	O
X-Google-Smtp-Source: AGHT+IG713uLBQWbwM0MRsX1LOPSAYD3hwSeYc9+OS0/mfL1VayM0FBzmqDZCPlWciEj7G1Kaomx7g==
X-Received: by 2002:a05:600c:3103:b0:41b:f43b:e263 with SMTP id 5b1f17b1804b1-41fbc12bdcbmr5274575e9.0.1715196465070;
        Wed, 08 May 2024 12:27:45 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87c24f8fsm33175985e9.15.2024.05.08.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:27:44 -0700 (PDT)
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
Subject: [PATCH 08/12] mm, riscv, arm64: Use common ptep_test_and_clear_young() function
Date: Wed,  8 May 2024 21:19:27 +0200
Message-Id: <20240508191931.46060-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_122748_081155_35F1D874 
X-CRM114-Status: GOOD (  16.47  )
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

Make riscv use the contpte aware ptep_test_and_clear_young() function from
arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++----------
 arch/arm64/mm/contpte.c          | 25 --------------------
 arch/riscv/include/asm/pgtable.h | 12 ++++++----
 arch/riscv/kvm/mmu.c             |  2 +-
 arch/riscv/mm/pgtable.c          |  2 +-
 include/linux/contpte.h          |  2 ++
 mm/contpte.c                     | 39 ++++++++++++++++++++++++++++++++
 7 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ff7fe1d9cabe..9a8702d1ad00 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1389,8 +1389,6 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep,
 				unsigned int nr, int full);
-extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep);
 extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep);
 extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
@@ -1477,16 +1475,8 @@ extern pte_t ptep_get_and_clear(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
-static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep)
-{
-	pte_t orig_pte = __ptep_get(ptep);
-
-	if (likely(!pte_valid_cont(orig_pte)))
-		return __ptep_test_and_clear_young(vma, addr, ptep);
-
-	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
-}
+extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 5e9e40145085..9bf471633ca4 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -45,31 +45,6 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 }
 EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
 
-int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
-					unsigned long addr, pte_t *ptep)
-{
-	/*
-	 * ptep_clear_flush_young() technically requires us to clear the access
-	 * flag for a _single_ pte. However, the core-mm code actually tracks
-	 * access/dirty per folio, not per page. And since we only create a
-	 * contig range when the range is covered by a single folio, we can get
-	 * away with clearing young for the whole contig range here, so we avoid
-	 * having to unfold.
-	 */
-
-	int young = 0;
-	int i;
-
-	ptep = arch_contpte_align_down(ptep);
-	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-
-	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
-		young |= __ptep_test_and_clear_young(vma, addr, ptep);
-
-	return young;
-}
-EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
-
 int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 					unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 03cd640137ed..d39cb24c6c4a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -739,8 +739,7 @@ static inline void __pte_clear(struct mm_struct *mm,
 
 extern int __ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				   pte_t *ptep, pte_t entry, int dirty);
-#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG	/* defined in mm/pgtable.c */
-extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
+extern int __ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
 				     pte_t *ptep);
 
 static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
@@ -778,7 +777,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	 * shouldn't really matter because there's no real memory
 	 * pressure for swapout to react to. ]
 	 */
-	return ptep_test_and_clear_young(vma, address, ptep);
+	return __ptep_test_and_clear_young(vma, address, ptep);
 }
 
 #ifdef CONFIG_THP_CONTPTE
@@ -797,6 +796,9 @@ extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 extern pte_t ptep_get_and_clear(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
+extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
+				     unsigned long addr, pte_t *ptep);
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -806,6 +808,8 @@ extern pte_t ptep_get_and_clear(struct mm_struct *mm,
 #define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
+#define ptep_test_and_clear_young	__ptep_test_and_clear_young
 
 #endif /* CONFIG_THP_CONTPTE */
 
@@ -987,7 +991,7 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp)
 {
-	return ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
+	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
 }
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1ee6139d495f..554926e33760 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 				   &ptep, &ptep_level))
 		return false;
 
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+	return __ptep_test_and_clear_young(NULL, 0, ptep);
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 5756bde9eb42..5f31d0594109 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -18,7 +18,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
 	return true;
 }
 
-int ptep_test_and_clear_young(struct vm_area_struct *vma,
+int __ptep_test_and_clear_young(struct vm_area_struct *vma,
 			      unsigned long address,
 			      pte_t *ptep)
 {
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 01da4bfc3af6..38092adbe0d4 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -19,5 +19,7 @@ void contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			pte_t *ptep, pte_t pte);
 void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		      pte_t *ptep, pte_t pte, unsigned int nr);
+int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
+				      unsigned long addr, pte_t *ptep);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index 5bf939639233..220e9d81f401 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -47,6 +47,7 @@
  *   - set_pte()
  *   - pte_clear()
  *   - ptep_get_and_clear()
+ *   - ptep_test_and_clear_young()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -690,4 +691,42 @@ pte_t ptep_get_and_clear(struct mm_struct *mm,
 	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
 	return __ptep_get_and_clear(mm, addr, ptep);
 }
+
+int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
+				      unsigned long addr, pte_t *ptep)
+{
+	/*
+	 * ptep_clear_flush_young() technically requires us to clear the access
+	 * flag for a _single_ pte. However, the core-mm code actually tracks
+	 * access/dirty per folio, not per page. And since we only create a
+	 * contig range when the range is covered by a single folio, we can get
+	 * away with clearing young for the whole contig range here, so we avoid
+	 * having to unfold.
+	 */
+
+	size_t pgsize;
+	int young = 0;
+	int i, ncontig;
+
+	ptep = arch_contpte_align_down(ptep);
+	ncontig = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
+	addr = ALIGN_DOWN(addr, ncontig * pgsize);
+
+	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
+		young |= __ptep_test_and_clear_young(vma, addr, ptep);
+
+	return young;
+}
+EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
+
+__always_inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
+					      unsigned long addr, pte_t *ptep)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_test_and_clear_young(vma, addr, ptep);
+
+	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
