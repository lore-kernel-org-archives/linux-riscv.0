Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0FC61D97
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 05:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aomy3BvB4C3RYLPbOGg8428Q4oiUcQeRrCmQVV3lwDc=; b=qBiYdXUKRnf5u0
	2cQLrnLcnBFWTqAs50HOPp08/pUJ+gZ9+7NacxAJ+3o0UtLaqlqFEPit32ORnEg7o+iTUwM7wmTDU
	8lRd1JB+77Qo5izIIs3EYTv4udv/z0co5biecBVJqeZVjkSoqFLQQvcBFl9W3IK6F9TATO/FyeHo4
	O5D2sewXzUmthu2q/cuguyYbZTACQ1IEvJEn9cfbYBr7d/r0Ajd+NppbgJ/oOZcryEHwyNQI+gp2S
	L344nD0g7RRhtNw331BrzEks8Jrqx3Ufzv5BhsMJCwrDo2Yr/hsvcEjfrjbXT/I2otQTU//I5Fmbi
	LMW5rVfXR9UvZS9ldLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuMs-009cUa-15; Thu, 26 Jan 2023 05:00:10 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuKY-009bSU-Gh; Thu, 26 Jan 2023 04:57:48 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E62985C01A4;
	Wed, 25 Jan 2023 23:57:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 25 Jan 2023 23:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1674709065; x=1674795465; bh=J6
	rVARyJw3muIrcP2dT3zZNyK79SVGldDrAhgT6GSYM=; b=r2/HdDmHCZtKxU2dmj
	Mp+vqy5ceeqCU1QnnUTxeM2wB+hptfnF8jXsYhcfRsbAbJVCur8fj0EHN6fXJmqH
	KEZcMnJUJMWZdE/i7yDqph4XCM47ZArQ0R4Z9HLrB/F7K/wpOheWgjZreTYhsVoI
	pgK6gQQ4ZPHLEQ5VDiMWqWREh2Dd81nN65NUSTsRt+tYmHdb/uNw9x+8cr37FG8z
	9ZEqd0Zp9Uf4h1J4WdXV7ViewL0tvzPNpstyrhIHOwHd2DsQ8usqVlrfJWUwa84d
	bUPt7L4/W1CuGYgzpSAZNvSkjL7sPjARPJeipes8e9Y9JqcsOcf35eRSjIfDG3MZ
	nDPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674709065; x=1674795465; bh=J6rVARyJw3muI
	rcP2dT3zZNyK79SVGldDrAhgT6GSYM=; b=LGJA0otnqEfdPOz0rvUH1h2aTxDuM
	wtoduHsGCcfF8d5Vi8YwQjm2wA5wm/gNbJvJ7/7hESs7vnFK7XuE8Ol3HDVFBBs1
	gXe51WntLIDvfAHeOW+WWvKPldqYZIDZ4sASCPQoqNqlAGgBtaWiumn/1joBGaQb
	ie/+PT2zfBgdBwWkI/FQ5fWbFsa08WhmVpUW1453cbyKIZzBcEdLoaBzy/cLpbzF
	rZ+hdV4lZx1vOjbgRFhM4JRIXf5RZ/g2L15StNsfLQCzTQHyWodgZAgyryjEtlsp
	vixxunf/NqPs3gQeO1S6VsYI+EKs0s2iND1YmmC/qZKAoo2cCWPXs69Gg==
X-ME-Sender: <xms:SQjSY965hSq4AjAWvLfBH6j8hFZkpUqxovMab57WmKSuefHMM7-TbA>
    <xme:SQjSY66zi2RjeCoEqd_IzMyM4Bk-zODkxA_-dDRqinWw-zEX2CtCytu3AMwSbDSh5
    cqveVDpd0BfkwhqpA>
X-ME-Received: <xmr:SQjSY0ctstI6l4FLa5rSwPGn7LcaQMmHO2eec9ZExF1rNVBOOrVFRhjVFsMgmFk9xhDQcUZhfInyh5Srzo6ucu1q6NBX6Luj11VsNtgRz0fv0Fp5gDvDwTajKcJxcPYra9TnMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:SQjSY2J94l5GHUGcFS1WLAdiXPe2TcQsV3XT7OpdpUoecWBAnCthmQ>
    <xmx:SQjSYxIzsbFQAUD1EvF4oYstIqpvkOICigPSrU83Tb440gqSs97FxA>
    <xmx:SQjSY_yG0w0aIs5tJLoz5hWtlHGOWpZMPFiW0qKGZnNUnLTmKvIQBw>
    <xmx:SQjSY67ipkTaNP5iG-xWClwGOzHOFq-IdxzqOhmU3QoXvfEHB0dH-w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 23:57:44 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 06/11] riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
Date: Wed, 25 Jan 2023 22:57:33 -0600
Message-Id: <20230126045738.47903-7-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230126045738.47903-1-samuel@sholland.org>
References: <20230126045738.47903-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_205746_651000_A9206180 
X-CRM114-Status: GOOD (  15.71  )
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

"D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
plus low-speed I/O from the SoC and a GPIO expander chip.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v3)

Changes in v3:
 - Drop mmc alias

Changes in v2:
 - Common regulators moved to MangoPi MQ patch, removed analog LDOs
 - Removed LRADC (depends on analog LDOs)
 - Added XR829 host-wake interrupt

 arch/riscv/boot/dts/allwinner/Makefile        |   1 +
 .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 166 ++++++++++++++++++
 2 files changed, 167 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index 2f2792594f7d..277e59d1c907 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1s-mangopi-mq.dtb
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
new file mode 100644
index 000000000000..a0769185be97
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/dts-v1/;
+
+#include "sun20i-d1.dtsi"
+#include "sun20i-common-regulators.dtsi"
+
+/ {
+	model = "Allwinner D1 Nezha";
+	compatible = "allwinner,d1-nezha", "allwinner,sun20i-d1";
+
+	aliases {
+		ethernet0 = &emac;
+		ethernet1 = &xr829;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_usbvbus: usbvbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usbvbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
+		enable-active-high;
+		vin-supply = <&reg_vcc>;
+	};
+
+	/*
+	 * This regulator is PWM-controlled, but the PWM controller is not
+	 * yet supported, so fix the regulator to its default voltage.
+	 */
+	reg_vdd_cpu: vdd-cpu {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-cpu";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&reg_vcc>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpu>;
+};
+
+&dcxo {
+	clock-frequency = <24000000>;
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&emac {
+	pinctrl-0 = <&rgmii_pe_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&reg_vcc_3v3>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pb0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcf8574a: gpio@38 {
+		compatible = "nxp,pcf8574a";
+		reg = <0x38>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 2 IRQ_TYPE_LEVEL_LOW>; /* PB2 */
+		interrupt-controller;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+	};
+};
+
+&mdio {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+	disable-wp;
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	pinctrl-0 = <&mmc0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mmc1 {
+	bus-width = <4>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	non-removable;
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	pinctrl-0 = <&mmc1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	xr829: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&pio>;
+		interrupts = <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pb8_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart1 {
+	uart-has-rtscts;
+	pinctrl-0 = <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* XR829 bluetooth is connected here */
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
+	usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
+	usb0_vbus-supply = <&reg_usbvbus>;
+	usb1_vbus-supply = <&reg_vcc>;
+	status = "okay";
+};
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
