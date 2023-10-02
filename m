Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58B9E784AC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3A5QqmmgGYEgAOip9zDC5FwW6u2jzm8COjjDIueAv3M=; b=rVnmDvsZf8YNqu
	/XAXZumAAV4TFt/KbpLsbtUA7HmJl9S1rI7Sl7FEJl/xii2UM4n/1nR7uDdAr0EunmkWtAkeiAVx8
	qDpXjqkw4Oe1XGgbmUrBQW+87gv0R6WlRJMK7s2PPCTsfTKF/VOBgCy+9LL6JVSRfdd7ajyyQrECC
	Zpe0h4s5GN4zs1nw/MZdE1Fuh/liaiDVAadpnK5nJ2KsvwEUA/ZVgvqSbeS6Ejp4sSBsPOtA1Vo1z
	2NS4JARvQcfJlXqHROnNLQ8AZTOJyPbzu39azAhRZMR/efMnR2eASuo225PguObrd7gadAd8TCsEc
	jnDsyxEbA1USzFA8Q32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJSO-00CpU7-1C;
	Mon, 02 Oct 2023 13:59:32 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJSK-00CpTj-1x
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 13:59:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96C974000A;
	Mon,  2 Oct 2023 13:59:20 +0000 (UTC)
Message-ID: <d49bb8d2-fbb5-ede3-662d-865f8929b7e8@ghiti.fr>
Date: Mon, 2 Oct 2023 15:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] riscv: mm: Synchronize memory attributes for all mm in
 free_initmem() on RV32 platform.
Content-Language: en-US
To: CL Wang <cl634@andestech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mason.huo@starfivetech.com,
 alexghiti@rivosinc.com, ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org
References: <20230912093356.2717293-1-cl634@andestech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230912093356.2717293-1-cl634@andestech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_065928_943465_CC5BF1FB 
X-CRM114-Status: GOOD (  40.93  )
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

Hi CL Wang,

For reference, I found a similar patch here 
https://lore.kernel.org/all/20220902101312.220350-1-vladimir.isaev@syntacore.com/ 
which was never merged.

On 12/09/2023 11:33, CL Wang wrote:
> 1. Symptom:
> 	[	44.486537] Unable to handle kernel paging request at virtual address c0800000
> 	[	44.509980] Oops [#1]
> 	[	44.516975] Modules linked in:
> 	[	44.526260] CPU: 0 PID: 1 Comm: swapper Not tainted 6.1.27-05153-g45f6a9286550-dirty #19
> 	[	44.550422] Hardware name: andestech,a45 (DT)
> 	[	44.563473] epc : __memset+0x58/0xf4
> 	[	44.574353]	ra : free_reserved_area+0xb0/0x1a4
> 	[	44.588144] epc : c05d4ca0 ra : c011f32c sp : c2c61f00
> 	[	44.603536]	gp : c28a57c8 tp : c2c98000 t0 : c0800000
> 	[	44.618916]	t1 : 07901b48 t2 : 0000000f s0 : c2c61f50
> 	[	44.634308]	s1 : 00000001 a0 : c0800000 a1 : cccccccc
> 	[	44.649696]	a2 : 00001000 a3 : c0801000 a4 : 00000000
> 	[	44.665085]	a5 : 02000000 a6 : c0800fff a7 : 00000c08
> 	[	44.680467]	s2 : 000000cc s3 : ffffffff s4 : 00000000
> 	[	44.695846]	s5 : c28a66cc s6 : c1eba000 s7 : c2125820
> 	[	44.711225]	s8 : c0800000 s9 : c212583c s10: c28a6648
> 	[	44.726623]	s11: fe03c7c0 t3 : acf917bf t4 : e0000000
> 	[	44.742009]	t5 : c2ca0011 t6 : c2ca0016
> 	[	44.753789] status: 00000120 badaddr: c0800000 cause: 0000000f
> 	[	44.771234] [<c05d4ca0>] __memset+0x58/0xf4
> 	[	44.783895] [<c0003e54>] free_initmem+0x80/0x88
> 	[	44.797599] [<c05dcd5c>] kernel_init+0x3c/0x124
> 	[	44.811391] [<c0003428>] ret_from_exception+0x0/0x16
>
> 2. To reproduce the problem:
> 	a. Use the RV32 toolchain to build the system.
> 	b. Build in the SPI module and mtdpart module in the kernel
> 		Example: Enable the following configuration
> 		- CONFIG_SPI
> 		- CONFIG_MTD and CONFIG_MTD_SPI_NOR
> 	c. Enable the "Make kernel text and rodata read-only" option by using the
> 	   following kernel config.
> 		- CONFIG_STRICT_KERNEL_RWX
>
> 3. Root cause:
> 	This problem occurs when the virtual address of the kernel paging request
> 	is mapped to a megapage on the RV32 platform.
> 	During system startup, free_initmem() calls set_kernel_memory() to
> 	change the memory attributes of the init section from RO to RW. It
> 	then calls free_initmem_default() to set the memory to
> 	POISON_FREE_INITMEM. If the system runs modprobe at boot time, it
> 	will trigger a fork/exec to create a new mm for the new process. If
> 	the modprobe was called before free_initmem(), it will cause a kernel
> 	oops because the memory attributes of the current mm were not changed
> 	by set_kernel_memory(). This is because the set_kernel_memory() changes
> 	the memory attributes of init_mm, but the pgd(satp) currently in use
> 	is another process's mm and it's memory attribute doesn't change.
> 	Thus, it causes a kernel oops because the memory region has an
> 	un-writable attribute.
>
> 4. The solution.
> 	A similar problem occurred on ARM platforms and was fixed in
> 	08925c2f12 (ARM: 8464/1: Update all mm structures with section
> 	adjustments). This patch uses a similar approach to fix the
> 	problem on RV32 by synchronizing the memory attributes
> 	of the init section for all mm
>
> Signed-off-by: CL Wang <cl634@andestech.com>
> ---
>   arch/riscv/include/asm/set_memory.h | 12 +++++++++
>   arch/riscv/kernel/setup.c           | 40 +++++++++++++++++++++++++----
>   arch/riscv/mm/pageattr.c            | 30 ++++++++++++++--------
>   3 files changed, 66 insertions(+), 16 deletions(-)
>
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index a2c14d4b3993..041551bf568e 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -16,6 +16,10 @@ int set_memory_rw(unsigned long addr, int numpages);
>   int set_memory_x(unsigned long addr, int numpages);
>   int set_memory_nx(unsigned long addr, int numpages);
>   int set_memory_rw_nx(unsigned long addr, int numpages);
> +
> +#if defined(CONFIG_32BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +int set_memory_rw_nx_by_mm(unsigned long addr, int numpages, struct mm_struct *mm);
> +#endif
>   static __always_inline int set_kernel_memory(char *startp, char *endp,
>   					     int (*set_memory)(unsigned long start,
>   							       int num_pages))
> @@ -32,6 +36,14 @@ static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>   static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>   static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>   static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> +
> +#if defined(CONFIG_32BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +static inline int set_memory_rw_nx_by_mm(unsigned long addr,
> +				int numpages, struct mm_struct *mm)
> +{
> +	return 0;
> +}
> +#endif
>   static inline int set_kernel_memory(char *startp, char *endp,
>   				    int (*set_memory)(unsigned long start,
>   						      int num_pages))
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 5424d7631502..73c221b3c399 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -319,13 +319,43 @@ static int __init topology_init(void)
>   }
>   subsys_initcall(topology_init);
>   
> -void free_initmem(void)
> +#if defined(CONFIG_32BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +static void set_kernel_mm_early(char *startp, char *endp,
> +				int (*set_memory)(unsigned long start,
> +				int num_pages, struct mm_struct *mm))
>   {
> -	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
> -		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end), set_memory_rw_nx);
> -		if (IS_ENABLED(CONFIG_64BIT))
> -			set_kernel_memory(__init_begin, __init_end, set_memory_nx);
> +	struct task_struct *t, *s;
> +	unsigned long start = (unsigned long)startp;
> +	unsigned long end = (unsigned long)endp;
> +	int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> +
> +	set_memory(start, num_pages, current->active_mm);
> +	if (current->active_mm != &init_mm)
> +		set_memory(start, num_pages, &init_mm);
> +
> +	for_each_process(t) {
> +		if (t->flags & PF_KTHREAD)
> +			continue;
> +		for_each_thread(t, s) {
> +			if (s->mm)
> +				set_memory(start, num_pages, s->mm);
> +		}
>   	}


There is one big difference between your patch here and commit 
08925c2f12 (ARM: 8464/1: Update all mm structures with section 
adjustments): the parsing of the tasks is done within a stop_machine() 
call which stops all other cpus (IIUC). At least the tasklist_lock 
should be held but it seems to be wrong according to the last answer 
from Palmer in the patch I mention ^.

To me something needs to be done to prevent the creation of new 
processes, and if it's only used once in the kernel lifetime and it 
works, I would use stop_machine() like arm does.

Thanks,

Alex


> +}
> +#endif
> +
> +void free_initmem(void)
> +{
> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +#ifdef CONFIG_32BIT
> +	set_kernel_mm_early(lm_alias(__init_begin), lm_alias(__init_end),
> +			    set_memory_rw_nx_by_mm);
> +#else
> +	set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end), set_memory_rw_nx);
> +#endif
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		set_kernel_memory(__init_begin, __init_end, set_memory_nx);
> +#endif
>   
>   	free_initmem_default(POISON_FREE_INITMEM);
>   }
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index ea3d61de065b..16ed5cc8f683 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -105,7 +105,7 @@ static const struct mm_walk_ops pageattr_ops = {
>   };
>   
>   static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> -			pgprot_t clear_mask)
> +			pgprot_t clear_mask, struct mm_struct *mm)
>   {
>   	int ret;
>   	unsigned long start = addr;
> @@ -118,42 +118,50 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>   	if (!numpages)
>   		return 0;
>   
> -	mmap_write_lock(&init_mm);
> -	ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
> +	mmap_write_lock(mm);
> +	ret =  walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
>   				     &masks);
> -	mmap_write_unlock(&init_mm);
> +	mmap_write_unlock(mm);
>   
>   	flush_tlb_kernel_range(start, end);
>   
>   	return ret;
>   }
>   
> +#if defined(CONFIG_32BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +int set_memory_rw_nx_by_mm(unsigned long addr, int numpages, struct mm_struct *mm)
> +{
> +	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
> +			    __pgprot(_PAGE_EXEC), mm);
> +}
> +#endif
> +
>   int set_memory_rw_nx(unsigned long addr, int numpages)
>   {
>   	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
> -			    __pgprot(_PAGE_EXEC));
> +			    __pgprot(_PAGE_EXEC), &init_mm);
>   }
>   
>   int set_memory_ro(unsigned long addr, int numpages)
>   {
>   	return __set_memory(addr, numpages, __pgprot(_PAGE_READ),
> -			    __pgprot(_PAGE_WRITE));
> +			    __pgprot(_PAGE_WRITE), &init_mm);
>   }
>   
>   int set_memory_rw(unsigned long addr, int numpages)
>   {
>   	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
> -			    __pgprot(0));
> +			    __pgprot(0), &init_mm);
>   }
>   
>   int set_memory_x(unsigned long addr, int numpages)
>   {
> -	return __set_memory(addr, numpages, __pgprot(_PAGE_EXEC), __pgprot(0));
> +	return __set_memory(addr, numpages, __pgprot(_PAGE_EXEC), __pgprot(0), &init_mm);
>   }
>   
>   int set_memory_nx(unsigned long addr, int numpages)
>   {
> -	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
> +	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC), &init_mm);
>   }
>   
>   int set_direct_map_invalid_noflush(struct page *page)
> @@ -198,10 +206,10 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
>   
>   	if (enable)
>   		__set_memory((unsigned long)page_address(page), numpages,
> -			     __pgprot(_PAGE_PRESENT), __pgprot(0));
> +			     __pgprot(_PAGE_PRESENT), __pgprot(0), &init_mm);
>   	else
>   		__set_memory((unsigned long)page_address(page), numpages,
> -			     __pgprot(0), __pgprot(_PAGE_PRESENT));
> +			     __pgprot(0), __pgprot(_PAGE_PRESENT), &init_mm);
>   }
>   #endif
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
