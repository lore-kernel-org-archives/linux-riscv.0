Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C6DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:00:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7630861250
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7630861250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKti+QYDXlVGSlaiF6NZMjkvSeFom9ogS1+GP+nYnYE=; b=YYiSlR6f5aG1rc
	t90rHF1vRJ8efrYgC7WrnL6qqLtgnXrHI4f6O/GGECbeUtIsFz/sSWjOPIUwg/T59qkmkguMqywew
	Mar6uVaIAV7/KYYWZ/mixXCRodfX5BXYNQ56qypbsZU8yQzhgq32OBoKgQCWtvczMp3dJ80yGbJbi
	XjkJ9yzii21mRM9DMmBrkMD14ozWpOW4+AWFdR+IXJc0LivK5q9LYhplkk65u+3heMO0mlbotgYZ6
	aiGyQTD7UzztFDLtBgCS4WP8VxjVwaqPjq5KDiXoX52tFUkT+R7wEQujV3vC8Vk98F3h9cDJq6P+6
	jHGRiKZKll5b8new4vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcHwt-00Dmti-Dc; Mon, 18 Oct 2021 02:00:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcHwp-00DmsX-CO
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 02:00:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso5853976pjw.2
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 19:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQEuzugfUK4Ty3ZAToh9e+0eENvZ/yGehWqj8C4n9mM=;
 b=LVH0F03r6yLTg9mBzvtK2KaFtuBbuhrJa1GyvcPA4TlAYa5kJUfQvZnw7BD8lo9Doa
 3pwRVcjot7LNX5ME6kC/TSn5k2ike5rCtjyxCBgxPJLA7E1NYikpiusI5A2x6Q4o77Fp
 Kc1X43tGItaZpTyGt19eMwpiXL4bUX8C0hu9His6pypUgA2ljyaT5rmc2cjwUdUucorW
 Bq1sRcXqZa2Es0pHAgLiy+RL8DKj/b8sBR2dP6GOjhfayJLwBrswWEq9InEBsjv/NvGF
 4mwhQYBIjov+psJAPM6sMd8jjH69s/KmKhjxdA5fiGBg/tFo2TmGhLtu0ya/+vSlDSDd
 Y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQEuzugfUK4Ty3ZAToh9e+0eENvZ/yGehWqj8C4n9mM=;
 b=o7qJAnSt+qN1Hm9iLH/pEPzyU6Hn2MyW+F2gllKJ0v6v2siZ2CSB3YJPhZa1fCK2ol
 yP0LhKYSK9DmfQGkF+8MdhzfDE3ZdwKNU8eN5tEZq8kNaAEXnI3DiGaCtu+0ILrb97Oi
 Zpcd2xHKK+VFYys6Q328h7Q0Hbf6TdJzumdOtUCnho/UVC0/BSLrXRepSK9DNyPqS2vt
 SvLRSGz9MzSg/qhKDGnFFDzYMrCvaL0k5LR6exxoDKhjlYH9sk8KChPmEHw1EB9ylgGW
 BQQqFs+dCs3rylmemAYX/3q2t7V7hHBiS73JfN7u42an1vxeKWaElpkpsR38+GYF+0wk
 9JPA==
X-Gm-Message-State: AOAM532XZkqJZ5Fuw2bsOCXkq5vF4PJr/bLQCknmdB5Hy4Y9I0z+uiGS
 9gE3axbvgi+823HVN/24dDoj1SikLrYD3b3fqF8amw==
X-Google-Smtp-Source: ABdhPJwBxh3prkqxaCYEWIGfCsQu0eK4cWbvk3KRGy/ai6+Ly7TIK/eJp+RHYuk44FYhtGHo12ckYw==
X-Received: by 2002:a17:90b:3687:: with SMTP id
 mj7mr44996122pjb.196.1634522418151; 
 Sun, 17 Oct 2021 19:00:18 -0700 (PDT)
Received: from localhost.localdomain ([103.135.248.171])
 by smtp.gmail.com with ESMTPSA id v22sm11381975pff.93.2021.10.17.19.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 19:00:17 -0700 (PDT)
From: Qinglin Pan <panqinglin00@gmail.com>
X-Google-Original-From: Qinglin Pan <panqinglin00@163.com>
To: linux-riscv@lists.infradead.org
Cc: xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [RFC PATCH 3/4] mm: support Svnapot in hugetlb page
Date: Mon, 18 Oct 2021 09:59:43 +0800
Message-Id: <20211018015944.1313008-3-panqinglin00@163.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018015944.1313008-1-panqinglin00@163.com>
References: <20211018015944.1313008-1-panqinglin00@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_190019_463924_2100E479 
X-CRM114-Status: GOOD (  19.96  )
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
