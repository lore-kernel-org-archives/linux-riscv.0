Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A799EC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvMcm8jJfCB/8Dn2fG/THE1TWU6qxT24ChGEaZ+Xa4A=; b=W/oQExGxrS8BLx
	2vCyFBGB3NxtcjVcGnJzkcEhU/O/gydSvboxNb5ZIs7vz8EqugxkcX4aComV+XjFNvF/qmurHxFTU
	w41OYfERHoUuUtAHDYg/XeyG59NOPoPp+3+SzPd5FIeuxVpPfOwtUg5brF7t0rr68IWiMqrTZYv4w
	y3P0dLLXg4NAkR+AVR15NgPv6Bwkq6aWVdMf6M1ec41lRJOJa77Z4BTy1ERslw+cmSgRElPVpec+3
	NDYyeXse9z31soAfvxjXbrmLjpmTLyojKeyBE3S/GvlPffUx28Dzmpgjw9VX4ziJ0ndghf9yKAuBf
	BttUPnmF53NsrHDzuQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRWN-00ENo4-24;
	Wed, 27 Dec 2023 10:52:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRWI-00ENmE-1V
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 10:52:18 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 12D8524E278;
	Wed, 27 Dec 2023 18:51:39 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Dec
 2023 18:51:39 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Dec
 2023 18:51:38 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 27 Dec 2023 18:51:38 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"conor@kernel.org" <conor@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
Subject: RE: [RFC 07/16] dt-bindings: clock: Add StarFive JH8100 North-West
 clock and reset generator
Thread-Topic: [RFC 07/16] dt-bindings: clock: Add StarFive JH8100 North-West
 clock and reset generator
Thread-Index: AQHaN73wOhvDbHN7t0mtNi9lKoc0XLC7VyWAgAGek3A=
Date: Wed, 27 Dec 2023 10:51:38 +0000
Message-ID: <45cba9bf1af74128b4d77bea3e11ce69@EXMBX066.cuchost.com>
References: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
 <20231226053848.25089-8-jeeheng.sia@starfivetech.com>
 <74649469-2b47-486e-b8d1-c89b705fe8c1@sifive.com>
In-Reply-To: <74649469-2b47-486e-b8d1-c89b705fe8c1@sifive.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_025214_820761_58CCCCEF 
X-CRM114-Status: GOOD (  14.80  )
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



> -----Original Message-----
> From: Samuel Holland <samuel.holland@sifive.com>
> Sent: Wednesday, December 27, 2023 2:07 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; mturquette@baylibre.com; sboyd@kernel.org;
> p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng <hal.feng@starfivetech.com>; Xingyu Wu
> <xingyu.wu@starfivetech.com>
> Subject: Re: [RFC 07/16] dt-bindings: clock: Add StarFive JH8100 North-West clock and reset generator
> 
> On 2023-12-25 11:38 PM, Sia Jee Heng wrote:
> > Add bindings for the North-West clock and reset generator (NWCRG) on
> > JH8100 SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> >  .../bindings/clock/starfive,jh8100-nwcrg.yaml | 119 ++++++++++++++++++
> >  .../dt-bindings/clock/starfive,jh8100-crg.h   |  43 +++++++
> >  .../dt-bindings/reset/starfive,jh8100-crg.h   |  14 +++
> >  3 files changed, 176 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml
> b/Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml
> > new file mode 100644
> > index 000000000000..be0f94e64e6a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml
> > @@ -0,0 +1,119 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/starfive,jh8100-nwcrg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH8100 North-West Clock and Reset Generator
> > +
> > +maintainers:
> > +  - Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: starfive,jh8100-nwcrg
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main Oscillator (24 MHz)
> > +      - description: APB_BUS clock from SYSCRG
> > +      - description: APB_BUS_PER4 clock from SYSCRG
> > +      - description: SPI_CORE_100 clock from SYSCRG
> > +      - description: ISP_2X clock from SYSCRG
> > +      - description: ISP_AXI clock from SYSCRG
> > +      - description: VOUT_ROOT0 clock from SYSCRG
> > +      - description: VOUT_ROOT1 clock from SYSCRG
> > +      - description: VOUT_SCAN_ATS clock from SYSCRG
> > +      - description: VOUT_DC_CORE clock from SYSCRG
> > +      - description: VOUT_AXI clock from SYSCRG
> > +      - description: AXI_400 clock from SYSCRG
> > +      - description: AHB0 clock from SYSCRG
> > +      - description: PERH_ROOT_PREOSC from SYSCRG
> > +      - description: External DVP clock
> > +      - description: External ISP DPHY TAP TCK clock
> > +      - description: External golbal clock
> 
> Typo: global
Oops. Will fix it. Thanks.
> 
> > +      - description: External VOUT MIPI DPHY TAP TCK
> > +      - description: External VOUT eDP TAP TCK
> > +      - description: External SPI In2 clock
> > +      - description: PLL5
> > [...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
