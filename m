Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F369C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KHJwyxvNtbVqKSr9cFm+HZPk5la8aQGynZyuKWXA5M=; b=CzhQksARQDeLmF
	G7YZI2zg/T9Uq6a86M0BOzpZON5IpOjiIO2beAASa0j2kpEK9+cgS06m5WcMkqn8X/ZCr9BIFkt/S
	IIkwiFtP3BQIXIAWlwJtk1PpX5hGGgqDJv18ZX9SR+tOTGhKla2oI0EEQEiSNVt5YVy8pg0H+LeFc
	X2739clxswVzSq+5s8oljZTf5VCpIxyzERInD1XGUVYJfYa1zUJzyPUpbTcXZPTosuys4KiD01TEo
	ITsmJzc0rZKROpVkzP7i5dux/Ihuoa0B8ISw+F8o3X6H99mJZLhX8FzapVipB+AJL2UREBMoMOq0q
	DLaIjdqfWIvSmFHNb+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9ej-0052Lk-U5; Mon, 20 Feb 2023 17:08:49 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9eg-0052LE-JO
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 17:08:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id h32so7505882eda.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 09:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIl3tZRjQudwGcAPjHCVTUjKcZHKk0uk+iVNDZ3xrIk=;
        b=gEaMH7e5pBRP9t31EL3LXw5WzCF3qikFsCxVhgrTQ1hq8KMmK8BQi+B1vq0Gdt6TPj
         QsI9OvmfxfIYinS6BmqbsvwVYCdEOm1K32TDFpY5IbFcHg0ABxbafcx/7a16stzydHMn
         oVNBrw786Atvq29/FVYTBZWRgPLBOhs3RnZxweXK8blQNKDKcF5VFAZ6qMl8M8XhQaLy
         6WZoiwaf+q5flcqVO7ottyVCThfo/EYKjJKOmZmbK2uex+60YRVwrz/vVsmAI7WrpqhO
         qhAk7jm+cbklp/uJ98LUY7Bvw15iiBPTAR2Zd9VXem2DHpIJgNq9BxchEg6YAL41YYgI
         Jxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIl3tZRjQudwGcAPjHCVTUjKcZHKk0uk+iVNDZ3xrIk=;
        b=RGzBserALoU7xNyPjWm0aGAzH1yLxNufiOoCp8VLmGgUnLBU21kwk2e0vC7BN744MZ
         LX2UNw0t7s4GqYIroduuooIDOOhokofm/DZtlxIDx4XdD43MlDz4CVzGwq4LFwR5knqs
         aR000AodrEo/X/Iyui0hduJyUqFUeZ2WEpyySHJg1yIAHbTyHB25de1Sz/Rnzg8vl+Sp
         /lSriPUxD1kfZqrW8vmi4dLFP40nZVO8elh2mWgbnkH/cW+NLUoAK/sitWaihdSADc07
         D7c+WFBhhVbKeiOH87XP1O7x+isx7dItqlx8/RNR4V09IWfeDAUI9/DuxjMVlKD+ZYde
         03Ww==
X-Gm-Message-State: AO0yUKX50T1wX5WUm1es+p2E72WJl8s+XBpkObWAsM6Gp4IOLRemr5NO
	s5IO+HCK9s1PqEQ6rRLz2y3g0A==
X-Google-Smtp-Source: AK7set+RR6G+X/nFYBCntzbSKel+s1z5JB0JKEsUDVyhG3rLlenMH2XA+o4bF+Lq87hNDUVBPK0fNA==
X-Received: by 2002:a17:907:9b09:b0:8aa:c035:a651 with SMTP id kn9-20020a1709079b0900b008aac035a651mr11661476ejc.37.1676912924944;
        Mon, 20 Feb 2023 09:08:44 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906539700b008b128106fc7sm6029367ejo.46.2023.02.20.09.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:08:44 -0800 (PST)
Date: Mon, 20 Feb 2023 18:08:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
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
Subject: Re: [PATCH V2 10/21] RISC-V: smpboot: Add ACPI support in smp_setup()
Message-ID: <20230220170843.2zkrqcnqcwbruea6@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-11-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-11-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_090846_685318_DD0FA21C 
X-CRM114-Status: GOOD (  36.59  )
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

On Thu, Feb 16, 2023 at 11:50:32PM +0530, Sunil V L wrote:
> Enable SMP boot on ACPI based platforms by using the RINTC
> structures in the MADT table.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/acpi.h |  7 ++++
>  arch/riscv/kernel/smpboot.c   | 70 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 7bc49f65c86b..3c3a8ac3b37a 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -60,6 +60,13 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  
>  int acpi_get_riscv_isa(struct acpi_table_header *table,
>  		       unsigned int cpu, const char **isa);
> +
> +#ifdef CONFIG_ACPI_NUMA
> +int acpi_numa_get_nid(unsigned int cpu);
> +#else
> +static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> +#endif /* CONFIG_ACPI_NUMA */

The #ifdef stuff seems premature since we're not providing an
implementation for acpi_numa_get_nid() or selecting ACPI_NUMA, but OK.

> +
>  #else
>  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
>  				     unsigned int cpu, const char **isa)
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 26214ddefaa4..77630f8ed12b 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/arch_topology.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -70,6 +71,70 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  }
>  
> +#ifdef CONFIG_ACPI
> +static unsigned int cpu_count = 1;
> +
> +static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const unsigned long end)
> +{
> +	unsigned long hart;
> +	bool found_boot_cpu = false;

I guess found_boot_cpu should be static?

> +	struct acpi_madt_rintc *processor = (struct acpi_madt_rintc *)header;
> +
> +	/*
> +	 * Each RINTC structure in MADT will have a flag. If ACPI_MADT_ENABLED
> +	 * bit in the flag is not enabled, it means OS should not try to enable
> +	 * the cpu to which RINTC belongs.
> +	 */
> +	if (!(processor->flags & ACPI_MADT_ENABLED))
> +		return 0;
> +
> +	hart = processor->hart_id;
> +	if (hart < 0)
> +		return 0;

A valid hart ID is anything up to INVALID_HARTID, right? Shouldn't we only
be checking for INVALID_HARTID here? And what does it mean to have an
invalid hart ID here? It's not an issue to error/warn about?

> +	if (hart == cpuid_to_hartid_map(0)) {
> +		BUG_ON(found_boot_cpu);

Do we really want to BUG due to bad, but potentially bootable ACPI tables?
I'd BUG for things that can only happen when we break the code, but broken
ACPI tables might be something we want to complain loudly about and then
attempt to limp along.

> +		found_boot_cpu = true;
> +		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
> +		return 0;
> +	}
> +
> +	if (cpu_count >= NR_CPUS) {
> +		pr_warn("Invalid cpuid [%d] for hartid [%lu]\n",
> +			cpu_count, hart);

cpuid isn't invalid, NR_CPUS is too small for the number of ACPI tables.

> +		return 0;
> +	}
> +
> +	cpuid_to_hartid_map(cpu_count) = hart;
> +	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
> +	cpu_count++;
> +
> +	return 0;
> +}
> +
> +static void __init acpi_parse_and_init_cpus(void)
> +{
> +	int cpuid;
> +
> +	cpu_set_ops(0);
> +
> +	/*
> +	 * do a walk of MADT to determine how many CPUs
> +	 * we have including disabled CPUs, and get information
> +	 * we need for SMP init.
> +	 */

I know this comment comes verbatim from arm64, but not only does it
have grammar issues, I'm not sure it's accurate. Where is the count
of disabled CPUs for arm64 or riscv?

> +	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_rintc, 0);
> +
> +	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
> +		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID) {
> +			cpu_set_ops(cpuid);
> +			set_cpu_possible(cpuid, true);
> +		}
> +	}
> +}
> +#else
> +#define acpi_parse_and_init_cpus(...)	do { } while (0)
> +#endif
> +
>  static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
> @@ -118,7 +183,10 @@ static void __init of_parse_and_init_cpus(void)
>  
>  void __init setup_smp(void)
>  {
> -	of_parse_and_init_cpus();
> +	if (acpi_disabled)
> +		of_parse_and_init_cpus();
> +	else
> +		acpi_parse_and_init_cpus();
>  }
>  
>  static int start_secondary_cpu(int cpu, struct task_struct *tidle)
> -- 
> 2.34.1
>

Do we not want to add an entry to acpi_table_print_madt_entry() for RINTC?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
