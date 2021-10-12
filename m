Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FB9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 21:21:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DE8610CC
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 21:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42DE8610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xI0Dkrxzrw3Vfx+lX3BI+Tpu/ZKneg9UmYtghdu9ASA=; b=sG4GfUVdzhJeui
	RtgM2BO4UWcr//iSBO25/t8pl2I7/6kAgiUJ6e4abbtQcZWGmQhxLKkTbjdFywM/nb9piP5zeJg/Q
	+JyC9ovB+zbXorU5U9nPWEuhX3ARH+JFzb3hqDOib9ALn05zugAqQIpPJV5kPe4r655e/gATQRXuo
	PBGy7r7odki+DNal4dSyEA/HL8n/lBoEMUeojqPV/KhBZSgd++6hKw6qbum5v0Et4OH3xHVH6WZIr
	ZBQdcUjK0Y4Y4q4Bxe+k+7WsVRkSF3w5ukDtR4eKZuGyqRfvxDCYEXakEXta7dUbpQlVQdxiULdzD
	fd8pgW9FumSSAa7DBQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maPDK-00E0xW-Ge; Tue, 12 Oct 2021 21:21:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maPDH-00E0x8-Ep
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 21:21:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id p13so1687007edw.0
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOFNBJr+5UGYcXXM52CBBPVCPAsy4cPdDGbGieRT3Pw=;
 b=TjyrNYrAJjITZgQqDIhNBw1waTJz03vnWMl+Y/NcIBBjvX+/eQQKKsaNJr5LF9vE/m
 U7HF99K3buQSlliPH7Y57gW8fcassAWYG8KLcminqJ3HpgDIA4QOzM1ttT4Toam8i+zj
 loUEwm7f4uGNYNP+lEiX76DKTTWoRBqMX6MQtDuOpXW5WdtCCRfhhZbqwC9bVl/Jx137
 6zn0fRNrLwrgXBQPfibscSDKJ0TyA2u1+2N4tdOIJTICaaYl9RtiuyGYH01Vxh3gKJJe
 sbjeY31IlJkRviou4RLSupw9CNHNivQ+REiV0LHNpTHNQiiTBtoh9FtRbcU6L9o6M1md
 S3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOFNBJr+5UGYcXXM52CBBPVCPAsy4cPdDGbGieRT3Pw=;
 b=4zZ/jr596lx9scz1hcv45UBU+Hp+pmIR21GdKKqYFNVRshskJvv7I+86EA0ETCOPQa
 z7lMGm80s0gkD9SHEAPcGGC4nY5Orf740piOwD/gKedo+nAyiqbefytpfm8jgU7evji5
 ALbVE6oWMtZMTbP0Zn+Oz8JC7O7KbF8hxpb4a05M8Z7jQ6hUnBqmimlv+Tnd8Y1aQcur
 s2m/+ytLCpbnkqOmD4WrTSxAF8Y5i+W6qaxgIDrsll184GhvTDH+6Ustvv+uqDRY2cPD
 5x35WOK6mXgmDd9Q+qHd9RFoYGHiDbSYoyWG+OAxvVrTVBCEKouWLop2qzboY0ms5o5r
 T7QQ==
X-Gm-Message-State: AOAM5310fZRjczesxJ1fW5vtert8vQai+/lrneUtDirn2SKOB2ArHpaq
 FYyMhqPxp6ptOYraFyJr8t9jeaWLiK8HHLr7yLU=
X-Google-Smtp-Source: ABdhPJwEOXZ3Sz3Z+75oIHMBoXtzmDYFRay0T/yAdFIEl1UtVqX3R3fR7pveB81mNdmIUdJ/kDbGrP2U5ErDIePd6pc=
X-Received: by 2002:a17:906:5a47:: with SMTP id
 my7mr35357939ejc.128.1634073689974; 
 Tue, 12 Oct 2021 14:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-7-kernel@esmil.dk>
 <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
 <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com>
In-Reply-To: <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Oct 2021 00:20:53 +0300
Message-ID: <CAHp75VcM97vcrNOG_T==E0JyZ_RT_n8MCiVtfmYQM4g8kVtegg@mail.gmail.com>
Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH7100 clock generator driver
To: Emil Renner Berthing <kernel@esmil.dk>
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
X-CRM114-CacheID: sfid-20211012_142131_537140_3D4EE551 
X-CRM114-Status: GOOD (  30.27  )
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

On Tue, Oct 12, 2021 at 11:08 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 12 Oct 2021 at 17:40, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +       value |= readl_relaxed(reg) & ~mask;
> >
> > value is not masked, is it okay?
> >
> > Usual pattern for this kind of operations is
> >
> > value = (current & ~mask) | (value & mask);
>
> This function is only ever called with constants, already masked
> values or the parent number from the clk framework, so it should be
> ok.

Up to you, but I think it's better to have a usual pattern.

> > > +       writel_relaxed(value, reg);

...

> > > +       rate = parent / div;
> > > +       if (rate < req->min_rate && div > 1) {
> > > +               div -= 1;
> > > +               rate = parent / div;
> > > +       }
> >
> > Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
> > decreasing div by 1 will satisfy the conditional again?
>
> Maths unless I'm mistaken: div = DIV_ROUND_UP(parent, target), so in
> rational numbers
>   div - 1 < parent / target
> But the target is clamped by min_rate and max_rate, so
>   min_rate <= target < parent / (div - 1) = rate
>
> Sorry, re-using the rate varable for both the target and result is
> confusing. I'll fix that.

Also needs a comment, I believe.

...

> > > +#ifdef CONFIG_DEBUG_FS
> >
> > Perhaps __maybe_unused?
>
> I can definitely use __maybe_unused for the function declaration, but
> then I'll need a conditional every time clk_ops.debug_init needs to be
> initialized to either the function or NULL depending on
> CONFIG_DEBUG_FS below. Is that better?

Actually, why can't you always initialize the field? Shouldn't CLK
core take care about this conditional?

> > > +#else
> > > +#define jh7100_clk_debug_init NULL
> > > +#endif

...

> > > +       while (idx > 0)
> > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> >
> > The
> >
> >        while (idx--)
> >                clk_hw_unregister(&priv->reg[idx].hw);
> >
> > is slightly better to read.
>
> It's not something I'll insist hard on, but I must admit I disagree.
> To me the above looks like cartoon characters running off a cliff and
> back. As a middle ground could we maybe do this?
>
>   while (idx)
>     clk_hw_unregister(&priv->reg[--idx].hw);

My point is exactly in having the common pattern for error paths, i.e.

  while (counter--)
    ...bla-bla-bla...

Your second approach is better, but I think that proposed by me is even better.

...

> > > +subsys_initcall(clk_starfive_jh7100_init);
> >
> > Any  explanation why subsys_initcall() is in use?
>
> TBH I just inherited that from Geert's first mock driver and never
> thought to question it. What would be a better alternative to try?

At least add a comment to explain the choice.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
