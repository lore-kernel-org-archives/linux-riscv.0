Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9032AC46CD4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 05:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7XB93sHnrHb4JK6SgP0oWzBJOJIw5CWvLlqpTMWSQM=; b=a3DxRTNuTRLvDt
	BzNlV/eUonJ3qRpQKb35sTXSm8ScCjPV3XwJ3ZhW0vwe8JFJvSkMz2z0Uxbox6XFuR36fnuF6OdPM
	S1TDtgxZAxMOcNZSXu45M0JBI/t18CfxDMwFyJHyMtj/nM/Ncx5RTvUNz/+AE5niyn5s00Z1wnJ8d
	xhyap+oNKFkSm8Ll+onSTeNpxchvZ2Pz5O4J64RJmKMSfS6v9quyWzE/4aV6/RG004s67Z/LzwHW7
	Q5No/1IWlRk2ef1u2g4OEFXoJiJCyRKfGMq3R8iZDM2ucmsPe572rhTATCrivD95gO32AoRdl7s1s
	oM4oIOAPzc5KAoFg3o2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI0Bh-00Bjeo-15;
	Tue, 26 Dec 2023 05:41:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI0Bd-00BjWI-14
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 05:41:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9C1DA807B;
	Tue, 26 Dec 2023 13:40:48 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 26 Dec
 2023 13:40:48 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 26 Dec 2023 13:40:42 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<emil.renner.berthing@canonical.com>, <hal.feng@starfivetech.com>,
	<xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [RFC 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
Date: Tue, 26 Dec 2023 13:38:48 +0800
Message-ID: <20231226053848.25089-17-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
References: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_214105_731774_7A38212D 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
nodes for JH8100 RISC-V SoC.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh8100.dtsi | 313 +++++++++++++++++++++++
 1 file changed, 313 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
index f26aff5c1ddf..0fc8889bc0eb 100644
--- a/arch/riscv/boot/dts/starfive/jh8100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
@@ -4,6 +4,8 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/clock/starfive,jh8100-crg.h>
+#include <dt-bindings/reset/starfive,jh8100-crg.h>
 
 / {
 	compatible = "starfive,jh8100";
@@ -279,6 +281,210 @@ clk_uart: clk-uart {
 		clock-frequency = <24000000>;
 	};
 
+	osc: osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	i2srx_bclk_ext: i2srx-bclk-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12288000>;
+	};
+
+	i2srx_lrck_ext: i2srx-lrck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <192000>;
+	};
+
+	mclk_ext: mclk-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <49152000>;
+	};
+
+	usb3_tap_tck_ext: usb3-tap-tck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	glb_ext_clk: glb-ext-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <30000000>;
+	};
+
+	usb1_tap_tck_ext: usb1-tap-tck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	usb2_tap_tck_ext: usb2-tap-tck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	typec_tap_tck_ext: typec-tap-tck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	spi_in0_ext: spi-in0-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	spi_in1_ext: spi-in1-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	spi_in2_ext: spi-in2-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	i2stx_bclk_ext: i2stx-bclk-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12288000>;
+	};
+
+	i2stx_lrck_ext: i2stx-lrck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <192000>;
+	};
+
+	dvp_ext: dvp-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <150000000>;
+	};
+
+	isp_dphy_tap_tck_ext: isp-dphy-tap-tck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	vout_mipi_dphy_tap_tck_ext: vout-mipi-dphy-tap-tck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	vout_edp_tap_tck_ext: vout-edp-tap-tck-ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	rtc: rtc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	gmac0_rmii_func: gmac0-rmii-func {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
+
+	gmac0_rgmii_func: gmac0-rgmii-func {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	aon50: aon50 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
+
+	aon125: aon125 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	aon2000: aon2000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2000000000>;
+	};
+
+	aon200: aon200 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+	};
+
+	aon667: aon667 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <667000000>;
+	};
+
+	pll0: pll0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2000000000>;
+	};
+
+	pll1: pll1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1782000000>;
+	};
+
+	pll2: pll2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1843200000>;
+	};
+
+	pll3: pll3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1866000000>;
+	};
+
+	pll4: pll4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2000000000>;
+	};
+
+	pll5: pll5 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1500000000>;
+	};
+
+	pll6: pll6 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1782000000>;
+	};
+
+	pll7: pll7 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2400000000>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -357,6 +563,99 @@ uart4: serial@121a0000  {
 			status = "disabled";
 		};
 
+		necrg: necrg@12320000 {
+			compatible = "starfive,jh8100-necrg";
+			reg = <0x0 0x12320000 0x0 0x10000>;
+			clocks = <&osc>, <&syscrg JH8100_SYSCLK_AXI_400>,
+				 <&syscrg JH8100_SYSCLK_VOUT_ROOT0>,
+				 <&syscrg JH8100_SYSCLK_VOUT_ROOT1>,
+				 <&syscrg JH8100_SYSCLK_USB_WRAP_480>,
+				 <&syscrg JH8100_SYSCLK_USB_WRAP_625>,
+				 <&syscrg JH8100_SYSCLK_USB_WRAP_240>,
+				 <&syscrg JH8100_SYSCLK_USB_WRAP_60>,
+				 <&syscrg JH8100_SYSCLK_USB_WRAP_156P25>,
+				 <&syscrg JH8100_SYSCLK_USB_WRAP_312P5>,
+				 <&syscrg JH8100_SYSCLK_USB_125M>,
+				 <&nwcrg JH8100_NWCLK_GPIO_100>,
+				 <&syscrg JH8100_SYSCLK_PERH_ROOT>,
+				 <&syscrg JH8100_SYSCLK_MCLK>,
+				 <&syscrg JH8100_SYSCLK_PERH_ROOT_PREOSC>,
+				 <&syscrg JH8100_SYSCLK_AHB0>,
+				 <&syscrg JH8100_SYSCLK_APB_BUS_PER1>,
+				 <&syscrg JH8100_SYSCLK_APB_BUS_PER2>,
+				 <&syscrg JH8100_SYSCLK_APB_BUS_PER3>,
+				 <&syscrg JH8100_SYSCLK_APB_BUS_PER5>,
+				 <&syscrg JH8100_SYSCLK_VENC_ROOT>,
+				 <&syscrg JH8100_SYSCLK_SPI_CORE_100>,
+				 <&glb_ext_clk>, <&usb3_tap_tck_ext>,
+				 <&usb1_tap_tck_ext>, <&usb2_tap_tck_ext>,
+				 <&typec_tap_tck_ext>, <&spi_in0_ext>,
+				 <&spi_in1_ext>, <&i2stx_bclk_ext>, <&i2stx_lrck_ext>;
+			clock-names = "osc", "axi_400", "vout_root0", "vout_root1",
+				      "usb_wrap_480", "usb_wrap_625", "usb_wrap_240",
+				      "usb_wrap_60", "usb_wrap_156p25", "usb_wrap_312p5",
+				      "usb_125m", "gpio_100", "perh_root", "mclk",
+				      "perh_root_preosc", "ahb0", "apb_bus_per1",
+				      "apb_bus_per2", "apb_bus_per3", "apb_bus_per5",
+				      "venc_root", "spi_core_100", "glb-ext-clk",
+				      "usb3-tap-tck-ext", "usb1-tap-tck-ext",
+				      "usb2-tap-tck-ext", "typec-tap-tck-ext", "spi-in0-ext",
+				      "spi-in1-ext", "i2stx-bclk-ext", "i2stx-lrck-ext";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		nwcrg: nwcrg@123c0000 {
+			compatible = "starfive,jh8100-nwcrg";
+			reg = <0x0 0x123c0000 0x0 0x10000>;
+			clocks = <&osc>, <&syscrg JH8100_SYSCLK_APB_BUS>,
+				 <&syscrg JH8100_SYSCLK_APB_BUS_PER4>,
+				 <&syscrg JH8100_SYSCLK_SPI_CORE_100>,
+				 <&syscrg JH8100_SYSCLK_ISP_2X>,
+				 <&syscrg JH8100_SYSCLK_ISP_AXI>,
+				 <&syscrg JH8100_SYSCLK_VOUT_ROOT0>,
+				 <&syscrg JH8100_SYSCLK_VOUT_ROOT1>,
+				 <&syscrg JH8100_SYSCLK_VOUT_SCAN_ATS>,
+				 <&syscrg JH8100_SYSCLK_VOUT_DC_CORE>,
+				 <&syscrg JH8100_SYSCLK_VOUT_AXI>,
+				 <&syscrg JH8100_SYSCLK_AXI_400>, <&syscrg JH8100_SYSCLK_AHB0>,
+				 <&syscrg JH8100_SYSCLK_PERH_ROOT_PREOSC>,
+				 <&dvp_ext>, <&isp_dphy_tap_tck_ext>, <&glb_ext_clk>,
+				 <&vout_mipi_dphy_tap_tck_ext>, <&vout_edp_tap_tck_ext>,
+				 <&spi_in2_ext>, <&pll5>;
+			clock-names = "osc", "apb_bus", "apb_bus_per4", "spi_core_100",
+				      "isp_2x", "isp_axi", "vout_root0", "vout_root1",
+				      "vout_scan_ats", "vout_dc_core", "vout_axi", "axi_400",
+				      "ahb0", "perh_root_preosc", "dvp-ext",
+				      "isp-dphy-tap-tck-ext", "glb-ext-clk",
+				      "vout-mipi-dphy-tap-tck-ext", "vout-edp-tap-tck-ext",
+				      "spi-in2-ext", "pll5";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		syscrg: syscrg@126d0000 {
+			compatible = "starfive,jh8100-syscrg";
+			reg = <0x0 0x126d0000 0x0 0x10000>;
+			clocks = <&osc>, <&mclk_ext>, <&pll0>, <&pll1>,
+				 <&pll2>, <&pll3>, <&pll4>, <&pll6>, <&pll7>;
+			clock-names = "osc", "mclk-ext", "pll0", "pll1", "pll2",
+				      "pll3", "pll4", "pll6", "pll7";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		swcrg: swcrg@12720000 {
+			compatible = "starfive,jh8100-swcrg";
+			reg = <0x0 0x12720000 0x0 0x10000>;
+			clocks = <&syscrg JH8100_SYSCLK_APB_BUS>,
+				 <&syscrg JH8100_SYSCLK_VDEC_ROOT>,
+				 <&syscrg JH8100_SYSCLK_FLEXNOC1>;
+			clock-names = "apb_bus", "vdec_root", "flexnoc1";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		uart5: serial@127d0000  {
 			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
 			reg = <0x0 0x127d0000 0x0 0x10000>;
@@ -374,5 +673,19 @@ uart6: serial@127e0000  {
 			interrupts = <73>;
 			status = "disabled";
 		};
+
+		aoncrg: aoncrg@1f310000 {
+			compatible = "starfive,jh8100-aoncrg";
+			reg = <0x0 0x1f310000 0x0 0x10000>;
+			clocks = <&osc>, <&gmac0_rmii_func>,
+				 <&gmac0_rgmii_func>, <&aon125>,
+				 <&aon2000>, <&aon200>,
+				 <&aon667>, <&rtc>;
+			clock-names = "osc", "gmac0-rmii-func", "gmac0-rgmii-func",
+				      "aon125", "aon2000", "aon200",
+				      "aon667", "rtc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
