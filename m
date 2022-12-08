Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCFCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 04:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9ldcpSWtA53O6oeSZfFHE7Ha2PFxP8i0q1i7kFZPr4=; b=Pvd6mqwnNtsV09
	qbNx2Iqgcw/eyQTIVS3JtvNJf8AMY7bt6KzmZdw/Vook8DkKxXilUgZZcZjYM/7QkHPYgBTooK/mQ
	Jbe32HJwYxTzgw6deVaTYMgNCX7AWJI+RUGoPcBin0nGfRA8JVzxs/hoGnFYPNLZBwqcIeDAtC1Pk
	SEB7farFDXWU1FPq4Gpqw5F678jYzTeqTun7PJZmpBXDsrcd7+sy2my5pgXqVEKVrTEvRoNQ0ia2E
	8C05Ox8HLISXATgRwGgxBlFiA4v3GCivRw8GNYDsirVWfZVC5zuf+jI82LYF/2wfX3ZuzTFxoGpM2
	Q2pYw3Y5EqzQ7I/ywTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p38w4-001sa7-CP; Thu, 08 Dec 2022 04:55:04 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p38w0-001sWj-Ff
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 04:55:03 +0000
Received: from [198.18.0.1] (unknown [59.59.28.153])
	by APP-05 (Coremail) with SMTP id zQCowACXne0ebpFjTne5BQ--.30664S2;
	Thu, 08 Dec 2022 12:54:55 +0800 (CST)
Message-ID: <81f154b9-18e8-c6c0-f390-8341259b5291@iscas.ac.cn>
Date: Thu, 8 Dec 2022 12:54:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v9 2/3] riscv: mm: support Svnapot in hugetlb page
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, ajones@ventanamicro.com, alex@ghiti.fr, jszhang@kernel.org
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-3-panqinglin2020@iscas.ac.cn> <Y5Dhii4DwcIPqvyh@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Y5Dhii4DwcIPqvyh@spud>
X-CM-TRANSID: zQCowACXne0ebpFjTne5BQ--.30664S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Cr48KF1xAryfAw18ZF4ruFg_yoWkCrWUpF
	WxGFsxXFWUJryUKw4Iqr4DJ3Zxtr1Fqa1UKryfta15A34v9rn3u3s8Gw1akryxCrWkWw4x
	urWjg3ZxuFnrtFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_Jr
	ylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY
	jI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8XwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07bY_-QUUUUU=
X-Originating-IP: [59.59.28.153]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwIODGORPzGMxwAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_205500_932962_1694EEE6 
X-CRM114-Status: GOOD (  23.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey!

On 2022/12/8 02:55, Conor Dooley wrote:
> On Sun, Dec 04, 2022 at 10:11:36PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Svnapot can be used to support 64KB hugetlb page, so it can become a new
>> option when using hugetlbfs. Add a basic implementation of hugetlb page,
>> and support 64KB as a size in it by using Svnapot.
>>
>> For test, boot kernel with command line contains "default_hugepagesz=64K
>> hugepagesz=64K hugepages=20" and run a simple test like this:
>>
>> tools/testing/selftests/vm/map_hugetlb 1 16
>>
>> And it should be passed.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 1d8477c0af7c..be5c1edea70f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -43,7 +43,7 @@ config RISCV
>>   	select ARCH_USE_QUEUED_RWLOCKS
>>   	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>>   	select ARCH_WANT_FRAME_POINTERS
>> -	select ARCH_WANT_GENERAL_HUGETLB
>> +	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
> 
> I am expecting this to be a dumb question too, but I'm curious again
> about what happens in a system that enables CONFIG_RISCV_ISA_SVNAPOT but
> the platform it is running on does not support it...
> 
>>   	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>>   	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>   	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
>> index ec19d6afc896..fe6f23006641 100644
>> --- a/arch/riscv/include/asm/hugetlb.h
>> +++ b/arch/riscv/include/asm/hugetlb.h
>> @@ -2,7 +2,6 @@
>>   #ifndef _ASM_RISCV_HUGETLB_H
>>   #define _ASM_RISCV_HUGETLB_H
>>   
>> -#include <asm-generic/hugetlb.h>
>>   #include <asm/page.h>
>>   
>>   static inline void arch_clear_hugepage_flags(struct page *page)
>> @@ -11,4 +10,37 @@ static inline void arch_clear_hugepage_flags(struct page *page)
>>   }
>>   #define arch_clear_hugepage_flags arch_clear_hugepage_flags
>>   
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +#define __HAVE_ARCH_HUGE_PTE_CLEAR
>> +void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>> +		    pte_t *ptep, unsigned long sz);
>> +
>> +#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
>> +void set_huge_pte_at(struct mm_struct *mm,
>> +		     unsigned long addr, pte_t *ptep, pte_t pte);
>> +
>> +#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
>> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>> +			      unsigned long addr, pte_t *ptep);
>> +
>> +#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
>> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>> +			    unsigned long addr, pte_t *ptep);
>> +
>> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
>> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
>> +			     unsigned long addr, pte_t *ptep);
>> +
>> +#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
>> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>> +			       unsigned long addr, pte_t *ptep,
>> +			       pte_t pte, int dirty);
>> +
>> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
>> +#define arch_make_huge_pte arch_make_huge_pte
>> +
>> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
>> +
>> +#include <asm-generic/hugetlb.h>
> 
> ...is this sufficient to fall back to generic huge pages?

Yes. If CONFIG_RISCV_ISA_SVNAPOT is disabled, it will fall back to
generic huge pages. And if CONFIG_RISCV_ISA_SVNAPOT is enabled but
the platform has not svnapot support, PMD_SIZE/PUD_SIZE huge pages
are still available.

Thanks,
Qinglin.

> 
> Hopefully that's just my ignorance on show >
> Thanks,
> Conor.
> 
>> +
>>   #endif /* _ASM_RISCV_HUGETLB_H */
>> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
>> index 932dadfdca54..49f92f8cd431 100644
>> --- a/arch/riscv/mm/hugetlbpage.c
>> +++ b/arch/riscv/mm/hugetlbpage.c
>> @@ -2,6 +2,301 @@
>>   #include <linux/hugetlb.h>
>>   #include <linux/err.h>
>>   
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +pte_t *huge_pte_alloc(struct mm_struct *mm,
>> +		      struct vm_area_struct *vma,
>> +		      unsigned long addr,
>> +		      unsigned long sz)
>> +{
>> +	pgd_t *pgd;
>> +	p4d_t *p4d;
>> +	pud_t *pud;
>> +	pmd_t *pmd;
>> +	pte_t *pte = NULL;
>> +	unsigned long order;
>> +
>> +	pgd = pgd_offset(mm, addr);
>> +	p4d = p4d_alloc(mm, pgd, addr);
>> +	if (!p4d)
>> +		return NULL;
>> +
>> +	pud = pud_alloc(mm, p4d, addr);
>> +	if (!pud)
>> +		return NULL;
>> +
>> +	if (sz == PUD_SIZE) {
>> +		pte = (pte_t *)pud;
>> +		goto out;
>> +	}
>> +
>> +	if (sz == PMD_SIZE) {
>> +		if (want_pmd_share(vma, addr) && pud_none(*pud))
>> +			pte = huge_pmd_share(mm, vma, addr, pud);
>> +		else
>> +			pte = (pte_t *)pmd_alloc(mm, pud, addr);
>> +		goto out;
>> +	}
>> +
>> +	pmd = pmd_alloc(mm, pud, addr);
>> +	if (!pmd)
>> +		return NULL;
>> +
>> +	for_each_napot_order(order) {
>> +		if (napot_cont_size(order) == sz) {
>> +			pte = pte_alloc_map(mm, pmd, (addr & napot_cont_mask(order)));
>> +			break;
>> +		}
>> +	}
>> +
>> +out:
>> +	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
>> +	return pte;
>> +}
>> +
>> +pte_t *huge_pte_offset(struct mm_struct *mm,
>> +		       unsigned long addr,
>> +		       unsigned long sz)
>> +{
>> +	pgd_t *pgd;
>> +	p4d_t *p4d;
>> +	pud_t *pud;
>> +	pmd_t *pmd;
>> +	pte_t *pte = NULL;
>> +	unsigned long order;
>> +
>> +	pgd = pgd_offset(mm, addr);
>> +	if (!pgd_present(*pgd))
>> +		return NULL;
>> +	p4d = p4d_offset(pgd, addr);
>> +	if (!p4d_present(*p4d))
>> +		return NULL;
>> +
>> +	pud = pud_offset(p4d, addr);
>> +	if (sz == PUD_SIZE)
>> +		/* must be pud huge, non-present or none */
>> +		return (pte_t *)pud;
>> +	if (!pud_present(*pud))
>> +		return NULL;
>> +
>> +	pmd = pmd_offset(pud, addr);
>> +	if (sz == PMD_SIZE)
>> +		/* must be pmd huge, non-present or none */
>> +		return (pte_t *)pmd;
>> +	if (!pmd_present(*pmd))
>> +		return NULL;
>> +
>> +	for_each_napot_order(order) {
>> +		if (napot_cont_size(order) == sz) {
>> +			pte = pte_offset_kernel(pmd, (addr & napot_cont_mask(order)));
>> +			break;
>> +		}
>> +	}
>> +	return pte;
>> +}
>> +
>> +static pte_t get_clear_contig(struct mm_struct *mm,
>> +			      unsigned long addr,
>> +			      pte_t *ptep,
>> +			      unsigned long pte_num)
>> +{
>> +	pte_t orig_pte = ptep_get(ptep);
>> +	unsigned long i;
>> +
>> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++) {
>> +		pte_t pte = ptep_get_and_clear(mm, addr, ptep);
>> +
>> +		if (pte_dirty(pte))
>> +			orig_pte = pte_mkdirty(orig_pte);
>> +
>> +		if (pte_young(pte))
>> +			orig_pte = pte_mkyoung(orig_pte);
>> +	}
>> +	return orig_pte;
>> +}
>> +
>> +static pte_t get_clear_contig_flush(struct mm_struct *mm,
>> +				    unsigned long addr,
>> +				    pte_t *ptep,
>> +				    unsigned long pte_num)
>> +{
>> +	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pte_num);
>> +	bool valid = !pte_none(orig_pte);
>> +	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
>> +
>> +	if (valid)
>> +		flush_tlb_range(&vma, addr, addr + (PAGE_SIZE * pte_num));
>> +
>> +	return orig_pte;
>> +}
>> +
>> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>> +{
>> +	unsigned long order;
>> +
>> +	for_each_napot_order(order) {
>> +		if (shift == napot_cont_shift(order)) {
>> +			entry = pte_mknapot(entry, order);
>> +			break;
>> +		}
>> +	}
>> +	if (order == NAPOT_ORDER_MAX)
>> +		entry = pte_mkhuge(entry);
>> +
>> +	return entry;
>> +}
>> +
>> +void set_huge_pte_at(struct mm_struct *mm,
>> +		     unsigned long addr,
>> +		     pte_t *ptep,
>> +		     pte_t pte)
>> +{
>> +	int i;
>> +	int pte_num;
>> +
>> +	if (!pte_napot(pte)) {
>> +		set_pte_at(mm, addr, ptep, pte);
>> +		return;
>> +	}
>> +
>> +	pte_num = napot_pte_num(napot_cont_order(pte));
>> +	for (i = 0; i < pte_num; i++, ptep++, addr += PAGE_SIZE)
>> +		set_pte_at(mm, addr, ptep, pte);
>> +}
>> +
>> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>> +			       unsigned long addr,
>> +			       pte_t *ptep,
>> +			       pte_t pte,
>> +			       int dirty)
>> +{
>> +	pte_t orig_pte;
>> +	int i;
>> +	int pte_num;
>> +	struct mm_struct *mm = vma->vm_mm;
>> +
>> +	if (!pte_napot(pte))
>> +		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>> +
>> +	pte_num = napot_pte_num(napot_cont_order(pte));
>> +	ptep = huge_pte_offset(mm, addr,
>> +			       napot_cont_size(napot_cont_order(pte)));
>> +	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
>> +
>> +	if (pte_dirty(orig_pte))
>> +		pte = pte_mkdirty(pte);
>> +
>> +	if (pte_young(orig_pte))
>> +		pte = pte_mkyoung(pte);
>> +
>> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
>> +		set_pte_at(mm, addr, ptep, pte);
>> +
>> +	return true;
>> +}
>> +
>> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>> +			      unsigned long addr,
>> +			      pte_t *ptep)
>> +{
>> +	int pte_num;
>> +	pte_t orig_pte = ptep_get(ptep);
>> +
>> +	if (!pte_napot(orig_pte))
>> +		return ptep_get_and_clear(mm, addr, ptep);
>> +
>> +	pte_num = napot_pte_num(napot_cont_order(orig_pte));
>> +
>> +	return get_clear_contig(mm, addr, ptep, pte_num);
>> +}
>> +
>> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
>> +			     unsigned long addr,
>> +			     pte_t *ptep)
>> +{
>> +	int i;
>> +	int pte_num;
>> +	pte_t pte = ptep_get(ptep);
>> +
>> +	if (!pte_napot(pte)) {
>> +		ptep_set_wrprotect(mm, addr, ptep);
>> +		return;
>> +	}
>> +
>> +	pte_num = napot_pte_num(napot_cont_order(pte));
>> +	ptep = huge_pte_offset(mm, addr, napot_cont_size(napot_cont_order(pte)));
>> +
>> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
>> +		ptep_set_wrprotect(mm, addr, ptep);
>> +}
>> +
>> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>> +			    unsigned long addr,
>> +			    pte_t *ptep)
>> +{
>> +	int pte_num;
>> +	pte_t pte = ptep_get(ptep);
>> +
>> +	if (!pte_napot(pte))
>> +		return ptep_clear_flush(vma, addr, ptep);
>> +
>> +	pte_num = napot_pte_num(napot_cont_order(pte));
>> +
>> +	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
>> +}
>> +
>> +void huge_pte_clear(struct mm_struct *mm,
>> +		    unsigned long addr,
>> +		    pte_t *ptep,
>> +		    unsigned long sz)
>> +{
>> +	int i, pte_num;
>> +	pte_t pte = READ_ONCE(*ptep);
>> +
>> +	if (!pte_napot(pte)) {
>> +		pte_clear(mm, addr, ptep);
>> +		return;
>> +	}
>> +
>> +	pte_num = napot_pte_num(napot_cont_order(pte));
>> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
>> +		pte_clear(mm, addr, ptep);
>> +}
>> +
>> +bool __init is_napot_size(unsigned long size)
>> +{
>> +	unsigned long order;
>> +
>> +	if (!has_svnapot())
>> +		return false;
>> +
>> +	for_each_napot_order(order) {
>> +		if (size == napot_cont_size(order))
>> +			return true;
>> +	}
>> +	return false;
>> +}
>> +
>> +static __init int napot_hugetlbpages_init(void)
>> +{
>> +	if (has_svnapot()) {
>> +		unsigned long order;
>> +
>> +		for_each_napot_order(order)
>> +			hugetlb_add_hstate(order);
>> +	}
>> +	return 0;
>> +}
>> +arch_initcall(napot_hugetlbpages_init);
>> +
>> +#else
>> +
>> +bool __init is_napot_size(unsigned long size)
>> +{
>> +	return false;
>> +}
>> +
>> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
>> +
>>   int pud_huge(pud_t pud)
>>   {
>>   	return pud_leaf(pud);
>> @@ -18,6 +313,8 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>>   		return true;
>>   	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
>>   		return true;
>> +	else if (is_napot_size(size))
>> +		return true;
>>   	else
>>   		return false;
>>   }
>> -- 
>> 2.37.4
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
