Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D00C4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8K6jD/7Y0NeVMauLhcwbu9MDhixwukr4f1v0+OJDSY=; b=CJrvxxYqsddy2G
	je7Z5ZctCwPBdfM1FpaoFB7fhvwLAciHy5WYbiyJzcGvqSolyqJ96bijKFHThsU2pN6kqCt4mhHJI
	bFtbbv0hmMyy3X4/HbfLEnl9TA3i6mjP6MTMAmV5w06Ofp/XgoooIZZrQpZd3UA+Jt6YfufbGFFz2
	PjwjtiaGW2+f0dMmpomsHCtaFrkGO77LFgvJ/u1UfSPCPkXUFLCot4R4FsuowLDFzM8QvHwwEpmL4
	ir1TJtGO2qvcyMrCUm8e58ZVmGvXRO3YwMerai8H6fu0Z90GhcqsMo2a5wlrvJzx46zzYGzDNY0ew
	y+hkdAXuazI2bhmHhO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV8X-009By4-81; Mon, 31 Jan 2022 11:46:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV8O-009Bt1-6C
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629573; x=1675165573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=loc1mjnC0KEhFiODIronkEoRvyEPmS9vWl4HbH8j1hE=;
 b=UH64iDNv4f2XsQMxHSyobCYnwFZhoR9SccjAX29hgUc2IiSFxH+mxjWx
 bMTnPDfFHG6b7n+ATCSuJv0JKsVKQ21N79095Gs14wvDM/ZDn1xGkBPiK
 WjvoS49M0JsyYaIdc9ARHeh0KGcr+s42bjHa8Dmua1GmN2VyeHkLKrHQi
 HBEVeRaMsR/ve6kj2+Fw72y+dbpzjfkC3HBOrTY9hnCdfvg/EVAE2IgDg
 57T2XRnNscnd1x4RacoaoAcjPXe5EwHxn9Yzrjr9MgZ3QyZvp/i3B8IcD
 EkRqkwZGQ3AwuwJhtT2t6pVdBllXXYln3HS7Lwnc6LqdBy3/L8ulg9e69 g==;
IronPort-SDR: gjiTRefpxAlNqXFXN5BwXRNYnAV8z7E0FTb/q8nTophRWt1Mlxru8OWy5jPLSsePGXgYV89qpl
 aqxcmG6kGHPcToIdC5xPtZHQcWaOYfwBbQ71IiYd2/0AAdcsQScV9ECTsTKBzbFiMtCQqXbqpt
 sXpu53JG+pItV0Nt+qs7YpY2YRpDJmp4cIxdIrmDI6VN7dK9XjMigrLxJqqbDacdXnoD10QCvS
 LhTm9lt1Krv92E54Q9FbjTQ5CS/imlXWUVg5aq3yYrcRWjBSXHuAEEl26XRKQEUVd6d5Mzwd1I
 GyGo7VSjjJ0sj/Q21sia1tul
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="151438460"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:46:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:09 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:46:04 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>, 
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: [PATCH v5 07/12] riscv: dts: microchip: use clk defines for icicle kit
Date: Mon, 31 Jan 2022 11:47:22 +0000
Message-ID: <20220131114726.973690-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034612_308068_B8EF0359 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

Update the Microchip Icicle kit device tree by replacing clock
related magic numbers with their defined counterparts.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   |  2 +-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 25 ++++++++++---------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 0c748ae1b006..6d19ba196f12 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -31,7 +31,7 @@ cpus {
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x40000000>;
-		clocks = <&clkcfg 26>;
+		clocks = <&clkcfg CLK_DDRC>;
 	};
 };
 
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 869aaf0d5c06..717e39b30a15 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -2,6 +2,7 @@
 /* Copyright (c) 2020 Microchip Technology Inc */
 
 /dts-v1/;
+#include "dt-bindings/clock/microchip,mpfs-clock.h"
 
 / {
 	#address-cells = <2>;
@@ -14,7 +15,6 @@ cpus {
 		#size-cells = <0>;
 
 		cpu@0 {
-			clock-frequency = <0>;
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -22,6 +22,7 @@ cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			clocks = <&clkcfg CLK_CPU>;
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -32,7 +33,6 @@ cpu0_intc: interrupt-controller {
 		};
 
 		cpu@1 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -48,6 +48,7 @@ cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -59,7 +60,6 @@ cpu1_intc: interrupt-controller {
 		};
 
 		cpu@2 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -75,6 +75,7 @@ cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -86,7 +87,6 @@ cpu2_intc: interrupt-controller {
 		};
 
 		cpu@3 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -102,6 +102,7 @@ cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -113,7 +114,6 @@ cpu3_intc: interrupt-controller {
 		};
 
 		cpu@4 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -129,6 +129,7 @@ cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 			cpu4_intc: interrupt-controller {
@@ -210,7 +211,7 @@ serial0: serial@20000000 {
 			interrupt-parent = <&plic>;
 			interrupts = <90>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 8>;
+			clocks = <&clkcfg CLK_MMUART0>;
 			status = "disabled";
 		};
 
@@ -222,7 +223,7 @@ serial1: serial@20100000 {
 			interrupt-parent = <&plic>;
 			interrupts = <91>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 9>;
+			clocks = <&clkcfg CLK_MMUART1>;
 			status = "disabled";
 		};
 
@@ -234,7 +235,7 @@ serial2: serial@20102000 {
 			interrupt-parent = <&plic>;
 			interrupts = <92>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 10>;
+			clocks = <&clkcfg CLK_MMUART2>;
 			status = "disabled";
 		};
 
@@ -246,7 +247,7 @@ serial3: serial@20104000 {
 			interrupt-parent = <&plic>;
 			interrupts = <93>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 11>;
+			clocks = <&clkcfg CLK_MMUART3>;
 			status = "disabled";
 		};
 
@@ -256,7 +257,7 @@ mmc: mmc@20008000 {
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>, <89>;
-			clocks = <&clkcfg 6>;
+			clocks = <&clkcfg CLK_MMC>;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
@@ -267,7 +268,7 @@ emac0: ethernet@20110000 {
 			interrupt-parent = <&plic>;
 			interrupts = <64>, <65>, <66>, <67>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg 4>, <&clkcfg 2>;
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
 			status = "disabled";
 			#address-cells = <1>;
@@ -280,7 +281,7 @@ emac1: ethernet@20112000 {
 			interrupt-parent = <&plic>;
 			interrupts = <70>, <71>, <72>, <73>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg 5>, <&clkcfg 2>;
+			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			status = "disabled";
 			clock-names = "pclk", "hclk";
 			#address-cells = <1>;
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
