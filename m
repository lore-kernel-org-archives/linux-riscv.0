Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B0C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaD36wR3sbq1+IGfPXGkY5aWyANG8Vi0acLzEFqxl5g=; b=B7Ik13QrQLojEb
	LdlIXAgd6QLB7grOmd1gVBG24tf3enEOnb/zAMJM3oMheFeSmZ7VBMz1fQezY5vISyoXC73tKChfo
	FxN9B8C5TTVqpuXdubo+JYbwZeB/WQbxTfBT2MANg/bkBaWz1tWAbPPQWaMUs8z8OryumaXz6DaGl
	WzwqJXBPstn23y7vDjvv7WBPN4YkBLTdefuN59zDPNKW72I4TuqNuJDJJpPjYVoaqvBaJen9h/DBF
	0OaHAemwchpgoVp9kKCDn3ZzQ3awE5rknx4uxYV8s4kMennm/Su+HrEKhNbIhOXDxOceUm4pIatJB
	hjNd2DcfWAITqHJUedUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN3r-00000008ZTO-0gyy;
	Mon, 12 May 2025 06:54:51 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMzd-00000008Yvk-0BQZ
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 06:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747032629; x=1778568629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rpwMv2y5lJIMTCuyi92paGgTBZ+I6o4sAEGRlxKoMIk=;
  b=YxGMu0YCVggno+L2eyLanMQ3LZ4ITsaXV/PDzckVOLEaoRBlGmjLJ59Y
   aG5dbDcIuxBltte68qgVHGvp83sF2grC5W5WhzOZIlyetCoWyJNznd6ye
   gNx+zVMtCJ+IhNVB7TsGaoF1KI6g3ega8//Hra+KQA2zTlMqD4iGH86Qh
   q7QM2unTJFX1mBfI2fBBBHsHt+29n20V7xQ4U7z7mEliff07rTqnf9cXs
   CGmauLoPOT/YC5bGISJkH095j8JoVX0ww4Dd8/5l3bFlfGYBp2TTpVRjm
   XGV6QGLuBC9KAxpi4dbqMr4HYSkDO5TUquzycUZjJ7vIG6KLcCx5qhRgd
   w==;
X-CSE-ConnectionGUID: 7QbmecXJSxSJMQxL8LcWFQ==
X-CSE-MsgGUID: rpt/vbYvR4yAuTdAfyMMVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52626359"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="52626359"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:50:27 -0700
X-CSE-ConnectionGUID: zTNUU3H2QJ+U/O/rAvYgXA==
X-CSE-MsgGUID: N9xxRReTSjSo9U4ytmnxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142488645"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:50:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEMzR-00000000q6E-1z14;
	Mon, 12 May 2025 09:50:17 +0300
Date: Mon, 12 May 2025 09:50:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
Message-ID: <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-14-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_235029_219753_77DAF7B6 
X-CRM114-Status: GOOD (  28.49  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 11, 2025 at 07:09:29PM +0530, Anup Patel wrote:
> The RPMI specification defines a system MSI service group which
> allows application processors to receive MSIs upon system events
> such as graceful shutdown/reboot request, CPU hotplug event, memory
> hotplug event, etc.
> 
> Add an irqchip driver for the RISC-V RPMI system MSI service group
> to directly receive system MSIs in Linux kernel.

...

> +/*
> + * Copyright (C) 2025 Ventana Micro Systems Inc.
> + */

It can occupy a single line instead of 3 LoCs.

...

> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cpu.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqchip.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/smp.h>

+ types.h

Actually this one is most clean, the rest of the patches where the new code
is introduced has semi-random list of the inclusions, please, follow the IWYU
principle.

...

> +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
> +	int ret;
> +
> +	ret = rpmi_sysmsi_set_msi_state(priv, d->hwirq, 0);

Please, use the respective getter and the type:

	irq_hw_number_t hwirq = irqd_to_hwirq(d);

Ditto for all other similar cases.

> +	if (ret) {
> +		dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n",
> +			 (u32)d->hwirq, ret);

No, this is wrong in two ways: usage of specified for signed value and
passing the unsigned; using explicit casting to something unsigned.
Instead ofa the explicit casting, find the best formatting specifier
and use it.

Ditto for  all your code.

> +	}
> +	irq_chip_mask_parent(d);
> +}

...

> +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rpmi_sysmsi_priv *priv;
> +	int rc;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	/* Setup mailbox client */
> +	priv->client.dev		= priv->dev;
> +	priv->client.rx_callback	= NULL;
> +	priv->client.tx_block		= false;
> +	priv->client.knows_txdone	= true;
> +	priv->client.tx_tout		= 0;
> +
> +	/* Request mailbox channel */
> +	priv->chan = mbox_request_channel(&priv->client, 0);
> +	if (IS_ERR(priv->chan))
> +		return PTR_ERR(priv->chan);
> +
> +	/* Get number of system MSIs */
> +	rc = rpmi_sysmsi_get_num_msi(priv);
> +	if (rc < 1) {
> +		mbox_free_channel(priv->chan);
> +		return dev_err_probe(dev, -ENODEV, "No system MSIs found\n");

Can rc be negative holding an error code? If so, why does the code shadow that?

> +	}
> +	priv->nr_irqs = rc;
> +
> +	/* Set the device MSI domain if not available */
> +	if (!dev_get_msi_domain(dev)) {
> +		/*
> +		 * The device MSI domain for OF devices is only set at the
> +		 * time of populating/creating OF device. If the device MSI
> +		 * domain is discovered later after the OF device is created
> +		 * then we need to set it explicitly before using any platform
> +		 * MSI functions.
> +		 */
> +		if (is_of_node(dev_fwnode(dev)))
> +			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +
> +		if (!dev_get_msi_domain(dev))
> +			return -EPROBE_DEFER;
> +	}
> +
> +	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> +					  &rpmi_sysmsi_template,
> +					  priv->nr_irqs, priv, priv))
> +		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
> +
> +	dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
> +	return 0;
> +}

...

> +/** RPMI system MSI service IDs */

Why does this have a kernel-doc marker?

> +enum rpmi_sysmsi_service_id {
> +	RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION = 0x01,
> +	RPMI_SYSMSI_SRV_GET_ATTRIBUTES = 0x2,
> +	RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES = 0x3,
> +	RPMI_SYSMSI_SRV_SET_MSI_STATE = 0x4,
> +	RPMI_SYSMSI_SRV_GET_MSI_STATE = 0x5,
> +	RPMI_SYSMSI_SRV_SET_MSI_TARGET = 0x6,
> +	RPMI_SYSMSI_SRV_GET_MSI_TARGET = 0x7,

Please, be consistent in the style of values.

> +	RPMI_SYSMSI_SRV_ID_MAX_COUNT,

No comma in the terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
