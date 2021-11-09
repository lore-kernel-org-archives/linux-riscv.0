Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B900FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80A8B61184
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80A8B61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgO8V4fPpXbhyBg90dldpMtHuXW+cPSxpTS3RG+PNlI=; b=4bPbIPph8toPJz
	lAdy2DOvPxaViCDCsoJcHJmOO2uWkaQ4mj4fYqSp8EsCw14Igez8JJLKZGjizq5wXe2fco85XGXRV
	gjGnu8SOGiGJAhkZlERjB7l/leuIqWZcuKj+Y+dQw8Sckg7M0NjWazXg/XA8JkSDVp///ldi4XjCy
	63B2Xb7cRZ1YAfr4O3HiVtieJsG44Um0yyH/ih49UTkCGt7zGep7mHeQvRQPxoLPM/qJkUDbTng4T
	ato1bGv7FAfgznk5qyH9fZIf6LzNNLPgL5nDnCe1M5k2RIu2MtEz70q1Tbfy5UlJ5w/N68hEzO/Fd
	seA4a5d0RyMcPZZPlT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNda-001HOp-VF; Tue, 09 Nov 2021 09:41:55 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNc2-001GvD-5e
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:40:20 +0000
Received: by mail-pl1-f169.google.com with SMTP id n8so19902592plf.4
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bi+4EcCOJ07EIdzMMOuINB1xKKX7YpFZJOF2Giniox8=;
 b=Mi0Ih1IVSF5xrntSAKA80KD2X7bQf4QH6rOLTvj2FQOXjEdr5h3gTZyENPghIbU8mT
 o0j0UCZgRGSrt4JZGSTVGUhX98sWWU/jFnU8uVa+CBoRx94koH0H3ee5Gd3oRW+1ybu0
 d5ncHtpDklvVIdgAEb4pICS8p2WZHHJ04l9naqK1vgx1Zs6JMeOyaUcF4pyqiVCgcCf+
 BgqYdtMe1ICLbsxrdlThqjDcJhskBjZkjNu3U6zEI7Ixxx5mYUN7kFoJrGqw0EL0siVp
 v+5TRp9yhFBNpMJ85cQ7E0TINl+mBYY/y7r58TFTpnyq78PeIdbIHb+o6Jo/vIxKA/LN
 4+pw==
X-Gm-Message-State: AOAM530YPb6aL9k5brrmo/bPsGS+oDoayokC3FEgEQ+RuGcNGOYlgv+O
 Vu9wN6rE+CSJjuw9U27EUNppPLbHTiu3b//A9Tc=
X-Google-Smtp-Source: ABdhPJwVbz77xeGB/DO7Z/uALHz4oERmvzBmgKOdVHHAT5yOLcAGrWV4NruNJN0Ckdd1t2k8MomEyPTsH64A2B+ZHeA=
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr4174899pjb.160.1636450816945; 
 Tue, 09 Nov 2021 01:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
In-Reply-To: <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 9 Nov 2021 10:40:05 +0100
Message-ID: <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
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
X-CRM114-CacheID: sfid-20211109_014018_266496_2A9F1BAA 
X-CRM114-Status: GOOD (  36.19  )
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

On Tue, 9 Nov 2021 at 10:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 9, 2021 at 11:21 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 9 Nov 2021 at 02:01, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > > Linus any comments on this code (sorry if I missed your reply)? The
> > > > idea behind above is to skip all settings from the same category and
> > > > apply only the last one, e.g. if we have "bias set to X", ..., "bias
> > > > disable", ..., "bias set to Y", the hardware will see only the last
> > > > operation, i.e. "bias set to Y". I think it may not be the best
> > > > approach (theoretically?) since the hardware definitely may behave
> > > > differently on the other side in case of such series of the
> > > > configurations (yes, I have seen some interesting implementations of
> > > > the touchpad / touchscreen GPIOs that may be affected).
> > >
> > > That sounds weird. I think we need to look at how other drivers
> > > deal with this.
> > >
> > > To me it seems more natural that
> > > starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > > would get called at the end of each iteration of the
> > > for (i = 0; i < num_configs; i++) loop.
> >
> > That would work, but when the loop is done the end result would be
> > exactly the same.
>
> It seems we interpret the term "result" differently. The result when
> we talking about GPIOs is the series of pin state changes incl.
> configuration. This is how it should be recognized when programming
> hardware.
>
> >  The only difference is that the above would rapidly
> > "blink" the different states during the loop until it arrives at the
> > result. This would certainly be different, but it can never be the
> > intended behaviour and only a side-effect on how the pinctrl framework
> > works.
>
> Is it? That's what I'm trying to get an answer to. If you may
> guarantee this (the keywords "intended behaviour" and "side effect"),
> I wouldn't object.
>
> > The order the different states are blinked depends entirely on
> > how the pinctrl framework parses the device tree. I still think it
> > would be more natural to cleanly go to the end result without this
> > blinking.

Hmm.. but if going through the different states is what you want, then
wouldn't you need the device tree to have an ordered list of the
states rather than just a single node and also a way to tune how long
time the different states are blinked?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
