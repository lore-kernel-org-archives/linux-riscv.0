Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C7FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:23:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABF360FDA
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ABF360FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKti+QYDXlVGSlaiF6NZMjkvSeFom9ogS1+GP+nYnYE=; b=xs6ALtRpH2cn80
	DqZPYIDkMAkxFygeb3G9IvW6M/4oEqSym3nlratTkFpVVXqghOw+XCDE2EZxaHdk9okxVQWIvFxxU
	abYDD+fb/xG7PDxkvNmUjBvL1kRYkTV9DlM+3wDSH3nObPDsjHeyMk9Pd4vdfoL9ljaFJeRXqnaR1
	c/3Iw+wb0H230jUn/CworLILR7bACbN+jQJdKj02pJyTaTvvLBiNAcdXQD0d8BzUoMPP1Z0mBrT6D
	8/XXx2+uV/myPe7Bdqpz0qgT8P+wu7vK0KGuyA+vm03sxlrwjDLg2xC/2K/70rbLtnF1mM3Q8ncSs
	JPisepl/d7thJsbNfhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcIJ7-00DpQ2-0F; Mon, 18 Oct 2021 02:23:21 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcIJ4-00DpP5-HB
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 02:23:20 +0000
Received: by mail-pf1-x433.google.com with SMTP id d5so700507pfu.1
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 19:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQEuzugfUK4Ty3ZAToh9e+0eENvZ/yGehWqj8C4n9mM=;
 b=QcoKFrUl6NbMRMAyLb7GOSX4yhfFgYEQ5DxdA8m7bJwCsSWCt1l7W6qNj5yjVisORT
 yal3pQz2hnfBZxxgznTxxgghqhAzn/6oB05hlrREDF9tz7B0kerOR0atWJARJyrnFAx+
 +7Lz2SowE8oSkDEJOoP0dxOyMSHEi93/SjUYEw0V6yejaQgMelrdsc3QkgdkzGbfWKzz
 0FLf5QlLHSUQTum37g/XOS8vRfjBuoigrrEncFXuZScEI6ZwjN5vlhx1CU4PyVxgouGR
 c38L1qzflVbehMuDO6Bntp+XcQ4Q3V220FG0GIBG3we6O3r7ceU7O2uxc0I+5YL1gnum
 P4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQEuzugfUK4Ty3ZAToh9e+0eENvZ/yGehWqj8C4n9mM=;
 b=RtU0DCrnEifh+6aoJgmNjLmClgaSx4E8OJyR88+vPTERsYJcNpj9Nctu7TpCG5clj+
 DfupD2rr7M1q7Yt+JY5gjHmr6zIgymtEqCYSwJrdlJ0yAwCky94EisPN6UzBbo5rISA0
 lsjuEuYV9KtfRKKvG+mEuhSaReQZzHd5Q5KN+pQ1ex5LPEHIxaCpTdetPh4gtsTY36gO
 8Ylm8r7iOSEKATVRpO3ErOgGf7H2teDzb1XzPwYhVQcznIiUyPdLaAvFOR7CVGuyWevB
 1Sl8eCKgTLlJyw39Ym8HJNX3hBRPQDVTeXqGS1tCah3nkFt8tQsNeHFYEnCD/64QEIlW
 9cRQ==
X-Gm-Message-State: AOAM533kWaLiH7BKF/kWQeTJQQ0HXXSsTNMyCGa/tmdQzgaxF7ZJOpSF
 znDASjZ2646GVQSMvLth6m0=
X-Google-Smtp-Source: ABdhPJzwhiafuP/P+X/LPBlR+vN8tgyzudI+VmYRXfAYO0siEuZ3HuM1MJeDE+zHgRuMpVNMqMrG0w==
X-Received: by 2002:a63:6e8b:: with SMTP id j133mr11494888pgc.48.1634523797722; 
 Sun, 17 Oct 2021 19:23:17 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac0:23::815:bc7])
 by smtp.gmail.com with ESMTPSA id t32sm4965971pfg.29.2021.10.17.19.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 19:23:17 -0700 (PDT)
From: Qinglin Pan <panqinglin00@gmail.com>
X-Google-Original-From: Qinglin Pan <panqinglin00@163.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [RFC PATCH 3/4] mm: support Svnapot in hugetlb page
Date: Mon, 18 Oct 2021 10:22:37 +0800
Message-Id: <20211018022238.1314220-3-panqinglin00@163.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018022238.1314220-1-panqinglin00@163.com>
References: <20211018022238.1314220-1-panqinglin00@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_192318_588262_6B7AC1FF 
X-CRM114-Status: GOOD (  19.91  )
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
option when using hugetlbfs. This patch adds a basic implementation of
hugetlb page, and support 64KB as a size in it by using Svnapot.

For test, boot kernel with command line contains "hugepagesz=64K
hugepages=20" and run a simple test like this:

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
---
 arch/riscv/Kconfig               |   2 +-
 arch/riscv/include/asm/hugetlb.h |  29 +++-
 arch/riscv/include/asm/page.h    |   2 +-
 arch/riscv/mm/hugetlbpage.c      | 227 +++++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 301a54233c7e..0ae025686faf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -176,7 +176,7 @@ config ARCH_SELECT_MEMORY_MODEL
 	def_bool ARCH_SPARSEMEM_ENABLE
 
 config ARCH_WANT_GENERAL_HUGETLB
-	def_bool y
+	def_bool !HUGETLB_PAGE
 
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index a5c2ca1d1cd8..fa99fb9226f7 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -2,7 +2,34 @@
 #ifndef _ASM_RISCV_HUGETLB_H
 #define _ASM_RISCV_HUGETLB_H
 
-#include <asm-generic/hugetlb.h>
 #include <asm/page.h>
 
+extern pte_t arch_make_huge_pte(pte_t entry, unsigned int shift,
+				       vm_flags_t flags);
+#define arch_make_huge_pte arch_make_huge_pte
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, pte_t pte);
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+				     unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
+extern void huge_ptep_clear_flush(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
+extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+				      unsigned long addr, pte_t *ptep,
+				      pte_t pte, int dirty);
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
+				    unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, unsigned long sz);
+#define set_huge_swap_pte_at riscv_set_huge_swap_pte_at
+extern void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte, unsigned long sz);
+
+#include <asm-generic/hugetlb.h>
+
 #endif /* _ASM_RISCV_HUGETLB_H */
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 109c97e991a6..e67506dbcd53 100644
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
index 932dadfdca54..b88a8dbfec3e 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -2,6 +2,224 @@
 #include <linux/hugetlb.h>
 #include <linux/err.h>
 
+pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
+			unsigned long addr, unsigned long sz)
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
+		       unsigned long addr, unsigned long sz)
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
+int napot_pte_num(pte_t pte)
+{
+	if (!(pte_val(pte) & NAPOT_64KB_MASK))
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
+			     unsigned long addr,
+			     pte_t *ptep,
+			     unsigned long pte_num)
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
+pte_t arch_make_huge_pte(pte_t entry, unsigned int shift,
+				       vm_flags_t flags)
+{
+	if (shift == NAPOT_CONT64KB_SHIFT)
+		entry = pte_mknapot(entry, NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
+
+	return entry;
+}
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, pte_t pte)
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
+				      unsigned long addr, pte_t *ptep,
+				      pte_t pte, int dirty)
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
+				     unsigned long addr, pte_t *ptep)
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
+				    unsigned long addr, pte_t *ptep)
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
+void huge_ptep_clear_flush(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep)
+{
+	int pte_num;
+	pte_t pte = READ_ONCE(*ptep);
+
+	if (!pte_napot(pte)) {
+		ptep_clear_flush(vma, addr, ptep);
+		return;
+	}
+
+	pte_num = napot_pte_num(pte);
+	clear_flush(vma->vm_mm, addr, ptep, pte_num);
+}
+
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, unsigned long sz)
+{
+	int i, pte_num;
+
+	pte_num = napot_pte_num(READ_ONCE(*ptep));
+	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+		pte_clear(mm, addr, ptep);
+}
+
+void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte, unsigned long sz)
+{
+	int i, pte_num;
+
+	pte_num = napot_pte_num(READ_ONCE(*ptep));
+
+	for (i = 0; i < pte_num; i++, ptep++)
+		set_pte(ptep, pte);
+}
+
 int pud_huge(pud_t pud)
 {
 	return pud_leaf(pud);
@@ -18,6 +236,8 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return true;
 	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
 		return true;
+	else if (size == NAPOT_CONT64KB_SIZE)
+		return true;
 	else
 		return false;
 }
@@ -32,3 +252,10 @@ static __init int gigantic_pages_init(void)
 }
 arch_initcall(gigantic_pages_init);
 #endif
+
+static int __init hugetlbpage_init(void)
+{
+	hugetlb_add_hstate(NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
+	return 0;
+}
+arch_initcall(hugetlbpage_init);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
