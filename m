Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E141C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Dec 2022 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQjo2834doF9V9jFbp2zYDsX4iAjq2H4I0NNVnHzePQ=; b=s07XNq+M3/i4SF
	rTbEMXDikXiDWepHWVTw5eLsUyhL6wZtNRtZbny6KQXesVCpOEYDP5CP9g/Y3VKK3+oY0jKO9SSTo
	KerXg8zPX0uanjPRF40GU3iVRmIVY8O58GNhkQmh7AZyPwTVVDWrwIg2upIgrlc01Jl+1DROhpDGH
	i0o84tYY1Wf+9eCFu7h9AXc+Y3Zyr2lQ1NCU1wu1W9GBUnHwP6O+xLNaQJ3Gayqn86iaSLhblqFhV
	14PhwCkRRFMD3Kl5jRSIkqljk7AaYcIY89fVM8YojHAw6aNPn89H886/FCePumnOjvsDg8KJ5BgWn
	RuMEhAk0NuVlzt96+bWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9Owu-00AMkU-VK; Sun, 25 Dec 2022 11:13:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9OHn-00A1a7-Bw
	for linux-riscv@lists.infradead.org; Sun, 25 Dec 2022 10:31:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 23A8D24DFCE;
	Sun, 25 Dec 2022 18:30:27 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 25 Dec
 2022 18:30:27 +0800
Received: from [192.168.125.65] (113.72.146.158) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 25 Dec
 2022 18:30:25 +0800
Message-ID: <d81cabc8-0229-1acf-03da-9a988a53a890@starfivetech.com>
Date: Sun, 25 Dec 2022 18:31:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <ebb27bb2-158c-8207-7184-0d5b5ca0ce14@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ebb27bb2-158c-8207-7184-0d5b5ca0ce14@linaro.org>
X-Originating-IP: [113.72.146.158]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_023119_768353_A7C7D9BB 
X-CRM114-Status: GOOD (  15.68  )
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

On Tue, 20 Dec 2022 11:10:11 +0100, Krzysztof Kozlowski wrote:
> On 20/12/2022 02:12, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add initial device tree for the JH7110 RISC-V SoC by StarFive
>> Technology Ltd.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 411 +++++++++++++++++++++++
>>  1 file changed, 411 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> new file mode 100644
>> index 000000000000..64d260ea1f29
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -0,0 +1,411 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
>> +#include <dt-bindings/reset/starfive,jh7110-crg.h>
>> +
>> +/ {
>> +	compatible = "starfive,jh7110";
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		S76_0: cpu@0 {
>> +			compatible = "sifive,u74-mc", "riscv";
>> +			reg = <0>;
>> +			d-cache-block-size = <64>;
>> +			d-cache-sets = <64>;
>> +			d-cache-size = <8192>;
>> +			d-tlb-sets = <1>;
>> +			d-tlb-size = <40>;
>> +			device_type = "cpu";
>> +			i-cache-block-size = <64>;
>> +			i-cache-sets = <64>;
>> +			i-cache-size = <16384>;
>> +			i-tlb-sets = <1>;
>> +			i-tlb-size = <40>;
>> +			mmu-type = "riscv,sv39";
>> +			next-level-cache = <&ccache>;
>> +			riscv,isa = "rv64imac";
>> +			tlb-split;
>> +			status = "disabled";
>> +
>> +			cpu0_intc: interrupt-controller {
>> +				compatible = "riscv,cpu-intc";
>> +				interrupt-controller;
>> +				#interrupt-cells = <1>;
>> +			};
>> +		};
>> +
>> +		U74_1: cpu@1 {
>> +			compatible = "sifive,u74-mc", "riscv";
>> +			reg = <1>;
>> +			d-cache-block-size = <64>;
>> +			d-cache-sets = <64>;
>> +			d-cache-size = <32768>;
>> +			d-tlb-sets = <1>;
>> +			d-tlb-size = <40>;
>> +			device_type = "cpu";
>> +			i-cache-block-size = <64>;
>> +			i-cache-sets = <64>;
>> +			i-cache-size = <32768>;
>> +			i-tlb-sets = <1>;
>> +			i-tlb-size = <40>;
>> +			mmu-type = "riscv,sv39";
>> +			next-level-cache = <&ccache>;
>> +			riscv,isa = "rv64imafdc";
>> +			tlb-split;
>> +
>> +			cpu1_intc: interrupt-controller {
>> +				compatible = "riscv,cpu-intc";
>> +				interrupt-controller;
>> +				#interrupt-cells = <1>;
>> +			};
>> +		};
>> +
>> +		U74_2: cpu@2 {
>> +			compatible = "sifive,u74-mc", "riscv";
>> +			reg = <2>;
>> +			d-cache-block-size = <64>;
>> +			d-cache-sets = <64>;
>> +			d-cache-size = <32768>;
>> +			d-tlb-sets = <1>;
>> +			d-tlb-size = <40>;
>> +			device_type = "cpu";
>> +			i-cache-block-size = <64>;
>> +			i-cache-sets = <64>;
>> +			i-cache-size = <32768>;
>> +			i-tlb-sets = <1>;
>> +			i-tlb-size = <40>;
>> +			mmu-type = "riscv,sv39";
>> +			next-level-cache = <&ccache>;
>> +			riscv,isa = "rv64imafdc";
>> +			tlb-split;
>> +
>> +			cpu2_intc: interrupt-controller {
>> +				compatible = "riscv,cpu-intc";
>> +				interrupt-controller;
>> +				#interrupt-cells = <1>;
>> +			};
>> +		};
>> +
>> +		U74_3: cpu@3 {
>> +			compatible = "sifive,u74-mc", "riscv";
>> +			reg = <3>;
>> +			d-cache-block-size = <64>;
>> +			d-cache-sets = <64>;
>> +			d-cache-size = <32768>;
>> +			d-tlb-sets = <1>;
>> +			d-tlb-size = <40>;
>> +			device_type = "cpu";
>> +			i-cache-block-size = <64>;
>> +			i-cache-sets = <64>;
>> +			i-cache-size = <32768>;
>> +			i-tlb-sets = <1>;
>> +			i-tlb-size = <40>;
>> +			mmu-type = "riscv,sv39";
>> +			next-level-cache = <&ccache>;
>> +			riscv,isa = "rv64imafdc";
>> +			tlb-split;
>> +
>> +			cpu3_intc: interrupt-controller {
>> +				compatible = "riscv,cpu-intc";
>> +				interrupt-controller;
>> +				#interrupt-cells = <1>;
>> +			};
>> +		};
>> +
>> +		U74_4: cpu@4 {
>> +			compatible = "sifive,u74-mc", "riscv";
>> +			reg = <4>;
>> +			d-cache-block-size = <64>;
>> +			d-cache-sets = <64>;
>> +			d-cache-size = <32768>;
>> +			d-tlb-sets = <1>;
>> +			d-tlb-size = <40>;
>> +			device_type = "cpu";
>> +			i-cache-block-size = <64>;
>> +			i-cache-sets = <64>;
>> +			i-cache-size = <32768>;
>> +			i-tlb-sets = <1>;
>> +			i-tlb-size = <40>;
>> +			mmu-type = "riscv,sv39";
>> +			next-level-cache = <&ccache>;
>> +			riscv,isa = "rv64imafdc";
>> +			tlb-split;
>> +
>> +			cpu4_intc: interrupt-controller {
>> +				compatible = "riscv,cpu-intc";
>> +				interrupt-controller;
>> +				#interrupt-cells = <1>;
>> +			};
>> +		};
>> +
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&S76_0>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&U74_1>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&U74_2>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&U74_3>;
>> +				};
>> +
>> +				core4 {
>> +					cpu = <&U74_4>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	osc: osc {
> 
> Node names should be generic, so why this is "osc" and other oscillators
> are not "osc"?

Only "osc" and "rtc_osc" are oscillators, the rest are clock sources provided
through gpio. I will modify the node names according to your link below. So

	osc: oscillator {

> 
> 
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	rtc_osc: rtc_osc {
> 
> No underscores in node names. Generic node names (so each of them
> starting or ending with clock).

Will change this line to

	rtc_osc: oscillator {

> 
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	gmac0_rmii_refin: gmac0_rmii_refin {
> 
> Same problem... and actually you have way too many fixed clocks which do

Will change the node names as follows.

	gmac0_rmii_refin: clock {
		...
	};

	gmac0_rgmii_rxin: clock {
		...
	};
	...

> nothing. It looks like you avoid to define proper clock controller.
> What's the point for all these clocks? These are no-op.

These are all external fixed rate clocks inputted to the SoC. They are the root
clocks of the clock tree made by clock drivers. Their ops are provided in
drivers/clk/clk-fixed-rate.c.

> 
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	gmac0_rgmii_rxin: gmac0_rgmii_rxin {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	gmac1_rmii_refin: gmac1_rmii_refin {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	gmac1_rgmii_rxin: gmac1_rgmii_rxin {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	i2stx_bclk_ext: i2stx_bclk_ext {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	i2stx_lrck_ext: i2stx_lrck_ext {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	i2srx_bclk_ext: i2srx_bclk_ext {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	i2srx_lrck_ext: i2srx_lrck_ext {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	tdm_ext: tdm_ext {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	mclk_ext: mclk_ext {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	soc {
>> +		compatible = "simple-bus";
>> +		interrupt-parent = <&plic>;
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		clint: clint@2000000 {
> 
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Change it to 

		clint: timer@2000000 {

> 
>> +			compatible = "starfive,jh7110-clint", "sifive,clint0";
>> +			reg = <0x0 0x2000000 0x0 0x10000>;
>> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
>> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
>> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
>> +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
>> +					      <&cpu4_intc 3>, <&cpu4_intc 7>;
>> +		};
>> +
>> +		plic: plic@c000000 {
> 
> Node names should be generic, so interrupt-controller
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Change it to 

		plic: interrupt-controller@c000000 {

Best regards,
Hal

> 
>> +			compatible = "starfive,jh7110-plic", "sifive,plic-1.0.0";
>> +			reg = <0x0 0xc000000 0x0 0x4000000>;
>> +			interrupts-extended = <&cpu0_intc 11>,
>> +					      <&cpu1_intc 11>, <&cpu1_intc 9>,
>> +					      <&cpu2_intc 11>, <&cpu2_intc 9>,
>> +					      <&cpu3_intc 11>, <&cpu3_intc 9>,
>> +					      <&cpu4_intc 11>, <&cpu4_intc 9>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <1>;
>> +			#address-cells = <0>;
>> +			riscv,ndev = <136>;
>> +		};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
