Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF1CA0FE8
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Aug 2025 23:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4dVTQ3BNBKd+TtU5a0xSda1nmX1NS53mhSsKWCTVEM=; b=Hsv9qguWTYr7vH
	piILSDBoYFG+KLS9fPyhf5mibLrDOKLJ6Cb1CixNgIPg71lh94aqDVb+sbiTIssrQf9dlegR/WbdR
	ff9TfVObbgZ/SreevsPIHu7kT5YYdR18DK2q/anIrJloY4tf7/0MGKqlZ57Vnu6JxSn6t3ccsR7HZ
	KpZwsOFykjbjFcSUXD3Kjcx3dgbdln/kfe8j17tubd8xWTr269pMvzbDZyll2sjsGESWtcL00XTMe
	OP4XYsIQMcuYVXTnUh99ovjkH0p3E8nPalsdVnkSop7RKIZu4CVIXj7/xb1ii0pj1Ki+nkPZ9IgGN
	gphpA0a5gkvx1UkthpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usr3N-0000000AmzP-13gk;
	Sun, 31 Aug 2025 23:01:41 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usr3L-0000000Amxt-0tDn
	for linux-riscv@lists.infradead.org;
	Sun, 31 Aug 2025 23:01:40 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id EB3C6B220079;
	Mon,  1 Sep 2025 01:01:34 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 1/5] riscv: dts: starfive: add common board dtsi for Milk-V Mars CM variants
Date: Sun, 31 Aug 2025 15:59:26 -0700
Message-ID: <20250831225959.531393-2-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250831225959.531393-1-e@freeshell.de>
References: <20250831225959.531393-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_160139_422923_3BADC83B 
X-CRM114-Status: GOOD (  10.48  )
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

Add a common board dtsi for use by Milk-V Mars CM and Milk-V Mars CM Lite.

Signed-off-by: E Shattow <e@freeshell.de>
---
 .../dts/starfive/jh7110-milkv-marscm.dtsi     | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
new file mode 100644
index 000000000000..25b70af564ee
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 E Shattow <e@freeshell.de>
+ */
+
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "jh7110-common.dtsi"
+
+/ {
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
+	wifi_host_wake_irq: wifi-host-wake-irq-0 {
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
