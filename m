Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89693C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CV17rwhcLgqRzzQRCHmVaCzDrFSbnQFn9vZS11eEh2Y=; b=J2HexqJVCVlCs7
	91yxIxytaN9MmQAC7Lz2/bJK70R3k4M7EW13Fta85grFc1UOWwjCWrn5RT2WNB+rzwY9DFyMe1fJD
	UWLinT3eps7auIDThXXZMcwkeexz/r0AR6dwEtCR2x1uhLCUx5/uM5jd7GFxJdB+/E84YNz15Pd8O
	OI8h9kORr67K9FMa4c5s50Ehv+Nj+E9EozkMkpRSA2DFUsy3sQR8fL3V1ZR/jwpQm0iokyFm/uEQk
	cgdGDmxDNsHctWC8Y5J0PeSfEF8snecoGmW0ikrKV6DheGjy9/eiDhSzlKBHvd7FLQdxFB2uF+7z6
	loDY0t+uP1e4IIUOW6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnX-0065AI-Px; Mon, 03 Oct 2022 13:47:55 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnQ-00655z-6I
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 13:47:51 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowACHzoj05zpjo2sYAw--.64668S5;
	Mon, 03 Oct 2022 21:47:37 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v5 3/4] mm: support Svnapot in hugetlb page
Date: Mon,  3 Oct 2022 21:47:20 +0800
Message-Id: <20221003134721.1772455-4-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHzoj05zpjo2sYAw--.64668S5
X-Coremail-Antispam: 1UD129KBjvJXoWfGFWUAr4xGr43uryUZF45trb_yoWDArWkpF
	W7Gw15ZrW3tw18Kw4Iqr1UJr98twnIg34UJF97XFWFvr1Iq39xXas7GrWayr17CrWkX3yx
	CrWrGFn8Ary7XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	nxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
	1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7VUUWxRDUUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQEIDGM6o59cKAABsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_064748_677107_BD068991 
X-CRM114-Status: GOOD (  14.83  )
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
option when using hugetlbfs. This commit adds a basic implementation of
hugetlb page, and support 64KB as a size in it by using Svnapot.

For test, boot kernel with command line contains "default_hugepagesz=64K
hugepagesz=64K hugepages=20" and run a simple test like this:

int main() {
	void *addr;
	addr = mmap(NULL, 64 * 1024, PROT_WRITE | PROT_READ,
			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB | MAP_HUGE_64KB, -1, 0);
	printf("back from mmap \n");
	long *ptr = (long *)addr;
	unsigned int i = 0;
	for(; i < 8 * 1024;i += 512) {
		printf("%lp \n", ptr);
		*ptr = 0xdeafabcd12345678;
		ptr += 512;
	}
	ptr = (long *)addr;
	i = 0;
	for(; i < 8 * 1024;i += 512) {
		if (*ptr != 0xdeafabcd12345678) {
			printf("failed! 0x%lx \n", *ptr);
			break;
		}
		ptr += 512;
	}
	if(i == 8 * 1024)
		printf("simple test passed!\n");
}

And it should be passed.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4354024aae21..3d5ec1391046 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -43,7 +43,7 @@ config RISCV
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-	select ARCH_WANT_GENERAL_HUGETLB
+	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index a5c2ca1d1cd8..79cbb482f0a0 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -2,7 +2,35 @@
 #ifndef _ASM_RISCV_HUGETLB_H
 #define _ASM_RISCV_HUGETLB_H
 
-#include <asm-generic/hugetlb.h>
 #include <asm/page.h>
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
+#define arch_make_huge_pte arch_make_huge_pte
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+void set_huge_pte_at(struct mm_struct *mm,
+		     unsigned long addr, pte_t *ptep, pte_t pte);
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+			    unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
+int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+			       unsigned long addr, pte_t *ptep,
+			       pte_t pte, int dirty);
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+			     unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, unsigned long sz);
+#define set_huge_swap_pte_at riscv_set_huge_swap_pte_at
+void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
+				pte_t *ptep, pte_t pte, unsigned long sz);
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+
+#include <asm-generic/hugetlb.h>
+
 #endif /* _ASM_RISCV_HUGETLB_H */
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ac70b0fd9a9a..1ea06476902a 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -17,7 +17,7 @@
 #define PAGE_MASK	(~(PAGE_SIZE - 1))
 
 #ifdef CONFIG_64BIT
-#define HUGE_MAX_HSTATE		2
+#define HUGE_MAX_HSTATE		3
 #else
 #define HUGE_MAX_HSTATE		1
 #endif
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 932dadfdca54..faa207826260 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -2,6 +2,239 @@
 #include <linux/hugetlb.h>
 #include <linux/err.h>
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+pte_t *huge_pte_alloc(struct mm_struct *mm,
+		      struct vm_area_struct *vma,
+		      unsigned long addr,
+		      unsigned long sz)
+{
+	pgd_t *pgdp = pgd_offset(mm, addr);
+	p4d_t *p4dp = p4d_alloc(mm, pgdp, addr);
+	pud_t *pudp = pud_alloc(mm, p4dp, addr);
+	pmd_t *pmdp = pmd_alloc(mm, pudp, addr);
+
+	if (sz == NAPOT_CONT64KB_SIZE) {
+		if (!pmdp)
+			return NULL;
+		WARN_ON(addr & (sz - 1));
+		return pte_alloc_map(mm, pmdp, addr);
+	}
+
+	return NULL;
+}
+
+pte_t *huge_pte_offset(struct mm_struct *mm,
+		       unsigned long addr,
+		       unsigned long sz)
+{
+	pgd_t *pgdp;
+	p4d_t *p4dp;
+	pud_t *pudp;
+	pmd_t *pmdp;
+	pte_t *ptep = NULL;
+
+	pgdp = pgd_offset(mm, addr);
+	if (!pgd_present(READ_ONCE(*pgdp)))
+		return NULL;
+
+	p4dp = p4d_offset(pgdp, addr);
+	if (!p4d_present(READ_ONCE(*p4dp)))
+		return NULL;
+
+	pudp = pud_offset(p4dp, addr);
+	if (!pud_present(READ_ONCE(*pudp)))
+		return NULL;
+
+	pmdp = pmd_offset(pudp, addr);
+	if (!pmd_present(READ_ONCE(*pmdp)))
+		return NULL;
+
+	if (sz == NAPOT_CONT64KB_SIZE)
+		ptep = pte_offset_kernel(pmdp, (addr & ~NAPOT_CONT64KB_MASK));
+
+	return ptep;
+}
+
+static int napot_pte_num(pte_t pte)
+{
+	if (pte_val(pte) & _PAGE_NAPOT)
+		return NAPOT_64KB_PTE_NUM;
+
+	pr_warn("%s: unrecognized napot pte size 0x%lx\n",
+		__func__, pte_val(pte));
+	return 1;
+}
+
+static pte_t get_clear_flush(struct mm_struct *mm,
+			     unsigned long addr,
+			     pte_t *ptep,
+			     unsigned long pte_num)
+{
+	pte_t orig_pte = huge_ptep_get(ptep);
+	bool valid = pte_val(orig_pte);
+	unsigned long i, saddr = addr;
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
+	if (valid) {
+		struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+
+		flush_tlb_range(&vma, saddr, addr);
+	}
+	return orig_pte;
+}
+
+static void clear_flush(struct mm_struct *mm,
+			unsigned long addr,
+			pte_t *ptep,
+			unsigned long pte_num)
+{
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long i, saddr = addr;
+
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		pte_clear(mm, addr, ptep);
+
+	flush_tlb_range(&vma, saddr, addr);
+}
+
+pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
+{
+	if (shift == NAPOT_CONT64KB_SHIFT)
+		entry = pte_mknapot(entry, NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
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
+	pte_num = napot_pte_num(pte);
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
+
+	if (!pte_napot(pte))
+		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+
+	pte_num = napot_pte_num(pte);
+	ptep = huge_pte_offset(vma->vm_mm, addr, NAPOT_CONT64KB_SIZE);
+	orig_pte = huge_ptep_get(ptep);
+
+	if (pte_dirty(orig_pte))
+		pte = pte_mkdirty(pte);
+
+	if (pte_young(orig_pte))
+		pte = pte_mkyoung(pte);
+
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+
+	return true;
+}
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr,
+			      pte_t *ptep)
+{
+	int pte_num;
+	pte_t orig_pte = huge_ptep_get(ptep);
+
+	if (!pte_napot(orig_pte))
+		return ptep_get_and_clear(mm, addr, ptep);
+
+	pte_num = napot_pte_num(orig_pte);
+	return get_clear_flush(mm, addr, ptep, pte_num);
+}
+
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+			     unsigned long addr,
+			     pte_t *ptep)
+{
+	int i;
+	int pte_num;
+	pte_t pte = READ_ONCE(*ptep);
+
+	if (!pte_napot(pte))
+		return ptep_set_wrprotect(mm, addr, ptep);
+
+	pte_num = napot_pte_num(pte);
+	ptep = huge_pte_offset(mm, addr, NAPOT_CONT64KB_SIZE);
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
+	pte_t pte = READ_ONCE(*ptep);
+
+	if (!pte_napot(pte)) {
+		ptep_clear_flush(vma, addr, ptep);
+		return pte;
+	}
+
+	pte_num = napot_pte_num(pte);
+	clear_flush(vma->vm_mm, addr, ptep, pte_num);
+
+	return pte;
+}
+
+void huge_pte_clear(struct mm_struct *mm,
+		    unsigned long addr,
+		    pte_t *ptep,
+		    unsigned long sz)
+{
+	int i, pte_num;
+
+	pte_num = napot_pte_num(READ_ONCE(*ptep));
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		pte_clear(mm, addr, ptep);
+}
+
+void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
+				pte_t *ptep, pte_t pte, unsigned long sz)
+{
+	int i, pte_num;
+
+	pte_num = napot_pte_num(READ_ONCE(*ptep));
+
+	for (i = 0; i < pte_num; i++, ptep++)
+		set_pte(ptep, pte);
+}
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+
 int pud_huge(pud_t pud)
 {
 	return pud_leaf(pud);
@@ -18,17 +251,26 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return true;
 	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
 		return true;
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+	else if (has_svnapot() && size == NAPOT_CONT64KB_SIZE)
+		return true;
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
 	else
 		return false;
 }
 
-#ifdef CONFIG_CONTIG_ALLOC
-static __init int gigantic_pages_init(void)
+static __init int hugetlbpage_init(void)
 {
+#ifdef CONFIG_CONTIG_ALLOC
 	/* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
 	if (IS_ENABLED(CONFIG_64BIT))
 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
+#endif /*CONFIG_CONTIG_ALLOC*/
+	hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+	if (has_svnapot())
+		hugetlb_add_hstate(NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
 	return 0;
 }
-arch_initcall(gigantic_pages_init);
-#endif
+arch_initcall(hugetlbpage_init);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
