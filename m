Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491CBC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 06:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2M6uLnjrnbC/yHeP5NRQHBtU8xeYBxCudZTJPgiO14=; b=rqxJgu8dv8wUFT
	GVcgXEA+ckaxaWQnP9QwmouTyQ5hczv7y6LUZFJnOdNYZw3r+aw/buHhisRguyhN/Ec+6zxMMDjwk
	haVCvjbrtrd9uE/eD9tBJ07eixIwEhDQmgV9dU7hVTqPHJYcxZXxcZ4RGDjrP6dutk1P46SzyjmBA
	vW32uSqKtzdJZWNId6yXZIoVqRME81xzXLX3Cs/RAfeA7ZSB+ULpcyUzmH6XjCw2LBSvULv6n315I
	96VS6+zA8IPaz7iwkVGDLFe6uC6OOYouDiG2cJuOxb5uklcShbXGnmwkL5MyuFfyyUfZYPgqOtZlO
	uJX1ULHLq0/iLitZkMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdY-00000004ORl-1buo;
	Fri, 21 Feb 2025 06:35:48 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdW-00000004OPl-1czq
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 06:35:47 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e41e18137bso14044086d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 22:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740119745; x=1740724545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GgF+MkPyNemGN6pZlGJKeAwLqALz+oWn8P6tqHlUU2E=;
        b=XVntUqNHQaD1YPSLK3k+kQWph1J7vekUPb0h9N3qPABxBrGO1pEu9PR8O4/28aKzGf
         241pGR5GZWMULRGyUZ1Rc9PvyLI/RAR7/f6A7f+ecUpdgARjSbKbho1oMVM4tRKZL7DT
         Hsm1mlArGn63Kt/sSC/W9zY11JSZhvsgKKnBpCNE+IyJNeRLx1TN8vl4UUuzhNI4WOzx
         ML5DANmCfv7+uh+N5V5tZhqZfXEd9PfWiO49N0ceK8SIDzPY7XZTAoblO3YlhXpG+LxE
         hfMhnr2/uHHhzBuRNMGxFdmW6xPTPGcFuoiu7DE3K7lCwIVfZTxlMXA7MHinz16S3J9C
         pOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119745; x=1740724545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgF+MkPyNemGN6pZlGJKeAwLqALz+oWn8P6tqHlUU2E=;
        b=Dwh88jyAArwTxov3Anj4LJEdmxt86ycSmx3xl/xtF2odmcLDVWyJn9V9xwzY7/TodG
         Swd4t/ZKgFaJ5xWhaeAlvIkuQts5bkjdkm47w0ifMsCd53g3RDdOSNobtNt2E9OX/4Wt
         o7KuYjxWbJPYjgtCg1Y+G/rdKz/lDuHwAPuidYiOmZuDS8uNkCqg3l76oyPTKKbPJ2VB
         AbQkNJftsg0PnVcrlzZlWIvgbP278QFeO/L1+jmIEDY5BWbsVQh2leQXrLCyn37GIRMI
         oQjnciqalBDxaB1wuXqxFy0Zvj1BtugZ/3R/Gd8LSPlh5GCDAdG6Jm7x1tkLQ+WZhxr4
         2ZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRhekq6kxXqP8nbm3ZjXeU0pzpXHevT7+qcQLV2R4Tncbbb+xOMSAYUjmnxsNg3iStcEBhccpfIKx7qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsE71BUswn9hf58Q7B8gkop5drGd8WUmCuw/KU2OPebffd4Rbl
	mVNyZvMS/vEn98FrorpXq0yW+UcYTMZUgGXIZf1IIzZZzKqfkU6R
X-Gm-Gg: ASbGncvo/2fCgGfAeTeTGqkkypkGPJ2EevvXQW/7aFEVEskZC19exRQj8Vfdil0XdLb
	xvEkfSeFTEbMiAPLrwbReengNAo+mxN0fzyXkeCcwKcCEQJq5+X97lFk39cKmUhmeWD8ePq3sAs
	uHOWwyIgqb3KvYpoS/eq3Qbd+V6DS2dfEXy3xOYrTa4EySFsshIVuOIj6icXmZwbMmk3ssbnUr4
	IrNfXMn7tAuQ7+Sscp5+DPiuic5Lu+jPb94HfEaQjoYE1TurN/FSR4+xhhX11mALBQ4UM32ZAaE
	qA==
X-Google-Smtp-Source: AGHT+IHPzc9DLKjCuZh/6Ap8Kbdi/V/+WJ+ejMMs7iMspJsfIlQ8pbtavtfDzNcgx7Aon2zxus+6Dg==
X-Received: by 2002:a05:6214:130d:b0:6e6:5f0b:94bc with SMTP id 6a1803df08f44-6e6b008636bmr20413876d6.11.1740119745126;
        Thu, 20 Feb 2025 22:35:45 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d785c1fsm94051126d6.35.2025.02.20.22.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:44 -0800 (PST)
Date: Fri, 21 Feb 2025 14:35:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v4 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
Message-ID: <nmr5qzvxxw7psymykjsaivmamt3icj6jqx6qmneofsnp33faf5@p7z6kqumfljn>
References: <cover.1740116190.git.unicorn_wang@outlook.com>
 <f438742bdf7bf3ef8a65e1d88ad57fd1ac66273f.1740116190.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f438742bdf7bf3ef8a65e1d88ad57fd1ac66273f.1740116190.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_223546_432346_BAD0BB18 
X-CRM114-Status: GOOD (  33.92  )
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

On Fri, Feb 21, 2025 at 01:50:19PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add driver for Sophgo SG2042 MSI interrupt controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/irqchip/Kconfig          |  12 ++
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-sg2042-msi.c | 264 +++++++++++++++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 drivers/irqchip/irq-sg2042-msi.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index be063bfb50c4..cdb0accd826a 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -751,6 +751,18 @@ config MCHP_EIC
>  	help
>  	  Support for Microchip External Interrupt Controller.
>  
> +config SOPHGO_SG2042_MSI
> +	bool "Sophgo SG2042 MSI Controller"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	depends on PCI
> +	select IRQ_DOMAIN_HIERARCHY
> +	select IRQ_MSI_LIB
> +	select PCI_MSI
> +	help
> +	  Support for the Sophgo SG2042 MSI Controller.
> +	  This on-chip interrupt controller enables MSI sources to be
> +	  routed to the primary PLIC controller on SoC.
> +
>  config SUNPLUS_SP7021_INTC
>  	bool "Sunplus SP7021 interrupt controller" if COMPILE_TEST
>  	default SOC_SP7021
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 25e9ad29b8c4..dd60e597491d 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -128,4 +128,5 @@ obj-$(CONFIG_WPCM450_AIC)		+= irq-wpcm450-aic.o
>  obj-$(CONFIG_IRQ_IDT3243X)		+= irq-idt3243x.o
>  obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
>  obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
> +obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
>  obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> new file mode 100644
> index 000000000000..b7950872ed2e
> --- /dev/null
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SG2042 MSI Controller
> + *
> + * Copyright (C) 2024 Sophgo Technology Inc.
> + * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +
> +#include "irq-msi-lib.h"
> +
> +#define SG2042_MAX_MSI_VECTOR	32
> +
> +struct sg2042_msi_chipdata {
> +	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
> +
> +	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
> +
> +	u32		irq_first;	// The vector number that MSIs starts
> +	u32		num_irqs;	// The number of vectors for MSIs
> +
> +	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
> +	struct mutex	msi_map_lock;	// lock for msi_map
> +};
> +
> +static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_req)
> +{
> +	int first;
> +
> +	guard(mutex)(&data->msi_map_lock);
> +	first = bitmap_find_free_region(data->msi_map, data->num_irqs,
> +					get_count_order(num_req));
> +	return first >= 0 ? first : -ENOSPC;
> +}
> +
> +static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data,
> +				  int hwirq, int num_req)
> +{
> +	guard(mutex)(&data->msi_map_lock);
> +	bitmap_release_region(data->msi_map, hwirq, get_count_order(num_req));
> +}
> +
> +static void sg2042_msi_irq_ack(struct irq_data *d)
> +{
> +	struct sg2042_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
> +	int bit_off = d->hwirq;
> +
> +	writel(1 << bit_off, data->reg_clr);
> +
> +	irq_chip_ack_parent(d);
> +}
> +
> +static void sg2042_msi_irq_compose_msi_msg(struct irq_data *d,
> +					   struct msi_msg *msg)
> +{
> +	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
> +
> +	msg->address_hi = upper_32_bits(data->doorbell_addr);
> +	msg->address_lo = lower_32_bits(data->doorbell_addr);
> +	msg->data = 1 << d->hwirq;
> +}
> +
> +static const struct irq_chip sg2042_msi_middle_irq_chip = {
> +	.name			= "SG2042 MSI",
> +	.irq_ack		= sg2042_msi_irq_ack,
> +	.irq_mask		= irq_chip_mask_parent,
> +	.irq_unmask		= irq_chip_unmask_parent,
> +#ifdef CONFIG_SMP
> +	.irq_set_affinity	= irq_chip_set_affinity_parent,
> +#endif
> +	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
> +};
> +
> +static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain,
> +					  unsigned int virq, int hwirq)
> +{
> +	struct sg2042_msi_chipdata *data = domain->host_data;
> +	struct irq_fwspec fwspec;
> +	struct irq_data *d;
> +	int ret;
> +
> +	fwspec.fwnode = domain->parent->fwnode;
> +	fwspec.param_count = 2;
> +	fwspec.param[0] = data->irq_first + hwirq;
> +	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
> +
> +	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
> +	if (ret)
> +		return ret;
> +
> +	d = irq_domain_get_irq_data(domain->parent, virq);
> +	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
> +}
> +
> +static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain,
> +					  unsigned int virq,
> +					  unsigned int nr_irqs, void *args)
> +{
> +	struct sg2042_msi_chipdata *data = domain->host_data;
> +	int hwirq, err, i;
> +
> +	hwirq = sg2042_msi_allocate_hwirq(data, nr_irqs);
> +	if (hwirq < 0)
> +		return hwirq;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
> +		if (err)
> +			goto err_hwirq;
> +
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +					      &sg2042_msi_middle_irq_chip, data);
> +	}
> +
> +	return 0;
> +
> +err_hwirq:
> +	sg2042_msi_free_hwirq(data, hwirq, nr_irqs);
> +	irq_domain_free_irqs_parent(domain, virq, i);
> +
> +	return err;
> +}
> +
> +static void sg2042_msi_middle_domain_free(struct irq_domain *domain,
> +					  unsigned int virq,
> +					  unsigned int nr_irqs)
> +{
> +	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> +	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
> +
> +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> +	sg2042_msi_free_hwirq(data, d->hwirq, nr_irqs);
> +}
> +
> +static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
> +	.alloc	= sg2042_msi_middle_domain_alloc,
> +	.free	= sg2042_msi_middle_domain_free,
> +	.select	= msi_lib_irq_domain_select,
> +};
> +
> +#define SG2042_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
> +				   MSI_FLAG_USE_DEF_CHIP_OPS)
> +
> +#define SG2042_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
> +
> +static const struct msi_parent_ops sg2042_msi_parent_ops = {
> +	.required_flags		= SG2042_MSI_FLAGS_REQUIRED,
> +	.supported_flags	= SG2042_MSI_FLAGS_SUPPORTED,
> +	.bus_select_mask	= MATCH_PCI_MSI,
> +	.bus_select_token	= DOMAIN_BUS_NEXUS,
> +	.prefix			= "SG2042-",
> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
> +};
> +
> +static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
> +				   struct device *dev)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct irq_domain *plic_domain, *middle_domain;
> +	struct fwnode_handle *plic_node;
> +

> +	plic_node = fwnode_find_reference(fwnode, "msi-ranges", 0);
> +	if (IS_ERR(plic_node)) {
> +		pr_err("Failed to find the PLIC node!\n");
> +		return PTR_ERR(plic_node);
> +	}

I think plic_node is just the args.fwnode in the sg2042_msi_probe.
Just reuse it. No need to parse this again.

Otherwise, It looks good to me. With this fix:

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

> +
> +	plic_domain = irq_find_matching_fwnode(plic_node, DOMAIN_BUS_ANY);
> +	fwnode_handle_put(plic_node);
> +	if (!plic_domain) {
> +		pr_err("Failed to find the PLIC domain\n");
> +		return -ENXIO;
> +	}
> +
> +	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs,
> +						    fwnode,
> +						    &sg2042_msi_middle_domain_ops,
> +						    data);
> +	if (!middle_domain) {
> +		pr_err("Failed to create the MSI middle domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
> +
> +	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
> +	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
> +
> +	return 0;
> +}
> +
> +static int sg2042_msi_probe(struct platform_device *pdev)
> +{
> +	struct fwnode_reference_args args = {};
> +	struct sg2042_msi_chipdata *data;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
> +	if (IS_ERR(data->reg_clr)) {
> +		dev_err(dev, "Failed to map clear register\n");
> +		return PTR_ERR(data->reg_clr);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "doorbell");
> +	if (!res) {
> +		dev_err(dev, "Failed get resource from set\n");
> +		return -EINVAL;
> +	}
> +	data->doorbell_addr = res->start;
> +
> +	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
> +						 "#interrupt-cells", 0, 0, &args);
> +	if (ret) {
> +		dev_err(dev, "Unable to parse MSI vec base\n");
> +		return ret;
> +	}
> +	fwnode_handle_put(args.fwnode);
> +
> +	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
> +						 NULL, args.nargs + 1,
> +						 0, &args);
> +	if (ret) {
> +		dev_err(dev, "Unable to parse MSI vec number\n");
> +		return ret;
> +	}
> +	fwnode_handle_put(args.fwnode);
> +
> +	data->irq_first = (u32)args.args[0];
> +	data->num_irqs = (u32)args.args[args.nargs - 1];
> +
> +	mutex_init(&data->msi_map_lock);
> +
> +	return sg2042_msi_init_domains(data, dev);
> +}
> +
> +static const struct of_device_id sg2042_msi_of_match[] = {
> +	{ .compatible	= "sophgo,sg2042-msi" },
> +	{}
> +};
> +
> +static struct platform_driver sg2042_msi_driver = {
> +	.driver = {
> +		.name		= "sg2042-msi",
> +		.of_match_table	= sg2042_msi_of_match,
> +	},
> +	.probe = sg2042_msi_probe,
> +};
> +builtin_platform_driver(sg2042_msi_driver);
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
