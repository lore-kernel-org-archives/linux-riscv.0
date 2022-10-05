Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04365C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbwASNXiBiSw4q2BS2Bh+hFUfB/bCNKqBDl3US5jzV0=; b=rz0JziHFQaN7pp
	IX176lV6mwb4hpjofnbRrhzJTTuYIIAl5XPavLInPLOxPM3rB4/b1uQ9tH64blBVrUbtuhy6sLQLF
	M5VnX7w70JHCq9+CLc/OL2qy79OAg28i8maip0Z5PB5XDUSMKUubmRK/cVpIFxxUdYhtGAhNPXY9X
	bHSyo9h76VHQAyK0oYqEs7ZyMQXHKqjqPfH2cZS5nHRExzLDO8wnXPYhGUIkgCUaAkURAB4qRUISb
	ywxS7VeHNawafSmEh5KOi8Fd84yw09te60eiKj9/Qmg4TKiMkYpDgRq4240abhuKW/dROZ05odKib
	T7N2O3YgQkRBu3wLn58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5mt-00Egfh-T1; Wed, 05 Oct 2022 14:54:19 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5mo-00Egdd-Vk
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 14:54:18 +0000
Received: from [124.16.96.231] (unknown [124.16.96.231])
	by APP-03 (Coremail) with SMTP id rQCowAC3vLSTmj1jB84TAw--.45504S3;
	Wed, 05 Oct 2022 22:54:12 +0800 (CST)
Message-ID: <477dc149-9f4a-71fa-7dbe-b79d75b7db93@iscas.ac.cn>
Date: Wed, 5 Oct 2022 22:54:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH v5 3/4] mm: support Svnapot in hugetlb page
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-4-panqinglin2020@iscas.ac.cn>
 <20221005131135.ljfn3iw475sqvgn4@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221005131135.ljfn3iw475sqvgn4@kamzik>
X-CM-TRANSID: rQCowAC3vLSTmj1jB84TAw--.45504S3
X-Coremail-Antispam: 1UD129KBjvAXoW3trW8XFyUWrW8JFW8KryDWrg_yoW8GF48Ao
	WSyr42qFyfJr1UJr4DC340qrnFqw1qg3yDJw4Ykwn3JF1Utayj9rZxtw4rZan8CF4fKrZ5
	CFyfGr9FvFWjy3s3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYP7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXV
	WUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6ry5MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5ZSdPUUUUU==
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwUKDGM9Lg6WVAAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_075415_492897_57804BA5 
X-CRM114-Status: GOOD (  43.55  )
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

Hi Andrew,

Thanks for so much suggestions : )
It seems that the code base has been changed and my code is not aware of
it. I will check them in detail according to your comments.

Tanks,
Qinglin

On 10/5/22 9:11 PM, Andrew Jones wrote:
> On Mon, Oct 03, 2022 at 09:47:20PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Svnapot can be used to support 64KB hugetlb page, so it can become a new
>> option when using hugetlbfs. This commit adds a basic implementation of
>> hugetlb page, and support 64KB as a size in it by using Svnapot.
>>
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
> 
> I think the above test is nearly equivalent to running
> 
>    tools/testing/selftests/vm/map_hugetlb 1 16
> 
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
> 
> The above define should be moved above its function.
> 
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
> 
> Why the riscv_ prefix on this one? Wait, what is set_huge_swap_pte_at()?
> It's not in asm-generic/hugetlb.h.
> 
>> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
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
> 
> We should be checking all the *_alloc's for NULL returns before
> progressing to the next one.
> 
>> +
>> +	if (sz == NAPOT_CONT64KB_SIZE) {
>> +		if (!pmdp)
>> +			return NULL;
>> +		WARN_ON(addr & (sz - 1));
>> +		return pte_alloc_map(mm, pmdp, addr);
>> +	}
> 
> What happened to the PUD_SIZE and PMD_SIZE handling that the
> generic huge_pte_alloc() does? I'm pretty sure we need to
> duplicate it here, at least it appears arm64 does it that way.
> 
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
> 
> Same question as above; where's the PUD and PMD size handling?
> 
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
> 
> If we should never call this function with a non-napot pte, then
> maybe this should be
> 
>   BUG(!(pte_val(pte) & _PAGE_NAPOT));
>   return NAPOT_64KB_PTE_NUM;
> 
>> +	return 1;
>> +}
>> +
>> +static pte_t get_clear_flush(struct mm_struct *mm,
>> +			     unsigned long addr,
>> +			     pte_t *ptep,
>> +			     unsigned long pte_num)
>> +{
>> +	pte_t orig_pte = huge_ptep_get(ptep);
> 
> It seems like we'd only want orig_pte = ptep_get(ptep) here (even
> though I know for riscv they're the same).
> 
>> +	bool valid = pte_val(orig_pte);
> 
> I think !pte_none(orig_pte) is more idiomatic.
> 
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
> 
> I'm not sure why we only flush all the cleared ptes when the
> the head pte wasn't originally cleared. And what if orig_pte
> had dirty and young bits propagated to it even though it
> originally cleared?
> 
>> +		struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
>> +
>> +		flush_tlb_range(&vma, saddr, addr);
>> +	}
> 
> blank line here, please
> 
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
> 
> riscv doesn't do anything in pte_mkhuge(), but I think I'd still prefer to
> see a
> 
>    entry = pte_mkhuge(entry);
> 
> here.
> 
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
> 
> How about replacing NAPOT_CONT64KB_SIZE with
> 
>    napot_pte_num(pte) << PAGE_SHIFT
> 
> which should allow it to work with other napot sizes?
> 
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
> 
> ptep_get() ?
> 
>> +
>> +	if (!pte_napot(pte))
>> +		return ptep_set_wrprotect(mm, addr, ptep);
> 
> ptep_set_wrprotect is a void function so this should be
> written as
> 
>    ptep_set_wrprotect(...);
>    return;
> 
> even though it's valid to return void from a void function...
> 
>> +
>> +	pte_num = napot_pte_num(pte);
>> +	ptep = huge_pte_offset(mm, addr, NAPOT_CONT64KB_SIZE);
>    
> Change NAPOT_CONT64KB_SIZE to napot_pte_num(pte) << PAGE_SHIFT ?
> 
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
> 
> ptep_get() ?
> 
>> +
>> +	if (!pte_napot(pte)) {
>> +		ptep_clear_flush(vma, addr, ptep);
>> +		return pte;
> 
> This would look nicer as
> 
>    if (!pte_napot(pte))
>       return ptep_clear_flush(vma, addr, ptep);
> 
>> +	}
>> +
>> +	pte_num = napot_pte_num(pte);
>> +	clear_flush(vma->vm_mm, addr, ptep, pte_num);
>> +
>> +	return pte;
> 
> arm64 ensures the pte returned from this function has had its
> dirty and young bits updated, but this function does not?
> 
>> +}
>> +
>> +void huge_pte_clear(struct mm_struct *mm,
>> +		    unsigned long addr,
>> +		    pte_t *ptep,
>> +		    unsigned long sz)
>> +{
>> +	int i, pte_num;
> 
> No check that the pte is a napot pte?
> 
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
> 
> No check that the pte is a napot pte?
> 
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
> 
> I think it'd be best if we avoid using explicit 64KB constants and instead
> define, e.g. napot_cont_size(pte), macros which, for now, will always
> return 64KB-based values.
> 
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
> 
> Where'd this come from? It looks like there should be another patch
> that just does the change of this gigantic_pages_init() function to
> a hugetlbpage function that does both gigantic (PUD) pages and PMD
> sized pages.
> 
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
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
