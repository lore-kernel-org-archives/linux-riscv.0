Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8605C7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMTirNaji63lr38V8ASjqQIO2Z39vJmzM+CNi94DNTU=; b=Y8O5g4Afjx1Bnq
	EVO0RP/XKG+hVGHuYzxT/4iu10iybkCbhzklKCq5swwI/t/fxdTgv7IZ1aK46eSXcwGI1zGlXovSx
	q/1FiCICaSIUgKeyu6/UPLSSjTuxkd7+/UTj0S9FdZTstFAVYAzVRsdlC6+lYBY9gYBQl0Yzco4ps
	0pLVGgAH4Qla4q6uNWvNTh+cMlQDyujwUL6bhOh3hP9pxs4T2Xqk3rdo/wwNDnnzzw+nvlK+1Y80R
	KJgPvig6DT4y8cb20HoMBSAb9onTUJpWzaPfTo2ZWeM/Icsv3jwrmVujfOyrF6khHxxxzaCmiMBPP
	UUy1UGS3Los225CuHkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4tW-004q0N-1P;
	Wed, 05 Apr 2023 15:17:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4tU-004pzi-09
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 15:17:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so23628324wmq.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680707870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWW2wHNkorlWl7f1lW5XfddvHk1ze5o7vXdVcEMXG2g=;
        b=fvLLT0TKm80nLpradZWDrOdneNGgfIOpZX+TQzvpBIusENmya0I/V5nt+WjUABWW2l
         mbre3ur0k5ApQtARUVrDy3VbtXfvBG2b7NMfG6XJ8EPQRdy0yGlt/iHDjYNYaPJKAxwS
         nrObDnZzuvvkNUHI8TqpDe3ysxRKjhCor5+ZP/jbtWgiQYJffTIsupTet7RzDwP4cgwG
         1yF2Dnn1g8d3PHLErOvpIrgNydSF7neE+RkSkyTxU8r3sEyXnNZD0c4MSO0JFlMsPFFq
         3TWf4LI5HL942nnh7CC19GskHTaB8TpfkIBM2/amfHSQmVa7FEiXeAqQ30llEJ4N00Ph
         +z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680707870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWW2wHNkorlWl7f1lW5XfddvHk1ze5o7vXdVcEMXG2g=;
        b=yDFn1pCTDvc+3qRsG9zDMC4w2Gkreevq9srvQm5OcB2AsFRuvmpsQtz8gtKdSsysHz
         8zq5nBAVxQEeBNzgutiwo9MwIxXJCYqOI4avDg5ZKuqbpU+eY1w44tBbu9nv7FsIeSpo
         nPxCfadK1fhbx97KYkkpnAQOrgCdB8ovXIlWxnGSZQ3uQZ/deYY5GqGu61EHjSvn0CRi
         N1FfKqfQ7SkDrlrQPxFRA3qdyhwflnZ1ZTlqFGKKirwEyDr+KD7bd+oFfiMo5R824k78
         WpvICeYCKE8kY0YTa65y/rdS2eyTI2h9EXz9B8AvLWfQ9ydyMKkbBhzfPon9qojuabNg
         hPyg==
X-Gm-Message-State: AAQBX9fgsoZjE0DzdAsRzcKJZH/c0TN4+UF8AX4gHjBa6DHlE+hYonZi
	KGa7NEuNFB+xaw8qIiM5Jtc7gg==
X-Google-Smtp-Source: AKy350YQ1cUUvA1lbwvmYdodZoWCEOfWJdxBblHqZiOrZN3zwRgs3uGIhPappIdTQFzIU/BI6H3nRA==
X-Received: by 2002:a05:600c:b42:b0:3ed:66e0:b6de with SMTP id k2-20020a05600c0b4200b003ed66e0b6demr5272095wmr.22.1680707869916;
        Wed, 05 Apr 2023 08:17:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c315200b003ef6708bc1esm2573765wmo.43.2023.04.05.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:17:49 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:17:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Weili Qian <qianweili@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mark Gross <markgross@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <h4wgl5pc4bptxsmlmf7ggohq2y2uwk6ecaoytyywbwhf2ubnzj@ojanwytq5lrk>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404182037.863533-9-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_081752_080667_8D6D1436 
X-CRM114-Status: GOOD (  27.55  )
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

On Tue, Apr 04, 2023 at 11:50:22PM +0530, Sunil V L wrote:
> RINTC structures in the MADT provide mapping between the hartid
> and the CPU. This is required many times even at run time like
> cpuinfo. So, instead of parsing the ACPI table every time, cache
> the RINTC structures and provide a function to get the correct
> RINTC structure for a given cpu.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h |  2 ++
>  arch/riscv/kernel/acpi.c      | 60 +++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 9be52b6ffae1..1606dce8992e 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -59,6 +59,8 @@ static inline bool acpi_has_cpu_in_madt(void)
>  
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> +u32 get_acpi_id_for_cpu(int cpu);
>  #endif /* CONFIG_ACPI */
>  
>  #endif /*_ASM_ACPI_H*/
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 81d448c41714..40ab55309c70 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -24,6 +24,66 @@ EXPORT_SYMBOL(acpi_disabled);
>  int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
>  EXPORT_SYMBOL(acpi_pci_disabled);
>  
> +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> +
> +static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
> +{
> +	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
> +	int cpuid;
> +
> +	if (!(rintc->flags & ACPI_MADT_ENABLED))
> +		return 0;
> +
> +	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
> +	/*
> +	 * When CONFIG_SMP is disabled, mapping won't be created for
> +	 * all cpus.
> +	 * CPUs more than NR_CPUS, will be ignored.
> +	 */
> +	if (cpuid >= 0 && cpuid < NR_CPUS)
> +		cpu_madt_rintc[cpuid] = *rintc;
> +
> +	return 0;
> +}
> +
> +static int acpi_init_rintc_array(void)
> +{
> +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
> +		return 0;
> +
> +	return -ENODEV;

As Conor pointed out, the errors could be propagated from
acpi_table_parse_madt(), which could reduce this function to

 return acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0);

where the '< 0' check would be in the caller below. That sounds good to
me, but then I'd take that a step further and just drop this helper
altogether.

> +}
> +
> +/*
> + * Instead of parsing (and freeing) the ACPI table, cache
> + * the RINTC structures since they are frequently used
> + * like in  cpuinfo.
             ^ extra space

> + */
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> +{
> +	static bool rintc_init_done;
> +
> +	if (!rintc_init_done) {
> +		if (acpi_init_rintc_array()) {
> +			pr_err("No valid RINTC entries exist\n");
> +			return NULL;
> +		}
> +
> +		rintc_init_done = true;
> +	}
> +
> +	return &cpu_madt_rintc[cpu];
> +}
> +
> +u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
> +
> +	BUG_ON(!rintc);
> +
> +	return rintc->uid;
> +}
> +
>  /*
>   * __acpi_map_table() will be called before paging_init(), so early_ioremap()
>   * or early_memremap() should be called here to for ACPI table mapping.
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
