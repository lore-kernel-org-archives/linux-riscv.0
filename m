Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C76C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/bMcx7yVG7yL02BB3k/7LlHBq1ik++Kkrws7bgZdkk=; b=4dx8M8hd6i/8el
	tcs2ce726suPQM+wekAVbKzFJP8cTRgYkBWIwRorvNDDwMz5GkMgkPfQjThhN8yM6oZRPfc8I62bN
	rof2hPpdtRJjtJ2e5IHZuVKTl5AWIEbp40OBrCHeDQtarG46OLFIxRDoPAXOL/L0Cm8bjrd3J7/pu
	vuKhe9FDg2KYeAaak2fFgdT35DfTUbDA4mW6LYR0VEvBl2yOCvx4CpW08pUW3bkHdkNs1tzF//EZQ
	ehIVM2NZaA1ujPXyj1gckv0jnO8e3icXhQRM4Up7foTovKZ7nS1ArKV4qBR2g+ANrA60MKmJsHMAK
	ZRjNr5ww3osFVnesQ2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ozt-0049Lg-Hi; Fri, 08 Jul 2022 14:30:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ozl-0049Gb-RG
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 14:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657290613; x=1688826613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yF1NojDTOGwCGkFGTDOFrruBHppEMQq5PgQMjxraLpE=;
  b=hHUFzxmcx17bCG694GxZtwnH+EJJ1Gw8WFdjw1DAVYqdGwXGPQJqJfYo
   IvT/M8BMKcRq0EdV/opfPoojYf//Ozj3WSHo41AjKKk4jrTMwt4hD2SQf
   y2Hd6MWuuAUrYhlKFadOUkTmhcWLkoPEk/NqYROhNghRbGZtXUTrnO1F6
   bTLifMF0iLPc1PEqX15xAptGs5T5W5l+2B2l2rn/39HKBdG3lxoZ/LWcW
   xTI1ESJ+upjzT/D4KmFqOlNFxBSTCsjpmn4cqr9RTacI68PQDUseeiWfw
   zD7F/Opr2t4UrYFuPo8r6axbQOapMHJFw4uNbKjLduxsONbtxylta0sH3
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="103658958"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 07:30:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 07:30:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 07:30:06 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 2/4] riscv: dts: fix the icicle's #pwm-cells
Date: Fri, 8 Jul 2022 15:29:36 +0100
Message-ID: <20220708142937.1120121-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708142937.1120121-1-conor.dooley@microchip.com>
References: <20220708142937.1120121-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_073014_037012_19979642 
X-CRM114-Status: GOOD (  14.70  )
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

\#pwm-cells for the Icicle kit's fabric PWM was incorrectly set to 2 &
blindly overridden by the (out of tree) driver anyway. The core can
support inverted operation, so update the entry to correctly report its
capabilities.

Fixes: 72560c6559b8 ("riscv: dts: microchip: add fpga fabric section to icicle kit")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |   2 +-
 .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  18 ++
 .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 185 ++++++++++++++++++
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 0d28858b83f2..e09a13aef268 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -8,7 +8,7 @@ core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x41000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
-		#pwm-cells = <2>;
+		#pwm-cells = <3>;
 		clocks = <&fabric_clk3>;
 		status = "disabled";
 	};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
new file mode 100644
index 000000000000..98f642e83ad4
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2022 Microchip Technology Inc */
+
+// #include "dt-bindings/mailbox/miv-ihc.h"
+
+/ {
+	fabric_clk3: fabric-clk3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <62500000>;
+	};
+
+	fabric_clk1: fabric-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
new file mode 100644
index 000000000000..0b664c591255
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Original all-in-one devicetree:
+ * Copyright (C) 2020-2022 - Aldec
+ * Rewritten to use includes:
+ * Copyright (C) 2022 - Conor Dooley <conor.dooley@microchip.com>
+ */
+
+/dts-v1/;
+
+#include "mpfs.dtsi"
+#include "mpfs-tysom-m-fabric.dtsi"
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define MTIMER_FREQ		1000000
+
+/ {
+	model = "Aldec TySOM-M-MPFS250T";
+	compatible = "aldec,tysom-m-mpfs250t", "microchip,mpfs";
+
+	aliases {
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
+		serial0 = &mmuart0;
+		serial1 = &mmuart1;
+		serial2 = &mmuart2;
+		serial3 = &mmuart3;
+		serial4 = &mmuart4;
+		gpio0 = &gpio0;
+		gpio1 = &gpio2;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <MTIMER_FREQ>;
+	};
+
+	ddrc_cache_lo: memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x2e000000>;
+		status = "okay";
+	};
+
+	ddrc_cache_hi: memory@1000000000 {
+		device_type = "memory";
+		reg = <0x10 0x00000000 0x0 0x40000000>;
+		status = "okay";
+	};
+
+	soc {
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		status = "okay";
+
+		led0 {
+			gpios = <&gpio1 23 1>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	ina219: ina219@45 {
+		status = "okay";
+		compatible = "ti,ina219";
+		reg = <0x45>;
+		shunt-resistor = <0x7d0>;
+	};
+};
+
+&gpio1 {
+	interrupts = <27 28 29 30 31 32 33 47 35 36 37 38 39 40 41 42 43 44 45 46 34 48 49 50>;
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy0>;
+
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+		ti,fifo-depth = <0x01>;
+	};
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		ti,fifo-depth = <0x01>;
+	};
+};
+
+&mbox {
+	status = "okay";
+};
+
+&mmc {
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&mmuart1 {
+	status = "okay";
+};
+
+&mmuart2 {
+	status = "okay";
+};
+
+&mmuart3 {
+	status = "okay";
+};
+
+&mmuart4 {
+	status = "okay";
+};
+
+&refclk {
+	clock-frequency = <125000000>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+	pseFlash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "n25q128a11", "jedec,spi-nor";
+		status = "okay";
+		reg = <0x0>;
+		spi-max-frequency = <10000000>;
+
+		partition@test-0 { /* test purposes */
+			label = "qspi-test-0";
+			reg = <0x00000000 0x00800000>;
+		};
+		partition@test-1 { /* test purposes */
+			label = "qspi-test-1";
+			reg = <0x00800000 0x00800000>;
+		};
+		partition@test-2 { /* test purposes */
+			label = "qspi-test-2";
+			reg = <0x01000000 0x00800000>;
+		};
+		partition@test-3 { /* test purposes */
+			label = "qspi-test-3";
+			reg = <0x01800000 0x00800000>;
+		};
+	};
+};
+
+&syscontroller {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
