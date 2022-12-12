Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D8BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SG2W8E9OVI+gL9QCuhfsrTaBLnlCSOSRe3FI0YZD7E0=; b=YhtS9QL+/qMlhw
	oe9iFLi+eO6z/L3g9yzSuntOGYSZU/zwXWtDzidPWY/n4azqFjtt3XTpgPLEIUAYirK26y4nNkIA+
	I5KRc7BA8M/abVogoNE4kGmKJ4Lzs+lFUCgYh/+pTjBX9KEfQatS6uQxzt64eA4CLimO0ITVqQyoZ
	IHwQa0vpwXX4OQPDPZzvP0q1hUn4ai/VmskJ3XOATt7iHkAxQuwmoCWhBW65z5z5F+w6WZeTR9mZh
	lYeSD9sBpG9tqM3Aamc6QKTDjRQPDftnTpSPgc5kDoIUZ11cC1E/c7oqTsGjvjsjByzKUy1e3jNc7
	tszt+QimwTXELMJEhxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dcG-009gFh-9Q; Mon, 12 Dec 2022 07:52:48 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dcB-009g9g-L8
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:52:46 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowAA3PXHC3ZZjcvyeBg--.5294S4;
	Mon, 12 Dec 2022 15:52:40 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v10 2/3] riscv: mm: support Svnapot in hugetlb page
Date: Mon, 12 Dec 2022 15:52:22 +0800
Message-Id: <20221212075223.806705-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221212075223.806705-1-panqinglin2020@iscas.ac.cn>
References: <20221212075223.806705-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3PXHC3ZZjcvyeBg--.5294S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKrW8Wr47AFWkWry5Ar13Arb_yoWDJF43pF
	1xC34fXrW7tr1UGw4xZrs5Jrn8Jw1SqayUJF93Ja1rAw1IvrZxZasxC34ayrnxCrWkX3yx
	CrW5KFsxAF9rXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
	c4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
	AKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjfUjBMNUUUUU
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwoSDGOWlVPcEgAAsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_235244_120760_6DDB98F1 
X-CRM114-Status: GOOD (  12.91  )
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

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 05212d3e5ba4..aebbf6acc0de 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,7 +44,7 @@ config RISCV
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-	select ARCH_WANT_GENERAL_HUGETLB
+	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
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
index 932dadfdca54..31e83beaab42 100644
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
+bool __init is_napot_size(unsigned long size)
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
+bool __init is_napot_size(unsigned long size)
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
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
