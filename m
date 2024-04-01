Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC88CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFmsH1R1i2uec4/Hg8c0nE5X3T/g2jAb9cWLPr7rFV8=; b=2tpRQTAZZA/D8I
	7toQOmzCAMIt1aI4drs/qnTbf6sBbh8r9S84UVkAqQ3RPunCN9gSKch8owek9d3xdn1fX3WG/YkxX
	NxfMxw0Z5KkM1nR3YI5YflR/GSIIf8t5uJyf0lUSpQ63fX5Jjp6IA0wrFlKsOXOUcim1wJEdnuBOx
	3Pi0YtE1Z1yAtFI2rA4NExomDNprDtz6NMEXmpEK+xSH97ihtBixg8vtSmhe2jrQuAOPN0EPCCSRh
	e6/zqFmoUho4VEwpdG+Zgi3gmrCH9slymvR9gOdFN2y3gjS3VOVP082Wz7h7726JYVlRHhY9ipSUf
	TcuWM0w1rnN0NzGXkflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBkz-000000076rf-1FtZ;
	Mon, 01 Apr 2024 07:07:01 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBkw-000000076qi-0Tuo
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 07:06:59 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-22a639aedb6so2232216fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 00:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711955214; x=1712560014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UumihHYH7mo9OAlxMLB8LxF+/pozb34SaM3CJxH+4Ts=;
        b=lB1yaN+M+9r5/rmQX3hurJvu+qS2tjZit6uI45hdplRn2A5gez3JdGqAefnSSUeqte
         t/3n8fzbUoaE7dAbewFEFh2416ZAg+E1j5TPhc9DPWpqDirrEfrYE/5wYQpDCJxoB0BJ
         iYzRrGZ6DrksOO8pHc6kCqx56PISCqLR8i4LoKGdLWN0EFsuSb9zG0xSP1dVxdepCQkG
         sAn0jp5ApnsjZcEizSLJPDV9/Volxsliy4eDII+JhpLZmsgY/fHeH0BRUP7tATz0PQ5X
         cdhycnznoIirgKz8sIUgyWmSkyQn5krCXYkU4k2RR3a/Wz8w66wsf5wp/CfxullKLIfm
         lppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711955214; x=1712560014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UumihHYH7mo9OAlxMLB8LxF+/pozb34SaM3CJxH+4Ts=;
        b=PwTHDJpkj34sU87UXyXd/e+uEyx25YQBUV17Z9fGIccU3eFVxf8iDO42fcN2lMDxpB
         hOqUntofEu+4qbBbZYyag16/bhOSTZZGNE3axf/mZAb/wQ8JG+OBRkdv7/BfqrHkLQ2k
         Fc4v6tD6BT+Up7DJUPcOnqHmKXoXv3BjBollBE7tW5anxoUSYM1/JIWGuN2Y+mjUqV9U
         UchtD5C6KrZ67uTl+BSldijfKV+dOJ9gCgwtZJkfOdp/XTe4+8P/DppVGghk22OaMEDe
         GNHTAs/LcQpO1mVZhITgeAxoJPYx9P7o2bvCxjw4bIyrOf4h6WsWenYW7Ak0fDc+GGd9
         V6dA==
X-Forwarded-Encrypted: i=1; AJvYcCWOKKVYzv8HxtggnlcNxx3h9edqqpsx3I3H62iy+ZwEKnkT8AHr2/Akywez5oHlwSJkWaWjMq2VsiCowtXvK+BVhQ5C6iU7J5f1DKea0Fkz
X-Gm-Message-State: AOJu0YyBUHtVFV84tpXcZCvCnbpotIuzJTWMF5ISynRdiu7ndU4v8qqU
	e/mZEgnbjqZn49fvU3D4UmjE4aI7KnwpTOZEMgupBFOfKndDEeEu6nsWh/Hvmis=
X-Google-Smtp-Source: AGHT+IHSDWAtr5aFF+LByg5TvNzW0Q9+xfzuPLmJERC2IMVAmj5v4N1C4MO153dDi9n0oHUqErzpUQ==
X-Received: by 2002:a05:6870:1596:b0:229:f73c:1db7 with SMTP id j22-20020a056870159600b00229f73c1db7mr10376802oab.31.1711955214261;
        Mon, 01 Apr 2024 00:06:54 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id pd6-20020a0568701f0600b0022275702b8asm2689242oab.44.2024.04.01.00.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 00:06:53 -0700 (PDT)
Date: Mon, 1 Apr 2024 12:36:38 +0530
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
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>, Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Marc Zyngier <maz@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/6] ACPI: RISCV: Add NUMA support based on SRAT and
 SLIT
Message-ID: <Zgpc/qW/as+gbb+I@sunil-laptop>
References: <cover.1709780590.git.haibo1.xu@intel.com>
 <7ca110c59cbb2fb358304a9ba4f9c7cbeb191345.1709780590.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ca110c59cbb2fb358304a9ba4f9c7cbeb191345.1709780590.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_000658_192705_D8771E0B 
X-CRM114-Status: GOOD (  36.30  )
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

On Thu, Mar 07, 2024 at 04:47:54PM +0800, Haibo Xu wrote:
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
> +				       const unsigned long end)
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
> +				 ACPI_SRAT_TYPE_RINTC_AFFINITY, acpi_parse_rintc_pxm, 0);
> +
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
> +		pr_err("SRAT: Invalid SRAT header length: %d\n", pa->header.length);
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
> +	}
>  
>  	riscv_init_cbo_blocksizes();
>  	riscv_fill_hwcap();
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index cfbe4b840d42..81a2aa77680c 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -100,7 +100,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
>  	if (hart == cpuid_to_hartid_map(0)) {
>  		BUG_ON(found_boot_cpu);
>  		found_boot_cpu = true;
> -		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
>  		return 0;
>  	}
>  
> @@ -110,7 +109,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
>  	}
>  
>  	cpuid_to_hartid_map(cpu_count) = hart;
> -	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
>  	cpu_count++;
>  
>  	return 0;
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index b7165e52b3c6..f74c62956e07 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -269,6 +269,12 @@ acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa) { }
>  
>  int acpi_numa_memory_affinity_init (struct acpi_srat_mem_affinity *ma);
>  
> +#ifdef CONFIG_RISCV
> +void acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa);
> +#else
> +static inline void acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa) { }
> +#endif
> +
>  #ifndef PHYS_CPUID_INVALID
>  typedef u32 phys_cpuid_t;
>  #define PHYS_CPUID_INVALID (phys_cpuid_t)(-1)
> -- 
This is a large patch spanning across multiple files. Can we split this
into multiple smaller patches? Changes look fine to me though.

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
