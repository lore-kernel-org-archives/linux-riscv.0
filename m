Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B33AC2A07B
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=m6hi2oreMA8KJ+7VPI/SJcS2ZpAcrs5xIxAEt8YYE8s=; b=brXwCGqaPvYG7LJp/YI7wNikFK
	lVrePGA3VjfxTMpaLrWzx7zpJ9ytQQRl4Mb1dCrdu6lwYTUiDpRQkeflgvVRYH7FR8747N0m+lEVO
	1a1jXPX99OKHd0VaydZl+53Fdb1fqnyviKRngiKZP4vrVVkkYyTC7toS+fcyB+X4vKlwMICXmDcP6
	YJwAVi5AgoSI6NbwYEXSa7kzXwvYcY9ftpm6K9GX2ZSc3BdVQkbPgmJhEA0z0Gv2Acg3q8f3FDXbj
	89WWaAhgifvxCa+Q5Rk/ugoAqcEeCSZ/4QWfZIQYtkbqJn3cIchnS6oW3V+G60f/kqbV74VieaaTw
	usi+79KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgoW-0000000B3ke-38X5;
	Mon, 05 Jan 2026 09:23:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgoU-0000000B3kI-1Uq1
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 09:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48FCC40B82
	for <linux-riscv@lists.infradead.org>; Mon,  5 Jan 2026 09:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252C4C116D0
	for <linux-riscv@lists.infradead.org>; Mon,  5 Jan 2026 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767605024;
	bh=Eqrv+Xj2NyleWcewu+19KnPhFkn7AkPT9dcxYQG9tDQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Qicafwu9mAK3fPaRqJO1BzB/G9f2fkojM0xqBB5HMSUdl5o0YXiDROL7kdxokde8A
	 PttmU0NSJ2x/5dO7vfLMPwlUhRmdXHFmoJRtjR4xzFrrxNfUlyYwR9DL/pziT/Au4k
	 Y3PqxjqE2PRfra3/f9iT70gi05jqBRq4g7tco6V7SRgJ3MPEy2ZfKZr6iUz8HdAiCE
	 SV8hw3T7KxC+CnGrFM/VdySnkgvXxFZCrBs0+ahoUM9fZLYit3aqfrJ1AsbA/PsEYN
	 W8UjTTujJLYWm7xcfjClKOD4pYI2L/MWlAShryJQ1KC3txmIfQX7hSxVWqwjHwAbTj
	 /Yamm/JPLzImw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso15571800e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 01:23:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVozjFiUd1ZiQtq+6R5zMJolKXyN5DJviC59fWqFGLy8JscDuaEogyhkLv75Qh1Conc2TeWQDfCj/1bWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2r6u7r0GzHoAwVrtHgOb48BGX+fUFLAiRu9eF7MVhJsuXgg4E
	dfRlxr7Fe5MJlh3Cyxtmnln7moCzb8SwyM/4vkq7NrLNplviGdsAPHPXrwLl09SBqXRIVcvgNWo
	a36Vj3xU7viPJS3QN60RLFn131kj8VufIdkmVz+xpRg==
X-Google-Smtp-Source: AGHT+IFGYSai2nZvUP8n2GQ4zJ4ZHV+oe3ze6WQHzze+aMJ+pngnFUNSkH6e+d0MuW5d/47vycCJf5qrwt41Cb+t4LA=
X-Received: by 2002:a05:6512:224b:b0:594:27c6:a08 with SMTP id
 2adb3069b0e04-59a17ddb4dbmr17350284e87.32.1767605022660; Mon, 05 Jan 2026
 01:23:42 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 01:23:41 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 01:23:41 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260104-02-k3-gpio-v2-2-07377739581a@gentoo.org>
MIME-Version: 1.0
References: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org> <20260104-02-k3-gpio-v2-2-07377739581a@gentoo.org>
Date: Mon, 5 Jan 2026 01:23:41 -0800
X-Gmail-Original-Message-ID: <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>
X-Gm-Features: AQt7F2rMiyImlu2F3iBTrebEhOiAXtREj8zFQ8q62Gp72jQPU8L3aYjjTNf4ie0
Message-ID: <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: spacemit: Add GPIO support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_012346_475226_0C1E95FA 
X-CRM114-Status: GOOD (  30.11  )
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

On Sat, 3 Jan 2026 22:33:39 +0100, Yixun Lan <dlan@gentoo.org> said:
> SpacemiT K3 SoC has changed gpio register layout while comparing
> with previous generation, the register offset and bank offset
> need to be adjusted, introduce a compatible data to extend the
> driver to support this.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpio-spacemit-k1.c | 163 ++++++++++++++++++++++++++++------------
>  1 file changed, 117 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> index eb66a15c002f..bca5c3dc13ca 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -15,29 +15,37 @@
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>
> -/* register offset */
> -#define SPACEMIT_GPLR		0x00 /* port level - R */
> -#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
> -#define SPACEMIT_GPSR		0x18 /* port set - W */
> -#define SPACEMIT_GPCR		0x24 /* port clear - W */
> -#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
> -#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
> -#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
> -#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
> -#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
> -#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
> -#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
> -#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
> -#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
> -#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
> -
>  #define SPACEMIT_NR_BANKS		4
>  #define SPACEMIT_NR_GPIOS_PER_BANK	32
>
>  #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> +#define to_spacemit_gpio_regs(gb) ((gb)->sg->data->offsets)
> +
> +enum spacemit_gpio_registers {
> +	SPACEMIT_GPLR = 0,	/* port level - R */

No need for the = 0 here.

> +	SPACEMIT_GPDR,		/* port direction - R/W */
> +	SPACEMIT_GPSR,		/* port set - W */
> +	SPACEMIT_GPCR,		/* port clear - W */
> +	SPACEMIT_GRER,		/* port rising edge R/W */
> +	SPACEMIT_GFER,		/* port falling edge R/W */
> +	SPACEMIT_GEDR,		/* edge detect status - R/W1C */
> +	SPACEMIT_GSDR,		/* (set) direction - W */
> +	SPACEMIT_GCDR,		/* (clear) direction - W */
> +	SPACEMIT_GSRER,		/* (set) rising edge detect enable - W */
> +	SPACEMIT_GCRER,		/* (clear) rising edge detect enable - W */
> +	SPACEMIT_GSFER,		/* (set) falling edge detect enable - W */
> +	SPACEMIT_GCFER,		/* (clear) falling edge detect enable - W */
> +	SPACEMIT_GAPMASK,	/* interrupt mask , 0 disable, 1 enable - R/W */
> +	SPACEMIT_GCPMASK,	/* interrupt mask for K3 */
> +};
>
>  struct spacemit_gpio;
>
> +struct spacemit_gpio_data {
> +	const unsigned int *offsets;
> +	u32 bank_offsets[SPACEMIT_NR_BANKS];
> +};
> +
>  struct spacemit_gpio_bank {
>  	struct gpio_generic_chip chip;
>  	struct spacemit_gpio *sg;
> @@ -49,9 +57,22 @@ struct spacemit_gpio_bank {
>
>  struct spacemit_gpio {
>  	struct device *dev;
> +	const struct spacemit_gpio_data *data;
>  	struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
>  };
>
> +static u32 spacemit_gpio_read(struct spacemit_gpio_bank *gb,
> +			      enum spacemit_gpio_registers reg)
> +{
> +	return readl(gb->base + to_spacemit_gpio_regs(gb)[reg]);
> +}
> +
> +static void spacemit_gpio_write(struct spacemit_gpio_bank *gb,
> +				enum spacemit_gpio_registers reg, u32 val)
> +{
> +	writel(val, gb->base + to_spacemit_gpio_regs(gb)[reg]);
> +}
> +
>  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>  {
>  	return (u32)(gb - gb->sg->sgb);
> @@ -63,10 +84,10 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>  	unsigned long pending;
>  	u32 n, gedr;
>
> -	gedr = readl(gb->base + SPACEMIT_GEDR);
> +	gedr = spacemit_gpio_read(gb, SPACEMIT_GEDR);
>  	if (!gedr)
>  		return IRQ_NONE;
> -	writel(gedr, gb->base + SPACEMIT_GEDR);
> +	spacemit_gpio_write(gb, SPACEMIT_GEDR, gedr);
>
>  	pending = gedr & gb->irq_mask;
>  	if (!pending)
> @@ -82,7 +103,7 @@ static void spacemit_gpio_irq_ack(struct irq_data *d)
>  {
>  	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
>
> -	writel(BIT(irqd_to_hwirq(d)), gb->base + SPACEMIT_GEDR);
> +	spacemit_gpio_write(gb, SPACEMIT_GEDR, BIT(irqd_to_hwirq(d)));
>  }
>
>  static void spacemit_gpio_irq_mask(struct irq_data *d)
> @@ -91,13 +112,13 @@ static void spacemit_gpio_irq_mask(struct irq_data *d)
>  	u32 bit = BIT(irqd_to_hwirq(d));
>
>  	gb->irq_mask &= ~bit;
> -	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
> +	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
>
>  	if (bit & gb->irq_rising_edge)
> -		writel(bit, gb->base + SPACEMIT_GCRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
>
>  	if (bit & gb->irq_falling_edge)
> -		writel(bit, gb->base + SPACEMIT_GCFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
>  }
>
>  static void spacemit_gpio_irq_unmask(struct irq_data *d)
> @@ -108,12 +129,12 @@ static void spacemit_gpio_irq_unmask(struct irq_data *d)
>  	gb->irq_mask |= bit;
>
>  	if (bit & gb->irq_rising_edge)
> -		writel(bit, gb->base + SPACEMIT_GSRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
>
>  	if (bit & gb->irq_falling_edge)
> -		writel(bit, gb->base + SPACEMIT_GSFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
>
> -	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
> +	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
>  }
>
>  static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> @@ -123,18 +144,18 @@ static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>
>  	if (type & IRQ_TYPE_EDGE_RISING) {
>  		gb->irq_rising_edge |= bit;
> -		writel(bit, gb->base + SPACEMIT_GSRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
>  	} else {
>  		gb->irq_rising_edge &= ~bit;
> -		writel(bit, gb->base + SPACEMIT_GCRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
>  	}
>
>  	if (type & IRQ_TYPE_EDGE_FALLING) {
>  		gb->irq_falling_edge |= bit;
> -		writel(bit, gb->base + SPACEMIT_GSFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
>  	} else {
>  		gb->irq_falling_edge &= ~bit;
> -		writel(bit, gb->base + SPACEMIT_GCFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
>  	}
>
>  	return 0;
> @@ -179,15 +200,16 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	struct device *dev = sg->dev;
>  	struct gpio_irq_chip *girq;
>  	void __iomem *dat, *set, *clr, *dirin, *dirout;
> -	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
> +	int ret;
>
> -	gb->base = regs + bank_base[index];
> +	gb->base = regs + sg->data->bank_offsets[index];
> +	gb->sg = sg;
>
> -	dat	= gb->base + SPACEMIT_GPLR;
> -	set	= gb->base + SPACEMIT_GPSR;
> -	clr	= gb->base + SPACEMIT_GPCR;
> -	dirin	= gb->base + SPACEMIT_GCDR;
> -	dirout	= gb->base + SPACEMIT_GSDR;
> +	dat	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPLR];
> +	set	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPSR];
> +	clr	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPCR];
> +	dirin	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GCDR];
> +	dirout	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GSDR];
>
>  	config = (struct gpio_generic_chip_config) {
>  		.dev = dev,
> @@ -206,8 +228,6 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
>
> -	gb->sg = sg;
> -
>  	gc->label		= dev_name(dev);
>  	gc->request		= gpiochip_generic_request;
>  	gc->free		= gpiochip_generic_free;
> @@ -223,13 +243,13 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
>
>  	/* Disable Interrupt */
> -	writel(0, gb->base + SPACEMIT_GAPMASK);
> +	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, 0);
>  	/* Disable Edge Detection Settings */
> -	writel(0x0, gb->base + SPACEMIT_GRER);
> -	writel(0x0, gb->base + SPACEMIT_GFER);
> +	spacemit_gpio_write(gb, SPACEMIT_GRER, 0x0);
> +	spacemit_gpio_write(gb, SPACEMIT_GFER, 0x0);
>  	/* Clear Interrupt */
> -	writel(0xffffffff, gb->base + SPACEMIT_GCRER);
> -	writel(0xffffffff, gb->base + SPACEMIT_GCFER);
> +	spacemit_gpio_write(gb, SPACEMIT_GCRER, 0xffffffff);
> +	spacemit_gpio_write(gb, SPACEMIT_GCFER, 0xffffffff);
>
>  	ret = devm_request_threaded_irq(dev, irq, NULL,
>  					spacemit_gpio_irq_handler,
> @@ -260,6 +280,10 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
>  	if (!sg)
>  		return -ENOMEM;
>
> +	sg->data = of_device_get_match_data(dev);
> +	if (!sg->data)
> +		return dev_err_probe(dev, -EINVAL, "No available compatible data.");
> +
>  	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
> @@ -287,8 +311,55 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
>  	return 0;
>  }
>
> +static const unsigned int spacemit_gpio_k1_offsets[] = {
> +	0x00,
> +	0x0c,
> +	0x18,
> +	0x24,
> +	0x30,
> +	0x3c,
> +	0x48,
> +	0x54,
> +	0x60,
> +	0x6c,
> +	0x78,
> +	0x84,
> +	0x90,
> +	0x9c,
> +	0xA8,
> +};
> +
> +static const unsigned int spacemit_gpio_k3_offsets[] = {
> +	0x0,
> +	0x4,
> +	0x8,
> +	0xc,
> +	0x10,
> +	0x14,
> +	0x18,
> +	0x1c,
> +	0x20,
> +	0x24,
> +	0x28,
> +	0x2c,
> +	0x30,
> +	0x34,
> +	0x38,
> +};

I would very much prefer for you to use the

    [ENUM] = 0xVALUE

style of initialization here for better readability.

Otherwise looks good so LGTM on the next iteration.

Bart

> +
> +static const struct spacemit_gpio_data k1_gpio_data = {
> +	.offsets = spacemit_gpio_k1_offsets,
> +	.bank_offsets = { 0x0, 0x4, 0x8, 0x100 },
> +};
> +
> +static const struct spacemit_gpio_data k3_gpio_data = {
> +	.offsets = spacemit_gpio_k3_offsets,
> +	.bank_offsets = { 0x0, 0x40, 0x80, 0x100 },
> +};
> +
>  static const struct of_device_id spacemit_gpio_dt_ids[] = {
> -	{ .compatible = "spacemit,k1-gpio" },
> +	{ .compatible = "spacemit,k1-gpio", .data = &k1_gpio_data },
> +	{ .compatible = "spacemit,k3-gpio", .data = &k3_gpio_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
> @@ -296,12 +367,12 @@ MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
>  static struct platform_driver spacemit_gpio_driver = {
>  	.probe		= spacemit_gpio_probe,
>  	.driver		= {
> -		.name	= "k1-gpio",
> +		.name	= "spacemit-gpio",
>  		.of_match_table = spacemit_gpio_dt_ids,
>  	},
>  };
>  module_platform_driver(spacemit_gpio_driver);
>
>  MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
> -MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
> +MODULE_DESCRIPTION("GPIO driver for SpacemiT K1/K3 SoC");
>  MODULE_LICENSE("GPL");
>
> --
> 2.52.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
