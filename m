Return-Path: <SRS0=+XCi=PL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450DEC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA23660F5D
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA23660F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX30JvOqZlY0BQzS2NpU7rB2Rv9s2bl+5RZB7DvHgiQ=; b=Cjt66INrztw4TC
	vKRtk4UkF0DQ+yfOingiJkd5SxAwL5Q6E5hBuh26Hq6mEDEYk7hoMHim7nTrFtAQdJDpDs+Da0cMd
	9tBySYQ5M4gppz+Hmoyv3v0MEG9HkuSpb9jfGQtUoWRBzDFMKGHdR+ILaoYKrvwjD+ypWJW19N1i5
	a8HRuh4QBNP3tvJlZJZsIZN7MsGWQxriKiG7YZI2Tb0kSe5gjjNY9nxDFI9oV1lcrA0epIqtlYWUa
	vItI035iysXWblAQQcOsrUDSbsy1TSXsmOVrV6+km7bBl0G6oH7TZPXLzQ6qcjPoCBX/Pl84c3LZR
	4e+6BcgqFDB839h8kQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meNdj-00DG8V-Fz; Sat, 23 Oct 2021 20:29:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meNdf-00DG7n-TC
 for linux-riscv@lists.infradead.org; Sat, 23 Oct 2021 20:29:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id y12so756839eda.4
 for <linux-riscv@lists.infradead.org>; Sat, 23 Oct 2021 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SzVsOsazz6NgGH8KlymKLjObEboSVEskSxC1YWCAEw0=;
 b=X6FhEI8KR4yF/JzKN0WfOrZUVXXl3Z0uA43e1KGXQJH4sqg6CGTn1wlhZN61EgHmD3
 lj9nWS2tQ7rGEAQcfwtRiOy8bJ4j5QauFfdOTYAf2oZUeCvsj19Ufho8hZHTz/hlZ9WA
 249T9S+51UEZZByD7YwodCA/f2DxFBSRrgmlwIdjPFVpWavHQ3nvM85EVy1SYE+du8Nv
 EDnYB5RhTA2K3RqckOVWkkN4vUyWK7E63RqAN3NlfgfcjqBYN9uAdmRldrhOf2U1qmzb
 oN7OOKy8RBn/45MXfe+CXLDRGfPGQ/+n6ikl1UgqDXgX2LdVvvp2ZG1qANvEOlxc6IYR
 rKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SzVsOsazz6NgGH8KlymKLjObEboSVEskSxC1YWCAEw0=;
 b=vYuZBT++UUNv0Np861hTmVraen1dAQdWzbIT743pusWEYRD511rVS7+5c6CWzLYB0d
 aPU+db0+cuvTPBsdVEgIyWp09X/B14A13lRb/dlAm/r80SDEMWcWw0Awl15g+yI0hGgs
 Kb/2/x7cbkM7yegqqKnwRHCyrz63Qpz1wMtjiVSe301ldZG8ZO5Z2Es4UPgA77QadpLe
 uY5695L254Ho093AE1rk2ABzeBdGGlIuKA48wxeuj1HO5wuLSwlK6263ts5I3pMDErOi
 YG/OY28ECMpbmdfYHhjMgycYIj4ml2fKF3doz5/e6QFSPWjrp8caH89UXClyI0FRD6Bh
 t5OQ==
X-Gm-Message-State: AOAM530N6axnzGutVc0/+zXe7gjnkiVwzOfxhx4kd50Whb5LqMktPnds
 kcgQPbY4VKfwhWqAG7aHYXdtBMa3YP/rU+hcfLA=
X-Google-Smtp-Source: ABdhPJwe86OXrLgQr5wEpGhqsTLlqOWg2HVfJfboGhfAmN9//Cy2DIVS6hRyxHuZK7CF3ikwca10ZYQTNd/3mna8SzI=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr9785287ejc.69.1635020949911; 
 Sat, 23 Oct 2021 13:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
 <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
In-Reply-To: <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Oct 2021 23:28:33 +0300
Message-ID: <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
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
X-CRM114-CacheID: sfid-20211023_132911_978537_22860519 
X-CRM114-Status: GOOD (  48.66  )
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

On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 15:32, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Oct 21, 2021 at 8:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +               } else if ((npins = of_property_count_u32_elems(child, "pins")) > 0) {
> > > +                       pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > +                       if (!pins)
> > > +                               goto free_grpname;
> > > +
> > > +                       pinmux = NULL;
> > > +
> > > +                       for (i = 0; i < npins; i++) {
> > > +                               u32 v;
> > > +
> > > +                               ret = of_property_read_u32_index(child, "pins", i, &v);
> > > +                               if (ret)
> > > +                                       goto free_pins;
> > > +                               pins[i] = v;
> > > +                       }
> >
> > NIH _array() APIs.
>
> .. here the pins array is an int array and not u32 array. I can cast
> it and and hope Linux will never run on a machine where sizeof(int) !=
> 4 if you think that's better?

Can you make it u32?

...

> > > +free_pinmux:
> > > +       devm_kfree(dev, pinmux);
> > > +free_pins:
> > > +       devm_kfree(dev, pins);
> > > +free_grpname:
> > > +       devm_kfree(dev, grpname);
> >
> > > +free_pgnames:
> > > +       devm_kfree(dev, pgnames);
> >
> > Just no, please get rid of them either way as I explained in previous reviews.
>
> So I asked you if you thought it was better to leave these unused
> allocations when parsing the device tree node fails but you never
> answered that. I didn't want put words in your mouth so I could only
> assume you didn't. I'd really like a straight answer to that so I have
> something to refer to when people ask why this driver doesn't do the
> same as fx. the pinctrl-single. So just to be clear: do you think it's
> better to leave this unused garbage allocated if parsing the device
> tree node fails?

If it's only one time use, I don't think it's good to have it hanging
around, BUT at the same time devm_*() is not suitable for such
allocations.

...

> > > +               if (reg_din)
> > > +                       writel_relaxed(gpio + 2, reg_din);
> >
> > Why 0 can't be written?
>
> Because signal 0 is a special "always 0" signal and signal 1 is a
> special "always 1" signal, and after that signal n is the input value
> of GPIO n - 2. We don't want to overwrite the PoR defaults.

Okay, this, perhaps, needs a comment (if I have not missed the existing one).

And what about checking for reg_din? Do you have some blocks output-only?

...

> > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> >
> > Okay, I have got why you are masking on each iteration, but here is
> > the question, shouldn't you apply the cnages belonged to each of the
> > group of options as it's requested by the user? Here you basically
> > ignore all previous changes to bias.
> >
> > I would expect that you have something like
> >
> > for () {
> >   switch (type) {
> >   case BIAS*:
> >     return apply_bias();
> >   ...other types...
> >   default:
> >     return err;
> >   }
> > }
>
> I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> don't see why it's better to do the rmw on the padctl register for the
> first bias setting only to then change the bits again a few
> microseconds later when the loop encounters the second bias setting.
> After the loop is done the end result would still be just the last
> bias setting.

It could be bias X followed by something else followed by bias Y. You
will write something else with bias Y. I admit I don't know this
hardware and you and maintainers are supposed to decide what's better,
but my guts are telling me that current algo is buggy.

> > > +                       break;

...

> > > +static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> > > +{
> > > +       return pinctrl_gpio_request(gc->base + gpio);
> > > +}
> > > +
> > > +static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> > > +{
> > > +       pinctrl_gpio_free(gc->base + gpio);
> > > +}
> >
> > Point of having these function is...?
>
> These calls tells the pinctrl system that a certain pin is now used
> for GPIO. Conversely it'll also prevent fx. userspace from doing GPIO
> on a pin that's already used by I2C, a UART or some other peripheral.

Isn't pin control doing it by default?

...

> > > +       /* enable input and schmitt trigger */
> >
> > Use capitalization consistently.
>
> I am?

In the comment is one style, in other comments it's another.

...

> > > +       case IRQ_TYPE_EDGE_RISING:

> > > +               handler   = handle_edge_irq;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_FALLING:

> > > +               handler   = handle_edge_irq
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_BOTH:

> > > +               handler   = handle_edge_irq;
> >
> > Dup. You may do it once without any temporary variable.
> > I haven't got why you haven't addressed this.
>
> So you want two switches on the trigger variable, one for irq_type,
> edge_both and polarity, and one for the handler? If this is not what
> you have in mind please be a lot more explicit. Trying to guess what
> you mean gets really old.

switch (type) {
case bla bla bla:
  ...everything except handler...
}

if (type & EDGE)
 irq_lock(edge_handler)
else if (type & LEVEL)
 irq_lock(level_handler)

>
> > > +               break;
> > > +       case IRQ_TYPE_LEVEL_HIGH:

> > > +               handler   = handle_level_irq;
> > > +               break;
> > > +       case IRQ_TYPE_LEVEL_LOW:

> > > +               handler   = handle_level_irq;
> >
> > Ditto.
> >
> > > +               break;

...

> > > +       clk = devm_clk_get(dev, NULL);
> > > +       if (IS_ERR(clk)) {
> >
> > > +               ret = PTR_ERR(clk);
> >
> > Inline into below.
> >
> > > +               return dev_err_probe(dev, ret, "could not get clock: %d\n", ret);
> > > +       }
> >
> > Ditto for all other similar cases.
>
> So you would rather want this?
>   return dev_err_probe(dev, PTR_ERR(clk), "could not get clock: %d\n",
> PTR_ERR(clk));
> or just not tell why getting the clock failed?

Of course not, no dup of the printing error code is needed. I guess I
mentioned it in another patch.

return dev_err_probe(dev, PTR_ERR($error), "$msg\n");

...

> > > +       if (!device_property_read_u32(dev, "starfive,signal-group", &value)) {
> >
> > Since you are using of_property_* elsewhere, makes sense to use same
> > here, or otherwise, use device_*() APIs there.
>
> Wait, so now you want of_property_read_u32(dev->of_node, ...) here
> again, is that right?

Before I missed that there are other of_property_read*() calls, now
since you used them elsewhere it makes sense to be consistent over the
code.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
