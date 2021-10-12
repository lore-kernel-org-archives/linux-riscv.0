Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC982C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 21:27:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B275600D3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 21:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B275600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqnYhPhIGgYOtU6RRo99OK/nhwjeNCbE0Ik4HaZi/dM=; b=iHRYZyKcDQ+lLg
	whvHufbFiiHyyNmZOI9R7GbyqYo+Y7CftzvTXj1ilBmiNtfAE4yX5tT2kTdClCJxQVgZ8cuJwNde3
	BsT3DOZrX+CDkCwBJpqDokA635bOdXUCiWmrpxkzK1Q3aGDGapXX+QP5x3T88OO5xVxbBOcapRKaS
	7Lm7ZUbMCB8dnbTsEEI8PSqVDEi2S7kqzC4y8hbEZL9MiORasYMH4DS5q9oR6IkBSc1kNJ9gJs6Ki
	b5I0Ifijs//TZj0L7cS5iaJwkCUVvt4q6GGicJs2S4Vjo/ze33XUn3B7vEbHgmVl5Edo6kf3Plm+4
	Z4WE+/Eu9QGcmF+K6oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maPIK-00E1L9-Pr; Tue, 12 Oct 2021 21:26:44 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maPIH-00E1KJ-0x
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 21:26:42 +0000
Received: by mail-pf1-f175.google.com with SMTP id o133so620367pfg.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 14:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67Wm548vxd64jvyzHGx2cJ1FuE3KgBqc4EcFAWPdars=;
 b=7a+MnR6lF5+E+MpcWF33p6XLpui15wYhKN/qHCIlfw/9zGNzwJGsBTU5bj0j+s3Uqu
 IlTE+djVdJo3ecb9AOxRgGDiZx4BM5J0gBb1YQ8/1A7Z7A05fb/ulGhQYUKyZhaL7TBU
 XRkjK6xfFDvJymPfRIUfW3apyYkr5G8Td5ODH3xkVmujvq7kjzkrZL7+98I8ZKH0qxDi
 iAqNn0uNj14CyTn5lq/X/QeqBtQF98fMK1HzlNSwMMzli9Pj75MQTZysvLCQFa72PJWh
 jbEomjKPm4u/2k9+fCnjQv6U5HfsRaXZFrl+V+rDMzE9SQ6oA+ZwvaY441DXDi7RGcHU
 6KJg==
X-Gm-Message-State: AOAM532RFcUBhFdXos/d9y8QfjWbT5Zn0h8V1fnXpjah6tn1E6rlS+aq
 Z1jIjib7xBNZxNLiRhVVVSs6KDgBCUUBsCcmt8E=
X-Google-Smtp-Source: ABdhPJx3LuMpsgeccnPFD90fzK89K2LwT3vY2QzV1lqSWMBpesQf1r+E1dxT/hIFDwKbjbdR+DVtVdFWffwQUKpsJoE=
X-Received: by 2002:a62:5257:0:b0:44c:ed84:350a with SMTP id
 g84-20020a625257000000b0044ced84350amr22789150pfb.79.1634073999294; Tue, 12
 Oct 2021 14:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-7-kernel@esmil.dk>
 <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
 <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com>
 <CAHp75VcM97vcrNOG_T==E0JyZ_RT_n8MCiVtfmYQM4g8kVtegg@mail.gmail.com>
In-Reply-To: <CAHp75VcM97vcrNOG_T==E0JyZ_RT_n8MCiVtfmYQM4g8kVtegg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 12 Oct 2021 23:26:27 +0200
Message-ID: <CANBLGcxBjrhp6sfLqsKu=0hgYh+oxmozriWVCwdSKFYWtYnPmQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH7100 clock generator driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_142641_093695_9C96E405 
X-CRM114-Status: GOOD (  34.66  )
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

On Tue, 12 Oct 2021 at 23:21, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 12, 2021 at 11:08 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 12 Oct 2021 at 17:40, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > +       value |= readl_relaxed(reg) & ~mask;
> > >
> > > value is not masked, is it okay?
> > >
> > > Usual pattern for this kind of operations is
> > >
> > > value = (current & ~mask) | (value & mask);
> >
> > This function is only ever called with constants, already masked
> > values or the parent number from the clk framework, so it should be
> > ok.
>
> Up to you, but I think it's better to have a usual pattern.
>
> > > > +       writel_relaxed(value, reg);
>
> ...
>
> > > > +       rate = parent / div;
> > > > +       if (rate < req->min_rate && div > 1) {
> > > > +               div -= 1;
> > > > +               rate = parent / div;
> > > > +       }
> > >
> > > Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
> > > decreasing div by 1 will satisfy the conditional again?
> >
> > Maths unless I'm mistaken: div = DIV_ROUND_UP(parent, target), so in
> > rational numbers
> >   div - 1 < parent / target
> > But the target is clamped by min_rate and max_rate, so
> >   min_rate <= target < parent / (div - 1) = rate
> >
> > Sorry, re-using the rate varable for both the target and result is
> > confusing. I'll fix that.
>
> Also needs a comment, I believe.

Will add.

> ...
>
> > > > +#ifdef CONFIG_DEBUG_FS
> > >
> > > Perhaps __maybe_unused?
> >
> > I can definitely use __maybe_unused for the function declaration, but
> > then I'll need a conditional every time clk_ops.debug_init needs to be
> > initialized to either the function or NULL depending on
> > CONFIG_DEBUG_FS below. Is that better?
>
> Actually, why can't you always initialize the field? Shouldn't CLK
> core take care about this conditional?

It could, but I see other drivers avoiding the code bloat when debugfs
is not enabled, so I thought I'd copy that.

> > > > +#else
> > > > +#define jh7100_clk_debug_init NULL
> > > > +#endif
>
> ...
>
> > > > +       while (idx > 0)
> > > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> > >
> > > The
> > >
> > >        while (idx--)
> > >                clk_hw_unregister(&priv->reg[idx].hw);
> > >
> > > is slightly better to read.
> >
> > It's not something I'll insist hard on, but I must admit I disagree.
> > To me the above looks like cartoon characters running off a cliff and
> > back. As a middle ground could we maybe do this?
> >
> >   while (idx)
> >     clk_hw_unregister(&priv->reg[--idx].hw);
>
> My point is exactly in having the common pattern for error paths, i.e.
>
>   while (counter--)
>     ...bla-bla-bla...
>
> Your second approach is better, but I think that proposed by me is even better.
>
> ...
>
> > > > +subsys_initcall(clk_starfive_jh7100_init);
> > >
> > > Any  explanation why subsys_initcall() is in use?
> >
> > TBH I just inherited that from Geert's first mock driver and never
> > thought to question it. What would be a better alternative to try?
>
> At least add a comment to explain the choice.
>
> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
