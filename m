Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB65C388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5770E20704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chxnKbxW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JcDW1mzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5770E20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WJeVbQ7PtVQ9j82bwvRSLkv4cCW97dGLdr0RKT/07sk=; b=chxnKbxWNd/nztkHyXqLLXle1
	CyQSKYl7qnL0UKw7VF74dCZ6J+VJtQdDWfas0Zq96r3zaixB2typiaNf33P6lXUcT+JbeeeSypvcf
	a/vQbqy4aFVKZTa62kSyeVUavbGeL+OZMxXhilSercQIDLsbNAA43N3K1y5f/biLXErlL4ez6Sbon
	HsbwFCQ5ewcRDElGqlNHH1zqjulAjdqv2N4KYZU4hHLnW27loISg3BjcAG466bOB4TgySqCgy0AH/
	XkWbnqrVJwRyfcomt6dO0Xi3Y49MIaFU8YO9dqsYZXr+CuSWhHerv6ab3hA8Zy66CF3d+NTS4A8hR
	FUZ106jPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJO6-0001Iv-PB; Sat, 07 Nov 2020 08:15:54 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNt-00019G-K7
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736941; x=1636272941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3OjSRaZdRZEopF5emoT4BE/85Aj4wU9L44olUTo9sc=;
 b=JcDW1mzBjeoYC2POvb7n1XwFkD7cUCkRcBrgH3je0BcY2CTBAZcvHIQQ
 yUaY9jKbzZRV7JsUVsbWtHIy+QUVKmJvfTjbQVBEX5anZnEHG7Ja+cOLP
 gYaKfNDS+hWzSvbUXQx9b7zIDlHuZ1eUjS7rzTtTPeMkAI+64Vsj1M4FF
 BNjsqdIgtqv1EmdMMMd/gGG3HLEH8sm3WYuGd3Aupr8xdNIqVYR55kQEz
 JcVrtzWavSF8baSWh3kwcA1iQjk87jtZWIV4qM6c8KyGLkaqvvOZ6we1A
 rSJV7EfMzXa/sq167cxIH06VJv7BM8TW1DvMj23T8qOUhvxc6MvfsUdIy w==;
IronPort-SDR: SRuYn4ERY63q3qmkI/RmYwbbxJvYuHH8LmypEb5HK+hekxEYqrWjZ1+rN375yPjc/I2fr8agc/
 eV/TolNgH+TBdWk7XsHsR88TL1phqty3yvJ04Tdf5hogIsmCgz6rVh7/IDhvw7dBhlNJlOAOa0
 7hqUGR3Nk9Qnya183Rudw4gpfpvMwUk0uCjpTST0YDR3LlmMUJlqnbwSR4D7XG1Y03O0QREEFH
 BGUJtyM28ySnGj+jDA+mVbpyPu5jpsoZj4/pK6YKHSufhswuAPSUUhTwWahKiCp+bHjOfAYNMV
 KnY=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079361"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:40 +0800
IronPort-SDR: rfdZeTf48B0x3KsbHvHFlDc9ATzSD2h2PJRSYah2ea2BPDs9EzK5IgbWJaw/c3Ez9kYw9SUZvE
 2k5f68N6EsEn9e0fyS7ekMS8pKxY4JB5EXBVwn9GStH/zkUli/qJdEWGKUNlZWwONQRYEkS7Ok
 zHVPkGHIVQI/zuMh2Exs9Ez8aLw63pKQ1bdsLGTSa7dXy7X3hcDe0bhT2K+QOpOBixFfs0zsHt
 p5+XpdUps+GAOCN5Dikjtse9jr8RYD5rMxn17WX2H7oYH5uUJYhmrM3Cucd2fo9cnIp9Mt0Sm9
 fXn/SaMMGKvjR73H/fByxYmY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:45 -0800
IronPort-SDR: MBGZyaKY5Z+WE1I0AHYNyaKif90gu5vRzLUfMzKGP0olVXLyXoGjgS9sN+vLb6mThTKKRvAsnA
 KesyVKW0F2+XssFoUj6WT2XxCpDG+IfVLrYeVe3waXM3lTcrLUdWGCZs/MK55ZdUoqud9WnuM+
 L9SOM3DQP/GpwcBZrhGHkGYCBuTw1JjepSx2/BYej8cFy6g6jQHmkvSOFBQXUZqh26cIHyajkp
 DPJLkysL4cn+puRPtRU6uZfUrjtVCz5UK3DkxkFxIedX7zbUopPYOOnNkWJvLCcp+wk9P5Myiy
 wLs=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:38 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 29/32] riscv: Add SiPeed MAIX GO board device tree
Date: Sat,  7 Nov 2020 17:14:17 +0900
Message-Id: <20201107081420.60325-30-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031541_842793_927BB0BA 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a device tree for the SiPeed MAIX GO board. This device tree
enables buttons, LEDs, gpio, i2c and spi/mmc SD card devices.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/kendryte/k210_maix_go.dts | 237 ++++++++++++++++++
 1 file changed, 237 insertions(+)
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_maix_go.dts

diff --git a/arch/riscv/boot/dts/kendryte/k210_maix_go.dts b/arch/riscv/boot/dts/kendryte/k210_maix_go.dts
new file mode 100644
index 000000000000..8254d93a5e82
--- /dev/null
+++ b/arch/riscv/boot/dts/kendryte/k210_maix_go.dts
@@ -0,0 +1,237 @@
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
+	model = "SiPeed MAIX GO";
+	compatible = "sipeed,maix-go", "kendryte,k210";
+
+	chosen {
+		bootargs = "earlycon console=ttySIF0";
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		green {
+			gpios = <&gpio1_0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		red {
+			gpios = <&gpio1_0 5 GPIO_ACTIVE_LOW>;
+		};
+
+		blue {
+			gpios = <&gpio1_0 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		up {
+			label = "UP";
+			linux,code = <BTN_1>;
+			gpios = <&gpio1_0 7 GPIO_ACTIVE_LOW>;
+		};
+
+		press {
+			label = "PRESS";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+		};
+
+		down {
+			label = "DOWN";
+			linux,code = <BTN_2>;
+			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
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
+};
+
+&fpioa {
+	pinctrl-0 = <&fpioa_jtag>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	fpioa_jtag: jtag {
+		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
+			 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
+			 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
+			 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
+	};
+
+	fpioa_uarths: uarths {
+		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>,
+			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>;
+	};
+
+	fpioa_gpio: gpio {
+		pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
+			 <K210_FPIOA(9, K210_PCF_GPIO1)>,
+			 <K210_FPIOA(10, K210_PCF_GPIO2)>,
+			 <K210_FPIOA(11, K210_PCF_GPIO3)>,
+			 <K210_FPIOA(12, K210_PCF_GPIO4)>,
+			 <K210_FPIOA(13, K210_PCF_GPIO5)>,
+			 <K210_FPIOA(14, K210_PCF_GPIO6)>,
+			 <K210_FPIOA(15, K210_PCF_GPIO7)>;
+	};
+
+	fpioa_gpiohs: gpiohs {
+		pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,
+			 <K210_FPIOA(17, K210_PCF_GPIOHS1)>,
+			 <K210_FPIOA(21, K210_PCF_GPIOHS5)>,
+			 <K210_FPIOA(22, K210_PCF_GPIOHS6)>,
+			 <K210_FPIOA(23, K210_PCF_GPIOHS7)>,
+			 <K210_FPIOA(24, K210_PCF_GPIOHS8)>,
+			 <K210_FPIOA(25, K210_PCF_GPIOHS9)>,
+			 <K210_FPIOA(32, K210_PCF_GPIOHS16)>,
+			 <K210_FPIOA(33, K210_PCF_GPIOHS17)>,
+			 <K210_FPIOA(34, K210_PCF_GPIOHS18)>,
+			 <K210_FPIOA(35, K210_PCF_GPIOHS19)>;
+	};
+
+	fpioa_i2s0: i2s0 {
+		pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
+			 <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
+			 <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
+	};
+
+	fpioa_dvp: dvp {
+		pinmux = <K210_FPIOA(40, K210_PCF_SCCB_SDA)>,
+			 <K210_FPIOA(41, K210_PCF_SCCB_SCLK)>,
+			 <K210_FPIOA(42, K210_PCF_DVP_RST)>,
+			 <K210_FPIOA(43, K210_PCF_DVP_VSYNC)>,
+			 <K210_FPIOA(44, K210_PCF_DVP_PWDN)>,
+			 <K210_FPIOA(45, K210_PCF_DVP_HSYNC)>,
+			 <K210_FPIOA(46, K210_PCF_DVP_XCLK)>,
+			 <K210_FPIOA(47, K210_PCF_DVP_PCLK)>;
+	};
+
+	fpioa_spi0: spi0 {
+		pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
+			 <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
+			 <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
+			 <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
+	};
+
+	fpioa_spi1: spi1 {
+		pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
+			 <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
+			 <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
+			 <K210_FPIOA(29, K210_PCF_SPI1_SS0)>; /* cs */
+	};
+
+	fpioa_i2c1: i2c1 {
+		pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>,
+			 <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;
+	};
+};
+
+&uarths0 {
+	pinctrl-0 = <&fpioa_uarths>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gpio0 {
+	pinctrl-0 = <&fpioa_gpiohs>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-0 = <&fpioa_gpio>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2s0 {
+	#sound-dai-cells = <1>;
+	pinctrl-0 = <&fpioa_i2s0>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	pinctrl-0 = <&fpioa_i2c1>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&dvp0 {
+	pinctrl-0 = <&fpioa_dvp>;
+	pinctrl-names = "default";
+};
+
+&spi0 {
+	pinctrl-0 = <&fpioa_spi0>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio0 20 0>;
+
+	panel@0 {
+		compatible = "sitronix,st7789v";
+		reg = <0>;
+		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
+		dc-gpios = <&gpio0 22 0>;
+		spi-max-frequency = <15000000>;
+		status = "disabled";
+	};
+};
+
+&spi1 {
+	pinctrl-0 = <&fpioa_spi1>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	polling;
+	status = "okay";
+
+	slot@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		voltage-ranges = <3300 3300>;
+		spi-max-frequency = <4000000>;
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
