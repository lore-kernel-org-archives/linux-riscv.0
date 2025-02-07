Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77157C02196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gwkc0C0uO6gVfO4OIjjy9wgAB/tWykAz06lt7LyCKqc=; b=I0s5l2NiR1pI5u
	AD5Mw8d5wOsGV8DzvRD4xwqAwoKr+hub1UzXbHuDwwJov67jYwvlwdgOstb5zUvcACWwm0xiMxLfk
	VThuJ8OuZ1gAhEmE5my0p9gmn06Q1em0vaHgPU6k1u67ZugBYbVYUKPcfk8auIWTVak6sCZjTCyex
	f0xO6tU5oFRJ6iYStfhjD/6+r5QgzPfH9KRETs3KurvpjAVzNXM39L7GE/kmGcTgBCcqymUGcHy2h
	yErPLsbbQLUAgQTkcwktcyVpY9lzRU6T6M1N0xJw0OV/eIuB69b2TKHYOtJ1QdaEatPu1y1QMx2NQ
	HKJC1oun25zlwTi7UAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgM2g-00000009HPF-3MT5;
	Fri, 07 Feb 2025 10:57:02 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgM2B-00000009HI7-3tT5
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 10:56:33 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 73D1C340CC9;
	Fri, 07 Feb 2025 10:56:28 +0000 (UTC)
Date: Fri, 7 Feb 2025 10:56:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v4 2/4] gpio: spacemit: add support for K1 SoC
Message-ID: <20250207105617-GYC5367@gentoo>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_025631_996138_1A51CEFF 
X-CRM114-Status: GOOD (  22.57  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11:38 Tue 21 Jan     , Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, failing, or both edge type trigger.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/Kconfig            |   7 +
>  drivers/gpio/Makefile           |   1 +
>  drivers/gpio/gpio-spacemit-k1.c | 295 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 303 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 56fee58e281e7cac7f287eb04e4c17a17f75ed04..c153f5439649da020ee42c38e88cb8df31a8e307 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -654,6 +654,13 @@ config GPIO_SNPS_CREG
>  	  where only several fields in register belong to GPIO lines and
>  	  each GPIO line owns a field with different length and on/off value.
>  
> +config GPIO_SPACEMIT_K1
> +	bool "SPACEMIT K1 GPIO support"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to support the SpacemiT's K1 GPIO device.
> +
>  config GPIO_SPEAR_SPICS
>  	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>  	depends on PLAT_SPEAR
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c85a2d382dcfa696 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
>  obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
>  obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
>  obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
> +obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
>  obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
>  obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
>  obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..de0491af494c10f528095efee9b3a140bdcc0b0d
> --- /dev/null
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
omit ..
> +static int spacemit_gpio_get_ports(struct device *dev, struct spacemit_gpio *gpio,
> +				   void __iomem *regs)
> +{
> +	struct spacemit_gpio_port *port;
> +	u32 i = 0, offset;
> +
> +	gpio->nr_ports = device_get_child_node_count(dev);
> +	if (gpio->nr_ports == 0)
> +		return -ENODEV;
> +
> +	gpio->ports = devm_kcalloc(dev, gpio->nr_ports, sizeof(*gpio->ports), GFP_KERNEL);
> +	if (!gpio->ports)
> +		return -ENOMEM;
> +
> +	device_for_each_child_node_scoped(dev, fwnode)  {
> +		port		= &gpio->ports[i];
> +		port->fwnode	= fwnode;
> +		port->index	= i++;
> +
> +		if (fwnode_property_read_u32(fwnode, "reg", &offset))
> +			return -EINVAL;
> +
> +		port->base	= regs + offset;
> +		port->irq	= fwnode_irq_get(fwnode, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int spacemit_gpio_add_port(struct spacemit_gpio *gpio, int index)
> +{
> +	struct spacemit_gpio_port *port;
> +	struct device *dev = gpio->dev;
> +	struct gpio_irq_chip *girq;
> +	void __iomem *dat, *set, *clr, *dirin, *dirout;
> +	int ret;
> +
> +	port = &gpio->ports[index];
> +	port->gpio = gpio;
> +
> +	dat	= port->base + GPLR;
> +	set	= port->base + GPSR;
> +	clr	= port->base + GPCR;
> +	dirin	= port->base + GCDR;
> +	dirout	= port->base + GSDR;
> +
> +	/* This registers 32 GPIO lines per port */
> +	ret = bgpio_init(&port->gc, dev, 4, dat, set, clr, dirout, dirin,
> +			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);

Esmil point out bgpio_init() require a GPIO_GENERIC dependency, will fix it

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
