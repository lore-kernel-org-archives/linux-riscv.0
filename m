Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE816C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIQRqz4GUucGbBYkXb6grgcLFJPryeaajAM/7K5t1Vs=; b=WYYzGJEzt9oLXwyCvq+hcEcz2W
	VLtJZcdJDYXEkGlK4m2xlULsjqbTE27YcW//Xg0EXH+FFTmGXl9x8ZtrpE9eOTsxTYUii+PT1Rzcw
	nb3joG+wMdxoKWIzTV8BgPAd5KXaqypbqkwAiRSMSxJdIKP5QImnZwjCNqm4ISmpuohhFyOeYTPi4
	uRQP+pdlXppYmQh0+y33g9nT5SB5oCeEFEzOqtNs8nRt5VegbG2dXZTpOX6SpvjS5iJLHYiqVEGu1
	MmMY9Za4CgwTC+zaStPjJ28alofkdFe2FLjmXww6zQh3ztHn4zr+05JvkU2PrCAskpKHwfBj5qzAh
	fWOzfd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZXE-0000000EtXf-0Rih;
	Mon, 27 May 2024 12:33:04 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZXB-0000000EtWo-2YxO
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:33:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED0CE2000E;
	Mon, 27 May 2024 12:32:58 +0000 (UTC)
Message-ID: <335c8f7e-cef7-483c-bab7-6110e5d31071@ghiti.fr>
Date: Mon, 27 May 2024 14:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] riscv: replace va_kernel_pa_offset with
 va_kernel_data_pa_offset on XIP
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1715286093.git.namcao@linutronix.de>
 <133e7cd43a67abfed96bc246ae5f8a870edde684.1715286093.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <133e7cd43a67abfed96bc246ae5f8a870edde684.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_053302_020664_887545E8 
X-CRM114-Status: GOOD (  21.65  )
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


On 10/05/2024 08:28, Nam Cao wrote:
> On XIP kernel, the name "va_kernel_pa_offset" is misleading: unlike
> "normal" kernel, it is not the virtual-physical address offset of kernel
> mapping, it is the offset of kernel mapping's first virtual address to
> first physical address in DRAM, which is not meaningful because the
> kernel's first physical address is not in DRAM.
>
> For XIP kernel, there are 2 different offsets because the read-only part of
> the kernel resides in ROM while the rest is in RAM. The offset to ROM is in
> kernel_map.va_kernel_xip_pa_offset, while the offset to RAM is not stored
> anywhere: it is calculated on-the-fly.
>
> Remove this confusing "va_kernel_pa_offset" and add
> "va_kernel_data_pa_offset" as its replacement. This new variable is the
> offset of virtual mapping of the kernel's data portion to the corresponding
> physical addresses.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/page.h | 25 +++++++++++++++++++------
>   arch/riscv/mm/init.c          |  4 +++-
>   2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 115ac98b8d72..14d0de928f9b 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -112,11 +112,13 @@ struct kernel_mapping {
>   	/* Offset between linear mapping virtual address and kernel load address */
>   	unsigned long va_pa_offset;
>   	/* Offset between kernel mapping virtual address and kernel load address */
> -	unsigned long va_kernel_pa_offset;
> -	unsigned long va_kernel_xip_pa_offset;
>   #ifdef CONFIG_XIP_KERNEL
> +	unsigned long va_kernel_xip_pa_offset;
> +	unsigned long va_kernel_data_pa_offset;


I would call that new field va_kernel_xip_data_pa_offset so that we know 
at first sight it only applies to XIP_KERNEL (and maybe rename 
va_kernel_xip_pa_offset into va_kernel_xip_text_pa_offset?).


>   	uintptr_t xiprom;
>   	uintptr_t xiprom_sz;
> +#else
> +	unsigned long va_kernel_pa_offset;
>   #endif
>   };
>   
> @@ -134,12 +136,18 @@ extern phys_addr_t phys_ram_base;
>   #else
>   void *linear_mapping_pa_to_va(unsigned long x);
>   #endif
> +
> +#ifdef CONFIG_XIP_KERNEL
>   #define kernel_mapping_pa_to_va(y)	({					\
>   	unsigned long _y = (unsigned long)(y);					\
> -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
> +	(_y < phys_ram_base) ?							\
>   		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
> -		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
> +		(void *)(_y + kernel_map.va_kernel_data_pa_offset);		\
>   	})
> +#else
> +#define kernel_mapping_pa_to_va(y) (void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset)
> +#endif
> +
>   #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
>   
>   #ifndef CONFIG_DEBUG_VIRTUAL
> @@ -147,12 +155,17 @@ void *linear_mapping_pa_to_va(unsigned long x);
>   #else
>   phys_addr_t linear_mapping_va_to_pa(unsigned long x);
>   #endif
> +
> +#ifdef CONFIG_XIP_KERNEL
>   #define kernel_mapping_va_to_pa(y) ({						\
>   	unsigned long _y = (unsigned long)(y);					\
> -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
> +	(_y < kernel_map.virt_addr + XIP_OFFSET) ?				\
>   		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
> -		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
> +		(_y - kernel_map.va_kernel_data_pa_offset);			\
>   	})
> +#else
> +#define kernel_mapping_va_to_pa(y) ((unsigned long)(y) - kernel_map.va_kernel_pa_offset)
> +#endif
>   
>   #define __va_to_pa_nodebug(x)	({						\
>   	unsigned long _x = x;							\
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 5e3ec076ab95..9846c6924509 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1089,10 +1089,13 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
>   
>   	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
> +	kernel_map.va_kernel_data_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr
> +						+ (uintptr_t)&_sdata - (uintptr_t)&_start;
>   #else
>   	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
>   	kernel_map.phys_addr = (uintptr_t)(&_start);
>   	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
> +	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
>   #endif
>   
>   #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
> @@ -1114,7 +1117,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	 */
>   	kernel_map.va_pa_offset = IS_ENABLED(CONFIG_64BIT) ?
>   				0UL : PAGE_OFFSET - kernel_map.phys_addr;
> -	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
>   
>   	/*
>   	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit


I think you missed the occurence of va_kernel_pa_offset() in 
arch/riscv/kernel/vmcore_info.c.

Although some nits above, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
