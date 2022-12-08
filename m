Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D38C63705
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9hvJxgb4A4HOIH2ZHygdA9/irNztXz+Z9+hb7n/iRg=; b=NtILXORrwCnbXa
	aSHg/lU4MRlSUUFwKAgbiqglwLdtnbtPimjc0S7ThD34zIN7NF8aZr+1xqT78GNITCFibp7kzEDoP
	kKxPmt5i+4P5R1Z2pPgMfculhUhoXRhGRS3nZjY/nYTbpcPpYLlgwjnVuEfpynllqxLHBDTgjSmlC
	dvH2jd2rge13fo5TSi3wJtHeZXIpJvxiJbTfN7wunFdVjvzE8+Zy0sr8V6JtHgi1//MZ4MoT/J2wT
	1DIcVm9S1UNgCZdFWq7hf5PG2xijgH2oh3hYGiDHTMoKxGioiJs48k/wx5AEqI5//sQF7YX9yoESH
	R3dg6ojKFBmsFgUessuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cwr-00AgS7-0Q; Thu, 08 Dec 2022 09:12:09 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Co3-00AXmX-VX; Thu, 08 Dec 2022 09:03:06 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 8E5C332001AB;
	Thu,  8 Dec 2022 04:03:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 08 Dec 2022 04:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670490181; x=1670576581; bh=Jk
	qLYcsdYiqj68+IjQ7UwjKRZ/2pXr15vVcgPUmJ5zQ=; b=IKH8lMC/zrRwpqMyQD
	u/wSAdyW1CNLrBTo5PNASzeiS8iCvMu7fu6o63hVOOtYqcXvY4Cxm00dTDBjHalE
	FBTF1J1c00oDK3yDp6D9kA4iMSn2ELzziTqbWCIFudzpv+kWW+TWjMFBjJOY7Je/
	xaps2xHnEHZXnhovx6nK/Tc+cP0YzbeaxjN5HT3u0nhxHM5r5/LNKos1z4vbYbq0
	N19l6wXLnjW0hJW36qfFpsKuokfgZ/v2XsqcACWFoqYBDGJ498y3Nc3a3spqQTtG
	pLcwMXJbeVtlcVIL0+J5+KtnBeOyAyHeSeW59vRsJammK6Or+3tB/XEsspIqpkB7
	hbpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670490181; x=1670576581; bh=JkqLYcsdYiqj6
	8+IjQ7UwjKRZ/2pXr15vVcgPUmJ5zQ=; b=Cp6V6eDVV+U9XthrMGiCeasZxpI8T
	raEqJZYFSgVTy1QH4EYXXhNKqi4dXYgjmCYSmNaPS2P+fAmhTcYipsJo4pbYExG0
	L0u3k1CgcrC/wkGQp7TOgJRd3WgXw+Kc5oF50FdSGpAAHR6Y70yYb+tcr4/coiH3
	FimF4/4gGuY/dCe4b4JNNor5JBiCue5G5AmdxmRfYpKKkDe4/BFpF0Y25YcrS62Y
	SsDuNlXZYkb9MTkF4C3EprRqEgeSWseuJqReDhrhTg8Xu/5L5W5YOj5RcGgDOviL
	/cRPKlTDNhGyjQYE991Mil2Y3uX9x55AeXAE0WYaqb5ohDl8OCaE/S6HA==
X-ME-Sender: <xms:RKiRYw-SJkaaU1zScNw5ye8MvK6kxhEoGQhQ_hUnbUzd4ZyDRDbLeQ>
    <xme:RKiRY4vGb3XLXJioCqQAeu_-tKafHX7fqpy-3Qwa3w_dkgkUoFi3wu94m6M-C-4O4
    nx6-uoR3ejbs4xDog>
X-ME-Received: <xmr:RKiRY2DDfPbaGWdjPRu-Hz3mUsvcaTQpV8chh5GrwdawZy-Ze0Zkw5xN8zCQq4nDsmauODuUKOhqBswdq6RWjCDkteKiLKEYXIr5ZBTa4lXYsUrKousAWLKvYjNP71FBJbrCNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefgudefiedt
    veetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:RKiRYwfcCqwR5AalbGYJ1V96dXmjhwZx5BxEMspSPKSE8FN0xZARaw>
    <xmx:RKiRY1O9BSclWq-gc7MFSTcKrFtw7YI3n4-uRze9N5Z64J8YHhN1bQ>
    <xmx:RKiRY6nK9MiKkHQRtZ-GEoxYoJM0LSNoJRk6Wk-BtVvCKysHWh5VkQ>
    <xmx:RaiRYydDJww1FeNNOgWsRDqOWYxQpVySZJBThd3N3TIk0u19FeIuaw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:03:00 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 06/12] riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
Date: Thu,  8 Dec 2022 03:02:31 -0600
Message-Id: <20221208090237.20572-7-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221208090237.20572-1-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010304_188395_C13A82A7 
X-CRM114-Status: GOOD (  13.99  )
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
