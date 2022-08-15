Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA29FC25B0D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 05:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBQ6EAVxmtiUofKVwFiU2VzErYimoT0nMJEp/sXfdZc=; b=2te2Pqjo7Oz7a9
	qzHgaj5uQ4DXbW9Mzc3XrvMc80U55Gw4Owg1N+wqR1E9FhLPeTYNWJGQcOacDhfJZhLB4JyKudub1
	xfYYRr1xAMdzeWZItbKGvxoeLh54TVUcznHvGwX65e1cIezn9ZJ3IpQHTDjKdII2fnYK571cqdmPz
	ZxptfS4p0hV5p0TdzkH+BBUiNiVywXdwV2EjFztrQsx0pixTDhuifyoHZ0rrnlVS6qN1Q8pSzOHVn
	6ccnhsa5Gfq3iyn1pZuBry6w1gFNkyp9SjtrC9/8p6b2dwVFLP/i5jwM/bIIdrMRhyt0ayCGZ3Who
	2V3AqjkGkf+/vDEhEUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSLi-00BQmp-Qp; Mon, 15 Aug 2022 05:09:14 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSLD-00BQOD-V5
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 05:08:47 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C90603200413;
	Mon, 15 Aug 2022 01:08:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 01:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660540121; x=1660626521; bh=Mv
	vyE2vG9aMQhdu4BRB6vrHkBRfYoGnMthmm+obyi2s=; b=cm3OhMUAe5aKs+rqQa
	XS3bZmvkzREysUiEPm+qet29bNFyP49oUhMjLq7d1R+4kqpzgvqD+dOY3TAKTjz3
	a/z6EHGt0F4Tnb+qJscwNbmnf+qbMK2uDwPctTs18OyUIo/6M7RpNco9NLHATdQC
	Dt5Qm/yweoJnxw7IHPLo+vHQl1FYBWa0oyK2IXOuOZiJwqSQgYXt4aBwpRYQ2Xlc
	3B6X9m0iM30tNTYIt0rLjjsys+SVT2mZmo6iBR1Y2eVLC1ApdA0SBQC7I+BykXf1
	27Wn0BxVJmsqRzla7Vh4WQE72sm4YW2rJ0/Njr8G1kO5XM+n7is2ZzUSAtebbtDQ
	gKCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660540121; x=1660626521; bh=MvvyE2vG9aMQh
	du4BRB6vrHkBRfYoGnMthmm+obyi2s=; b=PHqnG/R8DMfSdjpuxwpxv2lL8WDmL
	pParMtHiHoazDhqba3Jazb5KXUCRnW6ubQ6BENe5l5eMnzYbSelXAChmBxOGOFkZ
	ath/pPcIjhU1wwABp0D0qmrxUgsoopBpN6Fa5JRDVeRpjHcJgntw74B8ZtjBiH4h
	ScwRQ+9Lqtf70QLGN+bB28bNXyeJtTrPNyWeq7dqmNlzZBZfR6vV4XqEIDzOsyPp
	Wbo4OHR/bJo2Yiv9acsSED64S0KIHci+PZViieaRBtOfciqOsj2md2MWzknpkOt1
	vMjV0XYxGD/twvBgRSJRNmabW0LfemMsFUNwuoKicyAaYCsGlco78Q0vA==
X-ME-Sender: <xms:2dT5YgmmACW5-GlDTKpg5FDEmghIj_LVYsdIqR7OG-055tk4Lyyzpg>
    <xme:2dT5Yv3jtHwrcxLwcYy7GlvAPBnxPczmcw99qoUjKNfsnh9pjI7fbe617icxYJl2D
    b0BefMxJZSd9b4ZRw>
X-ME-Received: <xmr:2dT5Yuq4diixDYvvodsskGYxK82_rGUAWLukq3MiIJo0TKnLbR6JplYvx9Xireq1oGqF5SuISPi_T_mfC-oOq9KUitjtbDrSV5QgFSlprWcRn4Aceyx0zuAjWfDvzJ4TbPBWEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:2dT5YsljSo3WDN4dvjmujrGRRB9z8_2TpZYUQSAqIcr_-qUDcGQcoQ>
    <xmx:2dT5Yu3W4oWsoqv93_fq6EIQrJonW1BZfPMHUziJ7z3KB0WY7gbGlQ>
    <xmx:2dT5YjsNEfiKS7qFeWTy7jhUong7wLa_sHjgdEvnRi_j97KNO2oYhQ>
    <xmx:2dT5YrvkwHs_ZJmSv-qpqC_xBSfLK5QGaL11zWi5-ablv6YE8JPoaA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 01:08:40 -0400 (EDT)
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
	Samuel Holland <samuel@sholland.org>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 08/12] riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
Date: Mon, 15 Aug 2022 00:08:11 -0500
Message-Id: <20220815050815.22340-9-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815050815.22340-1-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_220845_255554_4D49F4B1 
X-CRM114-Status: GOOD (  15.05  )
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

Sipeed manufactures a "Lichee RV" system-on-module, which provides a
minimal working system on its own, as well as a few carrier boards. The
"Dock" board provides audio, USB, and WiFi. The "86 Panel" additionally
provides 100M Ethernet and a built-in display panel.

The 86 Panel repurposes the USB ID and VBUS detection GPIOs for its RGB
panel interface, since the USB OTG port is inaccessible inside the case.

Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/boot/dts/allwinner/Makefile        |  4 +
 .../sun20i-d1-lichee-rv-86-panel-480p.dts     | 29 ++++++
 .../sun20i-d1-lichee-rv-86-panel-720p.dts     | 10 ++
 .../sun20i-d1-lichee-rv-86-panel.dtsi         | 92 +++++++++++++++++++
 .../allwinner/sun20i-d1-lichee-rv-dock.dts    | 74 +++++++++++++++
 .../dts/allwinner/sun20i-d1-lichee-rv.dts     | 84 +++++++++++++++++
 6 files changed, 293 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index b0a15e8c8d82..300ada20c735 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -1,2 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
new file mode 100644
index 000000000000..4df8ffb71561
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+#include "sun20i-d1-lichee-rv-86-panel.dtsi"
+
+/ {
+	model = "Sipeed Lichee RV 86 Panel (480p)";
+	compatible = "sipeed,lichee-rv-86-panel-480p", "sipeed,lichee-rv",
+		     "allwinner,sun20i-d1";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pb0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "focaltech,ft6236";
+		reg = <0x48>;
+		interrupt-parent = <&pio>;
+		interrupts = <6 14 IRQ_TYPE_LEVEL_LOW>; /* PG14 */
+		iovcc-supply = <&reg_vcc_3v3>;
+		reset-gpios = <&pio 6 15 GPIO_ACTIVE_LOW>; /* PG15 */
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <480>;
+		vcc-supply = <&reg_vcc_3v3>;
+		wakeup-source;
+	};
+};
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
new file mode 100644
index 000000000000..1874fc05359f
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+#include "sun20i-d1-lichee-rv-86-panel.dtsi"
+
+/ {
+	model = "Sipeed Lichee RV 86 Panel (720p)";
+	compatible = "sipeed,lichee-rv-86-panel-720p", "sipeed,lichee-rv",
+		     "allwinner,sun20i-d1";
+};
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
new file mode 100644
index 000000000000..d89ed8047e80
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+#include "sun20i-d1-lichee-rv.dts"
+
+/ {
+	aliases {
+		ethernet0 = &emac;
+		ethernet1 = &xr829;
+	};
+
+	/* PC1 is repurposed as BT_WAKE_AP */
+	/delete-node/ leds;
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&ccu CLK_FANOUT1>;
+		clock-names = "ext_clock";
+		reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
+		assigned-clocks = <&ccu CLK_FANOUT1>;
+		assigned-clock-rates = <32768>;
+		pinctrl-0 = <&clk_pg11_pin>;
+		pinctrl-names = "default";
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&emac {
+	pinctrl-0 = <&rmii_pe_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&ext_rmii_phy>;
+	phy-mode = "rmii";
+	phy-supply = <&reg_vcc_3v3>;
+	status = "okay";
+};
+
+&mdio {
+	ext_rmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+	};
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
+	};
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&pio {
+	clk_pg11_pin: clk-pg11-pin {
+		pins = "PG11";
+		function = "clk";
+	};
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
+	status = "disabled";
+};
+
+&usbphy {
+	/* PD20 and PD21 are repurposed for the LCD panel */
+	/delete-property/ usb0_id_det-gpios;
+	/delete-property/ usb0_vbus_det-gpios;
+	usb1_vbus-supply = <&reg_vcc>;
+};
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
new file mode 100644
index 000000000000..ca36a5d75a7f
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+#include <dt-bindings/input/input.h>
+
+#include "sun20i-d1-lichee-rv.dts"
+
+/ {
+	model = "Sipeed Lichee RV Dock";
+	compatible = "sipeed,lichee-rv-dock", "sipeed,lichee-rv",
+		     "allwinner,sun20i-d1";
+
+	aliases {
+		ethernet1 = &rtl8723ds;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&lradc {
+	status = "okay";
+
+	button-220 {
+		label = "OK";
+		linux,code = <KEY_OK>;
+		channel = <0>;
+		voltage = <220000>;
+	};
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
+	};
+};
+
+&ohci1 {
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
+		device-wake-gpios = <&pio 6 15 GPIO_ACTIVE_HIGH>; /* PG16 */
+		enable-gpios = <&pio 6 18 GPIO_ACTIVE_HIGH>; /* PG18 */
+		host-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>; /* PG17 */
+	};
+};
+
+&usbphy {
+	usb1_vbus-supply = <&reg_vcc>;
+};
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
new file mode 100644
index 000000000000..df653111b46c
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+#include "sun20i-d1.dtsi"
+#include "sun20i-d1-common-regulators.dtsi"
+
+/ {
+	model = "Sipeed Lichee RV";
+	compatible = "sipeed,lichee-rv", "allwinner,sun20i-d1";
+
+	aliases {
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
+	reg_vdd_cpu: vdd-cpu {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-cpu";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&reg_vcc>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpu>;
+};
+
+&ehci0 {
+	status = "okay";
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
+	usb0_vbus-supply = <&reg_vcc>;
+	status = "okay";
+};
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
