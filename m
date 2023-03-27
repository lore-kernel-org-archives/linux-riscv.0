Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2E5C7619A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AG5F5F2t7UOiQGvs6MbHpMIyTf66WmxvlRfLL75ScTY=; b=bjIwCCz02KQ0Do
	BQU0dxKRayU+L6tPaNQfkjUKrnQKWPYMQgQwSccjROXqZ70oKJlK6w7AP1PR5z/tgpFJ9HJKX4Owt
	y1Mhz06OGyNICezHC+r2zwe3pIMrH4YcOagwE/3CcQNUcWXY8KUJhROFu7a2/XT8cHcDb61LT9HOY
	5Q9n+6HdQVxCJ7au1fCnYuIJpiqqCANmxPQXsA0DK1w8672XBgaGj57gbU9zYfHVaIs75anZUiTMW
	jLWn6ipzOkYr5uPMctPPF1P4KzV1AyrE5XZBwm1smuawHB5KlBNBpaCBx0kF8K65FeWwCzG0bfm7N
	vd60qP3Mb5eb1lvOMYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjKB-00AVTt-1M;
	Mon, 27 Mar 2023 09:39:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjK7-00AVSN-2l
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 09:39:33 +0000
Received: by mail-ed1-x529.google.com with SMTP id cn12so33380162edb.4
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679909968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1i0W/TyfpldDwaDiDa5U5Pl1vVO1LPRVT3PtKODUh4=;
        b=QwUMOwUnpDNJjrMuF98rA6azBWTIq+L5BRUMNq7lZB1a6AxSdzr4iCvRSY/bJu26jI
         wT797bIj4Sthn7ccYaAINxS/bzt/ewLc9j1qK98AOxHwe7hvsY0TaK3IJZuPeEpDZYQ5
         mk5ce20LcFctiGpCuoEudQ5m5z4EuY5JXqXNTUiEAIiho36RXhZCjKskp0f0rS4Q2Rl3
         X7oursXLostIWZcwjRcPFLm4z9bra+cItSaCHGN1Kl97mTzvVU+d//tUGM3GQkqSViIJ
         3V9vn3Vpl1dpaThbMwvhz993qeHln5ZUEfFt272Vb3i/vjdRivbDy/xx8VsYy/QEVT4O
         xbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679909968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1i0W/TyfpldDwaDiDa5U5Pl1vVO1LPRVT3PtKODUh4=;
        b=XyH9CATc//tG/hdT6/hAf8fCTczA/u5/P30WvUvc+jjbSp+JTrBmQETzsO+sqDUoO0
         787Hy7te5Fl60Kqg3hyC758eIa6lgTZB+9VoS3kYYw3tS8qSALOldrRaJ81nc59ypXk4
         cdIrAS3qY6ohQotCv7BxFHbql0/ZJRYcU+mRuLfK0pIgWB0IBXAgDJnUgQFrawQuF+pW
         hAEyw30r4D+//N+TrSpwO7Q5x4WsGwZQBneaqHeTa83RQWlXZGt/Xi3oXrBfGHEL04LL
         91Bzc25UOu3k8mKwTme8QX+ZDzUvwGPZ+xjdYVnkuoIGcw1+Hhngpa6dWkwGIio8WM0y
         Vs/w==
X-Gm-Message-State: AAQBX9cz3ks7GBD1sRXYa4lsJdk3qg9rV37ZLh/t5FFAu4D98bz6hKlt
	k0oBEjTetmBOhiiytaMGnN/kCg==
X-Google-Smtp-Source: AKy350ZIdTgrUsmjPbPrH5ktZ8JEFljNgWqu8QE0sBVlRr3MQObAN9KaR9F+TGv/AjggRpFoe41eAg==
X-Received: by 2002:a17:906:483:b0:870:d9a:9ebb with SMTP id f3-20020a170906048300b008700d9a9ebbmr12495955eja.38.1679909968042;
        Mon, 27 Mar 2023 02:39:28 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k10-20020a1709067aca00b009294524ac21sm13874996ejo.60.2023.03.27.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 02:39:27 -0700 (PDT)
Date: Mon, 27 Mar 2023 11:39:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 3/3] riscv: Use PUD/P4D/PGD pages for the linear
 mapping
Message-ID: <20230327093926.x5qyb5nou7naiyyv@orel>
References: <20230324155421.271544-1-alexghiti@rivosinc.com>
 <20230324155421.271544-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324155421.271544-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_023931_893845_6F6DA316 
X-CRM114-Status: GOOD (  48.47  )
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

On Fri, Mar 24, 2023 at 04:54:21PM +0100, Alexandre Ghiti wrote:
> During the early page table creation, we used to set the mapping for
> PAGE_OFFSET to the kernel load address: but the kernel load address is
> always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> PAGE_OFFSET is).
> 
> But actually we don't have to establish this mapping (ie set va_pa_offset)
> that early in the boot process because:
> 
> - first, setup_vm installs a temporary kernel mapping and among other
>   things, discovers the system memory,
> - then, setup_vm_final creates the final kernel mapping and takes
>   advantage of the discovered system memory to create the linear
>   mapping.
> 
> During the first phase, we don't know the start of the system memory and
> then until the second phase is finished, we can't use the linear mapping at
> all and phys_to_virt/virt_to_phys translations must not be used because it
> would result in a different translation from the 'real' one once the final
> mapping is installed.
> 
> So here we simply delay the initialization of va_pa_offset to after the
> system memory discovery. But to make sure noone uses the linear mapping
> before, we add some guard in the DEBUG_VIRTUAL config.
> 
> Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> in a better TLB utilization.
> 
> Note that:
> - this does not apply to rv32 as the kernel mapping lies in the linear
>   mapping.
> - we rely on the firmware to protect itself using PMP.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Acked-by: Rob Herring <robh@kernel.org> # DT bits
> ---
>  arch/riscv/include/asm/page.h | 16 ++++++++++
>  arch/riscv/mm/init.c          | 58 +++++++++++++++++++++++++++++++----
>  arch/riscv/mm/physaddr.c      | 16 ++++++++++
>  drivers/of/fdt.c              | 11 ++++---
>  4 files changed, 90 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 8dc686f549b6..ea1a0e237211 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -90,6 +90,14 @@ typedef struct page *pgtable_t;
>  #define PTE_FMT "%08lx"
>  #endif
>  
> +#ifdef CONFIG_64BIT
> +/*
> + * We override this value as its generic definition uses __pa too early in
> + * the boot process (before kernel_map.va_pa_offset is set).
> + */
> +#define MIN_MEMBLOCK_ADDR      0
> +#endif
> +
>  #ifdef CONFIG_MMU
>  #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
>  #else
> @@ -121,7 +129,11 @@ extern phys_addr_t phys_ram_base;
>  #define is_linear_mapping(x)	\
>  	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
>  
> +#ifndef CONFIG_DEBUG_VIRTUAL
>  #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
> +#else
> +void *linear_mapping_pa_to_va(unsigned long x);
> +#endif
>  #define kernel_mapping_pa_to_va(y)	({					\
>  	unsigned long _y = (unsigned long)(y);					\
>  	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
> @@ -130,7 +142,11 @@ extern phys_addr_t phys_ram_base;
>  	})
>  #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
>  
> +#ifndef CONFIG_DEBUG_VIRTUAL
>  #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
> +#else
> +phys_addr_t linear_mapping_va_to_pa(unsigned long x);
> +#endif
>  #define kernel_mapping_va_to_pa(y) ({						\
>  	unsigned long _y = (unsigned long)(y);					\
>  	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 3b37d8606920..f803671d18b2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -213,6 +213,14 @@ static void __init setup_bootmem(void)
>  	phys_ram_end = memblock_end_of_DRAM();
>  	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
>  		phys_ram_base = memblock_start_of_DRAM();
> +
> +	/*
> +	 * In 64-bit, any use of __va/__pa before this point is wrong as we
> +	 * did not know the start of DRAM before.
> +	 */
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
> +
>  	/*
>  	 * memblock allocator is not aware of the fact that last 4K bytes of
>  	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> @@ -667,9 +675,16 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>  
>  static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  {
> -	/* Upgrade to PMD_SIZE mappings whenever possible */
> -	base &= PMD_SIZE - 1;
> -	if (!base && size >= PMD_SIZE)
> +	if (!(base & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
> +		return PGDIR_SIZE;
> +
> +	if (!(base & (P4D_SIZE - 1)) && size >= P4D_SIZE)
> +		return P4D_SIZE;
> +
> +	if (!(base & (PUD_SIZE - 1)) && size >= PUD_SIZE)
> +		return PUD_SIZE;
> +
> +	if (!(base & (PMD_SIZE - 1)) && size >= PMD_SIZE)
>  		return PMD_SIZE;
>  
>  	return PAGE_SIZE;
> @@ -978,11 +993,22 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	set_satp_mode();
>  #endif
>  
> -	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
> +	/*
> +	 * In 64-bit, we defer the setup of va_pa_offset to setup_bootmem,
> +	 * where we have the system memory layout: this allows us to align
> +	 * the physical and virtual mappings and then make use of PUD/P4D/PGD
> +	 * for the linear mapping. This is only possible because the kernel
> +	 * mapping lies outside the linear mapping.
> +	 * In 32-bit however, as the kernel resides in the linear mapping,
> +	 * setup_vm_final can not change the mapping established here,
> +	 * otherwise the same kernel addresses would get mapped to different
> +	 * physical addresses (if the start of dram is different from the
> +	 * kernel physical address start).
> +	 */
> +	kernel_map.va_pa_offset = IS_ENABLED(CONFIG_64BIT) ?
> +				0UL : PAGE_OFFSET - kernel_map.phys_addr;
>  	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
>  
> -	phys_ram_base = kernel_map.phys_addr;
> -
>  	/*
>  	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
>  	 * kernel, whereas for 64-bit kernel, the end of the virtual address
> @@ -1106,6 +1132,17 @@ static void __init create_linear_mapping_page_table(void)
>  	phys_addr_t start, end;
>  	u64 i;
>  
> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +	phys_addr_t ktext_start = __pa_symbol(_start);
> +	phys_addr_t ktext_size = __init_data_begin - _start;
> +	phys_addr_t krodata_start = __pa_symbol(__start_rodata);
> +	phys_addr_t krodata_size = _data - __start_rodata;
> +
> +	/* Isolate kernel text and rodata so they don't get mapped with a PUD */
> +	memblock_mark_nomap(ktext_start,  ktext_size);
> +	memblock_mark_nomap(krodata_start, krodata_size);
> +#endif
> +
>  	/* Map all memory banks in the linear mapping */
>  	for_each_mem_range(i, &start, &end) {
>  		if (start >= end)
> @@ -1118,6 +1155,15 @@ static void __init create_linear_mapping_page_table(void)
>  
>  		create_linear_mapping_range(start, end);
>  	}
> +
> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +	create_linear_mapping_range(ktext_start, ktext_start + ktext_size);
> +	create_linear_mapping_range(krodata_start,
> +				    krodata_start + krodata_size);

Just for my own education, it looks to me like the rodata is left writable
until the end of start_kernel(), when mark_rodata_ro() is called. Is that
correct?

Thanks,
drew

> +
> +	memblock_clear_nomap(ktext_start,  ktext_size);
> +	memblock_clear_nomap(krodata_start, krodata_size);
> +#endif
>  }
>  
>  static void __init setup_vm_final(void)
> diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
> index 9b18bda74154..18706f457da7 100644
> --- a/arch/riscv/mm/physaddr.c
> +++ b/arch/riscv/mm/physaddr.c
> @@ -33,3 +33,19 @@ phys_addr_t __phys_addr_symbol(unsigned long x)
>  	return __va_to_pa_nodebug(x);
>  }
>  EXPORT_SYMBOL(__phys_addr_symbol);
> +
> +phys_addr_t linear_mapping_va_to_pa(unsigned long x)
> +{
> +	BUG_ON(!kernel_map.va_pa_offset);
> +
> +	return ((unsigned long)(x) - kernel_map.va_pa_offset);
> +}
> +EXPORT_SYMBOL(linear_mapping_va_to_pa);
> +
> +void *linear_mapping_pa_to_va(unsigned long x)
> +{
> +	BUG_ON(!kernel_map.va_pa_offset);
> +
> +	return ((void *)((unsigned long)(x) + kernel_map.va_pa_offset));
> +}
> +EXPORT_SYMBOL(linear_mapping_pa_to_va);
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index d1a68b6d03b3..d14735a81301 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -887,12 +887,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
>  static void __early_init_dt_declare_initrd(unsigned long start,
>  					   unsigned long end)
>  {
> -	/* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
> -	 * enabled since __va() is called too early. ARM64 does make use
> -	 * of phys_initrd_start/phys_initrd_size so we can skip this
> -	 * conversion.
> +	/*
> +	 * __va() is not yet available this early on some platforms. In that
> +	 * case, the platform uses phys_initrd_start/phys_initrd_size instead
> +	 * and does the VA conversion itself.
>  	 */
> -	if (!IS_ENABLED(CONFIG_ARM64)) {
> +	if (!IS_ENABLED(CONFIG_ARM64) &&
> +	    !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
>  		initrd_start = (unsigned long)__va(start);
>  		initrd_end = (unsigned long)__va(end);
>  		initrd_below_start_ok = 1;
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
