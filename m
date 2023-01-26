Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B620C54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 05:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZ9DVGi2gGZUdqN1amN6QoOg2OLW/5cQy+kY87MY3vA=; b=IWerxAS9IeKlOa
	hSNeHHSaBgu4ltu1g+4G5em4+ZoSAPwKqaMSVgB6JskZzzzbO/hOLG0aY7k6AXZ0ehYoRUln9Yg/p
	eY7nsH23qiDocv4/9H44pbrfSPDWhg73uRMSrxcBgPB5edSdtKSl/IPqknnfBmFkS1x10Ghjp52kI
	DEdFfB7w/9iIu2g/XHXiZRlDEJ7OhIli20xa038R0SC+evRK3Ftm99A9gSn1gOYWX2UMU091yblym
	kg8E/bESAgo2BJOFUCk2vytukrwHM7nGeaeqL4B/GHsNX+HPLnOpLtGYvklo8SEjvGoraNJZ2QraQ
	P9kGbRzc4doB1wlSaLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuNe-009cs5-UR; Thu, 26 Jan 2023 05:00:58 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuKZ-009bSq-N0; Thu, 26 Jan 2023 04:57:49 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 1F71C5C0192;
	Wed, 25 Jan 2023 23:57:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 25 Jan 2023 23:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1674709067; x=1674795467; bh=1Z
	jJecFFZxIyPoT1olpe+Bav553LacFF2fCvtv/7+vE=; b=OSIwIpFXEnGr/E+9vl
	l6HjHuaQLBacINUcooovCmzRXhJzWVYBO3n4ALd+yE18iH1b6SIgTsbf/z1sKtO8
	x1OGSeDLeNeLTJ0/ehr30d0Q2pPb2Dx69gpiKF5qsFQmUW6ULJ8kcHdLIrNwwTAK
	vSUOyoRQEkxS1oq9jsomyuo9dXHz1uK1SntIyWaYyLsGd04E9N6EvC8xEmlptIIB
	CtwcDlhzpfbnWErpoKPaDx+lQeRYD0U7RrY+TkFs81m/OCjNtf/eoHCjUjEkVbdB
	GUaVD0BzJww7sK9Ob7G67PqTIvWfcUjUOHqiNyg2BemOS1o7vRGEy58U1SKnXNH3
	89iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674709067; x=1674795467; bh=1ZjJecFFZxIyP
	oT1olpe+Bav553LacFF2fCvtv/7+vE=; b=XVafzO2P/ivcrYVhgQdgyAZK4qX3W
	IOPEo+OM4bwkUptcHPhVj+nLpc4+4ZxiDEjrz/Z2wEBh4vfNqyl2nzQvChPF9o4R
	lVetpRdJ9Kg98OvkUZzmktH64UI/ckXpuL5uOStBMf9zcQ0MSc9+z8ZydRdnA12Z
	+z8BmNQHs9q/+596UzFDyE4lix5Fd88uH/pWrgl8pLVslDWTn23VxYweq1O+GByE
	rK1nKtY+an8qlZ8fC4sYNXkKA+ZO/mgDr2cbcm/REpm3Dw3S+u41LGgVtXEpB6Hi
	PngR78UbJ2Nqs9aqSltScFYJW7C8GBiy6MnGOkBQIhutSbumgDBW85AIg==
X-ME-Sender: <xms:SgjSYyyLmzKvpJ9p5oZbLrL3XqrgTIJv4X1IVCSoXq_HAHpGd9faIg>
    <xme:SgjSY-TlyQcywKj_jwxRODYV5t4Pyvq886nGmA0SB4YHyCdC6MKWDWHVVCU9gzTFG
    0kF7qNpr_MYmwgR2w>
X-ME-Received: <xmr:SgjSY0USElN9nY-OKB04ZUP9uFK_dvpCRvVoSisKaecBZvqYOkHF9E9VFcDshhptfw8AuJnnzBb8D-MPHsCN94bMve4toRNFzw8BoZRBl_uN42tZeTn-4MXH3ouiH4fYI6BTpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:SwjSY4gxm43Cc8JRHDDZ8iv70ABFYvWKOuOm4fcqIW5q30tNFtw72g>
    <xmx:SwjSY0ALOI-WbENLQdf0D3DRZMEEpMT97woNavvcQQ5QMP4XR_bC9Q>
    <xmx:SwjSY5Lm3rRZR_GsbD28PWBXxwIuYfBUX7MuKPeegwxJt5KZT114FA>
    <xmx:SwjSY8Yb-dOSCmLT_suoOAPb4gcsm8O6__R3tomESvbRlhrzSqL55g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 23:57:46 -0500 (EST)
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
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 07/11] riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
Date: Wed, 25 Jan 2023 22:57:34 -0600
Message-Id: <20230126045738.47903-8-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230126045738.47903-1-samuel@sholland.org>
References: <20230126045738.47903-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_205747_916145_3553FAA3 
X-CRM114-Status: GOOD (  17.56  )
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
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v3)

Changes in v3:
 - Fix `make W=1 dtbs` warnings (missing reg properties)
 - Drop mmc alias

Changes in v2:
 - Added DMIC sound card to Lichee RV dock and Lichee RV 86 Panel
 - Removed LRADC (depends on analog LDOs)

 arch/riscv/boot/dts/allwinner/Makefile        |   4 +
 .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +++++
 .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 ++
 .../sun20i-d1-lichee-rv-86-panel.dtsi         | 119 ++++++++++++++++++
 .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  97 ++++++++++++++
 .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  87 +++++++++++++
 6 files changed, 346 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index 277e59d1c907..f1c70b9dc9bf 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -1,3 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1s-mangopi-mq.dtb
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
index 000000000000..6cc7dd0c1ae2
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
@@ -0,0 +1,119 @@
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
+	dmic_codec: dmic-codec {
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		#sound-dai-cells = <0>;
+	};
+
+	dmic-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "DMIC";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "pdm";
+			frame-master = <&link0_cpu>;
+			bitclock-master = <&link0_cpu>;
+
+			link0_cpu: cpu {
+				sound-dai = <&dmic>;
+			};
+
+			link0_codec: codec {
+				sound-dai = <&dmic_codec>;
+			};
+		};
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
+&dmic {
+	pinctrl-0 = <&dmic_pb11_d0_pin>, <&dmic_pe17_clk_pin>;
+	pinctrl-names = "default";
+	status = "okay";
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
index 000000000000..52b91e1affed
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
@@ -0,0 +1,97 @@
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
+	dmic_codec: dmic-codec {
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		#sound-dai-cells = <0>;
+	};
+
+	dmic-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "DMIC";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "pdm";
+			frame-master = <&link0_cpu>;
+			bitclock-master = <&link0_cpu>;
+
+			link0_cpu: cpu {
+				sound-dai = <&dmic>;
+			};
+
+			link0_codec: codec {
+				sound-dai = <&dmic_codec>;
+			};
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
+	};
+};
+
+&dmic {
+	pinctrl-0 = <&dmic_pb11_d0_pin>, <&dmic_pe17_clk_pin>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&ehci1 {
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
index 000000000000..d60a0562a8b1
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
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
+	model = "Sipeed Lichee RV";
+	compatible = "sipeed,lichee-rv", "allwinner,sun20i-d1";
+
+	aliases {
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
+&dcxo {
+	clock-frequency = <24000000>;
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
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
