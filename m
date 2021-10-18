Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D60C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 16:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB0B61002
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 16:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECB0B61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VGPclcjFcLs242lA7fB52y2ow1s/uuCOFlEsLoscqo=; b=veGcMm1dr8wgyq
	HmkB2ICoTdz6XhaAStGFr3DThFweqfcz4G2uwoXVBNkG88ZOiDCFCxjPm99a/L+l5f7wG4TVmQD6f
	hWfVjrxzslAnLa+1SBj31myi9wUK6hEi5BDfPg+0qurFugLaf4jubhrVZw3DiFdC/wNWDQvdZyK+w
	RFnuep1QkzwWgNKkfZyc6w5eUXz6z0xAPS6uwKZMDcfHiMBEIq9AQXIouVzVHKnPtUF72EcCSixzg
	qWCyDMmnND3crEumgymLjeXXIXs5Fs1IPRGsIA+lhPTyTfYqoiOY66zSPjwlj5dM0BqT7SK1pOEOA
	qdq6thI6a5VmKMCAx+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcVbh-00GVqK-KH; Mon, 18 Oct 2021 16:35:25 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcVbe-00GVpe-Js
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 16:35:24 +0000
Received: by mail-pl1-f178.google.com with SMTP id l6so11620514plh.9
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 09:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t0ejuGV5Mekv33Ke5yZ2hDIuNqOJx8vNh5URYlHnJto=;
 b=sV+FPmhFPlnZaUFKD8us89cnurWpY10RJzEmae/j1/NozrW4r3TjjTTZTWRpsX9xvj
 mNM1A6LtaZ92PCwgO6VRBcWC2uB4/IaF42rZTK+tqxTb1d2Mr+snKxJZnkgC/TkPqYnl
 We3F6T2Dtkjjs9EzX/a3AEeC6Jr+P1RAQQB/XDTLAce4MwSMSPQ83AVK1o2uRpf6cDGg
 FNsEto2aK7b9SNXfeLYvNEEAa/TodVa5wZYg35nf2RnKdCQUDTdfk3mQfg3SpTvz2oWp
 z4TsHwjUgcfT7I5SQPhImVx63/YX+B8xwj5PGYb046I5sEICsqdqnWIV6Xsjokkv4GE1
 rnuQ==
X-Gm-Message-State: AOAM5314dCyBAugAcr8VOMFu+X1zUg7IYY4M4Mx0injxjlmNnfsjvATR
 t5te+ltLnqsaM+GmkK0SAoBUZ9SrLK0bWcyWU54=
X-Google-Smtp-Source: ABdhPJwvaMOxnoenZJe9/ILtrcFiCQv9WRvnnA+r4NIrZLRlZciSQOo/t9cppApR2frz6pS5hFOQgQA/Yz9/Zrjvuhw=
X-Received: by 2002:a17:902:7783:b0:13d:fee6:8095 with SMTP id
 o3-20020a170902778300b0013dfee68095mr28042663pll.7.1634574921896; Mon, 18 Oct
 2021 09:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
 <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
In-Reply-To: <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 18 Oct 2021 18:35:10 +0200
Message-ID: <CANBLGcw1qMB7r7TbuQEevOPHq94wAtZNs=yFQ3UP_DEREvGz6g@mail.gmail.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_093522_677284_EF527733 
X-CRM114-Status: GOOD (  37.77  )
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

On Mon, 18 Oct 2021 at 18:24, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > > >
> > > > > > +                       mask |= PAD_BIAS_MASK;
> > > > >
> > > > > Use it...
> > > > >
> > > > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > > >
> > > > > ...here. Ditto for the similar cases in this function and elsewhere.
> > > >
> > > > I don't follow. How do you want me to use mask? If I did value =
> > > > (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> > > > configuration. Eg. suppose the first config is the drive strength and
> > > > second disables bias. Then on the 2nd loop mask =
> > > > PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> > > > would be wiped.
> > >
> > > Collect masks and new values in temporary variables and apply them
> > > once after the loop is done, no?
> >
> > But that's exactly what the code does. It merges all the config
> > options into a single mask and value so we only need to do rmw on the
> > register once.
>
> Then masking the value makes no sense.
> What you should have is simply as
>
>   mask |= FOO;
>   value |= BAR;

Yeah, but then we could get into weird states if the device tree
specifies both bias-disable and bias-pull-up by mistake. This code is
written so that only the last valid state is chosen.


> ...
>
> > > > > > +       ret = clk_prepare_enable(clk);
> > > > > > +       if (ret) {
> > > > >
> > > > > > +               reset_control_deassert(rst);
> > > > >
> > > > > Use devm_add_action_or_reset().
> > > >
> > > > I don't see how that is better.
> > >
> > > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > > the probe, or don't use it at all. Above is the more-or-less standard
> > > pattern where devn_add_action_or_reset() is being used in the entire
> > > kernel.
> > >
> > > > Then I'd first need to call that and
> > > > check for errors, but just on the line below enabling the clock the
> > > > reset line is deasserted anyway, so then the action isn't needed any
> > > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > > lingering unneeded action or code to remove it again vs. just the line
> > > > above.
> > >
> > > Then don't use devm_*() at all. What's the point?
> >
> > I'm confused. So you wan't an unneeded action to linger because the
> > probe function temporarily asserts reset for 3 lines of code?
>
> I;m talking about clk_prepare_enable().

Ok, you wrote your comment under the reset_control_deassert call. How
would devm_add_action_or_reset for clk_prepare_enable work?

> ...
>
> > > > > > +       sfp->gc.of_node = dev->of_node;
> > > > >
> > > > > Isn't GPIO library do this for you?
> > > >
> > > > If it does I can't find it.
> > >
> > > Heh... `man git grep`
> > > Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`
> >
> > That's exactly what I did.
>
> Now look at the result and find the correct place where it's done.
> Btw, all hits are in the very same function.
>
> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
