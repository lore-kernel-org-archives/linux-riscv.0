Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C89AC678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 07:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgwYqv5UJ8HXRbuwSZbqHIwBPWlaA6Q0AMny61hP1LE=; b=cglbtNKMYDJiM6
	BxWrH84/1SWunXEEGFT77sfMM4vfmx/Z0E9NB1XmDqbbuZn6uDstM0WQSbF1AXLqICPtU7FxKFIiB
	WeR9XEOa6PxZrOUO9SLEL9ZICZX0C/HkWJjxJH9oKrR84MUbz7b8PwGRgb+PvNYC1FlZ7tp4kWYHW
	EL3CaMXHvDbH52oV10YgctwnVRmqsnixyZ2aExuZDwA+fLdbVbIL+AtxJxyxsZILbJYz5yOob3vyy
	D4nGAzWh+AKM2WhkYFFXbJ+NAn/scijFv9yJ0NGdh+jOIBGdnmA1GtD/O/1OKllFAo2W8kfIwat+5
	5mRviGYGH0L7RfGebi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoY1-003qsR-UL; Wed, 08 Mar 2023 07:49:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoXy-003qqr-F0
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 07:49:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so1414638pjg.4
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 23:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678261753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nANZ/AEizVK00WW+NXyTxsSz9Dafh4Hiu4P+cprkVjI=;
        b=PRt8Z+8/6leKouZ3733vsIuX8oBlOdmKx/BwYKdg+yWW8PiNjUcp03T+TVU17Q1G5Z
         9yoaKT9oWMgW4YwCOQUCuPq979MRBlZfVP2fAaJnVe0ACFMn6WTIXmQfoJnoH+xgoBON
         AZcXPBvp6kdZdZjxDPC25anvbXUVmBSA1mt3w/wQfv0MWC4nFTdGxvFbUfdHvaeYLARO
         vtBbspFrLPOSXSbs1WS41bBw5W2PC2PVh9G0I4bzGa18evuNGcad8KXSZ5EoyRHk5rRu
         wTByOSOlBDCtLHhI0+yB4GqHhzqqn9+wEdcjeCQQLJb4pBbYVWsCW8T23Vgec0wUuToW
         CpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678261753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nANZ/AEizVK00WW+NXyTxsSz9Dafh4Hiu4P+cprkVjI=;
        b=x1AUc1f9tj+Nts31+TFj4P51FVHsz6Uvd4DOQWAl8ZeDu51fnvDR8impcdzZ+RnViX
         uE6NLA/AYZhuHTbr7Kn8OxTaqTDXeeZ11cB10d22gIXHjoiBV558k7dPoAbhXvPxKzFE
         0ERaUHvmZ33JD24CEFrR2CUQns3Eu63mf+BhiPWQP9CSXzD5RNT3vEqAErplJYm3M4uD
         ZJlvaBVctCB3Ezv4D9j5Ls2b8nEl+W57BQD292fyJBkeI6ATXt9ejLZvqutKRhl0Uidc
         O28KmNNC7flIBqL5l6nIOoHxGTrmy6SMf7cdiR30LAEnxtBKJp4nVmLnvCk68r2/C5eu
         VfJw==
X-Gm-Message-State: AO0yUKW/0YZobuw8gPsVVt71UYJzE6RTyGLJrdmsd8LA4CITUnnhEzeI
	crsylhtOrVDLPuyezvF6vDM=
X-Google-Smtp-Source: AK7set/d0NfMCaPx7ibKcLUQ01osjAAa85ZWXsUrTy9BmPtYfqDKzePtt5XSS6s5ygcYVZbgxkr4Xg==
X-Received: by 2002:a05:6a20:be13:b0:cd:7040:10d4 with SMTP id ge19-20020a056a20be1300b000cd704010d4mr17437040pzb.62.1678261753310;
        Tue, 07 Mar 2023 23:49:13 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id b9-20020aa78109000000b005a8e97fc71bsm8873038pfi.84.2023.03.07.23.49.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Mar 2023 23:49:12 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Qinglin Pan <panqinglin00@gmail.com>
Subject: [PATCH v14 2/3] riscv: mm: support Svnapot in hugetlb page
Date: Wed,  8 Mar 2023 15:48:52 +0800
Message-Id: <20230308074853.4393-3-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308074853.4393-1-panqinglin00@gmail.com>
References: <20230308074853.4393-1-panqinglin00@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_234914_533077_4385D663 
X-CRM114-Status: GOOD (  15.92  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

Svnapot can be used to support 64KB hugetlb page, so it can become a new
option when using hugetlbfs. Add a basic implementation of hugetlb page,
and support 64KB as a size in it by using Svnapot.

For test, boot kernel with command line contains "default_hugepagesz=64K
hugepagesz=64K hugepages=20" and run a simple test like this:

tools/testing/selftests/vm/map_hugetlb 1 16

And it should be passed.

Signed-off-by: Qinglin Pan <panqinglin00@gmail.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 43a101369aa5..c736dc8e2593 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,7 +44,7 @@ config RISCV
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-	select ARCH_WANT_GENERAL_HUGETLB
+	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index ec19d6afc896..fe6f23006641 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_RISCV_HUGETLB_H
 #define _ASM_RISCV_HUGETLB_H
 
-#include <asm-generic/hugetlb.h>
 #include <asm/page.h>
 
 static inline void arch_clear_hugepage_flags(struct page *page)
@@ -11,4 +10,37 @@ static inline void arch_clear_hugepage_flags(struct page *page)
 }
 #define arch_clear_hugepage_flags arch_clear_hugepage_flags
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, unsigned long sz);
+
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+void set_huge_pte_at(struct mm_struct *mm,
+		     unsigned long addr, pte_t *ptep, pte_t pte);
+
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr, pte_t *ptep);
+
+#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+			    unsigned long addr, pte_t *ptep);
+
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+			     unsigned long addr, pte_t *ptep);
+
+#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
+int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+			       unsigned long addr, pte_t *ptep,
+			       pte_t pte, int dirty);
+
+pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
+#define arch_make_huge_pte arch_make_huge_pte
+
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+
+#include <asm-generic/hugetlb.h>
+
 #endif /* _ASM_RISCV_HUGETLB_H */
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 932dadfdca54..a163a3e0f0d4 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -2,6 +2,305 @@
 #include <linux/hugetlb.h>
 #include <linux/err.h>
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+pte_t *huge_pte_alloc(struct mm_struct *mm,
+		      struct vm_area_struct *vma,
+		      unsigned long addr,
+		      unsigned long sz)
+{
+	unsigned long order;
+	pte_t *pte = NULL;
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	pgd = pgd_offset(mm, addr);
+	p4d = p4d_alloc(mm, pgd, addr);
+	if (!p4d)
+		return NULL;
+
+	pud = pud_alloc(mm, p4d, addr);
+	if (!pud)
+		return NULL;
+
+	if (sz == PUD_SIZE) {
+		pte = (pte_t *)pud;
+		goto out;
+	}
+
+	if (sz == PMD_SIZE) {
+		if (want_pmd_share(vma, addr) && pud_none(*pud))
+			pte = huge_pmd_share(mm, vma, addr, pud);
+		else
+			pte = (pte_t *)pmd_alloc(mm, pud, addr);
+		goto out;
+	}
+
+	pmd = pmd_alloc(mm, pud, addr);
+	if (!pmd)
+		return NULL;
+
+	for_each_napot_order(order) {
+		if (napot_cont_size(order) == sz) {
+			pte = pte_alloc_map(mm, pmd, addr & napot_cont_mask(order));
+			break;
+		}
+	}
+
+out:
+	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
+	return pte;
+}
+
+pte_t *huge_pte_offset(struct mm_struct *mm,
+		       unsigned long addr,
+		       unsigned long sz)
+{
+	unsigned long order;
+	pte_t *pte = NULL;
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	pgd = pgd_offset(mm, addr);
+	if (!pgd_present(*pgd))
+		return NULL;
+
+	p4d = p4d_offset(pgd, addr);
+	if (!p4d_present(*p4d))
+		return NULL;
+
+	pud = pud_offset(p4d, addr);
+	if (sz == PUD_SIZE)
+		/* must be pud huge, non-present or none */
+		return (pte_t *)pud;
+
+	if (!pud_present(*pud))
+		return NULL;
+
+	pmd = pmd_offset(pud, addr);
+	if (sz == PMD_SIZE)
+		/* must be pmd huge, non-present or none */
+		return (pte_t *)pmd;
+
+	if (!pmd_present(*pmd))
+		return NULL;
+
+	for_each_napot_order(order) {
+		if (napot_cont_size(order) == sz) {
+			pte = pte_offset_kernel(pmd, addr & napot_cont_mask(order));
+			break;
+		}
+	}
+	return pte;
+}
+
+static pte_t get_clear_contig(struct mm_struct *mm,
+			      unsigned long addr,
+			      pte_t *ptep,
+			      unsigned long pte_num)
+{
+	pte_t orig_pte = ptep_get(ptep);
+	unsigned long i;
+
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++) {
+		pte_t pte = ptep_get_and_clear(mm, addr, ptep);
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+
+	return orig_pte;
+}
+
+static pte_t get_clear_contig_flush(struct mm_struct *mm,
+				    unsigned long addr,
+				    pte_t *ptep,
+				    unsigned long pte_num)
+{
+	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pte_num);
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	bool valid = !pte_none(orig_pte);
+
+	if (valid)
+		flush_tlb_range(&vma, addr, addr + (PAGE_SIZE * pte_num));
+
+	return orig_pte;
+}
+
+pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
+{
+	unsigned long order;
+
+	for_each_napot_order(order) {
+		if (shift == napot_cont_shift(order)) {
+			entry = pte_mknapot(entry, order);
+			break;
+		}
+	}
+	if (order == NAPOT_ORDER_MAX)
+		entry = pte_mkhuge(entry);
+
+	return entry;
+}
+
+void set_huge_pte_at(struct mm_struct *mm,
+		     unsigned long addr,
+		     pte_t *ptep,
+		     pte_t pte)
+{
+	int i, pte_num;
+
+	if (!pte_napot(pte)) {
+		set_pte_at(mm, addr, ptep, pte);
+		return;
+	}
+
+	pte_num = napot_pte_num(napot_cont_order(pte));
+	for (i = 0; i < pte_num; i++, ptep++, addr += PAGE_SIZE)
+		set_pte_at(mm, addr, ptep, pte);
+}
+
+int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+			       unsigned long addr,
+			       pte_t *ptep,
+			       pte_t pte,
+			       int dirty)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long order;
+	pte_t orig_pte;
+	int i, pte_num;
+
+	if (!pte_napot(pte))
+		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+
+	order = napot_cont_order(pte);
+	pte_num = napot_pte_num(order);
+	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
+	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
+
+	if (pte_dirty(orig_pte))
+		pte = pte_mkdirty(pte);
+
+	if (pte_young(orig_pte))
+		pte = pte_mkyoung(pte);
+
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		set_pte_at(mm, addr, ptep, pte);
+
+	return true;
+}
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr,
+			      pte_t *ptep)
+{
+	pte_t orig_pte = ptep_get(ptep);
+	int pte_num;
+
+	if (!pte_napot(orig_pte))
+		return ptep_get_and_clear(mm, addr, ptep);
+
+	pte_num = napot_pte_num(napot_cont_order(orig_pte));
+
+	return get_clear_contig(mm, addr, ptep, pte_num);
+}
+
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+			     unsigned long addr,
+			     pte_t *ptep)
+{
+	pte_t pte = ptep_get(ptep);
+	unsigned long order;
+	int i, pte_num;
+
+	if (!pte_napot(pte)) {
+		ptep_set_wrprotect(mm, addr, ptep);
+		return;
+	}
+
+	order = napot_cont_order(pte);
+	pte_num = napot_pte_num(order);
+	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
+
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		ptep_set_wrprotect(mm, addr, ptep);
+}
+
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+			    unsigned long addr,
+			    pte_t *ptep)
+{
+	pte_t pte = ptep_get(ptep);
+	int pte_num;
+
+	if (!pte_napot(pte))
+		return ptep_clear_flush(vma, addr, ptep);
+
+	pte_num = napot_pte_num(napot_cont_order(pte));
+
+	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
+}
+
+void huge_pte_clear(struct mm_struct *mm,
+		    unsigned long addr,
+		    pte_t *ptep,
+		    unsigned long sz)
+{
+	pte_t pte = READ_ONCE(*ptep);
+	int i, pte_num;
+
+	if (!pte_napot(pte)) {
+		pte_clear(mm, addr, ptep);
+		return;
+	}
+
+	pte_num = napot_pte_num(napot_cont_order(pte));
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		pte_clear(mm, addr, ptep);
+}
+
+static __init bool is_napot_size(unsigned long size)
+{
+	unsigned long order;
+
+	if (!has_svnapot())
+		return false;
+
+	for_each_napot_order(order) {
+		if (size == napot_cont_size(order))
+			return true;
+	}
+	return false;
+}
+
+static __init int napot_hugetlbpages_init(void)
+{
+	if (has_svnapot()) {
+		unsigned long order;
+
+		for_each_napot_order(order)
+			hugetlb_add_hstate(order);
+	}
+	return 0;
+}
+arch_initcall(napot_hugetlbpages_init);
+
+#else
+
+static __init bool is_napot_size(unsigned long size)
+{
+	return false;
+}
+
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+
 int pud_huge(pud_t pud)
 {
 	return pud_leaf(pud);
@@ -18,6 +317,8 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return true;
 	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
 		return true;
+	else if (is_napot_size(size))
+		return true;
 	else
 		return false;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
