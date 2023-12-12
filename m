Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7CFC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 02:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdH9cjXjERAhPPh2Gl+3d38KC9cAcn1rpbl5gT4xSes=; b=yhNjXIIOgw499D
	p1znNglBAxMg92okuWkvz61v3pJSZtK77IlKa0bC/Nm1qIDOZ6akAp4uQo8PEmIGdjJuD4+24qdU1
	Z9ExCmCiQYATCqcVIZ0edS5Dx68BdDmLPBQy9K8IaGXwsS6tB5IkBiAqWGX7yudIbF0bTDi76j3zI
	AEHByZuD2K5+gsy1Up5recC+/mGt2+onTqdLvgvPJjZ7IMeTBDxQ03b4enE0HAdeF6opqWZzGCm1T
	ZFkAOZo9dIwcB+kituZp0O9Gtwjp0TUm64owBaVaqrplzf8yxi4rPVy4DMPrddhCdRv9OoV4miXba
	aW44nmdN1JICdJY2ND2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCszD-00Aaa8-1C;
	Tue, 12 Dec 2023 02:59:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCszA-00AaYu-0H
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 02:59:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1220B24E296;
	Tue, 12 Dec 2023 10:58:38 +0800 (CST)
Received: from EXMBX064.cuchost.com (172.16.6.64) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 10:58:38 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX064.cuchost.com
 (172.16.6.64) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 10:58:37 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 12 Dec 2023 10:58:37 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "kernel@esmil.dk"
	<kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and
 resets nodes
Thread-Topic: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and
 resets nodes
Thread-Index: AQHaKDqra6wATad1nUKrJTE2u0DzTrCfKVUAgAXSX4A=
Date: Tue, 12 Dec 2023 02:58:37 +0000
Message-ID: <62705afb652e416695aa26e3bdb2500e@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-17-jeeheng.sia@starfivetech.com>
 <4dd53599-5e80-4a00-a708-507c9c2e7b6b@linaro.org>
In-Reply-To: <4dd53599-5e80-4a00-a708-507c9c2e7b6b@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_185904_417033_7F76B60A 
X-CRM114-Status: GOOD (  20.30  )
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
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Saturday, December 9, 2023 1:57 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
> 
> On 06/12/2023 12:50, Sia Jee Heng wrote:
> > Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
> > nodes for JH8100 RISC-V SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> Really? Looks automated... Care to provide any links to effects of
> internal review?
https://gitlab.starfivetech.com/jeeheng.sia/linux/-/commits/JH8100_Upstream/
> 
> > ---
> >  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi | 180 +++++++++++++++++++
> >  arch/riscv/boot/dts/starfive/jh8100.dtsi     | 115 ++++++++++++
> >  2 files changed, 295 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi b/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> > new file mode 100644
> > index 000000000000..27ba249f523e
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> > @@ -0,0 +1,180 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> > + */
> > +
> > +/ {
> > +	clk_osc: clk_osc {
> 
> No underscores in node names.
Noted.
> 
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +	};
> > +
> 
> ...
> 
> > diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> > index f26aff5c1ddf..9863c61324a0 100644
> > --- a/arch/riscv/boot/dts/starfive/jh8100.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> > @@ -4,6 +4,9 @@
> >   */
> >
> >  /dts-v1/;
> > +#include <dt-bindings/clock/starfive,jh8100-crg.h>
> > +#include <dt-bindings/reset/starfive,jh8100-crg.h>
> > +#include "jh8100-clk.dtsi"
> >
> >  / {
> >  	compatible = "starfive,jh8100";
> > @@ -357,6 +360,104 @@ uart4: serial@121a0000  {
> >  			status = "disabled";
> >  		};
> >
> > +		syscrg_ne: syscrg_ne@12320000 {
> 
> clock-controller@
> 
> Just open your bindings and take a look how it is done there...
> 
> This applies everywhere
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
