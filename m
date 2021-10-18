Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16562C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 16:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFAD461074
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 16:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFAD461074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mi27D9xs995XH61o8ayIryR4nX7JxzaPoBkVBOX541w=; b=0g3G0mB44WuazB
	vQ94BZOfJelusAYmGCNxPLtAkU202o0P/RxNDVquw15ukSPbhMc3TENHKVklin/RmlsPsuBzvQfa5
	X2EmUR74GtLLTZBqlnw48XtUfeE5cRf3HF67QfovFmj/wh3Wrk0jn0xhOv0QCCJkI2ZtdXJF4XHW/
	QZethZCj5WqyxHPsF67MM+2CE4tsXFRzX4Tm7MEC09Kaip/mgpz3mhPFXdleeWFWCOYVQgree7yXi
	3QXHoNNgsjR0JWpxzJu29CsPbvxzWmD10u5UqbpNzSDB3ncSpN/a82br5rmC2N3YkqNjUoDicxcgQ
	cFjlzr/9Xgqk3DB9UUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcVQt-00GV23-OL; Mon, 18 Oct 2021 16:24:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcVQq-00GV1P-Hg
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 16:24:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id ec8so1315746edb.6
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4AoWD6SUSp4eEkyuJq6IaHqc5Bg04FTz6+o3BhvQ67Y=;
 b=KJqDiPYTT/bMwQDSoKUkqHAP38O8D294FHNqUDp3xA3Z4Pn1mMnr5oawZCV8E+lKmZ
 uFLlOCCBzEQaO9lQya58tUWAQproLR8BKqkir6cY7cOsmW2z5ZME2USL+wFaZ/9dgcfl
 SBzQzLZSJwZEJzar6cDLijRBoz3TH1AoQMLd7RTPZoL8pkbr5Vd7C8S7q2wQn/fS1Kal
 rwgM3GauvFn2rJAn6ZArNfKlK+/qb8HgwvKJ8AtGbgIAhcILUG4GzrKSRqry1ObRyepG
 D44rUAGl8dQbTmbziVLkxfaGDPns+gODuT3QKDJLaObrjYpa210HShFcIX1dsO1D/NWx
 gpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4AoWD6SUSp4eEkyuJq6IaHqc5Bg04FTz6+o3BhvQ67Y=;
 b=Jbtke41n6g3RKRPwOGH8GABsBcoY8VirMsEgRScU09CRG5bpYcF/ywGRaxpzB6QA/N
 wabCphaBcH33VNREgwzZYJNZC4MPic/zYHqladWVufmEUVcw4H+uRelFPNFbgipb725r
 lQ2UpSNKpJtRfD3H+dPbjDMrLfmzUBuawPMbELwp/91cfNZbsA85uAY0J8oA1yfQc1gi
 Kf9SzfxIP8S6xMxix7jmviuzLb9IdyX9rQ17F3qKjjIY6jaoWOukBWBrWETfy3yXhAdg
 8E8OfMMOTXdU1XhSoW6tpb05erdcdsPxxUFrxfgVib3Zakz2LkeDoVK8XktGHWLf5bg1
 wdYQ==
X-Gm-Message-State: AOAM533Li6jqQxFjhzKmrSBu3MqjqNZ3yhhtebic8pCGtL6f5M+jBQhm
 onZLEp/sncRf5MHWwZ003p6Kh/ul2Vw5Me2b5W0=
X-Google-Smtp-Source: ABdhPJyebo/9QgAnb9IJTkImn44hpM+UV1/Wh9aELlMLlpQ7p3Mua6sC+spKPtZOp/U6IHHkhEj3B+z/09rGnN+QAfQ=
X-Received: by 2002:a50:e188:: with SMTP id k8mr47408145edl.119.1634574250577; 
 Mon, 18 Oct 2021 09:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
In-Reply-To: <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 19:23:17 +0300
Message-ID: <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
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
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_092412_609461_0478DE0B 
X-CRM114-Status: GOOD (  32.76  )
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

On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > >
> > > > > +                       mask |= PAD_BIAS_MASK;
> > > >
> > > > Use it...
> > > >
> > > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > >
> > > > ...here. Ditto for the similar cases in this function and elsewhere.
> > >
> > > I don't follow. How do you want me to use mask? If I did value =
> > > (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> > > configuration. Eg. suppose the first config is the drive strength and
> > > second disables bias. Then on the 2nd loop mask =
> > > PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> > > would be wiped.
> >
> > Collect masks and new values in temporary variables and apply them
> > once after the loop is done, no?
>
> But that's exactly what the code does. It merges all the config
> options into a single mask and value so we only need to do rmw on the
> register once.

Then masking the value makes no sense.
What you should have is simply as

  mask |= FOO;
  value |= BAR;

...

> > > > > +       ret = clk_prepare_enable(clk);
> > > > > +       if (ret) {
> > > >
> > > > > +               reset_control_deassert(rst);
> > > >
> > > > Use devm_add_action_or_reset().
> > >
> > > I don't see how that is better.
> >
> > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > the probe, or don't use it at all. Above is the more-or-less standard
> > pattern where devn_add_action_or_reset() is being used in the entire
> > kernel.
> >
> > > Then I'd first need to call that and
> > > check for errors, but just on the line below enabling the clock the
> > > reset line is deasserted anyway, so then the action isn't needed any
> > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > lingering unneeded action or code to remove it again vs. just the line
> > > above.
> >
> > Then don't use devm_*() at all. What's the point?
>
> I'm confused. So you wan't an unneeded action to linger because the
> probe function temporarily asserts reset for 3 lines of code?

I;m talking about clk_prepare_enable().

...

> > > > > +       sfp->gc.of_node = dev->of_node;
> > > >
> > > > Isn't GPIO library do this for you?
> > >
> > > If it does I can't find it.
> >
> > Heh... `man git grep`
> > Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`
>
> That's exactly what I did.

Now look at the result and find the correct place where it's done.
Btw, all hits are in the very same function.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
