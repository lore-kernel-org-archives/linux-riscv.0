Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC44FC19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yg32HfakKcBTRAaa6AT7/STAduR+wAHBjZdhKykowfs=; b=ESPQH1CD1m+jWF
	f+/S8fqzVjJ48tcxjFe7LUgyJ7hPMOioH0bH+5U5J2EDqQYzOIJlmDbDs1ruzjkTPiYu06Tk5NNX7
	HL+cGcrQncJFqsOo9HzUBoMpT2WXSH9kQvqfLog3efhHuMbmh9mnZHBEgXkUK1Swh6tBtaugqSZz9
	iVQKpYINEkG1hRdBrrN1TQ2keXo2bi0kO+qkjSZ3CpSp4ElQ4opIJSY8ShUoCPAoitgKu4C1FMZo8
	QrnkFv0/ijZhw1UICk7p0gNTSUHYlKba7IUS1ORTYAS5x4Dj/ya121v7AR3PAgvyrHSsk9jnMF4cA
	FDvQXNiDQ9a2eitvnJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4eQN-0000000ExPl-2O9d;
	Wed, 08 May 2024 10:21:23 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4eQI-0000000ExN3-2qXG
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 10:21:21 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:985a:f2a2:ae2e:5981])
	by albert.telenet-ops.be with bizsmtp
	id LaMB2C00N241EGo06aMB1b; Wed, 08 May 2024 12:21:11 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4ePP-00EEy8-7I;
	Wed, 08 May 2024 12:21:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4eQB-00HAy7-De;
	Wed, 08 May 2024 12:21:11 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] riscv: dts: canaan: Disable I/O devices unless used
Date: Wed,  8 May 2024 12:20:58 +0200
Message-Id: <f85d460efd7ad85ec59c9253c989b10a07f2ff24.1715163174.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715163174.git.geert+renesas@glider.be>
References: <cover.1715163174.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_032118_918277_9EFE58F1 
X-CRM114-Status: GOOD (  12.44  )
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

It is considered good practice to disable on-SoC devices providing
external I/O in the SoC-specific .dtsi, and enable them explicitly in
the board-specific DTS files when actually wired-up and used.

Hence:
  - Set the status of I/O devices in k210.dtsi to "disabled",
  - Override the status of used I/O devices in board-specific DTS files
    to "okay",
  - Drop unneeded status overrides in board DTS-specific files for the
    always-enabled pin controller.

On e.g. MAiXBiT, this gets rid of an error message when probing the
unused slave-only spi2 controller:

    dw_spi_mmio 50240000.spi: error -22: problem registering spi host
    dw_spi_mmio 50240000.spi: probe with driver dw_spi_mmio failed with error -22

which is seen since commit 98d75b9ef282f6b9 ("spi: dw: Drop default
number of CS setting").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Commit 98d75b9ef282f6b9 is in spi/for-next (next-20240508 and later).

See also "[PATCH] spi: dw: Bail out early on unsupported target mode"
https://lore.kernel.org/r/7ae28d83bff7351f34782658ae1bb69cc731693e.1715163113.git.geert+renesas@glider.be

 arch/riscv/boot/dts/canaan/canaan_kd233.dts     |  3 ++-
 arch/riscv/boot/dts/canaan/k210.dtsi            | 16 ++++++++++++++++
 arch/riscv/boot/dts/canaan/k210_generic.dts     |  1 -
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  |  5 ++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts |  3 ++-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   |  5 ++++-
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts |  6 ++++--
 7 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 8cbef8daaec1097b..a7d753b6fdfd1366 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -50,7 +50,6 @@ key {
 &fpioa {
 	pinctrl-0 = <&jtag_pinctrl>;
 	pinctrl-names = "default";
-	status = "okay";
 
 	jtag_pinctrl: jtag-pinmux {
 		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
@@ -122,6 +121,7 @@ &i2s0 {
 	#sound-dai-cells = <1>;
 	pinctrl-0 = <&i2s0_pinctrl>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 &spi0 {
@@ -129,6 +129,7 @@ &spi0 {
 	pinctrl-names = "default";
 	num-cs = <1>;
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+	status = "okay";
 
 	panel@0 {
 		compatible = "canaan,kd233-tft", "ilitek,ili9341";
diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index febdff79c13cc5fc..4f5d40fa1e77c624 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -130,6 +130,7 @@ uarths0: serial@38000000 {
 			reg = <0x38000000 0x1000>;
 			interrupts = <33>;
 			clocks = <&sysclk K210_CLK_CPU>;
+			status = "disabled";
 		};
 
 		gpio0: gpio-controller@38001000 {
@@ -145,6 +146,7 @@ gpio0: gpio-controller@38001000 {
 				     <62>, <63>, <64>, <65>;
 			gpio-controller;
 			ngpios = <32>;
+			status = "disabled";
 		};
 
 		dmac0: dma-controller@50000000 {
@@ -180,6 +182,7 @@ gpio1: gpio@50200000 {
 					 <&sysclk K210_CLK_GPIO>;
 				clock-names = "bus", "db";
 				resets = <&sysrst K210_RST_GPIO>;
+				status = "disabled";
 
 				gpio1_0: gpio-port@0 {
 					#gpio-cells = <2>;
@@ -207,6 +210,7 @@ uart1: serial@50210000 {
 				dsr-override;
 				cts-override;
 				ri-override;
+				status = "disabled";
 			};
 
 			uart2: serial@50220000 {
@@ -223,6 +227,7 @@ uart2: serial@50220000 {
 				dsr-override;
 				cts-override;
 				ri-override;
+				status = "disabled";
 			};
 
 			uart3: serial@50230000 {
@@ -239,6 +244,7 @@ uart3: serial@50230000 {
 				dsr-override;
 				cts-override;
 				ri-override;
+				status = "disabled";
 			};
 
 			spi2: spi@50240000 {
@@ -252,6 +258,7 @@ spi2: spi@50240000 {
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI2>;
+				status = "disabled";
 			};
 
 			i2s0: i2s@50250000 {
@@ -261,6 +268,7 @@ i2s0: i2s@50250000 {
 				clocks = <&sysclk K210_CLK_I2S0>;
 				clock-names = "i2sclk";
 				resets = <&sysrst K210_RST_I2S0>;
+				status = "disabled";
 			};
 
 			i2s1: i2s@50260000 {
@@ -270,6 +278,7 @@ i2s1: i2s@50260000 {
 				clocks = <&sysclk K210_CLK_I2S1>;
 				clock-names = "i2sclk";
 				resets = <&sysrst K210_RST_I2S1>;
+				status = "disabled";
 			};
 
 			i2s2: i2s@50270000 {
@@ -279,6 +288,7 @@ i2s2: i2s@50270000 {
 				clocks = <&sysclk K210_CLK_I2S2>;
 				clock-names = "i2sclk";
 				resets = <&sysrst K210_RST_I2S2>;
+				status = "disabled";
 			};
 
 			i2c0: i2c@50280000 {
@@ -289,6 +299,7 @@ i2c0: i2c@50280000 {
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "ref", "pclk";
 				resets = <&sysrst K210_RST_I2C0>;
+				status = "disabled";
 			};
 
 			i2c1: i2c@50290000 {
@@ -299,6 +310,7 @@ i2c1: i2c@50290000 {
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "ref", "pclk";
 				resets = <&sysrst K210_RST_I2C1>;
+				status = "disabled";
 			};
 
 			i2c2: i2c@502a0000 {
@@ -309,6 +321,7 @@ i2c2: i2c@502a0000 {
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "ref", "pclk";
 				resets = <&sysrst K210_RST_I2C2>;
+				status = "disabled";
 			};
 
 			fpioa: pinmux@502b0000 {
@@ -457,6 +470,7 @@ spi0: spi@52000000 {
 				reset-names = "spi";
 				num-cs = <4>;
 				reg-io-width = <4>;
+				status = "disabled";
 			};
 
 			spi1: spi@53000000 {
@@ -472,6 +486,7 @@ spi1: spi@53000000 {
 				reset-names = "spi";
 				num-cs = <4>;
 				reg-io-width = <4>;
+				status = "disabled";
 			};
 
 			spi3: spi@54000000 {
@@ -488,6 +503,7 @@ spi3: spi@54000000 {
 
 				num-cs = <4>;
 				reg-io-width = <4>;
+				status = "disabled";
 			};
 		};
 	};
diff --git a/arch/riscv/boot/dts/canaan/k210_generic.dts b/arch/riscv/boot/dts/canaan/k210_generic.dts
index 36b4ba9cc556bc3f..5734cc03753b1a06 100644
--- a/arch/riscv/boot/dts/canaan/k210_generic.dts
+++ b/arch/riscv/boot/dts/canaan/k210_generic.dts
@@ -28,7 +28,6 @@ chosen {
 &fpioa {
 	pinctrl-0 = <&jtag_pins>;
 	pinctrl-names = "default";
-	status = "okay";
 
 	jtag_pins: jtag-pinmux {
 		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
index e5a77672fc65bc47..2ab376d609d2592d 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -62,7 +62,6 @@ key-boot {
 &fpioa {
 	pinctrl-names = "default";
 	pinctrl-0 = <&jtag_pinctrl>;
-	status = "okay";
 
 	jtag_pinctrl: jtag-pinmux {
 		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
@@ -160,6 +159,7 @@ &i2s0 {
 	#sound-dai-cells = <1>;
 	pinctrl-0 = <&i2s0_pinctrl>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 &i2c1 {
@@ -174,6 +174,7 @@ &spi0 {
 	pinctrl-names = "default";
 	num-cs = <1>;
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+	status = "okay";
 
 	panel@0 {
 		compatible = "sitronix,st7789v";
@@ -203,6 +204,8 @@ mmc@0 {
 };
 
 &spi3 {
+	status = "okay";
+
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
index 04c2bf227b1c69ad..d98e20775c073639 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
@@ -67,7 +67,6 @@ key-boot {
 &fpioa {
 	pinctrl-0 = <&jtag_pinctrl>;
 	pinctrl-names = "default";
-	status = "okay";
 
 	jtag_pinctrl: jtag-pinmux {
 		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
@@ -163,6 +162,7 @@ &i2s0 {
 	#sound-dai-cells = <1>;
 	pinctrl-0 = <&i2s0_pinctrl>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 &i2c1 {
@@ -177,6 +177,7 @@ &spi0 {
 	pinctrl-names = "default";
 	num-cs = <1>;
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+	status = "okay";
 
 	panel@0 {
 		compatible = "sitronix,st7789v";
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
index f9f6cc136bc3d98a..79ecd549700a006e 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
@@ -73,7 +73,6 @@ key-down {
 &fpioa {
 	pinctrl-0 = <&jtag_pinctrl>;
 	pinctrl-names = "default";
-	status = "okay";
 
 	jtag_pinctrl: jtag-pinmux {
 		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
@@ -171,6 +170,7 @@ &i2s0 {
 	#sound-dai-cells = <1>;
 	pinctrl-0 = <&i2s0_pinctrl>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 &i2c1 {
@@ -185,6 +185,7 @@ &spi0 {
 	pinctrl-names = "default";
 	num-cs = <1>;
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+	status = "okay";
 
 	panel@0 {
 		compatible = "sitronix,st7789v";
@@ -213,6 +214,8 @@ mmc@0 {
 };
 
 &spi3 {
+	status = "okay";
+
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
index e90188bfb70bd8a4..019c03ae51f6c485 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
@@ -43,8 +43,6 @@ vcc_3v3: regulator-3v3 {
 };
 
 &fpioa {
-	status = "okay";
-
 	uarths_pinctrl: uarths-pinmux {
 		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>, /* Header "0" */
 			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>; /* Header "1" */
@@ -136,6 +134,7 @@ &i2s0 {
 	#sound-dai-cells = <1>;
 	pinctrl-0 = <&i2s0_pinctrl>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 &i2c1 {
@@ -150,6 +149,7 @@ &spi0 {
 	pinctrl-names = "default";
 	num-cs = <1>;
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+	status = "okay";
 
 	panel@0 {
 		compatible = "sitronix,st7789v";
@@ -178,6 +178,8 @@ mmc@0 {
 };
 
 &spi3 {
+	status = "okay";
+
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
