Return-Path: <SRS0=+XCi=PL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802E7C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 21:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0069560F25
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 21:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0069560F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcFbeeJWGMm6/9TyQVAeKgMadcBAgDVWU3kc2Uz46XU=; b=AbYJ3UyRTQ62cq
	JzgpBLFysUVnwXi2kS0vFu34eCOTWxp+dHOELrrnGLiKRe909BKc97Y+o2ZExo68Fq9tPa/o3YOqJ
	n9xtUVh8g72gG7iVlWnYFRaSV+tgZWfAabTwWDE1aiijGIjiTJhmO/RgGLCKr9zNXYtZPxccyjkLp
	OOg0BkyxURT2063XaVp7+O16veM7JZV5jK2C1/MivYiTQwMzMICWkoChkjyz1xapIr1vokppX2emQ
	dUZOpSjuTx2Y1LG+rrWcufSRd2vF94McDx7rm+dDbS05/JU1GQ89Fl3Cc0exNaGjeelmrh2zy/m/q
	OB7eHgTKqfE61dBA76sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meOAX-00DLHw-5d; Sat, 23 Oct 2021 21:03:09 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meOAS-00DLGL-Ls
 for linux-riscv@lists.infradead.org; Sat, 23 Oct 2021 21:03:06 +0000
Received: by mail-pj1-f43.google.com with SMTP id ls18so5328457pjb.3
 for <linux-riscv@lists.infradead.org>; Sat, 23 Oct 2021 14:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZh2M7QGexTIuPxtm9Pv4Za0Wma1jz1TKQDX4gzJw84=;
 b=i+ebnOMMxLuxS+r1PTVnTi9q96cii9hrdUJuY4gDYmYZvls3MOclIovRfk4FG9KoG2
 G53q4mKOtCWsafJjnlwRhfAabUj/Q8SL5+Ngtz/sFDO0j5f+e+CZzpE9A/J+TGg8F/Rl
 fwGzHPFI6FjN39t+fPXV6Og1P5A3zrxT3Vx5inQNG17MUkUX0i0p/nFfgsBFw0ceWHuE
 /LhqVju+0KGC8/CwaGreyGd/WjONxEmr7HStxU1o1dsZLZfhA6aMDBa+OpgwHegAhgmp
 ZOj8o74G3X+Fz3r1rO/Zv/rDGkDhYfKvg8T7JPC53uRe/yRMPGPmBM6pQCZfmsVoOApb
 a/VQ==
X-Gm-Message-State: AOAM533EcgnqZgLw390/me1NpvD/qxzsEXNlN0JsuYf/jvsOEg3bLVgy
 rigHZY9TUuFoqOdsfyAGyE22ow1tHc74Sdh+KOQ=
X-Google-Smtp-Source: ABdhPJxRgf8uUFGAALcUB5oOZDiVcNv4PZ/taojEoGAtNN/iBhpwn7QbMn9TtqwGYaivukHVa05AQMyUoFO555Gmq4U=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr7351904plh.33.1635022982010; Sat, 23 Oct
 2021 14:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
 <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
 <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
In-Reply-To: <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sat, 23 Oct 2021 23:02:50 +0200
Message-ID: <CANBLGcxnmt4Ki4EHAXeoJX5mJMyeioZXhGaDsKm_wk86D4js3Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
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
X-CRM114-CacheID: sfid-20211023_140304_752312_58939F32 
X-CRM114-Status: GOOD (  64.03  )
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

On Sat, 23 Oct 2021 at 22:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 15:32, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Thu, Oct 21, 2021 at 8:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > +               } else if ((npins = of_property_count_u32_elems(child, "pins")) > 0) {
> > > > +                       pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > > +                       if (!pins)
> > > > +                               goto free_grpname;
> > > > +
> > > > +                       pinmux = NULL;
> > > > +
> > > > +                       for (i = 0; i < npins; i++) {
> > > > +                               u32 v;
> > > > +
> > > > +                               ret = of_property_read_u32_index(child, "pins", i, &v);
> > > > +                               if (ret)
> > > > +                                       goto free_pins;
> > > > +                               pins[i] = v;
> > > > +                       }
> > >
> > > NIH _array() APIs.
> >
> > .. here the pins array is an int array and not u32 array. I can cast
> > it and and hope Linux will never run on a machine where sizeof(int) !=
> > 4 if you think that's better?
>
> Can you make it u32?

No, the pinctrl API takes an int array.

> > > > +free_pinmux:
> > > > +       devm_kfree(dev, pinmux);
> > > > +free_pins:
> > > > +       devm_kfree(dev, pins);
> > > > +free_grpname:
> > > > +       devm_kfree(dev, grpname);
> > >
> > > > +free_pgnames:
> > > > +       devm_kfree(dev, pgnames);
> > >
> > > Just no, please get rid of them either way as I explained in previous reviews.
> >
> > So I asked you if you thought it was better to leave these unused
> > allocations when parsing the device tree node fails but you never
> > answered that. I didn't want put words in your mouth so I could only
> > assume you didn't. I'd really like a straight answer to that so I have
> > something to refer to when people ask why this driver doesn't do the
> > same as fx. the pinctrl-single. So just to be clear: do you think it's
> > better to leave this unused garbage allocated if parsing the device
> > tree node fails?
>
> If it's only one time use, I don't think it's good to have it hanging
> around, BUT at the same time devm_*() is not suitable for such
> allocations.

So is that a yes or a no to my question? It's not clear to me.

> > > > +               if (reg_din)
> > > > +                       writel_relaxed(gpio + 2, reg_din);
> > >
> > > Why 0 can't be written?
> >
> > Because signal 0 is a special "always 0" signal and signal 1 is a
> > special "always 1" signal, and after that signal n is the input value
> > of GPIO n - 2. We don't want to overwrite the PoR defaults.
>
> Okay, this, perhaps, needs a comment (if I have not missed the existing one).
>
> And what about checking for reg_din? Do you have some blocks output-only?

I don't know know what you mean by the first question, but yes fx. the
uart tx pins would be an example of pins that have their output signal
set to the uart peripheral, the output enable set to the special
"always enabled" signal, and no input signal is set to any of the tx
pins.

> > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > > +                       mask |= PAD_BIAS_MASK;
> > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > >
> > > Okay, I have got why you are masking on each iteration, but here is
> > > the question, shouldn't you apply the cnages belonged to each of the
> > > group of options as it's requested by the user? Here you basically
> > > ignore all previous changes to bias.
> > >
> > > I would expect that you have something like
> > >
> > > for () {
> > >   switch (type) {
> > >   case BIAS*:
> > >     return apply_bias();
> > >   ...other types...
> > >   default:
> > >     return err;
> > >   }
> > > }
> >
> > I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> > don't see why it's better to do the rmw on the padctl register for the
> > first bias setting only to then change the bits again a few
> > microseconds later when the loop encounters the second bias setting.
> > After the loop is done the end result would still be just the last
> > bias setting.
>
> It could be bias X followed by something else followed by bias Y. You
> will write something else with bias Y. I admit I don't know this
> hardware and you and maintainers are supposed to decide what's better,
> but my guts are telling me that current algo is buggy.

So there is only one padctl register pr. pin. I don't see why first
setting the bias bits to X, then setting some other bits, and then
setting the bias bits to Y would be different from just setting all
the bits in one go. Except for during that little microsecond window
during the loop that I actually think it's better to avoid.

> > > > +                       break;
>
> ...
>
> > > > +static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> > > > +{
> > > > +       return pinctrl_gpio_request(gc->base + gpio);
> > > > +}
> > > > +
> > > > +static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> > > > +{
> > > > +       pinctrl_gpio_free(gc->base + gpio);
> > > > +}
> > >
> > > Point of having these function is...?
> >
> > These calls tells the pinctrl system that a certain pin is now used
> > for GPIO. Conversely it'll also prevent fx. userspace from doing GPIO
> > on a pin that's already used by I2C, a UART or some other peripheral.
>
> Isn't pin control doing it by default?

I actually tested that before posting and the answer seems to be no.

> ...
>
> > > > +       /* enable input and schmitt trigger */
> > >
> > > Use capitalization consistently.
> >
> > I am?
>
> In the comment is one style, in other comments it's another.

There are documentation comments in the beginning of the file and then
there are code comments in the code. I think it's a lot easier to read
like that, but if you insist I can lowercase the documentation.

> > > > +       case IRQ_TYPE_EDGE_RISING:
>
> > > > +               handler   = handle_edge_irq;
> > > > +               break;
> > > > +       case IRQ_TYPE_EDGE_FALLING:
>
> > > > +               handler   = handle_edge_irq
> > > > +               break;
> > > > +       case IRQ_TYPE_EDGE_BOTH:
>
> > > > +               handler   = handle_edge_irq;
> > >
> > > Dup. You may do it once without any temporary variable.
> > > I haven't got why you haven't addressed this.
> >
> > So you want two switches on the trigger variable, one for irq_type,
> > edge_both and polarity, and one for the handler? If this is not what
> > you have in mind please be a lot more explicit. Trying to guess what
> > you mean gets really old.
>
> switch (type) {
> case bla bla bla:
>   ...everything except handler...
> }
>
> if (type & EDGE)
>  irq_lock(edge_handler)
> else if (type & LEVEL)
>  irq_lock(level_handler)

If you look at include/dt-bindings/interrupt-controller/irq.h I don't
think such a mask exists. I guess we could do

if (trigger & IRQ_TYPE_EDGE_BOTH)
  edge_handler
else if (trigger == IRQ_TYPE_LEVEL_HIGH || trigger == IRQ_TYPE_LEVEL_LOW)
 level_handler
else
  return -EINVAL

..but at that point I think it's probably easer to read a 2nd switch
case or just leave the code as it is. What do you think?

> >
> > > > +               break;
> > > > +       case IRQ_TYPE_LEVEL_HIGH:
>
> > > > +               handler   = handle_level_irq;
> > > > +               break;
> > > > +       case IRQ_TYPE_LEVEL_LOW:
>
> > > > +               handler   = handle_level_irq;
> > >
> > > Ditto.
> > >
> > > > +               break;
>
> ...
>
> > > > +       clk = devm_clk_get(dev, NULL);
> > > > +       if (IS_ERR(clk)) {
> > >
> > > > +               ret = PTR_ERR(clk);
> > >
> > > Inline into below.
> > >
> > > > +               return dev_err_probe(dev, ret, "could not get clock: %d\n", ret);
> > > > +       }
> > >
> > > Ditto for all other similar cases.
> >
> > So you would rather want this?
> >   return dev_err_probe(dev, PTR_ERR(clk), "could not get clock: %d\n",
> > PTR_ERR(clk));
> > or just not tell why getting the clock failed?
>
> Of course not, no dup of the printing error code is needed. I guess I
> mentioned it in another patch.
>
> return dev_err_probe(dev, PTR_ERR($error), "$msg\n");
>
> ...
>
> > > > +       if (!device_property_read_u32(dev, "starfive,signal-group", &value)) {
> > >
> > > Since you are using of_property_* elsewhere, makes sense to use same
> > > here, or otherwise, use device_*() APIs there.
> >
> > Wait, so now you want of_property_read_u32(dev->of_node, ...) here
> > again, is that right?
>
> Before I missed that there are other of_property_read*() calls, now
> since you used them elsewhere it makes sense to be consistent over the
> code.

Gotcha.
> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
