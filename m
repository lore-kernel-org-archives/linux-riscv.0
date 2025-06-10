Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CD5C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6S0Eap89xOK2P0cjkMnPtDUo5dWTUfvnYy+4kDGrrU=; b=E/ettICWwwnOQ9
	q/06sADFW+yBBKQ3E9pm+32U5b5dcItAULs47ik3aJtx2FtUuV143AJPCKJXcRZrkzYllMbOJzhBI
	MpFG8gprSnwUkHYp6MAjk1z2TsEMvYI/ynGnaFdNsUFbla5sFtAI4EFXfs0jxvlGWKOr9iJisgoso
	HL5jX5BWyl0w5oWVhdBFoQiLpw4urP+AfiLPz4yKaRDoJXS0LN1IC9nypo9hVh1vzj9MmcbyaJs1K
	0K4ssupPGoiHrRvLr/j2jZPr43tadpTaqHlXXYcsk8Qcgg1SomcPPEZQaRYI20YlyPJ7PMfZKWmjB
	TSALmNyjVxNJEsG2Oijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfs-00000006ZWa-2sJY;
	Tue, 10 Jun 2025 10:57:48 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvw5-00000006Sp6-0ws4
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:10:30 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fafc79bca8so61339616d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550228; x=1750155028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gf3+7W19a2JpnTuA8J09L80i/ft8MJ4HAXM5aOSCHo0=;
        b=HT3Q+seMg9PFEu94iRyFD+k4fvG2Y24RS1YWw56BmkR47Y4EuijYLdxMt9hj1h2NNO
         VkWzPknOpEVm+6NCp010cK+j/yqNC6MnMdVWdSFbxgXS4Q10E5J7ahwjO+LMgJm4Pdxa
         qo1Lr/L+AaKNAtJoXZcvopZRoG5k9Rt5pSI790nZuB32x9E1zeGg0sa10JgpHTL3hWvb
         2oeaTfVBq0O3+hjs8qkO40dOL1scTnZneeZGLC4MLGGz+5dVfHwKcmNp0AzD9beU24Ih
         3CQOwv3TLMbiUj0xQ/kBn9yYJRifYdA/gOx0fkHv+Ly5kvIwA9kDa54s9QUuiDNYCqg2
         eWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550228; x=1750155028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3+7W19a2JpnTuA8J09L80i/ft8MJ4HAXM5aOSCHo0=;
        b=vvvuA4D9SnW95DTts8O3dv4d777uqUkK9OfoSU2G8d6WjNz7/RBMG7SMDftOZtXYvU
         O0GikyeI1pxpe6A0jNKIbaOhu6HRvb78uxk/rZ5vJWtLe/LsxhTdFgrikAPS3dcDWyLQ
         G/ezCqxTxlayq6L0i6l+XysxRdq4nv6Kxdn1FBzTDAlCqMzqxGRcAZf223f/1EHJ21yr
         5f7Xz7rt6ZDGDyQZFUKdOK/eS5/INmeugEIpO5osfNZ3BUaeowDRcQRm/nyjtlsU19Gw
         1fhWJbFGVxSSObH2IG0etIScXXcguvpkEbZSzIVG+dB9TSfydsOEanJ79tSVsnfRJtXG
         fc/A==
X-Forwarded-Encrypted: i=1; AJvYcCUbSWU8cO/pRI+oRVIowGgl1xGb5MewqfprlUAZj2m1MWrUxSJ0BwEb6L1HN0lDKnEkjEX063T0nQQGqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk2nqRqgs8V+FrQecZSuoWkPg7+r/2elejfrSVxX5bDacOzjdP
	MZeWeSXUFubYKK9lX5AWTeI9NbDwT20Ie9Qw8JaB2cNpDmag5Hb0p2ar
X-Gm-Gg: ASbGnctZGLbkdjoS6ATqD/zcz7ynBMIpAeNXBNDNQJXOSEQRaDbNVTOYtLrrUhego82
	LMucfsZ77hwlMEKLpIZGOTlPS27zMN1y01/rf07+zSliro4sEYC6Lq50ootHddtLbS4rtcHI22n
	NkouoJFO3a5OsfllPUZKNZ7Z6a+evBelstPZAeTFCM9EYLpRih5dmx8iJgV+m4m6d3ORmzrVwcl
	+xN7kLQDrVv5LA4KbukKZ2fVhhpH0phUCj7J5uUQybdr/Uw/zag1v2I1Ep/SVtCcJQoPgR06xSF
	LJqut+qJs9uQF5685NFxIghK1L46GhImSAvArg==
X-Google-Smtp-Source: AGHT+IFyUuIa85S9G+RrD2cesl/4jo/tt/ymXl8MdbmntlE1uodK2NX+6K9rfUlhfxF2KwH4Zl8yUQ==
X-Received: by 2002:a05:6214:1d23:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6fb08fccd19mr282965336d6.28.1749550228071;
        Tue, 10 Jun 2025 03:10:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac94dcsm63471656d6.39.2025.06.10.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:10:27 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:09:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_031029_268509_4EBA2B03 
X-CRM114-Status: GOOD (  32.80  )
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

On Tue, Jun 10, 2025 at 01:05:37PM +0300, Vladimir Kondratiev wrote:
> Refactor Thead specific implementation of the ACLINT-SSWI irqchip.
> Factor out generic code that serves both Thead and MIPS variants.
> This generic part is according to the RISC-V draft spec [1].
> 
> Link: https://github.com/riscvarchive/riscv-aclint [1]
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  drivers/irqchip/Kconfig                       | 16 ++++
>  drivers/irqchip/Makefile                      |  2 +-
>  ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 93 +++++++++++++------
>  3 files changed, 82 insertions(+), 29 deletions(-)
>  rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (67%)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 0d196e447142..be9b54900482 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -634,12 +634,28 @@ config STARFIVE_JH8100_INTC
>  
>  	  If you don't know what to do here, say Y.
>  
> +config ACLINT_SSWI
> +	bool
> +
> +config MIPS_P8700_ACLINT_SSWI
> +	bool "MIPS P8700 ACLINT S-mode IPI Interrupt Controller"
> +	depends on RISCV
> +	depends on SMP
> +	select IRQ_DOMAIN_HIERARCHY
> +	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
> +	help
> +	  This enables support for MIPS P8700 specific ACLINT SSWI device
> +
> +	  If you don't know what to do here, say Y.
> +
>  config THEAD_C900_ACLINT_SSWI
>  	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
>  	depends on RISCV
>  	depends on SMP
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
>  	help
>  	  This enables support for T-HEAD specific ACLINT SSWI device
>  	  support.
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 23ca4959e6ce..0458d6c5d161 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -105,7 +105,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
>  obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
>  obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
>  obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
> -obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
> +obj-$(CONFIG_ACLINT_SSWI)		+= irq-aclint-sswi.o
>  obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
>  obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
>  obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
> diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> similarity index 67%
> rename from drivers/irqchip/irq-thead-c900-aclint-sswi.c
> rename to drivers/irqchip/irq-aclint-sswi.c
> index 8ff6e7a1363b..ec21785df518 100644
> --- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> +++ b/drivers/irqchip/irq-aclint-sswi.c
> @@ -3,7 +3,7 @@
>   * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
>   */
>  
> -#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
> +#define pr_fmt(fmt) "aclint-sswi: " fmt
>  #include <linux/cpu.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -21,56 +21,51 @@
>  #include <asm/sbi.h>
>  #include <asm/vendorid_list.h>
>  
> -#define THEAD_ACLINT_xSWI_REGISTER_SIZE		4
> -
> -#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> -#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
> -
>  static int sswi_ipi_virq __ro_after_init;
>  static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
>  
> -static void thead_aclint_sswi_ipi_send(unsigned int cpu)
> +static void aclint_sswi_ipi_send(unsigned int cpu)
>  {
>  	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
>  }
>  
> -static void thead_aclint_sswi_ipi_clear(void)
> +static void aclint_sswi_ipi_clear(void)
>  {
>  	writel_relaxed(0x0, this_cpu_read(sswi_cpu_regs));
>  }
>  
> -static void thead_aclint_sswi_ipi_handle(struct irq_desc *desc)
> +static void aclint_sswi_ipi_handle(struct irq_desc *desc)
>  {
>  	struct irq_chip *chip = irq_desc_get_chip(desc);
>  
>  	chained_irq_enter(chip, desc);
>  
>  	csr_clear(CSR_IP, IE_SIE);
> -	thead_aclint_sswi_ipi_clear();
> +	aclint_sswi_ipi_clear();
>  
>  	ipi_mux_process();
>  
>  	chained_irq_exit(chip, desc);
>  }
>  
> -static int thead_aclint_sswi_starting_cpu(unsigned int cpu)
> +static int aclint_sswi_starting_cpu(unsigned int cpu)
>  {
>  	enable_percpu_irq(sswi_ipi_virq, irq_get_trigger_type(sswi_ipi_virq));
>  
>  	return 0;
>  }
>  
> -static int thead_aclint_sswi_dying_cpu(unsigned int cpu)
> +static int aclint_sswi_dying_cpu(unsigned int cpu)
>  {
> -	thead_aclint_sswi_ipi_clear();
> +	aclint_sswi_ipi_clear();
>  
>  	disable_percpu_irq(sswi_ipi_virq);
>  
>  	return 0;
>  }
>  
> -static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
> -					      void __iomem *reg)
> +static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
> +					void __iomem *reg)
>  {
>  	struct of_phandle_args parent;
>  	unsigned long hartid;
> @@ -97,7 +92,7 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
>  
>  		cpu = riscv_hartid_to_cpuid(hartid);
>  
> -		per_cpu(sswi_cpu_regs, cpu) = reg + i * THEAD_ACLINT_xSWI_REGISTER_SIZE;
> +		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
>  	}
>  
>  	pr_info("%pfwP: register %u CPU%s\n", fwnode, contexts, str_plural(contexts));
> @@ -105,17 +100,12 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
>  	return 0;
>  }
>  
> -static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
> +static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
>  {
>  	struct irq_domain *domain;
>  	void __iomem *reg;
>  	int virq, rc;
>  
> -	/* If it is T-HEAD CPU, check whether SSWI is enabled */
> -	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
> -	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
> -		return -ENOTSUPP;
> -
>  	if (!is_of_node(fwnode))
>  		return -EINVAL;
>  
> @@ -124,7 +114,7 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
>  		return -ENOMEM;
>  
>  	/* Parse SSWI setting */
> -	rc = thead_aclint_sswi_parse_irq(fwnode, reg);
> +	rc = aclint_sswi_parse_irq(fwnode, reg);
>  	if (rc < 0)
>  		return rc;
>  
> @@ -146,22 +136,68 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
>  	}
>  
>  	/* Register SSWI irq and handler */
> -	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
> +	virq = ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
>  	if (virq <= 0) {
>  		pr_err("unable to create muxed IPIs\n");
>  		irq_dispose_mapping(sswi_ipi_virq);
>  		return virq < 0 ? virq : -ENOMEM;
>  	}
>  
> -	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
> +	irq_set_chained_handler(sswi_ipi_virq, aclint_sswi_ipi_handle);
>  
>  	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
> -			  "irqchip/thead-aclint-sswi:starting",
> -			  thead_aclint_sswi_starting_cpu,
> -			  thead_aclint_sswi_dying_cpu);
> +			  "irqchip/aclint-sswi:starting",
> +			  aclint_sswi_starting_cpu,
> +			  aclint_sswi_dying_cpu);
>  
>  	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
>  
> +	return 0;
> +}
> +

> +#if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> +/* generic/MIPS variant */

I do not think there is a must to add these defines

Regards,
Inochi

> +static int __init generic_aclint_sswi_probe(struct fwnode_handle *fwnode)
> +{
> +	int rc;
> +
> +	rc = aclint_sswi_probe(fwnode);
> +	if (rc)
> +		return rc;
> +
> +	/* Announce that SSWI is providing IPIs */
> +	pr_info("providing IPIs using ACLINT SSWI\n");
> +
> +	return 0;
> +}
> +
> +static int __init generic_aclint_sswi_early_probe(struct device_node *node,
> +						  struct device_node *parent)
> +{
> +	return generic_aclint_sswi_probe(&node->fwnode);
> +}
> +IRQCHIP_DECLARE(generic_aclint_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
> +#endif /* CONFIG_MIPS_P8700_ACLINT_SSWI */
> +
> +#if defined(CONFIG_THEAD_C900_ACLINT_SSWI)
> +
> +#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> +#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
> +
> +/* THEAD variant */
> +static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
> +{
> +	int rc;
> +
> +	/* If it is T-HEAD CPU, check whether SSWI is enabled */
> +	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
> +	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
> +		return -ENOTSUPP;
> +
> +	rc = aclint_sswi_probe(fwnode);
> +	if (rc)
> +		return rc;
> +
>  	/* Announce that SSWI is providing IPIs */
>  	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
>  
> @@ -174,3 +210,4 @@ static int __init thead_aclint_sswi_early_probe(struct device_node *node,
>  	return thead_aclint_sswi_probe(&node->fwnode);
>  }
>  IRQCHIP_DECLARE(thead_aclint_sswi, "thead,c900-aclint-sswi", thead_aclint_sswi_early_probe);
> +#endif /* CONFIG_THEAD_C900_ACLINT_SSWI */
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
