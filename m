Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3244AC433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB24864E31
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB24864E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fG+t30pGesv2UEzMVeH7quogUJRhSbutly3CL40MPhM=; b=NtP2ygOaBrTwOJ+nE6ga6lMca
	K7JpAch6zSWYOIkyi0WG6UDD3Ds6Rq4pfCEg1Xr58A7MvpBuoBeWIMir6ObBOyggjqZsqPZNbzSTN
	yfCVGQLjSAGG9rJCoOEw8xllZMMNYE4Al+2Rzw5FZCn484LpClIF1Tizv9Z45FRChjMTnqC83y3uP
	ADnfb+5SeNLX/HtKxyoTcIyn6RA/BF3wLcm3Vv4JC6H+rrgEA2cggjDNQUBT0D66m6OAnM1Pa8uQp
	TvXWTmQklX67Mmitqtk+n4ZPRdN/WIE+4qG/IvM3aCXadnaxo6pRzjLJ85vslU4hMCqxdBhSw4Eby
	q7EwdaFBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tF5-0006WG-Bw; Sun, 07 Feb 2021 23:13:23 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tF0-0006Ry-8V
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739598; x=1644275598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZVJszlCUeT8A82U+e6McWWtmRXvcdjQ3DcRByG4VQwg=;
 b=PpnlPn/G2SsTxfUPhqcgOWKQDbs/xAzngr5EilA6QYcYwxzMagf/oERw
 0NIl99XzplChY1gbJY4zCnm0t0SFBVrSYv3G34p8696DoA2C5We5Iq3+5
 NOejMihXy7yXdRh2XTU042b28xfGjoiYVCTJbL3Ad7RT2mSW5OVpllPzU
 NfL+sY/URoNvbihKjYIWlt4NhcknmMffd9wcDaItbwaUtyZkdnQCWIBjt
 7yypF8h6kvi83lmjuhEtWCtScxhgIf+Qt0HdplDuinUohV/jU6vYcu/HZ
 W5ophTVJC9Uq1hE40Z31vGYToD4D6xUaaQh5HU1utvAKYSQx857SODXh/ w==;
IronPort-SDR: IOrB0ggROE70/v9gwrQQvGFTqE6ioyGJcaIsCaCtDZMh4ZjTEh0J0Sz6Pb1DAyLsrTlmLAMCpm
 Kko89kbGKd+ADeo2/5RLK7c+xigFPa96G4sa+AbZ7Ij/nb97PysQON4V38DSI0gT207hmhb8Tt
 WQKi6pEBOlLVsmzIzP9EyNZfkt2Iq1cMVZ49KWGuNTYWLiC3uujVVE6wMBOi0cFyMJqCF6Aloz
 L8dYR7csE3DQXphL/71mjRPvUFF8WTKE0mlSu0fM9Mz+aKs652nI16tiyAuX//LyQah6yX+3oh
 dSs=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861277"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:17 +0800
IronPort-SDR: +qb9SW1yBxfAEc2c7w68QqfNenqJnm5jZRtv2J3au3B9QRx77iwRr5X0e89Y8CClGjVop2+7uq
 Mixc/0WWLwN9RXJkv4FAjAesarCxGsrFc59sOKFyLbmTF95e6U1gvmka/+GHVK2DHAuuqvBJ3q
 FMoaHqhPyGlqxhbwkVggNR9uxBmgLRZX2pH3akyugOBoR/8+OSP6V6IY7P1x9XUM6HgZRfynsT
 3EQN2VaqyMTDN/r7m19CBRIhkwtVU6zmKJc7zySZH74VZk6eiSWezMz3YDw1gnYi36RSM35JB3
 BR37ZWTFLJjcmJaVcv34IMrC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:13 -0800
IronPort-SDR: 95DfHCdYc5OhvBfbKAXj9rH1PXyzovPR9FaRroYvtADsCoICcoreVzLODZOSsUTFy6N2+FbrsQ
 +oyID/onHEGxuzUSXjywCTp1y683tYUlIAu86wUVBSpI9bOuY4xf8J/MKPxVK7/KiLnbAKHVDw
 ACOzEmppAc7NuiuhvgnjjrmDu/+lKspSjF6mmWjEnvqSsrdalxWyEvm9Cieuct3EPwZugaWRH7
 8rLQTSWsFMv9Tw+pFIhaJp8awYVqB6I1/fidfr/sl7OtwfJrMmhYTyBhM9+32MBXSwz/CQ/GS1
 6vo=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:17 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 10/16] riscv: Add SiPeed MAIX BiT board device tree
Date: Mon,  8 Feb 2021 08:12:50 +0900
Message-Id: <20210207231256.115130-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181318_764347_ABD3A0A2 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the device tree sipeed_maix_bit.dts for the SiPeed MAIX BiT and
MAIX BiTm boards. This device tree enables LEDs, gpio, i2c and spi/mmc
SD card devices.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts | 234 ++++++++++++++++++
 1 file changed, 234 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts

diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
new file mode 100644
index 000000000000..11e491410f00
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -0,0 +1,234 @@
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
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "SiPeed MAIX BiT";
+	compatible = "sipeed,maix-bit", "sipeed,maix-bitm",
+		     "canaan,kendryte-k210";
+
+	chosen {
+		bootargs = "earlycon console=ttySIF0";
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			color = <LED_COLOR_ID_GREEN>;
+			label = "green";
+			gpios = <&gpio1_0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		led1 {
+			color = <LED_COLOR_ID_RED>;
+			label = "red";
+			gpios = <&gpio1_0 5 GPIO_ACTIVE_LOW>;
+		};
+
+		led2 {
+			color = <LED_COLOR_ID_BLUE>;
+			label = "blue";
+			gpios = <&gpio1_0 6 GPIO_ACTIVE_LOW>;
+		};
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&jtag_pinctrl>;
+	status = "okay";
+
+	jtag_pinctrl: jtag-pinmux {
+		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
+			 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
+			 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
+			 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
+	};
+
+	uarths_pinctrl: uarths-pinmux {
+		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>,
+			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>;
+	};
+
+	gpio_pinctrl: gpio-pinmux {
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
+	gpiohs_pinctrl: gpiohs-pinmux {
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
+	i2s0_pinctrl: i2s0-pinmux {
+		pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
+			 <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
+			 <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
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
+
+	spi0_pinctrl: spi0-pinmux {
+		pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
+			 <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
+			 <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
+			 <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
+	};
+
+	spi1_pinctrl: spi1-pinmux {
+		pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
+			 <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
+			 <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
+			 <K210_FPIOA(29, K210_PCF_GPIOHS13)>; /* cs */
+	};
+
+	i2c1_pinctrl: i2c1-pinmux {
+		pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>,
+			 <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;
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
+		dc-gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>;
+		spi-max-frequency = <15000000>;
+		spi-cs-high;
+		status = "disabled";
+	};
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pinctrl>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
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
