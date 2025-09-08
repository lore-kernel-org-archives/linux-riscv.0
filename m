Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5698ECAC58B
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5qTyuz7OtDq+H0u6ccmDffD0o6yBGwpCUUhG9IoPlQ=; b=r3FT86/hk7cvXe
	LDj0J2EyZAO+QkzyrnS3heIXJw3QYFEUDuw7wWrTuFwmxoOgJSsR/ElW14t551WCrEn8QlHfUJXAj
	5Dn/Dlm3BpJGYS5FcNGeE+UPJhs9LJhqYd0YyQ7Fjq3ebpAOuwKxgzExBplYW+ZPJQrik8io7n031
	hYNBtO1O988TlJXRAFrFcteEfv8dl/y4XE22MthmqFGlt+7hhJ9Wy7BaP7UVGtDW/ZrocuphFjUEW
	9CGOz+t41iizBEjEcFB78heE24vestTlAy92R0nsizCOK0dpQfRTtHaZqHbVgzChDFcGDxihjNfIi
	tfOkKwI9/wMGEfq0jkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbNP-0000000HArx-3Hy8;
	Mon, 08 Sep 2025 12:53:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaMn-0000000Gljb-3QuX
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 11:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757332141; x=1788868141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fKTa6YCaaBumc82npv2gUD3y7Mci5DJDAQ4IQFBtl2k=;
  b=Zyfg24h1KSGXaEKx3PdekjLwE00XQUcpDGn3Bx0gZsjSqxtRCXQ7AbDn
   bs7vW1aRpf3tAjR03+QfhTxkCW2SA1q9WNb24drxKae9tKZZzKxrk5PKb
   i9UehfHQHhd4iv7kldQ7t1M//KZjXiwM7PPgC6GeCC7ZiXWVrpoCdviJE
   S9qAJ13ICVRIhTh+QbkWCx8lZREK+WajYXqH6N1PWSx2uP8QMyJjQj7s/
   K8CkryDiJ0FcHUn/ULNuBdvF9Zsz32gbtvFSGy7muF0B1XYdgrSb3Efnz
   DTEixuIrSoF5hP1lyaTW85PdPYMmcBVNpi6igxWT4LYz3hNUqxMylVfh3
   A==;
X-CSE-ConnectionGUID: vDOPHTnsQiaqmkXt9yltVw==
X-CSE-MsgGUID: 1LiFos11Rp2I2DFuSCaZqA==
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="45634882"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Sep 2025 04:48:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Sep 2025 04:48:51 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Sep 2025 04:48:48 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 6/6] riscv: dts: microchip: add a device tree for Discovery Kit
Date: Mon, 8 Sep 2025 12:57:32 +0100
Message-ID: <20250908115732.31092-7-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
References: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_044901_922576_9AA20983 
X-CRM114-Status: GOOD (  13.72  )
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

Add a minimal device tree for the Microchip PolarFire SoC Discovery Kit.
The Discovery Kit is a cost-optimized board based on PolarFire SoC
MPFS095T and features:

- 1 GB DDR4x16
- 1x Gigabit Ethernet
- 3x UARTs
- Raspberry Pi connector
- mikroBus connector
- microSD card connector

Link: https://www.microchip.com/en-us/development-tool/mpfs-disco-kit
Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 arch/riscv/boot/dts/microchip/Makefile        |   1 +
 .../dts/microchip/mpfs-disco-kit-fabric.dtsi  |  58 ++++++
 .../boot/dts/microchip/mpfs-disco-kit.dts     | 190 ++++++++++++++++++
 3 files changed, 249 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 1e2f4e41bf0d..345ed7a48cc1 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-disco-kit.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit-prod.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
new file mode 100644
index 000000000000..ae8be7d6f392
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2025 Microchip Technology Inc */
+
+/ {
+	core_pwm0: pwm@40000000 {
+		compatible = "microchip,corepwm-rtl-v4";
+		reg = <0x0 0x40000000 0x0 0xF0>;
+		microchip,sync-update-mask = /bits/ 32 <0>;
+		#pwm-cells = <3>;
+		clocks = <&ccc_sw CLK_CCC_PLL0_OUT3>;
+		status = "disabled";
+	};
+
+	i2c2: i2c@40000200 {
+		compatible = "microchip,corei2c-rtl-v7";
+		reg = <0x0 0x40000200 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&ccc_sw CLK_CCC_PLL0_OUT3>;
+		interrupt-parent = <&plic>;
+		interrupts = <122>;
+		clock-frequency = <100000>;
+		status = "disabled";
+	};
+
+	ihc: mailbox {
+		compatible = "microchip,sbi-ipc";
+		interrupt-parent = <&plic>;
+		interrupts = <180>, <179>, <178>, <177>;
+		interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
+		#mbox-cells = <1>;
+		status = "disabled";
+	};
+
+	mailbox@50000000 {
+		compatible = "microchip,miv-ihc-rtl-v2";
+		reg = <0x0 0x50000000 0x0 0x1c000>;
+		interrupt-parent = <&plic>;
+		interrupts = <180>, <179>, <178>, <177>;
+		interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
+		#mbox-cells = <1>;
+		microchip,ihc-chan-disabled-mask = /bits/ 16 <0>;
+		status = "disabled";
+	};
+
+	refclk_ccc: clock-cccref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+};
+
+&ccc_sw {
+	clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
+		 <&refclk_ccc>, <&refclk_ccc>;
+	clock-names = "pll0_ref0", "pll0_ref1", "pll1_ref0", "pll1_ref1",
+		      "dll0_ref", "dll1_ref";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
new file mode 100644
index 000000000000..c068b9bb5bfd
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2025 Microchip Technology Inc */
+
+/dts-v1/;
+
+#include "mpfs.dtsi"
+#include "mpfs-disco-kit-fabric.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Microchip PolarFire-SoC Discovery Kit";
+	compatible = "microchip,mpfs-disco-kit-reference-rtl-v2507",
+		     "microchip,mpfs-disco-kit",
+		     "microchip,mpfs";
+
+	aliases {
+		ethernet0 = &mac0;
+		serial4 = &mmuart4;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led1";
+		};
+
+		led-2 {
+			gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led2";
+		};
+
+		led-3 {
+			gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led3";
+		};
+
+		led-4 {
+			gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led4";
+		};
+
+		led-5 {
+			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led5";
+		};
+
+		led-6 {
+			gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led6";
+		};
+
+		led-7 {
+			gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led7";
+		};
+
+		led-8 {
+			gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led8";
+		};
+	};
+
+	ddrc_cache_lo: memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hss_payload: region@bfc00000 {
+			reg = <0x0 0xbfc00000 0x0 0x400000>;
+			no-map;
+		};
+	};
+};
+
+&core_pwm0 {
+	status = "okay";
+};
+
+&gpio1 {
+	interrupts = <27>, <28>, <29>, <30>,
+		     <31>, <32>, <33>, <47>,
+		     <35>, <36>, <37>, <38>,
+		     <39>, <40>, <41>, <42>,
+		     <43>, <44>, <45>, <46>,
+		     <47>, <48>, <49>, <50>;
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
+&i2c2 {
+	status = "okay";
+};
+
+&ihc {
+	status = "okay";
+};
+
+&mac0 {
+	phy-mode = "sgmii";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	phy0: ethernet-phy@b {
+		reg = <0xb>;
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
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	no-1-8-v;
+	status = "okay";
+};
+
+&mmuart1 {
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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
