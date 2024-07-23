Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10A7C3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZY28AQccllIDQUyTii0O/DQNietmf6CcLO8hzXgd9pk=; b=GzkHHEeASUxLc7
	tZjo1MWUSjxIenG4FYFgw8rKmqGeHN20Q8yD0vWjPD/c45EjoEEcXbVhRQ/EHPCPAUkvt8sUDX4YV
	uTpLtdU63CGDJJwd/TKTIfE8Uli9Ca45UdNL9CuUHi579XPmGChc4k0CjhP5YdM2szY3tcrd/dQp/
	FKX5Dt2IH0YSYJp7hGTf75tmj3C0okgcv1sH4Hz8DX5suPfYNgSA3EqT63gaoJCXkRwwQP05uFOI4
	t4jHHerx85hcBjb9Ke4XwIKfdYZHYnVWDns2rQpwVDBCndBZhVaFMkMr1cP3blWmHFSmOmVnc7Nnk
	e+o3ZJvSCiqb4Dmr2flQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFas-0000000CX8Z-1Z0W;
	Tue, 23 Jul 2024 13:30:18 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFac-0000000CX4I-3avL
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 13:30:05 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-816b627a7b6so192695239f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jul 2024 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721741400; x=1722346200; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLXpOJ5NKoFQFTZD98u7pTCjufqwrqSU5zSslcWK47s=;
        b=T/3bo6xx4gEsONUJnypilOaPp1Eo7WlVcifW/4fFkqO9HKNwe/pEqRkziGxe30zc2Q
         h0vgB/VbkYADp70FKFqpVfv4rCeLElaknvCw9sQzsgTDgM4OEEav0ludJ5Ojdg1o28yM
         31jUreujnJnMBapMPzHxmO9qzxy45GbijedrA7C93XJs6SJc4HpV9YAkIhdwip0hPVV7
         qxDECIIF1CrzAY4fFvDxCoA4m5fq3SqUKGre7xoXBTeKXudv8fmR0kvSyNqDRaWFdBsg
         R+6IvArT+Q7fpFkMPpMroeOBKjG8Z2hox+lJrR5dN0Nn9INO7BtRcMRhrOTjiSM+GECI
         I0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741400; x=1722346200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLXpOJ5NKoFQFTZD98u7pTCjufqwrqSU5zSslcWK47s=;
        b=mCOHpwf6YT+AnVL4uUbvJtfPekst1DtN/BCRazklpBpmFUHMJ0USTaKbBIa3lYlrgH
         GnbykhHF2ULO8OXIWkW0vRrPBT+Vb7HtYgwKuh8npQVJKjCKDavlvJgyRSsCm446UNyW
         j4fwTovvVZVAqmnS3USdCWln7F/Cr8nnNKeeSpn7bLFACTo3d4pnxtm55R5IT3OJtXIF
         bwYBaY8+tRt+hLCwUYq/aunDUrb/n42OMehqxX3UVj3LDM4SDm5DXaNe6htEVZldmSvl
         3qUiQ+mkzBrtqW8KKD9ialObkNgUtUO7nEjoIguLsiRKYKXoKdrO8/BR+NkPHjahxdpq
         c1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUqupY3UBfHJ2jlF7b/dUXYF3ePTh6NfvU2kjJUMNCNnGrhEP/oEERjRHzHMdGOzp/61sojBW0xR+Z7eokVqBYs+9Ej/Ls9PQ2sFbR5f2PP
X-Gm-Message-State: AOJu0Yy9N1Xe9IngNbr+3DM4wbyX9ooequEWk+bwco7GAph4XZut+/kD
	/m7Ezi3kBqqpHh8HjFaC6J9c8vLtn558c6fy/TY+YmA9/35AI3VhYduNsnMgPM0=
X-Google-Smtp-Source: AGHT+IF80eTqdhOJ79Y+uIGpgNKKtwlWUq1s4pL4fYqejLfcrt2vZMzY19zIDC9qjGAE1kLmyRI9aw==
X-Received: by 2002:a05:6602:2dd3:b0:804:9060:c0b8 with SMTP id ca18e2360f4ac-81b362aade3mr1199303039f.15.1721741400383;
        Tue, 23 Jul 2024 06:30:00 -0700 (PDT)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81bed28605esm197619739f.47.2024.07.23.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:30:00 -0700 (PDT)
Date: Tue, 23 Jul 2024 08:29:57 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v4 1/4] ACPI: RISCV: Add NUMA support based on SRAT and
 SLIT
Message-ID: <20240723-23811cc47f7863d12b6a78e8@orel>
References: <cover.1718268003.git.haibo1.xu@intel.com>
 <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_063003_141253_C0DA62BF 
X-CRM114-Status: GOOD (  26.71  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, Robert Richter <rrichter@amd.com>, Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 13, 2024 at 04:54:33PM GMT, Haibo Xu wrote:
> Add acpi_numa.c file to enable parse NUMA information from
> ACPI SRAT and SLIT tables. SRAT table provide CPUs(Hart) and
> memory nodes to proximity domain mapping, while SLIT table
> provide the distance metrics between proximity domains.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/acpi.h |  15 +++-
>  arch/riscv/kernel/Makefile    |   1 +
>  arch/riscv/kernel/acpi.c      |   5 --
>  arch/riscv/kernel/acpi_numa.c | 131 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c     |   4 +-
>  arch/riscv/kernel/smpboot.c   |   2 -
>  include/linux/acpi.h          |   6 ++
>  7 files changed, 154 insertions(+), 10 deletions(-)
>  create mode 100644 arch/riscv/kernel/acpi_numa.c
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 7dad0cf9d701..e0a1f84404f3 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -61,11 +61,14 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  
>  void acpi_init_rintc_map(void);
>  struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> -u32 get_acpi_id_for_cpu(int cpu);
> +static inline u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	return acpi_cpu_get_madt_rintc(cpu)->uid;
> +}
> +
>  int acpi_get_riscv_isa(struct acpi_table_header *table,
>  		       unsigned int cpu, const char **isa);
>  
> -static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
>  void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
>  			     u32 *cboz_size, u32 *cbop_size);
>  #else
> @@ -87,4 +90,12 @@ static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
>  
>  #endif /* CONFIG_ACPI */
>  
> +#ifdef CONFIG_ACPI_NUMA
> +int acpi_numa_get_nid(unsigned int cpu);
> +void acpi_map_cpus_to_nodes(void);
> +#else
> +static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> +static inline void acpi_map_cpus_to_nodes(void) { }
> +#endif /* CONFIG_ACPI_NUMA */
> +
>  #endif /*_ASM_ACPI_H*/
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 5b243d46f4b1..1e2afec141b5 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -110,3 +110,4 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
>  
>  obj-$(CONFIG_64BIT)		+= pi/
>  obj-$(CONFIG_ACPI)		+= acpi.o
> +obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index e619edc8b0cc..040bdbfea2b4 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -191,11 +191,6 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
>  	return &cpu_madt_rintc[cpu];
>  }
>  
> -u32 get_acpi_id_for_cpu(int cpu)
> -{
> -	return acpi_cpu_get_madt_rintc(cpu)->uid;
> -}
> -
>  /*
>   * __acpi_map_table() will be called before paging_init(), so early_ioremap()
>   * or early_memremap() should be called here to for ACPI table mapping.
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> new file mode 100644
> index 000000000000..0231482d6946
> --- /dev/null
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ACPI 6.6 based NUMA setup for RISCV
> + * Lots of code was borrowed from arch/arm64/kernel/acpi_numa.c
> + *
> + * Copyright 2004 Andi Kleen, SuSE Labs.
> + * Copyright (C) 2013-2016, Linaro Ltd.
> + *		Author: Hanjun Guo <hanjun.guo@linaro.org>
> + * Copyright (C) 2024 Intel Corporation.
> + *
> + * Reads the ACPI SRAT table to figure out what memory belongs to which CPUs.
> + *
> + * Called from acpi_numa_init while reading the SRAT and SLIT tables.
> + * Assumes all memory regions belonging to a single proximity domain
> + * are in one chunk. Holes between them will be included in the node.
> + */
> +
> +#define pr_fmt(fmt) "ACPI: NUMA: " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitmap.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/memblock.h>
> +#include <linux/mmzone.h>
> +#include <linux/module.h>
> +#include <linux/topology.h>
> +
> +#include <asm/numa.h>
> +
> +static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };

This only sets acpi_early_node_map[0] to NUMA_NO_NODE. Assuming we want
to ensure all of them are initialized to NUMA_NO_NODE, then we need

static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
