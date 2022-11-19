Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC9C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JfZ33xn0ZFhDIN5DuAWJUFTFSUEqfGqmCI6j3AqtOU=; b=unx0qgQ9F3dl4u
	x24wmGCttsNi6zLMOI8Vnp/cL3885ResezcmEotQgBRnV2/6aJceMROCPZ3hb/fmi+nP/KMYiphpF
	D8bytn41fRji3u9ac17BTUu3LXqHnDXrDQiTO7dn2vFUWTUghTKIXlC6roq/L4zZ295NFGZ/wSRTh
	KHft3maQHdPwpIBqqRtyALSrYKrMYkQBr53NbfQqr/clR/mNuTewCDVngFhvkKoOMgjH++A6q9oeJ
	WXJGqK2Dcg+mUU2deY33DTSZz8qNGwUOHG6r9o/6YVVqqj5IC9pPBPLSX11wYKWlis0H/686tmzKj
	8XKtLFN0QBcAzM0VJh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owLwc-00DEse-KQ; Sat, 19 Nov 2022 11:23:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owLwX-00DEr9-EK
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 11:23:32 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowAC3Oe2jvHhjlVkXAA--.8243S4;
	Sat, 19 Nov 2022 19:23:19 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v7 2/3] riscv: mm: support Svnapot in hugetlb page
Date: Sat, 19 Nov 2022 19:22:41 +0800
Message-Id: <20221119112242.3593646-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221119112242.3593646-1-panqinglin2020@iscas.ac.cn>
References: <20221119112242.3593646-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3Oe2jvHhjlVkXAA--.8243S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKrW8Wr47AFWkWry5Ar13Arb_yoWfZw1fpF
	1xG34SqrW7J34UGw4Iqr4DJrn8JwnaqayUJas7Ja1rZw4IvrZxZasxC34ayr9xGrWkX3yx
	CrWrKFsxAF9rXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
	z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
	0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	0JUoWlkUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgYPDGN4MK3pOwAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_032329_892430_396239BD 
X-CRM114-Status: GOOD (  13.44  )
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

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 31f9a5a160a0..c0307b942ed2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -43,7 +43,7 @@ config RISCV
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-	select ARCH_WANT_GENERAL_HUGETLB
+	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index a5c2ca1d1cd8..854f5db2f45d 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -2,7 +2,39 @@
 #ifndef _ASM_RISCV_HUGETLB_H
 #define _ASM_RISCV_HUGETLB_H
 
-#include <asm-generic/hugetlb.h>
 #include <asm/page.h>
 
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
index 932dadfdca54..130a91b30588 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -2,6 +2,273 @@
 #include <linux/hugetlb.h>
 #include <linux/err.h>
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+pte_t *huge_pte_alloc(struct mm_struct *mm,
+		      struct vm_area_struct *vma,
+		      unsigned long addr,
+		      unsigned long sz)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte = NULL;
+	unsigned long order;
+
+	pgd = pgd_offset(mm, addr);
+	p4d = p4d_alloc(mm, pgd, addr);
+	if (!p4d)
+		return NULL;
+
+	pud = pud_alloc(mm, p4d, addr);
+	if (!pud)
+		return NULL;
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
+	pmd = pmd_alloc(mm, pud, addr);
+	if (!pmd)
+		return NULL;
+
+	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++) {
+		if (napot_cont_size(order) == sz) {
+			pte = pte_alloc_map(mm, pmd, (addr & ~napot_cont_mask(order)));
+			break;
+		}
+	}
+out:
+	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
+	return pte;
+}
+
+pte_t *huge_pte_offset(struct mm_struct *mm,
+		       unsigned long addr,
+		       unsigned long sz)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte = NULL;
+	unsigned long order;
+
+	pgd = pgd_offset(mm, addr);
+	if (!pgd_present(*pgd))
+		return NULL;
+	p4d = p4d_offset(pgd, addr);
+	if (!p4d_present(*p4d))
+		return NULL;
+
+	pud = pud_offset(p4d, addr);
+	if (sz == PUD_SIZE)
+		/* must be pud huge, non-present or none */
+		return (pte_t *)pud;
+	if (!pud_present(*pud))
+		return NULL;
+
+	pmd = pmd_offset(pud, addr);
+	if (sz == PMD_SIZE)
+		/* must be pmd huge, non-present or none */
+		return (pte_t *)pmd;
+	if (!pmd_present(*pmd))
+		return NULL;
+
+	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++) {
+		if (napot_cont_size(order) == sz) {
+			pte = pte_offset_kernel(pmd, (addr & ~napot_cont_mask(order)));
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
+	return orig_pte;
+}
+
+static pte_t get_clear_contig_flush(struct mm_struct *mm,
+				    unsigned long addr,
+				    pte_t *ptep,
+				    unsigned long pte_num)
+{
+	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pte_num);
+	bool valid = !pte_none(orig_pte);
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
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
+	int i;
+	int pte_num;
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
+	pte_t orig_pte;
+	int i;
+	int pte_num;
+	struct mm_struct *mm = vma->vm_mm;
+
+	if (!pte_napot(pte))
+		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+
+	pte_num = napot_pte_num(napot_cont_order(pte));
+	ptep = huge_pte_offset(mm, addr,
+			       napot_cont_size(napot_cont_order(pte)));
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
+	int pte_num;
+	pte_t orig_pte = ptep_get(ptep);
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
+	int i;
+	int pte_num;
+	pte_t pte = ptep_get(ptep);
+
+	if (!pte_napot(pte)) {
+		ptep_set_wrprotect(mm, addr, ptep);
+		return;
+	}
+
+	pte_num = napot_pte_num(napot_cont_order(pte));
+	ptep = huge_pte_offset(mm, addr, napot_cont_size(4UL));
+
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		ptep_set_wrprotect(mm, addr, ptep);
+}
+
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+			    unsigned long addr,
+			    pte_t *ptep)
+{
+	int pte_num;
+	pte_t pte = ptep_get(ptep);
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
+	int i, pte_num = 1;
+	pte_t pte = READ_ONCE(*ptep);
+
+	if (pte_napot(pte))
+		pte_num = napot_pte_num(napot_cont_order(pte));
+
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		pte_clear(mm, addr, ptep);
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
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+
 int pud_huge(pud_t pud)
 {
 	return pud_leaf(pud);
@@ -18,8 +285,17 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return true;
 	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
 		return true;
-	else
+	else if (!has_svnapot())
+		return false;
+	else {
+		unsigned long order;
+
+		for_each_napot_order(order) {
+			if (size == napot_cont_size(order))
+				return true;
+		}
 		return false;
+	}
 }
 
 #ifdef CONFIG_CONTIG_ALLOC
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
