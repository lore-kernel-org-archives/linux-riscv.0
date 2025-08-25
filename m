Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93808CA0FED
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5/p7JXujCkGZeKuzFR3YQyfo0qcYLHK9mW6eiGRu/c=; b=QqXTDH1zUrTckd
	8TTAZSobaCCsNvi8SnK99Mq+X230ox1pS8j5CWJflUFRzv1HvMESdqHoEIalHa/T5lZKzVptb4jfI
	LCd+Vr8lyT+TGXrtYaSu+kNYGCkdmMQBwgwG3c7xV2NBOfPU0rC7hgpWMowX2t9//MZCjjZ0kSLqn
	mFqnHD1gDfRd00+V9Q7tuKmePOa36134moGFlqlMR+7RxhUEU4r7A5FP4pa00P87nmIqLWVd8JNpa
	AM9UwWflWorY1v7TkNfbV0zvbVsQki0UWN6szbgDHOMrWJEY3rDJNhR4I1y6HnOuh4/uZ4cnb6pRw
	ZES+SZbCFi73T1hfMlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYx-00000008kg8-3fc4;
	Mon, 25 Aug 2025 17:00:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZw8-00000008dmj-2pE2
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 16:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756138848; x=1787674848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TB1dOd76PEJ5mgVTi3H1IPzDArXUmTgjE1tKSSsdtws=;
  b=ExmimHbCGRwLj57VBMSqw8wZwwRtEZaw/1d2bQFHglZE0nmFci8Ndp4z
   waxye1DyC5ueRq+c3oGXAdIRSwoUaC3kSpSduftTjwWAV68MtleCNXrm6
   LdewRMNCzyYhLYbefwDgSa1JuZ/xFqd3vbcQnJlyZnNmVxe3T/cre6ozn
   JzmoWRbJk68n8i1ib9+P2h12AqzEboT4YLOzPqFZIGze3dm2VAwwcJfyF
   PDYG2I+aGrtTgAqOlAqDZgKR9OSlsGZLAiH4vR0OuNeDvRY4r/otfekR+
   t3opmQwU18P6ymIxs4UYxztkuj/MqNXU4JOBKZzD63UaxQYw5SNBDziwq
   A==;
X-CSE-ConnectionGUID: 9JmLn3EoSSGJz16GI5swOw==
X-CSE-MsgGUID: 9YutzzChQSGv5z3j1Xc0zA==
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="46199258"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 09:20:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 09:20:45 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 25 Aug 2025 09:20:42 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v1 1/5] riscv: dts: microchip: add common board dtsi for icicle kit variants
Date: Mon, 25 Aug 2025 17:19:48 +0100
Message-ID: <20250825161952.3902672-2-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
References: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_092048_780791_FAD0E071 
X-CRM114-Status: GOOD (  16.58  )
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

In preparation for supporting the Icicle Kit with production silicon,
add a common board dtsi for the icicle kit with hardware shared by both
the engineering sample and production versions.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 .../dts/microchip/mpfs-icicle-kit-common.dtsi | 247 ++++++++++++++++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 241 +----------------
 2 files changed, 248 insertions(+), 240 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
new file mode 100644
index 000000000000..eafea3b69cd7
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2025 Microchip Technology Inc */
+
+/dts-v1/;
+
+#include "mpfs.dtsi"
+#include "mpfs-icicle-kit-fabric.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		ethernet0 = &mac1;
+		serial0 = &mmuart0;
+		serial1 = &mmuart1;
+		serial2 = &mmuart2;
+		serial3 = &mmuart3;
+		serial4 = &mmuart4;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led1";
+		};
+
+		led-2 {
+			gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led2";
+		};
+
+		led-3 {
+			gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led3";
+		};
+
+		led-4 {
+			gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led4";
+		};
+	};
+
+	ddrc_cache_lo: memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+		status = "okay";
+	};
+
+	ddrc_cache_hi: memory@1040000000 {
+		device_type = "memory";
+		reg = <0x10 0x40000000 0x0 0x40000000>;
+		status = "okay";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hss_payload: region@BFC00000 {
+			reg = <0x0 0xBFC00000 0x0 0x400000>;
+			no-map;
+		};
+	};
+};
+
+&core_pwm0 {
+	status = "okay";
+};
+
+&gpio2 {
+	interrupts = <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	power-monitor@10 {
+		compatible = "microchip,pac1934";
+		reg = <0x10>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <0x1>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDREG";
+		};
+
+		channel@2 {
+			reg = <0x2>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDA25";
+		};
+
+		channel@3 {
+			reg = <0x3>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDD25";
+		};
+
+		channel@4 {
+			reg = <0x4>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDA_REG";
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&mac0 {
+	phy-mode = "sgmii";
+	phy-handle = <&phy0>;
+	status = "okay";
+};
+
+&mac1 {
+	phy-mode = "sgmii";
+	phy-handle = <&phy1>;
+	status = "okay";
+
+	phy1: ethernet-phy@9 {
+		reg = <9>;
+	};
+
+	phy0: ethernet-phy@8 {
+		reg = <8>;
+	};
+};
+
+&mbox {
+	status = "okay";
+};
+
+&mmc {
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
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
+&pcie {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+};
+
+&refclk {
+	clock-frequency = <125000000>;
+};
+
+&refclk_ccc {
+	clock-frequency = <50000000>;
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
+};
+
+&syscontroller {
+	status = "okay";
+};
+
+&syscontroller_qspi {
+	/*
+	 * The flash *is* there, but Icicle kits that have engineering sample
+	 * silicon (write?) access to this flash to non-functional. The system
+	 * controller itself can actually access it, but the MSS cannot write
+	 * an image there. Instantiating a coreQSPI in the fabric & connecting
+	 * it to the flash instead should work though. Pre-production or later
+	 * silicon does not have this issue.
+	 */
+	status = "disabled";
+
+	sys_ctrl_flash: flash@0 { // MT25QL01GBBB8ESF-0SIT
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+	};
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index f80df225f72b..2cb08ed0946d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -3,249 +3,10 @@
 
 /dts-v1/;
 
-#include "mpfs.dtsi"
-#include "mpfs-icicle-kit-fabric.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
+#include "mpfs-icicle-kit-common.dtsi"
 
 / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-reference-rtlv2210", "microchip,mpfs-icicle-kit",
 		     "microchip,mpfs";
-
-	aliases {
-		ethernet0 = &mac1;
-		serial0 = &mmuart0;
-		serial1 = &mmuart1;
-		serial2 = &mmuart2;
-		serial3 = &mmuart3;
-		serial4 = &mmuart4;
-	};
-
-	chosen {
-		stdout-path = "serial1:115200n8";
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led-1 {
-			gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_RED>;
-			label = "led1";
-		};
-
-		led-2 {
-			gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_RED>;
-			label = "led2";
-		};
-
-		led-3 {
-			gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_AMBER>;
-			label = "led3";
-		};
-
-		led-4 {
-			gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_AMBER>;
-			label = "led4";
-		};
-	};
-
-	ddrc_cache_lo: memory@80000000 {
-		device_type = "memory";
-		reg = <0x0 0x80000000 0x0 0x40000000>;
-		status = "okay";
-	};
-
-	ddrc_cache_hi: memory@1040000000 {
-		device_type = "memory";
-		reg = <0x10 0x40000000 0x0 0x40000000>;
-		status = "okay";
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		hss_payload: region@BFC00000 {
-			reg = <0x0 0xBFC00000 0x0 0x400000>;
-			no-map;
-		};
-	};
-};
-
-&core_pwm0 {
-	status = "okay";
-};
-
-&gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
-	status = "okay";
-};
-
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-
-	power-monitor@10 {
-		compatible = "microchip,pac1934";
-		reg = <0x10>;
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		channel@1 {
-			reg = <0x1>;
-			shunt-resistor-micro-ohms = <10000>;
-			label = "VDDREG";
-		};
-
-		channel@2 {
-			reg = <0x2>;
-			shunt-resistor-micro-ohms = <10000>;
-			label = "VDDA25";
-		};
-
-		channel@3 {
-			reg = <0x3>;
-			shunt-resistor-micro-ohms = <10000>;
-			label = "VDD25";
-		};
-
-		channel@4 {
-			reg = <0x4>;
-			shunt-resistor-micro-ohms = <10000>;
-			label = "VDDA_REG";
-		};
-	};
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&mac0 {
-	phy-mode = "sgmii";
-	phy-handle = <&phy0>;
-	status = "okay";
-};
-
-&mac1 {
-	phy-mode = "sgmii";
-	phy-handle = <&phy1>;
-	status = "okay";
-
-	phy1: ethernet-phy@9 {
-		reg = <9>;
-	};
-
-	phy0: ethernet-phy@8 {
-		reg = <8>;
-	};
-};
-
-&mbox {
-	status = "okay";
-};
-
-&mmc {
-	bus-width = <4>;
-	disable-wp;
-	cap-sd-highspeed;
-	cap-mmc-highspeed;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	sd-uhs-sdr12;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
-
-&mmuart1 {
-	status = "okay";
-};
-
-&mmuart2 {
-	status = "okay";
-};
-
-&mmuart3 {
-	status = "okay";
-};
-
-&mmuart4 {
-	status = "okay";
-};
-
-&pcie {
-	status = "okay";
-};
-
-&qspi {
-	status = "okay";
-};
-
-&refclk {
-	clock-frequency = <125000000>;
-};
-
-&refclk_ccc {
-	clock-frequency = <50000000>;
-};
-
-&rtc {
-	status = "okay";
-};
-
-&spi0 {
-	status = "okay";
-};
-
-&spi1 {
-	status = "okay";
-};
-
-&syscontroller {
-	status = "okay";
-};
-
-&syscontroller_qspi {
-	/*
-	 * The flash *is* there, but Icicle kits that have engineering sample
-	 * silicon (write?) access to this flash to non-functional. The system
-	 * controller itself can actually access it, but the MSS cannot write
-	 * an image there. Instantiating a coreQSPI in the fabric & connecting
-	 * it to the flash instead should work though. Pre-production or later
-	 * silicon does not have this issue.
-	 */
-	status = "disabled";
-
-	sys_ctrl_flash: flash@0 { // MT25QL01GBBB8ESF-0SIT
-		compatible = "jedec,spi-nor";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		spi-max-frequency = <20000000>;
-		spi-rx-bus-width = <1>;
-		reg = <0>;
-	};
-};
-
-&usb {
-	status = "okay";
-	dr_mode = "host";
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
