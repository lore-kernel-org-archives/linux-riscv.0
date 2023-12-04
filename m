Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5984C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRuPooNC5Kg78PoYW+mb7TSNyalPMc/WIilcMd2M9AA=; b=QHwi91VIJfKEbO
	0f5J8Y5td8NCKdWrZDRLCOlV+6Ab45MGrhb7UKDVOkmc+H6mJpp3LRq4qBBluF+wGtgSkcJlC9uTj
	ilOadN3dEiFbC7zF2EmcALUPgxiS+ATR98iBVQaKa31IRR/Uk2ua7g5gLbX+TWaM92AIJ3APbDDyF
	RmW1b6v+vPj6rT6tF6ZCAu3Pg3k/DEyn9lgBY8RWZokekhrrYxn/Mlm21/D+DPfHLRyatSpt0S9ND
	PvY1pcau7syR70kOb99Hdi1QF7l0k/v3P/dqkQ0nukI2NCG2H7+BFIHALjE5lccTrbtaT1un1IO5c
	XdyEB/uO3jDL33NBmMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA893-0043sk-1X;
	Mon, 04 Dec 2023 12:33:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA890-0043cc-0E
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 12:33:52 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id AB67124E24C;
	Mon,  4 Dec 2023 20:33:17 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:17 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:17 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Keith Zhao <keith.zhao@starfivetech.com>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <william.qiu@starfivetech.com>,
	<xingyu.wu@starfivetech.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <p.zabel@pengutronix.de>,
	<shengyang.chen@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<changhuang.liang@starfivetech.com>, <maarten.lankhorst@linux.intel.com>,
	<suijingfeng@loongson.cn>
Subject: [v3 2/6] riscv: dts: starfive: jh7110: display subsystem
Date: Mon, 4 Dec 2023 20:33:11 +0800
Message-ID: <20231204123315.28456-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204123315.28456-1-keith.zhao@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_043350_438572_F3DFD854 
X-CRM114-Status: UNSURE (   9.64  )
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

Add the dc controller and hdmi node for the Starfive JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 134 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  49 +++++++
 2 files changed, 183 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index b89e9791efa7..6e387e0138c0 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -35,6 +35,25 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0x1 0x0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* vout applies for space from this CMA
+		 * Without this CMA reservation,
+		 * vout may not work properly.
+		 */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x20000000>;
+			alignment = <0x0 0x1000>;
+			alloc-ranges = <0x0 0x70000000 0x0 0x20000000>;
+			linux,cma-default;
+		};
+	};
+
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
@@ -69,6 +88,68 @@ codec {
 	};
 };
 
+&dc8200 {
+	status = "okay";
+
+	crtc_out: ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dc_out0: port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dc_out_dpi0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_enc>;
+			};
+
+		};
+
+		dc_out1: port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dc_out_dpi1: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dsi_enc>;
+			};
+
+		};
+	};
+};
+
+&display {
+	status = "okay";
+	ports = <&crtc_out>;
+};
+
+&dsi_encoder {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* input */
+		enc_in: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dsi_enc:endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dc_out_dpi1>;
+			};
+		};
+		/* output */
+		enc_out: port@1 {
+			reg = <1>;
+			/*need add a remote-endpoint to dsi bridge*/
+		};
+	};
+};
+
 &dvp_clk {
 	clock-frequency = <74250000>;
 };
@@ -89,6 +170,21 @@ &gmac1_rmii_refin {
 	clock-frequency = <50000000>;
 };
 
+&hdmi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins>;
+
+	hdmi_in: port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		hdmi_enc: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&dc_out_dpi0>;
+		};
+	};
+};
+
 &hdmitx0_pixelclk {
 	clock-frequency = <297000000>;
 };
@@ -336,6 +432,40 @@ spi_dev0: spi@0 {
 };
 
 &sysgpio {
+	hdmi_pins: hdmi-0 {
+		hdmi-cec-pins {
+			pinmux = <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
+					     GPOEN_SYS_HDMI_CEC_SDA,
+					     GPI_SYS_HDMI_CEC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-hpd-pins {
+			pinmux = <GPIOMUX(15, GPOUT_HIGH,
+					     GPOEN_ENABLE,
+					     GPI_SYS_HDMI_HPD)>;
+			input-enable;
+			bias-disable; /* external pull-up */
+		};
+
+		hdmi-scl-pins {
+			pinmux = <GPIOMUX(0, GPOUT_SYS_HDMI_DDC_SCL,
+					     GPOEN_SYS_HDMI_DDC_SCL,
+					     GPI_SYS_HDMI_DDC_SCL)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-sda-pins {
+			pinmux = <GPIOMUX(1, GPOUT_SYS_HDMI_DDC_SDA,
+					     GPOEN_SYS_HDMI_DDC_SDA,
+					     GPI_SYS_HDMI_DDC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
 			pinmux = <GPIOMUX(57, GPOUT_LOW,
@@ -642,3 +772,7 @@ &U74_3 {
 &U74_4 {
 	cpu-supply = <&vdd_cpu>;
 };
+
+&voutcrg {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 45213cdf50dc..df51b9407328 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -344,6 +344,24 @@ tdm_ext: tdm-ext-clock {
 		#clock-cells = <0>;
 	};
 
+	display: display-subsystem {
+		compatible = "starfive,display-subsystem";
+
+		clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
+			<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+			<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+			<&voutcrg JH7110_VOUTCLK_DC8200_AHB>;
+		clock-names = "noc_bus", "dc_core", "axi_core", "ahb";
+		resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+			 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+			 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+		reset-names = "axi","ahb", "core";
+	};
+
+	dsi_encoder: dsi_encoder {
+		compatible = "starfive,dsi-encoder";
+		starfive,syscon = <&vout_syscon 0x8 0x08>;
+	};
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -1121,6 +1139,37 @@ ispcrg: clock-controller@19810000 {
 			power-domains = <&pwrc JH7110_PD_ISP>;
 		};
 
+		dc8200: lcd-controller@29400000 {
+			compatible = "starfive,jh7110-dc8200";
+			reg = <0x0 0x29400000 0x0 0x100>,
+			      <0x0 0x29400800 0x0 0x2000>;
+			interrupts = <95>;
+			clocks = <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
+				<&hdmitx0_pixelclk>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
+			clock-names = "channel0", "channel1",
+				      "hdmi_tx", "dc_parent";
+		};
+
+		hdmi: hdmi@29590000 {
+			compatible = "starfive,jh7110-inno-hdmi";
+			reg = <0x0 0x29590000 0x0 0x4000>;
+			interrupts = <99>;
+
+			clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>;
+			clock-names = "sysclk", "mclk", "bclk";
+			resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+			#sound-dai-cells = <0>;
+		};
+
+		vout_syscon: syscon@295b0000 {
+			compatible = "starfive,jh7110-vout-syscon", "syscon";
+			reg = <0 0x295b0000 0 0x90>;
+		};
+
 		voutcrg: clock-controller@295c0000 {
 			compatible = "starfive,jh7110-voutcrg";
 			reg = <0x0 0x295c0000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
