Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059FBC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me+5IX+Q9nOkdRpmPa900ZGsrr+RTo5ZGrYi4Z7uCuQ=; b=4lndNZ9MWnf93b
	GT6RUNHGEzbVhNMi0dR5qsD+yWHx+6aw8vg1h7QyqHz0XocZ1529ULavhersr7iph8snsKFp6f5Zc
	CCFSCMEzo0nwDTkWv8Yhw39aEde3wIYrFqUn/rx1pR6PgdPkS+QGHDIUteedborXb0CZ0s2uyIeyn
	xVXeeWQLaEjwXRA1JM7EM6Vn/OQeZLCBF4q/dbZX7r3c3uVGXdl8zXPW97he1mxwancTY5uGDHX0m
	OSM1IWEalbZy7AvjJXxSiutVIJQmimyTzs2Om8h5IrxKU5lRmnrA06pnG9mNqBSeOvLVjc7sg/v4b
	VCBhvr7DUuvOEXVf5Naw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY7ex-006kEz-9z; Fri, 03 Mar 2023 15:49:27 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY7eu-006kDS-IT
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 15:49:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id s11so11998383edy.8
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 07:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+5JbfjZ8Aa/Wy9sFT0uYrAvKsrB7pVmzzINwbowStU=;
        b=BdAa7enZ9MgSZLdVOPUP7KtdM25yTv5Gt4+UmTEGXb7tjay5ZxpdRRJ5ETYRoBsFni
         sYRzYsTu7lRj8u1pbH/PIRnyjrBqHsOm4hnYswNP0thheg/2KeuBGaM1mFOaA3VuEA7s
         /hHlOlrHosFopTpSNTUPWO9kpAsHtEjlUEVgG6aGnoT280yjnwWVjQx5RKnoBSt+Tc51
         jckjfynl8Uk+9ziSywgoXzTKVfuZPeuTcvBJNcuroVDn8E89+pxP46ZuJje4tWSaJ7IT
         7uG7+keqhI47E+fSZiRZxmqIDOfrPvU2GdGqwgoF4bGDFTB6JP1zWKoQTClbRT/c/TE5
         BQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+5JbfjZ8Aa/Wy9sFT0uYrAvKsrB7pVmzzINwbowStU=;
        b=6oDc+Lk/hA4WwxWVtMNjtPOGunGbSSlzHqxNNLQ4wYIQcByVP7P0letNLOSTgZNxzT
         IeEsEzZogZoVtK3VPJJ6hT22n1/e54Epp0scEnWT5c8yDaJm4M4VZAGTJj53iI21/E2h
         HJ2Jz3xLNM2K1O3KfjGLrXnvZKix4mKN7Lzncq8CsxRo0crx3+g/0GmH7K+OcXnxhH1H
         MqWTRr8n+0mkDjdLyhew0lQ4Gn+5XYEq/2Vs5NHamhXIl3XQS3DMk/BOCq7WHejljlnW
         1L/MQTlfpod61Fo7NhLNPs/GbkAp4kqBe0DwloBBilMA4DWj8TR9XEPIFzjTv6biVhOZ
         jGkw==
X-Gm-Message-State: AO0yUKWv9wgGBNF9grCt1yHfeH90MERG2JTrEiGK4zPupGbi9yUdpHv9
	cNfXlMlS1Ypgc9FNLM2yzoAIVA==
X-Google-Smtp-Source: AK7set+zOpC3DQ8WQaz+jDiXR0tvMLVKI1MlDuFlw/L+S82YrzsxNoEXEDmTRZn0PNz1SmwhvAcsNg==
X-Received: by 2002:a17:907:d109:b0:878:78f9:d1be with SMTP id uy9-20020a170907d10900b0087878f9d1bemr1957250ejc.23.1677858562207;
        Fri, 03 Mar 2023 07:49:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906164d00b008deba75e89csm1080779ejd.66.2023.03.03.07.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 07:49:21 -0800 (PST)
Date: Fri, 3 Mar 2023 16:49:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 10/20] RISC-V: smpboot: Add ACPI support in smp_setup()
Message-ID: <20230303154920.dq65hkcivpv7zyev@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-11-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303133647.845095-11-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_074924_657903_DAD0ACC5 
X-CRM114-Status: GOOD (  28.70  )
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

On Fri, Mar 03, 2023 at 07:06:37PM +0530, Sunil V L wrote:
> Enable SMP boot on ACPI based platforms by using the RINTC
> structures in the MADT table.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/smpboot.c | 72 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 26214ddefaa4..27047322d3bb 100644
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
> @@ -70,6 +71,72 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  }
>  
> +#ifdef CONFIG_ACPI
> +static unsigned int cpu_count = 1;
> +
> +static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const unsigned long end)
> +{
> +	unsigned long hart;
> +	static bool found_boot_cpu;
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
> +	if (BAD_MADT_ENTRY(processor, end))
> +		return -EINVAL;
> +
> +	acpi_table_print_madt_entry(&header->common);
> +
> +	hart = processor->hart_id;
> +	if (hart == INVALID_HARTID) {
> +		pr_warn("Invalid hartid\n");
> +		return 0;
> +	}
> +
> +	if (hart == cpuid_to_hartid_map(0)) {
> +		BUG_ON(found_boot_cpu);
> +		found_boot_cpu = true;
> +		early_map_cpu_to_node(0, NUMA_NO_NODE);

We should have kept

 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }

and only dropped the

 #ifdef CONFIG_ACPI_NUMA
 int acpi_numa_get_nid(unsigned int cpu);
 #else
 ...
 #endif

> +		return 0;
> +	}
> +
> +	if (cpu_count >= NR_CPUS) {
> +		pr_warn("NR_CPUS is too small for the number of ACPI tables.\n");
> +		return 0;
> +	}
> +
> +	cpuid_to_hartid_map(cpu_count) = hart;
> +	early_map_cpu_to_node(cpu_count, NUMA_NO_NODE);
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
> @@ -118,7 +185,10 @@ static void __init of_parse_and_init_cpus(void)
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

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
