Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA09C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCgkwke+Z3AMrtYo5LqI+RWcHTWt60LfQj+a1VAQwSk=; b=s6WTWI7bvDEHKi
	/KRDdqRn9fa1vijAlBLxyeDBlttfGLhkt2pGAjiwBEI0bBgTz5z+eeC/LyFkdXPcA4kvW038vP4R8
	ExlOkIfyVd7UbPIzgZIm4ffKTWAgm6Ba3m6DkEOwbT0I8RrEuMJOevxv8FQymxEdQb6ZGYfw4dDM7
	I5gqOrd3I81IqUMfKPwwI1rWm+BthclM9p1tuaGLp3XatPsTXc01Yae94dPQTf9OzxDUO72JiIcL3
	TkWoOFuSDlges/h9odX7TqEdGQW0bsrdS09dza7zcYze5GYT4qcAA1ZBp/MS5NQDCGc1a1uRfRyKZ
	tn7KNFC3tXpJbTvskdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhNIF-0000000ByfD-1KMx;
	Tue, 05 Mar 2024 05:24:47 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhNIC-0000000Bydy-30oX
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 05:24:46 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c1e992f060so1203175b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 21:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709616282; x=1710221082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4WAStQQm9HoQSzWAlhV1BCbQlgwycMVOjUgyllAWRE0=;
        b=o4f1jyGlvpkYt6og6TjpNFlkqZFIfBHGM4seubSJA5WJnao15qSd7Phzhy9511AEKd
         9uXuMNF7nB1M6HA33HoHxo+4h30VKHW8hDOgnUI4+LHq5k9MigtJX+A99JTdNazsbbrO
         xxgwg8TN3pV8NpLssoq6XxnEn5kdEZjfKTpAp/MCZnf8yVuyUvztR3qq9y9Ym6m70AjC
         ZAHLi33vQSEkHLJ6iUhvtla2gTS0oqfxgGWQXRMV2aYN9I+aM7TvwkRxK0iIBOKG9IAn
         aKzS9GE2WK2LmIsHy6WTbI9lnGINApvnfTdZc2FzwauUZ+4wUrfsRo0tyov2pUQcwxWE
         LDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709616282; x=1710221082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WAStQQm9HoQSzWAlhV1BCbQlgwycMVOjUgyllAWRE0=;
        b=cM4Mupn56k38Jmf5J94gM7clh87OOmbcGfN2Qb6UxpsVSoo0ChIw3ZLDBnUAIgMd2T
         svnFL9txXbGO6POSUuCYetFLONEsrOnwd5xYic6yFqFaciDQ2uWxH8qi9Vhli4zEUnZr
         Owap6BG8btyrLIv8OmVPQLGU8o+UXEmAa2novL9kWRXZ0AOC6mB1qB9xhwtqoK6jDCuD
         sgWfiTHikSU/mvBLpQbymbdMQdzhaZiRSY72H83voceGg3dCaZZCc7eP0ZzIaG2NiSsu
         /AZ4ZHj+1N4ULWgLHCgZ60zYTDBihT6FsLZKgv5LTEG0yy3XUVBEnFKsjzA7xf0s0Up3
         85Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXmEiv8T4uTbEY2lsHxI/cHR+Z/sfMcBkR/Jv+A+TwKXowqvz/fsyMJNAssGmgs/B7tcCiLplNf2Tmrh0Z7904133M5Nx1+RRPRm9NNSBBz
X-Gm-Message-State: AOJu0Yxb7RILbpNBnTqS7LYaYtPGvj7tP7ap80GpAi9HiJiHpAGbqLyR
	e/lv46rs/evmHAAanCx03ec0semZ5zaSNmzaWO+LCeVw1IavvmTMNHqMLgRtZzo=
X-Google-Smtp-Source: AGHT+IEI61cbq0NNOa2JijdLjx7qXhrMTKWE8SuR7TUZvXjIoUeb6+dKufDr0lbNPVpaTmIw3sYSmQ==
X-Received: by 2002:a05:6808:351:b0:3c1:f63a:a80d with SMTP id j17-20020a056808035100b003c1f63aa80dmr811961oie.27.1709616282105;
        Mon, 04 Mar 2024 21:24:42 -0800 (PST)
Received: from sunil-laptop ([106.51.184.12])
        by smtp.gmail.com with ESMTPSA id b123-20020a62cf81000000b006e594b068c8sm8387738pfg.116.2024.03.04.21.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 21:24:41 -0800 (PST)
Date: Tue, 5 Mar 2024 10:54:29 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>, Baoquan He <bhe@redhat.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	James Morse <james.morse@arm.com>, Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 3/4] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
Message-ID: <ZeasjVWuyeiAlF8y@sunil-laptop>
References: <cover.1706603678.git.haibo1.xu@intel.com>
 <799dcc07f41c2357328e9778fbbded7818af34a7.1706603678.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <799dcc07f41c2357328e9778fbbded7818af34a7.1706603678.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_212444_800511_63C02807 
X-CRM114-Status: GOOD (  40.77  )
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

On Wed, Jan 31, 2024 at 10:32:00AM +0800, Haibo Xu wrote:
> Add acpi_numa.c file to enable parse NUMA information from
> ACPI SRAT and SLIT tables. SRAT table provide CPUs(Hart) and
> memory nodes to proximity domain mapping, while SLIT table
> provide the distance metrics between proximity domains.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h |  15 +++-
>  arch/riscv/kernel/Makefile    |   1 +
>  arch/riscv/kernel/acpi.c      |   5 --
>  arch/riscv/kernel/acpi_numa.c | 133 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c     |   4 +-
>  arch/riscv/kernel/smpboot.c   |   2 -
>  drivers/acpi/numa/srat.c      |   3 +-
>  include/linux/acpi.h          |   4 +
>  8 files changed, 156 insertions(+), 11 deletions(-)
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
> index f71910718053..5d3e9cf89b76 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -105,3 +105,4 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
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
> index 000000000000..493642a61457
> --- /dev/null
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -0,0 +1,133 @@
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
> +
> +int __init acpi_numa_get_nid(unsigned int cpu)
> +{
> +	return acpi_early_node_map[cpu];
> +}
> +
> +static inline int get_cpu_for_acpi_id(u32 uid)
> +{
> +	int cpu;
> +
> +	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> +		if (uid == get_acpi_id_for_cpu(cpu))
> +			return cpu;
> +
> +	return -EINVAL;
> +}
> +
> +static int __init acpi_parse_rintc_pxm(union acpi_subtable_headers *header,
> +				      const unsigned long end)

Please check alignment.

> +{
> +	struct acpi_srat_rintc_affinity *pa;
> +	int cpu, pxm, node;
> +
> +	if (srat_disabled())
> +		return -EINVAL;
> +
> +	pa = (struct acpi_srat_rintc_affinity *)header;
> +	if (!pa)
> +		return -EINVAL;
> +
> +	if (!(pa->flags & ACPI_SRAT_RINTC_ENABLED))
> +		return 0;
> +
> +	pxm = pa->proximity_domain;
> +	node = pxm_to_node(pxm);
> +
> +	/*
> +	 * If we can't map the UID to a logical cpu this
> +	 * means that the UID is not part of possible cpus
> +	 * so we do not need a NUMA mapping for it, skip
> +	 * the SRAT entry and keep parsing.
> +	 */
> +	cpu = get_cpu_for_acpi_id(pa->acpi_processor_uid);
> +	if (cpu < 0)
> +		return 0;
> +
> +	acpi_early_node_map[cpu] = node;
> +	pr_info("SRAT: PXM %d -> HARTID 0x%lx -> Node %d\n", pxm,
> +		cpuid_to_hartid_map(cpu), node);
> +
> +	return 0;
> +}
> +
> +void __init acpi_map_cpus_to_nodes(void)
> +{
> +	int i;
> +
> +	/*
> +	 * In ACPI, SMP and CPU NUMA information is provided in separate
> +	 * static tables, namely the MADT and the SRAT.
> +	 *
> +	 * Thus, it is simpler to first create the cpu logical map through
> +	 * an MADT walk and then map the logical cpus to their node ids
> +	 * as separate steps.
> +	 */
> +	acpi_table_parse_entries(ACPI_SIG_SRAT, sizeof(struct acpi_table_srat),
> +					    ACPI_SRAT_TYPE_RINTC_AFFINITY,
> +					    acpi_parse_rintc_pxm, 0);
> +
Alignment here as well.

> +	for (i = 0; i < nr_cpu_ids; i++)
> +		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
> +}
> +
> +/* Callback for Proximity Domain -> logical node ID mapping */
> +void __init acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa)
> +{
> +	int pxm, node;
> +
> +	if (srat_disabled())
> +		return;
> +
> +	if (pa->header.length < sizeof(struct acpi_srat_rintc_affinity)) {
> +		pr_err("SRAT: Invalid SRAT header length: %d\n",
> +			pa->header.length);
Can we merge these into single line?

> +		bad_srat();
> +		return;
> +	}
> +
> +	if (!(pa->flags & ACPI_SRAT_RINTC_ENABLED))
> +		return;
> +
> +	pxm = pa->proximity_domain;
> +	node = acpi_map_pxm_to_node(pxm);
> +
> +	if (node == NUMA_NO_NODE) {
> +		pr_err("SRAT: Too many proximity domains %d\n", pxm);
> +		bad_srat();
> +		return;
> +	}
> +
> +	node_set(node, numa_nodes_parsed);
> +}
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 4f73c0ae44b2..a2cde65b69e9 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -281,8 +281,10 @@ void __init setup_arch(char **cmdline_p)
>  	setup_smp();
>  #endif
>  
> -	if (!acpi_disabled)
> +	if (!acpi_disabled) {
>  		acpi_init_rintc_map();
> +		acpi_map_cpus_to_nodes();
Is it not possible to fill up both in single parsing of MADT?

> +	}
>  
>  	riscv_init_cbo_blocksizes();
>  	riscv_fill_hwcap();
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 519b6bd946e5..b188d83d1ec4 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -101,7 +101,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
>  	if (hart == cpuid_to_hartid_map(0)) {
>  		BUG_ON(found_boot_cpu);
>  		found_boot_cpu = true;
> -		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
>  		return 0;
>  	}
>  
> @@ -111,7 +110,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
>  	}
>  
>  	cpuid_to_hartid_map(cpu_count) = hart;
> -	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
>  	cpu_count++;
>  
>  	return 0;
> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> index 503abcf6125d..1f0462cef47c 100644
> --- a/drivers/acpi/numa/srat.c
> +++ b/drivers/acpi/numa/srat.c
> @@ -219,7 +219,8 @@ int __init srat_disabled(void)
>  	return acpi_numa < 0;
>  }
>  
> -#if defined(CONFIG_X86) || defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH)
> +#if defined(CONFIG_X86) || defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH) || \
> +	defined(CONFIG_RISCV)
Please check alignment. Or make it single line if fits in 100 chars.
Also, it looks it covers most of the architectures now. Is it possible
to simplify / remove the condition? I hope IA64 is removed now?

May be you need to update the comment at #endif too.

Thanks
Sunil

>  /*
>   * Callback for SLIT parsing.  pxm_to_node() returns NUMA_NO_NODE for
>   * I/O localities since SRAT does not list them.  I/O localities are
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index a65273db55c6..be78a9d28927 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -269,8 +269,12 @@ acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa) { }
>  
>  int acpi_numa_memory_affinity_init (struct acpi_srat_mem_affinity *ma);
>  
> +#ifdef CONFIG_RISCV
> +void acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa);
> +#else
>  static inline void
>  acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa) { }
> +#endif
>  
>  #ifndef PHYS_CPUID_INVALID
>  typedef u32 phys_cpuid_t;
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
