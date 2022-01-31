Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF8DC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrACtXFq5KWAKU3O0hqVrIhvLgV60xKsHAW8Y3GTzoI=; b=pzdW2JqxRJZogn
	K7lR+9lmiPENCD6ezsRSX0mpZi0z1sFNC68CVyyKNL8z7CgnQWhESqOSfS/VOH0SOlPf+l24BUyCr
	b07C1gRc4CUtvm9nu1aKRmx+GmXk7DN2GpA+7onevKBcAOYcSEFzejsDdk1t5HqcMI/Cp36+VvZWk
	JlMpgKcns0MAGSEsUJwPWOD+qN8qNKwfFpHb5cj74KnYsqR8afwLWxetsgur/xWIkqpmYAXBJaoQ2
	8Sj6hS0LWzWJiu/UGziGPZOITd6uxtbfgNB7P1i8AsJjPzVadqxIOBlRQDAe5e4+2UOkOz5pEwOgj
	D1CYzw5ibMyTkjd6tdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV8p-009CAr-Lr; Mon, 31 Jan 2022 11:46:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV8Y-009Byy-9F
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629583; x=1675165583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOthgSCd3Bm9s6LckIdFEp+aanvwn9CcaGDrPeNHPEM=;
 b=RpgvzT1a7k839LHzCWAP+aXtDnkSEVXziPqT1BdqkorEpvKpugezRCVP
 Y9J0BnMNSqXgTMbnEHPoYyFkv8UfegNUwjrV2kYvTsxB767qBn0ILlk55
 4d7hp4Z9+Fiy+0zNJLhFDPjHm5/3tVomqJjB6bz5N6V+/OoYvTkGdrPwN
 hPquK4yimYHsClSXyt9+gv1xrr9tEPZTWicGHgdi33xIcGrVOkXheOfRn
 KG97QedI64o41IRFGQgr3K6rlVh4lU9drFgxb9X91YJmCtxzVgRgGePYB
 hwrqtz09crV1WFtgkYMvG5u2Ucf505FMmulujEvlBW2gNcbstlyPcbH37 A==;
IronPort-SDR: RaLrxkKUkPHCll75nLy5P2ok0i1QujZBqbOEaX8j+z37FR9cC9NvfVqxelSffWTa1PXA17l++2
 oRCOUSFW3f9ZOvpQlnZ9qTolZUdhnA7cu4OKvBbPqCfqlr8ctWAp68lQhhhNYFhAnRezdClFZp
 qxK/sx3MgjRBz9Bw1Sswv7aC3OI6sQVxdsETSFBYXdM8zRmSJB0lp5N2lVh0T44otUnRkBnt7j
 UFvS3g2EqeSm5HLQxGzt0AJ95lVqjp8s5aXEiycJR7eb4PhgxDeZ5LOiBUuaaWxFr9qXq6Zn1X
 Vhk/r1wJqjcrgY8feeW3+RjO
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="151438476"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:46:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:46:15 -0700
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
Subject: [PATCH v5 09/12] riscv: dts: microchip: refactor icicle kit device
 tree
Date: Mon, 31 Jan 2022 11:47:24 +0000
Message-ID: <20220131114726.973690-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034622_420876_3699C19F 
X-CRM114-Status: UNSURE (   9.89  )
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

Assorted minor changes to the MPFS/Icicle kit device tree:

- rename serial to mmuart to match microchip documentation
- move phy0 inside mac1 node to match phy configuration
- add labels where missing (cpus, cache controller)
- add missing address cells & interrupts to MACs

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 37 ++++++-----
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 65 +++++++++----------
 2 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index ab803f71626a..c51bd7cf500f 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 /dts-v1/;
 
@@ -13,11 +13,11 @@ / {
 	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	aliases {
-		ethernet0 = &emac1;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		serial2 = &serial2;
-		serial3 = &serial3;
+		ethernet0 = &mac1;
+		serial0 = &mmuart0;
+		serial1 = &mmuart1;
+		serial2 = &mmuart2;
+		serial3 = &mmuart3;
 	};
 
 	chosen {
@@ -39,19 +39,19 @@ &refclk {
 	clock-frequency = <600000000>;
 };
 
-&serial0 {
+&mmuart0 {
 	status = "okay";
 };
 
-&serial1 {
+&mmuart1 {
 	status = "okay";
 };
 
-&serial2 {
+&mmuart2 {
 	status = "okay";
 };
 
-&serial3 {
+&mmuart3 {
 	status = "okay";
 };
 
@@ -61,7 +61,10 @@ &mmc {
 	bus-width = <4>;
 	disable-wp;
 	cap-sd-highspeed;
+	cap-mmc-highspeed;
 	card-detect-delay = <200>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
 	sd-uhs-sdr12;
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
@@ -72,22 +75,22 @@ &i2c2 {
 	status = "okay";
 };
 
-&emac0 {
+&mac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
-	phy0: ethernet-phy@8 {
-		reg = <8>;
-		ti,fifo-depth = <0x01>;
-	};
 };
 
-&emac1 {
+&mac1 {
 	status = "okay";
 	phy-mode = "sgmii";
 	phy-handle = <&phy1>;
 	phy1: ethernet-phy@9 {
 		reg = <9>;
-		ti,fifo-depth = <0x01>;
+		ti,fifo-depth = <0x1>;
+	};
+	phy0: ethernet-phy@8 {
+		reg = <8>;
+		ti,fifo-depth = <0x1>;
 	};
 };
 
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c7d73756c9b8..62bd00092bcc 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
@@ -15,7 +15,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -33,7 +33,7 @@ cpu0_intc: interrupt-controller {
 			};
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -60,7 +60,7 @@ cpu1_intc: interrupt-controller {
 			};
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -87,7 +87,7 @@ cpu2_intc: interrupt-controller {
 			};
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -114,7 +114,7 @@ cpu3_intc: interrupt-controller {
 			};
 		};
 
-		cpu@4 {
+		cpu4: cpu@4 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -152,8 +152,9 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
-		cache-controller@2010000 {
+		cctrllr: cache-controller@2010000 {
 			compatible = "sifive,fu540-c000-ccache", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>;
 			cache-block-size = <64>;
 			cache-level = <2>;
 			cache-sets = <1024>;
@@ -161,10 +162,9 @@ cache-controller@2010000 {
 			cache-unified;
 			interrupt-parent = <&plic>;
 			interrupts = <1>, <2>, <3>;
-			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 
-		clint@2000000 {
+		clint: clint@2000000 {
 			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
@@ -174,6 +174,15 @@ clint@2000000 {
 					      <&cpu4_intc 3>, <&cpu4_intc 7>;
 		};
 
+		dma@3000000 {
+			compatible = "sifive,fu540-c000-pdma";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic>;
+			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
+				     <30>;
+			#dma-cells = <1>;
+		};
+
 		plic: interrupt-controller@c000000 {
 			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
@@ -188,15 +197,6 @@ plic: interrupt-controller@c000000 {
 			riscv,ndev = <186>;
 		};
 
-		dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
-			reg = <0x0 0x3000000 0x0 0x8000>;
-			interrupt-parent = <&plic>;
-			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
-				     <30>;
-			#dma-cells = <1>;
-		};
-
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
 			reg = <0x0 0x20002000 0x0 0x1000>;
@@ -204,7 +204,7 @@ clkcfg: clkcfg@20002000 {
 			#clock-cells = <1>;
 		};
 
-		serial0: serial@20000000 {
+		mmuart0: serial@20000000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20000000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -216,7 +216,7 @@ serial0: serial@20000000 {
 			status = "disabled";
 		};
 
-		serial1: serial@20100000 {
+		mmuart1: serial@20100000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20100000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -228,7 +228,7 @@ serial1: serial@20100000 {
 			status = "disabled";
 		};
 
-		serial2: serial@20102000 {
+		mmuart2: serial@20102000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20102000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -240,7 +240,7 @@ serial2: serial@20102000 {
 			status = "disabled";
 		};
 
-		serial3: serial@20104000 {
+		mmuart3: serial@20104000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20104000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -257,37 +257,36 @@ mmc: mmc@20008000 {
 			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
-			interrupts = <88>, <89>;
+			interrupts = <88>;
 			clocks = <&clkcfg CLK_MMC>;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
 
-		emac0: ethernet@20110000 {
+		mac0: ethernet@20110000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupt-parent = <&plic>;
-			interrupts = <64>, <65>, <66>, <67>;
+			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
 			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <0>;
 		};
 
-		emac1: ethernet@20112000 {
+		mac1: ethernet@20112000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20112000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupt-parent = <&plic>;
-			interrupts = <70>, <71>, <72>, <73>;
+			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
-			status = "disabled";
 			clock-names = "pclk", "hclk";
-			#address-cells = <1>;
-			#size-cells = <0>;
+			status = "disabled";
 		};
-
 	};
 };
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
