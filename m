Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED52FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osTqUmtyNIfxzZDfv1Bj26KEnOE16Ii0Jby9SOqSHvA=; b=J3yyJQqDOj/0aW
	o+3iKT6lvL0n73z4ykCLJmoKxbTTsEf+I8kE/jw6O7sb+sa28yrX///+LdxWHwP782hZaKAYlYqoQ
	vsClcJqRYRFNvdwnsl4copjhRfkS/JqJ4cDMUNRi8uPNNdPbiqp1fz4S/7y954yNg4fpNFGM0xL3L
	NeOEaylIn5yseuERHPdUmR3MzmHIU5VgiKD0ngB+pn9G68c6LKfnfDBNek/K/0/xE7XGJjS8VDlkB
	KBi9EfzUZfv4EldZAhLifyva5B8ZwDhVsu39mfn2Sa4OLW+gV2LXm5W7y5FGkVAigA6p1yIT9ZxOC
	i+OqBsAgIuL60suvrPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ie6-0036Ql-IN; Thu, 08 Dec 2022 15:17:10 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ie1-0036NJ-N5
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 15:17:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id ud5so4816440ejc.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 07:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/PryYxkLP603Lcf2KK7iY8DbGT7/90MBENMWVkg5lU=;
        b=jPAUx7VnP3Ae307Jm3NMBBh19eQs4jkFJHXCRqfK5Ls2BDhag/CutUG43802wNa8Dt
         e9+FqOd3iJFiyfc9yr4KUrV3ZVM8BxCk+0ygAei9smJRTn0kXWw04FOF8UA7Ph5FNQkO
         O26Gk3eBU9N3I6GhIbwF9ROUt/N6VniMJORpb0KS5t3aBYD4YqCxzJcGYq8SebCHd9ZG
         mUrHqjmA8vGNH5bAgrf304AGR33MyCJHBdfudcCeYIpQShtWhKZCtSB0xebgNVy/wS0j
         kBmNF66CkDOsaxchw3NOsjTtuwbQ1Zk2GpDP4PdXxxmEe5wgz/XSCs06P+Z5c5bYEJKr
         QuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/PryYxkLP603Lcf2KK7iY8DbGT7/90MBENMWVkg5lU=;
        b=TGtqUwksngNdCiCeuttNjhbk2lax0P24Tvs8NLyqxSJcAKEOi2rHrIk8je6oEUOeS+
         Hn0wCT53hTySQ2fMCzqihrzg6H1AKHcbtHPYDgHUJXSXarZmrtXiH/sl3PfgWpPainxG
         zCbItiMpidzIp6SMK18GzKw6MMB2Cj8hQCcY2aS+r/lK18Gp09VJIj+J2GGXPYlQMnTB
         YqG7a0n0MmHwxxhBHUg2JhsHxMulMIpphYK4VlucpmYIKH9oQK/g/sEuu5MOmphntT9o
         +KoqY16J0qTvw6o0nX3FqJIQZ7MUA13h2Xe6uZRQfA2TZetZjpSJY8LYw1bAPdc/aphP
         MuyQ==
X-Gm-Message-State: ANoB5pk0XoTqJhx+ZPgjJ94fyoJxqIvBDGqbJGikmgLJutEWEMtDk8x2
	HH95NFSEBlZAvtLm621PzQMoUQ==
X-Google-Smtp-Source: AA0mqf5j6g/MALt140nD6gX116p3e2mGhpDLXHA2l//46r9uQqdHibQupX2WMU4g+WFWq5mnkm47/g==
X-Received: by 2002:a17:906:3716:b0:7c0:bbab:22e5 with SMTP id d22-20020a170906371600b007c0bbab22e5mr2229865ejc.16.1670512623910;
        Thu, 08 Dec 2022 07:17:03 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906218200b007a4e02e32ffsm9744018eju.60.2022.12.08.07.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:17:03 -0800 (PST)
Date: Thu, 8 Dec 2022 16:17:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org, alex@ghiti.fr,
	jszhang@kernel.org
Subject: Re: [PATCH v9 2/3] riscv: mm: support Svnapot in hugetlb page
Message-ID: <20221208151702.amb3rourh7zya433@kamzik>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-3-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204141137.691790-3-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_071705_806359_AEBB4734 
X-CRM114-Status: GOOD (  27.85  )
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

On Sun, Dec 04, 2022 at 10:11:36PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot can be used to support 64KB hugetlb page, so it can become a new
> option when using hugetlbfs. Add a basic implementation of hugetlb page,
> and support 64KB as a size in it by using Svnapot.
> 
> For test, boot kernel with command line contains "default_hugepagesz=64K
> hugepagesz=64K hugepages=20" and run a simple test like this:
> 
> tools/testing/selftests/vm/map_hugetlb 1 16
> 
> And it should be passed.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d8477c0af7c..be5c1edea70f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -43,7 +43,7 @@ config RISCV
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_FRAME_POINTERS
> -	select ARCH_WANT_GENERAL_HUGETLB
> +	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
> index ec19d6afc896..fe6f23006641 100644
> --- a/arch/riscv/include/asm/hugetlb.h
> +++ b/arch/riscv/include/asm/hugetlb.h
> @@ -2,7 +2,6 @@
>  #ifndef _ASM_RISCV_HUGETLB_H
>  #define _ASM_RISCV_HUGETLB_H
>  
> -#include <asm-generic/hugetlb.h>
>  #include <asm/page.h>
>  
>  static inline void arch_clear_hugepage_flags(struct page *page)
> @@ -11,4 +10,37 @@ static inline void arch_clear_hugepage_flags(struct page *page)
>  }
>  #define arch_clear_hugepage_flags arch_clear_hugepage_flags
>  
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +#define __HAVE_ARCH_HUGE_PTE_CLEAR
> +void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> +		    pte_t *ptep, unsigned long sz);
> +
> +#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> +void set_huge_pte_at(struct mm_struct *mm,
> +		     unsigned long addr, pte_t *ptep, pte_t pte);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +			      unsigned long addr, pte_t *ptep);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +			    unsigned long addr, pte_t *ptep);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
> +			     unsigned long addr, pte_t *ptep);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +			       unsigned long addr, pte_t *ptep,
> +			       pte_t pte, int dirty);
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
> +#define arch_make_huge_pte arch_make_huge_pte
> +
> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
> +
> +#include <asm-generic/hugetlb.h>
> +
>  #endif /* _ASM_RISCV_HUGETLB_H */
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 932dadfdca54..49f92f8cd431 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -2,6 +2,301 @@
>  #include <linux/hugetlb.h>
>  #include <linux/err.h>
>  
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +pte_t *huge_pte_alloc(struct mm_struct *mm,
> +		      struct vm_area_struct *vma,
> +		      unsigned long addr,
> +		      unsigned long sz)
> +{
> +	pgd_t *pgd;
> +	p4d_t *p4d;
> +	pud_t *pud;
> +	pmd_t *pmd;
> +	pte_t *pte = NULL;
> +	unsigned long order;

Since it's Christmas time I'll make the nit that reverse fir tree is
preferred[1]. 

[1] https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

> +
> +	pgd = pgd_offset(mm, addr);
> +	p4d = p4d_alloc(mm, pgd, addr);
> +	if (!p4d)
> +		return NULL;
> +
> +	pud = pud_alloc(mm, p4d, addr);
> +	if (!pud)
> +		return NULL;
> +
> +	if (sz == PUD_SIZE) {
> +		pte = (pte_t *)pud;
> +		goto out;
> +	}
> +
> +	if (sz == PMD_SIZE) {
> +		if (want_pmd_share(vma, addr) && pud_none(*pud))
> +			pte = huge_pmd_share(mm, vma, addr, pud);
> +		else
> +			pte = (pte_t *)pmd_alloc(mm, pud, addr);
> +		goto out;
> +	}
> +
> +	pmd = pmd_alloc(mm, pud, addr);
> +	if (!pmd)
> +		return NULL;
> +
> +	for_each_napot_order(order) {
> +		if (napot_cont_size(order) == sz) {
> +			pte = pte_alloc_map(mm, pmd, (addr & napot_cont_mask(order)));

nit: No need for the () in the 3rd parameter

> +			break;
> +		}
> +	}
> +
> +out:
> +	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
> +	return pte;
> +}
> +
> +pte_t *huge_pte_offset(struct mm_struct *mm,
> +		       unsigned long addr,
> +		       unsigned long sz)
> +{
> +	pgd_t *pgd;
> +	p4d_t *p4d;
> +	pud_t *pud;
> +	pmd_t *pmd;
> +	pte_t *pte = NULL;
> +	unsigned long order;
> +
> +	pgd = pgd_offset(mm, addr);
> +	if (!pgd_present(*pgd))
> +		return NULL;

nit: Add blank line here

> +	p4d = p4d_offset(pgd, addr);
> +	if (!p4d_present(*p4d))
> +		return NULL;
> +
> +	pud = pud_offset(p4d, addr);
> +	if (sz == PUD_SIZE)
> +		/* must be pud huge, non-present or none */
> +		return (pte_t *)pud;

nit: Add blank line here

> +	if (!pud_present(*pud))
> +		return NULL;
> +
> +	pmd = pmd_offset(pud, addr);
> +	if (sz == PMD_SIZE)
> +		/* must be pmd huge, non-present or none */
> +		return (pte_t *)pmd;

nit: Add blank line here

> +	if (!pmd_present(*pmd))
> +		return NULL;
> +
> +	for_each_napot_order(order) {
> +		if (napot_cont_size(order) == sz) {
> +			pte = pte_offset_kernel(pmd, (addr & napot_cont_mask(order)));

nit: extra ()

> +			break;
> +		}
> +	}

nit: Add blank line here

> +	return pte;
> +}
> +
> +static pte_t get_clear_contig(struct mm_struct *mm,
> +			      unsigned long addr,
> +			      pte_t *ptep,
> +			      unsigned long pte_num)
> +{
> +	pte_t orig_pte = ptep_get(ptep);
> +	unsigned long i;
> +
> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++) {
> +		pte_t pte = ptep_get_and_clear(mm, addr, ptep);
> +
> +		if (pte_dirty(pte))
> +			orig_pte = pte_mkdirty(orig_pte);
> +
> +		if (pte_young(pte))
> +			orig_pte = pte_mkyoung(orig_pte);
> +	}

nit: Add blank line here

> +	return orig_pte;
> +}
> +
> +static pte_t get_clear_contig_flush(struct mm_struct *mm,
> +				    unsigned long addr,
> +				    pte_t *ptep,
> +				    unsigned long pte_num)
> +{
> +	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pte_num);
> +	bool valid = !pte_none(orig_pte);
> +	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
> +
> +	if (valid)
> +		flush_tlb_range(&vma, addr, addr + (PAGE_SIZE * pte_num));
> +
> +	return orig_pte;
> +}
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
> +{
> +	unsigned long order;
> +
> +	for_each_napot_order(order) {
> +		if (shift == napot_cont_shift(order)) {
> +			entry = pte_mknapot(entry, order);
> +			break;
> +		}
> +	}
> +	if (order == NAPOT_ORDER_MAX)
> +		entry = pte_mkhuge(entry);
> +
> +	return entry;
> +}
> +
> +void set_huge_pte_at(struct mm_struct *mm,
> +		     unsigned long addr,
> +		     pte_t *ptep,
> +		     pte_t pte)
> +{
> +	int i;
> +	int pte_num;
> +
> +	if (!pte_napot(pte)) {
> +		set_pte_at(mm, addr, ptep, pte);
> +		return;
> +	}
> +
> +	pte_num = napot_pte_num(napot_cont_order(pte));
> +	for (i = 0; i < pte_num; i++, ptep++, addr += PAGE_SIZE)
> +		set_pte_at(mm, addr, ptep, pte);
> +}
> +
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +			       unsigned long addr,
> +			       pte_t *ptep,
> +			       pte_t pte,
> +			       int dirty)
> +{
> +	pte_t orig_pte;
> +	int i;
> +	int pte_num;
> +	struct mm_struct *mm = vma->vm_mm;
> +
> +	if (!pte_napot(pte))
> +		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
> +
> +	pte_num = napot_pte_num(napot_cont_order(pte));
> +	ptep = huge_pte_offset(mm, addr,
> +			       napot_cont_size(napot_cont_order(pte)));

nit:
	order = napot_cont_order(pte);
	pte_num = napot_pte_num(order);
	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));

> +	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
> +
> +	if (pte_dirty(orig_pte))
> +		pte = pte_mkdirty(pte);
> +
> +	if (pte_young(orig_pte))
> +		pte = pte_mkyoung(pte);
> +
> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> +		set_pte_at(mm, addr, ptep, pte);
> +
> +	return true;
> +}
> +
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +			      unsigned long addr,
> +			      pte_t *ptep)
> +{
> +	int pte_num;
> +	pte_t orig_pte = ptep_get(ptep);
> +
> +	if (!pte_napot(orig_pte))
> +		return ptep_get_and_clear(mm, addr, ptep);
> +
> +	pte_num = napot_pte_num(napot_cont_order(orig_pte));
> +
> +	return get_clear_contig(mm, addr, ptep, pte_num);
> +}
> +
> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
> +			     unsigned long addr,
> +			     pte_t *ptep)
> +{
> +	int i;
> +	int pte_num;
> +	pte_t pte = ptep_get(ptep);
> +
> +	if (!pte_napot(pte)) {
> +		ptep_set_wrprotect(mm, addr, ptep);
> +		return;
> +	}
> +
> +	pte_num = napot_pte_num(napot_cont_order(pte));
> +	ptep = huge_pte_offset(mm, addr, napot_cont_size(napot_cont_order(pte)));

Same use an 'order' variable nit as above

> +
> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> +		ptep_set_wrprotect(mm, addr, ptep);
> +}
> +
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +			    unsigned long addr,
> +			    pte_t *ptep)
> +{
> +	int pte_num;
> +	pte_t pte = ptep_get(ptep);
> +
> +	if (!pte_napot(pte))
> +		return ptep_clear_flush(vma, addr, ptep);
> +
> +	pte_num = napot_pte_num(napot_cont_order(pte));
> +
> +	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
> +}
> +
> +void huge_pte_clear(struct mm_struct *mm,
> +		    unsigned long addr,
> +		    pte_t *ptep,
> +		    unsigned long sz)
> +{
> +	int i, pte_num;
> +	pte_t pte = READ_ONCE(*ptep);
> +
> +	if (!pte_napot(pte)) {
> +		pte_clear(mm, addr, ptep);
> +		return;
> +	}
> +
> +	pte_num = napot_pte_num(napot_cont_order(pte));
> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> +		pte_clear(mm, addr, ptep);
> +}
> +
> +bool __init is_napot_size(unsigned long size)
> +{
> +	unsigned long order;
> +
> +	if (!has_svnapot())
> +		return false;
> +
> +	for_each_napot_order(order) {
> +		if (size == napot_cont_size(order))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static __init int napot_hugetlbpages_init(void)
> +{
> +	if (has_svnapot()) {
> +		unsigned long order;
> +
> +		for_each_napot_order(order)
> +			hugetlb_add_hstate(order);
> +	}
> +	return 0;
> +}
> +arch_initcall(napot_hugetlbpages_init);
> +
> +#else
> +
> +bool __init is_napot_size(unsigned long size)
> +{
> +	return false;
> +}
> +
> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
> +
>  int pud_huge(pud_t pud)
>  {
>  	return pud_leaf(pud);
> @@ -18,6 +313,8 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>  		return true;
>  	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
>  		return true;
> +	else if (is_napot_size(size))
> +		return true;
>  	else
>  		return false;
>  }
> -- 
> 2.37.4
>

Besides the nits,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
