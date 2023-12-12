Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C314DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 01:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTKSL/k3Zxwxo78HJQYkgCqp0ox8GLD37gSdu0djXGQ=; b=BJ63F2C2uco/Tl
	rWMxkhLBare6Zuud5rqPZKix/hDwCHk1SO4uhQM4/ZQ2b/jgrtOLlFW0g0JlWap0alzbicmd/nAoZ
	G1VdmUSEvfBCD9z21RA6MXYtzT1S6YA4TB5F1mP31Tsh5zMlytvE3C/cj0dTtWG5YbYPFyQ1sHO3t
	lH+Xz5FS1xV5of/d5q6mMMITxuv06cBJEPz+ws0OZTtrZaWvI8kmCiXww38pMVGwCEzzBOr95I5mx
	EFkFfUbsE2kkVPDnTD4dQBe40P9zPrzu9xf+rqPpeWuScCcAMmqJ9MbxWd0dUkXIyHG0K73mpDlMt
	wp9rtoz3i68/q2VT0S5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrG2-00AQVk-1x;
	Tue, 12 Dec 2023 01:08:22 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrFy-00AQV1-2D
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 01:08:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EE98024E269;
	Tue, 12 Dec 2023 09:07:59 +0800 (CST)
Received: from EXMBX167.cuchost.com (172.16.6.77) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 09:07:59 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX167.cuchost.com
 (172.16.6.77) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 09:07:59 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 12 Dec 2023 09:07:59 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "Hal
 Feng" <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and
 resets nodes
Thread-Topic: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and
 resets nodes
Thread-Index: AQHaKDqra6wATad1nUKrJTE2u0DzTrCfE7aAgAXJTyA=
Date: Tue, 12 Dec 2023 01:07:59 +0000
Message-ID: <38f6f61b9928460abd5d426a84adbb06@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-17-jeeheng.sia@starfivetech.com>
 <CAJM55Z9bik1QttBeFUCfM3N98HWURge7mgV7ohFBq+AsuvtROg@mail.gmail.com>
In-Reply-To: <CAJM55Z9bik1QttBeFUCfM3N98HWURge7mgV7ohFBq+AsuvtROg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_170819_246639_9F7A31EB 
X-CRM114-Status: GOOD (  18.00  )
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
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Sent: Saturday, December 9, 2023 12:40 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
> 
> Sia Jee Heng wrote:
> > Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
> > nodes for JH8100 RISC-V SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi | 180 +++++++++++++++++++
> >  arch/riscv/boot/dts/starfive/jh8100.dtsi     | 115 ++++++++++++
> 
> Why the split here? I mean why can't the clocks just be in the jh8100.dtsi?
The reason is that the number of fixed clocks increases when more and more
domain clocks are added. So, that is why we split out the clock file.
> 
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
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +	};
> > +
> > +	clk_i2srx_bclk_ext: clk_i2srx_bclk_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <12288000>;
> > +	};
> > +
> > +	clk_i2srx_lrck_ext: clk_i2srx_lrck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <192000>;
> > +	};
> > +
> > +	clk_mclk_ext: clk_mclk_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <49152000>;
> > +	};
> > +	/* sys-ne */
> > +	clk_usb3_tap_tck_ext: clk_usb3_tap_tck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_glb_ext_clk: clk_glb_ext_clk {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <30000000>;
> > +	};
> > +
> > +	clk_usb1_tap_tck_ext: clk_usb1_tap_tck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_usb2_tap_tck_ext: clk_usb2_tap_tck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_i2s_tscko: clk_i2s_tscko {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <12800000>;
> > +	};
> > +
> > +	clk_typec_tap_tck_ext: clk_typec_tap_tck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_spi_in0_ext: clk_spi_in0_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_spi_in1_ext: clk_spi_in1_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_spi_in2_ext: clk_spi_in2_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_i2stx_bclk_ext: clk_i2stx_bclk_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <12288000>;
> > +	};
> > +
> > +	clk_i2stx_lrck_ext: clk_i2stx_lrck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <192000>;
> > +	};
> > +	/* sys-nw */
> > +	clk_dvp_ext: clk_dvp_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <150000000>;
> > +	};
> > +
> > +	clk_isp_dphy_tap_tck_ext: clk_isp_dphy_tap_tck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_vout_mipi_dphy_tap_tck_ext: clk_vout_mipi_dphy_tap_tck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_vout_edp_tap_tck_ext: clk_vout_edp_tap_tck_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +	};
> > +
> > +	clk_rtc: clk_rtc {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <32768>;
> > +	};
> > +	/* aon */
> > +	clk_gmac0_rmii_func: clk_gmac0_rmii_func {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <50000000>;
> > +	};
> > +
> > +	clk_gmac0_rgmii_func: clk_gmac0_rgmii_func {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <125000000>;
> > +	};
> > +
> > +	clk_aon50: clk_aon50 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <50000000>;
> > +	};
> > +
> > +	clk_aon125: clk_aon125 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <125000000>;
> > +	};
> > +
> > +	clk_aon2000: clk_aon2000 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <2000000000>;
> > +	};
> > +
> > +	clk_aon200: clk_aon200 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <200000000>;
> > +	};
> > +
> > +	clk_aon667: clk_isp_aon667 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <667000000>;
> > +	};
> > +
> > +	clk_i3c_ext: clk_i3c_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <12500000>;
> > +	};
> > +
> > +	clk_espi_ext: clk_espi_ext {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <60000000>;
> > +	};
> > +};
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
> > +			compatible = "starfive,jh8100-syscrg-ne";
> > +			reg = <0x0 0x12320000 0x0 0x10000>;
> > +			clocks = <&clk_osc>, <&syscrg SYSCRG_CLK_AXI_400>,
> > +				 <&syscrg SYSCRG_CLK_VOUT_ROOT0>,
> > +				 <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
> > +				 <&syscrg SYSCRG_CLK_USB_WRAP_480>,
> > +				 <&syscrg SYSCRG_CLK_USB_WRAP_625>,
> > +				 <&syscrg SYSCRG_CLK_USB_WRAP_240>,
> > +				 <&syscrg SYSCRG_CLK_USB_WRAP_60>,
> > +				 <&syscrg SYSCRG_CLK_USB_WRAP_156P25>,
> > +				 <&syscrg SYSCRG_CLK_USB_WRAP_312P5>,
> > +				 <&syscrg SYSCRG_CLK_USB_125M>,
> > +				 <&syscrg_nw SYSCRG_NW_CLK_GPIO_100>,
> > +				 <&syscrg SYSCRG_CLK_PERH_ROOT>, <&syscrg SYSCRG_CLK_MCLK>,
> > +				 <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
> > +				 <&syscrg SYSCRG_CLK_AHB0>,
> > +				 <&syscrg SYSCRG_CLK_APB_BUS_PER1>,
> > +				 <&syscrg SYSCRG_CLK_APB_BUS_PER2>,
> > +				 <&syscrg SYSCRG_CLK_APB_BUS_PER3>,
> > +				 <&syscrg SYSCRG_CLK_APB_BUS_PER5>,
> > +				 <&syscrg SYSCRG_CLK_VENC_ROOT>,
> > +				 <&syscrg SYSCRG_CLK_SPI_CORE_100>,
> > +				 <&clk_glb_ext_clk>, <&clk_usb3_tap_tck_ext>,
> > +				 <&clk_usb1_tap_tck_ext>, <&clk_usb2_tap_tck_ext>,
> > +				 <&clk_typec_tap_tck_ext>, <&clk_spi_in0_ext>,
> > +				 <&clk_spi_in1_ext>, <&clk_i2stx_bclk_ext>, <&clk_i2stx_lrck_ext>;
> > +			clock-names = "clk_osc", "sys_clk_axi_400",
> > +				      "sys_clk_vout_root0", "sys_clk_vout_root1",
> > +				      "sys_clk_usb_wrap_480", "sys_clk_usb_wrap_625",
> > +				      "sys_clk_usb_wrap_240", "sys_clk_usb_wrap_60",
> > +				      "sys_clk_usb_wrap_156p25", "sys_clk_usb_wrap_312p5",
> > +				      "sys_clk_usb_125m", "sys_nw_clk_gpio_100",
> > +				      "sys_clk_perh_root", "sys_clk_mclk",
> > +				      "sys_clk_perh_root_preosc", "sys_clk_ahb0",
> > +				      "sys_clk_apb_bus_per1", "sys_clk_apb_bus_per2",
> > +				      "sys_clk_apb_bus_per3", "sys_clk_apb_bus_per5",
> > +				      "sys_clk_venc_root", "sys_clk_spi_core_100",
> > +				      "clk_glb_ext_clk", "clk_usb3_tap_tck_ext",
> > +				      "clk_usb1_tap_tck_ext", "clk_usb2_tap_tck_ext",
> > +				      "clk_typec_tap_tck_ext", "clk_spi_in0_ext",
> > +				      "clk_spi_in1_ext", "clk_i2stx_bclk_ext",
> > +				      "clk_i2stx_lrck_ext";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> > +		syscrg_nw: syscrg_nw@123c0000 {
> > +			compatible = "starfive,jh8100-syscrg-nw";
> > +			reg = <0x0 0x123c0000 0x0 0x10000>;
> > +			clocks = <&clk_osc>, <&syscrg SYSCRG_CLK_APB_BUS>,
> > +				 <&syscrg SYSCRG_CLK_ISP_2X>, <&syscrg SYSCRG_CLK_ISP_AXI>,
> > +				 <&syscrg SYSCRG_CLK_VOUT_ROOT0>, <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
> > +				 <&syscrg SYSCRG_CLK_VOUT_SCAN_ATS>,
> > +				 <&syscrg SYSCRG_CLK_VOUT_DC_CORE>, <&syscrg SYSCRG_CLK_VOUT_AXI>,
> > +				 <&syscrg SYSCRG_CLK_AXI_400>, <&syscrg SYSCRG_CLK_AXI_200>,
> > +				 <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
> > +				 <&clk_dvp_ext>, <&clk_isp_dphy_tap_tck_ext>,
> > +				 <&clk_glb_ext_clk>, <&clk_i2s_tscko>,
> > +				 <&clk_vout_mipi_dphy_tap_tck_ext>, <&clk_vout_edp_tap_tck_ext>,
> > +				 <&clk_spi_in2_ext>;
> > +			clock-names = "clk_osc", "sys_clk_apb_bus",
> > +				      "sys_clk_isp_2x", "sys_clk_isp_axi",
> > +				      "sys_clk_vout_root0", "sys_clk_vout_root1",
> > +				      "sys_clk_vout_scan_ats", "sys_clk_vout_dc_core",
> > +				      "sys_clk_vout_axi", "sys_clk_axi_400",
> > +				      "sys_clk_axi_200", "sys_clk_perh_root_preosc", "clk_dvp_ext",
> > +				      "clk_isp_dphy_tap_tck_ext", "clk_glb_ext_clk",
> > +				      "clk_i2s_tscko", "clk_vout_mipi_dphy_tap_tck_ext",
> > +				      "clk_vout_edp_tap_tck_ext", "clk_spi_in2_ext";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> > +		syscrg: syscrg@126d0000 {
> > +			compatible = "starfive,jh8100-syscrg";
> > +			reg = <0x0 0x126d0000 0x0 0x10000>;
> > +			clocks = <&clk_osc>, <&clk_i2srx_bclk_ext>,
> > +				 <&clk_i2srx_lrck_ext>, <&clk_mclk_ext>;
> > +			clock-names = "clk_osc", "clk_i2srx_bclk_ext",
> > +				      "clk_i2srx_lrck_ext", "clk_mclk_ext";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> > +		syscrg_sw: syscrg_sw@12720000 {
> > +			compatible = "starfive,jh8100-syscrg-sw";
> > +			reg = <0x0 0x12720000 0x0 0x10000>;
> > +			clocks = <&syscrg SYSCRG_CLK_APB_BUS>,
> > +				 <&syscrg SYSCRG_CLK_VDEC_ROOT>,
> > +				 <&syscrg SYSCRG_CLK_FLEXNOC1>;
> > +			clock-names = "sys_clk_apb_bus",
> > +				      "sys_clk_vdec_root",
> > +				      "sys_clk_flexnoc1";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >  		uart5: serial@127d0000  {
> >  			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> >  			reg = <0x0 0x127d0000 0x0 0x10000>;
> > @@ -374,5 +475,19 @@ uart6: serial@127e0000  {
> >  			interrupts = <73>;
> >  			status = "disabled";
> >  		};
> > +
> > +		aoncrg: aoncrg@1f310000 {
> > +			compatible = "starfive,jh8100-aoncrg";
> > +			reg = <0x0 0x1f310000 0x0 0x10000>;
> > +			clocks = <&clk_osc>, <&clk_gmac0_rmii_func>,
> > +				 <&clk_gmac0_rgmii_func>, <&clk_aon125>,
> > +				 <&clk_aon2000>, <&clk_aon200>,
> > +				 <&clk_aon667>, <&clk_rtc>;
> > +			clock-names = "clk_osc", "clk_gmac0_rmii_func", "clk_gmac0_rgmii_func",
> > +				      "clk_aon125", "clk_aon2000", "clk_aon200",
> > +				      "clk_aon667", "clk_rtc";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> >  	};
> >  };
> > --
> > 2.34.1
> >
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
