Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE121ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 04:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkp9+Q1f6DFdFBdPtke6ZKXDEPYO0W0FGWV7nYGJuUE=; b=xd9epkxq3DlpE7
	z6dp+4+mjLVP8M3Dcx7NTcVgIuGpwmH71X5VFmc/jDz6C41xksm+68Q8FpbJGiFic1HCFhBK5wDyL
	J/BUR5DoZPhbFjpXkODGT4MqEbreEV+hcu4t2DznTeVsUc5YwEJShfb/NyUnR0yZs/y8fSn2tvLqO
	7GYAwc8Cf6xEZEp0E6QPq8ImqzvHFHEnaHgyHaxx7eP6/7Mi7nnwz7l1H0XriPZ9P8PKgLz8JQlH3
	whUKB9pm7Sl7/aH/gh/QntHj6lU4Y42+w9qllf21hUZyT33jiY+AyM1rVOcvhL8OvxgR0KxFZb+DX
	wvFYSZwQ377pi68EAaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omSLk-00ENeR-Gu; Sun, 23 Oct 2022 04:12:36 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omSLg-00ENd0-AT
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 04:12:34 +0000
X-QQ-mid: bizesmtp86t1666498304td0935i2
Received: from [192.168.1.231] ( [183.27.97.220])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 23 Oct 2022 12:11:42 +0800 (CST)
X-QQ-SSF: 01000000000000B0B000000A0000000
X-QQ-FEAT: qdVriHgIVQiyXBR0Tbg2aADC9wXI2EcjDe8x1uIerai50Wo0idqfvsi29nnwd
	fgmLgD6229Z/spDSCnWFnpjkdKWsv91X+09BlStKlbBwfSS5Za8i/emahfp26hKFA6Z1aq7
	LrqfhLf133wgBNhlFtyGwjNwZi5YD7Whtpqfybl+AuOaOxDGBA1XCD2Ush5+ohdk9YjVRZi
	kSLXRbG1qBd2Qk6TWmblYk8/FGYUJbAMEq299TJWYeIBHCx4k1b/IMl2RBJXEaEFJkt3X2R
	I23r/ipZZvRnWOuBGXpYSaHU/A+KpPMBIlhZRB27gK80i7J9L6hPvl2Qpd+FFAAPJWOi6Gp
	GHHfJTTmJfWI9KXgyKsN53eWURywA==
X-QQ-GoodBg: 0
Message-ID: <07B628ED6CABEF1D+932737cc-7d4b-4071-531e-82f88d89a872@linux.starfivetech.com>
Date: Sun, 23 Oct 2022 12:11:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 15/30] clk: starfive: Use regmap APIs to operate
 registers
To: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175602.19946-1-hal.feng@linux.starfivetech.com>
 <20220930214824.A14ACC433D6@smtp.kernel.org>
 <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com>
 <20221012230525.C6E58C433D7@smtp.kernel.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20221012230525.C6E58C433D7@smtp.kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_211232_718571_B70B78BA 
X-CRM114-Status: GOOD (  24.18  )
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

On Wed, 12 Oct 2022 16:05:23 -0700, Stephen Boyd wrote:
> Quoting Emil Renner Berthing (2022-10-05 06:14:44)
> > > > @@ -295,11 +296,13 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> > > >         if (!priv)
> > > >                 return -ENOMEM;
> > > >
> > > > -       spin_lock_init(&priv->rmw_lock);
> > > >         priv->dev = &pdev->dev;
> > > > -       priv->base = devm_platform_ioremap_resource(pdev, 0);
> > > > -       if (IS_ERR(priv->base))
> > > > -               return PTR_ERR(priv->base);
> > > > +       priv->regmap = device_node_to_regmap(priv->dev->of_node);
> > >
> > > This is sad. Why do we need to make a syscon? Can we instead use the
> > > auxiliary bus to make a reset device that either gets a regmap made here
> > > in this driver or uses a void __iomem * mapped with ioremap
> > > (priv->base)?
> > 
> > In my original code the clock driver just registers the resets too
> > similar to other combined clock and reset drivers. I wonder what you
> > think about that approach:
> > https://github.com/esmil/linux/commit/36f15e1b827b02d7f493dc5fce31060b21976e68
> > and
> > https://github.com/esmil/linux/commit/4ccafadb72968480aa3dd28c227fcccae411c13b#diff-ffec81f902f810cb210012c25e8d88217ea5b4021419a4206d1fd4dd19edfce8R471
> 
> I think we should use auxiliary bus and split the driver logically into
> a reset driver in drivers/reset and a clk driver in drivers/clk. That
> way the appropriate maintainers can review the code. There is only one
> platform device with a single reg property and node in DT, but there are
> two drivers. 

Yes, I agree that the reset driver and the clock driver should be split.
However, I think using auxiliary bus is a little bit complicated in this
case, because the reset is not a part of functionality of the clock in 
JH7110. They just share a common register base address. I think it is 
better to use ioremap for the same address, and the dt will be like

syscrg_clk: clock-controller@13020000 {
	compatible = "starfive,jh7110-clkgen-sys";
	reg = <0x0 0x13020000 0x0 0x10000>;
	...
};
syscrg_rst: reset-controller@13020000 {
	compatible = "starfive,jh7110-reset-sys";
	reg = <0x0 0x13020000 0x0 0x10000>;
	...
};

What do you think of this approach? I would appreciate your suggestions.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
