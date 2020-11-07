Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC07AC388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50EB120704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/WZIYR3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ANaBbwkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50EB120704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nAJcyYBB2VhznibDFS3gqpz3CFLDZzSKahv7jGAeIuc=; b=q/WZIYR3QcPnpD1Wo3e6/hMWS
	ieItbb80N68+IxVQyWys6NZTqpMZOoEhG1cbOk6OTzUYwPgtQIQotyRq0k5bu5l6JRhTHw0806QnQ
	l/s5Esn1HYX9uM/2U2y/SUkKdSs7y3tPR1ihuoYBqkbO+ds03TDfnP1e2k8uxr+F/JatkYgypdYpG
	aFjSiCSZc39S0710VXTWUf4wIpI/lK7BOQPSd/5lvHgSUCTD3wTGPXrG/WlhQq0IxVRwtzbp4EMFN
	vPCwoOlYLmwxNXuwh8u9Mm3GJrPi1IBmvjUbi+V88Vbp6VSrKJff4VlBJQ5aCw12EWEbnp8ADtAxU
	yXZ6GBnZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNz-0001DI-Sp; Sat, 07 Nov 2020 08:15:47 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNl-00013Y-T8
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736933; x=1636272933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ip5ONTi1u2FPwPoLWsA3X1yiaE6lKpzhauKRE7rUPEE=;
 b=ANaBbwkSlgUoI5o2kUQmVHiJhP9k4QjlGOQf7DGUlJYYwS3bqNxaovwb
 j9gK+AzvbPuxEopSbQHdOJJFWsivmlQoV6OYGNSANauwV+Eccs9D/EIax
 J4ELYh+jc5AtEQilehMNW+EFqHsAyp600qnFIEjug4Ojxdnr1eQj936ES
 2GwfvTXS4hS/B4gObim8ZPIlp0JYjXosW28yERm8simiif+0kHA/NRPl9
 kuifP1rHEZlmkwgFWAG6yIIkb/JOJknrIJOhWBAv+SjKFzM2cmgHq2+0k
 vQZWjOT30ZAGYeTq5lJFXfsho1PmWLOQzV0z2S77Sd8wWV/ZLQGwMxV1j g==;
IronPort-SDR: P43bFchFtfbvdGXcV1hK2bkdB5I16J6IjhwxREWq2In4Zs/rEC4omw/zdX1nJHoY4Ot3KyBoWh
 5DnJQ957XUKjlGSCcsCjl6FMR0nXR4OYqls/499i4JoQNGRdc+jz84t4lf3O7D+6EUApww8xpb
 NhyKSQigZtrzDvu/P1yNDUJBjSCH8PyDc8YJNVX6ZQ5aFaASTEnpY1kwcCTKOHYByoPiWmDX98
 tDUd1VP+WZSTaFp1eMI3Nnn8nN/ge0zrq47a3Jjv4ozKrm16IjZnwZtgQEyAB5Ap/eK8LutXXK
 5jo=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079350"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:32 +0800
IronPort-SDR: a/77x5dzYk2TyTN88G2I8ZIWg2ocmP+UabGnViZOEw9tnYvaLA6I19ToZZ5k+kE7kNIg4kUaFq
 wrRUzYlKMhMm1jCRogWplB/e90kBXPzMcn72+aV1ipop3jVCSw3JvqG2U1/AohIYUe4XahiOBv
 KKZnWktfiDFv9pBsvcAjoQ0etTkkTFw38VQTCM5dPelyWYKa0tU7FFmo5dgpWeQL8r2qLW5/uh
 Qka9nbIqv1V1lEifn4J8+z1SrkA3Tbc+M+Q797Aie9jakLo2qRs2WMgE+w7PxGOTWdyoixi9jD
 GLilYxUIPICZiYA/nELUx99O
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:37 -0800
IronPort-SDR: QwjA/r2UeXXlEJzX2W+Brk1cEF+8CVnZOwivgSu4xCQS0RYCagUS2tHvApkc2W51DnklgZokEj
 84etHKVmB2gMEFkliYNKsdkg84r+bT2EwI31elLX5r3s4tmlp3hE8o2fhnkpYo4RLfAjiQ9TAy
 PyGoty3CBtF6wX+4z7DbEc7rfwTB1gaujy+SvazJUBRSQ3rb3PB0BAjYTmvf9IwaePWLkcWQBR
 VlvPT7WRYLheqQ8EWfb3aWkP/ZS2FbBhFfLma7AYEvC9J4uZugd6rZvs1GZmrMKnpSo2djrJz/
 nWU=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:31 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 26/32] riscv: Update Kendryte K210 device tree
Date: Sat,  7 Nov 2020 17:14:14 +0900
Message-Id: <20201107081420.60325-27-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031534_291994_6D48D578 
X-CRM114-Status: GOOD (  20.06  )
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

Update the Kendryte K210 base device tree k210.dtsi to define all
peripherals of the SoC, their clocks and reset lines. The device tree
file k210.dts is renamed to k210_generic.dts and becomes the default
dwivalue selection of the SOC_KENDRYTE_K210_DTB_BUILTIN_SOURCE
configuration option. No device beside the serial console is defined by
this device tree. This makes it suitable for all known K210 boards using
a builtin initramfs.

Most updates to the k210.dtsi file come from Sean Anderson's work on
U-Boot support for the Kendryte K210.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs                       |   2 +-
 arch/riscv/boot/dts/kendryte/k210.dts         |  23 -
 arch/riscv/boot/dts/kendryte/k210.dtsi        | 564 +++++++++++++++++-
 arch/riscv/boot/dts/kendryte/k210_generic.dts |  46 ++
 4 files changed, 583 insertions(+), 52 deletions(-)
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_generic.dts

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 56ba82a64e18..9230af7fb763 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -59,7 +59,7 @@ config SOC_KENDRYTE_K210_DTB_SOURCE
 	string "Source file for the Kendryte K210 builtin DTB"
 	depends on SOC_KENDRYTE
 	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
-	default "k210"
+	default "k210_generic"
 	help
 	  Base name (without suffix, relative to arch/riscv/boot/dts/kendryte)
 	  for the DTS file that will be used to produce the DTB linked into the
diff --git a/arch/riscv/boot/dts/kendryte/k210.dts b/arch/riscv/boot/dts/kendryte/k210.dts
deleted file mode 100644
index 0d1f28fce6b2..000000000000
--- a/arch/riscv/boot/dts/kendryte/k210.dts
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2020 Western Digital Corporation or its affiliates.
- */
-
-/dts-v1/;
-
-#include "k210.dtsi"
-
-/ {
-	model = "Kendryte K210 generic";
-	compatible = "kendryte,k210";
-
-	chosen {
-		bootargs = "earlycon console=ttySIF0";
-		stdout-path = "serial0";
-	};
-};
-
-&uarths0 {
-	status = "okay";
-};
-
diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
index d2d0ff645632..b8706fe78b21 100644
--- a/arch/riscv/boot/dts/kendryte/k210.dtsi
+++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
+ * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
  * Copyright (C) 2020 Western Digital Corporation or its affiliates.
  */
 #include <dt-bindings/clock/k210-clk.h>
+#include <dt-bindings/mfd/k210-sysctl.h>
+#include <dt-bindings/pinctrl/k210-pinctrl.h>
+#include <dt-bindings/reset/k210-rst.h>
 
 / {
 	/*
@@ -15,7 +18,26 @@ / {
 	compatible = "kendryte,k210";
 
 	aliases {
+		cpu0 = &cpu0;
+		cpu1 = &cpu1;
+		dma0 = &dmac0;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1_0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		pinctrl0 = &fpioa;
 		serial0 = &uarths0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		spi3 = &spi3;
+		timer0 = &timer0;
+		timer1 = &timer1;
+		timer2 = &timer2;
 	};
 
 	/*
@@ -30,16 +52,15 @@ cpus {
 		timebase-frequency = <7800000>;
 		cpu0: cpu@0 {
 			device_type = "cpu";
-			reg = <0>;
 			compatible = "kendryte,k210", "sifive,rocket0", "riscv";
-			riscv,isa = "rv64imafdc";
+			reg = <0>;
+			riscv,isa = "rv64imafdgc";
 			mmu-type = "none";
-			i-cache-size = <0x8000>;
 			i-cache-block-size = <64>;
-			d-cache-size = <0x8000>;
+			i-cache-size = <0x8000>;
 			d-cache-block-size = <64>;
-			clocks = <&sysctl K210_CLK_CPU>;
-			clock-frequency = <390000000>;
+			d-cache-size = <0x8000>;
+			clocks = <&sysclk K210_CLK_CPU>;
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				interrupt-controller;
@@ -48,16 +69,15 @@ cpu0_intc: interrupt-controller {
 		};
 		cpu1: cpu@1 {
 			device_type = "cpu";
-			reg = <1>;
 			compatible = "kendryte,k210", "sifive,rocket0", "riscv";
-			riscv,isa = "rv64imafdc";
+			reg = <1>;
+			riscv,isa = "rv64imafdgc";
 			mmu-type = "none";
-			i-cache-size = <0x8000>;
 			i-cache-block-size = <64>;
-			d-cache-size = <0x8000>;
+			i-cache-size = <0x8000>;
 			d-cache-block-size = <64>;
-			clocks = <&sysctl K210_CLK_CPU>;
-			clock-frequency = <390000000>;
+			d-cache-size = <0x8000>;
+			clocks = <&sysclk K210_CLK_CPU>;
 			cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				interrupt-controller;
@@ -68,14 +88,19 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
+		compatible = "kendryte,k210-sram";
 		reg = <0x80000000 0x400000>,
 		      <0x80400000 0x200000>,
 		      <0x80600000 0x200000>;
 		reg-names = "sram0", "sram1", "aisram";
+		clocks = <&sysclk K210_CLK_SRAM0>,
+			 <&sysclk K210_CLK_SRAM1>,
+			 <&sysclk K210_CLK_AI>;
+		clock-names = "sram0", "sram1", "aisram";
 	};
 
 	clocks {
-		in0: oscillator {
+		in0: osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <26000000>;
@@ -89,28 +114,34 @@ soc {
 		ranges;
 		interrupt-parent = <&plic0>;
 
-		sysctl: sysctl@50440000 {
-			compatible = "kendryte,k210-sysctl", "simple-mfd";
-			reg = <0x50440000 0x1000>;
-			#clock-cells = <1>;
+		debug0: debug@0 {
+			compatible = "kendryte,k210-debug", "riscv,debug";
+			reg = <0x0 0x1000>;
+			status = "disabled";
+		};
+
+		rom0: nvmem@1000 {
+			reg = <0x1000 0x1000>;
+			read-only;
+			status = "disabled";
 		};
 
 		clint0: clint@2000000 {
 			#interrupt-cells = <1>;
-			compatible = "riscv,clint0";
+			compatible = "kendryte,k210-clint", "riscv,clint0";
 			reg = <0x2000000 0xC000>;
-			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
-						&cpu1_intc 3 &cpu1_intc 7>;
-			clocks = <&sysctl K210_CLK_ACLK>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>;
+			clocks = <&sysclk K210_CLK_CLINT>;
 		};
 
-		plic0: interrupt-controller@c000000 {
+		plic0: interrupt-controller@C000000 {
 			#interrupt-cells = <1>;
-			interrupt-controller;
-			compatible = "kendryte,k210-plic0", "riscv,plic0";
+			compatible = "kendryte,k210-plic", "riscv,plic0";
 			reg = <0xC000000 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 0xffffffff>,
-					      <&cpu1_intc 11>, <&cpu1_intc 0xffffffff>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>,
+					      <&cpu1_intc 11>;
 			riscv,ndev = <65>;
 			riscv,max-priority = <7>;
 		};
@@ -119,7 +150,484 @@ uarths0: serial@38000000 {
 			compatible = "kendryte,k210-uarths", "sifive,uart0";
 			reg = <0x38000000 0x1000>;
 			interrupts = <33>;
-			clocks = <&sysctl K210_CLK_CPU>;
+			clocks = <&sysclk K210_CLK_CPU>;
+			status = "disabled";
+		};
+
+		gpio0: gpio-controller@38001000 {
+			#interrupt-cells = <2>;
+			#gpio-cells = <2>;
+			compatible = "kendryte,k210-gpiohs", "sifive,gpio0";
+			reg = <0x38001000 0x1000>;
+			interrupt-controller;
+			interrupts = <34 35 36 37 38 39 40 41
+				      42 43 44 45 46 47 48 49
+				      50 51 52 53 54 55 56 57
+				      58 59 60 61 62 63 64 65>;
+			gpio-controller;
+			ngpios = <32>;
+			status = "disabled";
+		};
+
+		kpu0: kpu@40800000 {
+			compatible = "kendryte,k210-kpu";
+			reg = <0x40800000 0xc00000>;
+			interrupts = <25>;
+			clocks = <&sysclk K210_CLK_AI>;
+			status = "disabled";
+		};
+
+		fft0: fft@42000000 {
+			compatible = "kendryte,k210-fft";
+			reg = <0x42000000 0x400000>;
+			interrupts = <26>;
+			clocks = <&sysclk K210_CLK_FFT>;
+			resets = <&sysrst K210_RST_FFT>;
+			status = "disabled";
+		};
+
+		dmac0: dma-controller@50000000 {
+			compatible = "kendryte,k210-dmac", "snps,axi-dma-1.01a";
+			reg = <0x50000000 0x1000>;
+			interrupts = <27 28 29 30 31 32>;
+			clocks = <&sysclk K210_CLK_DMA>, <&sysclk K210_CLK_DMA>;
+			clock-names = "core-clk", "cfgr-clk";
+			resets = <&sysrst K210_RST_DMA>;
+			dma-channels = <6>;
+			snps,dma-masters = <2>;
+			snps,priority = <0 1 2 3 4 5>;
+			snps,data-width = <5>;
+			snps,block-size = <0x200000 0x200000 0x200000
+					   0x200000 0x200000 0x200000>;
+			snps,axi-max-burst-len = <256>;
+			status = "disabled";
+		};
+
+		apb0: bus@50200000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "kendryte,k210-apb", "simple-pm-bus";
+			ranges;
+			clocks = <&sysclk K210_CLK_APB0>;
+
+			gpio1: gpio-controller@50200000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "kendryte,k210-gpio",
+					     "snps,dw-apb-gpio";
+				reg = <0x50200000 0x80>;
+				clocks = <&sysclk K210_CLK_APB0>,
+					 <&sysclk K210_CLK_GPIO>;
+				clock-names = "bus", "db";
+				resets = <&sysrst K210_RST_GPIO>;
+				status = "disabled";
+
+				gpio1_0: gpio1@0 {
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					compatible = "snps,dw-apb-gpio-port";
+					reg = <0>;
+					interrupt-controller;
+					interrupts = <23>;
+					gpio-controller;
+					snps,nr-gpios = <8>;
+				};
+			};
+
+			uart1: serial@50210000 {
+				compatible = "kendryte,k210-uart",
+					     "snps,dw-apb-uart";
+				reg = <0x50210000 0x100>;
+				interrupts = <11>;
+				clocks = <&sysclk K210_CLK_UART1>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "baudclk", "apb_pclk";
+				resets = <&sysrst K210_RST_UART1>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				dcd-override;
+				dsr-override;
+				cts-override;
+				ri-override;
+				status = "disabled";
+			};
+
+			uart2: serial@50220000 {
+				compatible = "kendryte,k210-uart",
+					     "snps,dw-apb-uart";
+				reg = <0x50220000 0x100>;
+				interrupts = <12>;
+				clocks = <&sysclk K210_CLK_UART2>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "baudclk", "apb_pclk";
+				resets = <&sysrst K210_RST_UART2>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				dcd-override;
+				dsr-override;
+				cts-override;
+				ri-override;
+				status = "disabled";
+			};
+
+			uart3: serial@50230000 {
+				compatible = "kendryte,k210-uart",
+					     "snps,dw-apb-uart";
+				reg = <0x50230000 0x100>;
+				interrupts = <13>;
+				clocks = <&sysclk K210_CLK_UART3>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "baudclk", "apb_pclk";
+				resets = <&sysrst K210_RST_UART3>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				dcd-override;
+				dsr-override;
+				cts-override;
+				ri-override;
+				status = "disabled";
+			};
+
+			spi2: spi@50240000 {
+				compatible = "canaan,kendryte-k210-spi",
+					     "snps,dw-apb-ssi-4.01",
+					     "snps,dw-apb-ssi";
+				spi-slave;
+				reg = <0x50240000 0x100>;
+				interrupts = <3>;
+				clocks = <&sysclk K210_CLK_SPI2>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "ssi_clk", "pclk";
+				resets = <&sysrst K210_RST_SPI2>;
+				spi-max-frequency = <25000000>;
+				status = "disabled";
+			};
+
+			i2s0: i2s@50250000 {
+				compatible = "kendryte,k210-i2s",
+					     "snps,designware-i2s";
+				reg = <0x50250000 0x200>;
+				interrupts = <5>;
+				clocks = <&sysclk K210_CLK_I2S0>;
+				clock-names = "i2sclk";
+				resets = <&sysrst K210_RST_I2S0>;
+				status = "disabled";
+			};
+
+			apu0: sound@520250200 {
+				compatible = "kendryte,k210-apu";
+				reg = <0x50250200 0x200>;
+				status = "disabled";
+			};
+
+			i2s1: i2s@50260000 {
+				compatible = "kendryte,k210-i2s",
+					     "snps,designware-i2s";
+				reg = <0x50260000 0x200>;
+				interrupts = <6>;
+				clocks = <&sysclk K210_CLK_I2S1>;
+				clock-names = "i2sclk";
+				resets = <&sysrst K210_RST_I2S1>;
+				status = "disabled";
+			};
+
+			i2s2: i2s@50270000 {
+				compatible = "kendryte,k210-i2s",
+					     "snps,designware-i2s";
+				reg = <0x50270000 0x200>;
+				interrupts = <7>;
+				clocks = <&sysclk K210_CLK_I2S2>;
+				clock-names = "i2sclk";
+				resets = <&sysrst K210_RST_I2S2>;
+				status = "disabled";
+			};
+
+			i2c0: i2c@50280000 {
+				compatible = "kendryte,k210-i2c",
+					     "snps,designware-i2c";
+				reg = <0x50280000 0x100>;
+				interrupts = <8>;
+				clocks = <&sysclk K210_CLK_I2C0>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "ref", "pclk";
+				resets = <&sysrst K210_RST_I2C0>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@50290000 {
+				compatible = "kendryte,k210-i2c",
+					     "snps,designware-i2c";
+				reg = <0x50290000 0x100>;
+				interrupts = <9>;
+				clocks = <&sysclk K210_CLK_I2C1>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "ref", "pclk";
+				resets = <&sysrst K210_RST_I2C1>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@502A0000 {
+				compatible = "kendryte,k210-i2c",
+					     "snps,designware-i2c";
+				reg = <0x502A0000 0x100>;
+				interrupts = <10>;
+				clocks = <&sysclk K210_CLK_I2C2>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "ref", "pclk";
+				resets = <&sysrst K210_RST_I2C2>;
+				status = "disabled";
+			};
+
+			fpioa: pinmux@502B0000 {
+				compatible = "kendryte,k210-fpioa";
+				reg = <0x502B0000 0x100>;
+				clocks = <&sysclk K210_CLK_FPIOA>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "ref", "pclk";
+				resets = <&sysrst K210_RST_FPIOA>;
+				kendryte,sysctl = <&sysctl>;
+				kendryte,power-offset = <K210_SYSCTL_POWER_SEL>;
+				status = "disabled";
+			};
+
+			sha256: sha256@502C0000 {
+				compatible = "kendryte,k210-sha256";
+				reg = <0x502C0000 0x100>;
+				clocks = <&sysclk K210_CLK_SHA>;
+				resets = <&sysrst K210_RST_SHA>;
+				status = "disabled";
+			};
+
+			timer0: timer@502D0000 {
+				compatible = "kendryte,k210-timer",
+					     "snps,dw-apb-timer";
+				reg = <0x502D0000 0x100>;
+				interrupts = <14 15>;
+				clocks = <&sysclk K210_CLK_TIMER0>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER0>;
+				status = "disabled";
+			};
+
+			timer1: timer@502E0000 {
+				compatible = "kendryte,k210-timer",
+					     "snps,dw-apb-timer";
+				reg = <0x502E0000 0x100>;
+				interrupts = <16 17>;
+				clocks = <&sysclk K210_CLK_TIMER1>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER1>;
+				status = "disabled";
+			};
+
+			timer2: timer@502F0000 {
+				compatible = "kendryte,k210-timer",
+					     "snps,dw-apb-timer";
+				reg = <0x502F0000 0x100>;
+				interrupts = <18 19>;
+				clocks = <&sysclk K210_CLK_TIMER2>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER2>;
+				status = "disabled";
+			};
+		};
+
+		apb1: bus@50400000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "kendryte,k210-apb", "simple-pm-bus";
+			ranges;
+			clocks = <&sysclk K210_CLK_APB1>;
+
+			wdt0: watchdog@50400000 {
+				compatible = "kendryte,k210-wdt", "snps,dw-wdt";
+				reg = <0x50400000 0x100>;
+				interrupts = <21>;
+				clocks = <&sysclk K210_CLK_WDT0>,
+					 <&sysclk K210_CLK_APB1>;
+				clock-names = "tclk", "pclk";
+				resets = <&sysrst K210_RST_WDT0>;
+				status = "disabled";
+			};
+
+			wdt1: watchdog@50410000 {
+				compatible = "kendryte,k210-wdt", "snps,dw-wdt";
+				reg = <0x50410000 0x100>;
+				interrupts = <22>;
+				clocks = <&sysclk K210_CLK_WDT1>,
+					 <&sysclk K210_CLK_APB1>;
+				clock-names = "tclk", "pclk";
+				resets = <&sysrst K210_RST_WDT1>;
+				status = "disabled";
+			};
+
+			otp0: nvmem@50420000 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "kendryte,k210-otp";
+				reg = <0x50420000 0x100>,
+				      <0x88000000 0x20000>;
+				reg-names = "reg", "mem";
+				clocks = <&sysclk K210_CLK_ROM>;
+				resets = <&sysrst K210_RST_ROM>;
+				read-only;
+				status = "disabled";
+
+				/* Bootloader */
+				firmware@00000 {
+					reg = <0x00000 0xC200>;
+				};
+
+				/*
+				 * config string as described in RISC-V
+				 * privileged spec 1.9
+				 */
+				config-1-9@1c000 {
+					reg = <0x1C000 0x1000>;
+				};
+
+				/*
+				 * Device tree containing only registers,
+				 * interrupts, and cpus
+				 */
+				fdt@1d000 {
+					reg = <0x1D000 0x2000>;
+				};
+
+				/* CPU/ROM credits */
+				credits@1f000 {
+					reg = <0x1F000 0x1000>;
+				};
+			};
+
+			dvp0: camera@50430000 {
+				compatible = "kendryte,k210-dvp";
+				reg = <0x50430000 0x100>;
+				interrupts = <24>;
+				clocks = <&sysclk K210_CLK_DVP>;
+				resets = <&sysrst K210_RST_DVP>;
+				kendryte,sysctl = <&sysctl>;
+				kendryte,misc-offset = <K210_SYSCTL_MISC>;
+				status = "disabled";
+			};
+
+			sysctl: syscon@50440000 {
+				compatible = "kendryte,k210-sysctl",
+					     "syscon", "simple-mfd";
+				reg = <0x50440000 0x100>;
+				reg-io-width = <4>;
+				clocks = <&sysclk K210_CLK_APB1>;
+				clock-names = "pclk";
+
+				sysclk: clock-controller {
+					#clock-cells = <1>;
+					compatible = "kendryte,k210-clk";
+					clocks = <&in0>;
+				};
+
+				sysrst: reset-controller {
+					compatible = "kendryte,k210-rst",
+						     "syscon-reset";
+					#reset-cells = <1>;
+					regmap = <&sysctl>;
+					offset = <K210_SYSCTL_PERI_RESET>;
+					mask = <0x27FFFFFF>;
+					assert-high = <1>;
+				};
+
+				reboot {
+					compatible = "syscon-reboot";
+					regmap = <&sysctl>;
+					offset = <K210_SYSCTL_SOFT_RESET>;
+					mask = <1>;
+					value = <1>;
+				};
+			};
+
+			aes0: aes@50450000 {
+				compatible = "kendryte,k210-aes";
+				reg = <0x50450000 0x100>;
+				clocks = <&sysclk K210_CLK_AES>;
+				resets = <&sysrst K210_RST_AES>;
+				status = "disabled";
+			};
+
+			rtc: rtc@50460000 {
+				compatible = "kendryte,k210-rtc";
+				reg = <0x50460000 0x100>;
+				clocks = <&in0>;
+				resets = <&sysrst K210_RST_RTC>;
+				interrupts = <20>;
+				status = "disabled";
+			};
+		};
+
+		apb2: bus@52000000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "kendryte,k210-apb", "simple-pm-bus";
+			ranges;
+			clocks = <&sysclk K210_CLK_APB2>;
+
+			spi0: spi@52000000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "canaan,kendryte-k210-spi",
+					     "snps,dw-apb-ssi-4.01",
+					     "snps,dw-apb-ssi";
+				reg = <0x52000000 0x100>;
+				interrupts = <1>;
+				clocks = <&sysclk K210_CLK_SPI0>,
+					 <&sysclk K210_CLK_APB2>;
+				clock-names = "ssi_clk", "pclk";
+				resets = <&sysrst K210_RST_SPI0>;
+				reset-names = "spi";
+				spi-max-frequency = <25000000>;
+				num-cs = <4>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			spi1: spi@53000000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "canaan,kendryte-k210-spi",
+					     "snps,dw-apb-ssi-4.01",
+					     "snps,dw-apb-ssi";
+				reg = <0x53000000 0x100>;
+				interrupts = <2>;
+				clocks = <&sysclk K210_CLK_SPI1>,
+					 <&sysclk K210_CLK_APB2>;
+				clock-names = "ssi_clk", "pclk";
+				resets = <&sysrst K210_RST_SPI1>;
+				reset-names = "spi";
+				spi-max-frequency = <25000000>;
+				num-cs = <4>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			spi3: spi@54000000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "canaan,kendryte-k210-ssi",
+					     "snps,dwc-ssi-1.01a";
+				reg = <0x54000000 0x200>;
+				interrupts = <4>;
+				clocks = <&sysclk K210_CLK_SPI3>,
+					 <&sysclk K210_CLK_APB2>;
+				clock-names = "ssi_clk", "pclk";
+				resets = <&sysrst K210_RST_SPI3>;
+				reset-names = "spi";
+				/* Could possibly go up to 200 MHz */
+				spi-max-frequency = <100000000>;
+				num-cs = <4>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
 		};
 	};
 };
diff --git a/arch/riscv/boot/dts/kendryte/k210_generic.dts b/arch/riscv/boot/dts/kendryte/k210_generic.dts
new file mode 100644
index 000000000000..f336f60dc15d
--- /dev/null
+++ b/arch/riscv/boot/dts/kendryte/k210_generic.dts
@@ -0,0 +1,46 @@
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
+	model = "Kendryte K210 generic";
+	compatible = "kendryte,k210";
+
+	chosen {
+		bootargs = "earlycon console=ttySIF0";
+		stdout-path = "serial0:115200n8";
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
+};
+
+&uarths0 {
+	pinctrl-0 = <&fpioa_uarths>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
