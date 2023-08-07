Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE55EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXEfuV+aEsSPnDJY9IfaZsv0xPbLCkUIAhfOXlOCt0M=; b=Xxs7isn3I2lSnc
	uasXQDvSbQUwipxmH0Fbnw6bsTl/HbRys1B39Tl2Z9kEnRQk3RRW6PdLkvZ1G9wC4ciTBgVGwOjvr
	yEDdGheo+x3snEyJYYOg/K71Yb3FDO0NwZXelAh3OzODHoW8cXk5O345MV+b+0lLybXHxn1kw22t5
	GY+XMyIY6xtkog4JV0o/JsciFoijNP2SU2GUsuD8yBLGDmpQKEyQJJr7r1ZOwxl/7Ren3dO/7IT6r
	39vs+0nRcPm26QN38UrlpJqgIzWm8cgNoyuKm2DIxZzwDbBqzGdYHPQb2lpjKspZdPhZuKaoAtq9C
	LjZEMSYN3ez8wkaCyhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvnm-00GTvs-1H;
	Mon, 07 Aug 2023 08:41:22 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvni-00GTtx-2X
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 08:41:20 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5233deb7cb9so457431a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691397677; x=1692002477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0eZZxF7uLAsYX/m67q6Fvc/Im25NatC6UCV3VKiuk20=;
        b=SOtKNq3tep9e4rbOEALFWIYYuWuTYwXx9gYJwZykSKNXY7xG5QmRvc7w9rvFbKnLC/
         R51Q64qs1ZO2UuY7kop5KJfapfNRxmjYA/Xm8u7dkaqYYh0pVL6z+yUzv++OnFUWs9O8
         kEXwXJASlHhfNVRiNypwaUAxqZeN9tiAmltG4fm734KSgXPCmyOSjniZzrAdqFjRuOce
         uH61wEY4n02TtZC3DKv5GXoXAVRRbTCVNprBkkazK3gdeYqTZ3XBJAp+BmyM9F7+qoQ8
         6HiRrmt+auMZQNH1/21rgV6b46Z7KIDPAeHmmnBQ3kd3hOTkPuXO3izLsesVyKuX/TJf
         pQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691397677; x=1692002477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eZZxF7uLAsYX/m67q6Fvc/Im25NatC6UCV3VKiuk20=;
        b=RbxjK7ykVUJ0aUWJVQ1NmnIIFmzQMT8rDhNu3WuwQL097DL/TPpJvwZgjkSJhjFCjG
         9qwTXvETINDnSxPmxzLHcMEYsXiTlvOjYoCSVtmAmpqyHRRB8vCmfGvy2zWCUjc3sxHz
         nqANZSDb6oBRHaLWEV5A16RGmQcwZli5RiaT+DeEoqKW//e5Jf3di9L+7aMkacMGcKoy
         pd2OkriC33BmbQeO86V8ViZOap0QdyjIeo0/6sUyTT2+EcmbNug9VBV/2CUEbJFNZrdC
         pXzu6LJ/UZ9LVRDz0M/ZF/I2RdKYXxjO9pXCSfTws3FkLUaTJN7v+nBfSrPOqI3ShQs5
         VPQw==
X-Gm-Message-State: AOJu0Yx45iRKtjjRPEHwQk5BxqAkoBDHVhX1MS253Fe9LhfR0aAyGs6C
	A6uRXgGOCTkv94JhIF0k4J7WxQ==
X-Google-Smtp-Source: AGHT+IFTUmMoVlFQ7J3hG7NjaV1KI5qAp1himGDYASyuQT814a4MvLXG3IwoM9SHGhAcRUnXpKqVow==
X-Received: by 2002:aa7:d284:0:b0:51e:53eb:88a3 with SMTP id w4-20020aa7d284000000b0051e53eb88a3mr6239145edq.25.1691397677007;
        Mon, 07 Aug 2023 01:41:17 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id b20-20020a056402139400b00522d53bff56sm4769693edv.65.2023.08.07.01.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 01:41:16 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:41:15 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Robert Moore <robert.moore@intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [RFC PATCH v1 04/21] RISC-V: ACPI: Enhance acpi_os_ioremap with
 MMIO remapping
Message-ID: <20230807-767cb417c44ed5f1437f7b0d@orel>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803175916.3174453-5-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_014118_825999_8918844B 
X-CRM114-Status: GOOD (  32.17  )
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

On Thu, Aug 03, 2023 at 11:28:59PM +0530, Sunil V L wrote:
> Enhance the acpi_os_ioremap() to support opregions in MMIO
> space. Also, have strict checks using EFI memory map
> to allow remapping the RAM similar to arm64.
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/Kconfig       |  1 +
>  arch/riscv/kernel/acpi.c | 86 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 318f62a0a187..e19f32c12a68 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -38,6 +38,7 @@ config RISCV
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_VDSO_DATA
> +	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_STACKWALK
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 56cb2c986c48..aa4433bca6d9 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -17,6 +17,7 @@
>  #include <linux/io.h>
>  #include <linux/pci.h>
>  #include <linux/efi.h>
> +#include <linux/memblock.h>
>  
>  int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
>  int acpi_disabled = 1;
> @@ -217,7 +218,90 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
>  
>  void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  {
> -	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
> +	efi_memory_desc_t *md, *region = NULL;
> +	pgprot_t prot;
> +
> +	if (WARN_ON_ONCE(!efi_enabled(EFI_MEMMAP)))
> +		return NULL;
> +
> +	for_each_efi_memory_desc(md) {
> +		u64 end = md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT);
> +
> +		if (phys < md->phys_addr || phys >= end)
> +			continue;
> +
> +		if (phys + size > end) {
> +			pr_warn(FW_BUG "requested region covers multiple EFI memory regions\n");
> +			return NULL;
> +		}
> +		region = md;
> +		break;
> +	}
> +
> +	/*
> +	 * It is fine for AML to remap regions that are not represented in the
> +	 * EFI memory map at all, as it only describes normal memory, and MMIO
> +	 * regions that require a virtual mapping to make them accessible to
> +	 * the EFI runtime services.
> +	 */
> +	prot = PAGE_KERNEL_IO;
> +	if (region) {
> +		switch (region->type) {
> +		case EFI_LOADER_CODE:
> +		case EFI_LOADER_DATA:
> +		case EFI_BOOT_SERVICES_CODE:
> +		case EFI_BOOT_SERVICES_DATA:
> +		case EFI_CONVENTIONAL_MEMORY:
> +		case EFI_PERSISTENT_MEMORY:
> +			if (memblock_is_map_memory(phys) ||
> +			    !memblock_is_region_memory(phys, size)) {
> +				pr_warn(FW_BUG "requested region covers kernel memory @ %p\n",
> +					&phys);
> +				return NULL;
> +			}
> +
> +			/*
> +			 * Mapping kernel memory is permitted if the region in
> +			 * question is covered by a single memblock with the
> +			 * NOMAP attribute set: this enables the use of ACPI
> +			 * table overrides passed via initramfs.
> +			 * This particular use case only requires read access.
> +			 */
> +			fallthrough;
> +
> +		case EFI_RUNTIME_SERVICES_CODE:
> +			/*
> +			 * This would be unusual, but not problematic per se,
> +			 * as long as we take care not to create a writable
> +			 * mapping for executable code.
> +			 */
> +			prot = PAGE_KERNEL_RO;
> +			break;
> +
> +		case EFI_ACPI_RECLAIM_MEMORY:
> +			/*
> +			 * ACPI reclaim memory is used to pass firmware tables
> +			 * and other data that is intended for consumption by
> +			 * the OS only, which may decide it wants to reclaim
> +			 * that memory and use it for something else. We never
> +			 * do that, but we usually add it to the linear map
> +			 * anyway, in which case we should use the existing
> +			 * mapping.
> +			 */
> +			if (memblock_is_map_memory(phys))
> +				return (void __iomem *)__va(phys);
> +			fallthrough;
> +
> +		default:
> +			if (region->attribute & EFI_MEMORY_WB)
> +				prot = PAGE_KERNEL;
> +			else if ((region->attribute & EFI_MEMORY_WC) ||
> +				 (region->attribute & EFI_MEMORY_WT))
> +				prot = pgprot_writecombine(PAGE_KERNEL);
> +		}
> +	}
> +
> +	return ioremap_prot(phys, size, pgprot_val(prot));
>  }
>  
>  #ifdef CONFIG_PCI
> -- 
> 2.39.2
>

Such a faithful port of arm64's function that it begs the question as to
whether or not we should refactor and share. Anyway, other than Andy's
comments, LGTM

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
