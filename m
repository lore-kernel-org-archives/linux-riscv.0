Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27F5C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56E4fsq5Enh4n5pneWxb9su99evBFCxuF5K4eToS+6w=; b=GmT7n4Hnk/Dyog
	M4L3V7DWqtDgynqWcaOKtHNQ2RS9974H98Ld7u+9Xuoh12q/TOZdDxJ3LyLw/9vYQJOmUbcOzu33f
	Ct5BSndTRnvqZHzKHhTfYmyS3L543sGMbwRlwLcAuxf8KgleoX9hbLZjcmDHcCNJblk8KcmEgdP2F
	mJgS9LGpBS4LhJmj51+YdjW/QyEApQxn4gATEYJ0aXmPvmiI8/QeiTDuRXi2muWFFC93/yV/k1Ne9
	ZbwHEheqviLw6BZSlZh16X7Nid0GE653YCRC3uZ7SeEpe1ZsQfRD8TxcGKm/IGhjBxHJAYXaDToSb
	Zbc8CSUUiaBUASvZ4gOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeIl-001rwg-Gt; Mon, 28 Nov 2022 13:36:03 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeIL-001rVv-UD; Mon, 28 Nov 2022 13:35:40 +0000
X-QQ-mid: bizesmtp62t1669642464tmqe2hiy
Received: from ubuntu.. ( [111.196.130.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Nov 2022 21:34:21 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: 3Kbt82ri5O0eMleRC3Z+cU8DJP2xNHM5zgMCVLnxKekzWTzLaVN/7xk6AKwc8
	0cIuOBmZvyKrRzJqLGIs3HwJzxHOXDnb0gG03/b0E/DZOA5T3J9vCLBUi6mRv7yXePSv1Gm
	tfJNvlmNjhSwNig/hLR9l8dUoOjb+IkkQEldSjRCUDQYeUd54DZp8cgpfot5KOin6PusWEO
	sYQNCQ7bKaToJxXdHg2/BQCr8C0gq9nkviBXBFu0+ZYAyQBQLFcyxjYiOeqyqBFrluXNJUy
	3+xDLuzd1D4LCLGnlmd/dciSEJcKBytn2fdF5WIb8ai1byigdPNrN9srvRBV0hQGxlOC4ai
	n7kyujzJZPjDsVAiaXc5n5W6VyhEsJ6gISSIGuLVEXwNh/sfWaIwiOOy9ny0Q==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: samuel@sholland.org
Cc: andre.przywara@arm.com,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	christianshewitt@gmail.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	heiko@sntech.de,
	heinrich.schuchardt@canonical.com,
	jernej.skrabec@gmail.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	stano.jakubek@gmail.com,
	wens@csie.org
Subject: Re: [PATCH v2 04/12] riscv: dts: allwinner: Add the D1/D1s SoC devicetree
Date: Mon, 28 Nov 2022 21:34:21 +0800
Message-Id: <20221128133421.58614-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125234656.47306-5-samuel@sholland.org>
References: <20221125234656.47306-5-samuel@sholland.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_053538_305098_C8B0A5A8 
X-CRM114-Status: GOOD (  16.61  )
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

> D1 (aka D1-H), D1s (aka F133), R528, and T113 are a family of SoCs based
> on a single die, or at a pair of dies derived from the same design.
> 
> D1 and D1s contain a single T-HEAD Xuantie C906 CPU, whereas R528 and
> T113 contain a pair of Cortex-A7's. D1 and R528 are the full version of
> the chip with a BGA package, whereas D1s and T113 are low-pin-count QFP
> variants.
> 
> Because the original design supported both ARM and RISC-V CPUs, some
> peripherals are duplicated. In addition, all variants except D1s contain
> a HiFi 4 DSP with its own set of peripherals.
> 
> The devicetrees are organized to minimize duplication:
>  - Common perhiperals are described in sunxi-d1s-t113.dtsi
>  - DSP-related peripherals are described in sunxi-d1-t113.dtsi
>  - RISC-V specific hardware is described in sun20i-d1s.dtsi
>  - Functionality unique to the D1 variant is described in sun20i-d1.dtsi
> 
> The SOC_PERIPHERAL_IRQ macro handles the different #interrupt-cells
> values between the ARM (GIC) and RISC-V (PLIC) versions of the SoC.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v2:
>  - Split into separate files for sharing with D1s/R528/T113
>  - Use SOC_PERIPHERAL_IRQ macro for interrupts
>  - Rename osc24M to dcxo and move the frequency to the board DTs
>  - Drop analog LDOs due to the missing binding
>  - Correct tcon_top DSI clock reference
>  - Add DMIC, DSI controller, and DPHY (bindings are in linux-next)
>  - Add CPU OPP table
> 
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  66 ++
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  76 ++
>  .../boot/dts/allwinner/sunxi-d1-t113.dtsi     |  15 +
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 844 ++++++++++++++++++
>  4 files changed, 1001 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi

<snip>
 
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> +
> +#define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
> +
> +#include "sunxi-d1s-t113.dtsi"
> +
> +/ {
> +	cpus {
> +		timebase-frequency = <24000000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "thead,c906", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			clocks = <&ccu CLK_RISCV>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <256>;
> +			d-cache-size = <32768>;
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			mmu-type = "riscv,sv39";
> +			operating-points-v2 = <&opp_table_cpu>;
> +			riscv,isa = "rv64imafdc";
> +			#cooling-cells = <2>;
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +	};
> +
> +	opp_table_cpu: opp-table-cpu {
> +		compatible = "operating-points-v2";
> +
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <900000 900000 1100000>;
> +		};
> +
> +		opp-1080000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt = <900000 900000 1100000>;
> +		};
> +	};
> +
> +	soc {
> +		interrupt-parent = <&plic>;
> +
> +		riscv_wdt: watchdog@6011000 {
> +			compatible = "allwinner,sun20i-d1-wdt";
> +			reg = <0x6011000 0x20>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(131) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&dcxo>, <&rtc CLK_OSC32K>;
> +			clock-names = "hosc", "losc";
> +		};
> +
> +		plic: interrupt-controller@10000000 {
> +			compatible = "allwinner,sun20i-d1-plic",
> +				     "thead,c900-plic";
> +			reg = <0x10000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>,
> +					      <&cpu0_intc 9>;
> +			interrupt-controller;
> +			riscv,ndev = <176>;

The D1-H user manual says starting from interrupt number 176, interrupts are
CPUX related which I assume are CPU internal interrupts?

If yes, for external ones, valid interrupt source range is [1, 175]. And this
field should be 175, no?

> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};

<snip>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
