Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77540C02198
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2025 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixBRXK+ofs58Jx2QVUCbou/hGDXqcNPENFXg8Ov/Q00=; b=5CPzNDVx31PKn4
	+Uz5EnYukn9Gn77oyHtkeoA7DWSQY6afuq3SNMIdzUwo3HPo0tE4l8FgIhzQFOGDcwGKXwcB4QTm6
	5n4DjjMfKzDVtrt7ifMfWRec/XT2PKL3v3/cjUsNWWkQlR4W2JCoKcZvNOW9rjiEzkrPKyV1CfIlT
	IKWU/uFe7b5vdFaZgTqvpXOtSJbyNfk//Vbx1FY/dgK9jwidoX9bWLJarDBgOHyTmu0DJsHsaleKG
	CW2/jwEpM+3b/wbIBrgPY5TVT44NKwsyFDHkU5b0gV3kJtkRV34/r9Ua8akBGtzNUeWAoQ69rV2Rx
	LV41K22F3LHLsF1jLQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6gX-0000000GibQ-2m0E;
	Sat, 15 Feb 2025 01:09:33 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6gV-0000000GiaH-1Zkt
	for linux-riscv@lists.infradead.org;
	Sat, 15 Feb 2025 01:09:32 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c07441f14cso237378885a.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 17:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739581770; x=1740186570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4AAbLMNPxa3cHhDl9zszoQoesM/C3MVg7R6Jya4/5o=;
        b=HWfftSVVyd8yDTunpSlsOIyPHjcRIB28SvNv5AW20/z1v5xbapVTHn5bGXQkEal9D4
         p7Y0iQMAZ5i2JZr0+kD8DDeLUfo38fY8blFQXgiLwGE0aEIW88mVN1sqin5/s2uvkB5Y
         xIwmTvjepAYaKh/xK5ZZFIOECgG66qktF2FgnLaXPxBHIdnitR5M9GhIMH2I5Yuxy8M8
         CJs/NKwTWu5ckc5ThfiAIOiFQQsajJo0RU9wRnrrtHs3Q4qwgOPw9anTlIJdCNKPmfEy
         pcHEU2ukxKDI0wV8exrgtb1eLKiymya0+70PD/eQ8Un/umd9GoE1NtV8EvepKKdJHsLE
         SDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739581770; x=1740186570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4AAbLMNPxa3cHhDl9zszoQoesM/C3MVg7R6Jya4/5o=;
        b=iYdmBO+sop65tMKZx1G9umoYjhIm2QPu1uvGsbQ1gNMk8lsG7b4Q5h/aVFYT2S6Ren
         hM1o8hbTN9F30MR1PEdKi2eBzJdv4tfqAFl5+CenxSNodcnjs+WtQIJdu+twkoBVN09O
         ERuF3/7RgwC/i45JghCmOfQQGJxVTUGkgWcfb3pK/kYOLCYrCx85/Fk81kreUdIIMyzU
         XTZpGH4+o3Pj+BCT7pxEvXpaO5v8LMXdtrObLdPHYPVl4rRO7+yh0g8n4G3M+5z2oTUm
         mIt73sNg0D/ER9oF09QKbHxBoQ39/z9vf4ko8qgDNMyplYv84+nsO19cLOIMfJyxIuht
         r/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVRS3YC/Zf2BHz9fpR53d//f7dlml+MUq9/BUjP2w+UuJboYt94Lb+g0PlL2EfoubT28bfOlQGSnSkriQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCr9h+GQDBYBABSrA736EEeS9L1ntGYsbMJZhQcWTyow4Ts5o+
	KbX2pYX1cMISyInk1fW103lCgmIJcLSag+OpSIzGGAq/F1w1iyJ/
X-Gm-Gg: ASbGncs2DeaWlgL9UjMBr6Js9r0Rj+C7vxuHB+kcNcOMlczYFZDuWsSRL+fMZhjwZe2
	Oj5mgS5+RUmBwl1BvmAsOjI2rTIfYxjW/kCm3WzzLIrt3gc6/zbnbL/zwoDdpg1aFS02U3CUi1z
	xI5/AX9U944OlP+s3STX5B91j8bm8nbPfg7mDx/rp0C0OwbnQyIpn2SJPuKqGZqjWVQ+vNGADUk
	wsXA+NEJeOScx0Xqmzq5/QW+mv7ZRPzpdLlLHfVotp0fbatf9izkrK1qlkZWF3YvOE=
X-Google-Smtp-Source: AGHT+IGaXs8pTV+iwxcD1hy1B+P5sDVssAwqfrBP/dmzdQ0BuLhEnRabWDA5dNI+YkHgvwaN9qGqog==
X-Received: by 2002:a05:620a:24cf:b0:7c0:7922:3675 with SMTP id af79cd13be357-7c08a9c8cd3mr182201685a.26.1739581770122;
        Fri, 14 Feb 2025 17:09:30 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c617478sm265655985a.50.2025.02.14.17.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 17:09:29 -0800 (PST)
Date: Sat, 15 Feb 2025 09:09:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com, samuel.holland@sifive.com, 
	christophe.jaillet@wanadoo.fr
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
Message-ID: <dh645pyvtylcxjcjjcdl7xttpp4qmtjouapifaql4lniab3qjo@lqmwytf5q35c>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
 <b5c2f13aa94f68c3415a1292678e16db33f291cd.1736921549.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5c2f13aa94f68c3415a1292678e16db33f291cd.1736921549.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_170931_419615_C2FB609C 
X-CRM114-Status: GOOD (  35.48  )
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

On Wed, Jan 15, 2025 at 02:33:45PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add driver for Sophgo SG2042 MSI interrupt controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/irqchip/Kconfig          |  12 ++
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-sg2042-msi.c | 268 +++++++++++++++++++++++++++++++
>  3 files changed, 281 insertions(+)
>  create mode 100644 drivers/irqchip/irq-sg2042-msi.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 9bee02db1643..161fb5df857f 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -749,6 +749,18 @@ config MCHP_EIC
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
> index 000000000000..1f88e1671e5c
> --- /dev/null
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -0,0 +1,268 @@
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
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_pci.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
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
> +static struct msi_parent_ops sg2042_msi_parent_ops = {
> +	.required_flags		= SG2042_MSI_FLAGS_REQUIRED,
> +	.supported_flags	= SG2042_MSI_FLAGS_SUPPORTED,
> +	.bus_select_mask	= MATCH_PCI_MSI,
> +	.bus_select_token	= DOMAIN_BUS_NEXUS,
> +	.prefix			= "SG2042-",
> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
> +};
> +
> +static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
> +				   struct device_node *node)

For ACPI support, I prefer to use device instead of device_node
The following suggestion is also for ACPI support

> +{
> +	struct fwnode_handle *fwnode = of_node_to_fwnode(node);
> +	struct irq_domain *plic_domain, *middle_domain;
> +	struct device_node *plic_node;
> +

> +	if (!of_find_property(node, "interrupt-parent", NULL)) {
> +		pr_err("Can't find interrupt-parent!\n");
> +		return -EINVAL;
> +	}
> +
> +	plic_node = of_irq_find_parent(node);
> +	if (!plic_node) {
> +		pr_err("Failed to find the PLIC node!\n");
> +		return -ENXIO;
> +	}
> +

This can be replace with fwnode_find_reference to support ACPI

> +	plic_domain = irq_find_host(plic_node);
> +	of_node_put(plic_node);
> +	if (!plic_domain) {
> +		pr_err("Failed to find the PLIC domain\n");
> +		return -ENXIO;
> +	}
> +

Replace irq_find_host with irq_find_matching_fwnode

> +	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs,
> +						    fwnode,
> +						    &sg2042_msi_middle_domain_ops,
> +						    data);

Use irq_domain_create_hierarchy

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

add a "struct device *dev = &pdev->dev;" here and replace 
&pdev->dev with dev.

> +	struct sg2042_msi_chipdata *data;
> +	struct of_phandle_args args = {};
> +	struct resource *res;
> +	int ret;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
> +	if (IS_ERR(data->reg_clr)) {
> +		dev_err(&pdev->dev, "Failed to map clear register\n");
> +		return PTR_ERR(data->reg_clr);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "doorbell");
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed get resource from set\n");
> +		return -EINVAL;
> +	}
> +	data->doorbell_addr = res->start;
> +

> +	ret = of_parse_phandle_with_args(pdev->dev.of_node, "msi-ranges",
> +					 "#interrupt-cells", 0, &args);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to parse MSI vec base\n");
> +		return ret;
> +	}
> +	data->irq_first = (u32)args.args[0];
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "msi-ranges",
> +					 args.args_count + 1, &data->num_irqs);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to parse MSI vec number\n");
> +		of_node_put(args.np);
> +		return ret;
> +	}
> +	of_node_put(args.np);

this can be replace by calling fwnode_property_get_reference_args
twice. I have found a working example:

ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
					 "#interrupt-cells",
					 0, 0, &args);
if (ret) {
	dev_err(dev, "Unable to parse MSI vec base\n");
	return ret;
}
fwnode_handle_put(args.fwnode);


ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
					 NULL, args.nargs + 1,
					 0, &args);
if (ret) {
	dev_err(dev, "Unable to parse MSI vec number\n");
	return ret;
}

data->irq_first = (u32)args.args[0];
data->num_irqs = (u32)args.args[args.nargs - 1];

fwnode_handle_put(args.fwnode);

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
