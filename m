Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2091093190
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jue72olaW/u2yK4rVey1f2enb0EyeEzBl5otNKX2W40=; b=dNUdp5jksIbwMZ
	xtbpRtkfHIQnBZnOd6aSV7VBn+OWzdeVFfY16LLTGMH1Q9sYbNJbYJel/ToPo8zUSA2IUIkdjxqD9
	NjHNJdQ+hF8sCrFAHxL6f0ktkbZZemu2UWxNLsmiwk4mKU5jyfNTotScuHCeHZqd4FrIh8OoDN4Og
	F2jMSDaU5GVvbj6YV/TSHTPPJFBMOK/ayjDiR03SDowLmhEGa+/BE5g2fvgIHngcwjYhnhDp2r550
	EauQif7tCp1eviY0yI+3XLcSrFfy+7jv8bg9aVyHhlsKd4rQqgpM2f8sZgUbi4xohUxBtDKBD47YL
	shbDLKAqDA1M11YoCjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vp4-0000000CR8h-47NA;
	Fri, 20 Mar 2026 09:07:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vp3-0000000CR8b-2Rbl
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 09:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07AB060127;
	Fri, 20 Mar 2026 09:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E640C2BCAF;
	Fri, 20 Mar 2026 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997632;
	bh=xIcEabRzmhWG1ztGOxh6GMzv3CTVJVuSsogqTI/knbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEEEVi4uTjV4CwO5qP33wWt537tMrtwsC6ec6foPUKbrzW5+xOIwBOFNlnfTriGph
	 uw6YKprvuE9tMwIoNzyVHL4fMYcySjGZNCm7Cf4TDh5yKeCjfrp6sZIGSeCBoTpbRO
	 Oy818KobMyveN9O3hMlqPh4n7W5ko8JJDf6KrPd+3n2OpN14+FyTNXYZ22PZvNF529
	 YVepZnBRmKpdfcx7P9ZckF7k5dr8yzRXgmITG+ziruMag0Raddw92+WGh1BwV3aVFS
	 aH3E8vp7sGmAm0hDWeLmQ07sNbmCCdX5E8qllAJ05ZPnHU/SOAjb3/I7SAGqv6kfFi
	 lXIYv3+p1uImw==
Date: Fri, 20 Mar 2026 17:07:10 +0800
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3] riscv: dts: spacemit: Add ethernet device for K3
Message-ID: <20260320090710-GKA525649@kernel.org>
References: <20260318035542.517554-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318035542.517554-1-inochiama@gmail.com>
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

Hi Inochi,

On 11:55 Wed 18 Mar     , Inochi Amaoto wrote:
> Add all ethernet device nodes for K3 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
> Require the following patch series:
> 1. Basic DT device patch
> https://lore.kernel.org/spacemit/20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org
> 2. Ethernet driver patch
> https://lore.kernel.org/spacemit/20260316010041.164360-1-inochiama@gmail.com
> 
> Changed from v2:
> 1. keep aliases in alphabetical order.
> 
> Changed from v1:
> 1. remove interrupt-parents property
> 2. add aliases for ethernet node
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  25 +++++
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  48 +++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 104 +++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b691304d4b74..28e86e8df4d3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -4,13 +4,19 @@
>   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
>   */
> 
> +#include <dt-bindings/gpio/gpio.h>
> +
>  #include "k3.dtsi"
> +#include "k3-pinctrl.dtsi"
> 
>  / {
>  	model = "SpacemiT K3 Pico-ITX";
>  	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
> 
>  	aliases {
> +		ethernet0 = &eth0;
> +		ethernet1 = &eth1;
> +		ethernet2 = &eth2;
>  		serial0 = &uart0;
>  	};
> 
> @@ -24,6 +30,25 @@ memory@100000000 {
>  	};
>  };
> 
> +&eth0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_cfg>;
> +
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&phy0>;
> +	status = "okay";
> +
> +	mdio {
> +		phy0: phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <10000>;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> new file mode 100644
> index 000000000000..414ee221d3d7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
> +
> +&pinctrl {
> +	gmac0_cfg: gmac0-cfg {
> +		gmac0_base_pins: gmac0-0-pins {
is this a RMII mode? I have not checked, but it's rare to see boards
use RMII only.. I mean it's probably not that much valuable..

if it's valid, suggest name it more explicitly: gmac0_rmii_pins?

> +			pinmux = <K3_PADCONF(0, 1)>,
suggest to add a comment at the end, something like
			pinmux = <K3_PADCONF(0, 1)>, /* gmac0_rxdv */

> +				 <K3_PADCONF(1, 1)>,
> +				 <K3_PADCONF(2, 1)>,
> +				 <K3_PADCONF(3, 1)>,
> +				 <K3_PADCONF(6, 1)>,
> +				 <K3_PADCONF(7, 1)>,
> +				 <K3_PADCONF(11, 1)>,
> +				 <K3_PADCONF(12, 1)>,
> +				 <K3_PADCONF(13, 1)>;
> +
> +			bias-disable;
> +			drive-strength = <25>;
> +			power-source = <1800>;
> +		};
> +
> +		gmac0_rgmii_add_pins: gmac0-1-pins {
> +			pinmux = <K3_PADCONF(4, 1)>,
> +				 <K3_PADCONF(5, 1)>,
> +				 <K3_PADCONF(8, 1)>,
> +				 <K3_PADCONF(9, 1)>,
> +				 <K3_PADCONF(10, 1)>;
> +
> +			bias-disable;
> +			drive-strength = <25>;
> +			power-source = <1800>;
> +		};
> +
> +		gmac0_int_pins: gmac0-3-pins {
> +			pinmux = <K3_PADCONF(14, 1)>;
> +
> +			bias-disable;
> +			drive-strength = <25>;
> +			power-source = <1800>;
> +		};
You've divided pins into different groups, but how can we reuse them?
I can think one case at the device level in boards dts, request different
combination for different use cases..
	pinctrl = <&gmac0_base_pins>, <&gmac0_rgmii_add_pins>;

btw, the pin GMAC0_REF0_CLK_25M is missing, it probably depend on final
schematics, to use 25M clock from SoC (need to request this pin), or use
external 25M crytal (no need to request)

also it would be great to list pins for gmac1, 2, but I'm fine without
them.. can do it when there is board really use them..

> +	};
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 6cc31e94c13a..4c0cc135dc09 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -5,6 +5,7 @@
>   */
> 
>  #include <dt-bindings/clock/spacemit,k3-clocks.h>
> +#include <dt-bindings/reset/spacemit,k3-resets.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> 
>  /dts-v1/;
> @@ -437,6 +438,109 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
> 
> +		gmac_axi_setup: stmmac-axi-config {
> +			snps,wr_osr_lmt = <0xf>;
> +			snps,rd_osr_lmt = <0xf>;
> +			/* max axi burst len is 256 */
> +			snps,blen = <256 128 64 32 16 0 0>;
> +		};
> +
> +		eth0: ethernet@cac80000 {
> +			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
> +			reg = <0x0 0xcac80000 0x0 0x2000>;
> +			clocks = <&syscon_apmu CLK_APMU_EMAC0_BUS>,
> +				 <&syscon_apmu CLK_APMU_EMAC0_1588>,
> +				 <&syscon_apmu CLK_APMU_EMAC0_RGMII_TX>;
> +			clock-names = "stmmaceth", "ptp_ref", "tx";
> +			interrupts = <131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <276 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq", "eth_wake_irq";
> +			resets = <&syscon_apmu RESET_APMU_EMAC0>;
> +			reset-names = "stmmaceth";
> +			rx-fifo-depth = <8192>;
> +			tx-fifo-depth = <8192>;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,aal;
> +			snps,tso;
> +			snps,txpbl = <8>;
> +			snps,rxpbl = <8>;
> +			snps,force_sf_dma_mode;
> +			snps,axi-config = <&gmac_axi_setup>;
> +			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
> +			status = "disabled";
> +
> +			mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		eth1: ethernet@cac82000 {
> +			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
> +			reg = <0x0 0xcac82000 0x0 0x2000>;
> +			clocks = <&syscon_apmu CLK_APMU_EMAC1_BUS>,
> +				 <&syscon_apmu CLK_APMU_EMAC1_1588>,
> +				 <&syscon_apmu CLK_APMU_EMAC1_RGMII_TX>;
> +			clock-names = "stmmaceth", "ptp_ref", "tx";
> +			interrupts = <133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <277 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq", "eth_wake_irq";
> +			resets = <&syscon_apmu RESET_APMU_EMAC1>;
> +			reset-names = "stmmaceth";
> +			rx-fifo-depth = <8192>;
> +			tx-fifo-depth = <8192>;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,aal;
> +			snps,tso;
> +			snps,txpbl = <8>;
> +			snps,rxpbl = <8>;
> +			snps,force_sf_dma_mode;
> +			snps,axi-config = <&gmac_axi_setup>;
> +			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
> +			status = "disabled";
> +
> +			mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		eth2: ethernet@cac8e000 {
> +			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
> +			reg = <0x0 0xcac8e000 0x0 0x2000>;
> +			clocks = <&syscon_apmu CLK_APMU_EMAC2_BUS>,
> +				 <&syscon_apmu CLK_APMU_EMAC2_1588>,
> +				 <&syscon_apmu CLK_APMU_EMAC2_RGMII_TX>;
> +			clock-names = "stmmaceth", "ptp_ref", "tx";
> +			interrupts = <130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <278 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq", "eth_wake_irq";
> +			resets = <&syscon_apmu RESET_APMU_EMAC2>;
> +			reset-names = "stmmaceth";
> +			rx-fifo-depth = <4096>;
> +			tx-fifo-depth = <4096>;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,aal;
> +			snps,tso;
> +			snps,txpbl = <8>;
> +			snps,rxpbl = <8>;
> +			snps,force_sf_dma_mode;
> +			snps,axi-config = <&gmac_axi_setup>;
> +			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
> +			status = "disabled";
> +
> +			mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		syscon_apbc: system-controller@d4015000 {
>  			compatible = "spacemit,k3-syscon-apbc";
>  			reg = <0x0 0xd4015000 0x0 0x1000>;
> --
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
