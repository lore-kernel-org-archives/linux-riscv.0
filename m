Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C6C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 01:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wv/UJZvmz7OTsJHwmjkAJ0+tri+08QtJzKP51z8+Dqo=; b=gMqYHt4pVqwPcD
	7zidwAgjyYfAizCAT8aiMm+WEdhgz2IyYGN6TaH1kTfvVzsxeaNvUGYg5l/ujhRgDZwaBPdIvlBgC
	rrcW4l/LcfS3kZOP4dzCws4jxil0JVp2RH6OPrVD13imbqe1sUlm+n6vHzGiNCCWBS+u1VQsrRhFs
	+2VMlGez/pC9TmX2J+ssquwGeqUZmeUTAh3d1CAQLXgsc7i7XfDeINQQ5flx//NZ2PMZJpy/6h+r9
	JLZAVfK+Y5lfI6tfP4c7L23aw6YLTwwdE8QUgtwzkyUgny0g7yN/vaVCYLGZMaDDqyrDLu62OXJG4
	8FfleO27j4B2wEa5nHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onrex-00BUc9-Nt; Thu, 27 Oct 2022 01:26:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onreo-00BUaI-Vg
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 01:26:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 053D0620F9;
	Thu, 27 Oct 2022 01:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6769C433C1;
	Thu, 27 Oct 2022 01:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666833965;
	bh=hYASDY/RBPj7jGgnN4KncjSFTtzdy9NTDXP3AodJm+4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iJnBJo5BoHhr4k0kZgdsGd03Rb6LjjifodTow4Ad99tp1iDvTi0lPNFavQN8svbIV
	 1xe8u+gUxpSkbNvVQ+Q6OyZGHH/0WLMnAHJQ2HcVTyq+4GR3huUcpkUZoeh8k68GSg
	 7OCpRGxRk3ECJQ0YphQu2epB/pswj2RLrO9+uNNKwHglmXKp9ZmB7seyKd8ZX0z7C5
	 PsyHMIacUFrHh8MJJUhZb2mMMLjvi7HSz5zo4tbV1hdYYeTuuWHOkL8QGOSSFfrAQm
	 kc9TlU9xam3S2NTxl64v4XtZtBXIwEIk52XIoMZQDoI6pNOCbTvLSl3LFdSJ35kHwz
	 1olplLQyy/lqw==
MIME-Version: 1.0
In-Reply-To: <07B628ED6CABEF1D+932737cc-7d4b-4071-531e-82f88d89a872@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220929175602.19946-1-hal.feng@linux.starfivetech.com> <20220930214824.A14ACC433D6@smtp.kernel.org> <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com> <20221012230525.C6E58C433D7@smtp.kernel.org> <07B628ED6CABEF1D+932737cc-7d4b-4071-531e-82f88d89a872@linux.starfivetech.com>
Subject: Re: [PATCH v1 15/30] clk: starfive: Use regmap APIs to operate registers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
To: Hal Feng <hal.feng@linux.starfivetech.com>
Date: Wed, 26 Oct 2022 18:26:03 -0700
User-Agent: alot/0.10
Message-Id: <20221027012605.B6769C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_182607_083164_D6FFC370 
X-CRM114-Status: GOOD (  21.82  )
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

Quoting Hal Feng (2022-10-22 21:11:41)
> On Wed, 12 Oct 2022 16:05:23 -0700, Stephen Boyd wrote:
> > I think we should use auxiliary bus and split the driver logically into
> > a reset driver in drivers/reset and a clk driver in drivers/clk. That
> > way the appropriate maintainers can review the code. There is only one
> > platform device with a single reg property and node in DT, but there are
> > two drivers. 
> 
> Yes, I agree that the reset driver and the clock driver should be split.
> However, I think using auxiliary bus is a little bit complicated in this
> case, because the reset is not a part of functionality of the clock in 
> JH7110. They just share a common register base address.

That is why auxiliary bus exists.

> I think it is 
> better to use ioremap for the same address, and the dt will be like
> 
> syscrg_clk: clock-controller@13020000 {
>         compatible = "starfive,jh7110-clkgen-sys";
>         reg = <0x0 0x13020000 0x0 0x10000>;
>         ...
> };
> syscrg_rst: reset-controller@13020000 {
>         compatible = "starfive,jh7110-reset-sys";
>         reg = <0x0 0x13020000 0x0 0x10000>;
>         ...
> };
> 
> What do you think of this approach? I would appreciate your suggestions.
> 

We shouldn't have two different nodes with the same reg property. Please
ioremap in whatever driver probes and creates the auxiliary device(s)
and then pass the void __iomem * to it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
