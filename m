Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29711C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 10:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C3E60200
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 10:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0C3E60200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IETaXCYy9FYHM5fEwsve7rGYVPuiNFqqwBnCS33ZeQ4=; b=NkTT1UF34QRK47
	1B2NDhU1LLqORF7Injt84RtHuHzcXl2Uyi63zHM2r2v8z5o7S80oKzxYjq9IJvzovcbTbXbsfdUao
	L01/t7Vh/UTOU2+xNqza9rj4p/oDLdYpL4LFX3y7Iwuszj6ZNi4RWemGQUVQ10z6RUcjSq4uvO5N8
	2f3V63h+UG3Q5wq/q1KEAKLiOOv0OX4V6ts7zLYcEWyPSAFAA58VaLcLhCfgewI7Aoe9LA5N0biAD
	SQ9pXHX/On2GKLzebt9i6Ztg6ur6GRJ3jxVADD/JnsEU8PNTosCDpxFfTFc1mxEMUaKefZkYnSToU
	wPLs7B3qDBHlh9Rzi28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfg6Y-004YTC-Im; Wed, 27 Oct 2021 10:24:22 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfg6W-004YSf-0Y
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 10:24:21 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 y1-20020a17090a134100b001a27a7e9c8dso4340442pjf.3
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnmsZvCby2QfeCEq4jG+aVVX0WKqEYUQLOkNbKmiMRI=;
 b=8RxNOtkGboG3OSR2Q1z5xujbhz8+KwGhE05cHxvDLyYpVsm7UdGnhgsMYmUpZIbTge
 v7RAHsNCEtJszabE/5T02lqV0lHS4yExRSEzqNcaZUjgtPVAwN7M/ZV9EIi8bqXenR5j
 eLY4q08m5dNOtXMo3uCeRD6q2xLl0yYpU9b8l++E/fnw2ExI/ITtNsIFQNaNerefc3Ec
 r0uLtcQ1M/1wangTwhdYr8rAKFc5oeY0QLBnYvV8TOgphK8FXrxQqjCZ0uEaSwhfBHRx
 XYpOVPYGZvEIYoGSJvGrWMXJ6N3G9aVx4LhI8HLOy8c7A523GSESVTaskXREbDp0VWMi
 E8/w==
X-Gm-Message-State: AOAM5306IIH03swFSxldcVObMNWVDtdbixIRQwGIhW/ZkRIbjpzoVryB
 AJbJr7cBy47aYQwjVAt3cvAlbk0NFaJEBi5uvuw=
X-Google-Smtp-Source: ABdhPJy9gu/cklDFW7ZBJFI7eeGIz+A5/REdeCte6hkFXdam4UvPA67sK7GJF3AQN3H0gdwShtecUWWOG7LdpyM8VEM=
X-Received: by 2002:a17:90b:238a:: with SMTP id
 mr10mr3053885pjb.185.1635330258733; 
 Wed, 27 Oct 2021 03:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
 <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
 <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
In-Reply-To: <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 27 Oct 2021 12:24:07 +0200
Message-ID: <CANBLGcx0Udhaa3S+uSffFcB_KFHXQiMOvn8Fd7ogj+RFxQNAfQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To: Stephen Boyd <sboyd@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_032420_078971_5E376B8C 
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

On Wed, 27 Oct 2021 at 02:54, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Emil Renner Berthing (2021-10-26 15:35:36)
> > On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Emil Renner Berthing (2021-10-21 10:42:13)
> > > > +};
> > > > +
> > > > +struct clk_starfive_jh7100_priv {
> > > > +       /* protect registers against overlapping read-modify-write */
> > > > +       spinlock_t rmw_lock;
> > >
> > > Does overlapping mean concurrent?
> >
> > Yes, sorry.
> >
> > > Do different clks share the same registers?
> >
> > No, each clock has their own register, but they use that register both
> > to gate the clock and other configuration. The Locking chapter of
> > Documentation/driver-api/clk.rst talks about the prepare lock and the
> > enable lock and then says:
> > "However, access to resources that are shared between operations of
> > the two groups needs to be protected by the drivers. An example of
> > such a resource would be a register that controls both the clock rate
> > and the clock enable/disable state."
>
> Alright got it. Maybe say "protect clk enable and set rate from
> happening at the same time".
>
> >
> > > > +               return ERR_PTR(-EINVAL);
> > > > +       }
> > > > +
> > > > +       if (idx >= JH7100_CLK_PLL0_OUT)
> > > > +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> > > > +
> > > > +       return &priv->reg[idx].hw;
> > > > +}
> > > > +
> > > > +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> > >
> > > Drop __init as this can be called after kernel init is over.
> >
> > Oh interesting, I'd like to know when that can happen. The comment for
> > the builtin_platform_driver macro says it's just a wrapper for
>
> I thought this was using module_platform_driver() macro?
>
> > device_initcall.
> >
> > Won't we then need to remove all the __initconst tags too since the
> > probe function walks through jh7100_clk_data which eventually
> > references all __initconst data?
>
> Yes. If it's builtin_platform_driver() it can't be a module/tristate
> Kconfig, in which case all the init markings can stay.

Yes, it's already bool in the Kconfig file. After looking into this I
think it's better to do like the rockchip drivers and use
builtin_platform_driver_probe to make sure the probe function only
called at kernel init time:

static struct platform_driver clk_starfive_jh7100_driver = {
        .driver = {
                .name = "clk-starfive-jh7100",
                .of_match_table = clk_starfive_jh7100_match,
                .suppress_bind_attrs = true,
        },
};
builtin_platform_driver_probe(clk_starfive_jh7100_driver,
clk_starfive_jh7100_probe);

@Andy: is the supress_bind_attrs what you were asking about?

> > > > +
> > > > +               clk->hw.init = &init;
> > > > +               clk->idx = idx;
> > > > +               clk->max = jh7100_clk_data[idx].max;
> > > > +
> > > > +               ret = clk_hw_register(priv->dev, &clk->hw);
> > >
> > > Why not use devm_clk_hw_register()?
> >
> > I probably could. Just for my understanding that's just to avoid the
> > loop on error below, because as a builtin driver the device won't
> > otherwise go away, right?
>
> Yes
>
> >
> > > > +               if (ret)
> > > > +                       goto err;
> > > > +       }
> > > > +
> > > > +       ret = devm_of_clk_add_hw_provider(priv->dev, clk_starfive_jh7100_get, priv);
> > > > +       if (ret)
> > > > +               goto err;
> > > > +
> > > > +       return 0;
> > > > +err:
> > > > +       while (idx)
> > > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static const struct of_device_id clk_starfive_jh7100_match[] = {
> > > > +       { .compatible = "starfive,jh7100-clkgen" },
> > > > +       { /* sentinel */ }
> > > > +};
> > >
> > > Please add MODULE_DEVICE_TABLE()
> >
> > Will do!
>
> If it's never going to be a module then don't add any module_* things.

So does that just mean no MODULE_DEVICE_TABLE or should I also remove
MODULE_DESCRIPTION, MODULE_AUTHOR and MODULE_LICENSE? I'm just double
checking because the rockchip drivers seem to have MODULE_DESCRIPTION
and MODULE_LICENSE lines.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
