Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33764C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 15:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A511760FD8
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 15:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A511760FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BThMfVq2KEIv+N/CsOyAPJUhRXNSN/i6FKT9PFSsU04=; b=Hjvt5gptyblA3Z
	6Zfq0qT+9uc6Biw0AWayAUDTf2Rc5pvODfuQnizxx7S6+g49s48/akGC6rGtBSIfm8zd3uHQ+6or2
	F/LueY1dKdvRIJ+IoHeuIMA7j2FYYXoYBWmJ9r0eHMsB84a7vstr6QyBc/66UjQ1mNY2Sy7Rh1Kio
	3U5CaC3vv6v4SEj9TVg9Mj1Q+d/FLi2gQyTDkTVkmnMJOfCMh+H+hyMD676gFXRPl+8UGiROAhb87
	vTvV3EwyukFH6bx5UYG/G8/lFyraZTuvj/YNhDKhgLZRpuQf/AVWif7O7JB1jE2GqQ3qMRrxV98/V
	HxsvU/hY9ZytZAdzMa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcUzu-00GQjR-72; Mon, 18 Oct 2021 15:56:22 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcUzq-00GQhY-IW
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 15:56:20 +0000
Received: by mail-pl1-f171.google.com with SMTP id f21so11561438plb.3
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 08:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sz77FGY3TYZu+DudMczIxYP7Uz431ugMBdntq9R2j6g=;
 b=SnNWa+IqXJEyxUM0fwOkO394Zvib4MAey4HCg7Sueg1JHdgsHAvI3l0gNEVT9jYBI/
 BgLnBYO3bOkBWhEd9TBSWkktXqXOF/y8gtWhJGVCVY7nA5o6cZxNOVnTddO4gcVui57o
 WexlDGAu9e95379HPPJiikpY2GYbR3hYbAJJaJ82l0NHXA75mkfoHTLFjsJDvO9a/LmE
 3EICtpyPnuAxKw5x7kkgSpmQeuSmy8CxxdTSO2ql1LY5JpIj7fbf67hTCPot71HUzyPb
 ESsDBcGvOtaGGGUz8kDaCQo7YCn0S79HOOG24FkEO0zsau3sR5UszFjG07bz+qXGF5HH
 vgdQ==
X-Gm-Message-State: AOAM531UhMjH8pNyvHBXtbBlO80xv8WUTxklZOnHSX1ONij/852XUDmZ
 S7I9X8jQZRhWtKd4yHfvCweU9QzlNMd8e5k6ij4=
X-Google-Smtp-Source: ABdhPJytbrnjvXDqXeJ32Cr4x0roS+Ri36aOfdjuS8Ff/22AEVjBwE3WwhfM7pfyCnhYscJ4ErQEhShdpzuzuK3o9YA=
X-Received: by 2002:a17:90b:694:: with SMTP id
 m20mr48766296pjz.160.1634572576629; 
 Mon, 18 Oct 2021 08:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
In-Reply-To: <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 18 Oct 2021 17:56:05 +0200
Message-ID: <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211018_085618_651721_6797FFA2 
X-CRM114-Status: GOOD (  32.13  )
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

On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> When answering, cut down your message to the point, please! It's a bit
> annoying to remove overquoting...
>
> ...
>
> > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > >
> > > > +                       mask |= PAD_BIAS_MASK;
> > >
> > > Use it...
> > >
> > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > >
> > > ...here. Ditto for the similar cases in this function and elsewhere.
> >
> > I don't follow. How do you want me to use mask? If I did value =
> > (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> > configuration. Eg. suppose the first config is the drive strength and
> > second disables bias. Then on the 2nd loop mask =
> > PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> > would be wiped.
>
> Collect masks and new values in temporary variables and apply them
> once after the loop is done, no?

But that's exactly what the code does. It merges all the config
options into a single mask and value so we only need to do rmw on the
register once.

> ...
>
> > > > +       ret = clk_prepare_enable(clk);
> > > > +       if (ret) {
> > >
> > > > +               reset_control_deassert(rst);
> > >
> > > Use devm_add_action_or_reset().
> >
> > I don't see how that is better.
>
> Pity. The rule of thumb is to either try to use devm_*() everywhere in
> the probe, or don't use it at all. Above is the more-or-less standard
> pattern where devn_add_action_or_reset() is being used in the entire
> kernel.
>
> > Then I'd first need to call that and
> > check for errors, but just on the line below enabling the clock the
> > reset line is deasserted anyway, so then the action isn't needed any
> > longer. So that 3 lines of code for devm_add_action_or_reset +
> > lingering unneeded action or code to remove it again vs. just the line
> > above.
>
> Then don't use devm_*() at all. What's the point?

I'm confused. So you wan't an unneeded action to linger because the
probe function temporarily asserts reset for 3 lines of code?

> ...
>
> > > > +       sfp->gc.of_node = dev->of_node;
> > >
> > > Isn't GPIO library do this for you?
> >
> > If it does I can't find it.
>
> Heh... `man git grep`
> Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`

That's exactly what I did.

> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
