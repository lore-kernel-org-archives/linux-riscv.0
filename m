Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D84EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 17:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05F261130
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 17:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B05F261130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/hUGaGwVeJWZh6mBRGromXk653YPKlcl5JSulHCxUw=; b=dsIVpUptPWlt/x
	5guVh/G/+tA/6D+uC4IlZWU125cZxY88sgJ71r+0erBlAlilYSRrzPYkk4rHVe9pI/ZvG8DxY7DEG
	w0AKSlmEIJLTz76sCzxkZAQrOu0PzfSCyGXeyHHjaJpZTdB1YqGiYKA+jCHOrX/QYUep9SG0exmOS
	wOv/C8EPj3Yp7scxQ3akf3FOlhjlc9VRob/mQ/i5EzSasWnI4Kk7+Q7eo/FvyhIfcoc1+PcXj1FwC
	F8ixFbUTq2dMoGfZoAuZoLFHhxaCheEnGcyGIZO4jf9m+3fpVzZI/T6fnAFQGAtXBTbZ3QaQUo8lk
	ag0r/O6YLA5TTOn7WowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maiC6-000BHb-QL; Wed, 13 Oct 2021 17:37:34 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maiC3-000BGt-Ja
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 17:37:33 +0000
Received: by mail-pj1-f45.google.com with SMTP id k23so2845227pji.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 10:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QVBAEtzBf8NgxxaPCvIOBWMtr/VM/UkracigHu4Aldw=;
 b=pMXuV78sdPjz2laq1AuoLUdxEkUI6zeh5KWeYTdTdfP2IGSnXieLlYxoQlLnN7ZGQ2
 UZTYu/DFfmvVOHGMT39HxZ7lnVNo4YVzAPiRG/+ZQch44+PFEGFMDUcqxqRtvJceZcV+
 kCvAtkHN3R2KgxL/nj3Vo4P4O91PJihcFYBmF5QIuxlHdA7ta4PgYXnPzoowi9GSNK4o
 wB4s8ysTsqfalhu9d+LEebOyKTWTwSb0eE757Rqut7EV96dVz8+Zc4ymi0HTMHkgdMAr
 DPzT+AcQdLoiBKRl7PEesMmifSgTaIULvds/5AgLAqbaWPOnYIfIqZiHGMvB256BeQTh
 2V6g==
X-Gm-Message-State: AOAM532oiOzZIqwYaWLwiudnRE/rfhIHLatJGi1P9NpFTK+56X4qP3Zq
 IwEePuJBeWtKk5qRUPSDDaUh40LafnyNAnznjaA=
X-Google-Smtp-Source: ABdhPJw/YzBKZ+RUpkqcTx87u4/1JB8mo6GfzPiUnysSmxNEGdy6ehUNO+jOIbpnwyFqhyCb1aePjG1Dul7hPUEfr9k=
X-Received: by 2002:a17:902:7783:b0:13d:fee6:8095 with SMTP id
 o3-20020a170902778300b0013dfee68095mr533536pll.7.1634146650266; Wed, 13 Oct
 2021 10:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGczDZh+kLWM017mPenY8WO5OovH2DFUSS-shRD-aZVKa0A@mail.gmail.com>
 <YWc5zq0Moz3asWEa@smile.fi.intel.com>
In-Reply-To: <YWc5zq0Moz3asWEa@smile.fi.intel.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 13 Oct 2021 19:37:19 +0200
Message-ID: <CANBLGcx7M4z16Wb62bnpS0v3BP6E8RXEu0O0+D=RwD_1O=7AfQ@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
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
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_103731_671611_12E3F855 
X-CRM114-Status: GOOD (  53.02  )
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

On Wed, 13 Oct 2021 at 18:59, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Wed, Oct 13, 2021 at 06:38:14PM +0200, Emil Renner Berthing wrote:
> > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > +free_pinmux:
> > > > +       devm_kfree(dev, pinmux);
> > > > +free_pins:
> > > > +       devm_kfree(dev, pins);
> > > > +free_grpname:
> > > > +       devm_kfree(dev, grpname);
> > >
> > > What the heck?!
> >
> > Just to be clear. You mean we don't need to explicitly free them
> > because they're tied to the device right? I don't think the device
> > will go away just because a single device tree entry can't be parsed,
> > so on such errors this garbage would be left behind. You can still
> > argue we shouldn't optimize for broken device trees, I just want to
> > make it at conscious decision.
>
> If you are using devm_kfree() it is quite likely shows either of the following
> issues:
>
> * you mustn't use devm_*() in the first place due to object lifetime;
> * you shouldn't use devm_kfree() since this is the whole point of devm.

Hmm.. it seems like other drivers that dynamically builds the groups
and functions either also uses devm_kcalloc/devm_kfree like fx.
pinctrl-single or implements their own code to clean up groups and
functions when unloaded. There are no group destroy or function
destroy callbacks. I like devm_kcalloc/devm_kfree version better since
it's less code to write.

> > > > +free_pgnames:
> > > > +       devm_kfree(dev, pgnames);
> > >
> > > Ditto.
>
> ...
>
> > > > +out:
> > >
> > > Useless label.
> >
> > Hmm.. my compiler disagrees.
>
> The comment implies that you return directly instead of using `goto out;`.
>
> > > > +       return ret;
>
> ...
>
> > > > +               v = pinmux[i];
> > > > +               dout = ((v & BIT(7)) << (31 - 7)) | ((v >> 24) & 0xffU);
> > > > +               doen = ((v & BIT(6)) << (31 - 6)) | ((v >> 16) & 0xffU);
> > > > +               din  = (v >> 8) & 0xffU;
> > >
> > > What is this voodoo for?
> >
> > In order to do pinmux we need the following pieces of information from
> > the device tree for each pin ("GPIO" they call it):
> >
> > output signal: 0-133 + 1bit reverse flag
> > output enable signal: 0-133 + 1bit reverse flag
> > optional input signal: 0-74 + special "none" value, right now 0xff
> > gpio number: 0-63
> >
> > As the code is now all that info is packed into a u32 for each pin
> > using the GPIOMUX macro defined in the dt-binding header added in
> > patch 10. There is also a diagram for how this packing is done. The
> > above voodoo is for unpacking that.
> >
> > I'd very much like to hear if you have a better solution for how to
> > convey that information from the device tree to here.
>
> At very least this code should have something like above in the comment.

Will add!

> ...
>
> > > > +               if (din != 0xff)
> > > > +                       reg_din = sfp->base + GPIO_IN_OFFSET + 4 * din;
> > > > +               else
> > > > +                       reg_din = NULL;
> > >
> > > This looks like you maybe use gpio-regmap instead?
> >
> > This was discussed at length when Drew sent in the GPIO part of this code:
> > https://lore.kernel.org/linux-riscv/20210701002037.912625-1-drew@beagleboard.org/
> > The conclusion was that because pinmux and controlling the pins from
> > software in GPIO mode uses the same registers it is better to do a
> > combined driver like this that can share the lock among other things.
>
> And what does prevent exactly to base the GPIO part on gpio-regmap?

Other reasons are that gpio-regmap doesn't implement the .set_config
and .add_pin_ranges callbacks. add_pin_ranges is needed because the 64
GPIOs map to different pin numbers depending on the chosen "signal
group".

> ...
>
> > > > +static const unsigned char starfive_drive_strength[] = {
> > > > +       14, 21, 28, 35, 42, 49, 56, 63,
> > >
> > > Why table? Can you simply use the formula?!
> >
> > Heh, yeah. So these are rounded values from a table and I never
> > noticed that after rounding they follow a nice arithmetic progression.
> > It'll probably still be nice to have an explanation in the comments
> > about the formula then.
>
> Yup!
>
> > > > +};
>
> ...
>
> > > > +               irq_set_handler_locked(d, handle_bad_irq);
> > >
> > > Why is this here? Move it to ->probe().
> >
> > My thinking was that if something tries to set a an unsupported irq
> > type, we should make sure the caller doesn't get spurious interrupts
> > because we left the handler at its old value.
>
> You already assigned to this handler in the ->probe(), what's this then?

But userspace could fx. first request IRQ_TYPE_EDGE_BOTH through the
gpio api and later load a driver that might request an unsupported irq
type right? Or am I missing something.

> ...
>
> > > > +               if (value <= 6)
> > > > +                       writel(value, sfp->padctl + IO_PADSHARE_SEL);
> > > > +               else
> > >
> > > > +                       dev_err(dev, "invalid signal group %u\n", value);
> > >
> > > Why _err if you not bail out here?
> >
> > My thinking was that if the device tree specifies an invalid signal
> > group we should just leave the setting alone and not break booting,
> > but still be loud about it. Maybe that's too lenient and it's better
> > to crash and burn immediately if someone does that.
>
> Here is inconsistency between level of the message and following action.
> There are (rare!) cases when it's justified, but I believe it's not the
> case here. You have two choices or justify why you have to use error
> level without stopping process.
>
> ...
>
> All uncommented stuff you agreed on, correct?

Yes, thank you! (.. or at least I'll get back to you if something comes up ;)

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
