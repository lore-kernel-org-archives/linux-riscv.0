Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C555AC04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnOaTtIJXedpMexDYdCFKFfaWI6O3WACJ7NRj4RmPFA=; b=OwtIOdvVQhOKBX
	ndxpLnvy2ofBKSjMiVqpMbKfCFUKXrtXaPgYc4wWEUPl7uUACajTvMk1jxO6J14wEARiNWI6F4TeP
	HWPe3x2g/lay5DEaXAIZxH2w1RsKlHBrtGWaSfeMHUitpU8++vpEx0Psd9csq+1GDZI4PFHE6AY+f
	L/kQga3tiMVII3Lsnn1ycDHlnUVKU1Xms/fcfQPB8ZCOtSnzcJQExWPvn3zc9TinBnCUqx060hN0p
	AOUjI7fCSrctvQY/r0WeBgm0/9UEjDEWlapqKMA+srGNTzopUmfSEB69mWLVtl6Q4SyB9xaM6wz5x
	PB0XYtmRrfNSpm0wlPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDAH-0057sS-0M;
	Wed, 02 Aug 2023 14:49:29 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDAC-0057nZ-2V
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 14:49:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32544FF80B;
	Wed,  2 Aug 2023 14:49:13 +0000 (UTC)
Message-ID: <28b1549f-d0de-f9e0-f1bd-57509136cf4a@ghiti.fr>
Date: Wed, 2 Aug 2023 16:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: Flush stale TLB entry with VMAP_STACK enabled
Content-Language: en-US
To: dylan <dylan@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com, tongtiangen@huawei.com, guoren@kernel.org,
 sergey.matyukevich@syntacore.com, gregkh@linuxfoundation.org,
 ajones@ventanamicro.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, conor.dooley@microchip.com, x5710999x@gmail.com,
 tim609@andestech.com, cl634@andestech.com, ycliang@andestech.com
References: <20230801090927.2018653-1-dylan@andestech.com>
 <dc26625b-6658-c078-76d2-7e975a04b1d4@ghiti.fr>
 <ZMpQIXXfFLCFeOtg@atctrx.andestech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZMpQIXXfFLCFeOtg@atctrx.andestech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_074925_077692_51C15449 
X-CRM114-Status: GOOD (  57.02  )
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


On 02/08/2023 14:46, dylan wrote:
> On Tue, Aug 01, 2023 at 03:56:06PM +0200, Alexandre Ghiti wrote:
>
> Hi Alex,
>
> Thanks for the comment.
>
>> Hi Dylan,
>>
>>
>> On 01/08/2023 11:09, Dylan Jhong wrote:
>>> When VMAP_STACK is enabled, the kernel stack will be obtained through
>>> vmalloc(). Normally, we rely on the logic in vmalloc_fault() to update stale
>>> P*D entries covering the vmalloc space in a task's page tables when it first
>>> accesses the problematic region.
>>
>> I guess that's for rv32 right? Because vmalloc_fault() has been removed for
>> rv64 in 6.5.
>>
>> Here you describe the issue as being caused by the vmap stack being in a new
>> PGD which then needs a page table synchronization in vmalloc_fault(), which
>> can't happen since vmalloc_fault() needs this same stack in the current page
>> table.
>>
> No. This problem only occurs on rv64. It is triggered when the kernel stack is
> allocated via vmalloc(), which is only eligible if VMAP_STACK is enabled.
> According to riscv/Kconfig, VMAP_STACK can only be enabled under rv64.
>
> Sorry I forgot to mention that I was developing on Linux 6.1 LTS, And I did not
> notice that vmalloc_fault() was removed in Linux 6.5. But this should not impact
> the problem this patch aims to solve, as the kernel stack is accessed in
> handle_exception()[1] long before vmalloc_fault() is called.
>
> To verify this, I also backported the "remove vmalloc_fault()" patch [2] to
> Linux 6.1 LTS. The experiment revealed that the problem still persists.
>
> [*1]: https://github.com/torvalds/linux/blob/master/arch/riscv/kernel/entry.S#L42
> [*2]: https://lore.kernel.org/linux-mm/871qiyfhpe.fsf@all.your.base.are.belong.to.us/T/
>
>>>    Unfortunately, this is not sufficient when
>>> the kernel stack resides in the vmalloc region, because vmalloc_fault() is a
>>> C function that needs a stack to run. So we need to ensure that these P*D
>>> entries are up to date *before* the MM switch.
>>>
>>> Here's our symptom:
>>> core 0: A speculative load lead the kernel stack load to the TLB before the
>>>           corresponding kernel stack's page table is created.
>>> core 1: Create page table mapping of that kernel stack.
>>> core 0: After a context switch, the kernel attempts to use the stack region.
>>>           However, even if the page table is correct, the stack address mapping
>>>           in the TLB is invalid, leading to subsequent nested exceptions.
>>
>> But here the problem you describe is different since it seems to be caused
>> by the TLB caching invalid entries which then needs a sfence.vma for the
>> page table walker to see the new correct entry.
>>
> TLB caching invalid entries is exactly the problem we encountered, so my modification
> is trying to update the TLB through the arch_sync_kernel_mappings() after vmalloc
> creates the page table.
>
> let me describe the situation we encountered more clearly:
>
> When we execute a multi-threaded user space program on rv64 SMP CPU, we eventually
> encounter the issue of nested exceptions caused by the TLB not being updated.
>
>
> CPU0                                           CPU1
> - (Thread 1) Create page table
> - (Thread 1) Do plist_check_list() to
>    check the kernel stack used by thread 1
>    is valid. But a speculative load will
>    be triggered here, causing the kernel
>    stack address of thread 2 to be loaded
>    to the TLB of CPU0, and thread 2 has
>    not yet been established at this time.
>                                                 - (Thread 2) Create page table
>                                                 - (Thread 2) Do plist_check_list().
>                                                 - Switch MM
> - (Thread 2) Keep executing user program
>    (thread 2) Enter handle_exception().
>    In Handle_excption() will try to access
>    kernel stack to store registers. But the
>    kernel stack mapping in TLB is invalid.
>    So another page fault exception is raised.
>    The nested exception occurs here. System hang.
>
> Therefore, the main intention of this patch is to flush the TLB of all CPUs
> after the page table created by vmalloc() before switching MM.
>
>>> This fix is inspired by ARM's approach[*1], commit a1c510d0adc6 ("ARM:
>>> implement support for vmap'ed stacks"), it also performs a TLB flush after
>>> setting up the page tables in vmalloc().
>>> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
>>> Signed-off-by: Dylan Jhong <dylan@andestech.com>
>>> ---
>>>    arch/riscv/include/asm/page.h |  4 ++++
>>>    arch/riscv/mm/tlbflush.c      | 16 ++++++++++++++++
>>>    2 files changed, 20 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
>>> index 349fad5e35de..c9b080a72855 100644
>>> --- a/arch/riscv/include/asm/page.h
>>> +++ b/arch/riscv/include/asm/page.h
>>> @@ -21,6 +21,10 @@
>>>    #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
>>>    #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
>>> +#ifdef CONFIG_VMAP_STACK
>>> +#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PTE_MODIFIED
>>> +#endif
>>> +
>>>    /*
>>>     * PAGE_OFFSET -- the first address of the first page of memory.
>>>     * When not using MMU this corresponds to the first free page in
>>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>>> index ef701fa83f36..0799978913ee 100644
>>> --- a/arch/riscv/mm/tlbflush.c
>>> +++ b/arch/riscv/mm/tlbflush.c
>>> @@ -86,3 +86,19 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>>    	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PMD_SIZE);
>>>    }
>>>    #endif
>>> +
>>> +#ifdef CONFIG_VMAP_STACK
>>> +/*
>>> + * Normally, we rely on the logic in vmalloc_fault() to update stale P*D
>>> + * entries covering the vmalloc space in a task's page tables when it first
>>> + * accesses the problematic region. Unfortunately, this is not sufficient when
>>> + * the kernel stack resides in the vmalloc region, because vmalloc_fault() is a
>>> + * C function that needs a stack to run. So we need to ensure that these P*D
>>> + * entries are up to date *before* the MM switch.
>>> + */
>>> +void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
>>> +{
>>> +	if (start < VMALLOC_END && end > VMALLOC_START)
>>> +		flush_tlb_all();
>>> +}
>>> +#endif
>>
>> And if that works for you, I'd say the problem is the latter: the TLB
>> caching invalid entries, since you don't synchronize the page tables here.
>> That looks a lot like the patch I proposed here https://patchwork.kernel.org/project/linux-riscv/patch/20230725132246.817726-1-alexghiti@rivosinc.com/
>> that implements flush_cache_vmap().
>>
> Updating the TLB in flush_cache_vmap() might address the problem I encountered,
> And I noticed that ARM accomplishes this through arch_sync_kernel_mappings()[3].
> As a result, I chose to adopt a similar approach to ARM's solution.
>
> [3]: https://github.com/torvalds/linux/blob/5d0c230f1de8c7515b6567d9afba1f196fb4e2f4/arch/arm/kernel/traps.c#L962


That being said, the problem is more general than the one you are trying 
to fix here, we should not restrict arch_sync_kernel_mappings() to 
VMAP_STACK as any vmalloc mapping could lead to such bug (even more 
since the removal of vmalloc_fault()). For microarchitectures that allow 
the caching of invalid entries in the TLB, at any new kernel mapping we 
must emit a "preventive" sfence.vma (unfortunately on all cores) since 
we would not be able to recover the kernel page fault (unless we find 
another solution, but given 6.5 is approaching, I doubt it).

I don't know which patch is "better" than the other, I'm looking into 
that. Maybe you could send a v2 in the meantime, where the commit log 
does not mention vmalloc_fault() and the synchronization of PGD entries, 
and which removes the #ifdef CONFIG_VMAP_STACK?

Thanks,

Alex


>
>> So I'm not mistaken, we have another problem in 32-bit: I guess that in your
>> example core 0 and core 1 execute in the same address space (ie the same
>> page table) and a simple sfence.vma gets rid of the invalid entry and things
>> can go on. But what if 2 page tables are created with the same vmalloc
>> mappings, one adds a PGD in the vmalloc mapping, then the other one does not
>> have it in its page table but still allocates its vmap stack in this new PGD
>> => the latter would never be able to recover from the vmalloc fault since it
>> needs to update its page table with the new PGD and it needs the new PGD for
>> that.
>>
>> Let me know if I'm completely wrong here!
>>
>> Thanks,
>>
>> Alex
>>
>>
> Best regards,
> Dylan Jhong
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
