Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A64CC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 09:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nQOtIkxP+Jj7vf9UvAboYWb210qaM1CaXoinWTE7RY=; b=PDEbnU7ZKTWPtW
	slTlX7WcjRJAE+8hM1D2nEb7D2h12770m5kxQiBKrBX6vbZ25JHKpCBlaeiBHc18OT58GGYgJ/w9p
	f9ccbsHIb5/7wJA4Xbqor48VCGNOXKkSlZe55rQvWderZ7DQeqKrwzIIAO9eQh0etyAIaQbnH+kcW
	jepIuBqRlI9P9wFPqSUhXCg21cwmKfjFI1dyALa1cp3Bv9j8KQ0UojIvNkXLUgha1+ZD8nYgKZxi3
	J85ahmOjr5bp7D0azbTiPUSdklmSycx1WFfP+MlJ7jnpTJsaiHvES+4q170WXXA1Ioxj2bJTY2VU/
	tCQp8wF/aKd/dqrDKB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTx3-001clb-SY; Fri, 24 Feb 2023 09:01:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTwz-001ckG-V6
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 09:01:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id c1so16262692plg.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 01:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SciX5aVZChspF9M3W2UcrfB8lkq1WSnSwFmbufo/K4=;
        b=ZI383dRDIbf8rnbyqXMKkKwicJwWHKyhiJTe3izBokdxTjMOJDe8gArmmeBig46IPg
         3FLKFHmnqBnsE4jhea/WELLQQEgoa0qt/7VZ3z6cAR3523nb5Ufrp4GDBDc3sZIBq4OV
         SJcq9Zzp/OHbKDSga7ZwuvO7o+nQpKRGs6sXSjJaSjNUzEK5C2WDSQBCsdyNHFGEPnZr
         b/MCBliE6jjByZpUysVs9U2QiOjEPKl3A1bd0h77AinQ/trZwVfaR09VksCJuntZTJVv
         3Dgi3R6jmo/qQolSZdCHvu+Jc3NeRof7W9q1v8wcm+nx+jnqHOVscx0H7JpE2LckPM4y
         2Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SciX5aVZChspF9M3W2UcrfB8lkq1WSnSwFmbufo/K4=;
        b=jU2c20UdwZAaQY7SsEdd49SrZpdlefjKNkF9NKGcMzcYpWT39ucDBqVER/WJrsuXM9
         5P0tPzHW3DwyrEj6Y6LNIarLarVZuLmf7GXqqBnzog8Vo0EIpXTZqUnTWvARhuic4+s5
         nLIi7cbgeIEbXoyjtHp9qKT3H6VCDl0vpGS6JWfKIbIOG8GhZlvC3asqy5UOYED9tsot
         OIe6ZeDNDcDcr40ZiOWydSSVAunbfEjff1tSvLPFLTwmm4oV296uO3aHOki0HQPpuh++
         +ya7QvM8f0YEuKTevr16LvwlsXAszVuOeKEIohUKjhR3Yk80kJJ94zlfbpyZgg6GmxNW
         qHdA==
X-Gm-Message-State: AO0yUKVQL6n9dZoLdHhbNeT2JtBCjteUmvPo514veArnMICeUub6vkqn
	PR5lnDnR182gs5zI5bMDvbN/JA==
X-Google-Smtp-Source: AK7set9TN0cuW8/3ER/OJmFGi76u0ihPyZMOpJVaB8g6dEcNmNinMZWMGq3IjbfFDv/DEQrUjT2bkQ==
X-Received: by 2002:a17:90b:3912:b0:233:b73c:18c9 with SMTP id ob18-20020a17090b391200b00233b73c18c9mr18005220pjb.40.1677229268265;
        Fri, 24 Feb 2023 01:01:08 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id mv11-20020a17090b198b00b002376d85844dsm1039904pjb.51.2023.02.24.01.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:01:07 -0800 (PST)
Date: Fri, 24 Feb 2023 14:30:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 04/21] RISC-V: Add support to build the ACPI core
Message-ID: <Y/h8ygElKNMzPVoy@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-5-sunilvl@ventanamicro.com>
 <20230220154415.u435t34q7btmwzwx@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220154415.u435t34q7btmwzwx@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_010110_030092_9B61D268 
X-CRM114-Status: GOOD (  38.70  )
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

On Mon, Feb 20, 2023 at 04:44:15PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:26PM +0530, Sunil V L wrote:
> > Enable ACPI core for RISC-V after adding architecture-specific
> > interfaces and header files required to build the ACPI core.
> > 
> > 1) Couple of header files are required unconditionally by the ACPI
> > core. Add empty acenv.h and cpu.h header files.
> > 
> > 2) If CONFIG_PCI is enabled, a few PCI related interfaces need to
> > be provided by the architecture. Define dummy interfaces for now
> > so that build succeeds. Actual implementation will be added when
> > PCI support is added for ACPI along with external interrupt
> > controller support.
> > 
> > 3) A few globals and memory mapping related functions specific
> > to the architecture need to be provided.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/Kconfig             |  5 +++
> >  arch/riscv/include/asm/acenv.h | 11 +++++
> >  arch/riscv/include/asm/acpi.h  | 60 +++++++++++++++++++++++++
> >  arch/riscv/include/asm/cpu.h   |  8 ++++
> >  arch/riscv/kernel/Makefile     |  2 +
> >  arch/riscv/kernel/acpi.c       | 80 ++++++++++++++++++++++++++++++++++
> >  6 files changed, 166 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/acenv.h
> >  create mode 100644 arch/riscv/include/asm/acpi.h
> >  create mode 100644 arch/riscv/include/asm/cpu.h
> >  create mode 100644 arch/riscv/kernel/acpi.c
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d153e1cd890b..3ba701b26389 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -12,6 +12,8 @@ config 32BIT
> >  
> >  config RISCV
> >  	def_bool y
> > +	select ACPI_GENERIC_GSI if ACPI
> 
> Is it better for this to come after patch 14, "irqchip/riscv-intc:
> Add ACPI support"?
> 
This is required to just to enable building the ACPI core for RISC-V.

> > +	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> >  	select ARCH_CLOCKSOURCE_INIT
> >  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> > @@ -598,6 +600,7 @@ config EFI_STUB
> >  config EFI
> >  	bool "UEFI runtime support"
> >  	depends on OF && !XIP_KERNEL
> > +	select ARCH_SUPPORTS_ACPI if 64BIT
> >  	select LIBFDT
> >  	select UCS2_STRING
> >  	select EFI_PARAMS_FROM_FDT
> > @@ -703,3 +706,5 @@ source "drivers/cpufreq/Kconfig"
> >  endmenu # "CPU Power Management"
> >  
> >  source "arch/riscv/kvm/Kconfig"
> > +
> > +source "drivers/acpi/Kconfig"
> > diff --git a/arch/riscv/include/asm/acenv.h b/arch/riscv/include/asm/acenv.h
> > new file mode 100644
> > index 000000000000..22123c5a4883
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/acenv.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * RISC-V specific ACPICA environments and implementation
> > + */
> > +
> > +#ifndef _ASM_ACENV_H
> > +#define _ASM_ACENV_H
> > +
> > +/* It is required unconditionally by ACPI core */
> > +
> > +#endif /* _ASM_ACENV_H */
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > new file mode 100644
> > index 000000000000..7f9dce3c39d0
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -0,0 +1,60 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + *  Copyright (C) 2013-2014, Linaro Ltd.
> > + *	Author: Al Stone <al.stone@linaro.org>
> > + *	Author: Graeme Gregory <graeme.gregory@linaro.org>
> > + *	Author: Hanjun Guo <hanjun.guo@linaro.org>
> > + *
> > + *  Copyright (C) 2021-2023, Ventana Micro Systems Inc.
> > + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> > + */
> > +
> > +#ifndef _ASM_ACPI_H
> > +#define _ASM_ACPI_H
> > +
> > +/* Basic configuration for ACPI */
> > +#ifdef CONFIG_ACPI
> > +
> > +/* ACPI table mapping after acpi_permanent_mmap is set */
> > +void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
> > +#define acpi_os_ioremap acpi_os_ioremap
> > +
> > +#define acpi_strict 1   /* No out-of-spec workarounds on RISC-V */
> > +extern int acpi_disabled;
> > +extern int acpi_noirq;
> > +extern int acpi_pci_disabled;
> 
> need blank line here
> 
Okay.

> > +static inline void disable_acpi(void)
> > +{
> > +	acpi_disabled = 1;
> > +	acpi_pci_disabled = 1;
> > +	acpi_noirq = 1;
> > +}
> > +
> > +static inline void enable_acpi(void)
> > +{
> > +	acpi_disabled = 0;
> > +	acpi_pci_disabled = 0;
> > +	acpi_noirq = 0;
> > +}
> > +
> > +/*
> > + * The ACPI processor driver for ACPI core code needs this macro
> > + * to find out this cpu was already mapped (mapping from CPU hardware
> > + * ID to CPU logical ID) or not.
> > + */
> > +#define cpu_physical_id(cpu) cpuid_to_hartid_map(cpu)
> > +
> > +/*
> > + * Since MADT must provide at least one RINTC structure, the
> > + * CPU will be always available in MADT on RISC-V.
> > + */
> > +static inline bool acpi_has_cpu_in_madt(void)
> > +{
> > +	return true;
> > +}
> > +
> > +static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > +
> > +#endif /* CONFIG_ACPI */
> > +
> > +#endif /*_ASM_ACPI_H*/
> > diff --git a/arch/riscv/include/asm/cpu.h b/arch/riscv/include/asm/cpu.h
> > new file mode 100644
> > index 000000000000..ea1a88b3d5f2
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/cpu.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef _ASM_CPU_H
> > +#define _ASM_CPU_H
> > +
> > +/* It is required unconditionally by ACPI core */
> > +
> > +#endif /* _ASM_CPU_H */
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index 67f542be1bea..f979dc8cf47d 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -90,3 +90,5 @@ obj-$(CONFIG_EFI)		+= efi.o
> >  obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
> >  obj-$(CONFIG_COMPAT)		+= compat_signal.o
> >  obj-$(CONFIG_COMPAT)		+= compat_vdso/
> > +
> > +obj-$(CONFIG_ACPI)              += acpi.o
> > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > new file mode 100644
> > index 000000000000..81d448c41714
> > --- /dev/null
> > +++ b/arch/riscv/kernel/acpi.c
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + *  RISC-V Specific Low-Level ACPI Boot Support
> > + *
> > + *  Copyright (C) 2013-2014, Linaro Ltd.
> > + *	Author: Al Stone <al.stone@linaro.org>
> > + *	Author: Graeme Gregory <graeme.gregory@linaro.org>
> > + *	Author: Hanjun Guo <hanjun.guo@linaro.org>
> > + *	Author: Tomasz Nowicki <tomasz.nowicki@linaro.org>
> > + *	Author: Naresh Bhat <naresh.bhat@linaro.org>
> > + *
> > + *  Copyright (C) 2021-2023, Ventana Micro Systems Inc.
> > + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/io.h>
> > +#include <linux/pci.h>
> > +
> > +int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
> > +int acpi_disabled = 1;
> > +EXPORT_SYMBOL(acpi_disabled);
> > +
> > +int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
> > +EXPORT_SYMBOL(acpi_pci_disabled);
> > +
> > +/*
> > + * __acpi_map_table() will be called before paging_init(), so early_ioremap()
> > + * or early_memremap() should be called here to for ACPI table mapping.
> > + */
> > +void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
> > +{
> > +	if (!size)
> > +		return NULL;
> > +
> > +	return early_memremap(phys, size);
> > +}
> > +
> > +void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
> > +{
> > +	if (!map || !size)
> > +		return;
> > +
> > +	early_memunmap(map, size);
> > +}
> > +
> > +void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> > +{
> > +	return memremap(phys, size, MEMREMAP_WB);
> > +}
> > +
> > +#ifdef CONFIG_PCI
> > +
> > +/*
> > + * These interfaces are defined just to enable building ACPI core.
> > + * TODO: Update it with actual implementation when external interrupt
> > + * controller support is added in RISC-V ACPI.
> > + */
> > +int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
> > +		 int reg, int len, u32 *val)
> > +{
> > +	return PCIBIOS_DEVICE_NOT_FOUND;
> > +}
> > +
> > +int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
> > +		  int reg, int len, u32 val)
> > +{
> > +	return PCIBIOS_DEVICE_NOT_FOUND;
> > +}
> > +
> > +int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
> > +{
> > +	return -1;
> > +}
> > +
> > +struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
> > +{
> > +	return NULL;
> > +}
> > +#endif	/* CONFIG_PCI */
> > -- 
> > 2.34.1
> >
> 
> Otherwise, afaict, this is pretty consistent with how arm64 started its
> ACPI support.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
