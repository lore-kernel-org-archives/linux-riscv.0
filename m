Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204F7C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WArUF/PxMy700J3l37RlZscOx81bv2CvC8U4UeNJK3o=; b=pT7ctg63+en2MG
	vrh6I3zvAzQ5uBt39C8h9ebkrEfbPrtfwPXgVGVVNP3aHoT9hPlzOYhztq8L6NJnXog20RqwXPEze
	RLBC7bkX4f4ye0s/XVhIPow05UH0EzUAIaX+LNKN/r+RJKDZo0FpJX9uUwkUT0Q3gNN0i7a6G4V7Q
	5bvaPDVNY/hulyaXAxFxI2N0DYUUank9CZNSWLJWM5g+HYbMXqzvnv6hJPQf3HBvA8QmPjFurUBLh
	nwymbQiFDMHr0ZVIXjZIsfvJq27wPGzM3lE1r8gTkJ0l9UXZ9SiLTw3fUeMlfr1qFuWtA/LOhjjXv
	tbF3/EKgX/F8ltX+MAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUA3H-00550q-Ie; Mon, 20 Feb 2023 17:34:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUA3E-0054zY-UH
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 17:34:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id o12so8001930edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 09:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2lPEjmPsu3LYtY8DZxk5vrralnhH+zYWV8cw/aygZg=;
        b=oN+qyijYHJlUO7+d73fPjJC/vzJxExkcwOeC6kHPx8kPL/nHekvsr9vT/PQhWUEV+B
         7pwRDd2qaWfGtUFPdZQvgnVyAvrHkohNcXubH+3Cb0SoQUjx0TvHyfgrqFhallZgTk64
         zunL4GsAEJEUkKeyArSs3gtqmlRH6ZOFS6MS/g9dDEr+nZh7TuhCkIGnkmLeVFmG2qU8
         HZehIvTKG+CID3zvhzIzoEulLZ/bZvWlGvRrrOn/IP2jw/4juroGQjWZq4GmFY3ywcUA
         QgPB9fv0Wnprj+5psROiCuENlXNDLj53cr/c3slFOpvNXn5b/j/ti98PB71HlpKcuGE5
         azRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2lPEjmPsu3LYtY8DZxk5vrralnhH+zYWV8cw/aygZg=;
        b=pRcNgKJ5SqCwmsmQJOlg7fAyWuW54uMbuGGQn8HWY/HAs6a83wPtJAF5gdShu8RiUH
         ky5b9NcrPuhmB90pcezeuows7YDhxR9/6LaAwna6kLL/gN9+DgVR/agSyrC9w/s2a5qt
         3FQ9E/04zEq/OG8oeBPHCiHGeDiB4KNWBeNWSPZQu2C73NJElTJlJAOKRpbcsrGJr/zI
         kRmaAokvVYhaXc4WlQVVrYxpkx/Kl955qmnb82M+2VvD05JsMi/WyF/TlaCpxvmVTvwl
         7V+kUU+ODD72HlYsMHok0o3qde/7Ft9I7qAMwqfNlJyJGspDFn0hYiT5EZ/mBb+2COvf
         PM3A==
X-Gm-Message-State: AO0yUKXQ2gm3FzwMauAypLUCYCKoH1p65SfGZHbAN8rlUxvTMO1AqoQd
	Isxf5YllY5KfHU48/pWKzriGfA==
X-Google-Smtp-Source: AK7set9H4zV0LUVjLvSVauvnlRDsvf+acSYg6cf8q8+/u488Q6Z3MDYmkhABENzUNnf/V0vpL+34Cg==
X-Received: by 2002:a17:907:cc97:b0:88f:13f0:4565 with SMTP id up23-20020a170907cc9700b0088f13f04565mr6809782ejc.69.1676914445228;
        Mon, 20 Feb 2023 09:34:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906a28a00b008bda61ff999sm3477128ejz.130.2023.02.20.09.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:34:04 -0800 (PST)
Date: Mon, 20 Feb 2023 18:34:03 +0100
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
Subject: Re: [PATCH V2 11/21] RISC-V: ACPI: Add a function to retrieve the
 hartid
Message-ID: <20230220173403.avvggi4qhsxgismo@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-12-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-12-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_093408_997262_073A024A 
X-CRM114-Status: GOOD (  28.12  )
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

On Thu, Feb 16, 2023 at 11:50:33PM +0530, Sunil V L wrote:
> The hartid is in the RINTC structure of the MADT table. Instead of
> parsing the ACPI table every time, cache it and provide a function
> to read it.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h |  8 +++++
>  arch/riscv/kernel/acpi.c      | 55 +++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 3c3a8ac3b37a..b9d7b713fb43 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -67,6 +67,9 @@ int acpi_numa_get_nid(unsigned int cpu);
>  static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
>  #endif /* CONFIG_ACPI_NUMA */
>  
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> +
> +u32 get_acpi_id_for_cpu(int cpu);
>  #else
>  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
>  				     unsigned int cpu, const char **isa)
> @@ -74,6 +77,11 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
>  	return -EINVAL;
>  }
>  
> +static inline u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	return -1;
> +}
> +
>  #endif /* CONFIG_ACPI */
>  
>  #endif /*_ASM_ACPI_H*/
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 81d448c41714..13b26c87c136 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -24,6 +24,61 @@ EXPORT_SYMBOL(acpi_disabled);
>  int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
>  EXPORT_SYMBOL(acpi_pci_disabled);
>  
> +static unsigned int intc_count;
> +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> +
> +static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
> +{
> +	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
> +
> +	if (!(rintc->flags & ACPI_MADT_ENABLED))
> +		return 0;
> +
> +	cpu_madt_rintc[intc_count++] = *rintc;
> +
> +	return 0;
> +}
> +
> +static int acpi_init_rintc_array(void)
> +{
> +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
> +		return 0;
> +
> +	pr_info("No valid RINTC entries exist\n");

This pr_info() could be dropped or turned into a comment and the pr_err()
below moved up here.

> +	return -ENODEV;
> +}
> +
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> +{
> +	static bool rintc_init_done;
> +	unsigned int i;
> +
> +	if (!rintc_init_done) {
> +		if (acpi_init_rintc_array()) {
> +			pr_err("Failed to initialize RINTC array\n");
> +			return NULL;
> +		}
> +		rintc_init_done = true;
> +	}
> +
> +	for (i = 0; i < intc_count; i++) {
> +		if (cpu_madt_rintc[i].hart_id == cpuid_to_hartid_map(cpu))
> +			return &cpu_madt_rintc[i];
> +	}

Maybe I'll see the reason in later patches, but it seems odd that this
patch says we want to cache the cpuid to acpi_processor_id mapping, but
then we cache each RINTC instead and still have to do a linear search of
them to determine which one to use.

> +
> +	return NULL;
> +}
> +
> +u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
> +
> +	if (!rintc)
> +		return -1;
> +
> +	return  rintc->uid;
              ^ extra blank here
> +}
> +
>  /*
>   * __acpi_map_table() will be called before paging_init(), so early_ioremap()
>   * or early_memremap() should be called here to for ACPI table mapping.
> -- 
> 2.34.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
