Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A270C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 10:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5BA860F46
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 10:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5BA860F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G5NNrv01tBsG+kbZhKTs4k30ryf/t+SYQ/PDqZ6rV0=; b=geTdpLGQPcgfjt
	N43tZSo6x5JnEI1JjIqxa1m0xQ+AOK48LuKtQuqXrajYebfw2nVe9qgCozzuw0GGNTGyq8qd57Z3j
	4jfpCaPX4O88q9QnLyb0UXMvMbD10sACrauM9T0YDqMr7mzcQlJr06zIlEMQRZL8v1eYddUdA1I7z
	9O238d9HWKjeXTNXXibSqQquXDVFL9JPV0aI3xPzbOqCq1f70QHmndZjDIdWqs4YoTSVIycNgwi9o
	E+SaRXdIGYhBDif4OGm25cv29coYfkR881SfI036tvcvLqUVVHef5R/mdaOWsqMQ8PCC3TiHjs9i0
	RLJD77gErJVyiIsIOtJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mex9N-00G5Kv-PK; Mon, 25 Oct 2021 10:24:17 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mex9K-00G5Js-HI
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 10:24:16 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so440509pjb.5
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 03:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqpRkNGcBa4r2kC+JorAkGEhmiT7Agi5fOZoubtSR8I=;
 b=D03u7ImR3aMIpD1EIPBSvpThk/vp3AyKe0CYFn54AdKZ9jsu74gLp9MFP9cONf7ekL
 /OAgoIiO+cEHlAGgV7Pp1OR0WubsQNNrvOyb9/Eije9S4QkAFPoTZA7Oi2xzMmGVxZ0V
 oVTmADLbztHo8BwJ4SbRLyfQj/uZwMSchNnZ0ZuVF8TzF80KBsy6mIDogUSczhJtBtup
 RLFNcA2F+H1ib/IZTV/scL8K5mlnCKMM215nOXLfmDzvwau2/oD5kHu2bBBVjhoKpaiP
 o3U8VWl2k6ctIKQYF3EaR8yb23569xPlVCSQ+tczK/P4/WNOqZpDTEvBfV66OoFspt53
 pSZg==
X-Gm-Message-State: AOAM531nmG3i46tL1bUdmvBGfqJcDXhf8czJEbuDc8bT3ZAm88aaBQi6
 NoBpYAdQAD72p6QEUV0ZiQFXPBd52X6O0x2Tcso=
X-Google-Smtp-Source: ABdhPJy9SGueiTS1iMnEgVgoxpq3IdFoF9n5zbGrMfnkkwkORjR9dXvyt10AlvWYi11K5yos8TLJ82MKo2jyCe6IJgc=
X-Received: by 2002:a17:90b:4b90:: with SMTP id
 lr16mr15681569pjb.160.1635157453246; 
 Mon, 25 Oct 2021 03:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
 <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
 <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
 <CANBLGcxnmt4Ki4EHAXeoJX5mJMyeioZXhGaDsKm_wk86D4js3Q@mail.gmail.com>
 <CANBLGcyOfo3r0Viidf9kyW0Q9yD4uqTLm90+7O=T49v7ZHurfA@mail.gmail.com>
 <CAHp75Vc1EES8c7XD-MbQNdtCJA3YvvEYd3_e378rVCe6=AmhvQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc1EES8c7XD-MbQNdtCJA3YvvEYd3_e378rVCe6=AmhvQ@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 25 Oct 2021 12:24:02 +0200
Message-ID: <CANBLGczXN4JV1Xrym_YGiAvrOFwkd4-PDjfvL93ZMgePb7wFVA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211025_032414_616545_50975444 
X-CRM114-Status: GOOD (  38.72  )
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

On Mon, 25 Oct 2021 at 12:16, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Sun, Oct 24, 2021 at 12:29 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Sat, 23 Oct 2021 at 23:02, Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Sat, 23 Oct 2021 at 22:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > So is that a yes or a no to my question? It's not clear to me.
> >
> > I see now that you've probably misunderstood what the code does. It's
> > not one time use. The function parses the device tree and dynamically
> > registers groups and functions with the pinctrl framework. Each group
> > needs a string name, an int array of pins and optionally the pinmux
> > data. Once the group is registered those pieces of data needs to live
> > with the group until the drive is unloaded. But if the device tree
> > parsing fails before the group is registered then those allocations
> > would never be referenced and just hang around as garbage until the
> > driver is unloaded. In such cases fx. pinctrl-single uses devm_free to
> > free them again.
>
> Thank you for elaboration. Please, drop devm_*(). In this case it's
> inappropriate to use it. pinctrl-single should be amended accordingly,
> but it's out of scope here.
>
> ...
>
> > > > > I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> > > > > don't see why it's better to do the rmw on the padctl register for the
> > > > > first bias setting only to then change the bits again a few
> > > > > microseconds later when the loop encounters the second bias setting.
> > > > > After the loop is done the end result would still be just the last
> > > > > bias setting.
> > > >
> > > > It could be bias X followed by something else followed by bias Y. You
> > > > will write something else with bias Y. I admit I don't know this
> > > > hardware and you and maintainers are supposed to decide what's better,
> > > > but my guts are telling me that current algo is buggy.
> > >
> > > So there is only one padctl register pr. pin. I don't see why first
> > > setting the bias bits to X, then setting some other bits, and then
> > > setting the bias bits to Y would be different from just setting all
> > > the bits in one go. Except for during that little microsecond window
> > > during the loop that I actually think it's better to avoid.
> >
> > Maybe an example is in order. Suppose we get strong pull-up, drive
> > strength 3 and pull-down config flags (the strong pull-up and pull
> > down flags conflict) and the padctl value is 0x0c0 (pull-up, input and
> > schmitt trigger enabled). With your solution of just altering the
> > padctl bits immediately we'd call starfive_padctl_rmw 3 times in rapid
> > succession like this:
> >
> > starfive_padctl_rmw(pin, 0x130, 0x100);
> > starfive_padctl_rmw(pin, 0x007, 0x003);
> > starfive_padctl_rmw(pin, 0x130, 0x010);
> >
> > ..and the end result would be 0x0d3, although the strong pull-up would
> > be enabled for the microseconds between the 1st and 3nd call.
> > As the code is now it'd just directly do
> >
> > starfive_padctl_rmw(pin, 0x137, 0x013)
> >
> > ..which again results in 0x0d3, only without the microsecond blink of
> > the strong pull-up.
>
> You missed the point. Hardware on the other end may behave well
> differently in these two cases.

Right, but that can never be an intended behaviour. Which of the
conflicting bias settings comes first and is blipped before the 2nd
remains entirely depends on how the pinctrl framework parses the
devicetree. I'd much rather have it cleanly go to just one of the
states, which might be the wrong one, but the conflicting bias
settings are wrong to begin with.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
