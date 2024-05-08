Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234E6C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oxqj89OmQfFXyMW3m952lq346HlGZxQw0xlw4+wAVrQ=; b=yS5lDkWIkItEUt
	X8XwKofwxYHDGmu1odlk7wiPAoYHb5AC7NG6duWi5RC/StQlTmwfbCRKxgeSiyApk0fUxq/dkiyGC
	9hE1cRFGoFQE/OjGWCthDbcOnmxHSm1Iq/JfCmtq99e1Mty5zCuXHH3xNDDnTpsYXIeDYUt5FwxRL
	bfKWZPc7ZCvUOwuAUJgE8ciXITdaPF8N/rb6b8moGUGu7X6l9HuLBBYDuR4WZdVvCQVSLuFgUNiaV
	SGLeHJLMwONpBGSYDUx58GOXJZLTZvX8eNrFRRjyjUI7nYJoIFYNUDLK9O71D9YrSv1YUVEIFsJhu
	ds5P8FlVbD2Hh5FAKbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mzE-0000000Gkam-39D7;
	Wed, 08 May 2024 19:29:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mz8-0000000GkX7-0sh0
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:29:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-41b794510cdso611835e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715196587; x=1715801387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uckq1a6OF7H/9ROfgD12E/DRrLJPxYkFYbl5+hSyETI=;
        b=iLUER6YmnJUGR0/ODaBehjGEsKRbIQR+z994kMSjTjLmm+/iy7FxYeK8uLRSqjBPQp
         4T0G9TC9elLg+cquOgU6SGhB3jhYEmdY4VHh6HD7paIffIzabpmLJP7n1tjNMs1/PBL4
         gH+/OTjWdlFdoP/NnsFTR1pC6HrueOegYDyd4ZUHRhE3HA8i1m+kfoQA9CXxNm8H/gAw
         /Md/QVxg9mBioGt7oi2ZYbB17la9INZlTJEILACebxbIoxR6mFWh3V8MYNqZdTf0Y6/W
         trs3QtTsEArLUtgyMhwNn84hdxgFFj1LV1iRKU0f7G84wyX2SESeytbX3yuuReub8zW4
         wx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196587; x=1715801387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uckq1a6OF7H/9ROfgD12E/DRrLJPxYkFYbl5+hSyETI=;
        b=ryK80q3dNaQDUUBuirN8dqPhipyJKhNR+fLEHT6YxPdyVQcpGX/5mikKzQswtkOSxJ
         D3kPeOxmRoZRQ/lGaLSYvs44n5vHzEihJD3f6jnfJKzNs9VpRZa9kybvvNBpwehClfUF
         f9wZND9Zv9GmO3qwm06XgezOipWs3IjFEnYn3i7wGNRcawRrimVeZXVy2lBjN9pJtgyn
         6vvrc21g/+7xraGv7r54nOa8zvvN3cdUt1YWo0JnPYer5g2q/Bw6xrAodfKey+fi8Uf0
         9G8fy3oWASjE/qz4Chxfkfgc5dnJBlFmFvCTbiqSwjQplRlHYCZOu0gZ020Qb7dEFZHa
         7esg==
X-Forwarded-Encrypted: i=1; AJvYcCW38fnB+QZl3cSEJBKrzkgqCxtPf9utN7rJEMmQ3WwCXD3MuVR1iwqWKKZZfsyJlnyBIVGykxlo0VBTVcLr5kD1qii3DPo0qaLg5CdQ/YNh
X-Gm-Message-State: AOJu0YzHurM20WjMdmOmRPYLZu2+vSmUMUnTem62YZAeG2haB+5L5qid
	RaNb/EMiDomXLgrxBaQGVssL8grHFImPpFqDcrjg6N6DpOUqu7A++Lu+VebWQis=
X-Google-Smtp-Source: AGHT+IGQ61Vb4NuwkawA/0/DWqDCfOJMo7+D5f/tM30tLGXtIG6xkHE311QLb6FnYOpUeATe3M4jpQ==
X-Received: by 2002:a05:600c:4e93:b0:41b:fc3a:f1ef with SMTP id 5b1f17b1804b1-41f71acca18mr25217385e9.33.1715196587426;
        Wed, 08 May 2024 12:29:47 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id d16-20020a05600c34d000b00419f572671dsm3314921wmq.20.2024.05.08.12.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:29:47 -0700 (PDT)
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
Subject: [PATCH 10/12] mm, riscv, arm64: Use common ptep_set_access_flags() function
Date: Wed,  8 May 2024 21:19:29 +0200
Message-Id: <20240508191931.46060-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_122950_260623_1951DF84 
X-CRM114-Status: GOOD (  20.26  )
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

Make riscv use the contpte aware ptep_set_access_flags() function from
arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 19 ++--------
 arch/arm64/mm/contpte.c          | 46 -----------------------
 arch/riscv/include/asm/pgtable.h | 10 +++--
 include/linux/contpte.h          |  3 ++
 mm/contpte.c                     | 63 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+), 65 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 92c12fb85cb4..6591aab11c67 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1391,9 +1391,6 @@ extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned int nr, int full);
 extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr);
-extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep,
-				pte_t entry, int dirty);
 
 #define pte_batch_hint pte_batch_hint
 static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
@@ -1512,19 +1509,9 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
-static inline int ptep_set_access_flags(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep,
-				pte_t entry, int dirty)
-{
-	pte_t orig_pte = __ptep_get(ptep);
-
-	entry = pte_mknoncont(entry);
-
-	if (likely(!pte_valid_cont(orig_pte)))
-		return __ptep_set_access_flags(vma, addr, ptep, entry, dirty);
-
-	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
-}
+extern int ptep_set_access_flags(struct vm_area_struct *vma,
+				 unsigned long addr, pte_t *ptep,
+				 pte_t entry, int dirty);
 
 #else /* CONFIG_THP_CONTPTE */
 
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 16940511943c..5675a61452ac 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -62,49 +62,3 @@ void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 	__wrprotect_ptes(mm, addr, ptep, nr);
 }
 EXPORT_SYMBOL_GPL(contpte_wrprotect_ptes);
-
-int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
-					unsigned long addr, pte_t *ptep,
-					pte_t entry, int dirty)
-{
-	unsigned long start_addr;
-	pte_t orig_pte;
-	int i;
-
-	/*
-	 * Gather the access/dirty bits for the contiguous range. If nothing has
-	 * changed, its a noop.
-	 */
-	orig_pte = pte_mknoncont(ptep_get(ptep));
-	if (pte_val(orig_pte) == pte_val(entry))
-		return 0;
-
-	/*
-	 * We can fix up access/dirty bits without having to unfold the contig
-	 * range. But if the write bit is changing, we must unfold.
-	 */
-	if (pte_write(orig_pte) == pte_write(entry)) {
-		/*
-		 * For HW access management, we technically only need to update
-		 * the flag on a single pte in the range. But for SW access
-		 * management, we need to update all the ptes to prevent extra
-		 * faults. Avoid per-page tlb flush in __ptep_set_access_flags()
-		 * and instead flush the whole range at the end.
-		 */
-		ptep = arch_contpte_align_down(ptep);
-		start_addr = addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-
-		for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
-			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
-
-		if (dirty)
-			__flush_tlb_range(vma, start_addr, addr,
-							PAGE_SIZE, true, 3);
-	} else {
-		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
-		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
-	}
-
-	return 1;
-}
-EXPORT_SYMBOL_GPL(contpte_ptep_set_access_flags);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 42c7884b8d2e..b151a5aa4de8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -803,6 +803,10 @@ extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+extern int ptep_set_access_flags(struct vm_area_struct *vma,
+				 unsigned long address, pte_t *ptep,
+				 pte_t entry, int dirty);
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -816,11 +820,11 @@ extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define ptep_test_and_clear_young	__ptep_test_and_clear_young
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define ptep_clear_flush_young	__ptep_clear_flush_young
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+#define ptep_set_access_flags	__ptep_set_access_flags
 
 #endif /* CONFIG_THP_CONTPTE */
 
-#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
-#define ptep_set_access_flags	__ptep_set_access_flags
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 #define ptep_set_wrprotect	__ptep_set_wrprotect
 
@@ -990,7 +994,7 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp,
 					pmd_t entry, int dirty)
 {
-	return ptep_set_access_flags(vma, address, (pte_t *)pmdp, pmd_pte(entry), dirty);
+	return __ptep_set_access_flags(vma, address, (pte_t *)pmdp, pmd_pte(entry), dirty);
 }
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 76a49ac8b6f5..76244b0c678a 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -23,5 +23,8 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep);
 int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
+int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep,
+				  pte_t entry, int dirty);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index 600277b1196c..9cbbff1f67ad 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -769,4 +769,67 @@ __always_inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 
 	return contpte_ptep_clear_flush_young(vma, addr, ptep);
 }
+
+int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep,
+				  pte_t entry, int dirty)
+{
+	unsigned long start_addr;
+	pte_t orig_pte;
+	int i;
+
+	/*
+	 * Gather the access/dirty bits for the contiguous range. If nothing has
+	 * changed, its a noop.
+	 */
+	orig_pte = pte_mknoncont(ptep_get(ptep));
+	if (pte_val(orig_pte) == pte_val(entry))
+		return 0;
+
+	/*
+	 * We can fix up access/dirty bits without having to unfold the contig
+	 * range. But if the write bit is changing, we must unfold.
+	 */
+	if (pte_write(orig_pte) == pte_write(entry)) {
+		/*
+		 * For HW access management, we technically only need to update
+		 * the flag on a single pte in the range. But for SW access
+		 * management, we need to update all the ptes to prevent extra
+		 * faults. Avoid per-page tlb flush in __ptep_set_access_flags()
+		 * and instead flush the whole range at the end.
+		 */
+		size_t pgsize;
+		int ncontig;
+
+		ptep = arch_contpte_align_down(ptep);
+		ncontig = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
+		start_addr = addr = ALIGN_DOWN(addr, ncontig * pgsize);
+
+		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
+			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
+
+		if (dirty)
+			arch_contpte_flush_tlb_range(vma, start_addr, addr, pgsize);
+	} else {
+		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
+		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+	}
+
+	return 1;
+}
+EXPORT_SYMBOL_GPL(contpte_ptep_set_access_flags);
+
+__always_inline int ptep_set_access_flags(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep,
+					  pte_t entry, int dirty)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	entry = pte_mknoncont(entry);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+
+	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
