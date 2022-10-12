Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69FCC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 23:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLZQ3qmXKCTGWKJ59QL5VAWj2zo/DDeAOEh3Y/WNWPE=; b=s2yhf97rMM9OSh
	p35xbJIOYKpg8ZoxVQS2kXCkrwtuimUQpZTu0CLcHfluy9JUEqko7ny3Wp1MoBjEjXUwrtqrgQ2AL
	qek5YmL32kLdAfCHnRqflSLywqpRLC6ctlH0C7D86rPpJGDrgFVOl/RZ7KF9LZchzsyF9viWa8BJY
	fs3Kp8OdY6DTumCav65SiAriNG3N9fQydaaal+PCQHUoC9CkVYStLFU8u6DZyPYpbngMOvQJ1Cs5b
	PcNH62R+9y7WLa+vQmUoF/VQXXNZaVY1OfrKLqGXFIGYsENeJDfuLH3zgBPLsOKDtUTng29R5sleW
	j1tk2kneNcJ7pMhd1ZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikn4-009f0Q-EI; Wed, 12 Oct 2022 23:05:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikn0-009eze-U9
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 23:05:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 783AD61668;
	Wed, 12 Oct 2022 23:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E58C433D7;
	Wed, 12 Oct 2022 23:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665615925;
	bh=RKsj6eaHS0Dlw6VvnuAF/Tpwhbi5fwGsQ2fzFSv0svI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QZHwE+fLiMLo4PpvLTomPm8Ro5c5NMVrF8ZoCdlQQd5wWk6Ohfth8VQBz7+rF9Jdv
	 +E0mhSK3p271mheOinlAZmc6ucgmdHYDQAbHf8akVVVoS0oqDY9/OVyh9190/tUuVo
	 jZe9OUvEFpXGufIEn8ntGJwp0DDPW65/M9r89CEWWCuhdHtE7ouGygKMkmBRIOakCi
	 UNwiEE7F1eZwVy4xoUCtog9qSYlnpapphrMio5xezduhDkuSk4l7n9MaAYjJBTM3Ha
	 dVtvTTjgck6LkLhjF9ssfqgRxnynfvkYN6vlsO5ICfgeA/ZrZCk6qQhWvZk7yh0ek6
	 1sQVgAiWPGmkA==
MIME-Version: 1.0
In-Reply-To: <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220929175602.19946-1-hal.feng@linux.starfivetech.com> <20220930214824.A14ACC433D6@smtp.kernel.org> <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com>
Subject: Re: [PATCH v1 15/30] clk: starfive: Use regmap APIs to operate registers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hal Feng <hal.feng@linux.starfivetech.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Oct 2022 16:05:23 -0700
User-Agent: alot/0.10
Message-Id: <20221012230525.C6E58C433D7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_160527_024628_2CE2C18B 
X-CRM114-Status: GOOD (  18.56  )
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

Quoting Emil Renner Berthing (2022-10-05 06:14:44)
> > > @@ -295,11 +296,13 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> > >         if (!priv)
> > >                 return -ENOMEM;
> > >
> > > -       spin_lock_init(&priv->rmw_lock);
> > >         priv->dev = &pdev->dev;
> > > -       priv->base = devm_platform_ioremap_resource(pdev, 0);
> > > -       if (IS_ERR(priv->base))
> > > -               return PTR_ERR(priv->base);
> > > +       priv->regmap = device_node_to_regmap(priv->dev->of_node);
> >
> > This is sad. Why do we need to make a syscon? Can we instead use the
> > auxiliary bus to make a reset device that either gets a regmap made here
> > in this driver or uses a void __iomem * mapped with ioremap
> > (priv->base)?
> 
> In my original code the clock driver just registers the resets too
> similar to other combined clock and reset drivers. I wonder what you
> think about that approach:
> https://github.com/esmil/linux/commit/36f15e1b827b02d7f493dc5fce31060b21976e68
> and
> https://github.com/esmil/linux/commit/4ccafadb72968480aa3dd28c227fcccae411c13b#diff-ffec81f902f810cb210012c25e8d88217ea5b4021419a4206d1fd4dd19edfce8R471

I think we should use auxiliary bus and split the driver logically into
a reset driver in drivers/reset and a clk driver in drivers/clk. That
way the appropriate maintainers can review the code. There is only one
platform device with a single reg property and node in DT, but there are
two drivers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
