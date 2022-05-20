Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1CEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrxdqRu5tGMoztqYdAOEeBbdqvzH3uUmtfQl1Pqc8RM=; b=5GNiWNr9Bv1n9n
	KFiPn9g6V6k/OGgr18fjx4F+g48KJ7+hOLs3UtyNaZv4Eh/70lfVlrHwz1y/85nbQHPomlwYAwniK
	y4Y3OZaQEGo+R/7op4E0k4AIyv5Cs/CD/egHSHAZq7Wi3WQiwPnqo2h2QwHvKp6QcjFQ8ek6odPbN
	p1Hs8M+rVnEOXnoMcf6PHpAFAmAEGpma7L8Nngh2jsSk24YSRksaIUTYCVK2NuTEaiewHkh+68ti7
	1eAzFZwfHQUDXfPsYfF2yJcwBkaD0NMGCE26sTMpnZ/0mt/YH711pymbPxeBXgSzlOse70f6lNLJ7
	N6eW8QziLZPy0hdU3EHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns33l-00Cktm-Hp; Fri, 20 May 2022 13:52:53 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns33h-00Ckqz-6b
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 13:52:52 +0000
Received: by mail-ed1-x52a.google.com with SMTP id fd25so10905711edb.3
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9aNkLnnL/x+dQzLtim+hUdjclNpx0H+tWmMwjRMln9c=;
 b=QiW0ijt+YdcplToEY0ROq8+2ihiAQRTOlOeoVXnuIsHOSl8cfk6RIofVLXpFME/DDA
 nbKxN0ZgTzYkwxTWSb+djgOpbopWZmSUTaaxFvTG2Cuf3PDqCm7L7T9gWCNj96/74MkL
 mgyenc6CIDpY13f48c/aic9GCLQu0dhNTd44Kpr50qh6+5Z8dOOERzKNoP94H7IYvIO6
 1+LxAZrX1fmg/k/GJfMprG0kldMFIVhBjI7M9sktNZVjko64lzqawvxdemzdobqnIkSn
 dNSKFyIqtpuy1ux4UQFDZCR67rA0e0r/49SepDTvBXssS6pn/XOf6f4CvtZfqLBWKV2m
 twXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9aNkLnnL/x+dQzLtim+hUdjclNpx0H+tWmMwjRMln9c=;
 b=dhdqfrhbaS1kOW9180crDf1IJYwfqVs8pkalq2o/1DUBzWIAnQ0XxbRk13WDhAfn+3
 QH/iRc4s3D3hNzlVW151b5jzLadNdv8Tcy5DI+KB3TlIW0qqN9GfrpPlyITzOUnUkH3p
 l7ipFlYPGcpjIgzmwHoCT/Y+rgceyqyhPCCxjDrTf9mCQiIIKZaoRM/JKbd3pVqbMPMn
 AfJQ+djGp/j3e8PIJhGgtcbBcSoiy9AMSRZ/rte0/H4MnL5exYXt+bEfwmjD34NInIzx
 ZaVKFGnqrfyoj9MY5EevEZLlNilwelt+2dA7TXH9ruBaZkxucAszbdyPLqa9d3h23jpe
 yrug==
X-Gm-Message-State: AOAM532uMMJxH+jiXKc5+5kImz75BBbmpimcZovq+WUZPy7NiMURUKcW
 nMYZmF+h2MNlZLQEMm5F8mMjF1FXSnLXG7GldvU=
X-Google-Smtp-Source: ABdhPJyhvhF4dqov7iKJtY3WkAyQlMJhCxTFh0sgtDhcPSLc8B5hyh24XJIf3F86UWCnbZDTxmaATO7BuxB6rpb/ekk=
X-Received: by 2002:a05:6402:294e:b0:425:f016:24e7 with SMTP id
 ed14-20020a056402294e00b00425f01624e7mr10856937edb.111.1653054764895; Fri, 20
 May 2022 06:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
In-Reply-To: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 May 2022 15:52:08 +0200
Message-ID: <CAHp75VeHV+YNCgEUE2jvie92BOpmc3X9R_AnHi7EHRRKoiYpzA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sifive: Make the irqchip immutable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_065249_294023_3AB74F97 
X-CRM114-Status: GOOD (  21.79  )
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

On Fri, May 20, 2022 at 12:34 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the sifive driver:
>
>     gpio gpiochip1: (38001000.gpio-controller): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the sifive driver immutable.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
>
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-sifive.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 03b8c4de2e91e3c4..238f3210970cfa0e 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -75,10 +75,12 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct sifive_gpio *chip = gpiochip_get_data(gc);
> -       int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +       int offset = hwirq % SIFIVE_GPIO_MAX;
>         u32 bit = BIT(offset);
>         unsigned long flags;
>
> +       gpiochip_enable_irq(gc, hwirq);
>         irq_chip_enable_parent(d);
>
>         /* Switch to input */
> @@ -101,11 +103,13 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct sifive_gpio *chip = gpiochip_get_data(gc);
> -       int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +       int offset = hwirq % SIFIVE_GPIO_MAX;
>
>         assign_bit(offset, &chip->irq_state, 0);
>         sifive_gpio_set_ie(chip, offset);
>         irq_chip_disable_parent(d);
> +       gpiochip_disable_irq(gc, hwirq);
>  }
>
>  static void sifive_gpio_irq_eoi(struct irq_data *d)
> @@ -137,7 +141,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
>         return -EINVAL;
>  }
>
> -static struct irq_chip sifive_gpio_irqchip = {
> +static const struct irq_chip sifive_gpio_irqchip = {
>         .name           = "sifive-gpio",
>         .irq_set_type   = sifive_gpio_irq_set_type,
>         .irq_mask       = irq_chip_mask_parent,
> @@ -146,6 +150,8 @@ static struct irq_chip sifive_gpio_irqchip = {
>         .irq_disable    = sifive_gpio_irq_disable,
>         .irq_eoi        = sifive_gpio_irq_eoi,
>         .irq_set_affinity = sifive_gpio_irq_set_affinity,
> +       .flags          = IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
>  static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> @@ -242,7 +248,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>         chip->gc.parent = dev;
>         chip->gc.owner = THIS_MODULE;
>         girq = &chip->gc.irq;
> -       girq->chip = &sifive_gpio_irqchip;
> +       gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
>         girq->fwnode = of_node_to_fwnode(node);
>         girq->parent_domain = parent;
>         girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
