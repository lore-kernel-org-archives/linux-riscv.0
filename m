Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41111C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017182250E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 017182250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mO6vLpO0CyE376lK680v0fMAZTSQBwtWx+QsPg+vhHw=; b=1k5m5LbiI1404Y9se76Sk2tg9
	cD67WsJ2PrIyHlP/gykHAaqP2AycVkM9pREhks71jedkCjvnyeIMxWh+G4eNw+s9QnBXib7mnFml8
	c/geh9Q+YVnnHTZwI3ysVtdcu5h/QIC9eaz5zXljh3PjiAA6399gPmAnwtFl058koE1SfVDduEKx5
	i79CQCnIr2jSGZHBvOr4qGVbWK5UaDPT83ZiJCwA+JZRBp741ZZnexuswpP4D9/QnAgSR5ax+k8NG
	oHNvhcfw3QG8W/WjkWwdWVv0kT+yivTZPciaRqwj7JMLHgEzlaozJWSw/LGcW9VXYDBKYTDard4tu
	bbrMoNptQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1JtA-0003lb-2g; Mon, 18 Jan 2021 02:03:28 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jt5-0003gZ-6q
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935402; x=1642471402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxkrMnisgB5Y7CCjo51izxzf/ZM8UZEu9H+xpU97oZI=;
 b=bb3UjZYFvqROL0kRJJKfuv93+y3ZzCgPeJDJ24mgpwbeAB/E8wEJAGhn
 C0/z9O+KbkoDZdgkx4+Kzh8Ch++DGYMV+ngy4gK/oiBatIEnymNCgHK67
 ztRRGryVxOZm59JMWyvhD6Re4b9yu9KbLaqGIVEudURR7sY0V1RA6em7A
 xB4rECivR1zVQBkQ6yf1kVwWCd16GTeOMIo0jqsrk7fojzJy9EQGxdlCd
 8avQAqjcowKqDZcLKXMMWXu7586WBON8T7FsQ99lKWoGfuquEJ9kvQlpK
 tYmglI8bY/ITkRAMzHQjnzfANfp7ls3FLewZ6OJTHf8ot3vnb8WGC7Syj A==;
IronPort-SDR: 9s/0mFXy0xtqSD7yxB7DHH/AfAD7WjK+oDh2C6WJfJvQc0zN/yT/697pD25yve0nWEX6reYIP9
 CX20R4kW6PnvbryzPujZKKt0tqbmQZ9oI6ifb6dd/0RBF+dYsim5PVp1GOr4MzV6KH5lmB9Zel
 DEijJw9yXlqF1sdFsoMMYiE2zwiIEBAr9BLfFnYy4td1uAHsoQ5SyFN+8v1juPLzGZqA/Aicgh
 lOay4BoKWz/18466de3Tt9nF3QfVkPejRAc9AWDFgRgFwo+UKHkRvS9T8VbypdfVA/ON65wzIk
 kdQ=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979930"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:22 +0800
IronPort-SDR: p4tarXC0mHNp8oEJdzL4FshsOtYDWm0rJGZM8khP2Qk8ElPkXvg08+o0o3fJRnNp6kJ2n09dNY
 ba3LsGvJw9GCqmUoYZ7Eacx+qbmvh5l8N6CXaAkcOVrwI1DFj5ZYNfjmR0a4DZLi2FT17pr8OU
 koBNxcqilImCPDR4vC39smDT6fd9NUVJc+cmIS6xUYARDYKMEv6GErRNFl1a9XHGlw1Oej3aMt
 rPDI5/XRmYrugHQ2SGXcU0L020H9fr4kttqFiNe35WnYyE2aCUqN6/77Y4EVdzqRWk2d3iQUB9
 t+1CHzSZ6ZEQxcV1lYdWLlCX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:59 -0800
IronPort-SDR: q/IgvxQldYFLTeNAzniOrqgdkA1Ro03m5iyjnM/dW1YrFqJNx1EwzmHMpQcYcPpWSAdheWdrgs
 nt4zbTPqjkqiCJCuUFRI998K9QaSRk4UJQlGOrkLPaU1mOfwn0hE8N81yIUnIzHovVhtuyw1L7
 8Lb0ZH3txq3raZeGU081u4Sjj7cnK7PdFRMoUgvjzeP7+dfz8kVEqpS2b6jC9fWqkRblVfrNnQ
 sOpEjfSmK/oh8tTxkNhhQszGg+KfZGpzzTGtxyVS22RFFiJfad/UKUBovHraa5fHrhBuLkEC3i
 6gQ=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:22 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 14/17] riscv: Add SiPeed MAIXDUINO board device tree
Date: Mon, 18 Jan 2021 11:02:41 +0900
Message-Id: <20210118020244.103451-15-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210323_449415_BFD72E77 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the device tree sipeed_maixduino.dts for the SiPeed MAIXDUINO board.
This device tree enables LEDs and spi/mmc SD card device. Additionally,
gpios and i2c are also enabled and mapped to the board header pins as
indicated on the board itself.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../boot/dts/canaan/sipeed_maixduino.dts      | 209 ++++++++++++++++++
 1 file changed, 209 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts

diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
new file mode 100644
index 000000000000..804edc45eeeb
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ */
+
+/dts-v1/;
+
+#include "k210.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "SiPeed MAIXDUINO";
+	compatible = "sipeed,maixduino", "canaan,kendryte-k210";
+
+	chosen {
+		bootargs = "earlycon console=ttySIF0";
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		boot {
+			label = "BOOT";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		status = "disabled";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0 0>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&mic>;
+		};
+	};
+
+	mic: mic {
+		#sound-dai-cells = <0>;
+		compatible = "memsensing,msm261s4030h0";
+		status = "disabled";
+	};
+
+	vcc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&fpioa {
+	status = "okay";
+
+	uarths_pinctrl: uarths-pinmux {
+		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>, /* Header "0" */
+			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>; /* Header "1" */
+	};
+
+	gpio_pinctrl: gpio-pinmux {
+		pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
+			 <K210_FPIOA(9, K210_PCF_GPIO1)>;
+	};
+
+	gpiohs_pinctrl: gpiohs-pinmux {
+		pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,  /* BOOT */
+			 <K210_FPIOA(21, K210_PCF_GPIOHS2)>,  /* Header "2" */
+			 <K210_FPIOA(22, K210_PCF_GPIOHS3)>,  /* Header "3" */
+			 <K210_FPIOA(23, K210_PCF_GPIOHS4)>,  /* Header "4" */
+			 <K210_FPIOA(24, K210_PCF_GPIOHS5)>,  /* Header "5" */
+			 <K210_FPIOA(32, K210_PCF_GPIOHS6)>,  /* Header "6" */
+			 <K210_FPIOA(15, K210_PCF_GPIOHS7)>,  /* Header "7" */
+			 <K210_FPIOA(14, K210_PCF_GPIOHS8)>,  /* Header "8" */
+			 <K210_FPIOA(13, K210_PCF_GPIOHS9)>,  /* Header "9" */
+			 <K210_FPIOA(12, K210_PCF_GPIOHS10)>, /* Header "10" */
+			 <K210_FPIOA(11, K210_PCF_GPIOHS11)>, /* Header "11" */
+			 <K210_FPIOA(10, K210_PCF_GPIOHS12)>, /* Header "12" */
+			 <K210_FPIOA(3,  K210_PCF_GPIOHS13)>; /* Header "13" */
+	};
+
+	i2s0_pinctrl: i2s0-pinmux {
+		pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
+			 <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
+			 <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
+	};
+
+	spi1_pinctrl: spi1-pinmux {
+		pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
+			 <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
+			 <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
+			 <K210_FPIOA(29, K210_PCF_GPIO2)>; /* cs */
+	};
+
+	i2c1_pinctrl: i2c1-pinmux {
+		pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>, /* Header "scl" */
+			 <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;  /* Header "sda" */
+	};
+
+	i2s1_pinctrl: i2s1-pinmux {
+		pinmux = <K210_FPIOA(33, K210_PCF_I2S1_WS)>,
+			 <K210_FPIOA(34, K210_PCF_I2S1_IN_D0)>,
+			 <K210_FPIOA(35, K210_PCF_I2S1_SCLK)>;
+	};
+
+	spi0_pinctrl: spi0-pinmux {
+		pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
+			 <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
+			 <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
+			 <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
+	};
+
+	dvp_pinctrl: dvp-pinmux {
+		pinmux = <K210_FPIOA(40, K210_PCF_SCCB_SDA)>,
+			 <K210_FPIOA(41, K210_PCF_SCCB_SCLK)>,
+			 <K210_FPIOA(42, K210_PCF_DVP_RST)>,
+			 <K210_FPIOA(43, K210_PCF_DVP_VSYNC)>,
+			 <K210_FPIOA(44, K210_PCF_DVP_PWDN)>,
+			 <K210_FPIOA(45, K210_PCF_DVP_HSYNC)>,
+			 <K210_FPIOA(46, K210_PCF_DVP_XCLK)>,
+			 <K210_FPIOA(47, K210_PCF_DVP_PCLK)>;
+	};
+};
+
+&uarths0 {
+	pinctrl-0 = <&uarths_pinctrl>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gpio0 {
+	pinctrl-0 = <&gpiohs_pinctrl>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-0 = <&gpio_pinctrl>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2s0 {
+	#sound-dai-cells = <1>;
+	pinctrl-0 = <&i2s0_pinctrl>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pinctrl>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&dvp0 {
+	pinctrl-0 = <&dvp_pinctrl>;
+	pinctrl-names = "default";
+};
+
+&spi0 {
+	pinctrl-0 = <&spi0_pinctrl>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+
+	panel@0 {
+		compatible = "sitronix,st7789v";
+		reg = <0>;
+		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
+		dc-gpios = <&gpio0 22 0>;
+		spi-max-frequency = <15000000>;
+		power-supply = <&vcc_3v3>;
+	};
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pinctrl>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio1_0 2 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	slot@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		voltage-ranges = <3300 3300>;
+		spi-max-frequency = <25000000>;
+		broken-cd;
+	};
+};
+
+&spi3 {
+	spi-flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+		broken-flash-reset;
+	};
+};
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
