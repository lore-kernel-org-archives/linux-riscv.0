Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10857CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mj0woGL/EhzJTYxk90sFWZU1Ld8nHKQgk0psnn/UulE=; b=HO7B+uSp7jjf8+
	SIFNxfXu4Onx/5DHF0gKNvdgGFWXzkrq287RjN23DbF+GXt92fZK0+KTlZWxpDX34wA7mpgrX90bF
	5kRESRyE5SkH9usmcb3oWe6ryH0Op4/F30XYu+ZcXHcEHP6c/ZDeuQzrl4KE/o65BWka9MW0K61B/
	80Q9wu/HogquGRs1lwrDxjctkSuFFqruS2PptR9dimHsRVf9tFgmrLP9ONWlLbPbrfWv0dbx4wZtn
	vmK3QS2O1TSZs9S8+DwBLqW8J0R4D2uuFyLs+HZkTtQGaacIP6lsWSuJX/Qu4eQcxuTLxlJ3s4hEZ
	qy/C86XEGMEDNyouyQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2U1-0000000GQn5-4BkI;
	Mon, 17 Nov 2025 16:53:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2U1-0000000GQmf-0YNP
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FABB6022A;
	Mon, 17 Nov 2025 16:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A0C116B1;
	Mon, 17 Nov 2025 16:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398419;
	bh=q7TV7YcxO4HOBHpwalJWuQ9R+xLm/zrs6LRfhYBIcnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEpGf8wVKwaZcZhEpI3dhgyAr9cZKVfAPWhwYiPcR0azQWLDaPt6K3TUWL2Tm3Z4V
	 9aDVC8kUeuOtXXnY3oCYhcXaxKNrgKfdDmL1P8YD451+77fRgRKiq3imSSpxthHfIa
	 W1xBzx4NLaRZxJKyzDhQDTGBsZAUbBzANzut20OJ1rEdJwgxIeyZ0PxxOwa0km/1r2
	 kvRfbAOM3ZBGJn5tC2emXxxTs6ZUFxP+AdxJSwGVAGr7swb3BRpc2302HuS/7F0B8z
	 yy+dEx1HIKtr/VZk5hep8p17TaA+cI370TZDvjgTyKsREO5XN9nFyV1QpiWxg9lZLY
	 men5JIJO3CneA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v3 2/3] riscv: dts: microchip: add pic64gx and its curiosity kit
Date: Mon, 17 Nov 2025 16:53:23 +0000
Message-ID: <20251117-try-shallow-76b7c5753a66@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-paprika-tipping-e7bb3e211d6f@spud>
References: <20251117-paprika-tipping-e7bb3e211d6f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=27324; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bUnInxNdhJyrNcft2XwTYaSCwtTeqOL05Jz7DBTNaq8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSQf9PMqZITz3hZz8hRDf3Vfuq3ZIM0cbHtfi00hofJ CpnsTl2lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCInbjD8d2erU1lQsPFxPB9v 0af27cZTyvrSFq9RX5K5+rkQe+b2Swz/FEry71/68MzI8HRKZ7uSi9KH6rLqT5OqDl2bs30zx7e XPAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

The Curiosity-GX10000 (PIC64GX SoC Curiosity Kit) is a compact SoC
prototyping board featuring a Microchip PIC64GX SoC PIC64GC-1000.
Features include:
- 1 GB DDR4 SDRAM
- Gigabit Ethernet
- microSD-card slot

note: due to issue on some board, the SDHCI is limited to HS (High
speed mode, with a clock of 50MHz and 3.3V signals).

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/Makefile        |   1 +
 .../dts/microchip/pic64gx-curiosity-kit.dts   | 165 +++++
 .../boot/dts/microchip/pic64gx-pinctrl.dtsi   | 178 +++++
 arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 630 ++++++++++++++++++
 4 files changed, 974 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx.dtsi

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 345ed7a48cc1..3ff4a4f67dc4 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -7,3 +7,4 @@ dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += pic64gx-curiosity-kit.dtb
diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
new file mode 100644
index 000000000000..2f2ccd77af30
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree Source for the PIC64GX Curiosity Kit
+ *
+ * Copyright (C) 2024 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
+ *
+ * The Curiosity-GX10000 (PIC64GX SoC Curiosity Kit) is a compact SoC
+ * prototyping board featuring a Microchip PIC64GX SoC
+ * PIC64GX-1000. Features include:
+ *  - 1 GB DDR4 SDRAM
+ *  - Gigabit Ethernet
+ *  - microSD-card slot
+ *
+ * https://www.microchip.com/en-us/development-tool/curiosity-pic64gx1000-kit-es
+ */
+
+/dts-v1/;
+
+#include "pic64gx.dtsi"
+#include "pic64gx-pinctrl.dtsi"
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define RTCCLK_FREQ	1000000
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Microchip PIC64GX Curiosity Kit";
+	compatible = "microchip,pic64gx-curiosity-kit", "microchip,pic64gx";
+
+	aliases {
+		ethernet0 = &mac0;
+		serial1 = &mmuart1;
+		serial2 = &mmuart2;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <RTCCLK_FREQ>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hss: hss-buffer@bfc00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xbfc00000 0x0 0x400000>;
+			no-map;
+		};
+	};
+};
+
+&gpio0 {
+	interrupts = <13>, <14>, <15>, <16>,
+		     <17>, <18>, <19>, <20>,
+		     <21>, <22>, <23>, <24>,
+		     <25>, <26>;
+	status ="okay";
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "MIPI_CAM_RESET", "MIPI_CAM_STANDBY";
+};
+
+&gpio1 {
+	interrupts = <27>, <28>, <29>, <30>,
+		     <31>, <32>, <33>, <34>,
+		     <35>, <36>, <37>, <38>,
+		     <39>, <40>, <41>, <42>,
+		     <43>, <44>, <45>, <46>,
+		     <47>, <48>, <49>, <50>;
+	status ="okay";
+	gpio-line-names =
+		"", "", "LED1", "LED2", "LED3", "LED4", "LED5", "LED6",
+		"LED7", "LED8", "", "", "", "", "", "",
+		"", "", "", "", "HDMI_HPD", "", "", "GPIO_1_23";
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio1_gpio>, <&spi0_gpio>, <&can0_gpio>, <&pcie_gpio>,
+		    <&qspi_gpio>, <&uart3_gpio>, <&uart4_gpio>, <&can1_gpio>;
+	status ="okay";
+	gpio-line-names =
+		"", "", "", "", "", "", "SWITCH2", "USR_IO12",
+		"DIP1", "DIP2", "", "DIP3", "USR_IO1", "USR_IO2", "USR_IO7", "USR_IO8",
+		"USR_IO3", "USR_IO4", "USR_IO5", "USR_IO6", "", "", "USR_IO9", "USR_IO10",
+		"DIP4", "USR_IO11", "", "", "SWITCH1", "", "", "";
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "sgmii";
+	phy-handle = <&phy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio0_default>;
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
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&mmc {
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	sdhci-caps-mask = <0x00000007 0x00000000>;
+	status = "okay";
+};
+
+&mmuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_fio>;
+	status = "okay";
+};
+
+&mmuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_default>;
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
+&syscontroller {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi b/arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi
new file mode 100644
index 000000000000..319daee04755
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+&iomux0 {
+	spi0_fio: mux-spi0-fabric {
+		function = "spi0";
+		groups = "spi0_fabric";
+	};
+
+	spi1_mssio: mux-spi1-mssio {
+		function = "spi1";
+		groups = "spi1_mssio";
+	};
+
+	i2c0_mssio: mux-i2c0-mssio {
+		function = "i2c0";
+		groups = "i2c0_mssio";
+	};
+
+	i2c1_mssio: mux-i2c1-mssio {
+		function = "i2c1";
+		groups = "i2c1_mssio";
+	};
+
+	can0_fio: mux-can0-fabric {
+		function = "can0";
+		groups = "can0_fabric";
+	};
+
+	can1_fio: mux-can1-fabric {
+		function = "can1";
+		groups = "can1_fabric";
+	};
+
+	qspi_fio: mux-qspi-fabric {
+		function = "qspi";
+		groups = "qspi_fabric";
+	};
+
+	uart0_mssio: mux-uart0-mssio {
+		function = "uart0";
+		groups = "uart0_mssio";
+	};
+
+	uart1_fio: mux-uart1-fabric {
+		function = "uart1";
+		groups = "uart1_fabric";
+	};
+
+	uart2_fio: mux-uart2-fabric {
+		function = "uart2";
+		groups = "uart2_fabric";
+	};
+
+	uart3_fio: mux-uart3-fabric {
+		function = "uart3";
+		groups = "uart3_fabric";
+	};
+
+	uart4_fio: mux-uart4-fabric {
+		function = "uart4";
+		groups = "uart4_fabric";
+	};
+
+	mdio0_fio: mux-mdio0-fabric {
+		function = "mdio0";
+		groups = "mdio0_fabric";
+	};
+
+	mdio1_fio: mux-mdio1-fabric {
+		function = "mdio1";
+		groups = "mdio1_fabric";
+	};
+};
+
+&gpio2_pinctrl {
+	//TODO rethink the labels, since a bunch of these are not defaults or
+	//just outright remove the non-default groups
+	mdio0_default: mux-mac0 {
+		function = "mdio0";
+		groups = "mdio0";
+	};
+
+	mdio0_gpio: mux-mac0-gpio2 {
+		function = "gpio";
+		groups = "gpio_mdio0";
+	};
+
+	mdio1_default: mux-mac1 {
+		function = "mdio1";
+		groups = "mdio1";
+	};
+
+	mdio1_gpio: mux-mac1-gpio2 {
+		function = "gpio";
+		groups = "gpio_mdio1";
+	};
+
+	spi0_default: mux-spi0 {
+		function = "spi0";
+		groups = "spi0";
+	};
+
+	spi0_gpio: mux-spi0-gpio2 {
+		function = "gpio";
+		groups = "gpio_spi0";
+	};
+
+	can0_default: mux-can0 {
+		function = "can0";
+		groups = "can0";
+	};
+
+	can0_gpio: mux-can0-gpio2 {
+		function = "gpio";
+		groups = "gpio_can0";
+	};
+
+	pcie_default: mux-pcie {
+		function = "pcie";
+		groups = "pcie";
+	};
+
+	pcie_gpio: mux-pcie-gpio2 {
+		function = "gpio";
+		groups = "gpio_pcie";
+	};
+
+	qspi_default: mux-qspi {
+		function = "qspi";
+		groups = "qspi";
+	};
+
+	qspi_gpio: mux-qspi-gpio2 {
+		function = "gpio";
+		groups = "gpio_qspi";
+	};
+
+	uart3_default: mux-uart3 {
+		function = "uart3";
+		groups = "uart3";
+	};
+
+	uart3_gpio: mux-uart3-gpio2 {
+		function = "gpio";
+		groups = "gpio_uart3";
+	};
+
+	uart4_default: mux-uart4 {
+		function = "uart4";
+		groups = "uart4";
+	};
+
+	uart4_gpio: mux-uart4-gpio2 {
+		function = "gpio";
+		groups = "gpio_uart4";
+	};
+
+	can1_default: mux-can1 {
+		function = "can1";
+		groups = "can1";
+	};
+
+	can1_gpio: mux-can1-gpio2 {
+		function = "gpio";
+		groups = "gpio_can1";
+	};
+
+	uart2_default: mux-uart2 {
+		function = "uart2";
+		groups = "uart2";
+	};
+
+	uart2_gpio: mux-uart2-gpio2 {
+		function = "gpio";
+		groups = "gpio_uart2";
+	};
+};
+
diff --git a/arch/riscv/boot/dts/microchip/pic64gx.dtsi b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
new file mode 100644
index 000000000000..c164d7bc270a
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
@@ -0,0 +1,630 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree Source for the PIC64GX SoCs
+ *
+ * Copyright (C) 2024 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
+ *
+ * PIC64GX is a series RISC-V multicore SoCs:
+ * https://www.microchip.com/en-us/products/microprocessors/64-bit-mpus/pic64gx
+ */
+
+/dts-v1/;
+#include "dt-bindings/clock/microchip,mpfs-clock.h"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Microchip PIC64GX SoC";
+	compatible = "microchip,pic64gx";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "sifive,e51", "sifive,rocket0", "riscv";
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <16384>;
+			reg = <0>;
+			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+			clocks = <&clkcfg CLK_CPU>;
+			status = "disabled";
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <1>;
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
+			clocks = <&clkcfg CLK_CPU>;
+			tlb-split;
+			next-level-cache = <&cctrllr>;
+			status = "okay";
+
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <2>;
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
+			clocks = <&clkcfg CLK_CPU>;
+			tlb-split;
+			next-level-cache = <&cctrllr>;
+			status = "okay";
+
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <3>;
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
+			clocks = <&clkcfg CLK_CPU>;
+			tlb-split;
+			next-level-cache = <&cctrllr>;
+			status = "okay";
+
+			cpu3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu4: cpu@4 {
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <4>;
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
+			clocks = <&clkcfg CLK_CPU>;
+			tlb-split;
+			next-level-cache = <&cctrllr>;
+			status = "okay";
+			cpu4_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
+	};
+
+	scbclk: clock-80000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <80000000>;
+	};
+
+	refclk: mssrefclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	axiclk: axi-aclk0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	videoclk: video-aclk0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	syscontroller: syscontroller {
+		compatible = "microchip,pic64gx-sys-controller";
+		mboxes = <&mbox 0>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		clint: clint@2000000 {
+			compatible = "microchip,pic64gx-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0xC000>;
+			interrupts-extended = <&cpu0_intc 0xffffffff>, <&cpu0_intc 0xffffffff>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>;
+		};
+
+		cctrllr: cache-controller@2010000 {
+			compatible = "microchip,pic64gx-ccache", "microchip,mpfs-ccache",
+				     "sifive,fu540-c000-ccache", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>;
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1024>;
+			cache-size = <2097152>;
+			cache-unified;
+			interrupt-parent = <&plic>;
+			interrupts = <1>, <3>, <4>, <2>;
+		};
+
+		pdma: dma-controller@3000000 {
+			compatible = "microchip,pic64gx-pdma", "microchip,mpfs-pdma",
+				     "sifive,pdma0";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic>;
+			interrupts = <5 6>, <7 8>, <9 10>, <11 12>;
+			#dma-cells = <1>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			compatible = "microchip,pic64gx-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 0xffffffff>,
+					      <&cpu1_intc 0xffffffff>, <&cpu1_intc 9>,
+					      <&cpu2_intc 0xffffffff>, <&cpu2_intc 9>,
+					      <&cpu3_intc 0xffffffff>, <&cpu3_intc 9>,
+					      <&cpu4_intc 0xffffffff>, <&cpu4_intc 9>;
+			riscv,ndev = <186>;
+		};
+
+		mmuart0: serial@20000000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20000000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <90>;
+			current-speed = <115200>;
+			clocks = <&clkcfg CLK_MMUART0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_mssio>;
+			status = "disabled"; /* Reserved for the HSS */
+		};
+
+		mss_top_sysreg: syscon@20002000 {
+			compatible = "microchip,pic64gx-mss-top-sysreg",
+				     "microchip,mpfs-mss-top-sysreg",
+				     "syscon", "simple-mfd";
+			reg = <0x0 0x20002000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#reset-cells = <1>;
+
+			iomux0: pinctrl@200 {
+				compatible = "microchip,pic64gx-pinctrl-iomux0",
+					     "microchip,mpfs-pinctrl-iomux0";
+				reg = <0x200 0x4>;
+				pinctrl-use-default;
+			};
+
+			mssio: pinctrl@204 {
+				compatible = "microchip,pic64gx-pinctrl-mssio",
+					     "microchip,mpfs-pinctrl-mssio";
+				reg = <0x204 0x7c>;
+				/* on icicle ref design at least */
+				pinctrl-use-default;
+			};
+		};
+
+		sysreg_scb: syscon@20003000 {
+			compatible = "microchip,pic64gx-sysreg-scb",
+				     "microchip,mpfs-sysreg-scb",
+				     "syscon";
+			reg = <0x0 0x20003000 0x0 0x1000>;
+		};
+
+		/* Common node entry for emmc/sd */
+		mmc: mmc@20008000 {
+			compatible = "microchip,pic64gx-sd4hc", "cdns,sd4hc";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <88>;
+			clocks = <&clkcfg CLK_MMC>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
+		mmuart1: serial@20100000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20100000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <91>;
+			current-speed = <115200>;
+			clocks = <&clkcfg CLK_MMUART1>;
+			status = "disabled";
+		};
+
+		mmuart2: serial@20102000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20102000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <92>;
+			current-speed = <115200>;
+			clocks = <&clkcfg CLK_MMUART2>;
+			status = "disabled";
+		};
+
+		mmuart3: serial@20104000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20104000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <93>;
+			current-speed = <115200>;
+			clocks = <&clkcfg CLK_MMUART3>;
+			status = "disabled";
+		};
+
+		mmuart4: serial@20106000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20106000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <94>;
+			clocks = <&clkcfg CLK_MMUART4>;
+			current-speed = <115200>;
+			status = "disabled";
+		};
+
+		spi0: spi@20108000 {
+			compatible = "microchip,pic64gx-spi", "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20108000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <54>;
+			clocks = <&clkcfg CLK_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@20109000 {
+			compatible = "microchip,pic64gx-spi", "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20109000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <55>;
+			clocks = <&clkcfg CLK_SPI1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_mssio>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@2010a000 {
+			compatible = "microchip,pic64gx-i2c", "microchip,corei2c-rtl-v7";
+			reg = <0x0 0x2010a000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <58>;
+			clocks = <&clkcfg CLK_I2C0>;
+			clock-frequency = <100000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_mssio>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@2010b000 {
+			compatible = "microchip,pic64gx-i2c", "microchip,corei2c-rtl-v7";
+			reg = <0x0 0x2010b000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <61>;
+			clocks = <&clkcfg CLK_I2C1>;
+			clock-frequency = <100000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_mssio>;
+			status = "disabled";
+		};
+
+		can0: can@2010c000 {
+			compatible = "microchip,pic64gx-can", "microchip,mpfs-can";
+			reg = <0x0 0x2010c000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_CAN0>, <&clkcfg CLK_MSSPLL3>;
+			interrupt-parent = <&plic>;
+			interrupts = <56>;
+			resets = <&mss_top_sysreg CLK_CAN0>;
+			status = "disabled";
+		};
+
+		can1: can@2010d000 {
+			compatible = "microchip,pic64gx-can", "microchip,mpfs-can";
+			reg = <0x0 0x2010d000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_CAN1>, <&clkcfg CLK_MSSPLL3>;
+			interrupt-parent = <&plic>;
+			interrupts = <57>;
+			resets = <&mss_top_sysreg CLK_CAN1>;
+			status = "disabled";
+		};
+
+		mac0: ethernet@20110000 {
+			compatible = "microchip,pic64gx-macb", "microchip,mpfs-macb",
+				     "cdns,macb";
+			reg = <0x0 0x20110000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
+			/* Filled in by a bootloader */
+			local-mac-address = [00 00 00 00 00 00];
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
+			clock-names = "pclk", "hclk";
+			resets = <&mss_top_sysreg CLK_MAC0>;
+			status = "disabled";
+		};
+
+		mac1: ethernet@20112000 {
+			compatible = "microchip,pic64gx-macb", "microchip,mpfs-macb",
+				     "cdns,macb";
+			reg = <0x0 0x20112000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
+			/* Filled in by a bootloader */
+			local-mac-address = [00 00 00 00 00 00];
+			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
+			clock-names = "pclk", "hclk";
+			resets = <&mss_top_sysreg CLK_MAC1>;
+			status = "disabled";
+		};
+
+		gpio0: gpio@20120000 {
+			compatible = "microchip,pic64gx-gpio", "microchip,mpfs-gpio";
+			reg = <0x0 0x20120000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <14>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@20121000 {
+			compatible = "microchip,pic64gx-gpio", "microchip,mpfs-gpio";
+			reg = <0x0 0x20121000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <24>;
+			status = "disabled";
+		};
+
+		gpio2: gpio@20122000 {
+			compatible = "microchip,pic64gx-gpio", "microchip,mpfs-gpio";
+			reg = <0x0 0x20122000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+			status = "disabled";
+		};
+
+		rtc: rtc@20124000 {
+			compatible = "microchip,pic64gx-rtc", "microchip,mpfs-rtc";
+			reg = <0x0 0x20124000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <80>, <81>;
+			clocks = <&clkcfg CLK_RTC>, <&clkcfg CLK_RTCREF>;
+			clock-names = "rtc", "rtcref";
+			status = "disabled";
+		};
+
+		usb: usb@20201000 {
+			compatible = "microchip,pic64gx-musb", "microchip,mpfs-musb";
+			reg = <0x0 0x20201000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <86>, <87>;
+			clocks = <&clkcfg CLK_USB>;
+			interrupt-names = "dma", "mc";
+			status = "disabled";
+		};
+
+		qspi: spi@21000000 {
+			compatible = "microchip,pic64gx-qspi", "microchip,coreqspi-rtl-v2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x21000000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <85>;
+			clocks = <&clkcfg CLK_QSPI>;
+			status = "disabled";
+		};
+
+		control_scb: syscon@37020000 {
+			compatible = "microchip,pic64gx-control-scb",
+				     "microchip,mpfs-control-scb",
+				     "syscon";
+			reg = <0x0 0x37020000 0x0 0x100>;
+		};
+
+		syscontroller_qspi: spi@37020100 {
+			compatible = "microchip,pic64gx-qspi", "microchip,coreqspi-rtl-v2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x37020100 0x0 0x100>;
+			interrupt-parent = <&plic>;
+			interrupts = <110>;
+			clocks = <&scbclk>;
+			status = "disabled";
+		};
+
+		mbox: mailbox@37020800 {
+			compatible = "microchip,pic64gx-mailbox", "microchip,mpfs-mailbox";
+			reg = <0x0 0x37020800 0x0 0x100>;
+			interrupt-parent = <&plic>;
+			interrupts = <96>;
+			#mbox-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_se: clock-controller@38010000 {
+			compatible = "microchip,pic64gx-ccc", "microchip,mpfs-ccc";
+			reg = <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
+			      <0x0 0x39010000 0x0 0x1000>, <0x0 0x39020000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_ne: clock-controller@38040000 {
+			compatible = "microchip,pic64gx-ccc", "microchip,mpfs-ccc";
+			reg = <0x0 0x38040000 0x0 0x1000>, <0x0 0x38080000 0x0 0x1000>,
+			      <0x0 0x39040000 0x0 0x1000>, <0x0 0x39080000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_nw: clock-controller@38100000 {
+			compatible = "microchip,pic64gx-ccc", "microchip,mpfs-ccc";
+			reg = <0x0 0x38100000 0x0 0x1000>, <0x0 0x38200000 0x0 0x1000>,
+			      <0x0 0x39100000 0x0 0x1000>, <0x0 0x39200000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_sw: clock-controller@38400000 {
+			compatible = "microchip,pic64gx-ccc", "microchip,mpfs-ccc";
+			reg = <0x0 0x38400000 0x0 0x1000>, <0x0 0x38800000 0x0 0x1000>,
+			      <0x0 0x39400000 0x0 0x1000>, <0x0 0x39800000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		clkcfg: clkcfg@3e001000 {
+			compatible = "microchip,pic64gx-clkcfg", "microchip,mpfs-clkcfg";
+			reg = <0x0 0x3e001000 0x0 0x1000>;
+			clocks = <&refclk>;
+			#clock-cells = <1>;
+		};
+
+		gpio2_pinctrl: pinctrl@41000000 {
+			compatible = "microchip,pic64gx-pinctrl-gpio2";
+			reg = <0x0 0x41000000 0x0 0x4>;
+			pinctrl-use-default;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mdio0_fio>, <&mdio1_fio>, <&spi0_fio>, <&qspi_fio>,
+				    <&uart3_fio>, <&uart4_fio>, <&can1_fio>, <&can0_fio>,
+				    <&uart2_fio>;
+		};
+	};
+};
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
