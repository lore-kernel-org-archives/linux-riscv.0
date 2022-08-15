Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C761FC25B0D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 05:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpCfoOCPRmWrXfphoc7SE/XIy7k8NkfUuqopQ9ptyN0=; b=NWQDA8sHXWHeuF
	AfJqpFjJyWgD5qWTyMT0LvZwyc6lh+2nFJP2g5H4ifk+u36nQn5wIN5hIETupJwMEUX+UuSB9swmd
	y75UIJNch7pt+q+73cGXQ/4suy28MHBEpJxdez2R74nlAsFbEi6cm1TU3Il+/Owjjt/O9RjmEuxfP
	t1cCmMEllTCC8wNBnpv+SFSeO3H+em793FfAB3GU97AWx0TAK3RQa9cihDFsEWKpGnsDtPBApRQRe
	VZbBYDvgQ6UvE60N8x5JVwNBi6H80zMP43neU1BH4pmrTB/3P8IOkErEUs3NmY7d379MgHOypFZ/S
	omXJcbpmzMtBuvVT3fOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSLn-00BQqw-29; Mon, 15 Aug 2022 05:09:19 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSLG-00BQQO-7T
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 05:08:49 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AAA5832004AE;
	Mon, 15 Aug 2022 01:08:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 01:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660540124; x=1660626524; bh=Xg
	67cpVoKilHiV6W9sCyOWTKHbC+N6ZsdgHn/O7Wskg=; b=D89ga/moFrPMej9AGC
	pD8F2k45vtUqUXuICHINrAJlkZAqAEZY+3/GRHCG0gGmlXRAFOXYDAfXhcUrg0Kw
	5ebxBEnDTi65focBN2C380jvod+5WPVqZ6ZEOkR6z3EhxEmo0fylqWM3cJY/3bkC
	aS5hPiP2YXcMLqJRSfluHkOgFZOlZvE5/qLzZ/PYj4cYllAIyuXeoyZAV8Xb+IO1
	hP13wDQwjMG0lKRxtE/CqVhYkRHoA2sPwpr4ezN+eKY3WtuLrOlQ2qNJMDaBvVMx
	MdOiMyBYBWi+86Mdt/5FYgqrA007Nwa6+qtZIWZfeqMgLNvlAAS3OFvmw3+l/hPZ
	1R/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660540124; x=1660626524; bh=Xg67cpVoKilHi
	V6W9sCyOWTKHbC+N6ZsdgHn/O7Wskg=; b=ifIQL5okeajhNQ+a3b5osSpXdoxJe
	PGb2qdjW3WSMVD98q607suhXOBSTI5yFcuqzWRG+Ie+GE2eUegt4TITjwhuZsWQF
	ARs5FcDAMboaZGAHk/0z0bgd1Cw/PzkdIr161hjTp7G3Zdqji7JCanIdJ2wtVbI+
	Zr+pZcY+EJeKqnnBuuJocEkh5ekwgC/aW+eOYuiH/Ks7Z0L2T5+whEOBkZNtgJ1E
	BKToj6y1slatpEQWCcfZ8KINCethySfaELTZKCPCRCu0l9EbFlZyZ2+ahAQ8eIFc
	/q0k4YFHq2F7Gfrp2MJFQRYN+g1+YSoq/c328wXOPuWbW4oU7visAY9Iw==
X-ME-Sender: <xms:3NT5Yp-bztfOLiNQ785lhtPmrDcpqzizxShBGhj4Y09SdeuC2dhbXg>
    <xme:3NT5Yts4UyNGT0XEPUWBwWfWMN7x11UA18XzzAtM_Wdvl8sWBKNdXgRumN5C8lwa7
    N1AiY0bzLCrIEk5UA>
X-ME-Received: <xmr:3NT5YnBPyBpBq3Qsvl7_r23YHmE6hjCU5ZGlhAxd0v_jZBfoVEcvtoBi1Z1hCF4JOmItJoNzrmWCuIGYwRV4-v2eXCyib__7YoH8g1I_3Ye1lbYlpnrExxXI3TmRX8pyQqHAbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:3NT5Ytfey_5LNiD51dPnMJ2b4PcrYmZ8QId53two-FXE-iUwBB84Aw>
    <xmx:3NT5YuPPesPnvzGVljQub_6c4GwxnAHoFatTdppk5Oo7t_4MOOaQfQ>
    <xmx:3NT5YvkRO5LoTgtNM6AduJGFyK18mrbsuQC07mwbBOfEQZ8I3SbYOw>
    <xmx:3NT5YvEgEXsx5ONQkzZYQtmut_PGDQSTSFaTD5WPRRydtxEHDjMqfw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 01:08:43 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 09/12] riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
Date: Mon, 15 Aug 2022 00:08:12 -0500
Message-Id: <20220815050815.22340-10-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815050815.22340-1-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_220846_873002_B4B275EB 
X-CRM114-Status: GOOD (  12.42  )
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

The MangoPi MQ Pro is a tiny SBC with a layout compatible to the
Raspberry Pi Zero. It includes the Allwinner D1 SoC, 512M or 1G of DDR3,
and an RTL8723DS-based WiFi/Bluetooth module.

The board also exposes GPIO Port E via a connector on the end of the
board, which can support either a camera or an RMII Ethernet PHY. The
additional regulators supply that connector.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 128 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index 300ada20c735..bcc304175753 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -3,4 +3,5 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-mangopi-mq-pro.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
new file mode 100644
index 000000000000..61a26d3db521
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "sun20i-d1.dtsi"
+#include "sun20i-d1-common-regulators.dtsi"
+
+/ {
+	model = "MangoPi MQ Pro";
+	compatible = "widora,mangopi-mq-pro", "allwinner,sun20i-d1";
+
+	aliases {
+		ethernet0 = &rtl8723ds;
+		mmc0 = &mmc0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_avdd2v8: avdd2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_vcc_3v3>;
+	};
+
+	reg_dvdd: dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&reg_vcc_3v3>;
+	};
+
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
+		reset-gpios = <&pio 6 17 GPIO_ACTIVE_LOW>; /* PG17 */
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpu>;
+};
+
+&ehci1 {
+	status = "okay";
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
+	rtl8723ds: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&pio>;
+		interrupts = <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pe-supply = <&reg_avdd2v8>;
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
+	bluetooth {
+		compatible = "realtek,rtl8723ds-bt";
+		device-wake-gpios = <&pio 6 18 GPIO_ACTIVE_HIGH>; /* PG18 */
+		enable-gpios = <&pio 6 15 GPIO_ACTIVE_HIGH>; /* PG15 */
+		host-wake-gpios = <&pio 6 14 GPIO_ACTIVE_HIGH>; /* PG14 */
+	};
+};
+
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_vcc>;
+	status = "okay";
+};
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
