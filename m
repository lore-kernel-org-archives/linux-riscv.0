Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382A6C25B4F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 May 2024 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57XjwqiUe3envE3aWDei77+s9QrPAuLsg3kOKZr2BI4=; b=Z32rqe2hoaQLiU
	fp1oEDPohtdsVkzTjphiz9yzm5BHFN55fDfzNRUfA+TmJ3CnWGjjWFjgZlU1iIz1e1Cvnhi3XRD2N
	JHsciY8QArY77op8klfSumGs6jnLN+/mwx4Qp+qom+TAEE7bQ+YIpvThe+D9LXqnAn/afdjSSrBpq
	DbIBYwLSyyHj4auDSy53A26EJPV7nseskOJgEetNl1Br+qXe0K+Yyh+vEtJcH8EbRVOnhQ1aTYNuh
	+aHp+uj19baFMi6PGMmbQ5XajoaQJdtS3TfNfeqap14erESz1ZLHzyOCMjue1pxTZg8KqUSUYDAJf
	s8jEMsx11KaMAIq2375Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6FZz-0000000Ajgd-3Nns;
	Sun, 12 May 2024 20:13:55 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6FZw-0000000AjfV-1W44
	for linux-riscv@lists.infradead.org;
	Sun, 12 May 2024 20:13:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05C981BF203;
	Sun, 12 May 2024 20:12:42 +0000 (UTC)
Message-ID: <e46b2d43-fe4d-4e9b-95ad-1900779b8bed@ghiti.fr>
Date: Sun, 12 May 2024 22:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/12] riscv/mm: prepare shadow stack for init task
 for kernel cfi
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, andy.chiu@sifive.com, hankuan.chen@sifive.com,
 guoren@kernel.org, greentime.hu@sifive.com, samitolvanen@google.com,
 cleger@rivosinc.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, mchitale@ventanamicro.com,
 dbarboza@ventanamicro.com, waylingii@gmail.com, sameo@rivosinc.com,
 alexghiti@rivosinc.com, akpm@linux-foundation.org,
 shikemeng@huaweicloud.com, rppt@kernel.org, charlie@rivosinc.com,
 xiao.w.wang@intel.com, willy@infradead.org, jszhang@kernel.org,
 leobras@redhat.com, songshuaishuai@tinylab.org, haxel@fzi.de,
 samuel.holland@sifive.com, namcaov@gmail.com, bjorn@rivosinc.com,
 cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, falcon@tinylab.org,
 viro@zeniv.linux.org.uk, bhe@redhat.com, chenjiahao16@huawei.com,
 hca@linux.ibm.com, arnd@arndb.de, kent.overstreet@linux.dev,
 boqun.feng@gmail.com, oleg@redhat.com, paulmck@kernel.org,
 broonie@kernel.org, rick.p.edgecombe@intel.com
References: <20240409061043.3269676-1-debug@rivosinc.com>
 <20240409061043.3269676-8-debug@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240409061043.3269676-8-debug@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_131353_016737_0CC6F08F 
X-CRM114-Status: GOOD (  23.85  )
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


On 09/04/2024 08:10, Deepak Gupta wrote:
> Under CONFIG_SHADOW_CALL_STACK, shadow call stack goes into data section.
> Although with CONFIG_DYNAMIC_SCS on riscv, hardware assisted shadow stack
> are used. Hardware assisted shadow stack on riscv uses PTE.R=0, PTE.W=1 &
> PTE.X=0 encodings. Without CONFIG_DYNAMIC_SCS, shadow stack for init is
> placed in data section and thus regular read/write encodings are applied
> to it. Although with with CONFIG_DYNAMIC_SCS, they need to go into
> different section. This change places it into `.shadowstack` section.
> As part of this change early boot code (`setup_vm`), applies appropriate
> PTE encodings to shadow call stack for init placed in `.shadowstack`
> section.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/include/asm/pgtable.h     |  4 ++++
>   arch/riscv/include/asm/sections.h    | 22 +++++++++++++++++++++
>   arch/riscv/include/asm/thread_info.h | 10 ++++++++--
>   arch/riscv/kernel/vmlinux.lds.S      | 12 ++++++++++++
>   arch/riscv/mm/init.c                 | 29 +++++++++++++++++++++-------
>   5 files changed, 68 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9f8ea0e33eb1..3409b250390d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -197,6 +197,10 @@ extern struct pt_alloc_ops pt_ops __initdata;
>   #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
>   					 | _PAGE_EXEC)
>   
> +#ifdef CONFIG_DYNAMIC_SCS
> +#define PAGE_KERNEL_SHADOWSTACK __pgprot(_PAGE_KERNEL & ~(_PAGE_READ | _PAGE_EXEC))
> +#endif
> +


Not sure the ifdefs are necessary here, but I'll let others jump in. We 
have a lot of them, so we should try not to add.


>   #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
>   
>   #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> index a393d5035c54..4c4154d0021e 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -14,6 +14,10 @@ extern char __init_data_begin[], __init_data_end[];
>   extern char __init_text_begin[], __init_text_end[];
>   extern char __alt_start[], __alt_end[];
>   extern char __exittext_begin[], __exittext_end[];
> +#ifdef CONFIG_DYNAMIC_SCS
> +extern char __init_shstk_start[], __init_shstk_end[];
> +#endif
> +extern char __end_srodata[];
>   
>   static inline bool is_va_kernel_text(uintptr_t va)
>   {
> @@ -31,4 +35,22 @@ static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
>   	return va >= start && va < end;
>   }
>   
> +#ifdef CONFIG_DYNAMIC_SCS
> +static inline bool is_va_init_shadow_stack_early(uintptr_t va)
> +{
> +	uintptr_t start = (uintptr_t)(kernel_mapping_pa_to_va(__init_shstk_start));
> +	uintptr_t end = (uintptr_t)(kernel_mapping_pa_to_va(__init_shstk_end));
> +
> +	return va >= start && va < end;
> +}
> +
> +static inline bool is_va_init_shadow_stack(uintptr_t va)
> +{
> +	uintptr_t start = (uintptr_t)(__init_shstk_start);
> +	uintptr_t end = (uintptr_t)(__init_shstk_end);
> +
> +	return va >= start && va < end;
> +}
> +#endif


You could have used an early flag and have only one function but that's 
up to you.


> +
>   #endif /* __ASM_SECTIONS_H */
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 5d473343634b..7ae28d627f84 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -63,12 +63,18 @@ struct thread_info {
>   };
>   
>   #ifdef CONFIG_SHADOW_CALL_STACK
> +#ifdef CONFIG_DYNAMIC_SCS
>   #define INIT_SCS							\
> -	.scs_base	= init_shadow_call_stack,			\
> +	.scs_base	= init_shadow_call_stack,	\
> +	.scs_sp		= &init_shadow_call_stack[SCS_SIZE / sizeof(long)],
> +#else
> +#define INIT_SCS							\
> +	.scs_base	= init_shadow_call_stack,	\
>   	.scs_sp		= init_shadow_call_stack,
> +#endif /* CONFIG_DYNAMIC_SCS */
>   #else
>   #define INIT_SCS
> -#endif
> +#endif /* CONFIG_SHADOW_CALL_STACK */
>   
>   /*
>    * macros/functions for gaining access to the thread information structure
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 002ca58dd998..cccc51f845ab 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -126,6 +126,18 @@ SECTIONS
>   		*(.srodata*)
>   	}
>   
> +	. = ALIGN(SECTION_ALIGN);
> +	__end_srodata = .;
> +
> +#ifdef CONFIG_DYNAMIC_SCS
> +	.shadowstack : AT(ADDR(.shadowstack) - LOAD_OFFSET){
> +		__init_shstk_start = .;
> +		KEEP(*(.shadowstack..init))
> +		. = __init_shstk_start + PAGE_SIZE;
> +		__init_shstk_end = .;
> +	}
> +#endif
> +
>   	. = ALIGN(SECTION_ALIGN);
>   	_data = .;
>   
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fe8e159394d8..5b6f0cfa5719 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -713,14 +713,22 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
>   	if (IS_ENABLED(CONFIG_64BIT) && is_va_kernel_lm_alias_text(va))
>   		return PAGE_KERNEL_READ;
>   
> +#ifdef CONFIG_DYNAMIC_SCS
> +	/* If init task's shadow stack va, return write only page protections */
> +	if (IS_ENABLED(CONFIG_64BIT) && is_va_init_shadow_stack(va)) {
> +		pr_info("Shadow stack protections are being applied to for init\n");
> +		return PAGE_KERNEL_SHADOWSTACK;
> +	}
> +#endif


To avoid the ifdef here, I would hide it inis_va_init_shadow_stack().


> +
>   	return PAGE_KERNEL;
>   }
>   
>   void mark_rodata_ro(void)
>   {
> -	set_kernel_memory(__start_rodata, _data, set_memory_ro);
> +	set_kernel_memory(__start_rodata, __end_srodata, set_memory_ro);
>   	if (IS_ENABLED(CONFIG_64BIT))
> -		set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
> +		set_kernel_memory(lm_alias(__start_rodata), lm_alias(__end_srodata),
>   				  set_memory_ro);
>   }
>   #else
> @@ -913,14 +921,21 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
>   static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
>   {
>   	uintptr_t va, end_va;
> +	pgprot_t prot;
>   
>   	end_va = kernel_map.virt_addr + kernel_map.size;
> -	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
> +	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE) {
> +		prot = PAGE_KERNEL_EXEC;
> +#ifdef CONFIG_DYNAMIC_SCS
> +		if (early && is_va_init_shadow_stack_early(va))
> +			prot = PAGE_KERNEL_SHADOWSTACK;
> +#endif


Ditto here to avoid the ifdef, hide it intois_va_init_shadow_stack_early().


>   		create_pgd_mapping(pgdir, va,
> -				   kernel_map.phys_addr + (va - kernel_map.virt_addr),
> -				   PMD_SIZE,
> -				   early ?
> -					PAGE_KERNEL_EXEC : pgprot_from_va(va));
> +					kernel_map.phys_addr + (va - kernel_map.virt_addr),
> +					PMD_SIZE,
> +					early ?


The 3 lines above are not modified, so no need to indent them.


> +					prot : pgprot_from_va(va));
> +	}
>   }
>   #endif
>   


Apart from the nits above, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
