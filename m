Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287DEC02187
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 02:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXHbVIN8zwOYcEbx0dXKXMFd9/OiqolT8KM3aUMUujs=; b=Lwo+qNg6CHPZ8j
	E4TIf0Wun3KWJynGPag3+GkDNEwBO+fE7lPMkR38BVGG0EmOUx97lNucfzXn4RbhqUqptdzqEX2tH
	B8Q83PhwCYcRPU4FssJXxAalnv0FIHcNr2EUkS9jMG4TN2r+mKuG6FGcj9QxCHC1mYPqxA8gBx4E2
	JYQLCcSpPP3BV1iIMKsqQ549JE4gHdbRsCgDgNjKL3OvEzvq+uLdaAqar27B+djCFYqJvJFSLiG3i
	jtzFDFIY9L91h/XTU9Lr9f6GpA07AfIFOxAy5qVT5gpI/us5IP4mbU3ctwkv7e5pFdBAfN2/fireK
	OKs9zxF2bYdIa7QDE6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhmB-00000004cEJ-2trK;
	Mon, 20 Jan 2025 02:44:31 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhm9-00000004cDv-1aet
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 02:44:30 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-467bc28277eso36552231cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 18:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737341068; x=1737945868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl9nu3Qof0PszksDLNRZJf1Z528uEntwflNxxKMJjDU=;
        b=NclOlVMSCNyRyL1+C5cPoDyatc6MJ4qP1nGpmRp0/e60DkHI44PzMSbvZvRNhHeYkC
         13ELKuVermZEX9kQ+FetZkSbSPjEJ6Wzk2WZBbA0b2A0CW6GwjRlhhBwzd8YzuGOXvEY
         QMCGltKq87EB4NzIHiObUSGyV0lrJEW32mtB73yrx4BzRqAsLV3Kk/LyJFLFMVmV7vUX
         Ojwu/V6HDBIzqyNQ6lmuKA4DrzQfH4FovCF/QOfuZp8ywu7sNl5pbRIGYkspg/wmLz2P
         CBClKgFdOzaeF1+/kczgM5d6Z+ixydQHOeOcqS88hQi7hJu0FPbniW0Arh2INTd8QEzW
         hf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737341068; x=1737945868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl9nu3Qof0PszksDLNRZJf1Z528uEntwflNxxKMJjDU=;
        b=KbeYdEnw5s0bCju257br4B3dh3LBGtBvj2r5C0v04aVqmd6cWPhSypL6oqKTk1Zd0r
         EXsTW8iN8OwgnweE/SACymwCmTRNA8SAslu2i65/gQOXMGYrRmh+pNM6eGONlBCW8xUI
         yCQBsyKziCdWY2kJYKPpWJYbdxjaJRrblHio1U52TfwG1HTaVBcCwxYK8Hfz2yCX/0Tu
         zZVc+v05xdDEoSmsPvkUQY5XnNUzEdn1haYhBNbVn7LWsUz2eSuUecpkh3SqSrP967+j
         4Hd4xBFXV5dshMRLesHlxBOeDfiuGRPsU0jaPrakp8Od2plVTxY5Rgg7dtvlGsc5hwHT
         hkBw==
X-Forwarded-Encrypted: i=1; AJvYcCWx5VgCE6iAh75k5OurimzU/mTdGQOmnp8YMhJ6WIafPXf1sn2UagR+epTayFSKbzI2hZWbOQA8lvP5wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwdDEZ9WoD6svmI9by8Hx0dj4cV7MaU1bfh6nYBuobomphMD1s
	NV2mrUikVRZQm2hyQ/DO2T879lHfbREPofM6x7jnak5SCrMHhh6V
X-Gm-Gg: ASbGnctff/HBxTPqNRfPI68hFdZ2e5yPKWUKwg9w7jqTP8A9UdZ1JexfQ1nGfgIJ4hd
	68q/zhICOBDZcnJC7OEH6LqNtGVcsJ7cfWpG14l9SeSkABJegZsj60ydy2b5JtzBpV+ItcYScyY
	4weBVcdJGyZV03ABunaKFMZzGCoAEgtYD+C+x/OpD3XlZaz56joirYKVTq9rLUv9aEDymgcPUeP
	XuFjlnpArlhVJDts8s3Fip3SxtzhHRMB1YQgnNSMbhlJw==
X-Google-Smtp-Source: AGHT+IHkBEqg8JvBQvC+YkoGK3v8otfkaorCKJlA1539WBUvUougLTSjSNTwIZwfkaT5JegkwqXmYA==
X-Received: by 2002:a05:622a:1922:b0:467:8342:d0d5 with SMTP id d75a77b69052e-46e12a0c255mr203518851cf.2.1737341068100;
        Sun, 19 Jan 2025 18:44:28 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-46e1030daadsm37752521cf.39.2025.01.19.18.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 18:44:27 -0800 (PST)
Date: Mon, 20 Jan 2025 10:43:40 +0800
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
Message-ID: <6b4n7jbflkaparryguq2kjdg4bpfy4vgpzucd456awbhl362po@zytqbodpm2wc>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
 <b5c2f13aa94f68c3415a1292678e16db33f291cd.1736921549.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5c2f13aa94f68c3415a1292678e16db33f291cd.1736921549.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_184429_439582_CB8A0FFF 
X-CRM114-Status: GOOD (  33.68  )
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

I think it is just OK to set the flag directly in the msi_parent_ops.

> +static struct msi_parent_ops sg2042_msi_parent_ops = {
> +	.required_flags		= SG2042_MSI_FLAGS_REQUIRED,
> +	.supported_flags	= SG2042_MSI_FLAGS_SUPPORTED,
> +	.bus_select_mask	= MATCH_PCI_MSI,
> +	.bus_select_token	= DOMAIN_BUS_NEXUS,
> +	.prefix			= "SG2042-",
> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
> +};

This struct should be const.

> +
> +static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
> +				   struct device_node *node)
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
> +	plic_domain = irq_find_host(plic_node);
> +	of_node_put(plic_node);
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
> +
> +	mutex_init(&data->msi_map_lock);
> +
> +	return sg2042_msi_init_domains(data, pdev->dev.of_node);
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
