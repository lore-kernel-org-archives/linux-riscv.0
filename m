Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9C9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 00:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA5760F0F
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 00:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCA5760F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zthuktp5os16MuKK5e6toRFxpyi1MKDbGhJuGU+fCaA=; b=mS4zPf7YCM6dMA
	buBm9R6Usx6a3ShdPPKZR7psmLMhJllrx0AshAslvJxlWsW/nG7rlqUCVgI7eCAZ/9CkKq98WY9rh
	QfYlW8VPBMoD/MJbSeQn3uG25hf+gT37+GtcrBHV1CcEVwZ+jKXS02TyL6u4WZ71Egctf6uq4VPes
	+ydUejlwiA7W+B1SgSUjdpdTV+l6UdhH0LlBGOujrhiYUcEf6MOKRsgPomC2l+baZ6eaGGLaP/Bbi
	joPE0er+jEZHzzwoeIFm49W/JW5JHboA2NRVnYF2bl1KBW+xN7mUeQv9Y/CXfRscNpaJpIVjGmfSG
	6U75nhcPjcKTisSY37JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfXCi-003RKL-LP; Wed, 27 Oct 2021 00:54:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfXCf-003RJx-Tn
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 00:54:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 560CA60F0F;
 Wed, 27 Oct 2021 00:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635296045;
 bh=3wmPlMfs7SR783XTmRV7cR81LzMiYBMO+8TaAiydWkM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=W+ESkAeCUUskZxyaPVVNJSQLz8HBAG1zufvbuDBBq9aLfbxvCgVHNRyEwDhpCaD0u
 oHHGrJIuVMsKaMJN660eES9zVI6ZuTGSw+QtEXO/3kNu3VZXMRhFWVZUkOOWNHimJi
 zwKtwSFHkDdtmvJke91XPGHWmVbRSdg9eDy3e7anPX0kaH9xI3vYQEjDhTb1at4OTz
 xu10tcE+mm6SIX4xTkKFgEdkljbuOldIgZu8uNAgyjBJvV4HzMV/nHGOmgwlG26lFQ
 f/aBZYM0FGmjzdEFKrU813jTsN8gcKRjB95RH2fdQDNMon7HF1UI4ATU4wQRmWG34j
 k9u9vXzRpknvA==
MIME-Version: 1.0
In-Reply-To: <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
 <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 <linux-serial@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Matteo Croce <mcroce
 @microsoft.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 26 Oct 2021 17:54:03 -0700
Message-ID: <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_175406_045874_6C68D9FD 
X-CRM114-Status: GOOD (  24.72  )
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

Quoting Emil Renner Berthing (2021-10-26 15:35:36)
> On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Emil Renner Berthing (2021-10-21 10:42:13)
> > > +};
> > > +
> > > +struct clk_starfive_jh7100_priv {
> > > +       /* protect registers against overlapping read-modify-write */
> > > +       spinlock_t rmw_lock;
> >
> > Does overlapping mean concurrent?
> 
> Yes, sorry.
> 
> > Do different clks share the same registers?
> 
> No, each clock has their own register, but they use that register both
> to gate the clock and other configuration. The Locking chapter of
> Documentation/driver-api/clk.rst talks about the prepare lock and the
> enable lock and then says:
> "However, access to resources that are shared between operations of
> the two groups needs to be protected by the drivers. An example of
> such a resource would be a register that controls both the clock rate
> and the clock enable/disable state."

Alright got it. Maybe say "protect clk enable and set rate from
happening at the same time".

> 
> > > +               return ERR_PTR(-EINVAL);
> > > +       }
> > > +
> > > +       if (idx >= JH7100_CLK_PLL0_OUT)
> > > +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> > > +
> > > +       return &priv->reg[idx].hw;
> > > +}
> > > +
> > > +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> >
> > Drop __init as this can be called after kernel init is over.
> 
> Oh interesting, I'd like to know when that can happen. The comment for
> the builtin_platform_driver macro says it's just a wrapper for

I thought this was using module_platform_driver() macro?

> device_initcall.
> 
> Won't we then need to remove all the __initconst tags too since the
> probe function walks through jh7100_clk_data which eventually
> references all __initconst data?

Yes. If it's builtin_platform_driver() it can't be a module/tristate
Kconfig, in which case all the init markings can stay.

> 
> > > +
> > > +               clk->hw.init = &init;
> > > +               clk->idx = idx;
> > > +               clk->max = jh7100_clk_data[idx].max;
> > > +
> > > +               ret = clk_hw_register(priv->dev, &clk->hw);
> >
> > Why not use devm_clk_hw_register()?
> 
> I probably could. Just for my understanding that's just to avoid the
> loop on error below, because as a builtin driver the device won't
> otherwise go away, right?

Yes

> 
> > > +               if (ret)
> > > +                       goto err;
> > > +       }
> > > +
> > > +       ret = devm_of_clk_add_hw_provider(priv->dev, clk_starfive_jh7100_get, priv);
> > > +       if (ret)
> > > +               goto err;
> > > +
> > > +       return 0;
> > > +err:
> > > +       while (idx)
> > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> > > +       return ret;
> > > +}
> > > +
> > > +static const struct of_device_id clk_starfive_jh7100_match[] = {
> > > +       { .compatible = "starfive,jh7100-clkgen" },
> > > +       { /* sentinel */ }
> > > +};
> >
> > Please add MODULE_DEVICE_TABLE()
> 
> Will do!

If it's never going to be a module then don't add any module_* things.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
