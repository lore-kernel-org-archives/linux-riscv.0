Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAA7C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 02:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItKyRqvAsLrRcEo4QhHfi0hPg+nbSziOgKwgv6+UnvM=; b=HEh4Aks3IrFscb
	lFqtt3jx5itvpJpb96qQPxszD07SlUtiqQrFGUWIksoNSnWIK3oNNlThyTVFrMmn6icJdLtKoN/bO
	iKmyEc6e6cMsJrIZvDY6n8QkNz89i7JPo5+jljrUn6/zdFVKT2+oCJJBMz5UjCGSzbSBzGvWAe9BX
	OA5CtD3WVFSMUJC3C3yX0SuiSKRvaZfpO1/KqAZJc+MziWZxEqWKrBWJHMe32tG7XC91o4dazaqFT
	mNHegOihSdi77K0g/obN+gz45o+xW3CZ3o0iAAa9SZgW7hFlJufZhLCy+TaLBdqIu6lGCPQCFjhLU
	Nd4hUtnxxU1EuVL4fc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCssD-00AaA5-27;
	Tue, 12 Dec 2023 02:51:53 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCss9-00Aa8a-2I
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 02:51:51 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3B9C78080;
	Tue, 12 Dec 2023 10:51:16 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 10:51:16 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 10:51:15 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 12 Dec 2023 10:51:15 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"conor@kernel.org" <conor@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and
 resets nodes
Thread-Topic: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and
 resets nodes
Thread-Index: AQHaKDqra6wATad1nUKrJTE2u0DzTrCfE7aAgAAV1gCABdHvcA==
Date: Tue, 12 Dec 2023 02:51:15 +0000
Message-ID: <d852894e10cb49e0ba4f991bf3378191@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-17-jeeheng.sia@starfivetech.com>
 <CAJM55Z9bik1QttBeFUCfM3N98HWURge7mgV7ohFBq+AsuvtROg@mail.gmail.com>
 <9880fbbf-c311-4b6b-a570-aafd61729446@linaro.org>
In-Reply-To: <9880fbbf-c311-4b6b-a570-aafd61729446@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_185150_014740_CBE24EEF 
X-CRM114-Status: GOOD (  12.51  )
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
> Sent: Saturday, December 9, 2023 1:58 AM
> To: Emil Renner Berthing <emil.renner.berthing@canonical.com>; JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk;
> conor@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
> 
> On 08/12/2023 17:39, Emil Renner Berthing wrote:
> > Sia Jee Heng wrote:
> >> Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
> >> nodes for JH8100 RISC-V SoC.
> >>
> >> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> >> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi | 180 +++++++++++++++++++
> >>  arch/riscv/boot/dts/starfive/jh8100.dtsi     | 115 ++++++++++++
> >
> > Why the split here? I mean why can't the clocks just be in the jh8100.dtsi?
> 
> There should be. What's the point? Clocks are internal part of SoC and
> not really re-usable piece of hardware.
Can move it back to the SoC.dtsi
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
