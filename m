Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67964C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7bZafQ+ryAP+O1VyIiu/f98oQeIPfopfeRvQYo0910=; b=O3nFw/lxnjf2B9
	sbCY+yak5eTrNeLJ2UD/LK94v+89t6I81kFWYNR1cqOIrptPyZAeXLkp8kGKZ6XD/g+GXv0Ut253Z
	euSFhnX4O1nCCjhZ7Dgp6uBRIWvF88KaVCrPFFdZ4tI89ygvLuaz7EawGdMpjx/npUeKLP+WIll+n
	W6bYKZIC/b07wwJYhljPgefaTR2OCV1CkbKA83SQ541pa7QUfETLPSq/1S7eht2em2p428rnoSVGz
	Dsjg6qcGvSZj6qc3VR0/LlZjpFrcweriSo52wjXAllU4NZrUkQRS+UEC0g70T8OBnyCuTZd2tgKtn
	TPqNVrWvOzsDCQKJDFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Pqj-00EbBB-GO; Mon, 17 Jan 2022 11:06:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Pqg-00Eb8U-2y
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 11:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642417613; x=1673953613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fNSJRc4zcAnu3goaOseox9vQTabpFxy5Ys0dDRtHxM4=;
 b=luIE5FKmEBCDG20IhzNV1nal3GpyTqgOW9ao+BrUbjTRc1dpbc/ZI4Wd
 BbVs9LJ1AP0wXNM9jwiWaOgPs+KEqpbaHo98D3TsXBDOvU8vB5LoydU90
 SaUwri+Uk9zeWmU39ItsHl8GPe7TJySERkQ88u8MJjBrvgKdpkmC86OoJ
 nR4RKHmKan0ABXL/6UpawQI38yFy6uY2ptWEbuLiuO5QKSwHEoVcAgFmk
 P3mk9Q1QSUv6qXs3dXpTFA6PLiABdJeGnzdLmRmVF8+qnzQS8hzUYpdpZ
 4CPC0xvq+w7ONBd7+pqaIeERmzC2indnuXkrW0mIib32IdDcSleT5zAP5 w==;
IronPort-SDR: cLMSqGkNuMDrlafdyzPs5GyTZhqofsJlyA8jVSbw5mGNvIOpIRQmpEnQs7BYfnP81j0U4Bywph
 pXTqwNw4mWNBDOVEd0PfNC4XcCAbbn5pWMZer11gTOGnTfyzdIu4FmtXPSzTcpA/z3BBfyXmmE
 nJjbHfIoSAYI0lgs1FE6wp65bOUt3XmLrgA/4SOuw83/EixQ0acGthpkOnLGeMCNgiqvWRcoSv
 J0RcCg886TsPN+K/u3Io7bI/S3s3eXIwdlb46bsWw3ME3792Kiv7U0NpHJNMnm7X6LJbWRxTId
 J0idIgOgvUbnOHJj6DTnRYtO
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="82713540"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jan 2022 04:06:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:06:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 17 Jan 2022 04:06:45 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v4 09/14] riscv: dts: microchip: use clk defines for icicle kit
Date: Mon, 17 Jan 2022 11:07:50 +0000
Message-ID: <20220117110755.3433142-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_030654_228586_6AB174D7 
X-CRM114-Status: UNSURE (   8.54  )
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
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
