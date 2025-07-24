Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FF6C87FCE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Ysg54CT+KRfBfEIPBwuXlqeEL5WG3wg2xQxVpOhBPM=; b=0Oqaq3InNLx+XP
	EZcDuoBtOS6THM7J5QtlCvaw1rKD2L6gSfypuDlBSquSRB9Sk1pirG+VGHbiiGsZj4PCwnLRh49pL
	kLTLlUcFIhwEuZith/KezueKGn+YvS99e3qJBEwdcmgc3kt2uchMN6D4l6SYWsUVEtrdwTNXLrfQY
	7a4uPDZGNCyTuUrdscG/w5sFerJ+dpHXdjJJL8QSiYdYF9/RMuMNoXa48n6Q3yItAPllNJJjKEnCd
	9mxWUKIXKKWvNCoj3Xnrw2lqvvphPGrgs9hts5AuD12yeyTzip8tjGjJgEbh2QPBpa25ny5YLr4e5
	M8AEXX+m/SC98JzOnXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMZ-00000007YOz-1iE6;
	Thu, 24 Jul 2025 13:51:59 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesaZ-0000000777W-0hHf
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 09:50:12 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 41AB9B4D0188;
	Thu, 24 Jul 2025 11:50:07 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	E Shattow <e@freenode.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/4] riscv: dts: starfive: add Milk-V Mars CM system-on-module
Date: Thu, 24 Jul 2025 02:48:45 -0700
Message-ID: <20250724094912.253723-3-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724094912.253723-1-e@freeshell.de>
References: <20250724094912.253723-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_025011_349939_3118E44E 
X-CRM114-Status: GOOD (  12.82  )
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

Milk-V Mars CM is a System-on-Module based on the StarFive VisionFive 2
board and Radxa CM3 System-on-Module compatible with the Raspberry Pi
CM4IO Classic IO Board.

Mars CM SoM features:

- StarFive JH7110 System on Chip with RV64GC up to 1.5GHz
- AXP15060 Power Management Unit
- LPDDR4 2GB / 4GB / 8GB DRAM memory
- BL24C04F 4K bits (512 x 8) EEPROM
- GigaDevice 25LQ128EWIG QSPI NOR Flash 16M or SoC ROM UART loader for
  boot (selectable by GPIO)
- eMMC5.0 8GB / 16GB / 32GB flash storage onboard
- AP6256 via SDIO 2.0 onboard wireless connectivity WiFi 5 + Bluetooth
  5.2 (optional, present in models with WiFi feature)
- 1x Motorcomm YT8531C Gigabit Ethernet PHY
- IMG BXE-4-32 Integrated GPU with 3D Acceleration:
  - H.264 & H.265 4K@60fps Decoding
  - H.265 1080p@30fps Encoding
  - JPEG encoder / decoder

Additional features available via 2x 100-pin connectors for CM4IO Board:
- 1x HDMI 2.0
- 1x MIPI DSI (4-lanes)
- 1x 2CH Audio out (via GPIO)
- 1x MIPI CSI (2x2-lanes or 1x4-lanes)
- 1x USB 2.0
- 1x PCIe 1-lane Host, Gen 2 (5Gbps)
- Up to 28x GPIO, supporting 3.3V
- UART x6
- PWM x8
- I2C x7
- SPI
- I2S

Link to Milk-V Mars CM schematics: https://github.com/milkv-mars/mars-files/tree/main/Mars-CM_Hardware_Schematices
Link to StarFive JH7110 Technical Reference Manual: https://doc-en.rvspace.org/JH7110/TRM/index.html
Link to Raspberry Pi CM4IO datasheet: https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf

Add the devicetree file to make use of StarFive JH7110 common supported
features PMIC, EEPROM, UART, I2C, GPIO, eMMC, PCIe, PWM DAC, QSPI Flash,
PWM, and Ethernet. Also configure the common SD Card interface mmc1 for
onboard SDIO BT+WiFi.

Signed-off-by: E Shattow <e@freenode.de>
---
 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 .../dts/starfive/jh7110-milkv-marscm-emmc.dts | 163 ++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index b3bb12f78e7d..79742617ddab 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-emmc.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
new file mode 100644
index 000000000000..59766cdb912b
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 E Shattow <e@freeshell.de>
+ */
+
+/dts-v1/;
+#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "jh7110-common.dtsi"
+
+/ {
+	model = "Milk-V Mars CM";
+	compatible = "milkv,marscm-emmc", "starfive,jh7110";
+
+	aliases {
+		i2c1 = &i2c1;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		serial3 = &uart3;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&sysgpio 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&gmac0 {
+	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
+	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+	starfive,tx-use-rgmii-clk;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "disabled";
+};
+
+&i2c6 {
+	status = "disabled";
+};
+
+&mmc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	status = "okay";
+
+	ap6256: wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&sysgpio>;
+		interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-0 = <&wifi_host_wake_irq>;
+		pinctrl-names = "default";
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&phy0 {
+	rx-internal-delay-ps = <1500>;
+	tx-internal-delay-ps = <1500>;
+	motorcomm,rx-clk-drv-microamp = <3970>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,tx-clk-1000-inverted;
+	motorcomm,tx-clk-adj-enabled;
+};
+
+&pwm {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
+
+&sysgpio {
+	uart1_pins: uart1-0 {
+		tx-pins {
+			pinmux = <GPIOMUX(16, GPOUT_SYS_UART1_TX,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		rx-pins {
+			pinmux = <GPIOMUX(17, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_UART1_RX)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+
+		cts-pins {
+			pinmux = <GPIOMUX(3, GPOUT_LOW,
+					     GPOEN_DISABLE,
+					     GPI_SYS_UART1_CTS)>;
+			bias-disable;
+			input-enable;
+			input-schmitt-enable;
+		};
+
+		rts-pins {
+			pinmux = <GPIOMUX(2, GPOUT_SYS_UART1_RTS,
+					     GPOEN_ENABLE,
+					     GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+	};
+
+	usb0_pins: usb0-0 {
+		vbus-pins {
+			pinmux = <GPIOMUX(25, GPOUT_SYS_USB_DRIVE_VBUS,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	wifi_host_wake_irq: wifi-host-wake-irq {
+		wake-pins {
+			pinmux = <GPIOMUX(34, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			input-enable;
+		};
+	};
+};
+
+&uart1 {
+	uart-has-rtscts;
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
+	status = "okay";
+};
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
