Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1257C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:35:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B7460C4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84B7460C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwZGEFqZhii4sIv+vi+LIxUmOl4TjS2EFcw+uuD07pI=; b=bifMYyBdWxDzbH
	jq5wTVDiPP2s+pFFl+qRiSucKQljGhQyTFEeSREi4q6KOKKZ9yKYmpd9OCLKPv8JEYREFwLxL8dxk
	XBoQhFNweEmrXJUG1/194rBzwFIkL4kh9PaG7i/EDiwO1+D/Z/TxkKujIaxDC72cAHg/S1kTwKC5a
	L9VjwdteKeBp5ux4Nf0C90nO/ZHUGtC/aQGPbb3SHljRM2hhDKwCa6gnI7trUEhj3c+y2F0uPo/pC
	BSu1mDTafWw3pWsumFkqaelFHy3AVuCXjUyGrNDJKQM4DAZUdcv4EcjwEemHw23ClGjx1ebBYLT54
	zJcmg54EHw2kkuPW5IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi0VP-002yOJ-3D; Tue, 02 Nov 2021 20:35:39 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi0VL-002yNI-Ax
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 20:35:37 +0000
Received: by mail-pl1-f177.google.com with SMTP id u11so709156plf.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 13:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ukRUnX99GuuGwercSLJHoFG30Ze6tFA6H732ebipYw=;
 b=GwPIytEZod5Y02lhB7dgZLVjZb8Ahbr+elEvkddpk9D+GFq/YqeA3RzcdFtMPeTwKn
 7dPcinXu46sCq9ESXZAPwyspiJG6+i7Odm9P9vyhmjOhFnqgfJ0mZHUlcX+fjnOHq8Tg
 E57QAAATb/QfVfK1MNdvJunwSzjSJpim07C2Cb8hvMenfDGxaR4skV+I9WDW6fRMCTJf
 5EB8UIqRXHq39NULX/TEZpwWnuvLlIxeWRvP1LL8PFjlBU9ujLWzIzkgzIsPcuAKMGbY
 7dKSb1OKezvHuew1409/HuFFPa85oMmj3uOC7SRWio/SWVJ1m3ICdqPchI6LGk18nJAB
 XrJg==
X-Gm-Message-State: AOAM532zFZEx4/5607PwJLwdXQR2K2MZBjClu5aMz/5/ZRiUTzdXxXjs
 axbTn1lduK/bpiE8GUaCGC9uChRw5fh6nvJ/AzDvaW4cBp0=
X-Google-Smtp-Source: ABdhPJwcoVLt11l+ug+gF9p11omB7TPoI/gjwPD7aicE1EjLlqZEE1qV7U9Hob+ZQw1H45ZZ4/Ab1gEEMKE1bx513n0=
X-Received: by 2002:a17:90a:5b0c:: with SMTP id
 o12mr9748968pji.194.1635885334069; 
 Tue, 02 Nov 2021 13:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
In-Reply-To: <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 2 Nov 2021 21:35:22 +0100
Message-ID: <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20211102_133535_410084_2D4B3EF2 
X-CRM114-Status: GOOD (  43.52  )
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

On Tue, 2 Nov 2021 at 21:02, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > Add a combined pinctrl and GPIO driver for the JH7100 RISC-V SoC by
> > StarFive Ltd. This is a test chip for their upcoming JH7110 SoC, which
> > is said to feature only minor changes to these pinctrl/GPIO parts.
> >
> > For each "GPIO" there are two registers for configuring the output and
> > output enable signals which may come from other peripherals. Among these
> > are two special signals that are constant 0 and constant 1 respectively.
> > Controlling the GPIOs from software is done by choosing one of these
> > signals. In other words the same registers are used for both pin muxing
> > and controlling the GPIOs, which makes it easier to combine the pinctrl
> > and GPIO driver in one.
> >
> > I wrote the pinconf and pinmux parts, but the GPIO part of the code is
> > based on the GPIO driver in the vendor tree written by Huan Feng with
> > cleanups and fixes by Drew and me.
>
> ...
>
> > +       depends on OF
>
> So this descreases test coverage.
> Linus, can we provide a necessary stub so we may drop this dependency?
>
> ...
>
> > +static inline struct device *starfive_dev(const struct starfive_pinctrl *sfp)
> > +{
> > +       return sfp->gc.parent;
> > +}
> > +
>
> This seems useless helper. You may do what it's doing just in place.
> It will save 5 LOCs.

I don't mind removing it, I just think it's easier to read when we're
explicit that all we want is a dev pointer, and we don't suddenly need
to know the parent of the gpio chip in all the pinmux/pinconf
callbacks.

> > +static void starfive_pin_dbg_show(struct pinctrl_dev *pctldev,
> > +                                 struct seq_file *s,
> > +                                 unsigned int pin)
> > +{
> > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > +       unsigned int gpio = starfive_pin_to_gpio(sfp, pin);
> > +       void __iomem *reg;
> > +       u32 dout, doen;
>
> > +       if (gpio >= NR_GPIOS)
> > +               return;
>
> Dead code?

No, this function is called for all 206 configurable pins, but only 64
of them are gpio pins. Which ones depend on the signal group.

> > +       reg = sfp->base + GPON_DOUT_CFG + 8 * gpio;
> > +       dout = readl_relaxed(reg + 0x000);
> > +       doen = readl_relaxed(reg + 0x004);
> > +
> > +       seq_printf(s, "dout=%lu%s doen=%lu%s",
> > +                  dout & GENMASK(7, 0), (dout & BIT(31)) ? "r" : "",
> > +                  doen & GENMASK(7, 0), (doen & BIT(31)) ? "r" : "");
> > +}
>
> ...
>
> > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > +       struct device *dev = starfive_dev(sfp);
> > +       const char **pgnames;
> > +       struct pinctrl_map *map;
> > +       struct device_node *child;
> > +       const char *grpname;
> > +       int *pins;
> > +       u32 *pinmux;
>
> Reversed xmas tree order?
>
> > +static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> > +{
> > +       struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
> > +       void __iomem *doen = sfp->base + GPON_DOEN_CFG + 8 * gpio;
> > +
> > +       /* return GPIO_LINE_DIRECTION_OUT (0) only if doen == GPO_ENABLE (0) */
> > +       return readl_relaxed(doen) != GPO_ENABLE;
>
> I believe the idea was to return the predefined values for the direction.

You mean this?
  return readl_relaxed(doen) == GPO_ENABLE ? GPIO_LINE_DIRECTION_OUT :
GPIO_LINE_DIRECTION_IN;

> > +}
>
> ...
>
> > +static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
> > +{
> > +       struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +       irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +       void __iomem *base = sfp->base + 4 * (gpio / 32);
> > +       u32 mask = BIT(gpio % 32);
> > +       u32 irq_type, edge_both, polarity;
> > +       unsigned long flags;
> > +
> > +       if (trigger & IRQ_TYPE_EDGE_BOTH)
> > +               irq_set_handler_locked(d, handle_edge_irq);
> > +       else if (trigger & IRQ_TYPE_LEVEL_MASK)
> > +               irq_set_handler_locked(d, handle_level_irq);
>
> Usually we don't assign this twice, so it should be after the switch.
>
> > +       switch (trigger) {
> > +       case IRQ_TYPE_EDGE_RISING:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = 0;    /* 0: single edge */
> > +               polarity  = mask; /* 1: rising edge */
> > +               break;
> > +       case IRQ_TYPE_EDGE_FALLING:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = 0;    /* 0: single edge */
> > +               polarity  = 0;    /* 0: falling edge */
> > +               break;
> > +       case IRQ_TYPE_EDGE_BOTH:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = mask; /* 1: both edges */
> > +               polarity  = 0;    /* 0: ignored */
> > +               break;
> > +       case IRQ_TYPE_LEVEL_HIGH:
> > +               irq_type  = 0;    /* 0: level triggered */
> > +               edge_both = 0;    /* 0: ignored */
> > +               polarity  = mask; /* 1: high level */
> > +               break;
> > +       case IRQ_TYPE_LEVEL_LOW:
> > +               irq_type  = 0;    /* 0: level triggered */
> > +               edge_both = 0;    /* 0: ignored */
> > +               polarity  = 0;    /* 0: low level */
> > +               break;
> > +       default:
>
> > +               irq_set_handler_locked(d, handle_bad_irq);
>
> Why? You have it already in ->probe(), what's the point?

So last time you asked about this, I explained a situation where
userspace first grabs a GPIO, set the interrupt to edge triggered, and
then later loads a driver that requests an unsupported IRQ type. Then
I'd like to set the handler back to handle_bad_irq so we don't get
weird interrupts, but maybe now you know a reason why that doesn't
matter or can't happen?

> > +               return -EINVAL;
> > +       }
> > +
> > +       raw_spin_lock_irqsave(&sfp->lock, flags);
> > +       irq_type |= readl_relaxed(base + GPIOIS) & ~mask;
> > +       writel_relaxed(irq_type, base + GPIOIS);
> > +       edge_both |= readl_relaxed(base + GPIOIBE) & ~mask;
> > +       writel_relaxed(edge_both, base + GPIOIBE);
> > +       polarity |= readl_relaxed(base + GPIOIEV) & ~mask;
> > +       writel_relaxed(polarity, base + GPIOIEV);
> > +       raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +       return 0;
> > +}
>
> ...
>
> > +       ret = reset_control_deassert(rst);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "could not deassert resetd\n");
>
> > +       ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
> > +       if (ret)
>
> I don't see who will assert reset here.

No, so originally this driver would first assert and then deassert
reset. I decided against that because in all likelyhood earlier boot
stages would have set pinmux up for a serial port, and we don't want
to interrupt the serial debug output. The only reason I make sure the
reset line is deasserted is in case someone makes a really minimal
bootloader that just does the absolute minimal to load a Linux kernel
and doesn't even log any anything.

By the same token we also don't want to assert reset on error in case
it resets pin muxing for the the serial line that was supposed to log
the error.

>
> > +               return dev_err_probe(dev, ret, "could not register pinctrl driver\n");
>
> ...
>
> > +       switch (value) {
> > +       case 0:
> > +               sfp->gpios.pin_base = PAD_INVALID_GPIO;
> > +               goto done;
> > +       case 1:
> > +               sfp->gpios.pin_base = PAD_GPIO(0);
> > +               break;
> > +       case 2:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(72);
> > +               break;
> > +       case 3:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(70);
> > +               break;
> > +       case 4: case 5: case 6:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(0);
> > +               break;
> > +       default:
>
> Ditto.
>
> > +               return dev_err_probe(dev, -EINVAL, "invalid signal group %u\n", value);
> > +       }
>
> ...
>
> > +       ret = devm_gpiochip_add_data(dev, &sfp->gc, sfp);
> > +       if (ret)
>
> Ditto.
>
> > +               return dev_err_probe(dev, ret, "could not register gpiochip\n");
> > +
> > +done:
> > +       return pinctrl_enable(sfp->pctl);
>
> Ditto.
>
> And better to use label name like following
> out_pinctrl_enable:

Good idea.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
