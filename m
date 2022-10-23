Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8EDECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPAWlNV4+OWPzS78mE1fwrGn91msXGLrpsSYOmkoQvU=; b=gsvIl6H26ghZlm
	2sX/qgM1Jjczm8MMdtCWBPOWA/4WCCKY7mr+rWTGcDpyNE+55vawJUwBvckgFem4uF+26mzrjuKHc
	p2nI+EDnfXwv8SVgnny5EYE+vmPLEJx9XDFtu82x7V9Abi5BE6pVJED39UFi4kywnNCzmP15fs8Rh
	YE+dECPpQR/bJR3RYXWFTizJYcOr/pInJAhNsPFsJjFAutEg1dryiQeTEHr9nLRjuoDCppo1SRIZW
	wTdG5ZoTZByeow13fsN5eD8pGJhJvr2eqOtRN65khCeZDxGl/HgqMbOfYfJftQixyiRFtYEIHky4t
	UU/6/FUsjxOpWYB84GFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omYAf-00Ewh5-KK; Sun, 23 Oct 2022 10:25:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omYAc-00Ewga-VY
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 10:25:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E24260B5E;
	Sun, 23 Oct 2022 10:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6A2C433C1;
	Sun, 23 Oct 2022 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666520728;
	bh=xHTDzXr6yMemliNn/X5wJr/+HKi1d/u3kKmHEczRJ6c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PNETu/wg6gI+HfefOSjm98ZXp1gaCUwQ282BKWbhbPtErarhdWqGOAMOR3aexaBG0
	 e2Mv5TIbvMcQ2vKcU5kJd4VrYC7MPfTkifXDUIEB6JGQfzmL9SP4ECvnCDlU0efGUc
	 1blQfkU7chk8nuMXdWPwD++UHOz5C/tiqcBHRIwlWBXfvG/bGL8ChARWeeEqNsvpl+
	 3nl3RX/X0IGQP4WMFo7cd5l2Yu3PMBNwehajgllCQF35U5UeJceW8u80wezQiRXqOw
	 RgqYck/Of9/WHyvNe/fdVlNfWIgDt2h/SVYUPCtjRaWctBEkyPgScNj3/1B/O6Iimy
	 7tk62+vROPffA==
Date: Sun, 23 Oct 2022 11:25:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>, Stephen Boyd <sboyd@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_15/30=5D_clk=3A_starfive=3A_?= =?US-ASCII?Q?Use_regmap_APIs_to_operate_registers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <07B628ED6CABEF1D+932737cc-7d4b-4071-531e-82f88d89a872@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220929175602.19946-1-hal.feng@linux.starfivetech.com> <20220930214824.A14ACC433D6@smtp.kernel.org> <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com> <20221012230525.C6E58C433D7@smtp.kernel.org> <07B628ED6CABEF1D+932737cc-7d4b-4071-531e-82f88d89a872@linux.starfivetech.com>
Message-ID: <4AF0F174-CB35-447A-9F22-7D300B225011@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_032531_134765_57D848A4 
X-CRM114-Status: GOOD (  24.74  )
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



On 23 October 2022 05:11:41 IST, Hal Feng <hal.feng@linux.starfivetech.com> wrote:
>On Wed, 12 Oct 2022 16:05:23 -0700, Stephen Boyd wrote:
>> Quoting Emil Renner Berthing (2022-10-05 06:14:44)
>> > > > @@ -295,11 +296,13 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>> > > >         if (!priv)
>> > > >                 return -ENOMEM;
>> > > >
>> > > > -       spin_lock_init(&priv->rmw_lock);
>> > > >         priv->dev = &pdev->dev;
>> > > > -       priv->base = devm_platform_ioremap_resource(pdev, 0);
>> > > > -       if (IS_ERR(priv->base))
>> > > > -               return PTR_ERR(priv->base);
>> > > > +       priv->regmap = device_node_to_regmap(priv->dev->of_node);
>> > >
>> > > This is sad. Why do we need to make a syscon? Can we instead use the
>> > > auxiliary bus to make a reset device that either gets a regmap made here
>> > > in this driver or uses a void __iomem * mapped with ioremap
>> > > (priv->base)?
>> > 
>> > In my original code the clock driver just registers the resets too
>> > similar to other combined clock and reset drivers. I wonder what you
>> > think about that approach:
>> > https://github.com/esmil/linux/commit/36f15e1b827b02d7f493dc5fce31060b21976e68
>> > and
>> > https://github.com/esmil/linux/commit/4ccafadb72968480aa3dd28c227fcccae411c13b#diff-ffec81f902f810cb210012c25e8d88217ea5b4021419a4206d1fd4dd19edfce8R471
>> 
>> I think we should use auxiliary bus and split the driver logically into
>> a reset driver in drivers/reset and a clk driver in drivers/clk. That
>> way the appropriate maintainers can review the code. There is only one
>> platform device with a single reg property and node in DT, but there are
>> two drivers. 
>
>Yes, I agree that the reset driver and the clock driver should be split.
>However, I think using auxiliary bus is a little bit complicated in this
>case, because the reset is not a part of functionality of the clock in 
>JH7110. They just share a common register base address. I think it is 
>better to use ioremap for the same address, and the dt will be like
>
>syscrg_clk: clock-controller@13020000 {
>	compatible = "starfive,jh7110-clkgen-sys";
>	reg = <0x0 0x13020000 0x0 0x10000>;
>	...
>};
>syscrg_rst: reset-controller@13020000 {
>	compatible = "starfive,jh7110-reset-sys";
>	reg = <0x0 0x13020000 0x0 0x10000>;
>	...
>};
>
>What do you think of this approach? I would appreciate your suggestions.

No, the dtb checks will all start warning for this.
Aux bus is not that difficult, you can likely copy much of what I did recently in clk-mpfs.c
>
>Best regards,
>Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
