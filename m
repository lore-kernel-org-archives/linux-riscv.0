Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90063C433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B61164EB9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B61164EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1aFLJPVMytUmsa/wR/x4Wp1WofSi/JLxNl1KiZYnqlo=; b=xVgVYXQG1AfI6GH8dnfj26h9e
	CmDHdfSiye4GdR6IIC99LXjbsgr7ZksPrOS3JdyMMQoHZmH3O6KAxRE7dDHyPbKKWryuHcR1uM7Eb
	3CxhHGegI6x5o+xjp7Wzo8YjFfkvjl1jEL6S+Fd/8oi9yqR+cvydsUHHIz61f9oiQahz6JnSN/XLh
	yMWKQAmVinFDyebYXLDmOa1OdPDO2NSNxLJF9qI66pTRTyjWp/cumS02ED1zi37LliVhCvqqprfq1
	ziXzvKqDkjSmKhYZ3oZcqbX8TAt3mQsNZuL/bjDCzjlM+4gPawva+lf7/StA0r2lS6mgq8FDSYY4N
	9+L/UZ4qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SAN-0008Ke-IU; Tue, 09 Feb 2021 12:30:51 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9SAD-00087n-8r
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612873841; x=1644409841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O8Zb4MFoD14ZWUaz18hXV55N7UNmAe5OYeG7eeRqwL8=;
 b=EXN//3wYUY38aJ6VexTaJidkAyC+YdI2VkRyb+YXmUV2LRPsDkWoVvea
 63/HrLRqkVXweitlfpfPUcQca3Mnb35Yf93H5fu2r4XNiv6lR/aJ0f1Du
 2llMXscbrrwazNX3JIxJiaSc9f+toDb4BkD4xMWHUVviFUWW0afr3zp0m
 zXLjONxpbdXyBrpQmK9mAxYa0ORwOBzJRs/DYZXCwnWw+loXDYRr3zpAm
 FVws/F7hfs8R8VQYkfSYRrQZt56vSJ7Fz70KZhSb3R5PufOwo44UXHpXd
 9/NSNHfOoCx3DzkLUd0x42NLhCMeKew5HqEly63UFbZD7Tlz2DMJxFFfA w==;
IronPort-SDR: ldZTVCZrf6htL34fKTjBkh2j+3cg/t+aCm0uL0R+BY5hNyIaal/kbTP2s8TIR7csz4Aw7oIQ3D
 RSPgeTCduWyf5FKCGzk263xTP6JqXSvJY3NTtqdXpnK/t6Xr8FygcdFvNeG+hCrSuMDpZOgkBQ
 VIZimm1MAfVGQfQY6lqxUmJwNlYxv7u4w68S6WPaBdM+L+c+r7Y1nWYwzKVLAkEeH+WGvgeIDs
 +VcRau2Fw8AY0HKcGCn7+UniBynn9aO6TDqebvmEyQym4dsj9Q72WE8hMrltizVOyiOLCZBm8L
 Nn4=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="160707582"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:30:41 +0800
IronPort-SDR: RHmcMyTBhO6SFgsFqmYMGG1MsthYGqZR9HzqrUGvYmaEj7bIelWUEyDBex4V5n9+aaBHthG0cV
 NbV8qMd2QeKeE/aX2mZd5fgk/lliJerW8NUcErc+blN6j/NExI8gaZ3xB1tQNj5h+2u3i+81z1
 Qz6gKQu/MdwqUA3htr1G8sXJCZ4jtFrg2v1kBRcGxPgIBM2AIp4SgE/La9RsuQ56w782cril7K
 g06npQpP4I4v8TfiJo1GrY8zMf+uMGyx6su7o1XbkSXDUqwnvP1pC+C5GwA4y6BojQ4fXlklgU
 EUB8N/my9hxssgyYz09cxMWE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:12:34 -0800
IronPort-SDR: XcVapXR+FTFouvMjtkXyNGtEZoQ4/OeYHut6QzkpCqn22A0aPMkglZhWJV0PrsS49PgrkbaXz8
 jgPRG6YOj1bfGOB10EUZFlLGi+qlwmLhX54n0G07BWbKY7lFkk1d++3hi81hq4PaBCjAtqtzW0
 iNsufaSonbmjoKQO0JG1YknsAGUQfmepa22CygyFuon2yZiJFGR/hpy2jr043cxfRierFgaPvL
 8J/+kSzZM7MeGiW8zonYaYJfGKhYD7iLRESSnnmSrP/SHNnFVmK1aVQoLw+CkYtlYS7w7JhPTG
 ccg=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:40 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 14/16] riscv: Add Kendryte KD233 board device tree
Date: Tue,  9 Feb 2021 21:30:12 +0900
Message-Id: <20210209123014.165928-15-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073041_693524_EE7AF4F1 
X-CRM114-Status: GOOD (  14.08  )
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

Add the device tree canaan_kd233.dts for the Canaan Kendryte KD233
development board.  This device tree enables LEDs, some gpios and
spi/mmc SD card device. The WS2812B RGB LED and the 10 positions rotary
dip switch present on the board are left undefined.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 172 ++++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/canaan_kd233.dts

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
new file mode 100644
index 000000000000..193792868ef1
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -0,0 +1,172 @@
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
+	model = "Kendryte KD233";
+	compatible = "canaan,kendryte-kd233", "canaan,kendryte-k210";
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
+			gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led1 {
+			gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key0 {
+			label = "KEY0";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
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
+	pinctrl-0 = <&jtag_pinctrl>;
+	pinctrl-names = "default";
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
+	spi0_pinctrl: spi0-pinmux {
+		pinmux = <K210_FPIOA(6, K210_PCF_GPIOHS20)>,  /* cs */
+			 <K210_FPIOA(7, K210_PCF_SPI0_SCLK)>, /* wr */
+			 <K210_FPIOA(8, K210_PCF_GPIOHS21)>;  /* dc */
+	};
+
+	dvp_pinctrl: dvp-pinmux {
+		pinmux = <K210_FPIOA(9, K210_PCF_SCCB_SCLK)>,
+			 <K210_FPIOA(10, K210_PCF_SCCB_SDA)>,
+			 <K210_FPIOA(11, K210_PCF_DVP_RST)>,
+			 <K210_FPIOA(12, K210_PCF_DVP_VSYNC)>,
+			 <K210_FPIOA(13, K210_PCF_DVP_PWDN)>,
+			 <K210_FPIOA(14, K210_PCF_DVP_XCLK)>,
+			 <K210_FPIOA(15, K210_PCF_DVP_PCLK)>,
+			 <K210_FPIOA(17, K210_PCF_DVP_HSYNC)>;
+	};
+
+	gpiohs_pinctrl: gpiohs-pinmux {
+		pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,
+			 <K210_FPIOA(20, K210_PCF_GPIOHS4)>, /* Rot. dip sw line 8 */
+			 <K210_FPIOA(21, K210_PCF_GPIOHS5)>, /* Rot. dip sw line 4 */
+			 <K210_FPIOA(22, K210_PCF_GPIOHS6)>, /* Rot. dip sw line 2 */
+			 <K210_FPIOA(23, K210_PCF_GPIOHS7)>, /* Rot. dip sw line 1 */
+			 <K210_FPIOA(24, K210_PCF_GPIOHS8)>,
+			 <K210_FPIOA(25, K210_PCF_GPIOHS9)>,
+			 <K210_FPIOA(26, K210_PCF_GPIOHS10)>;
+	};
+
+	spi1_pinctrl: spi1-pinmux {
+		pinmux = <K210_FPIOA(29, K210_PCF_SPI1_SCLK)>,
+			 <K210_FPIOA(30, K210_PCF_SPI1_D0)>,
+			 <K210_FPIOA(31, K210_PCF_SPI1_D1)>,
+			 <K210_FPIOA(32, K210_PCF_GPIOHS16)>; /* cs */
+	};
+
+	i2s0_pinctrl: i2s0-pinmux {
+		pinmux = <K210_FPIOA(33, K210_PCF_I2S0_IN_D0)>,
+			 <K210_FPIOA(34, K210_PCF_I2S0_WS)>,
+			 <K210_FPIOA(35, K210_PCF_I2S0_SCLK)>;
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
+&i2s0 {
+	#sound-dai-cells = <1>;
+	pinctrl-0 = <&i2s0_pinctrl>;
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
+		compatible = "ilitek,ili9341";
+		reg = <0>;
+		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+		spi-max-frequency = <15000000>;
+		status = "disabled";
+	};
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pinctrl>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio0 16 GPIO_ACTIVE_LOW>;
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
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
