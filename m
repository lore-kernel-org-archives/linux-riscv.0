Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF90EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DE5hp/i+Rp4iNWudG1Pf89JC43NIDfaworZdfOB46OQ=; b=xMziq1PwmO8qOg
	TrDpy7MV89BaPKHOPyosR4F7OetQ97VYON3cRIiBCqbVSDXQvAg42fUur9qm679ztrTy5rnxI9i4C
	klTsOmjzrtv8QbqhYK5f/pFFbbGk+ffP1jBu1/Jh8pZCHVAzaMaES/MAj2Tngqi+Oo56CR7IrE5gy
	pkLCnUA9ljRD6UjMsmP+lZ/n5u18eLGhB8JR/nRB4bwDUA6DdkoHODgM08jImsz37/hZN2SMOQLk3
	iRd+lbljblIDrQlikPQrja7MXLAQZhKe/NmC+ygWX3QrVqAvtlihG0kwPXeMzHuJrHl3QFcFAYKdP
	bPuWkzcC/+gZ/za4npMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxoCk-004tQB-D9; Thu, 16 Dec 2021 10:41:42 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxoCe-004tLz-UN
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 10:41:38 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4B27D20003;
 Thu, 16 Dec 2021 10:41:26 +0000 (UTC)
Message-ID: <74995c52-dfd4-d07e-cc0f-1a934be9cc16@ghiti.fr>
Date: Thu, 16 Dec 2021 11:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 2/5] riscv: mm: init: try best to use
 IS_ENABLED(CONFIG_64BIT) instead of #ifdef
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206150353.731-1-jszhang@kernel.org>
 <20211206150353.731-3-jszhang@kernel.org>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211206150353.731-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_024137_305480_CD8001CB 
X-CRM114-Status: GOOD (  28.93  )
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

hi Jisheng,

On 12/6/21 16:03, Jisheng Zhang wrote:
> Try our best to replace the conditional compilation using
> "#ifdef CONFIG_64BIT" by a check for "IS_ENABLED(CONFIG_64BIT)", to
> simplify the code and to increase compile coverage.
>
> Now we can also remove the __maybe_unused used in max_mapped_addr
> declaration.
>
> We also remove the BUG_ON check of mapping the last 4K bytes of the
> addressable memory since this is always true for every kernel actually.


That could have been a different patch as this does not fit the patch 
subject, but anyway:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex


>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 43 ++++++++++++++++---------------------------
>   1 file changed, 16 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 745f26a3b02e..4edf5600bea9 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -102,10 +102,9 @@ static void __init print_vm_layout(void)
>   		  (unsigned long)VMALLOC_END);
>   	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
>   		  (unsigned long)high_memory);
> -#ifdef CONFIG_64BIT
> -	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
> -		  (unsigned long)ADDRESS_SPACE_END);
> -#endif
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
> +			  (unsigned long)ADDRESS_SPACE_END);
>   }
>   #else
>   static void print_vm_layout(void) { }
> @@ -163,7 +162,7 @@ static void __init setup_bootmem(void)
>   {
>   	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>   	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> -	phys_addr_t __maybe_unused max_mapped_addr;
> +	phys_addr_t max_mapped_addr;
>   	phys_addr_t phys_ram_end;
>   
>   #ifdef CONFIG_XIP_KERNEL
> @@ -172,17 +171,16 @@ static void __init setup_bootmem(void)
>   
>   	memblock_enforce_memory_limit(memory_limit);
>   
> -	/*
> -	 * Reserve from the start of the kernel to the end of the kernel
> -	 */
> -#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
>   	/*
>   	 * Make sure we align the reservation on PMD_SIZE since we will
>   	 * map the kernel in the linear mapping as read-only: we do not want
>   	 * any allocation to happen between _end and the next pmd aligned page.
>   	 */
> -	vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
> -#endif
> +	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
> +	/*
> +	 * Reserve from the start of the kernel to the end of the kernel
> +	 */
>   	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>   
>   
> @@ -190,7 +188,6 @@ static void __init setup_bootmem(void)
>   #ifndef CONFIG_XIP_KERNEL
>   	phys_ram_base = memblock_start_of_DRAM();
>   #endif
> -#ifndef CONFIG_64BIT
>   	/*
>   	 * memblock allocator is not aware of the fact that last 4K bytes of
>   	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> @@ -200,10 +197,11 @@ static void __init setup_bootmem(void)
>   	 * address space is occupied by the kernel mapping then this check must
>   	 * be done as soon as the kernel mapping base address is determined.
>   	 */
> -	max_mapped_addr = __pa(~(ulong)0);
> -	if (max_mapped_addr == (phys_ram_end - 1))
> -		memblock_set_current_limit(max_mapped_addr - 4096);
> -#endif
> +	if (!IS_ENABLED(CONFIG_64BIT)) {
> +		max_mapped_addr = __pa(~(ulong)0);
> +		if (max_mapped_addr == (phys_ram_end - 1))
> +			memblock_set_current_limit(max_mapped_addr - 4096);
> +	}
>   
>   	min_low_pfn = PFN_UP(phys_ram_base);
>   	max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
> @@ -616,14 +614,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
>   	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
>   
> -#ifdef CONFIG_64BIT
> -	/*
> -	 * The last 4K bytes of the addressable memory can not be mapped because
> -	 * of IS_ERR_VALUE macro.
> -	 */
> -	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
> -#endif
> -
>   	pt_ops.alloc_pte = alloc_pte_early;
>   	pt_ops.get_pte_virt = get_pte_virt_early;
>   #ifndef __PAGETABLE_PMD_FOLDED
> @@ -735,10 +725,9 @@ static void __init setup_vm_final(void)
>   		}
>   	}
>   
> -#ifdef CONFIG_64BIT
>   	/* Map the kernel */
> -	create_kernel_page_table(swapper_pg_dir, false);
> -#endif
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		create_kernel_page_table(swapper_pg_dir, false);
>   
>   	/* Clear fixmap PTE and PMD mappings */
>   	clear_fixmap(FIX_PTE);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
