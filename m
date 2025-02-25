Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098A7C021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 23:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7o/4U6Uu3CBuSjJ+Kl1/QZfKzxrcWrZEQwlYiMClGZs=; b=2/sqI63cmy8oWvMt8pnQg8uLUz
	+5xzrQi0J3YrBN0No37lj5oYRl82/OzVI7GRYmMY74T00nvk5lHqD3aWPl5g7T5uXiIg7NjECWNf8
	VTPdJOyivqMmOizUMiNSVuvcCJJUUi2Pd8kWgRg/BlXLD8WUQ734B34VEW4T1N6mf600dFBIdDBMQ
	T0oYW2iS+wBwp0rTV/kmYKF5lKLHUpex+VMe7BjTlrp8Aeh+/Bks7i+n5GJj4kDcxP65osC68DRH2
	dN8MVUH5o3jHOVLI9l26AZdsXqD8ZUMSfLqu4aiulEkwNkroc+am6OESZfamAwWVb+e44FmGvrL2t
	EbDc5FLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4YN-00000001oVu-0YBW;
	Tue, 25 Feb 2025 23:41:31 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4YJ-00000001oVR-0VEM
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 23:41:29 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-855a095094fso170037339f.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 15:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1740526884; x=1741131684; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHaj9gvBk8zG1gGIlEStQCmYqgUrifgWPrJTCoeAM04=;
        b=ZDfKm7mhsRrbzOkvrO0L61H9ObjPOrkHKcRxXBGxnt4GFY3a4CLw+NesgkpYH3H2HT
         bu0p2QDblCNZn01p2yNUohB4PN2/CdqMtWiJda1WeX3yjLse7B9HLrHoZ0QyIqbEH5Uk
         Se40gKLA1UnV2mHqww/3VieBhAEU8TtYE8jbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740526884; x=1741131684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHaj9gvBk8zG1gGIlEStQCmYqgUrifgWPrJTCoeAM04=;
        b=o1ULqDuuBAnA4RYk9EJCWB+TQetVsv3POW0iJ4pS17oL9Lrn4f7mtlALZKkQHjROXc
         JEh4kuxtz2e1Ic+yeNGq3gQKaEfJGkM7n+BSZe5bh5bYElFnlZSmyq5OsHJFLcRQAt6G
         bFm9KmDzOMUznBXHbgcGqhhK20168ADAa1kJX6ezRTRV5ZhJIXhzEfIn17QTr7H2PMGr
         buKZKE642cc34+rapQqpncwtIyi7kfaIuJYoiSaP4V3QbnfRkkDxMKuH59gUgdIX5wC7
         GiQbkitt0l0mww5wZMakWvQzOc3YjqdqZh1BjxwH9piPzEEp1DZcSHrgswuuVlcVqL2b
         8UWA==
X-Forwarded-Encrypted: i=1; AJvYcCUwOx99D6uxA21hstFaj0jdCFNXexIW6QGcDzLyGjsJQlpIgJEyrDBF5vCpiKPyQlgbJRoWOi83lgOPDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXILEAfFMp4eFh7r0mmPSQ+KTBt5yTYWUf4FRnDX5uvRxit0HC
	zJ9ct9Kigo5hxMz3DtxHASobw7RMG8OVl0S6CQrwZ+/YFq5r6P65fDVaVKlppg==
X-Gm-Gg: ASbGncuDZl4UL0d0yHfjet0/G0Ph1AQbV5tBRcox8fzNEmFV3PWAeZliE0kzdt8yi6+
	2FFQ+Y1HsOd/Wjme2iWimbw2ardC2EKGJlrfHp0mi2axqM9kXGbJsbuulKFBCkjXeTw8x29P091
	2Rqq+S07IPZL2ew2P/R+lslOAI0S1ILGjr0KkGWraOxiCfKpZuhyvnnkEUPhopCs92fOSNWQUj0
	AoKXHvehYaXj7+pwspM9WswuLm5eR1iUNQsld+sqf4J1gc02oRw5ZTZeoucxem8bkpNRh8VUPI4
	OXJ1aMmjorWclRvwx522ss67l+IrP/Fr5jW+Kx2e04tRMzg3GEnK8nJ4cLpX
X-Google-Smtp-Source: AGHT+IELLUqvdHtIjF5ex7T70YIAG/gx6Cyym6wtg7dAB0E9NnbIVc9NER59uaYfyzMZJTQ3DMqU6w==
X-Received: by 2002:a05:6602:6d05:b0:84f:2929:5ec0 with SMTP id ca18e2360f4ac-857c176b95cmr154503239f.4.1740526884172;
        Tue, 25 Feb 2025 15:41:24 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f04747aed8sm643964173.52.2025.02.25.15.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 15:41:23 -0800 (PST)
Message-ID: <e2e65a3a-fa42-4bdf-9e6d-9122d5fc07bf@ieee.org>
Date: Tue, 25 Feb 2025 17:41:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
 <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_154127_310877_AD7CC330 
X-CRM114-Status: GOOD (  32.66  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/23/25 5:49 AM, Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, falling, or both edge type trigger.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

This looks very good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/gpio/Kconfig            |   8 ++
>   drivers/gpio/Makefile           |   1 +
>   drivers/gpio/gpio-spacemit-k1.c | 277 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 286 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index add5ad29a673c09082a913cb2404073b2034af48..eaae729eec00a3d6d2b83769aed3e2b0ca9927e5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -655,6 +655,14 @@ config GPIO_SNPS_CREG
>   	  where only several fields in register belong to GPIO lines and
>   	  each GPIO line owns a field with different length and on/off value.
>   
> +config GPIO_SPACEMIT_K1
> +	bool "SPACEMIT K1 GPIO support"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF_GPIO
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to support the SpacemiT's K1 GPIO device.
> +
>   config GPIO_SPEAR_SPICS
>   	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>   	depends on PLAT_SPEAR
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c85a2d382dcfa696 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
>   obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
>   obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
>   obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
> +obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
>   obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
>   obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
>   obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d9a0a10cf76d9b886970753296ce7f4174246f8c
> --- /dev/null
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +
> +/* register offset */
> +#define SPACEMIT_GPLR		0x00 /* port level - R */
> +#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
> +#define SPACEMIT_GPSR		0x18 /* port set - W */
> +#define SPACEMIT_GPCR		0x24 /* port clear - W */
> +#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
> +#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
> +#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
> +#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
> +#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
> +#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
> +#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
> +#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
> +#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
> +#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
> +
> +#define SPACEMIT_NR_BANKS		4
> +#define SPACEMIT_NR_GPIOS_PER_BANK	32
> +
> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> +
> +struct spacemit_gpio;
> +
> +struct spacemit_gpio_bank {
> +	struct gpio_chip gc;
> +	struct spacemit_gpio *sg;
> +	void __iomem *base;
> +	u32 irq_mask;
> +	u32 irq_rising_edge;
> +	u32 irq_falling_edge;
> +};
> +
> +struct spacemit_gpio {
> +	struct device *dev;
> +	struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
> +};
> +
> +static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
> +{
> +	return (u32)(gb - gb->sg->sgb);
> +}
> +
> +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> +{
> +	struct spacemit_gpio_bank *gb = dev_id;
> +	unsigned long pending;
> +	u32 n, gedr;
> +
> +	gedr = readl(gb->base + SPACEMIT_GEDR);
> +	if (!gedr)
> +		return IRQ_NONE;
> +	writel(gedr, gb->base + SPACEMIT_GEDR);
> +
> +	pending = gedr & gb->irq_mask;
> +	if (!pending)
> +		return IRQ_NONE;
> +
> +	for_each_set_bit(n, &pending, BITS_PER_LONG)
> +		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void spacemit_gpio_irq_ack(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +
> +	writel(BIT(irqd_to_hwirq(d)), gb->base + SPACEMIT_GEDR);
> +}
> +
> +static void spacemit_gpio_irq_mask(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	gb->irq_mask &= ~bit;
> +	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
> +
> +	if (bit & gb->irq_rising_edge)
> +		writel(bit, gb->base + SPACEMIT_GCRER);
> +
> +	if (bit & gb->irq_falling_edge)
> +		writel(bit, gb->base + SPACEMIT_GCFER);
> +}
> +
> +static void spacemit_gpio_irq_unmask(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	gb->irq_mask |= bit;
> +
> +	if (bit & gb->irq_rising_edge)
> +		writel(bit, gb->base + SPACEMIT_GSRER);
> +
> +	if (bit & gb->irq_falling_edge)
> +		writel(bit, gb->base + SPACEMIT_GSFER);
> +
> +	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
> +}
> +
> +static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	if (type & IRQ_TYPE_EDGE_RISING) {
> +		gb->irq_rising_edge |= bit;
> +		writel(bit, gb->base + SPACEMIT_GSRER);
> +	} else {
> +		gb->irq_rising_edge &= ~bit;
> +		writel(bit, gb->base + SPACEMIT_GCRER);
> +	}
> +
> +	if (type & IRQ_TYPE_EDGE_FALLING) {
> +		gb->irq_falling_edge |= bit;
> +		writel(bit, gb->base + SPACEMIT_GSFER);
> +	} else {
> +		gb->irq_falling_edge &= ~bit;
> +		writel(bit, gb->base + SPACEMIT_GCFER);
> +	}
> +
> +	return 0;
> +}
> +
> +static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
> +
> +	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
> +}
> +
> +static struct irq_chip spacemit_gpio_chip = {
> +	.name		= "k1-gpio-irqchip",
> +	.irq_ack	= spacemit_gpio_irq_ack,
> +	.irq_mask	= spacemit_gpio_irq_mask,
> +	.irq_unmask	= spacemit_gpio_irq_unmask,
> +	.irq_set_type	= spacemit_gpio_irq_set_type,
> +	.irq_print_chip	= spacemit_gpio_irq_print_chip,
> +	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SKIP_SET_WAKE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i)
> +{
> +	struct spacemit_gpio_bank *gb = gpiochip_get_data(gc);
> +	struct spacemit_gpio *sg = gb->sg;
> +
> +	if (i >= SPACEMIT_NR_BANKS)
> +		return false;
> +
> +	return gc == &sg->sgb[i].gc;
> +}
> +
> +static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
> +				  void __iomem *regs,
> +				  int index, int irq)
> +{
> +	struct spacemit_gpio_bank *gb = &sg->sgb[index];
> +	struct gpio_chip *gc = &gb->gc;
> +	struct device *dev = sg->dev;
> +	struct gpio_irq_chip *girq;
> +	void __iomem *dat, *set, *clr, *dirin, *dirout;
> +	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
> +
> +	gb->base = regs + bank_base[index];
> +
> +	dat	= gb->base + SPACEMIT_GPLR;
> +	set	= gb->base + SPACEMIT_GPSR;
> +	clr	= gb->base + SPACEMIT_GPCR;
> +	dirin	= gb->base + SPACEMIT_GCDR;
> +	dirout	= gb->base + SPACEMIT_GSDR;
> +
> +	/* This registers 32 GPIO lines per bank */
> +	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
> +			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
> +
> +	gb->sg = sg;
> +
> +	gc->label		= dev_name(dev);
> +	gc->request		= gpiochip_generic_request;
> +	gc->free		= gpiochip_generic_free;
> +	gc->ngpio		= SPACEMIT_NR_GPIOS_PER_BANK;
> +	gc->base		= -1;
> +	gc->of_gpio_n_cells	= 3;
> +	gc->of_node_instance_match = spacemit_of_node_instance_match;
> +
> +	girq			= &gc->irq;
> +	girq->threaded		= true;
> +	girq->handler		= handle_simple_irq;
> +
> +	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
> +
> +	/* Disable Interrupt */
> +	writel(0, gb->base + SPACEMIT_GAPMASK);
> +	/* Disable Edge Detection Settings */
> +	writel(0x0, gb->base + SPACEMIT_GRER);
> +	writel(0x0, gb->base + SPACEMIT_GFER);
> +	/* Clear Interrupt */
> +	writel(0xffffffff, gb->base + SPACEMIT_GCRER);
> +	writel(0xffffffff, gb->base + SPACEMIT_GCFER);
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					spacemit_gpio_irq_handler,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					gb->gc.label, gb);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to register IRQ\n");
> +
> +	return devm_gpiochip_add_data(dev, gc, gb);
> +}
> +
> +static int spacemit_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_gpio *sg;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int i, irq, ret;
> +
> +	sg = devm_kzalloc(dev, sizeof(*sg), GFP_KERNEL);
> +	if (!sg)
> +		return -ENOMEM;
> +
> +	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	sg->dev	= dev;
> +
> +	for (i = 0; i < SPACEMIT_NR_BANKS; i++) {
> +		ret = spacemit_gpio_add_bank(sg, regs, i, irq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id spacemit_gpio_dt_ids[] = {
> +	{ .compatible = "spacemit,k1-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver spacemit_gpio_driver = {
> +	.probe		= spacemit_gpio_probe,
> +	.driver		= {
> +		.name	= "k1-gpio",
> +		.of_match_table = spacemit_gpio_dt_ids,
> +	},
> +};
> +module_platform_driver(spacemit_gpio_driver);
> +
> +MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
> +MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
> +MODULE_LICENSE("GPL");
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
