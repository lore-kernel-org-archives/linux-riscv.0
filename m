Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD0CC61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcSE2WOBeIhXGxfpYNP3UP1XF+EnkY0Fyp7tQyVcBfI=; b=HeHrtN/hg1oSUJ
	SXkQWE3n085JYXNAMGDiXZ09fNRU7Os9ZC4evynBTNCWeOmj/TGZYJLklp07/EcqK4/Q12qKiDsaD
	UK03C/297+UaB4K6E/j3xBopMS/I/xpuBfE1zCfWNPkr12aZ2jTsOLYw59wQp+K29hdhKP1tpJIKR
	t06aXH8c/H43l7/kEnbPb9QpyKHjXMRWzaRICpELnGXZrVqOpKe/nLc21CfNVNhX3eKZ6zfZqGALg
	qfi2JOwzXAl5exXAfMvYCn1arln4FYLU3lUoDMMARiopNgCVH7eNGHi8C2hL44jLwgBM1DG4Sowcq
	CrM+6xaenxVqANDhXELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63ew-003xMe-0H;
	Thu, 23 Nov 2023 06:57:58 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63et-003xL0-04
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:57:56 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b83fc26e4cso383935b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722673; x=1701327473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBzEAwR1u2ognGkokbPIcjTus0Wt1Liku1PeiEAYDPA=;
        b=Zz+zskETm3fePiSC2+4mE5StmUXIsmN3Cyj50LqoMgL0Hyn4v/dpEtl6Eq335wafgs
         wjuLjhPNU1gt+THNalTpUMaQgM1HXXOgw72vVceshS8v3z2fEArYknoQQjzaAQXDTgNq
         RRPGns7b3men3gvX7vZS437hE81+ZEHU64Tb9TJK8FEgT7IJIutjox9SvNYf+526AZiK
         Jpph6Cv0Oo8NaYKi3RCF2wiONv5yQwyhktuwzwKV3XP1612x27Mq3fwCO0Wl296xFR1w
         //svaB2I4dEj30me3qySC6iqV/a17v8NpmnbUV5SWe5LA0APXQVgW1Pwwv7NMP+8QDF8
         7Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722673; x=1701327473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBzEAwR1u2ognGkokbPIcjTus0Wt1Liku1PeiEAYDPA=;
        b=DfXgEwJKyvY1s/qKUpzvExaTDcK1epiHqtAqDT2m0+9T8HRa8T3VcHclPR0kqa61tg
         GdIEip+hTLIfGXLnrD/ECOF2M/ynPCgI7YM2rqqEz/9V5V3Je2Fo5rJoccHoKb17/LXh
         j8g/bOxHSTLrSWuJ1yIrPZuglqfCvznMHfPO6Trwku/8wK9isbulDYHJanPZNluLAh5u
         nBpVkY6HWxc8YwKy+yQ75uyXHnjugVK7BATK1qY72vsrNiEwhuiQ1uKXyeWeyMZzXgeM
         u3LaQrv+2hP9t5JXCeN1o1Hl3bdtaTkofmwflG1hV8OWGZSSg7hyzqGQmiOkf4rvb9N/
         tpPA==
X-Gm-Message-State: AOJu0YzE9fhU68NXi41/XDOfT87v0jUiBoBUOXhYUPRalEs1xhKFo7rf
	GLg1mXji8muXIrBwC6VmVCMVzQ==
X-Google-Smtp-Source: AGHT+IGHKuk0EJS7EQTCzidInz2QrgpsRuY4bxBytkNm9OOr3Q4F5OcNYuewzXuJd5Dzw7DfQuJfmg==
X-Received: by 2002:a54:4885:0:b0:3af:b6d3:cda0 with SMTP id r5-20020a544885000000b003afb6d3cda0mr5487295oic.40.1700722673045;
        Wed, 22 Nov 2023 22:57:53 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:57:52 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 05/11] riscv: Decouple pmd operations and pte operations
Date: Thu, 23 Nov 2023 14:57:02 +0800
Message-Id: <20231123065708.91345-6-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225755_059983_FF5086C0 
X-CRM114-Status: GOOD (  13.05  )
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

Existing pmd operations are usually implemented via pte operations. For
example, the pmd_mkdirty function, which is used to mark a pmd_t struct
as dirty, will transfer pmd_t struct to pte_t struct via pmd_pte first,
mark the generated pte_t as dirty then, and finally transfer it back to
pmd_t struct via pte_pmd function. Such implementation introduces
unnecessary overhead of struct transferring. Also, Now that pte_t struct
is a number of page table entries, which can be larger than pmd_t
struct, functions like set_pmd_at implemented via set_pte_at will cause
write amplifications.

This commit decouples pmd operations and pte operations. Pmd operations
are now implemented independently of pte operations.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable-64.h |   6 ++
 arch/riscv/include/asm/pgtable.h    | 124 +++++++++++++++++++++-------
 include/asm-generic/pgtable-nopmd.h |   1 +
 include/linux/pgtable.h             |   6 ++
 4 files changed, 108 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 1926727698fc..95e785f2160c 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -206,6 +206,12 @@ static inline int pud_leaf(pud_t pud)
 	return pud_present(pud) && (pud_val(pud) & _PAGE_LEAF);
 }
 
+#define pud_exec	pud_exec
+static inline int pud_exec(pud_t pud)
+{
+	return pud_val(pud) & _PAGE_EXEC;
+}
+
 static inline int pud_user(pud_t pud)
 {
 	return pud_val(pud) & _PAGE_USER;
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d50c4588c1ed..9f81fe046cb8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -272,6 +272,18 @@ static inline int pmd_leaf(pmd_t pmd)
 	return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
 }
 
+#define pmd_exec	pmd_exec
+static inline int pmd_exec(pmd_t pmd)
+{
+	return pmd_val(pmd) & _PAGE_EXEC;
+}
+
+#define __HAVE_ARCH_PMD_SAME
+static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
+{
+	return pmd_val(pmd_a) == pmd_val(pmd_b);
+}
+
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
 	*pmdp = pmd;
@@ -506,7 +518,7 @@ static inline int pte_protnone(pte_t pte)
 
 static inline int pmd_protnone(pmd_t pmd)
 {
-	return pte_protnone(pmd_pte(pmd));
+	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) == _PAGE_PROT_NONE;
 }
 #endif
 
@@ -740,73 +752,95 @@ static inline unsigned long pud_pfn(pud_t pud)
 
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
-	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
+	unsigned long newprot_val = pgprot_val(newprot);
+
+	ALT_THEAD_PMA(newprot_val);
+
+	return __pmd((pmd_val(pmd) & _PAGE_CHG_MASK) | newprot_val);
 }
 
 #define pmd_write pmd_write
 static inline int pmd_write(pmd_t pmd)
 {
-	return pte_write(pmd_pte(pmd));
+	return pmd_val(pmd) & _PAGE_WRITE;
 }
 
 static inline int pmd_dirty(pmd_t pmd)
 {
-	return pte_dirty(pmd_pte(pmd));
+	return pmd_val(pmd) & _PAGE_DIRTY;
 }
 
 #define pmd_young pmd_young
 static inline int pmd_young(pmd_t pmd)
 {
-	return pte_young(pmd_pte(pmd));
+	return pmd_val(pmd) & _PAGE_ACCESSED;
 }
 
 static inline int pmd_user(pmd_t pmd)
 {
-	return pte_user(pmd_pte(pmd));
+	return pmd_val(pmd) & _PAGE_USER;
 }
 
 static inline pmd_t pmd_mkold(pmd_t pmd)
 {
-	return pte_pmd(pte_mkold(pmd_pte(pmd)));
+	return __pmd(pmd_val(pmd) & ~(_PAGE_ACCESSED));
 }
 
 static inline pmd_t pmd_mkyoung(pmd_t pmd)
 {
-	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
+	return __pmd(pmd_val(pmd) | _PAGE_ACCESSED);
 }
 
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
-	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
+	return __pmd(pmd_val(pmd) | _PAGE_WRITE);
 }
 
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
-	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));
+	return __pmd(pmd_val(pmd) & (~_PAGE_WRITE));
 }
 
 static inline pmd_t pmd_mkclean(pmd_t pmd)
 {
-	return pte_pmd(pte_mkclean(pmd_pte(pmd)));
+	return __pmd(pmd_val(pmd) & (~_PAGE_DIRTY));
 }
 
 static inline pmd_t pmd_mkdirty(pmd_t pmd)
 {
-	return pte_pmd(pte_mkdirty(pmd_pte(pmd)));
+	return __pmd(pmd_val(pmd) | _PAGE_DIRTY);
+}
+
+#define pmd_accessible(mm, pmd)		((void)(pmd), 1)
+
+static inline void __set_pmd_at(pmd_t *pmdp, pmd_t pmd)
+{
+	if (pmd_present(pmd) && pmd_exec(pmd))
+		flush_icache_pte(pmd_pte(pmd));
+
+	set_pmd(pmdp, pmd);
 }
 
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd)
 {
 	page_table_check_pmd_set(mm, pmdp, pmd);
-	return __set_pte_at((pte_t *)pmdp, pmd_pte(pmd));
+	return __set_pmd_at(pmdp, pmd);
+}
+
+static inline void __set_pud_at(pud_t *pudp, pud_t pud)
+{
+	if (pud_present(pud) && pud_exec(pud))
+		flush_icache_pte(pud_pte(pud));
+
+	set_pud(pudp, pud);
 }
 
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud)
 {
 	page_table_check_pud_set(mm, pudp, pud);
-	return __set_pte_at((pte_t *)pudp, pud_pte(pud));
+	return __set_pud_at(pudp, pud);
 }
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
@@ -826,25 +860,64 @@ static inline bool pud_user_accessible_page(pud_t pud)
 }
 #endif
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-static inline int pmd_trans_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
 #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
 static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp,
 					pmd_t entry, int dirty)
 {
-	return ptep_set_access_flags(vma, address, (pte_t *)pmdp, pmd_pte(entry), dirty);
+	if (!pmd_same(*pmdp, entry))
+		set_pmd_at(vma->vm_mm, address, pmdp, entry);
+	/*
+	 * update_mmu_cache will unconditionally execute, handling both
+	 * the case that the PMD changed and the spurious fault case.
+	 */
+	return true;
+}
+
+#define __HAVE_ARCH_PMDP_GET_AND_CLEAR
+static inline pmd_t pmdp_get_and_clear(struct mm_struct *mm,
+					unsigned long address, pmd_t *pmdp)
+{
+	pmd_t pmd = __pmd(atomic_long_xchg((atomic_long_t *)pmdp, 0));
+
+	page_table_check_pmd_clear(mm, pmd);
+
+	return pmd;
+}
+
+#define __HAVE_ARCH_PMDP_SET_WRPROTECT
+static inline void pmdp_set_wrprotect(struct mm_struct *mm,
+					unsigned long address, pmd_t *pmdp)
+{
+	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)pmdp);
+}
+
+#define __HAVE_ARCH_PMDP_CLEAR_FLUSH
+static inline pmd_t pmdp_clear_flush(struct vm_area_struct *vma,
+					unsigned long address, pmd_t *pmdp)
+{
+	struct mm_struct *mm = (vma)->vm_mm;
+	pmd_t pmd = pmdp_get_and_clear(mm, address, pmdp);
+
+	if (pmd_accessible(mm, pmd))
+		flush_tlb_page(vma, address);
+
+	return pmd;
 }
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
 static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp)
 {
-	return ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
+	if (!pmd_young(*pmdp))
+		return 0;
+	return test_and_clear_bit(_PAGE_ACCESSED_OFFSET, &pmd_val(*pmdp));
+}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline int pmd_trans_huge(pmd_t pmd)
+{
+	return pmd_leaf(pmd);
 }
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
@@ -858,13 +931,6 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 	return pmd;
 }
 
-#define __HAVE_ARCH_PMDP_SET_WRPROTECT
-static inline void pmdp_set_wrprotect(struct mm_struct *mm,
-					unsigned long address, pmd_t *pmdp)
-{
-	ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
-}
-
 #define pmdp_establish pmdp_establish
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp, pmd_t pmd)
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 8ffd64e7a24c..acef201b29f5 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -32,6 +32,7 @@ static inline int pud_bad(pud_t pud)		{ return 0; }
 static inline int pud_present(pud_t pud)	{ return 1; }
 static inline int pud_user(pud_t pud)		{ return 0; }
 static inline int pud_leaf(pud_t pud)		{ return 0; }
+static inline int pud_exec(pud_t pud)		{ return 0; }
 static inline void pud_clear(pud_t *pud)	{ }
 #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index af7639c3b0a3..b8d6e39fefc2 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1630,9 +1630,15 @@ typedef unsigned int pgtbl_mod_mask;
 #ifndef pud_leaf
 #define pud_leaf(x)	0
 #endif
+#ifndef pud_exec
+#define pud_exec(x)	0
+#endif
 #ifndef pmd_leaf
 #define pmd_leaf(x)	0
 #endif
+#ifndef pmd_exec
+#define pmd_exec(x)	0
+#endif
 
 #ifndef pgd_leaf_size
 #define pgd_leaf_size(x) (1ULL << PGDIR_SHIFT)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
