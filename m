Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834A3C43217
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 23:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xP1jafk8JVj1TKXqCAB12lI+3eaTlfLkp/s/HcviBQk=; b=fSBAFHk/iw0fJ4
	Knx18rbqpeXsaEgFRtDGMT3Ggk/1EgAOavtHPS01/4j0YgQJa3jI9ut1nLndC7IAduT9DNpW0LQHc
	3ev8+tgsBvfwbKOi/RKyZ1Og/XfcTA7R0eJNbRdbkwZsljd2aDx2Piz9iTf/ejORRkY6i/L4yh6bo
	i211tkj0onAAq81aDXZkoC220usQaSPt8kX+JPBo9OE9AW+rCeyueeyCXQXFJmGfp0cvm+vl4+L3c
	FaeOJKtIkOfKyFS2mOWyU2y2BwFSWW5zg8/4duDaGBWcZvNyNMrNOlG5pa9k4cpYenmgRCjH68iy+
	zHRxdVPXRSviG5uH7BGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiUa-002xoY-6w; Fri, 25 Nov 2022 23:52:24 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiPb-002uyU-9M; Fri, 25 Nov 2022 23:47:17 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AA7515C00EA;
	Fri, 25 Nov 2022 18:47:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 25 Nov 2022 18:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669420034; x=1669506434; bh=lp
	BC9qotmaGEHEPnCf47hznVhBx/bTmBO6U31NxnFo4=; b=UER4zFjKAWRy8gzLWy
	hn22WQxWfVoqNoT3RVS1fHDS/55nP7vhRFVCZhYjJFp5cFe+pwlVfsbCoCeWxAaP
	sfEnpoqf+4FfUsbzveslcG1kmb/f49qt8QYJ2N3DuAec5oEsQTo/DpVsWNc+csFg
	8HiQL9ewt5uO5lzwrZUODZvfk0VD2Z4Qydr3MWoB+ZXm4zBoXA0Np16ckqxrePdJ
	3NFPlGYSHLMCcxsfTN3+jeKo78r2cUqmrmIzlFXeL67dmFT5oaW8eOkN+rIaPvDV
	sTimiWI6zt0F7iUWu42IwFW+/WMjaIO7Zwyi6/n4nAbG2t2953ISCAcfUFbD8Y3q
	Tp8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669420034; x=1669506434; bh=lpBC9qotmaGEH
	EPnCf47hznVhBx/bTmBO6U31NxnFo4=; b=CdUuZ7blDObgcslUike83hVpIKNtW
	+bEOYgTOA4BCwPPDU27NrCjOo0zfJ53vI0Wl0tIsG/P7a8mmdtvIseOMn/tNzgrU
	ynN4Ov7gO4kXepZOdiOp7wkfnyzLrdDxapEHdG+skqZPoh0UMC6wZFbeJJZHwdfP
	rf6DouP7n45Ap91hdbdcBz/MHKwUSPrL+a3ftRdFfozQPawaOmCkMyXQoNphwfEl
	5PnSWT6QZzhOFDvHdetS2/eFaasb52V51GUKZmdZ/vbyFm72hy4+wusyQ9bPzuOe
	ltWOz+ob+EMK4J6F4Pb7FN/Q3U+zbVjG8+m3Isen4TKxwI3LXEaxVOoNA==
X-ME-Sender: <xms:AlSBY0HC7y_XYCVOnq2NXROZbOmgiwgHZKpZC8DmtS6XgZv47FpsAA>
    <xme:AlSBY9U3fov0i3YLhvG2ZEVkyE25OwNfaYz-0WoF7iumfDRWlouq509T0l7ezEtnJ
    l2V9yrXOIx_KbASTw>
X-ME-Received: <xmr:AlSBY-J7o_ARGE-yuLqnK8H7P9_OOmFQvVTgLPZjp0BULRI_qhze1f-HPugQ2vh3qcBlQ7MeqGS_Qt4hzdMMomHmx9RnBmbhA4jw3_YtN4h8K1EyxR2kA7fCAPK1r0ETGqxMXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:AlSBY2E3JMx_M-ORriVj-lvioe0bEnGoQsxE86qOb07WoUecC3ms3g>
    <xmx:AlSBY6V-3NzSAfuiaAoZcHiRUOmppfr6VCwdI0czk3ZwbgM16kvsiQ>
    <xmx:AlSBY5PGrHqbVAkVr6WK8fj8D9Kwa2TVOShBC5J10vJxSra9fIpQKg>
    <xmx:AlSBY0227O0lZCPZD1lairaKKAl-76xHAt6TJM2q53qW-VD8fytG9A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 18:47:13 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [PATCH v2 09/12] riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
Date: Fri, 25 Nov 2022 17:46:53 -0600
Message-Id: <20221125234656.47306-10-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_154715_435594_569E5D1F 
X-CRM114-Status: GOOD (  16.47  )
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

The 100ask Dongshan Nezha STU is a system-on-module that can be used
standalone or with a carrier board. The SoM provides gigabit Ethernet,
HDMI, a USB peripheral port, and WiFi/Bluetooth via an RTL8723DS chip.

The "DIY" carrier board exposes almost every pin from the D1 SoC to 0.1"
headers, but contains no digital circuitry, so it does not have its own
devicetree.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 arch/riscv/boot/dts/allwinner/Makefile        |   1 +
 .../sun20i-d1-dongshan-nezha-stu.dts          | 118 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index 2ed586fafaea..87f70b1af6b4 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-dongshan-nezha-stu.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
new file mode 100644
index 000000000000..c549a1c5fbf0
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/dts-v1/;
+
+#include "sun20i-d1.dtsi"
+#include "sun20i-common-regulators.dtsi"
+
+/ {
+	model = "Dongshan Nezha STU";
+	compatible = "100ask,dongshan-nezha-stu", "allwinner,sun20i-d1";
+
+	aliases {
+		ethernet0 = &emac;
+		mmc0 = &mmc0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 2 1 GPIO_ACTIVE_HIGH>; /* PC1 */
+		};
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
+&emac {
+	pinctrl-0 = <&rgmii_pe_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&reg_vcc_3v3>;
+	status = "okay";
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
+	broken-cd;
+	bus-width = <4>;
+	disable-wp;
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	pinctrl-0 = <&mmc0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pb8_pins>;
+	pinctrl-names = "default";
+	status = "okay";
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
+	status = "okay";
+};
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
