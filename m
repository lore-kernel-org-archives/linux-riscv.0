Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AA1C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 02:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4Dxvmq/iz6ZGjxZkVYCcsn7wOnAgwSoJuYZGkwL9g4=; b=ZnEiCOz64pp2GA
	c0TomzEO83GP24Spl39R4gV+hbeg1xgwxfDdmrPCDPNxiu5UC4n1EQ3mPBGhvDsS0pDUCay25vHmt
	3X5NsypKzcTat7R7OOivlZedgR3n42rfzWl1D0LyZ++iLVUcnVcmlRYfZggU9KdFUUxQkcLopLKbl
	fNzYjv0hZutVAAoTiwFF4uVHNfem6wPekJJiIert9mzjgDa5bnPjgLPJEG6tLPHfeBlSosRGFDjfh
	pCTFdkQiP2cRwjXDsGf/Fbe3ieaZMtyts3mYJ1wYn6wc8kv2co23OV0df8Qrfo3AHR4skICYDnjl+
	HFxRtbfioL5lCgIL64SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofuCe-00C26A-OC; Wed, 05 Oct 2022 02:32:08 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofuCY-00C24O-Sx
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 02:32:06 +0000
Received: from [198.18.0.1] (unknown [124.16.96.231])
	by APP-05 (Coremail) with SMTP id zQCowAAXH7eS7DxjUa0TAw--.2419S2;
	Wed, 05 Oct 2022 10:31:49 +0800 (CST)
Message-ID: <c3afccfc-f874-3ed5-7afb-971889293660@iscas.ac.cn>
Date: Wed, 5 Oct 2022 10:31:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v5 3/4] mm: support Svnapot in hugetlb page
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-4-panqinglin2020@iscas.ac.cn> <Yzx+0XKL7KBFVlYm@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Yzx+0XKL7KBFVlYm@spud>
X-CM-TRANSID: zQCowAAXH7eS7DxjUa0TAw--.2419S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGrW7WF1UAr1kGFy3Ww1fXrb_yoWkuFWkpF
	ZrGFsxZFW7Jr1UGw1Iqrs8J3Zxtw1Fg347Krn7tayUAryv9rn3Wa4DKr4akry8CrWkW3yx
	uFW8G3ZxurnFqrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2
	V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU5QyCtUUUUU==
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgIKDGM8RdCc2wADsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_193203_361580_646A8724 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Conor,

Will fix these all in next version : )
Thanks for your suggestions!

Qinglin.

On 10/5/22 2:43 AM, Conor Dooley wrote:
> On Mon, Oct 03, 2022 at 09:47:20PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Svnapot can be used to support 64KB hugetlb page, so it can become a new
>> option when using hugetlbfs. This commit adds a basic implementation of
> 
> s/this commit adds/add
> 
>> hugetlb page, and support 64KB as a size in it by using Svnapot.
>>
> 
> I think the test could could be kept out of the commit message & under a
> --- line.
> 
>> For test, boot kernel with command line contains "default_hugepagesz=64K
>> hugepagesz=64K hugepages=20" and run a simple test like this:
>>
>> int main() {
>> 	void *addr;
>> 	addr = mmap(NULL, 64 * 1024, PROT_WRITE | PROT_READ,
>> 			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB | MAP_HUGE_64KB, -1, 0);
>> 	printf("back from mmap \n");
>> 	long *ptr = (long *)addr;
>> 	unsigned int i = 0;
>> 	for(; i < 8 * 1024;i += 512) {
>> 		printf("%lp \n", ptr);
>> 		*ptr = 0xdeafabcd12345678;
>> 		ptr += 512;
>> 	}
>> 	ptr = (long *)addr;
>> 	i = 0;
>> 	for(; i < 8 * 1024;i += 512) {
>> 		if (*ptr != 0xdeafabcd12345678) {
>> 			printf("failed! 0x%lx \n", *ptr);
>> 			break;
>> 		}
>> 		ptr += 512;
>> 	}
>> 	if(i == 8 * 1024)
>> 		printf("simple test passed!\n");
>> }
>>
>> And it should be passed.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 4354024aae21..3d5ec1391046 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -43,7 +43,7 @@ config RISCV
>>   	select ARCH_USE_QUEUED_RWLOCKS
>>   	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>>   	select ARCH_WANT_FRAME_POINTERS
>> -	select ARCH_WANT_GENERAL_HUGETLB
>> +	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
>>   	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>>   	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>>   	select BUILDTIME_TABLE_SORT if MMU
>> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
>> index a5c2ca1d1cd8..79cbb482f0a0 100644
>> --- a/arch/riscv/include/asm/hugetlb.h
>> +++ b/arch/riscv/include/asm/hugetlb.h
>> @@ -2,7 +2,35 @@
>>   #ifndef _ASM_RISCV_HUGETLB_H
>>   #define _ASM_RISCV_HUGETLB_H
>>   
>> -#include <asm-generic/hugetlb.h>
>>   #include <asm/page.h>
>>   
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
>> +#define arch_make_huge_pte arch_make_huge_pte
>> +#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
>> +void set_huge_pte_at(struct mm_struct *mm,
>> +		     unsigned long addr, pte_t *ptep, pte_t pte);
>> +#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
>> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>> +			      unsigned long addr, pte_t *ptep);
>> +#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
>> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>> +			    unsigned long addr, pte_t *ptep);
>> +#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
>> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>> +			       unsigned long addr, pte_t *ptep,
>> +			       pte_t pte, int dirty);
>> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
>> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
>> +			     unsigned long addr, pte_t *ptep);
>> +#define __HAVE_ARCH_HUGE_PTE_CLEAR
>> +void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>> +		    pte_t *ptep, unsigned long sz);
>> +#define set_huge_swap_pte_at riscv_set_huge_swap_pte_at
>> +void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, pte_t pte, unsigned long sz);
>> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
> 
> Maybe I am just getting old or something, but some whitespace would go a
> long way here I think.
> 
> I'm not qualified for any further comments on this patch however :/
> Conor.
> 
>> +
>> +#include <asm-generic/hugetlb.h>
>> +
>>   #endif /* _ASM_RISCV_HUGETLB_H */
>> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
>> index ac70b0fd9a9a..1ea06476902a 100644
>> --- a/arch/riscv/include/asm/page.h
>> +++ b/arch/riscv/include/asm/page.h
>> @@ -17,7 +17,7 @@
>>   #define PAGE_MASK	(~(PAGE_SIZE - 1))
>>   
>>   #ifdef CONFIG_64BIT
>> -#define HUGE_MAX_HSTATE		2
>> +#define HUGE_MAX_HSTATE		3
>>   #else
>>   #define HUGE_MAX_HSTATE		1
>>   #endif
>> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
>> index 932dadfdca54..faa207826260 100644
>> --- a/arch/riscv/mm/hugetlbpage.c
>> +++ b/arch/riscv/mm/hugetlbpage.c
>> @@ -2,6 +2,239 @@
>>   #include <linux/hugetlb.h>
>>   #include <linux/err.h>
>>   
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +pte_t *huge_pte_alloc(struct mm_struct *mm,
>> +		      struct vm_area_struct *vma,
>> +		      unsigned long addr,
>> +		      unsigned long sz)
>> +{
>> +	pgd_t *pgdp = pgd_offset(mm, addr);
>> +	p4d_t *p4dp = p4d_alloc(mm, pgdp, addr);
>> +	pud_t *pudp = pud_alloc(mm, p4dp, addr);
>> +	pmd_t *pmdp = pmd_alloc(mm, pudp, addr);
>> +
>> +	if (sz == NAPOT_CONT64KB_SIZE) {
>> +		if (!pmdp)
>> +			return NULL;
>> +		WARN_ON(addr & (sz - 1));
>> +		return pte_alloc_map(mm, pmdp, addr);
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +pte_t *huge_pte_offset(struct mm_struct *mm,
>> +		       unsigned long addr,
>> +		       unsigned long sz)
>> +{
>> +	pgd_t *pgdp;
>> +	p4d_t *p4dp;
>> +	pud_t *pudp;
>> +	pmd_t *pmdp;
>> +	pte_t *ptep = NULL;
>> +
>> +	pgdp = pgd_offset(mm, addr);
>> +	if (!pgd_present(READ_ONCE(*pgdp)))
>> +		return NULL;
>> +
>> +	p4dp = p4d_offset(pgdp, addr);
>> +	if (!p4d_present(READ_ONCE(*p4dp)))
>> +		return NULL;
>> +
>> +	pudp = pud_offset(p4dp, addr);
>> +	if (!pud_present(READ_ONCE(*pudp)))
>> +		return NULL;
>> +
>> +	pmdp = pmd_offset(pudp, addr);
>> +	if (!pmd_present(READ_ONCE(*pmdp)))
>> +		return NULL;
>> +
>> +	if (sz == NAPOT_CONT64KB_SIZE)
>> +		ptep = pte_offset_kernel(pmdp, (addr & ~NAPOT_CONT64KB_MASK));
>> +
>> +	return ptep;
>> +}
>> +
>> +static int napot_pte_num(pte_t pte)
>> +{
>> +	if (pte_val(pte) & _PAGE_NAPOT)
>> +		return NAPOT_64KB_PTE_NUM;
>> +
>> +	pr_warn("%s: unrecognized napot pte size 0x%lx\n",
>> +		__func__, pte_val(pte));
>> +	return 1;
>> +}
>> +
>> +static pte_t get_clear_flush(struct mm_struct *mm,
>> +			     unsigned long addr,
>> +			     pte_t *ptep,
>> +			     unsigned long pte_num)
>> +{
>> +	pte_t orig_pte = huge_ptep_get(ptep);
>> +	bool valid = pte_val(orig_pte);
>> +	unsigned long i, saddr = addr;
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
>> +
>> +	if (valid) {
>> +		struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
>> +
>> +		flush_tlb_range(&vma, saddr, addr);
>> +	}
>> +	return orig_pte;
>> +}
>> +
>> +static void clear_flush(struct mm_struct *mm,
>> +			unsigned long addr,
>> +			pte_t *ptep,
>> +			unsigned long pte_num)
>> +{
>> +	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
>> +	unsigned long i, saddr = addr;
>> +
>> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
>> +		pte_clear(mm, addr, ptep);
>> +
>> +	flush_tlb_range(&vma, saddr, addr);
>> +}
>> +
>> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>> +{
>> +	if (shift == NAPOT_CONT64KB_SHIFT)
>> +		entry = pte_mknapot(entry, NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
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
>> +	pte_num = napot_pte_num(pte);
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
>> +
>> +	if (!pte_napot(pte))
>> +		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>> +
>> +	pte_num = napot_pte_num(pte);
>> +	ptep = huge_pte_offset(vma->vm_mm, addr, NAPOT_CONT64KB_SIZE);
>> +	orig_pte = huge_ptep_get(ptep);
>> +
>> +	if (pte_dirty(orig_pte))
>> +		pte = pte_mkdirty(pte);
>> +
>> +	if (pte_young(orig_pte))
>> +		pte = pte_mkyoung(pte);
>> +
>> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
>> +		ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>> +
>> +	return true;
>> +}
>> +
>> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>> +			      unsigned long addr,
>> +			      pte_t *ptep)
>> +{
>> +	int pte_num;
>> +	pte_t orig_pte = huge_ptep_get(ptep);
>> +
>> +	if (!pte_napot(orig_pte))
>> +		return ptep_get_and_clear(mm, addr, ptep);
>> +
>> +	pte_num = napot_pte_num(orig_pte);
>> +	return get_clear_flush(mm, addr, ptep, pte_num);
>> +}
>> +
>> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
>> +			     unsigned long addr,
>> +			     pte_t *ptep)
>> +{
>> +	int i;
>> +	int pte_num;
>> +	pte_t pte = READ_ONCE(*ptep);
>> +
>> +	if (!pte_napot(pte))
>> +		return ptep_set_wrprotect(mm, addr, ptep);
>> +
>> +	pte_num = napot_pte_num(pte);
>> +	ptep = huge_pte_offset(mm, addr, NAPOT_CONT64KB_SIZE);
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
>> +	pte_t pte = READ_ONCE(*ptep);
>> +
>> +	if (!pte_napot(pte)) {
>> +		ptep_clear_flush(vma, addr, ptep);
>> +		return pte;
>> +	}
>> +
>> +	pte_num = napot_pte_num(pte);
>> +	clear_flush(vma->vm_mm, addr, ptep, pte_num);
>> +
>> +	return pte;
>> +}
>> +
>> +void huge_pte_clear(struct mm_struct *mm,
>> +		    unsigned long addr,
>> +		    pte_t *ptep,
>> +		    unsigned long sz)
>> +{
>> +	int i, pte_num;
>> +
>> +	pte_num = napot_pte_num(READ_ONCE(*ptep));
>> +	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
>> +		pte_clear(mm, addr, ptep);
>> +}
>> +
>> +void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, pte_t pte, unsigned long sz)
>> +{
>> +	int i, pte_num;
>> +
>> +	pte_num = napot_pte_num(READ_ONCE(*ptep));
>> +
>> +	for (i = 0; i < pte_num; i++, ptep++)
>> +		set_pte(ptep, pte);
>> +}
>> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
>> +
>>   int pud_huge(pud_t pud)
>>   {
>>   	return pud_leaf(pud);
>> @@ -18,17 +251,26 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>>   		return true;
>>   	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
>>   		return true;
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +	else if (has_svnapot() && size == NAPOT_CONT64KB_SIZE)
>> +		return true;
>> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
>>   	else
>>   		return false;
>>   }
>>   
>> -#ifdef CONFIG_CONTIG_ALLOC
>> -static __init int gigantic_pages_init(void)
>> +static __init int hugetlbpage_init(void)
>>   {
>> +#ifdef CONFIG_CONTIG_ALLOC
>>   	/* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
>>   	if (IS_ENABLED(CONFIG_64BIT))
>>   		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>> +#endif /*CONFIG_CONTIG_ALLOC*/
>> +	hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +	if (has_svnapot())
>> +		hugetlb_add_hstate(NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
>> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
>>   	return 0;
>>   }
>> -arch_initcall(gigantic_pages_init);
>> -#endif
>> +arch_initcall(hugetlbpage_init);
>> -- 
>> 2.35.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
