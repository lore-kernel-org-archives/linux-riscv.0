Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19A0C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 20:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6GAg0quYXjQN3MKZeVSCaGrn4/s/GydT0u8Hj/xZQw=; b=uxOgd3WhMVTsfA
	PGSiLjXudcVJZq23hG4HyDLHbflLo4WdSnjL82AbTqXWFLOliKkcfxk0EWb5c+zr2v+Czs/FunV7y
	03Ss4Aib2/vuKHmtp/I0w26l4JlDY5ehNR16y/iy911yZgBKcwyyVOK6Eq4DXVkmmWC/l3PSHEvOE
	dxzaBKHxm9gdOn4PF+efSwnEtqqUrALR0HU5bhmS+Eb15fGKoBGVbeO8gwFI87mU2zlDMV9/ZX96Q
	Vc2DuQMk81qi7H89c6YW8/V47tKz751p7CFmp9PZ/449KsCbmAVCouKWqiavjwhpWgCksV1itsRdP
	1af8vI0pHI52rgmzO2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJ4F-0000000FTVV-3LqE;
	Mon, 29 Jun 2026 20:58:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJ4B-0000000FTUz-3sn2
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 20:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782766734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vc9TcsGqvwP2sCjfxbHhvEp3jEIy9e292sjunigOY5E=;
	b=POgwaQEQSYsCO0Pn3A5nI7SXmVZ67CpjlqDgeibA8cFpgsp8eN3xacBBpKOtr17E1DbPkg
	CqP4/v9IxO3FikihXQ78ZWUUAsWc8x/pD4V7enAPT2Ue9nOCPkOtkhIihf6JWzcAl6EbFB
	9fRBgCs4qA1jTMRI1RtjSAI/c5gOA+8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-T57aIh0zOKCRa2BIL_U1_g-1; Mon, 29 Jun 2026 16:58:53 -0400
X-MC-Unique: T57aIh0zOKCRa2BIL_U1_g-1
X-Mimecast-MFC-AGG-ID: T57aIh0zOKCRa2BIL_U1_g_1782766733
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec3314f65fso55515336d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 13:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766733; x=1783371533;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vc9TcsGqvwP2sCjfxbHhvEp3jEIy9e292sjunigOY5E=;
        b=gLo9Dlu4vRMVVDoT/IxCrRSTvdppYNj/wSap8EbegvbRNcsPLP3OXoNVSqWd3OJIsk
         3IGsQJPo2Ni+i/HIE7QzNB6f0bYYLNOpOPU2kP6wZcrgTzzyU3pG8DwU9FYVIoH0kAxM
         IaYRWThA/WnU/eXuIk0E1W1jgbX+04Tk89KrEEFIv4tmD6yKD1iC6oqP2WndDsxUXBOp
         FgrvBbjqtw7IJCd9lqNujRqFqsvin+F/1etR6tc4VGcCkwiCoFQS0M7wMmRw+Cqw4OYX
         bS79NnM1PT9OC175zCLIo1Vwweb3Xnv5u5tBA6ylib3UMmx9+0cBvPJ3bqaV46MpQTno
         mP+w==
X-Forwarded-Encrypted: i=1; AHgh+Rrc789XdQgKHEqvz9JXvG6gnlF4An6BxcGosFg9C0Ua1uqI5XO/PtGVRlFH93yvhWbNK179MJjOcKdhUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqbebQg6cdaRL4KSqlyvZppyeNY8Owa9pfrMAIWVQ3HF37DrTM
	HgmbvIA7jRwmuIFxD3AjZ1ucKQR/C5cx2+lOBtgmfvKDv/5jHE3o6Y+4AQ+HdRrW5ZctxPZe5+u
	j9R6jvpI7gql068gNhSiUmDPE4gBRlcFb5D+aw2221B8DMrgWEPJ68xx7L4l74xQyCnsBHQ==
X-Gm-Gg: AfdE7cmElpc9bswGoCbBfxdVMFqbhAk6K0S9NbZhjDhnDgckU1J/bCuFRhlpSDWU9ot
	pxdNhv16XBNOG7SBbXzllKmSSaWzfLnUCUrSwrUzSDywplewD/W7RTDcjgjlkJCFvk4PzQSz8gK
	8qc4UYO2GEdtsXtq+TBbaFL0X69vkzw0GMc/nQfvcKgTjvccwH0fnrozEydzPW9y0FWiIvYo+XJ
	uxe2ZKVmOrjNAK0P19EITtt0CW8HEEMgRkUb/Y7imO+WOUDPdd6RtAhIrCmx8cBvn5Tl+aY6nQk
	VtNFBIoZGzkQ8NioJe3zLzm1uuijFQitYk50I/KEfX7HKFK7dmDnkRjw3gPL2lusMOUoHaG79DH
	xFbM/FjdO2clEMwa3csT/46GMGPqzdrQV82mHQQCJ9gOpWg==
X-Received: by 2002:a05:6214:4709:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8f1ba699fcemr14251656d6.20.1782766732931;
        Mon, 29 Jun 2026 13:58:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4709:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8f1ba699fcemr14251346d6.20.1782766732468;
        Mon, 29 Jun 2026 13:58:52 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a328fed8sm7220026d6.16.2026.06.29.13.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:58:51 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:58:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
Message-ID: <akLcbHYKJfvZzf27@redhat.com>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-4-34f3021aab51@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260514-dr1v90-cru-v5-4-34f3021aab51@pigmoral.tech>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YceWmpQeaUFMbdQEX3JRwU2wEhusagPdhmYdA7Vji3A_1782766733
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_135856_048718_AA3E7DF3 
X-CRM114-Status: GOOD (  30.52  )
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

Hi Philipp,

On Thu, May 14, 2026 at 05:27:20PM +0800, Junhui Liu wrote:
> Add reset controller support for the Anlogic DR1V90 SoC, which is an
> auxiliary device associated with the Clock and Reset Unit (CRU). All
> resets are active-low.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

I don't see a Reviewed-by or Acked-by for you on the reset portion of
this driver.

I'm gathering a pull for Stephen for various clk drivers that were
missed during the last merge window. Does all of this usually go in via
one tree? Or Stephen merges the clk part, you merge the reset portion?
Who usually merges the dts changes?

Thanks,

Brian




> ---
>  drivers/reset/Kconfig        |  10 ++++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-dr1v90.c | 140 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 151 insertions(+)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..0bc1723224a4 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -73,6 +73,16 @@ config RESET_BRCMSTB_RESCAL
>  	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
>  	  BCM7216 or the BCM2712.
>  
> +config RESET_DR1V90
> +	tristate "Anlogic DR1V90 reset controller"
> +	depends on ARCH_ANLOGIC || COMPILE_TEST
> +	depends on ANLOGIC_DR1V90_CRU
> +	select AUXILIARY_BUS
> +	default ARCH_ANLOGIC
> +	help
> +	  This enables the reset controller driver for Anlogic DR1V90 SoCs
> +	  provided by the CRU unit.
> +
>  config RESET_EIC7700
>  	bool "Reset controller driver for ESWIN SoCs"
>  	depends on ARCH_ESWIN || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 3e52569bd276..ab2bbc917b73 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
>  obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
> +obj-$(CONFIG_RESET_DR1V90) += reset-dr1v90.o
>  obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
>  obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
>  obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
> diff --git a/drivers/reset/reset-dr1v90.c b/drivers/reset/reset-dr1v90.c
> new file mode 100644
> index 000000000000..daa99c797b1a
> --- /dev/null
> +++ b/drivers/reset/reset-dr1v90.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/anlogic,dr1v90-cru.h>
> +
> +struct dr1v90_reset_map {
> +	u32 offset;
> +	u32 bit;
> +};
> +
> +struct dr1v90_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +	spinlock_t lock; /* protect register read-modify-write */
> +};
> +
> +static inline struct dr1v90_reset_controller *
> +to_dr1v90_reset_controller(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct dr1v90_reset_controller, rcdev);
> +}
> +
> +static const struct dr1v90_reset_map dr1v90_resets[] = {
> +	[RESET_OCM]		= { 0x74, BIT(4)},
> +	[RESET_QSPI]		= { 0x74, BIT(5)},
> +	[RESET_SMC]		= { 0x74, BIT(6)},
> +	[RESET_WDT]		= { 0x74, BIT(7)},
> +	[RESET_DMAC_AXI]	= { 0x74, BIT(8)},
> +	[RESET_DMAC_AHB]	= { 0x74, BIT(9)},
> +	[RESET_NPU]		= { 0x74, BIT(12)},
> +	[RESET_JPU]		= { 0x74, BIT(13)},
> +	[RESET_DDRBUS]		= { 0x74, BIT(14)},
> +	[RESET_NIC_HP0]		= { 0x78, BIT(0)},
> +	[RESET_NIC_HP1]		= { 0x78, BIT(1)},
> +	[RESET_NIC_GP0M]	= { 0x78, BIT(4)},
> +	[RESET_NIC_GP1M]	= { 0x78, BIT(5)},
> +	[RESET_GPIO]		= { 0x78, BIT(8)},
> +	[RESET_IPC]		= { 0x78, BIT(12)},
> +	[RESET_USB0]		= { 0x7C, BIT(0)},
> +	[RESET_USB1]		= { 0x7C, BIT(1)},
> +	[RESET_GBE0]		= { 0x7C, BIT(4)},
> +	[RESET_GBE1]		= { 0x7C, BIT(5)},
> +	[RESET_SDIO0]		= { 0x7C, BIT(8)},
> +	[RESET_SDIO1]		= { 0x7C, BIT(9)},
> +	[RESET_UART0]		= { 0x7C, BIT(12)},
> +	[RESET_UART1]		= { 0x7C, BIT(13)},
> +	[RESET_SPI0]		= { 0x7C, BIT(16)},
> +	[RESET_SPI1]		= { 0x7C, BIT(17)},
> +	[RESET_CAN0]		= { 0x7C, BIT(20)},
> +	[RESET_CAN1]		= { 0x7C, BIT(21)},
> +	[RESET_TTC0]		= { 0x7C, BIT(24)},
> +	[RESET_TTC1]		= { 0x7C, BIT(25)},
> +	[RESET_I2C0]		= { 0x7C, BIT(28)},
> +	[RESET_I2C1]		= { 0x7C, BIT(29)}
> +};
> +
> +static int dr1v90_reset_control_update(struct reset_controller_dev *rcdev,
> +				       unsigned long id, bool assert)
> +{
> +	struct dr1v90_reset_controller *rstc = to_dr1v90_reset_controller(rcdev);
> +	u32 offset = dr1v90_resets[id].offset;
> +	u32 bit = dr1v90_resets[id].bit;
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&rstc->lock);
> +
> +	reg = readl(rstc->base + offset);
> +	if (assert)
> +		reg &= ~bit;
> +	else
> +		reg |= bit;
> +	writel(reg, rstc->base + offset);
> +
> +	return 0;
> +}
> +
> +static int dr1v90_reset_control_assert(struct reset_controller_dev *rcdev,
> +				       unsigned long id)
> +{
> +	return dr1v90_reset_control_update(rcdev, id, true);
> +}
> +
> +static int dr1v90_reset_control_deassert(struct reset_controller_dev *rcdev,
> +					 unsigned long id)
> +{
> +	return dr1v90_reset_control_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops dr1v90_reset_control_ops = {
> +	.assert = dr1v90_reset_control_assert,
> +	.deassert = dr1v90_reset_control_deassert,
> +};
> +
> +static int dr1v90_reset_probe(struct auxiliary_device *adev,
> +			      const struct auxiliary_device_id *id)
> +{
> +	struct dr1v90_reset_controller *rstc;
> +	struct device *dev = &adev->dev;
> +
> +	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
> +	if (!rstc)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&rstc->lock);
> +
> +	rstc->base = dev->platform_data;
> +	rstc->rcdev.dev = dev;
> +	rstc->rcdev.nr_resets = ARRAY_SIZE(dr1v90_resets);
> +	rstc->rcdev.of_node = dev->parent->of_node;
> +	rstc->rcdev.ops = &dr1v90_reset_control_ops;
> +	rstc->rcdev.owner = THIS_MODULE;
> +
> +	return devm_reset_controller_register(dev, &rstc->rcdev);
> +}
> +
> +static const struct auxiliary_device_id dr1v90_reset_ids[] = {
> +	{
> +		.name = "anlogic_dr1_cru.reset"
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, dr1v90_reset_ids);
> +
> +static struct auxiliary_driver dr1v90_reset_driver = {
> +	.probe = dr1v90_reset_probe,
> +	.id_table = dr1v90_reset_ids,
> +};
> +module_auxiliary_driver(dr1v90_reset_driver);
> +
> +MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
> +MODULE_DESCRIPTION("Anlogic DR1V90 reset controller driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.54.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
