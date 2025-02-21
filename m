Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C3EC021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 17:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lv8ggQuwurYJZpN6eAegOsemMiTIAV0MALDer/6d7nY=; b=C0Vz069nyrC0vTQnaKdfb5g4Ln
	1YwzjzxB4Y7V0dN6q/s8rRHVc3x9pKZlNF8GPqWNtbRd7JxgvDa2MsndMsMqTb/Yb2wN6UKUCvAJV
	SnU8W0XfJ1GvdSPcSpAg/3NU8dN/n5ZLqvr0orObbjoy/xRBARsYVD7Sc/i/3dw5OMR6FJvRD4796
	5FnjrNCYlnPg57nCLFrwlqg8LZHaGiUFi+vLqbd2/p3XfH692hLbjUitiPHYrIjWteTw6pfLzbrTH
	i/xetAXv4cU0uQC5OVS0NaiW3sJuVJmRXSsNyBfEHW43KXbVZVElQ35ihCY4ZSfFYz0Ht0ahKRkBg
	2JbfNByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWo0-00000006NIp-070o;
	Fri, 21 Feb 2025 17:27:16 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWnx-00000006NH9-0xaI
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 17:27:14 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d193fc345aso7878885ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1740158830; x=1740763630; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p/1Lh3fecHVfcz1OFW2Ia1cbUJbEsHA/guYiKZIMOM=;
        b=K2L0tEQgE4pxVNoDBBaxfIjRfI+qVNFoWZtY4mfIibYaj8h/Xlnmfm/3IBH7Lkbl6y
         6xQmT8RzDtda4zj9YyFxFNcKdGJoAGl01xkDgeyG21aDmr99X+2TAErzU9Aom2S0sGQu
         7u39KrvVTrRu5oxgOMVv2GEe80986ZCjH2oBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740158830; x=1740763630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8p/1Lh3fecHVfcz1OFW2Ia1cbUJbEsHA/guYiKZIMOM=;
        b=dWf0G79/aHMhD1hY2m0wAPmqRWLGNP6lSqzRYCtbTsE2f9OrTUfb5+2cl1qLZb9j+i
         fNEu4Ay9SeE1C0sIJFI7dm+hcdvvFT8/EaJtwfstcITv/+dYZDDxAWTvBCz12HaQ9MBu
         RCb6C7q/NynC49M3kFOK2l43MTfK1kuHtL3e9doJZ2sj40ToeZ5o3/zquVbfKvj43Q/d
         zuYOWgAoSK6jm/oPZQeUpwAEImU2Af87Vsxnx/P4iXh9Hv7rRQjCGmhpgUHNaW4WoZcX
         ZE5yFGA+ZsknDZA4pPDHvAgpVf5bOZXjR19NYi/eVVt0BFmP3wNRrwp38EUv9xai4TvR
         DAhA==
X-Forwarded-Encrypted: i=1; AJvYcCVNRtOQ1sz9u/8Rb29e5ldUHUfmEOEkqJJMrDckpxq+V2UpL7wm/kn7imVjNtb4rQDR/Yw+9RMJgZsBuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeDoP1MeAxkYO1PtJhTcnjCqStHFX+OQn26H/kDeIUQYswoCXa
	p1vWgykzIh5jnQdcgV3Oea5RbZXVobyeCrTFDh590s4pjnAlq1qSLBAXumNzF2QT46lwScaabBL
	Ouw==
X-Gm-Gg: ASbGncvV4pohCd8sieSAJUrzlLPT/uw1CdV1uyBaFpzGJrATIa8z3lz7NEctAig/SFN
	vcN8VrSif9nx7yUQZHqA5FZcdGdS4+yQL9JalPo2tX6OgYYXCfQptXeb5qDsmv4FpUqslqsXLUJ
	yf7AG9i0JVZgQEpOSQcfv56bV7HC2w2Ls/sBI4OSFFAeFM+8ykmuAB+TQMswmxRxgEwQrbvd1La
	KCAG5suWNwC1pJOss0G0qBwi3hpFhZm+27bE6g9CXr/o3xaDjvtzpONny+Oz+SK8HoKywYAqYkC
	8ohuaQrrgg1dBAfyqWeG+v1b6FrlDYqkVla9UMebMIbVErOgeh8076WSlo7w
X-Google-Smtp-Source: AGHT+IGi+515wg4KsB8DMgYH/D3am5w2JvsQXTqdyeiRKZuazAKSl5XuTW93qOEaDCycL823TFbpaQ==
X-Received: by 2002:a05:6e02:1a4d:b0:3cf:bb11:a3a7 with SMTP id e9e14a558f8ab-3d2caee673amr37889695ab.17.1740158830238;
        Fri, 21 Feb 2025 09:27:10 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d2ab3b67c1sm18701325ab.63.2025.02.21.09.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:27:09 -0800 (PST)
Message-ID: <8dd08731-8f50-4599-8d18-873b7f594dee@ieee.org>
Date: Fri, 21 Feb 2025 11:27:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_092713_287103_384CB4FF 
X-CRM114-Status: GOOD (  42.00  )
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

On 2/17/25 6:57 AM, Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, failing, or both edge type trigger.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

This looks nicer!

I have some more comments, but they're pretty minor.

> ---
>   drivers/gpio/Kconfig            |   8 +
>   drivers/gpio/Makefile           |   1 +
>   drivers/gpio/gpio-spacemit-k1.c | 376 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 385 insertions(+)
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
> index 0000000000000000000000000000000000000000..f72511b5ab8f8f0b1d1c9e89d2f9ca07b623a866
> --- /dev/null
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/property.h>
> +#include <linux/seq_file.h>
> +#include <linux/module.h>
> +
> +#include "gpiolib.h"
> +
> +/* register offset */

The comments are great, but I think I'd like to see them be abbreviated
further and added to the right of the definitions, if you can do that.

I think you can drop "GPIO" and "register" in each one of them, and
that might get you close to an 80 column limit.  See what you can do.

> +/* GPIO port level register */

I think the port level register is read-only, and you didn't include
that annotation.

> +#define GPLR		0x00
> +/* GPIO port direction register - R/W */
> +#define GPDR		0x0c
> +/* GPIO port set register - W */
> +#define GPSR		0x18
> +/* GPIO port clear register - W */
> +#define GPCR		0x24
> +/* GPIO port rising edge register R/W */
> +#define GRER		0x30
> +/* GPIO port falling edge register R/W */
> +#define GFER		0x3c
> +/* GPIO edge detect status register - R/W1C */
> +#define GEDR		0x48
> +/*  GPIO (set) direction register - W */

Delete the extra space above.

> +#define GSDR		0x54
> +/* GPIO (clear) direction register - W */
> +#define GCDR		0x60
> +/* GPIO (set) rising edge detect enable register - W */
> +#define GSRER		0x6c
> +/* GPIO (clear) rising edge detect enable register - W */
> +#define GCRER		0x78
> +/* GPIO (set) falling edge detect enable register - W */
> +#define GSFER		0x84
> +/* GPIO (clear) falling edge detect enable register - W */
> +#define GCFER		0x90
> +/* GPIO interrupt mask register, 0 disable, 1 enable - R/W */
> +#define GAPMASK		0x9c
> +
> +#define NR_BANKS		4
> +#define NR_GPIOS_PER_BANK	32
> +
> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> +
> +struct spacemit_gpio;
> +
> +struct spacemit_gpio_bank {
> +	struct gpio_chip		gc;
> +	struct spacemit_gpio		*sg;
> +	void __iomem			*base;
> +	u32				index;

You almost never use the index field.  It could easily be
computed rather than stored:

static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
{
	return (u32)(gb - gb->sg->sgb);
}

> +	u32				irq_mask;
> +	u32				irq_rising_edge;
> +	u32				irq_falling_edge;
> +};
> +
> +struct spacemit_gpio {
> +	struct	device			*dev;
> +	struct	spacemit_gpio_bank	sgb[NR_BANKS];
> +};
> +
> +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> +{
> +	struct spacemit_gpio_bank *gb = dev_id;
> +	unsigned long pending;
> +	u32 n, gedr;
> +
> +	gedr = readl(gb->base + GEDR);
> +	if (!gedr)
> +		return IRQ_NONE;
> +	writel(gedr, gb->base + GEDR);
> +
> +	gedr = gedr & gb->irq_mask;
> +	if (!gedr)
> +		return IRQ_NONE;
> +
> +	pending = gedr;

Instead, do:

	pending = gedr & gb->irq_mask;
	if (!pending)
		return IRQ_NONE;

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
> +	writel(BIT(irqd_to_hwirq(d)), gb->base + GEDR);
> +}
> +
> +static void spacemit_gpio_irq_mask(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	gb->irq_mask &= ~bit;

This is a minor suggestion, and I'm not sure how much difference
it makes.  But here (and one or two more times below) you could
avoid the writel() calls if you know the particular IRQ was
already disabled.  (Maybe that won't ever happen?)

	if (!(gb->irq_mask & bit))
		return;

	gb->irq_mask &= !bit;
	...

This should work because in spacemit_gpio_add_bank() you reset
all the IRQ state and disable all IRQs, so the cached copy of
the irq_mask and the rising and falling edge masks should match
reality.

> +
> +	if (bit & gb->irq_rising_edge)
> +		writel(bit, gb->base + GCRER);
> +
> +	if (bit & gb->irq_falling_edge)
> +		writel(bit, gb->base + GCFER);
> +}
> +
> +static void spacemit_gpio_irq_unmask(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +


Same thought here.

	if (gb->irq_mask & bit)
		return;

> +	gb->irq_mask |= bit;
> +
> +	if (bit & gb->irq_rising_edge)
> +		writel(bit,  gb->base + GSRER);
> +
> +	if (bit & gb->irq_falling_edge)
> +		writel(bit, gb->base + GSFER);
> +}
> +
> +static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +

Same thought in this function, although it gets a little
messier looking.

> +	if (type & IRQ_TYPE_EDGE_RISING) {
> +		gb->irq_rising_edge |= bit;
> +		writel(bit, gb->base + GSRER);
> +	} else {
> +		gb->irq_rising_edge &= ~bit;
> +		writel(bit, gb->base + GCRER);
> +	}

Otherwise:

     if (type & IRQ_TYPE_EDGE_RISING)
	gb->irq_rising_edge |= bit;
     else
	gb->irq_rising_edge &= ~bit;
     writel(bit, gb->base + GSRER);

and again below.

> +
> +	if (type & IRQ_TYPE_EDGE_FALLING) {
> +		gb->irq_falling_edge |= bit;
> +		writel(bit, gb->base + GSFER);
> +	} else {
> +		gb->irq_falling_edge &= ~bit;
> +		writel(bit, gb->base + GCFER);
> +	}
> +
> +	return 0;
> +}
> +

You added this function in version 5 of the series.  Please call
attention to additions (or removals) like this in your cover page,
and/or in notes at the top of this patch.

> +static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
> +
> +	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), gb->index);

Does this look like "gpiochip2-15" or something?  I wasn't able
to find it in the debugfs file system.

> +}
> +
> +static struct irq_chip spacemit_gpio_chip = {
> +	.name		= "k1-gpio-irqchip",
> +	.irq_ack	= spacemit_gpio_irq_ack,
> +	.irq_mask	= spacemit_gpio_irq_mask,
> +	.irq_unmask	= spacemit_gpio_irq_unmask,
> +	.irq_set_type	= spacemit_gpio_irq_set_type,
> +	.irq_print_chip	= spacemit_gpio_irq_print_chip,
> +	.flags		= IRQCHIP_IMMUTABLE,

Last time your flags value was IRQCHIP_SET_WAKE.  Why the change?

> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +

Maybe you could add a comment indicating that gpiospec->args[]
will contain:
0:  bank index
1:  GPIO offset within the bank
2:  flags

(And the GPIO chip instance number as Linus suggested.)

> +static int spacemit_gpio_xlate(struct gpio_chip *gc,
> +			       const struct of_phandle_args *gpiospec, u32 *flags)
> +{
> +	struct spacemit_gpio_bank *gb = gpiochip_get_data(gc);
> +	struct spacemit_gpio *sg = gb->sg;
> +

Get rid of the above blank line.

> +	int i;
> +

I'm not sure the context in which this runs.  Can it be given
arbitrary content from a DTB?  Mainly I'm interested to know
whether any of these checks can be eliminated.  If it's called
while parsing a DTB I can see why you'd need to verify all
input values for validity.

> +	if (gc->of_gpio_n_cells != 3)
> +		return -EINVAL;
> +
> +	if (gpiospec->args_count < gc->of_gpio_n_cells)
> +		return -EINVAL;
> +
> +	i = gpiospec->args[0];
> +	if (i >= NR_BANKS)
> +		return -EINVAL;
> +
> +	if (gc != &sg->sgb[i].gc)
> +		return -EINVAL;
> +
> +	if (gpiospec->args[1] >= gc->ngpio)
> +		return -EINVAL;
> +
> +	if (flags)
> +		*flags = gpiospec->args[2];
> +
> +	return gpiospec->args[1];
> +}
> +
> +static int spacemit_add_pin_range(struct gpio_chip *gc)
> +{
> +	struct spacemit_gpio_bank *gb;
> +	struct of_phandle_args pinspec;
> +	struct pinctrl_dev *pctldev;
> +	struct device_node *np;
> +	int ret, trim;
> +
> +	np = dev_of_node(&gc->gpiodev->dev);
> +	if (!np)
> +		return 0;
> +
> +	gb = to_spacemit_gpio_bank(gc);
> +
> +	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +					       gb->index, &pinspec);
> +	if (ret)
> +		return ret;
> +
> +	pctldev = of_pinctrl_get(pinspec.np);
> +	of_node_put(pinspec.np);
> +	if (!pctldev)
> +		return -EPROBE_DEFER;
> +
> +	/* Ignore ranges outside of this GPIO chip */
> +	if (pinspec.args[0] >= (gc->offset + gc->ngpio))
> +		return -EINVAL;
> +
> +	if (pinspec.args[0] + pinspec.args[2] <= gc->offset)
> +		return -EINVAL;
> +

I would do the following test earlier.

> +	if (!pinspec.args[2])
> +		return -EINVAL;
> +
> +	/* Trim the range to fit this GPIO chip */
> +	if (gc->offset > pinspec.args[0]) {
> +		trim = gc->offset - pinspec.args[0];
> +		pinspec.args[2] -= trim;
> +		pinspec.args[1] += trim;
> +		pinspec.args[0] = 0;
> +	} else {
> +		pinspec.args[0] -= gc->offset;
> +	}
> +	if ((pinspec.args[0] + pinspec.args[2]) > gc->ngpio)
> +		pinspec.args[2] = gc->ngpio - pinspec.args[0];
> +
> +	ret = gpiochip_add_pin_range(gc,
> +				     pinctrl_dev_get_devname(pctldev),
> +				     pinspec.args[0],
> +				     pinspec.args[1],
> +				     pinspec.args[2]);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Just do this:

     return  gpiochip_add_pin_range(gc, pinctrl_dev_get_devname(pctldev),
				   pinspec.args[0], pinspec.args[2]);

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
> +	gb->index = index;
> +	gb->base = regs + bank_base[index];
> +
> +	dat	= gb->base + GPLR;
> +	set	= gb->base + GPSR;
> +	clr	= gb->base + GPCR;
> +	dirin	= gb->base + GCDR;
> +	dirout	= gb->base + GSDR;
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
> +	gc->ngpio		= NR_GPIOS_PER_BANK;
> +	gc->base		= -1;
> +
> +#ifdef CONFIG_OF_GPIO

Why are these lines conditionally defined?  Is it intended
to allow CONFIG_COMPILE_TEST to work?  Your Kconfig states
that this *depends on* OF_GPIO, so this is probably not
needed.

You don't define spacemit_gpio_xlate() earlier conditionally.
Nor spacemit_add_pin_range().

> +	gc->of_xlate		= spacemit_gpio_xlate;
> +	gc->of_add_pin_range	= spacemit_add_pin_range;
> +	gc->of_gpio_n_cells	= 3;
> +#endif
> +
> +	girq			= &gc->irq;
> +	girq->threaded		= true;
> +	girq->handler		= handle_simple_irq;
> +
> +	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
> +
> +	/* Clear Edge Detection Settings */
> +	writel(0x0, gb->base + GRER);
> +	writel(0x0, gb->base + GFER);
> +	/* Clear and Disable Interrupt */
> +	writel(0xffffffff, gb->base + GCFER);
> +	writel(0xffffffff, gb->base + GCRER);

It seems that GAPMASK is an overall interrupt mask register.
I assume that means that by writing 0 here, no interrupts
of any kind will be generated for any of the 32 GPIO ports.

If that's true, I would write this first, *then* disable
the rising and falling edge detection interrupts, *then*
clear any pending interrupts.

Are there any interrupt types other than rising and falling
edge?  Does this just provide an atomic way to disable both
types at once?  If there are no other interrupt types maybe
this could be used rather than disabling both types
separately using GCFER etc. in spacemit_gpio_irq_*mask().

					-Alex

> +	writel(0, gb->base + GAPMASK);
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					spacemit_gpio_irq_handler,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					gb->gc.label, gb);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to register IRQ\n");
> +
> +	ret = devm_gpiochip_add_data(dev, gc, gb);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to add gpio chip\n");
> +
> +	/* Eable Interrupt */
> +	writel(0xffffffff, gb->base + GAPMASK);
> +
> +	return 0;
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
> +	for (i = 0; i < NR_BANKS; i++) {
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
