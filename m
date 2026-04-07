Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D497AFF5108
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUoDP7bnwqpzR5fTk2bPhJeY1FgULx3d0pZ4QfBIOng=; b=lKvh9Q2FKWP3Pc
	moKock4cyppyjERLNdymJXUjso7fSNeopObYhNawgqa6E34eCmpTbBZKQZ1K2IaMcA1+FDThGIeh8
	guoEg5SBKtuUZ7fm/O9K7iOyDIU90Jy+Ah57CVu4pN8uzAoGpzLEMMcuGj4bKzd7eVPUOLVGaETsL
	gWITs1SOZNiYLtfM38ob+ICWneD4D/qCv8ji7WiCHo44BnQDrobeQNWYB211QlwYvH38wT2x8tJcO
	CLEEfDk8SQViKHDgw2Ws2xa0Ce0RO0lBCfPaJ/LHoPv3/xOHUjA33kfYU7oifnacyiSex3IjpEwpv
	eigSUshoN+RwTeU4caNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tp-00000006ihi-3pWf;
	Tue, 07 Apr 2026 15:36:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tn-00000006igg-30NK
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2368243DA2;
	Tue,  7 Apr 2026 15:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B5DC2BC9E;
	Tue,  7 Apr 2026 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576199;
	bh=l3oXAe19MZ8dNYu0U31pyka/RHNszN8rlZ9Y3ZWbQKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8kCxZXeN8iA2VY47GLw52rCbUR0b5FbAbxYksCmnN+0EMctd1EgYgKK7Q82IVptX
	 qBDrUNYctgKe7kH8b4jG7WtU122ZQp8V+uzf6fopNM7Xycz7XBBg6p2JFG8x/JkXxo
	 Zm1iM3fuzXBraN5tXAsr+CkUtr8VPNDV74xV4W0kNa3VSOynJjnq6PjqCzjZ7k2MT7
	 S3wo3IgackswBYsOvSbq0zMZA5pi08N8zJCWWGG+NlgGX+HKe4NcRTZ/IKM57fI7MG
	 h2IRMjhyYvC2CmIQKePG9SlahHxUNIz7Jy6uoIXcHMW3qpXxD4DQTVntQBASNSUvNm
	 tR32PCXsyz+SA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: dts: microchip: update pic64gx gpio interrupts to better match the SoC
Date: Tue,  7 Apr 2026 16:36:24 +0100
Message-ID: <20260407-herbicide-gauze-b362feb71bf9@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-rely-speculate-dae3a81ea1fc@spud>
References: <20260407-rely-speculate-dae3a81ea1fc@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6805; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+RGPY6TwDGriejLQ6Bru19AIvUVfVjnKfNwu8LNQUaE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXVSoe3/DPDl5R+XjFlAaHRW9Fz2y+dJzp+tU4x31Wu SY1lWqXOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRJ9GMDCe076t8Ml59wntS fF5826eDh9cE86+wUL/FGLDTVsq3v5Dhv/uztLpXyv/n12aeafxX/uavgfw3vt2/6m8fnbJBMlX BlwcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_083639_796035_695A5083 
X-CRM114-Status: GOOD (  14.40  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Just like PolarFire SoC, the same issues with GPIO interrupts exist in
the pic64gx, due to their similarity. Yoinking from the commit message
for the same change for PolarFire SoC:

There are 3 GPIO controllers on this SoC, of which:
- GPIO controller 0 has 14 GPIOs
- GPIO controller 1 has 24 GPIOs
- GPIO controller 2 has 32 GPIOs

All GPIOs are capable of generating interrupts, for a total of 70.
There are only 41 IRQs available however, so a configurable mux is used
to ensure all GPIOs can be used for interrupt generation.
38 of the 41 interrupts are in what the documentation calls "direct
mode", as they provide an exclusive connection from a GPIO to the PLIC.
The 3 remaining interrupts are used to mux the interrupts which do not
have a exclusive connection, one for each GPIO controller.

The mux was overlooked when the bindings and driver were originally
written for the GPIO controllers on Polarfire SoC, and the interrupts
property in the GPIO nodes used to try and convey what the mapping was.
Instead, the mux should be a device in its own right, and the GPIO
controllers should be connected to it, rather than to the PLIC.
Now that a binding exists for that mux, fix the inaccurate description
of the interrupt controller hierarchy.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/pic64gx-curiosity-kit.dts   | 47 ++++++++++++-------
 arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 32 +++++++++++--
 2 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index 2f2ccd77af30a..ed3ff03f3b11b 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -63,10 +63,6 @@ hss: hss-buffer@bfc00000 {
 };
 
 &gpio0 {
-	interrupts = <13>, <14>, <15>, <16>,
-		     <17>, <18>, <19>, <20>,
-		     <21>, <22>, <23>, <24>,
-		     <25>, <26>;
 	status ="okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "", "",
@@ -74,12 +70,6 @@ &gpio0 {
 };
 
 &gpio1 {
-	interrupts = <27>, <28>, <29>, <30>,
-		     <31>, <32>, <33>, <34>,
-		     <35>, <36>, <37>, <38>,
-		     <39>, <40>, <41>, <42>,
-		     <43>, <44>, <45>, <46>,
-		     <47>, <48>, <49>, <50>;
 	status ="okay";
 	gpio-line-names =
 		"", "", "LED1", "LED2", "LED3", "LED4", "LED5", "LED6",
@@ -88,14 +78,6 @@ &gpio1 {
 };
 
 &gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mdio1_gpio>, <&spi0_gpio>, <&can0_gpio>, <&pcie_gpio>,
 		    <&qspi_gpio>, <&uart3_gpio>, <&uart4_gpio>, <&can1_gpio>;
@@ -107,6 +89,35 @@ &gpio2 {
 		"DIP4", "USR_IO11", "", "", "SWITCH1", "", "", "";
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 &mac0 {
 	status = "okay";
 	phy-mode = "sgmii";
diff --git a/arch/riscv/boot/dts/microchip/pic64gx.dtsi b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
index e9ec376b1776b..5cf3e3de0e067 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx.dtsi
+++ b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
@@ -295,6 +295,14 @@ mss_top_sysreg: syscon@20002000 {
 			#size-cells = <1>;
 			#reset-cells = <1>;
 
+			irqmux: interrupt-controller@54 {
+				compatible = "microchip,pic64gx-irqmux", "microchip,mpfs-irqmux";
+				reg = <0x54 0x4>;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x7f>;
+			};
+
 			iomux0: pinctrl@200 {
 				compatible = "microchip,pic64gx-pinctrl-iomux0",
 					     "microchip,mpfs-pinctrl-iomux0";
@@ -484,9 +492,13 @@ mac1: ethernet@20112000 {
 		gpio0: gpio@20120000 {
 			compatible = "microchip,pic64gx-gpio", "microchip,mpfs-gpio";
 			reg = <0x0 0x20120000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <0>, <1>, <2>, <3>,
+				     <4>, <5>, <6>, <7>,
+				     <8>, <9>, <10>, <11>,
+				     <12>, <13>;
 			clocks = <&clkcfg CLK_GPIO0>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -497,9 +509,15 @@ gpio0: gpio@20120000 {
 		gpio1: gpio@20121000 {
 			compatible = "microchip,pic64gx-gpio", "microchip,mpfs-gpio";
 			reg = <0x0 0x20121000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <32>, <33>, <34>, <35>,
+				     <36>, <37>, <38>, <39>,
+				     <40>, <41>, <42>, <43>,
+				     <44>, <45>, <46>, <47>,
+				     <48>, <49>, <50>, <51>,
+				     <52>, <53>, <54>, <55>;
 			clocks = <&clkcfg CLK_GPIO1>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -510,9 +528,17 @@ gpio1: gpio@20121000 {
 		gpio2: gpio@20122000 {
 			compatible = "microchip,pic64gx-gpio", "microchip,mpfs-gpio";
 			reg = <0x0 0x20122000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <64>, <65>, <66>, <67>,
+				     <68>, <69>, <70>, <71>,
+				     <72>, <73>, <74>, <75>,
+				     <76>, <77>, <78>, <79>,
+				     <80>, <81>, <82>, <83>,
+				     <84>, <85>, <86>, <87>,
+				     <88>, <89>, <90>, <91>,
+				     <92>, <93>, <94>, <95>;
 			clocks = <&clkcfg CLK_GPIO2>;
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
