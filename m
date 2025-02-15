Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CD5C021A0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2025 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oECSXkYqBL787w9u5mLazQvyP5i2X8A1AUm4DTlos7s=; b=09pxGBy8NCwRdAKWjevwZ9uAD2
	znQREDUmITFQnw3YBIUmaondgFMpGUk4sMB79mTNir7iRAg/Cj8QL5N1W9Hayt0voKeeu5ZJm3P1R
	s9wP86uGJe5JaiDBCpsJlKsbix2XzauVSivlP3yfBjZDtTReWLcn/HsFSh24e+XF27DWc2HIbew2f
	07K7c0mLULZXkXQGenoSzg/gctq24u1AmAia4JQ3TNauZYwyW3qLl49BBfhIeKV4FofacekMzc2tU
	2kbAz8C4AEAk71Tl09p8HKZ0tcSGGp45eQSuXok4UPdE0w4FCzqrvGHrJ1pJnwCFxgLcD/FnwD8yt
	0QoxHghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjPSE-00000000lIr-3rMI;
	Sat, 15 Feb 2025 21:12:02 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjPSB-00000000lHm-1hUJ
	for linux-riscv@lists.infradead.org;
	Sat, 15 Feb 2025 21:12:00 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so10204655ab.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Feb 2025 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1739653918; x=1740258718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceafEGWj5GkwpOKdDCNpSD8H3/j66ZDHpZYJ3GYP6r0=;
        b=lPtKV7lmxDxelpAfag1RsBJqC4GUYmIYE901J8FF/apHwltgZSuOWPZnE7xSj0Prx/
         nozeCHoMT/2YQPjGRhXpk0RtIPlUT6EvrNsp7uUiQc9Dgi3E9s3bd0EbsxfxJInAuw3u
         MfFe5YcQyEpP9RSNiSb0TGBmj4P0zvQs40cxpyUlyr5lS9v5907F/UIOAQX6nVnv+LEW
         2Tx1Z9E9oaApfv0j7qb6c1p0OKNsaraPAaeniAxYZHzlPqic+vsu/cSfleb+FmnWDZ4H
         Kpjq0KfkjNcvOVjASdXUlemyIBEnP6xwzwEzzOsXzOtR4WfH6NUvhL4QimZ6sKDXgV2g
         g2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739653918; x=1740258718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceafEGWj5GkwpOKdDCNpSD8H3/j66ZDHpZYJ3GYP6r0=;
        b=cBLLIkeq9ITHH7jGRhBtXklXZ2UCsAwByrNdipdPunQpQZn/10Mc6td9dOfkJ40yN4
         o96bQ0QAZzASzhnNADmZZ9kf3BFrKW8Aj/oYwEChjJol8YfsfIx0GFqfz4pphkZ/1UIy
         1oX/wLWMHRJWcaU7NUhBrykWPs/Rmry4Be8ncfrB57Ar0e/Ngv50fwYpJOWTOmHHf4el
         hHQajR0/KKz8RpI7e5YjNelzIuVHSdUC9IAvVN3KmYtLbV2W57FpagdX/Du5rMBFc4Ot
         PwRIgkKnt15v6gxNUF32qvGu4jGBGwETQzIxqrVIfVXs+LTlytpJFOOCUMKHnn+MtU30
         uHUw==
X-Forwarded-Encrypted: i=1; AJvYcCXdVd1cFKLhRbbfVXFFqpUT7L7S2nQkB9+U7YELQKyugIvs5CDQyqXjiXsXhHrZt/Je2PjYBUlNrlIDUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxNduyKGj+0bx+bshuqDae/B7FidADxB8xQywWm/fTxFsuQrGe
	NK7NRjI1ujSzoN8ELcHD44uUWQ3XzoD5Zwzu7gsZF6ztvUPVZQPEThNttiOE3Ak=
X-Gm-Gg: ASbGncs9X05UcomJ+FjfcQxX78DtTkn4l/pIrpzf+2iOVG0CJTn/gHjwcSeXCqoPIwm
	2X4WNmfmA/Rp4GPoZt5Bn6oilOfg5O4E8djF1yhG3eNDOLFcSB37VjFGyOqFs9ekTVAaQ9GBeBK
	rZomS14pmpRm6xk+StN7HceZqrgLN65bHPgahx0fMGrshsOeIU59QIOgC7VmUw2S4i+czvNav6Y
	xMWxEfBguml/Xm0itMZOqyY+le46mMs1ryGog4Y3frNC7DJBqoaj3P/VDC3maKqGbhm26Nkqs+W
	8FZfNdfQ4QP0Dnhrsq56IfRwgqHBN1NxEQF9d68v6Wbx35XxmuBpKJaU7uMf9Deoc4H2ww==
X-Google-Smtp-Source: AGHT+IGuxU5zm7P8MamZT0KtUt6I5ePRawlrPWD3RPOpisukWv1FIdKmvx9A0oq2JmeKzILAfqJUTQ==
X-Received: by 2002:a05:6602:1653:b0:84a:78ff:1247 with SMTP id ca18e2360f4ac-8557a11ee17mr416344939f.9.1739653917692;
        Sat, 15 Feb 2025 13:11:57 -0800 (PST)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ed28314722sm1422109173.135.2025.02.15.13.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 13:11:57 -0800 (PST)
Message-ID: <0133988a-b0d9-4451-b06c-480dd7f559cd@riscstar.com>
Date: Sat, 15 Feb 2025 15:11:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_131159_734503_EE1096FA 
X-CRM114-Status: GOOD (  41.41  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/20/25 9:38 PM, Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, failing, or both edge type trigger.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

It sounds like the hardware will be modeled in DTS with
explicit banks, which makes sense.  The hardware looks like:

     GPIO controller ---> bank0 --> GPIOs 0..31
                     |
                     |--> bank1 --> GPIOs 0..31
                     |
                     |--> bank2 --> GPIOs 0..31
                     |
                     ---> bank3 --> GPIOs 0..31

Each bank has its own set of 15 registers, but all are managed
by the same controller (driver instance).

Anyway, I'm going to comment on just the code...

> ---
>   drivers/gpio/Kconfig            |   7 +
>   drivers/gpio/Makefile           |   1 +
>   drivers/gpio/gpio-spacemit-k1.c | 295 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 303 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 56fee58e281e7cac7f287eb04e4c17a17f75ed04..c153f5439649da020ee42c38e88cb8df31a8e307 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -654,6 +654,13 @@ config GPIO_SNPS_CREG
>   	  where only several fields in register belong to GPIO lines and
>   	  each GPIO line owns a field with different length and on/off value.
>   
> +config GPIO_SPACEMIT_K1
> +	bool "SPACEMIT K1 GPIO support"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
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
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/seq_file.h>
> +#include <linux/module.h>
> +
> +/* register offset */

Please add one-line comments explaining the purpose of these registers.
I explain my understanding below but you can maybe shorten it and add
something to the right of each definition.

> +#define GPLR		0x00

Current port (or pin?) level (port value, regardless of in or out) (r)

> +#define GPDR		0x0c

Current port direction (clear/0 = in, set/1 = out) (r)
This is currently never used.

> +#define GPSR		0x18

Set port value (set output level high for any set bits) (w)

> +#define GPCR		0x24

Clear port value (set output level low for any set bits) (w)

> +#define GRER		0x30

Ports configured for rising edge detect (r)
This is currently never used.

> +#define GFER		0x3c

Ports configured for falling edge detect (r)
This is currently never used.

> +#define GEDR		0x48

Edge detect status register (set bits indicate edge detected) (r/w)

> +#define GSDR		0x54

Set port direction (set bits indicate output pins) (w)

> +#define GCDR		0x60

Clear port direction (set bits indicate input pins) (w)

> +#define GSRER		0x6c

Enable rising edge detect (set bits indicate rising edge detect) (w)

> +#define GCRER		0x78

Disable rising edge detect (w)

> +#define GSFER		0x84

Enable falling edge detect (set bits indicate falling edge detect) (w)

> +#define GCFER		0x90

Disable falling edge detect (w)

> +#define GAPMASK		0x9c

I don't know what this is.  You write it with ~0 after you
clear both rising and falling edge detection on all 32 pins.

> +#define GCPMASK		0xa8

I don't know what this is.  It's currently never used.

> +
> +#define K1_BANK_GPIO_NUMBER	(32)

No need for parentheses around a simple constant.

> +
> +#define to_spacemit_gpio_port(x) container_of((x), struct spacemit_gpio_port, gc)
> +
> +struct spacemit_gpio;
> +

I might just not understand what a "port" means in this context
(I think here it represents a "bank" of 32 GPIOs.)  Based on the
DT discussion it seems like your structures might change, and
I'd like to know what you'll call them.

Here are terms I'll use:  There will be a top-level "controller"
structure which will be able to access four distinct "banks",
each of which has 32 "ports".

> +struct spacemit_gpio_port {
> +	struct gpio_chip		gc;
> +	struct spacemit_gpio		*gpio;
> +	struct fwnode_handle		*fwnode;
> +	void __iomem			*base;
> +	int				irq;
> +	u32				irq_mask;
> +	u32				irq_rising_edge;
> +	u32				irq_falling_edge;
> +	u32				index;
> +};
> +
> +struct spacemit_gpio {
> +	struct	device			*dev;
> +	struct spacemit_gpio_port	*ports;
> +	u32				nr_ports;
> +};
> +

Basically all of the write registers allow you to specify an
entire mask of bits, where the register write changes the
state of every port in a bank whose corresponding bit is set.
That capability is probably worth exposing, even though the
driver currently doesn't use it.

Meanwhile, most (maybe all) of your functions are only used
to update the state of a single port in a bank.

I think the argument names should distinguish these two cases.
I find the argument name "bit" (which now represents a 32-bit
mask with only one bit set) to be ambiguous.

If exactly one port is affected, maybe its number (0-31) can
be passed as the argument.  But where multiple ports in a
bank can be affected by the same operation, pass a "mask".

> +static inline void spacemit_clear_edge_detection(struct spacemit_gpio_port *port, u32 bit)
> +{

I'd do:
	if (bit & port->irq_rising_edge)
		writel(bit, port->base + GSRER);

(And similar below, and in spacemit_set_edge_detection().)

> +	writel(bit, port->base + GCRER);
> +	writel(bit, port->base + GCFER);
> +}
> +

Two comments about the function above and the next one:
- I think their names should be about masking IRQs, not about
   edge detection.
- Each is called only once, and they're trivial enough that I
   don't think encapsulating them in a function adds any value.
   Just open-code them where they're used.

> +static inline void spacemit_set_edge_detection(struct spacemit_gpio_port *port, u32 bit)
> +{
> +	writel(bit & port->irq_rising_edge,  port->base + GSRER);
> +	writel(bit & port->irq_falling_edge, port->base + GSFER);
> +}
> +

This is used to disable IRQ generation on all ports in a bank.
I would offer the same two comments about this function as I
gave above.

> +static inline void spacemit_reset_edge_detection(struct spacemit_gpio_port *port)
> +{
> +	writel(0xffffffff, port->base + GCFER);
> +	writel(0xffffffff, port->base + GCRER);
> +	writel(0xffffffff, port->base + GAPMASK);
> +}
> +

Use names that align with the callback function names.  I.e.,
this should be spacemit_irq_set_type().

> +static int spacemit_gpio_irq_type(struct irq_data *d, unsigned int type)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	if (type & IRQ_TYPE_EDGE_RISING) {
> +		port->irq_rising_edge |= bit;

Here too, maybe avoid doing the write if the bit was already
set in the rising edge mask.

> +		writel(bit, port->base + GSRER);
> +	} else {
> +		port->irq_rising_edge &= ~bit;
> +		writel(bit, port->base + GCRER);
> +	}
> +
> +	if (type & IRQ_TYPE_EDGE_FALLING) {
> +		port->irq_falling_edge |= bit;
> +		writel(bit, port->base + GSFER);
> +	} else {
> +		port->irq_falling_edge &= ~bit;
> +		writel(bit, port->base + GCFER);
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> +{
> +	struct spacemit_gpio_port *port = dev_id;
> +	unsigned long pending;
> +	u32 n, gedr;
> +
> +	gedr = readl(port->base + GEDR);
> +	if (!gedr)
> +		return IRQ_NONE;
> +
> +	writel(gedr, port->base + GEDR);

I'd have the blank line here, instead of above the writel().

> +	gedr = gedr & port->irq_mask;

	pending = gedr & port->irq_mask;
	if (!pending)

> +
> +	if (!gedr)
> +		return IRQ_NONE;
> +
> +	pending = gedr;
> +
> +	for_each_set_bit(n, &pending, BITS_PER_LONG)
> +		handle_nested_irq(irq_find_mapping(port->gc.irq.domain, n));
> +
> +	return IRQ_HANDLED;
> +}
> +

I don't think "muxed" is necessary in these names.  Just call
this spacemit_irq_ack().

> +static void spacemit_ack_muxed_gpio(struct irq_data *d)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	writel(BIT(irqd_to_hwirq(d)), port->base + GEDR);
> +}
> +

spacemit_irq_mask()

> +static void spacemit_mask_muxed_gpio(struct irq_data *d)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	port->irq_mask &= ~bit;
> +

As I said earlier, I think you should just open-code the two
writes done by the next function.

> +	spacemit_clear_edge_detection(port, bit);
> +}
> +

spacemit_irq_unmask()

> +static void spacemit_unmask_muxed_gpio(struct irq_data *d)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	port->irq_mask |= bit;
> +

Open-code this call too.

> +	spacemit_set_edge_detection(port, bit);
> +}
> +
> +static void spacemit_irq_print_chip(struct irq_data *data, struct seq_file *p)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct spacemit_gpio_port *port = to_spacemit_gpio_port(gc);
> +
> +	seq_printf(p, "%s-%d", dev_name(gc->parent), port->index);
> +}
> +
> +static struct irq_chip spacemit_muxed_gpio_chip = {
> +	.name		= "k1-gpio-irqchip",
> +	.irq_ack	= spacemit_ack_muxed_gpio,
> +	.irq_mask	= spacemit_mask_muxed_gpio,
> +	.irq_unmask	= spacemit_unmask_muxed_gpio,
> +	.irq_set_type	= spacemit_gpio_irq_type,
> +	.irq_print_chip	= spacemit_irq_print_chip,
> +	.flags		= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
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

Make sure i never exceeds gpio->nr_ports.

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
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init gpio chip for port\n");
> +
> +	port->gc.label		= dev_name(dev);
> +	port->gc.fwnode		= port->fwnode;
> +	port->gc.request	= gpiochip_generic_request;
> +	port->gc.free		= gpiochip_generic_free;
> +	port->gc.ngpio		= K1_BANK_GPIO_NUMBER;
> +	port->gc.base		= -1;
> +
> +	girq			= &port->gc.irq;
> +	girq->threaded		= true;
> +	girq->handler		= handle_simple_irq;
> +
> +	gpio_irq_chip_set_chip(girq, &spacemit_muxed_gpio_chip);
> +
> +	spacemit_reset_edge_detection(port);
> +

I *think* you should call devm_gpiochip_add_data() *before*
you register the interrupt handler, because conceivably an
interrupt could fire the instant it's registered.  Maybe it
doesn't matter though.

					-Alex

> +	ret = devm_request_threaded_irq(dev, port->irq, NULL,
> +					spacemit_gpio_irq_handler,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					port->gc.label, port);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to request IRQ\n");
> +
> +	return devm_gpiochip_add_data(dev, &port->gc, port);
> +}
> +
> +static int spacemit_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_gpio *gpio;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int i, ret;
> +
> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +	if (!gpio)
> +		return -ENOMEM;
> +
> +	gpio->dev = dev;
> +
> +	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	ret = spacemit_gpio_get_ports(dev, gpio, regs);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "fail to get gpio ports\n");
> +
> +	for (i = 0; i < gpio->nr_ports; i++) {
> +		ret = spacemit_gpio_add_port(gpio, i);
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
