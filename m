Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E2EC7EE20
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 18:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=L/fi1nMvh7psBJ6OSCsQRphMvMLjWVF84i3jOvBs1qA=; b=3qvOovzkLs+uLMx9U1+zxLSDuu
	3Prn6AP1CnD+CmjncR9x2Vh2c9YRTKWwIAxibnXC/2cdAp1GMhwE0ZA6CPHKsS5xyASmER8nCu16k
	xUs2Lp3lB1Ql0kEUzBqLNI10B1/YiOLTYRThROPFPekdH3BLywo24gPuHHIQhuanXOg/gDazxri8V
	eBdCwI6szFxSpZbLQHBlot/IoFTdRn7pXElLWVVTHlMKpXLlgM3EWfxY2J+eyOKr0JSGG/1aduOBO
	Yv+2glYQgBQF/aav/BvZVJ52ZkZD3tJu9Skce+nJFWteyrPWMpe0LDRFRR7+TdWDsL870XuuJZwb+
	dA5236Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prk8a-004e1M-2L;
	Wed, 26 Apr 2023 18:45:08 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prk8W-004dzu-1p
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 18:45:05 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2472a3bfd23so5182785a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682534701; x=1685126701;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39lPpeZJ6Vfq5QIqd0kQjSRRWCoPA/qmtkXRKTNu56g=;
        b=0cTuHZsz+N1jNTSkL1VOEIXLta2nzIDK/QbZnIPF852eIN4/wy+BhVCrhX+aN/xiWq
         Pv8Xl1lrAsfRMHTAPqE0dD2zudgK+WM13ls67lFNlX2d9l7OHYZ0my8/qgS+OpPBbXS+
         2z+QXiSeWX2lV416QR2qREaa5lGfE5QamuUn4krS9vrilqtLpmfxdn0+t3ARTYK7nKRN
         +YoiaJhWjD93At8jHJYvd1pLLZRfh1qnpcxcZsNNeup01xnSGt1p/Yo4ruFnF3NuZSlO
         Cv4D/kiEjyEGrSlEa/CD8W0PXqoIgw5IzxsUfdFzP16WeBAlKG6nQHZfXug9NKXds/tk
         Supg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682534701; x=1685126701;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39lPpeZJ6Vfq5QIqd0kQjSRRWCoPA/qmtkXRKTNu56g=;
        b=fyk3TtDwNUK6UzT8/2tZt9nhKqqlu6NOWMxHMmbiIQLgKQS+4FP+zPdsRCYL12nv94
         bWtQbPDpCmgo0c6u/H2HEZjRoPbRBAyn/91mUZTCvuup6h0VPNSBQB1jO+3NIRpmhOV5
         rotAdAmfn9pY/kgVCrx3XJZ2ffEEeAanI7Vu40GuVdFmU27fBIG/1+UETSc6gpbqOQhB
         OomhDObS3lmrOnqC4D8tegA3vsCM5FiTuf5bOs/DzjBm2xsv7XwCkE/IZVDaCWaqS2F3
         Paokti2RGk7s5l8JuZm7kRYb928AQfgJUFkvZPl+KImT+PQwe5/gimTFnAsX+LkFTBTB
         3M8Q==
X-Gm-Message-State: AAQBX9eJzoMPcK1Oh4UNeHBrSRRyFKEs6iWvBe5qGgA1nAImWbgIbdG4
	4hIkUKW24mc64CAZMF3PS/Lguw==
X-Google-Smtp-Source: AKy350aIP182a8iZzH6HSor4HK3Xuh+akyVObent4Cuaa7ze4Zw4nZqWvOGmKTBK6pDR/bNTzXJfPQ==
X-Received: by 2002:a17:90b:4b0b:b0:240:9bf7:8df2 with SMTP id lx11-20020a17090b4b0b00b002409bf78df2mr23207939pjb.37.1682534701381;
        Wed, 26 Apr 2023 11:45:01 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u5-20020a17090ae00500b002467717fa60sm10261751pjy.16.2023.04.26.11.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:45:00 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:45:00 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Apr 2023 11:38:37 PDT (-0700)
Subject: Re: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC structure
In-Reply-To: <20230404182037.863533-9-sunilvl@ventanamicro.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com
Message-ID: <mhng-fd6c3622-ce6c-4895-8dc9-7dbaa2ab14f4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_114504_607629_FA4E6A23 
X-CRM114-Status: GOOD (  29.89  )
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
Cc: rafael.j.wysocki@intel.com, linux-doc@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-riscv@lists.infradead.org, qianweili@huawei.com, herbert@gondor.apana.org.au, corbet@lwn.net, Marc Zyngier <maz@kernel.org>, daniel.lezcano@linaro.org, linux-acpi@vger.kernel.org, lenb@kernel.org, aou@eecs.berkeley.edu, markgross@kernel.org, hdegoede@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, nathan@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, wangzhou1@hisilicon.com, linux-crypto@vger.kernel.org, rafael@kernel.org, luzmaximilian@gmail.com, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Apr 2023 11:20:22 PDT (-0700), sunilvl@ventanamicro.com wrote:
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

Unless I'm missing something, this races with CPUs coming online.  Maybe 
that's a rare enough case we don't care, but I think we'd also just have 
simpler logic if we fixed it...

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
> +}
> +
> +/*
> + * Instead of parsing (and freeing) the ACPI table, cache
> + * the RINTC structures since they are frequently used
> + * like in  cpuinfo.
> + */
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> +{
> +	static bool rintc_init_done;

... basically just get rid of this global variable, and instead have a

    if (!&cpu_madt_rintc[cpu])
        ... parse ...
    
    return &cpu_madt_rintc[cpu];

that'd probably let us get rid of a handful of these helpers too, as now 
it's just a call to the parsing bits.

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

We should have some better error reporting here.  It looks like all the 
callerss of get_acpi_id_for_cpu() are tolerant of a nonsense ID being 
returned, so maybe we just pr_warn() something users can understand and 
then return -1 or something?

> +
> +	return rintc->uid;
> +}
> +
>  /*
>   * __acpi_map_table() will be called before paging_init(), so early_ioremap()
>   * or early_memremap() should be called here to for ACPI table mapping.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
