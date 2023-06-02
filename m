Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF93C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jqKtejpFWR+Oil1Kp2ZqS5EUS7o9X5P7p/8DvEtCzI=; b=WkflJXYUyXdGV6
	EtE0G0fRrEEix1wk9czoyRuLXq0JOP7jMMCIatkhZZiJ5yYJCXXYSpB5ertCRimrvDWqw+3XdiQOi
	WkLS2gNyhTPS170oo5PR3S1G2FjXSKw+w1/CkxbsE1x7GYdk3RRsr0D+Zff7KgH6fSLx2rhmGnklu
	qc+ozg6NZFGVyhi3SvkLPv472qnoRcXbTVQLKNrs4vsHHq8w/MuB0uhPshQ8jgDaduzExr/PlSUwM
	1B7E/5SUkswXLQtkxqD7NEvgIT7j7q4xGH/zi46aVJiR9uZmZQRfaTbae+i5UltQb6pUFwwp9xiIH
	KJY/6zmdSxd4m29In/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zPZ-0062JM-1r;
	Fri, 02 Jun 2023 07:41:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zPV-0062G0-2A
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 07:41:24 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0829E80FC;
	Fri,  2 Jun 2023 15:40:48 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki
	<jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, Keith Zhao
	<keith.zhao@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>
Subject: [PATCH 2/9] riscv: dts: starfive: jh7110: add dc&hdmi controller node
Date: Fri, 2 Jun 2023 15:40:36 +0800
Message-ID: <20230602074043.33872-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_004122_037565_0D6BCEA5 
X-CRM114-Status: UNSURE (   9.28  )
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
 .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 46 ++++++++++
 2 files changed, 133 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 1155b97b593d..8dc6c8a15c59 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -31,6 +31,21 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0x1 0x0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x20000000>;
+			alignment = <0x0 0x1000>;
+			alloc-ranges = <0x0 0x80000000 0x0 0x20000000>;
+			linux,cma-default;
+		};
+	};
+
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
@@ -214,6 +229,41 @@ GPOEN_DISABLE,
 			slew-rate = <0>;
 		};
 	};
+
+	hdmi_pins: hdmi-0 {
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
+
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
+	};
+
 };
 
 &uart0 {
@@ -221,3 +271,40 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&voutcrg {
+	status = "okay";
+};
+
+&display {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins>;
+
+	hdmi_in: port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		hdmi_input: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&dc_out_dpi0>;
+		};
+	};
+};
+
+&dc8200 {
+	status = "okay";
+
+	dc_out: port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		dc_out_dpi0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&hdmi_input>;
+		};
+
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 9acb5fb1716d..66be6e65a066 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -249,6 +249,11 @@ tdm_ext: tdm-ext-clock {
 		#clock-cells = <0>;
 	};
 
+	display: display-subsystem {
+		compatible = "verisilicon,display-subsystem";
+		ports = <&dc_out>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -570,5 +575,46 @@ voutcrg: clock-controller@295c0000 {
 			#reset-cells = <1>;
 			power-domains = <&pwrc JH7110_PD_VOUT>;
 		};
+
+		dc8200: dc8200@29400000 {
+			compatible = "verisilicon,dc8200";
+			reg = <0x0 0x29400000 0x0 0x100>,
+			      <0x0 0x29400800 0x0 0x2000>,
+			      <0x0 0x295B0000 0x0 0x90>;
+			interrupts = <95>;
+			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+				<&hdmitx0_pixelclk>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
+			clock-names = "clk_vout_noc_disp",
+				"clk_vout_pix0","clk_vout_pix1",
+				"clk_vout_axi","clk_vout_core",
+				"clk_vout_vout_ahb","hdmitx0_pixel",
+				"clk_vout_dc8200";
+			resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+			reset-names = "rst_vout_axi","rst_vout_ahb",
+						"rst_vout_core";
+		};
+
+		hdmi: hdmi@29590000 {
+			compatible = "starfive,hdmi";
+			reg = <0x0 0x29590000 0x0 0x4000>;
+			interrupts = <99>;
+
+			clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+				 <&hdmitx0_pixelclk>;
+			clock-names = "sysclk", "mclk","bclk","pclk";
+			resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+			reset-names = "hdmi_tx";
+			#sound-dai-cells = <0>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
