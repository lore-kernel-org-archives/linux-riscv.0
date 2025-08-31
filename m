Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D17ACA1000
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Aug 2025 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sP4MxYxvI7ohnE+D0OmXghQcflicf3nZT2je9GeSyU=; b=t1bapFa2uajiZn
	p4bzhwcytnavtVfkl1S0jBLXz8gATmQTi5mqGsyf1chr6jRkdGe/xDScuCbSUTGN4/qbwUN//lNhZ
	drjhKUGIBxEMPv81H9/qf44ZRL2D0bcHbdabGHnyLicLBQQE9loOVw+72kR/keha+4W4HV7HRzmrl
	zf8bG6/imaY/1f5tbzOM45+XlnZPct3G9ox50eQY4NoqDqO17RzY3xUSHT+ub/vLwKTWKexT4L3mr
	GqSehv7+2Jo3IkHu3XE9/Q6PNroPwulBIJFqE8lG1NQXEu4mClKoWLZxglnatv3qWtJucmsPeRCMJ
	Lh9IcJsuxBjQWDpnJ3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usl9b-0000000AR7T-0Z0z;
	Sun, 31 Aug 2025 16:43:43 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usktb-0000000APIw-0gOS;
	Sun, 31 Aug 2025 16:27:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=MBwE6Fz8jW8S6qRfZG7ebV4ExSgfdhPu/bVH7xzFbMs=;
	b=dVqm6EOgySfINo9XZ2fj+dcVEnSLlAEQayqAFb4tk8q/RtlGJAzZJmhNQbHjhWQrpLeIVfkCeDtTDQYeE0C0aYvrf1g4hh0oTR8Am4YG3q+iQv5t9kR39qRD/GKqPwsLWmfLmZlcw/t0jCBUp7rRJ3zHEiSX9WTusInijCDMHNc=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sun, 31 Aug 2025 18:26:50 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 5/5] ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier
Date: Sun, 31 Aug 2025 18:25:34 +0200
Message-Id: <20250831162536.2380589-6-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250831162536.2380589-1-lukas.schmid@netcube.li>
References: <20250831162536.2380589-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_092711_486965_6CBC27A9 
X-CRM114-Status: GOOD (  13.68  )
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

The NetCube Systems Nagami Keypad Carrier uses the Nagami SoM and contains
a TCA8418 connected to a 4x4 matrix keypad. The I2C2 interface is connected
to said TCA8418 and also a header for an PN532 NFC-Module. It also provides
a pin-header for a bi-color status led. Ethernet with PoE support is
available on a screwterminal after magnetics.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 ...8i-t113s-netcube-nagami-keypad-carrier.dts | 129 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index af287bb3231c8..a2137bbe22307 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -259,6 +259,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-s3-pinecube.dtb \
 	sun8i-t113s-mangopi-mq-r-t113.dtb \
 	sun8i-t113s-netcube-nagami-basic-carrier.dtb \
+	sun8i-t113s-netcube-nagami-keypad-carrier.dtb \
 	sun8i-t3-cqa3t-bv3.dtb \
 	sun8i-v3-sl631-imx179.dtb \
 	sun8i-v3s-anbernic-rg-nano.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
new file mode 100644
index 0000000000000..048a6245684aa
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-t113s-netcube-nagami.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "NetCube Systems Nagami Keypad Carrier Board";
+	compatible = "netcube,nagami-keypad-carrier", "netcube,nagami",
+				 "allwinner,sun8i-t113s";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_status_red: led-status-red {
+			gpios = <&pio 3 16 GPIO_ACTIVE_HIGH>;  /* PD16 */
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led_status_green: led-status-green {
+			gpios = <&pio 3 22 GPIO_ACTIVE_HIGH>;  /* PD22 */
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	tca8418: keypad@34 {
+		compatible = "ti,tca8418";
+		reg = <0x34>;
+		interrupts-extended = <&pio 5 6 IRQ_TYPE_EDGE_FALLING>;  /* PF6 */
+		linux,keymap = <MATRIX_KEY(0x03, 0x00, KEY_NUMERIC_A)
+						MATRIX_KEY(0x03, 0x01, KEY_NUMERIC_1)
+						MATRIX_KEY(0x03, 0x02, KEY_NUMERIC_2)
+						MATRIX_KEY(0x03, 0x03, KEY_NUMERIC_3)
+						MATRIX_KEY(0x02, 0x00, KEY_NUMERIC_B)
+						MATRIX_KEY(0x02, 0x01, KEY_NUMERIC_4)
+						MATRIX_KEY(0x02, 0x02, KEY_NUMERIC_5)
+						MATRIX_KEY(0x02, 0x03, KEY_NUMERIC_6)
+						MATRIX_KEY(0x01, 0x00, KEY_NUMERIC_C)
+						MATRIX_KEY(0x01, 0x01, KEY_NUMERIC_7)
+						MATRIX_KEY(0x01, 0x02, KEY_NUMERIC_8)
+						MATRIX_KEY(0x01, 0x03, KEY_NUMERIC_9)
+						MATRIX_KEY(0x00, 0x00, KEY_NUMERIC_D)
+						MATRIX_KEY(0x00, 0x01, KEY_CLEAR)
+						MATRIX_KEY(0x00, 0x02, KEY_NUMERIC_0)
+						MATRIX_KEY(0x00, 0x03, KEY_OK)
+		>;
+		keypad,num-rows = <4>;
+		keypad,num-columns = <4>;
+	};
+};
+
+&pio {
+	gpio-line-names = "", "", "", "", // PA
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "", // PB
+					  "", "", "UART3_TX", "UART3_RX",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "eMMC_CLK", "eMMC_CMD", // PC
+					  "eMMC_D2", "eMMC_D1", "eMMC_D0", "eMMC_D3",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "", // PD
+					  "", "", "", "",
+					  "", "USB_SEC_EN", "", "",
+					  "", "", "", "",
+					  "LED_STATUS_RED", "", "", "",
+					  "I2C2_SCL", "I2C2_SDA", "LED_STATUS_GREEN", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "ETH_CRSDV", "ETH_RXD0", "ETH_RXD1", "ETH_TXCK", // PE
+					  "ETH_TXD0", "ETH_TXD1", "ETH_TXEN", "",
+					  "ETH_MDC", "ETH_MDIO", "QWIIC_nINT", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "", // PF
+					  "", "", "KEY_nINT", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
+					  "ESP_D2", "ESP_D3", "UART1_TXD", "UART1_RXD",
+					  "ESP_nBOOT", "ESP_nRST", "I2C3_SCL", "I2C3_SDA",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "";
+};
+
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.39.5



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
