Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C2EC07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:53:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D46613B2
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D46613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCeb9/Zf7ZWwCcplsEoe1TmwauxThMGFTvbwb3FfSNs=; b=OB2VqJB/UR9tZe
	Ooa1RTd/+3zz8Ijzf/ZBZdgYaG1ypK7zhr12zWDEXlKyaxYFnPSNbcmRx/KlWWTFmnZxjkUCxWjKn
	v5D9TrtvzzwxTzOEYwB4kbCt0QchB3ct9VeJOvm83H3h5h7vD2SsoEjoOYrDAUeyMYzy6w5kDs0Sg
	uPN23m3l4gKX/00PsidlpaYqaaRefw406Bqq9s4+oUM1ipzz1d3KPvVEH8PBePWNZwgiIKE7KcEPL
	iY7ZiYj+JGSZDUUDundm327NUuy7j5hkXdW05jY0qzRbfYfX3mBW/KQhMffjsw9KInleWlRUj2G8K
	YNXq8cwgMI3DIH7q3yHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3gGS-00DuS1-1M; Wed, 14 Jul 2021 14:53:32 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3gGD-00DuQ5-8F; Wed, 14 Jul 2021 14:53:19 +0000
Received: by mail-io1-f41.google.com with SMTP id k11so2434694ioa.5;
 Wed, 14 Jul 2021 07:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BwxSFbLgKWQgLIZuiUqRuKMKvZuG6jXDVbbJMI4fKZQ=;
 b=n3Mic/trjlC8Z1N6KUsDCyFKEIdq5Cpehve5d9Yp/WSK8Z+F8BRwxgm/7CtYRov3ee
 5qeecLa3uOT4sECPLQL4Wrw5BbZpCQgTuE0ND3YCIQDCU+W1OxLSxOhw7un59VAuSXDY
 jOH5XVrCDOZxIRBZpeuMOlJD1BCdUgfh8tkF3cFB++SjWi/ytpaWuaQVPu/C4C7ugNyq
 IBXFH5Q7BeT0vQ3YhOphuDCZoKvdGA5Xsc8VaUjx8uagjQq+c8baNCWGAwbk9E5yazj7
 Scw+ljUY+eXaLeClOr0sRxXn3Y+kld0hyANNdQPIaX1mKpZewhy8opCJMGic6PpprQ7A
 PElQ==
X-Gm-Message-State: AOAM53033y+5e/OtHDLa2yvvTjSooSM226YbXhsbzGqwpSq3QkKthi/P
 oumAOuVAftFvGFwxXJb5wA==
X-Google-Smtp-Source: ABdhPJyH3lufhfX1XMNyJYC7/+LlYLvP6+EB8uzvbQksP2PDthAIkNWPm6H7BCQv4VXYffEHYLcH+Q==
X-Received: by 2002:a05:6602:1544:: with SMTP id
 h4mr7531945iow.76.1626274393946; 
 Wed, 14 Jul 2021 07:53:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q186sm1414370ioq.1.2021.07.14.07.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 07:53:13 -0700 (PDT)
Received: (nullmailer pid 2553523 invoked by uid 1000);
 Wed, 14 Jul 2021 14:53:08 -0000
Date: Wed, 14 Jul 2021 08:53:08 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/10] ARM: Parse kdump DT properties
Message-ID: <20210714145308.GC2441138@robh.at.kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <daaed4fcfe5ad62056cfb6f4ebea026f6b8a99f5.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <daaed4fcfe5ad62056cfb6f4ebea026f6b8a99f5.1626266516.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_075317_370376_B9F27478 
X-CRM114-Status: GOOD (  49.66  )
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

On Wed, Jul 14, 2021 at 02:50:20PM +0200, Geert Uytterhoeven wrote:
> Parse the following DT properties in the crash dump kernel, to provide a
> modern interface between kexec and the crash dump kernel:
>   - linux,elfcorehdr: ELF core header segment, similar to the
>     "elfcorehdr=" kernel parameter.
>   - linux,usable-memory-range: Usable memory reserved for the crash dump
>     kernel.
>     This makes the memory reservation explicit.  If present, Linux no
>     longer needs to mask the program counter, and rely on the "mem="
>     kernel parameter to obtain the start and size of usable memory.
> 
> For backwards compatibility, the traditional method to derive the start
> of memory is still used if "linux,usable-memory-range" is absent, and
> the "elfcorehdr=" and "mem=" kernel parameters are still parsed.
> 
> Loosely based on the ARM64 version by Akashi Takahiro.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add DT
> properties to crash dump kernel's DTB", which is still valid:
> https://lore.kernel.org/linux-arm-kernel/20200902154129.6358-1-geert+renesas@glider.be/
> 
> v4:
>   - Remove references to architectures in chosen.txt, to avoid having to
>     change this again when more architectures copy kdump support,
>   - Remove the architecture-specific code for parsing
>     "linux,usable-memory-range" and "linux,elfcorehdr", as the FDT core
>     code now takes care of this,
>   - Move chosen.txt change to patch changing the FDT core,
>   - Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of #ifdef,
> 
> v3:
>   - Rebase on top of accepted solution for DTB memory information
>     handling, which is part of v5.12-rc1,
> 
> v2:
>   - Rebase on top of reworked DTB memory information handling.
> ---
>  .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++++++++++---
>  arch/arm/mm/init.c                            | 30 ++++++++++++
>  2 files changed, 72 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/boot/compressed/fdt_check_mem_start.c
> index 62450d824c3ca180..9291a2661bdfe57f 100644
> --- a/arch/arm/boot/compressed/fdt_check_mem_start.c
> +++ b/arch/arm/boot/compressed/fdt_check_mem_start.c
> @@ -55,16 +55,17 @@ static uint64_t get_val(const fdt32_t *cells, uint32_t ncells)
>   * DTB, and, if out-of-range, replace it by the real start address.
>   * To preserve backwards compatibility (systems reserving a block of memory
>   * at the start of physical memory, kdump, ...), the traditional method is
> - * always used if it yields a valid address.
> + * used if it yields a valid address, unless the "linux,usable-memory-range"
> + * property is present.
>   *
>   * Return value: start address of physical memory to use
>   */
>  uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
>  {
> -	uint32_t addr_cells, size_cells, base;
> +	uint32_t addr_cells, size_cells, usable_base, base;
>  	uint32_t fdt_mem_start = 0xffffffff;
> -	const fdt32_t *reg, *endp;
> -	uint64_t size, end;
> +	const fdt32_t *usable, *reg, *endp;
> +	uint64_t size, usable_end, end;
>  	const char *type;
>  	int offset, len;
>  
> @@ -80,6 +81,27 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
>  	if (addr_cells > 2 || size_cells > 2)
>  		return mem_start;
>  
> +	/*
> +	 * Usable memory in case of a crash dump kernel
> +	 * This property describes a limitation: memory within this range is
> +	 * only valid when also described through another mechanism
> +	 */
> +	usable = get_prop(fdt, "/chosen", "linux,usable-memory-range",
> +			  (addr_cells + size_cells) * sizeof(fdt32_t));
> +	if (usable) {
> +		size = get_val(usable + addr_cells, size_cells);
> +		if (!size)
> +			return mem_start;
> +
> +		if (addr_cells > 1 && fdt32_ld(usable)) {
> +			/* Outside 32-bit address space */
> +			return mem_start;
> +		}
> +
> +		usable_base = fdt32_ld(usable + addr_cells - 1);
> +		usable_end = usable_base + size;
> +	}
> +
>  	/* Walk all memory nodes and regions */
>  	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
>  	     offset = fdt_next_node(fdt, offset, NULL)) {
> @@ -107,7 +129,20 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
>  
>  			base = fdt32_ld(reg + addr_cells - 1);
>  			end = base + size;
> -			if (mem_start >= base && mem_start < end) {
> +			if (usable) {
> +				/*
> +				 * Clip to usable range, which takes precedence
> +				 * over mem_start
> +				 */
> +				if (base < usable_base)
> +					base = usable_base;
> +
> +				if (end > usable_end)
> +					end = usable_end;
> +
> +				if (end <= base)
> +					continue;
> +			} else if (mem_start >= base && mem_start < end) {
>  				/* Calculated address is valid, use it */
>  				return mem_start;
>  			}
> @@ -123,7 +158,8 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
>  	}
>  
>  	/*
> -	 * The calculated address is not usable.
> +	 * The calculated address is not usable, or was overridden by the
> +	 * "linux,usable-memory-range" property.
>  	 * Use the lowest usable physical memory address from the DTB instead,
>  	 * and make sure this is a multiple of 2 MiB for phys/virt patching.
>  	 */
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 6162a070a4104a26..dfaee199554dda97 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -4,6 +4,7 @@
>   *
>   *  Copyright (C) 1995-2005 Russell King
>   */
> +#include <linux/crash_dump.h>
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
>  #include <linux/swap.h>
> @@ -221,8 +222,35 @@ void check_cpu_icache_size(int cpuid)
>  }
>  #endif
>  
> +/*
> + * reserve_elfcorehdr() - reserves memory for elf core header
> + *
> + * This function reserves the memory occupied by an elf core header
> + * described in the device tree. This region contains all the
> + * information about primary kernel's core image and is used by a dump
> + * capture kernel to access the system memory on primary kernel.
> + */
> +static void __init reserve_elfcorehdr(void)
> +{
> +	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || !elfcorehdr_size)
> +		return;
> +
> +	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
> +		pr_warn("elfcorehdr is overlapped\n");
> +		return;
> +	}
> +
> +	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);

Can't this be in common code?

> +
> +	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
> +		elfcorehdr_size >> 10, elfcorehdr_addr);
> +}
> +
>  void __init arm_memblock_init(const struct machine_desc *mdesc)
>  {
> +	/* Handle linux,usable-memory-range property */
> +	memblock_cap_memory_range(cap_mem_addr, cap_mem_size);
> +
>  	/* Register the kernel text, kernel data and initrd with memblock. */
>  	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
>  
> @@ -236,6 +264,8 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
>  
>  	early_init_fdt_scan_reserved_mem();
>  
> +	reserve_elfcorehdr();
> +
>  	/* reserve memory for DMA contiguous allocations */
>  	dma_contiguous_reserve(arm_dma_limit);
>  
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
