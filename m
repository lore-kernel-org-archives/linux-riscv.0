Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41771E77185
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 23:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=my1XqUfaa0M6AEqhztCoK2lCnpk7lsrZr6h88jrPE2M=; b=UaeWrKBW3jOzcj
	LzTKez+gi3eeJ6BiDx8A6D1AUiM9Vmx8TTRJD0qkaY3wuT9m4hSxrdVljBSgd0axJAVcXVX98okD5
	9h9FuvwIo2K0KEYJ9Ldeu95qL6TzmyIXVfD/sKa7NhuGOWjeQDCe1+e/8ccrMMpnUFvDLdFoTiVSx
	nyHJC68GW2hR2J5Zu/WMPbxRPttR3EDPj4xE3tFjfspqGEsuU0d4XzN+9LbngqJ9OKigCSqqzyLen
	0/CZnFZ6G3JjM0g3zNj8s7jguYhLA6/xE4NGFCJDHh5ME7DkhRo9UiYgrJeYhW0Xd8EByFWR+bPlH
	+DiKM4uUDgMmCjewxIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9VM-0000000D8t0-1HpO;
	Tue, 10 Dec 2024 23:19:00 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9QI-0000000D80S-0wNF
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 23:13:47 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a9cb8460f7so23096025ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2024 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733872424; x=1734477224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CL89FZ8rBs/vPwll11Qly5YiICrNaOtO0zLQ2yHga0E=;
        b=SloQCXhr/4VOp4Cwj+kcDYBXp1jUaOr9LrCSG7gvjxPXjR2LJR8Cqv+WiDxT3pA7+e
         FXbalJp5WOvOkN5YI/LYreF3vn12zAzr24gtlEk9997sH9gd9t8lcuyV95SzihlInWim
         xKoEuer5D+13HzeLMgzpGUL/h4q9GzVBQDVTd90mafKf7yWk7E6LZuEhPxe4twk6wyEd
         mZgmQTzUYCVYcVy0OT7yZ7jCm4ZvWSUL+ct3jJxYJBM7FXeo3dPc8T8QwgGwfxixo6Np
         00vr8DkOHZ5NKbGc9gL4oVevphhNvoZkOzdeS0cxIqjOem130WNQJE/5MzYxTH/TlU2j
         7hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733872424; x=1734477224;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL89FZ8rBs/vPwll11Qly5YiICrNaOtO0zLQ2yHga0E=;
        b=qb8/GSW+t/6CpePKph3q6xPRx2lAvf+/S+MqHODOczm0/VON7cB2fTu5W51Jj1/P0e
         UYnjiNHp6vmRk2N3FkJxGfIfBYeIHJbkB3Oz85natqRTIxM4jT354FQBIUnrK96k39gY
         XUTHbo3vgnsWRbXIsU3g5XDo+gNOeHeAE/90KuN0ZwmJpc8df5C1rl+jd247su4j1WyG
         bDG146PUHLeXHpOV/XpIBb5JFUq6vUwhsZ0whnSeHDIvpnRtwqyCKsPNdQTEkaU085+0
         c0tqe82wFDQohCF2/zJ6RLhYNHu2Vvau1b+Bm7ArWq9jxMLN8EsmyDpKiC+rcnkElvQs
         /1xA==
X-Forwarded-Encrypted: i=1; AJvYcCWRyC2PFDfq/9Yluvx6aPWXDToOUFafrJg/EELqMBulz+rgu2V0c20PxeSZK/COYvnC9ru27uVCsYGL/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/fYGPLSOJzASQt3zhy3ycDx6Beau5VxTGkmNq8PoiCS6Bq2SI
	xlXaCArU2xT66qnO+sMKFxiTFX0g3oAdXRcGbHMUapNSLzBs9vsrGLDk4hPTwg8=
X-Gm-Gg: ASbGnct09YFLnDs3d76F7QbKbp9OwmJHDrSPx7rIDsOPEhIBNLmBSzRtoYwtKkOhcxW
	lhT7QZRTDi60F/lbPBY05mRXkxi/Zk6siZIGRvh1sguJgdWOurvzDXyIpIEdwAv3BBEMnkBvQ1w
	HF92WPmxcQ1rHy2kiuDFFBLW6Xuj2yhqKtGurM8ngyI9ImMffymVSN7bMcE4vUWv43dhLDcQ8NP
	kW+S+DuWa4HHMoZ/QmyPmRCzBsLch2Iy/ADEj2Lf8OmAe6VNaC6ud6QA9ezkwlT+DV/NWYkSw==
X-Google-Smtp-Source: AGHT+IH1cttf0zqTC0279H5IuBIHzNpxFxo+epqYyGKe/aICDB9M4Sg5fC7b1/xKO4o9a8pr3YLVfA==
X-Received: by 2002:a05:6e02:1989:b0:3a7:8720:9e9f with SMTP id e9e14a558f8ab-3aa05010f82mr8620605ab.2.1733872424415;
        Tue, 10 Dec 2024 15:13:44 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2b93355aesm1573785173.46.2024.12.10.15.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 15:13:43 -0800 (PST)
Message-ID: <51757598-18c5-4b44-b11a-54db07384131@sifive.com>
Date: Tue, 10 Dec 2024 17:13:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
To: Chen Wang <unicornxw@gmail.com>
References: <cover.1733726057.git.unicorn_wang@outlook.com>
 <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 unicorn_wang@outlook.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
In-Reply-To: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_151346_286249_20370BD0 
X-CRM114-Status: GOOD (  30.89  )
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

On 2024-12-09 1:12 AM, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add driver for Sophgo SG2042 MSI interrupt controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/irqchip/Kconfig          |  12 ++
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-sg2042-msi.c | 285 +++++++++++++++++++++++++++++++
>  3 files changed, 298 insertions(+)
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
> index 000000000000..495ee2b45eb2
> --- /dev/null
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -0,0 +1,285 @@
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
> +#define SG2042_VECTOR_MIN	64
> +#define SG2042_VECTOR_MAX	95
> +
> +struct sg2042_msi_data {
> +	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
> +
> +	u64		doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
> +
> +	u32		irq_first;	// The vector number that MSIs starts
> +	u32		num_irqs;	// The number of vectors for MSIs
> +
> +	unsigned long	*msi_map;
> +	struct mutex	msi_map_lock;	// lock for msi_map
> +};
> +
> +static int sg2042_msi_allocate_hwirq(struct sg2042_msi_data *priv, int num_req)
> +{
> +	int first;
> +
> +	guard(mutex)(&priv->msi_map_lock);
> +	first = bitmap_find_free_region(priv->msi_map, priv->num_irqs,
> +					get_count_order(num_req));
> +	return first >= 0 ? priv->irq_first + first : -ENOSPC;

How does this work? The irqdomain is instantiated with size == priv->num_irqs,
so hwirqs must be less than priv->num_irqs. It also quite simplifies the code
for hwirq be a number between 0 and priv->num_irqs. You only need to apply the
offset when allocating the parent IRQ:

	fwspec.param[0] = priv->irq_first + hwirq;

> +}
> +
> +static void sg2042_msi_free_hwirq(struct sg2042_msi_data *priv,
> +				  int hwirq, int num_req)
> +{
> +	int first = hwirq - priv->irq_first;
> +
> +	guard(mutex)(&priv->msi_map_lock);
> +	bitmap_release_region(priv->msi_map, first, get_count_order(num_req));
> +}
> +
> +static void sg2042_msi_irq_ack(struct irq_data *d)
> +{
> +	struct sg2042_msi_data *data  = irq_data_get_irq_chip_data(d);
> +	int bit_off = d->hwirq - data->irq_first;
> +
> +	writel(1 << bit_off, (unsigned int *)data->reg_clr);
> +
> +	irq_chip_ack_parent(d);
> +}
> +
> +static void sg2042_msi_irq_compose_msi_msg(struct irq_data *data,
> +					   struct msi_msg *msg)
> +{
> +	struct sg2042_msi_data *priv = irq_data_get_irq_chip_data(data);
> +
> +	msg->address_hi = upper_32_bits(priv->doorbell_addr);
> +	msg->address_lo = lower_32_bits(priv->doorbell_addr);
> +	msg->data = 1 << (data->hwirq - priv->irq_first);
> +
> +	pr_debug("%s hwirq[%ld]: address_hi[%#x], address_lo[%#x], data[%#x]\n",
> +		 __func__, data->hwirq, msg->address_hi, msg->address_lo, msg->data);
> +}
> +
> +static struct irq_chip sg2042_msi_middle_irq_chip = {
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
> +	struct irq_fwspec fwspec;
> +	struct irq_data *d;
> +	int ret;
> +
> +	fwspec.fwnode = domain->parent->fwnode;
> +	fwspec.param_count = 2;
> +	fwspec.param[0] = hwirq;
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
> +	struct sg2042_msi_data *priv = domain->host_data;
> +	int hwirq, err, i;
> +
> +	hwirq = sg2042_msi_allocate_hwirq(priv, nr_irqs);
> +	if (hwirq < 0)
> +		return hwirq;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
> +		if (err)
> +			goto err_hwirq;
> +
> +		pr_debug("%s: virq[%d], hwirq[%d]\n", __func__, virq + i, hwirq + i);
> +
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +					      &sg2042_msi_middle_irq_chip, priv);
> +	}
> +
> +	return 0;
> +
> +err_hwirq:
> +	sg2042_msi_free_hwirq(priv, hwirq, nr_irqs);
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
> +	struct sg2042_msi_data *priv = irq_data_get_irq_chip_data(d);
> +
> +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> +	sg2042_msi_free_hwirq(priv, d->hwirq, nr_irqs);
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
> +static int sg2042_msi_init_domains(struct sg2042_msi_data *priv,
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
> +	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, priv->num_irqs,
> +						    fwnode,
> +						    &sg2042_msi_middle_domain_ops,
> +						    priv);
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
> +	struct of_phandle_args args = {};
> +	struct sg2042_msi_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(struct sg2042_msi_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
> +	if (IS_ERR(data->reg_clr)) {
> +		dev_err(&pdev->dev, "Failed to map clear register\n");
> +		return PTR_ERR(data->reg_clr);
> +	}
> +
> +	if (of_property_read_u64(pdev->dev.of_node, "sophgo,msi-doorbell-addr",
> +				 &data->doorbell_addr)) {
> +		dev_err(&pdev->dev, "Unable to parse MSI doorbell addr\n");
> +		return -EINVAL;
> +	}
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
> +		return ret;
> +	}
> +
> +	if (data->irq_first < SG2042_VECTOR_MIN ||
> +	    (data->irq_first + data->num_irqs - 1) > SG2042_VECTOR_MAX) {
> +		dev_err(&pdev->dev, "msi-ranges is incorrect!\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_init(&data->msi_map_lock);
> +
> +	data->msi_map = bitmap_zalloc(data->num_irqs, GFP_KERNEL);
> +	if (!data->msi_map)
> +		return -ENOMEM;
> +
> +	ret = sg2042_msi_init_domains(data, pdev->dev.of_node);
> +	if (ret)
> +		bitmap_free(data->msi_map);
> +
> +	return ret;
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
> +		.of_match_table	= of_match_ptr(sg2042_msi_of_match),
> +	},
> +	.probe = sg2042_msi_probe,
> +};
> +builtin_platform_driver(sg2042_msi_driver);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
