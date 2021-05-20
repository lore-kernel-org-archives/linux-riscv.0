Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A574C43460
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 05:12:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C150611AE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 05:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C150611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qDQ34+lDZ3XxhBavmRJhOKM73xRX4tAy4orApLzif9c=; b=nQMgExMSOBIBsKSdi8G8awits
	eLfnDPNrHizBLzmKSCeBSCvEc9aoIo/Pc/10qs1YUL/qGnuTV5umbkbUcCpMNlcszCzY9XCTCeNwM
	cZ+UllfAVuPYrLbFyt/tNVgKXy7lbBARK3MxXIrtM2lifYzwTorfhzc7ucYfwOlIhQZpaNiCGEM3L
	tqk2J06Tj41spdLnjta0DSgSyQpoVAY6EQOaJkYxoa4g4z8zcoXPban2aeF6zvkI6ffaBLuIUh/6n
	p+5xFMJ6LBW79eTM3l2bpaem63UnJ8O0T7Vze7U/TF5e/VEU7yk+TXq7nwXZdOgoiZVJjLy9cGEEN
	RpKEY6D9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljayN-005vbF-Ss; Thu, 20 May 2021 05:11:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljayK-005vb3-9e
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 05:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=2Niq391QpgukmKq+9QRt2UvOwRaDAHoV2KTILR/R240=; b=tJcG4juiS3DNRCI+Q1dInLJt2U
 a/47hGcnC/apZoxYrLtTXT7vIUqbOEGXbC+ylC46/u0Om3lrK/zzingkj8aIWvB+a7FwYXsRgKwNI
 wD1ZSM82jjxL4R9TkJLkqSEshRAdotwGk6jzOkQkC/6KN+BxkHeMgjNVXK8LvdemNNLemep6wfRsY
 HumT4pldsVvCsOYXzv/2lKeeLWt7zDm8LDCly9E4cUdGFusL50fH3cDqfKcbnkrpYCz/kjSWCqzvj
 Uns1bt5x7YZoIqyk8Ax0Srax42YapnZ4hGKI0No8Qi8LgMk7Wd0lOGQN0o1SJEJoIF+Aa/8m5D45j
 gVne+1Lw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljayG-00Fweo-LE
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 05:11:47 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 21422240006;
 Thu, 20 May 2021 05:11:34 +0000 (UTC)
Subject: Re: [PATCH RFC] riscv: Map the kernel with correct permissions the
 first time
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210518152134.1772653-1-alex@ghiti.fr>
 <20210520002909.0b699b2b@xhacker>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8d60a600-9f01-e913-fe2c-da0e0a363f82@ghiti.fr>
Date: Thu, 20 May 2021 07:11:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520002909.0b699b2b@xhacker>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_221145_014311_DD8CFE25 
X-CRM114-Status: GOOD (  34.00  )
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

Hi Jisheng,

On 19/05/2021 18:29, Jisheng Zhang wrote:
> On Tue, 18 May 2021 17:21:34 +0200
> Alexandre Ghiti <alex@ghiti.fr> wrote:
> 
>> For 64b kernels, we map all the kernel with write and execute permissions
>> and afterwards remove writability from text and executability from data.
>>
>> For 32b kernels, the kernel mapping resides in the linear mapping, so we
>> map all the linear mapping as writable and executable and afterwards we
>> remove those properties for unused memory and kernel mapping as
>> described above.
>>
>> Change this behavior to directly map the kernel with correct permissions
>> and avoid going through the whole mapping to fix the permissions.
>>
>> At the same time, this fixes an issue introduced by commit 2bfc6cd81bd1
>> ("riscv: Move kernel mapping outside of linear mapping") as reported
>> here https://github.com/starfive-tech/linux/issues/17.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>
>> This patchset was tested on:
>>
>> * kernel:
>> - rv32 with CONFIG_STRICT_KERNEL_RWX: OK
>> - rv32 without CONFIG_STRICT_KERNEL_RWX: OK
>> - rv64 with CONFIG_STRICT_KERNEL_RWX: OK
>> - rv64 without CONFIG_STRICT_KERNEL_RWX: OK
>>
>> * xipkernel:
>> - rv32: build only
>> - rv64: OK
>>
>>   arch/riscv/include/asm/set_memory.h |  2 -
>>   arch/riscv/kernel/setup.c           |  1 -
>>   arch/riscv/mm/init.c                | 80 ++++++++++++++---------------
>>   3 files changed, 38 insertions(+), 45 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
>> index 086f757e8ba3..70154f012791 100644
>> --- a/arch/riscv/include/asm/set_memory.h
>> +++ b/arch/riscv/include/asm/set_memory.h
>> @@ -16,13 +16,11 @@ int set_memory_rw(unsigned long addr, int numpages);
>>   int set_memory_x(unsigned long addr, int numpages);
>>   int set_memory_nx(unsigned long addr, int numpages);
>>   int set_memory_rw_nx(unsigned long addr, int numpages);
>> -void protect_kernel_text_data(void);
>>   #else
>>   static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>>   static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>>   static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>>   static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>> -static inline void protect_kernel_text_data(void) {}
>>   static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
>>   #endif
>>   
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 03901d3a8b02..1eb50e512056 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -292,7 +292,6 @@ void __init setup_arch(char **cmdline_p)
>>   	sbi_init();
>>   
>>   	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>> -		protect_kernel_text_data();
>>   		protect_kernel_linear_mapping_text_rodata();
> 
> If we extend the idea a bit, I.E create the correct permission for alias line
> mapping at the first time, we can remove protect_kernel_linear_mapping_text_rodata()
> 

Yes, I agree, I will do that.

> PS: No matter whether it's fine to extend, the set_memory_nx() calling in
> protect_kernel_linear_mapping_text_rodata() is not necessary since the linear
> mapping for 64bit is NX from the beginning.

You're totally right, that will be fixed when removing 
protect_kernel_linear_mapping_text_rodata() entirely.

> 
>>   	}
>>   
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 4faf8bd157ea..92b3184420a2 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -436,6 +436,36 @@ asmlinkage void __init __copy_data(void)
>>   }
>>   #endif
>>   
>> +#ifdef CONFIG_STRICT_KERNEL_RWX
>> +#define is_text_va(va)		({								\
>> +		unsigned long _va = va;								\
>> +		(_va < (unsigned long)__init_data_begin && _va >= (unsigned long)_start);	\
>> +	})
> 
> It's better if is_text_va() is a inline function
> 

Ok, will do.

>> +
>> +static inline __init pgprot_t pgprot_from_kernel_va(uintptr_t va)
> 
> I'm not sure whether it's necessary to put __init marker to inline functions
> There are such issues in current riscv code, I planed to cook one patch
> to remove __init from inline functions.
> 
> 
>> +{
>> +	return is_text_va(va) ? PAGE_KERNEL_READ_EXEC : PAGE_KERNEL;
> 
> if we extend the idea, then here we may return PAGE_KERNEL_READ, PAGE_KERNEL
> and PAGE_KERNEL_READ_EXEC correspondingly.

Again, I agree :)

I will come up with an enhanced v2 soon,

Thanks for your comments,

Alex

> 
> Thanks
> 
>> +}
>> +
>> +void mark_rodata_ro(void)
>> +{
>> +	unsigned long rodata_start = (unsigned long)__start_rodata;
>> +	unsigned long data_start = (unsigned long)_data;
>> +
>> +	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>> +
>> +	debug_checkwx();
>> +}
>> +#else
>> +static inline __init pgprot_t pgprot_from_kernel_va(uintptr_t va)
>> +{
>> +	if (IS_ENABLED(CONFIG_32BIT))
>> +		return PAGE_KERNEL_EXEC;
>> +
>> +	return (va < kernel_virt_addr) ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>> +}
>> +#endif
>> +
>>   /*
>>    * setup_vm() is called from head.S with MMU-off.
>>    *
>> @@ -465,7 +495,8 @@ uintptr_t xiprom, xiprom_sz;
>>   #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
>>   #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
>>   
>> -static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>> +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
>> +					    __always_unused bool early)
>>   {
>>   	uintptr_t va, end_va;
>>   
>> @@ -484,7 +515,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>>   				   map_size, PAGE_KERNEL);
>>   }
>>   #else
>> -static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>> +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size, bool early)
>>   {
>>   	uintptr_t va, end_va;
>>   
>> @@ -492,7 +523,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>>   	for (va = kernel_virt_addr; va < end_va; va += map_size)
>>   		create_pgd_mapping(pgdir, va,
>>   				   load_pa + (va - kernel_virt_addr),
>> -				   map_size, PAGE_KERNEL_EXEC);
>> +				   map_size, early ? PAGE_KERNEL_EXEC : pgprot_from_kernel_va(va));
>>   }
>>   #endif
>>   
>> @@ -569,7 +600,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>   	 * us to reach paging_init(). We map all memory banks later
>>   	 * in setup_vm_final() below.
>>   	 */
>> -	create_kernel_page_table(early_pg_dir, map_size);
>> +	create_kernel_page_table(early_pg_dir, map_size, true);
>>   
>>   #ifndef __PAGETABLE_PMD_FOLDED
>>   	/* Setup early PMD for DTB */
>> @@ -693,21 +724,15 @@ static void __init setup_vm_final(void)
>>   		map_size = best_map_size(start, end - start);
>>   		for (pa = start; pa < end; pa += map_size) {
>>   			va = (uintptr_t)__va(pa);
>> -			create_pgd_mapping(swapper_pg_dir, va, pa,
>> -					   map_size,
>> -#ifdef CONFIG_64BIT
>> -					   PAGE_KERNEL
>> -#else
>> -					   PAGE_KERNEL_EXEC
>> -#endif
>> -					);
>>   
>> +			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
>> +					   pgprot_from_kernel_va(va));
>>   		}
>>   	}
>>   
>>   #ifdef CONFIG_64BIT
>>   	/* Map the kernel */
>> -	create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
>> +	create_kernel_page_table(swapper_pg_dir, PMD_SIZE, false);
>>   #endif
>>   
>>   	/* Clear fixmap PTE and PMD mappings */
>> @@ -738,35 +763,6 @@ static inline void setup_vm_final(void)
>>   }
>>   #endif /* CONFIG_MMU */
>>   
>> -#ifdef CONFIG_STRICT_KERNEL_RWX
>> -void __init protect_kernel_text_data(void)
>> -{
>> -	unsigned long text_start = (unsigned long)_start;
>> -	unsigned long init_text_start = (unsigned long)__init_text_begin;
>> -	unsigned long init_data_start = (unsigned long)__init_data_begin;
>> -	unsigned long rodata_start = (unsigned long)__start_rodata;
>> -	unsigned long data_start = (unsigned long)_data;
>> -	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
>> -
>> -	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
>> -	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
>> -	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
>> -	/* rodata section is marked readonly in mark_rodata_ro */
>> -	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>> -	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
>> -}
>> -
>> -void mark_rodata_ro(void)
>> -{
>> -	unsigned long rodata_start = (unsigned long)__start_rodata;
>> -	unsigned long data_start = (unsigned long)_data;
>> -
>> -	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>> -
>> -	debug_checkwx();
>> -}
>> -#endif
>> -
>>   #ifdef CONFIG_KEXEC_CORE
>>   /*
>>    * reserve_crashkernel() - reserves memory for crash kernel
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
