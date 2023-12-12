Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1BAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFPpYPOyq1om3jHJ/eB0SAeANa+IFjiPACR54KrpedQ=; b=2o8YCWmLfxRTil
	lMmvqbTpJLIA2UfC4c7SQ74vOmErCRQ5OVSNA2+2auiwGz/qiVjT0Uosl/uoJKQAV4VCq+CTrK51f
	wWDZKm+DWSkMFL2n9wLJbFh7bhjFnLWI3Lk81LmldTakydaj4wFi7wHXNNYui4jyLHnxboVFs9ehx
	bsEbVTpBgDAw1sV9iEWX0CkOezSMXwbVNR8NMk7t+GcqhBwbQJaBSyvFcxN9Qqrvaj9YQu4Gje6tQ
	EcOWEJSG1B+Gm43tvrNQ6GeARsD0730YbMphThfHgpV0VS6I5Omwr0UqgVbaRa6qH1xq9/dJ6tiw4
	gJDq59Mx72G1tJRI6wEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzct-00BGSH-0I;
	Tue, 12 Dec 2023 10:04:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzcp-00BGRY-0e
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 10:04:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9052324DC33;
	Tue, 12 Dec 2023 18:03:46 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 18:03:46 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 12 Dec 2023 18:03:46 +0800
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
Thread-Index: AQHaKDqra6wATad1nUKrJTE2u0DzTrCfKVUAgAXSX4D//9xUAIAAnDaw
Date: Tue, 12 Dec 2023 10:03:46 +0000
Message-ID: <6628627a60a4490ba887d9a89add3330@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-17-jeeheng.sia@starfivetech.com>
 <4dd53599-5e80-4a00-a708-507c9c2e7b6b@linaro.org>
 <62705afb652e416695aa26e3bdb2500e@EXMBX066.cuchost.com>
 <e8c60424-21c7-4f64-9e47-8c4183510162@linaro.org>
In-Reply-To: <e8c60424-21c7-4f64-9e47-8c4183510162@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_020427_501023_1DDF4B64 
X-CRM114-Status: GOOD (  21.61  )
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
> Sent: Tuesday, December 12, 2023 4:44 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
> 
> On 12/12/2023 03:58, JeeHeng Sia wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Sent: Saturday, December 9, 2023 1:57 AM
> >> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> >> krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> >> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> >> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> >> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon
> Tan
> >> <leyfoon.tan@starfivetech.com>
> >> Subject: Re: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
> >>
> >> On 06/12/2023 12:50, Sia Jee Heng wrote:
> >>> Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
> >>> nodes for JH8100 RISC-V SoC.
> >>>
> >>> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> >>> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >>
> >> Really? Looks automated... Care to provide any links to effects of
> >> internal review?
> > https://gitlab.starfivetech.com/jeeheng.sia/linux/-/commits/JH8100_Upstream/
> >>
> >>> ---
> >>>  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi | 180 +++++++++++++++++++
> >>>  arch/riscv/boot/dts/starfive/jh8100.dtsi     | 115 ++++++++++++
> >>>  2 files changed, 295 insertions(+)
> >>>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> >>>
> >>> diff --git a/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi b/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> >>> new file mode 100644
> >>> index 000000000000..27ba249f523e
> >>> --- /dev/null
> >>> +++ b/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> >>> @@ -0,0 +1,180 @@
> >>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> >>> +/*
> >>> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> >>> + */
> >>> +
> >>> +/ {
> >>> +	clk_osc: clk_osc {
> >>
> >> No underscores in node names.
> > Noted.
> >>
> >>> +		compatible = "fixed-clock";
> >>> +		#clock-cells = <0>;
> >>> +		clock-frequency = <24000000>;
> >>> +	};
> >>> +
> >>
> >> ...
> >>
> >>> diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> >>> index f26aff5c1ddf..9863c61324a0 100644
> >>> --- a/arch/riscv/boot/dts/starfive/jh8100.dtsi
> >>> +++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> >>> @@ -4,6 +4,9 @@
> >>>   */
> >>>
> >>>  /dts-v1/;
> >>> +#include <dt-bindings/clock/starfive,jh8100-crg.h>
> >>> +#include <dt-bindings/reset/starfive,jh8100-crg.h>
> >>> +#include "jh8100-clk.dtsi"
> >>>
> >>>  / {
> >>>  	compatible = "starfive,jh8100";
> >>> @@ -357,6 +360,104 @@ uart4: serial@121a0000  {
> >>>  			status = "disabled";
> >>>  		};
> >>>
> >>> +		syscrg_ne: syscrg_ne@12320000 {
> >>
> >> clock-controller@
> >>
> >> Just open your bindings and take a look how it is done there...
> >>
> >> This applies everywhere
> 
> I assume you did not ignore all the other comments you did not respond to.
Arr, my bad. Will fix it.
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
