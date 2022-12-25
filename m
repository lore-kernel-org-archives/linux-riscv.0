Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0BFC3DA7A
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Dec 2022 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ue0+d0/ogwNcQo3TLL548s0Srx/HbwBNgqqWi3vCoDE=; b=yGMnAHvJp3/m8G
	GY/vBAbfseRX941JawDVDXR4uAp5NRNXsrEFF1IXcgukSFNLFAHt2E6BoSjAqnX5hOIzdyRWcUjyk
	MIbLfG74sEPVf6SlDehBsWAAvWWx7G5QPSbY/+L4aTr2377rcV4oXrYUAzj/Qwyg1FfjDdFcTJl73
	CZY2DDB+xl5JMPyOijsTHGE6oqflqhrgVE+zGptRqHeuYUIIEtRVjxSHaLO5P9nOzM29qcuNTvPH6
	qee4fELjXpu110D9SKephGTx4U9u1oue3XAMTXaTrbPzbNsCC843JRsgucaOG6r2NBDJ8AUZ7E4F5
	nUoRYRpA9ekpcC85xLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9T8G-00Cec1-O2; Sun, 25 Dec 2022 15:41:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9S2z-00ByzJ-Qs
	for linux-riscv@lists.infradead.org; Sun, 25 Dec 2022 14:32:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C1C7424DFCE;
	Sun, 25 Dec 2022 22:31:44 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 25 Dec
 2022 22:31:44 +0800
Received: from [192.168.2.237] (113.72.145.114) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 25 Dec
 2022 22:31:43 +0800
Message-ID: <e23460e8-0ca4-b20b-e48e-faeca4f30e88@starfivetech.com>
Date: Sun, 25 Dec 2022 22:31:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From: Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com> <Y6Ipv0BUummgqNaw@spud>
Content-Language: en-US
In-Reply-To: <Y6Ipv0BUummgqNaw@spud>
X-Originating-IP: [113.72.145.114]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_063218_297626_A51AB073 
X-CRM114-Status: GOOD (  13.44  )
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

On Tue, 20 Dec 2022 21:31:43 +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add initial device tree for the JH7110 RISC-V SoC by StarFive
> > Technology Ltd.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> 
> FWIW, this cpu-map is now the default in linux, so you no longer *need*
> to add it for that purpose - but there's obviously no harm in being
> explicit for other operating systems etc. (IOW, don't remove it!)
> 
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu = <&S76_0>;
> > +				};
> > +
> > +				core1 {
> > +					cpu = <&U74_1>;
> > +				};
> > +
> > +				core2 {
> > +					cpu = <&U74_2>;
> > +				};
> > +
> > +				core3 {
> > +					cpu = <&U74_3>;
> > +				};
> > +
> > +				core4 {
> > +					cpu = <&U74_4>;
> > +				};
> > +			};
> > +		};
> > +	};
> 
> > +		syscrg: clock-controller@13020000 {
> 
> For obvious reasons, I cannot apply this until both the clock & pinctrl
> bindings are in my tree - but you know that already.
> 
> > +			compatible = "starfive,jh7110-syscrg";
> > +			reg = <0x0 0x13020000 0x0 0x10000>;
> > +			clocks = <&osc>, <&gmac1_rmii_refin>,
> > +				 <&gmac1_rgmii_rxin>,
> > +				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
> > +				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> > +				 <&tdm_ext>, <&mclk_ext>;
> 
> As Krzk asked - are these clocks really all inputs to the SoC?

Yes, they are all external clock sources inputted to the SoC. They are
used as root clocks or optional parent clocks in clock tree.

> 
> > +			clock-names = "osc", "gmac1_rmii_refin",
> > +				      "gmac1_rgmii_rxin",
> > +				      "i2stx_bclk_ext", "i2stx_lrck_ext",
> > +				      "i2srx_bclk_ext", "i2srx_lrck_ext",
> > +				      "tdm_ext", "mclk_ext";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> > +		gpio: gpio@13040000 {
> 
> > +		gpioa: gpio@17020000 {
> 
> Out of curiousity, why gpio & gpioa?

Oh, is it easier to read if I change "gpio" and "gpioa"
to "sysgpio" and "aongpio"? Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
