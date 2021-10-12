Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B996CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 20:08:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF526101D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 20:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EF526101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odjq8RATd+YYJUXfC30KepJ9rELDPmdP3RcVsg+YEF4=; b=mdI8pDikQgFEBw
	DZnZlV21lchVA8UG4/j3PsR6WnEaLL78vNhUEdpB/rXtb7caioRBLDRNWoLTfGKvjgBOAs8dDXh/b
	ZNRiLUd7CQf9hOFEooyxNsObQfnxh59HuNW2wbwmanB5mKUJZ0QKoMP2USKMLeYukAQrZwcn6bwWc
	5EAq8TfDI9Rhw8t4ff2ysPRqUsvfu6vw2Lid+MU55OdvQYKLVQAcBsJmF69V2tdsiE/BaonZ4EC50
	Ie+x5IMlyBZ4ekN1XSMykKaxnFVN0XknOZ4bfqlvirW7u0LgFzG+WywAM8DeV4TRwNoMrbs+NhbsE
	4I8+iHFMiAYRpxkVmzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maO4N-00Dtuo-Rl; Tue, 12 Oct 2021 20:08:15 +0000
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maO4K-00Dttl-6N
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 20:08:14 +0000
Received: by mail-pg1-f170.google.com with SMTP id q5so158546pgr.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 13:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbdMoLR3MNqiC0LoQYT4MoOoKEf+V9eiB1j1hxhS9ig=;
 b=T18ggbr8aK5+kwOXDwZ43/CkWfd5c/KYcFZHWX0j4YH+ehYmAMOfe21D4dYA3LTp+e
 Adl7VGmG/+FJf+ONbK8thQiBMeRL1MNbborBNF4tU6aZdCrLdaBQV/7c5cugeXyxocVr
 26zBrh8TjxPpejhHfXdwWnZYDHzivan3GAAMQ8ZQTpL0unqUzWjgDPJjZP4jPRhwi/YL
 ySmkhwaiA1JWh9T/Tsn+VdhJd41qmvEU1SSgOr767uTDYsAWVnNKSmOctk3EnEjo1b/P
 mlO51JMzCNRA1XctHkZdWtgR1puBKqxUy1LMzcsu2g/FxZsCUsp4SNQlHnrs25nNC9PT
 TeTQ==
X-Gm-Message-State: AOAM530GFvVDebZtvU1pSv5HY5rqlLAGwZPvizwEUMO5LK9/yDkvoGhg
 Z3+K5YPkcQ5GWiPLJr3jKbEn4tseb0U/ishOsF+mWlI3UxM=
X-Google-Smtp-Source: ABdhPJxIEhT0A0wVpkAWyb3hc4t9hpN8499Vhqb8Bd3ysP1JQepCnuyK3svchcCWMyR37vDvVIpRQ22WzQAamqTLU+8=
X-Received: by 2002:a63:b11:: with SMTP id 17mr24269485pgl.51.1634069289917;
 Tue, 12 Oct 2021 13:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-7-kernel@esmil.dk>
 <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
In-Reply-To: <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 12 Oct 2021 22:07:58 +0200
Message-ID: <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211012_130812_268558_F367089D 
X-CRM114-Status: GOOD (  35.52  )
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

On Tue, 12 Oct 2021 at 17:40, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Add a driver for the StarFive JH7100 clock generator.
>
> ...
>
> > +config CLK_STARFIVE_JH7100
> > +       bool "StarFive JH7100 clock support"
> > +       depends on SOC_STARFIVE || COMPILE_TEST
>
> > +       depends on OF
>
> Why? I haven't found a compile dependency, so you reduce the test
> scope (when COMPILE_TEST=y).

My thinking was that it can't ever be loaded on a !OF system, but
you're right it'll just restrict compile testing. I'll remove, thanks.

> ...
>
> You are using
> bits.h
> mod_devicetable.h
> which are not here
>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/overflow.h>
> > +#include <linux/platform_device.h>
>
> ...
>
> > +       value |= readl_relaxed(reg) & ~mask;
>
> value is not masked, is it okay?
>
> Usual pattern for this kind of operations is
>
> value = (current & ~mask) | (value & mask);

This function is only ever called with constants, already masked
values or the parent number from the clk framework, so it should be
ok.

> > +       writel_relaxed(value, reg);
>
> ...
>
> > +       if (div > max)
> > +               div = max;
> > +
> > +       return div;
>
> return min(div, max); ?
>
> ...
>
> > +       rate = parent / div;
> > +       if (rate < req->min_rate && div > 1) {
> > +               div -= 1;
> > +               rate = parent / div;
> > +       }
>
> Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
> decreasing div by 1 will satisfy the conditional again?

Maths unless I'm mistaken: div = DIV_ROUND_UP(parent, target), so in
rational numbers
  div - 1 < parent / target
But the target is clamped by min_rate and max_rate, so
  min_rate <= target < parent / (div - 1) = rate

Sorry, re-using the rate varable for both the target and result is
confusing. I'll fix that.

> ...
>
> > +#ifdef CONFIG_DEBUG_FS
>
> Perhaps __maybe_unused?

I can definitely use __maybe_unused for the function declaration, but
then I'll need a conditional every time clk_ops.debug_init needs to be
initialized to either the function or NULL depending on
CONFIG_DEBUG_FS below. Is that better?

> > +#else
> > +#define jh7100_clk_debug_init NULL
> > +#endif
>
> ...
>
> > +       if (idx >= JH7100_CLK_END) {
>
> > +               dev_err(priv->dev, "%s: invalid index %u\n", __func__, idx);
>
> __func__ means that the message has no value on its own. Make it
> unique without using __func__, or drop completely.
>
> > +               return ERR_PTR(-EINVAL);
> > +       }
>
> ...
>
> > +       for (idx = 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
> > +               struct clk_init_data init = {
> > +                       .name = jh7100_clk_data[idx].name,
> > +                       .ops = jh7100_clk_data[idx].ops,
>
> > +                       .num_parents = ((jh7100_clk_data[idx].max & JH7100_CLK_MUX_MASK)
> > +                                       >> JH7100_CLK_MUX_SHIFT) + 1,
>
> With temporary variable this can be better written, or consider
> something like this
>
>                        .num_parents =
>                                ((jh7100_clk_data[idx].max &
> JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT) + 1,
>
> > +                       .flags = jh7100_clk_data[idx].flags,
> > +               };
> > +               struct jh7100_clk *clk = &priv->reg[idx];
>
> ...
>
> > +       while (idx > 0)
> > +               clk_hw_unregister(&priv->reg[--idx].hw);
>
> The
>
>        while (idx--)
>                clk_hw_unregister(&priv->reg[idx].hw);
>
> is slightly better to read.

It's not something I'll insist hard on, but I must admit I disagree.
To me the above looks like cartoon characters running off a cliff and
back. As a middle ground could we maybe do this?

  while (idx)
    clk_hw_unregister(&priv->reg[--idx].hw);

> > +       return ret;
> > +}
>
> ...
>
> > +static int __init clk_starfive_jh7100_init(void)
> > +{
> > +       return platform_driver_probe(&clk_starfive_jh7100_driver,
> > +                                    clk_starfive_jh7100_probe);
> > +}
>
> > +
>
> No need to have this blank line.
> > +subsys_initcall(clk_starfive_jh7100_init);
>
> Any  explanation why subsys_initcall() is in use?

TBH I just inherited that from Geert's first mock driver and never
thought to question it. What would be a better alternative to try?

Thanks!
/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
