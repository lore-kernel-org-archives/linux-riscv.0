Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1751AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E7B60551
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1E7B60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0qUkGr3WOwQjBsiVIPuK3+dhmPC2m2J/L2UXdYbHXo=; b=r8D53OIAK1tLCH
	gBgXKM9ooHmo3JjIjixGK/i73+C2r3mFWVP3d5nSa8ck4oUAJWE48yuQQ/vvdwJDJc1/xx3c6XmZT
	kry8IjAbEaByiFOjoN+rpb88EkpSRFojisgzVYFprFbbZQtP/p+sW97omE24ENuKP5KEJXO/qdf+R
	pjJMgFTMHR6J2DHx/xbJEg029G8d42eEVzodPuVWcDVOu+GR7SqBBN1MoDBcoWMS5yNI/B+V2mskS
	f4EcCm6CNXULq5IuC9A1EEt+1vlareTBJIrYogKr2Dj73L+w7+cjQAOtzMG/JkWW1t9mLbrXNFikK
	4wN5vr6WVBpd5MviOf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhzzo-002s7d-8j; Tue, 02 Nov 2021 20:03:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhzzl-002s6a-DX
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 20:02:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id w15so1467567edc.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4JOy2KvbxYD38ikOI7qR7VbaAXGVgm1esl1DyzO8Sgw=;
 b=me7FKbRZkHm/ayWnwtwMa9g+TjLkhOHnSSKF9P4tRJDRWaW8OUULBmN+f63QGZq+Wt
 5S+eYM+dHCO+26Ubq0qqu4plmHLG8EnlHcDUBBeayViJrXbezbRhibbh34Y988KKXO1r
 wJAqLsn3XOoY4YtdWb3zzYmOAYIvcPiI+JSPJ2VUm3BPgPGpdjSSkvyRgfCCiHreaSqy
 +7iEltj2CcEdYX53vp84HqSEz/sKpX/3qsPkoLLnIcjrHEUDtzgImwePytRVTaW3hNSf
 i7oX54Rxyr3m+OdhJlmVDnoWTpktUwSpHQ6rG0JlNc53VH7+YhD0xHaRFmfwVVkIdVwH
 SEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4JOy2KvbxYD38ikOI7qR7VbaAXGVgm1esl1DyzO8Sgw=;
 b=bOrDmD7/Jdh/Kp0ZB2mE/6SOGAlE3TnNpoSs2ezZN4OqvgSld2yzT2hs9FbUXrD3zs
 Wpf2ERIo5kNIpo5AtMZX/GPfPqXpPkHpJT3kHQ/tzr7vgAgWFnAawGUClIGflcpamX5b
 Mw6d7DFMH4JCjQd6i6rqlOeA1j8BPgIKvt+ZTkbi6Z22jmOnSDQt5OuD6TposA1WNqL7
 mPEYA0oPSMk2M8ilrKHh0fzRpLSLMuM7vfM32ukWoUTLqXEbsWtLo2yA6Gi1ehGE10O8
 pcmEB1tFcXcdwfhTHYDT0RDgkmlr4OMLKpN/w09KEdiiodAUKRl2OWIEh1p7vcfAP0iJ
 wuBg==
X-Gm-Message-State: AOAM533y77HJrDOAzrqR2xMgUCJT7JOjzrCiPkjgB8IsdkYWTjywX1XW
 GHBHLPB3QDH9XHKc6jMI2vXkMpWkjqdvOjacn7o=
X-Google-Smtp-Source: ABdhPJwjbJymvrQg7/GMcQpyR3RkMc82Ibyg7WIrLLSEblkmtRuOLYWOWUg151dY2z0V1Aq556PvbGa+JP+7P4ITGyM=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr48108442ejc.69.1635883375499; 
 Tue, 02 Nov 2021 13:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-13-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Nov 2021 22:02:06 +0200
Message-ID: <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_130257_498124_585E12E5 
X-CRM114-Status: GOOD (  35.33  )
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

On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add a combined pinctrl and GPIO driver for the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC, which
> is said to feature only minor changes to these pinctrl/GPIO parts.
>
> For each "GPIO" there are two registers for configuring the output and
> output enable signals which may come from other peripherals. Among these
> are two special signals that are constant 0 and constant 1 respectively.
> Controlling the GPIOs from software is done by choosing one of these
> signals. In other words the same registers are used for both pin muxing
> and controlling the GPIOs, which makes it easier to combine the pinctrl
> and GPIO driver in one.
>
> I wrote the pinconf and pinmux parts, but the GPIO part of the code is
> based on the GPIO driver in the vendor tree written by Huan Feng with
> cleanups and fixes by Drew and me.

...

> +       depends on OF

So this descreases test coverage.
Linus, can we provide a necessary stub so we may drop this dependency?

...

> +static inline struct device *starfive_dev(const struct starfive_pinctrl *sfp)
> +{
> +       return sfp->gc.parent;
> +}
> +

This seems useless helper. You may do what it's doing just in place.
It will save 5 LOCs.

...

> +static void starfive_pin_dbg_show(struct pinctrl_dev *pctldev,
> +                                 struct seq_file *s,
> +                                 unsigned int pin)
> +{
> +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int gpio = starfive_pin_to_gpio(sfp, pin);
> +       void __iomem *reg;
> +       u32 dout, doen;

> +       if (gpio >= NR_GPIOS)
> +               return;

Dead code?

> +       reg = sfp->base + GPON_DOUT_CFG + 8 * gpio;
> +       dout = readl_relaxed(reg + 0x000);
> +       doen = readl_relaxed(reg + 0x004);
> +
> +       seq_printf(s, "dout=%lu%s doen=%lu%s",
> +                  dout & GENMASK(7, 0), (dout & BIT(31)) ? "r" : "",
> +                  doen & GENMASK(7, 0), (doen & BIT(31)) ? "r" : "");
> +}

...

> +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> +       struct device *dev = starfive_dev(sfp);
> +       const char **pgnames;
> +       struct pinctrl_map *map;
> +       struct device_node *child;
> +       const char *grpname;
> +       int *pins;
> +       u32 *pinmux;

Reversed xmas tree order?

> +       int nmaps;
> +       int ngroups;
> +       int ret;

...

> +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> +                                     unsigned int gsel,
> +                                     unsigned long *configs,
> +                                     unsigned int num_configs)
> +{
> +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> +       const struct group_desc *group;
> +       u16 mask, value;
> +       int i;
> +
> +       group = pinctrl_generic_get_group(pctldev, gsel);
> +       if (!group)
> +               return -EINVAL;
> +
> +       mask = 0;
> +       value = 0;
> +       for (i = 0; i < num_configs; i++) {
> +               int param = pinconf_to_config_param(configs[i]);
> +               u32 arg = pinconf_to_config_argument(configs[i]);
> +
> +               switch (param) {
> +               case PIN_CONFIG_BIAS_DISABLE:
> +                       mask |= PAD_BIAS_MASK;
> +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> +                       break;
> +               case PIN_CONFIG_BIAS_PULL_DOWN:
> +                       if (arg == 0)
> +                               return -ENOTSUPP;
> +                       mask |= PAD_BIAS_MASK;
> +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> +                       break;
> +               case PIN_CONFIG_BIAS_PULL_UP:
> +                       if (arg == 0)
> +                               return -ENOTSUPP;
> +                       mask |= PAD_BIAS_MASK;
> +                       value = value & ~PAD_BIAS_MASK;
> +                       break;
> +               case PIN_CONFIG_DRIVE_STRENGTH:
> +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> +                               starfive_drive_strength_from_max_mA(arg);
> +                       break;
> +               case PIN_CONFIG_INPUT_ENABLE:
> +                       mask |= PAD_INPUT_ENABLE;
> +                       if (arg)
> +                               value |= PAD_INPUT_ENABLE;
> +                       else
> +                               value &= ~PAD_INPUT_ENABLE;
> +                       break;
> +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> +                       if (arg)
> +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> +                       else
> +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> +                       break;
> +               case PIN_CONFIG_SLEW_RATE:
> +                       mask |= PAD_SLEW_RATE_MASK;
> +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> +                       break;
> +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> +                       if (arg) {
> +                               mask |= PAD_BIAS_MASK;
> +                               value = (value & ~PAD_BIAS_MASK) |
> +                                       PAD_BIAS_STRONG_PULL_UP;
> +                       } else {
> +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> +                       }
> +                       break;
> +               default:
> +                       return -ENOTSUPP;
> +               }
> +       }
> +
> +       for (i = 0; i < group->num_pins; i++)
> +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> +
> +       return 0;
> +}

...

> +static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
> +       void __iomem *doen = sfp->base + GPON_DOEN_CFG + 8 * gpio;
> +
> +       /* return GPIO_LINE_DIRECTION_OUT (0) only if doen == GPO_ENABLE (0) */
> +       return readl_relaxed(doen) != GPO_ENABLE;

I believe the idea was to return the predefined values for the direction.

> +}

...

> +static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
> +{
> +       struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> +       irq_hw_number_t gpio = irqd_to_hwirq(d);
> +       void __iomem *base = sfp->base + 4 * (gpio / 32);
> +       u32 mask = BIT(gpio % 32);
> +       u32 irq_type, edge_both, polarity;
> +       unsigned long flags;
> +
> +       if (trigger & IRQ_TYPE_EDGE_BOTH)
> +               irq_set_handler_locked(d, handle_edge_irq);
> +       else if (trigger & IRQ_TYPE_LEVEL_MASK)
> +               irq_set_handler_locked(d, handle_level_irq);

Usually we don't assign this twice, so it should be after the switch.

> +       switch (trigger) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = 0;    /* 0: single edge */
> +               polarity  = mask; /* 1: rising edge */
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = 0;    /* 0: single edge */
> +               polarity  = 0;    /* 0: falling edge */
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = mask; /* 1: both edges */
> +               polarity  = 0;    /* 0: ignored */
> +               break;
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               irq_type  = 0;    /* 0: level triggered */
> +               edge_both = 0;    /* 0: ignored */
> +               polarity  = mask; /* 1: high level */
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               irq_type  = 0;    /* 0: level triggered */
> +               edge_both = 0;    /* 0: ignored */
> +               polarity  = 0;    /* 0: low level */
> +               break;
> +       default:

> +               irq_set_handler_locked(d, handle_bad_irq);

Why? You have it already in ->probe(), what's the point?

> +               return -EINVAL;
> +       }
> +
> +       raw_spin_lock_irqsave(&sfp->lock, flags);
> +       irq_type |= readl_relaxed(base + GPIOIS) & ~mask;
> +       writel_relaxed(irq_type, base + GPIOIS);
> +       edge_both |= readl_relaxed(base + GPIOIBE) & ~mask;
> +       writel_relaxed(edge_both, base + GPIOIBE);
> +       polarity |= readl_relaxed(base + GPIOIEV) & ~mask;
> +       writel_relaxed(polarity, base + GPIOIEV);
> +       raw_spin_unlock_irqrestore(&sfp->lock, flags);
> +       return 0;
> +}

...

> +       ret = reset_control_deassert(rst);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "could not deassert resetd\n");

> +       ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
> +       if (ret)

I don't see who will assert reset here.

> +               return dev_err_probe(dev, ret, "could not register pinctrl driver\n");

...

> +       switch (value) {
> +       case 0:
> +               sfp->gpios.pin_base = PAD_INVALID_GPIO;
> +               goto done;
> +       case 1:
> +               sfp->gpios.pin_base = PAD_GPIO(0);
> +               break;
> +       case 2:
> +               sfp->gpios.pin_base = PAD_FUNC_SHARE(72);
> +               break;
> +       case 3:
> +               sfp->gpios.pin_base = PAD_FUNC_SHARE(70);
> +               break;
> +       case 4: case 5: case 6:
> +               sfp->gpios.pin_base = PAD_FUNC_SHARE(0);
> +               break;
> +       default:

Ditto.

> +               return dev_err_probe(dev, -EINVAL, "invalid signal group %u\n", value);
> +       }

...

> +       ret = devm_gpiochip_add_data(dev, &sfp->gc, sfp);
> +       if (ret)

Ditto.

> +               return dev_err_probe(dev, ret, "could not register gpiochip\n");
> +
> +done:
> +       return pinctrl_enable(sfp->pctl);

Ditto.

And better to use label name like following
out_pinctrl_enable:

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
