Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81124C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1911F20872
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIcA6Ci9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="V7ZtBhHf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1911F20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b+oxxhlN0fDcqLAwbxANRui38IDogsUcSuIjZ3jq19M=; b=bIcA6Ci97oO/pMWxXfRbqQmcj
	04C3/oP01D5ribmJ4KVmxwv1P3kZvS5OCcju+dFgpN8L0CxIhXU8x0//Jexo/sGSFJwHWvCDsRGYr
	nJER8iypa0lgSWMyPC3EwkQxk7pYfpeBc2+2StfKLCBrEVCMwkU5u9IYjwuoR04+kjWj2wfoYrfFh
	o9SxzUzpu5EQq620IYhEuwy2L9HQgo6cFPWn/2eIBX70sYt9QlFh4bBLyRUzb4LPZU23dFSrBIs8c
	9pWU4SWvkW+wsYI+btqyCiSaJQ9y6GHcnQaY/jVdU9WhJTk1q11dAMJRKmcFbLQ4kxbHvQoTrtX7b
	F2q4ONcBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJO8-0001KV-8k; Sat, 07 Nov 2020 08:15:56 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNv-00019G-MN
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736943; x=1636272943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mpZe81LRQ3UMdKf0/NVqeXymuUe5qfQYIBE6oymulrY=;
 b=V7ZtBhHfeYAHXnWb4lMNt+FiBuU3qnQ5pnXjiUwip1G5oCZ81xhp/tVq
 C1IsymXTFxjX57C+XrPpzqKwI2UBbcJWpu1R4cKooszca531jdXVIA/I7
 43P0DJ1w+GxDulanGj1l582Wx2TSzp68gXjiPBsGSVIEOElLqwoAd3t+3
 aXyjtmiKPn+zrXlI0EoNZQLxZtJM9zXn0e8TSJiNBFEKDpzEyroq+wLZA
 42ysRvUeW2Vzhiigu7/WfiI0KU0Z3hy5sXuz1kMVY5zsqX2nrFMVe7Hkt
 PL2AoQv0bkekyNGXy31b+t3FLnXmsMV8oiNi/8+/l2VVqt+RmvA7o/tmn Q==;
IronPort-SDR: fnVuriJt1MWtX+fYBKzCtaPeZCR+LSKHmxxd7NN87V+PXOkw2S4v1oz8NOu5L89iQ4B2Jn22Gs
 Byycg7RgcR/mUeQ4USAleaXlPXYIyAb66gW4m7fupziJ6WJqHr3jAON2jysxfNbqs5/TYPO+f3
 0nhYq0k2hSTqwO33V5Y4R3HFpc54FahnbXufb8zOcVDUpIkYFs5JXDK7qnHcpxJIDOaP7iRgtq
 UUJeSf/StmxgX5eFKGvoEcqN4oavVt7SQ+1y5V+Hrfl99ycikKqKV20DtfEPOcrGP9MGTiTPdD
 d48=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079365"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:43 +0800
IronPort-SDR: EWznIax22rQ9xcp7cHzmg/qRaxOBTgHFjDngo2Uu7bUTRyIuds40/X4Tsj347G8U+UEPwTMZIT
 Kvg80F46Yumohz/f6xUhOP/GCrMmPkdBvK+2pKkGRDuC+pQVSQ7hAB/Ga/TBxXcz29e7GnB7/Q
 GF3i+2H6oXMWSL3iSAHtygJD/gTU3nOTBvh9NmGCSvwZ3b7iW5zqOH6usGPcSCmhr7fUOzwIlH
 Q5IZq/XpgR2bNLZuml72SvbzWsyfGxRRybY2xcYdcd3CivVn8+iEsaI9OiH4rSzWj8ReAyOXd9
 1BLHPTnBVvdt5peRhIY2AWwj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:47 -0800
IronPort-SDR: 8bVSfo5HMd0qf0dwK5d4k2No6GNG/G+0XTossZQ1bZ2/g/jb4AIdK+c4/aNgFEpBv85e4HpS0v
 yMigZybGad6iqKmgtWPdYk+ygK7UPOD7ezWTLZOV/XewloNu+dWFl2lzzDbqP09lQC/Howd4Fy
 yrBCKAf5MgwwaDhwX2AhmtoTdz3TXHcsMHb3XOn0HWx+SnAh4oGTNRH+88eWpeXbq3D5isSADc
 cJKYh4FsNSi+UaBFfMwmlEGNEX/OL0kaZtZXsdwxcmulAfDOK9hFD0Rc6NyY/c+QSG6oUBpceD
 qh4=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:41 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 30/32] riscv: Add SiPeed MAIXDUINO board device tree
Date: Sat,  7 Nov 2020 17:14:18 +0900
Message-Id: <20201107081420.60325-31-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031544_038035_0648A0D8 
X-CRM114-Status: GOOD (  14.69  )
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

Add a device tree for the SiPeed MAIXDUINO board. This device tree
enables LEDs and spi/mmc SD card device. Additionally, gpios and i2c
are also enabled and mapped to the board header pins as indicated on
the board itself.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../boot/dts/kendryte/k210_maixduino.dts      | 203 ++++++++++++++++++
 1 file changed, 203 insertions(+)
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_maixduino.dts

diff --git a/arch/riscv/boot/dts/kendryte/k210_maixduino.dts b/arch/riscv/boot/dts/kendryte/k210_maixduino.dts
new file mode 100644
index 000000000000..78a37cf9df97
--- /dev/null
+++ b/arch/riscv/boot/dts/kendryte/k210_maixduino.dts
@@ -0,0 +1,203 @@
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
+	compatible = "sipeed,maixduino", "kendryte,k210";
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
+};
+
+&fpioa {
+	status = "okay";
+
+	fpioa_uarths: uarths {
+		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>, /* Header "0" */
+			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>; /* Header "1" */
+	};
+
+	fpioa_gpio: gpio {
+		pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
+			 <K210_FPIOA(9, K210_PCF_GPIO1)>;
+	};
+
+	fpioa_gpiohs: gpiohs {
+		pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,  /* BOOT */
+			 <K210_FPIOA(17, K210_PCF_GPIOHS1)>,
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
+			 <K210_FPIOA(3,  K210_PCF_GPIOHS13)>, /* Header "13" */
+			 <K210_FPIOA(25, K210_PCF_GPIOHS14)>;
+	};
+
+	fpioa_i2s0: i2s0 {
+		pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
+			 <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
+			 <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
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
+		pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>, /* Header "scl" */
+			 <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;  /* Header "sda" */
+	};
+
+	fpioa_i2s1: i2s1 {
+		pinmux = <K210_FPIOA(33, K210_PCF_I2S1_WS)>,
+			 <K210_FPIOA(34, K210_PCF_I2S1_IN_D0)>,
+			 <K210_FPIOA(35, K210_PCF_I2S1_SCLK)>;
+	};
+
+	fpioa_spi0: spi0 {
+		pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
+			 <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
+			 <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
+			 <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
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
