Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4C606A32E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 01:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l3gkB+rL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FNjAmZYj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C/xHvWb/B5hW/vhiUCXf2LJfKQEkoHdmOEJwJS9OAHQ=; b=l3gkB+rLBFLSY1pwXqb0Qxl/19
	AI7jArtjz6jaBKiY4NJN9XM1VREibFhiz7dPxOmKTUOcf4N/0tnHZ+B51VAh1DlAFrxZ+IG3oWaCf
	MaeIxqPhpdx5cebIvDiTFUqFNVJ5Ehecwv8wnjE8XZVdXqGrEL+zk4B6oxKhLiQR63n32ia6IOlo3
	YJwK8mrD4CsRziBy7yyhBBsTPXV6CG+AcVr5KuAxkBPPck2V2NSsrmu1GTAunR0xDafuVLs4GTr+V
	bjZ/ZJ95Jii/dOw3nXJsvXjSSifDqXfTfpIl3eRxSxxGSLfzdZSxAVtm+jpOyLeVt+eAbQpuT/Gss
	a2k76Frw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wh-0000000FIV2-2t0g;
	Fri, 23 Oct 2026 01:56:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wg-0000000FIUP-21IZ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 01:56:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F87643F52;
	Fri, 23 Oct 2026 01:56:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792720618;
	b=IfDTBlQSIlpa95ubm8eNwpnuWMTX2bth4zuEQhYVCnu06CLw6fH7RdLrvW7A1fyfA1I6
	 skX23pCfxLK4Fd3QauimR7lLj92XS3tNUZqRWM9ekg5dHM0tE2tb7ydUi/ZWrLsbpG8BB
	 WI3m4z4WU0guqUa5Ak664OuKqdmpnWZ0O7YLFvfTC55McDLObUC+RR2q0z1G9Qpvl3v5u
	 xpZPreOuk1dr87PVFfANpD/G4Ivhv7e0S9lrem9u923jduAJ4uEw80lJ1XAZ2s+yI9Gba
	 pseO8zv9yeMp3dbFzAcUBaehKhID1WoEpeM+gpPczequtu0jYByaDc8oTg0fqyAdZ8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792720618;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sKvFiwWhoQDOCxsO1/Kc/gE52EJ80tAsrj7BX52oFLo=;
	b=gab3HNC/C7SQCfMwERofOX+860Hmp0HCcMG+KlxczogTFmMKzmLzUQ0fiZpD2QWhOuck
	 LTUyYNllx3JcZ6EwUwqtokpCKJWUXA0hC5N9r0FwoyAa9UObYVquYovDhcbNF2n+DfoJa
	 hVVHRGO1OjIQCtyMvfdvWmFoaszVx8yfQJ9KcoOrV8M/qvphOQr+AWg4ylGIIDPFTBcY+
	 ihtJlqwiXS2Adn6r6S8S/83kjt7fem5ZLn/dXEYCY1B/zQggYX+dBQTXagh5AyNg+4+ub
	 pajm8eDdujaL+6ErP4kn7gOMQ4gibAEFm7QEl+ChEcmxa7ROKDLXAebETGhwG7qN+lQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34E231F01825;
	Fri, 23 Oct 2026 01:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792720618;
	bh=sKvFiwWhoQDOCxsO1/Kc/gE52EJ80tAsrj7BX52oFLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FNjAmZYj1aVT3MCKMJ80k6UjVQ8OjnUBFfs0NOhjjPgs59KH8L7rRwSde9G4HmmMd
	 wP29uvSxaoe00YK8UGV13rX2MX7BWwtlYQ0bgQpEehbJU9N7WpmjmSwSLOfYEzvCTJ
	 oeRJ1AD5WF5O1WXh7LgmfRUNGysVAVK//GoVOezhHI2MgSdCJOsrLzSafCwIe+lrxy
	 vb6KyWEMxlP/qUVIDDksO5UN5zgU+NOQXHZLmbhLGyBEXqsl/57HWXonM9qSRiGQqd
	 sX6/khNLMBNP2tN6ImVLFtAnQHHwb3BNDK/uTk/TR1qxxvsrOSWms++jlY6QOsjpWP
	 ItR29cSaA/11Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 11B944218C;
	Fri, 23 Oct 2026 01:56:55 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Fri, 23 Oct 2026 09:56:47 +0800
Subject: [PATCH v5 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-ultrarisc-dts-v5-7-af79dbd6ccec@ultrarisc.com>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
In-Reply-To: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792720613; l=7276;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=zoKYyWE9eT9qjmwtXkTVhVuKVocH7YY094OMCZ3WK9A=;
 b=D8GgPlPajKQHLRtCsVGhAQhhyHnzriImshJXU2h2sILFkONi+VSH9+cn3q8+BT7Q6xD/5Zz4Y
 vuBV27d8aAZAQ6qxA6SX+yu5b/ESYIen4zYtD0zG2lGbeLsgHg+OoHL
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Milk-V Titan is an ITX motherboard based on the UltraRISC DP1000 SoC.

Link: https://milkv.io/docs/titan/overview
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/boot/dts/ultrarisc/Makefile             |   1 +
 .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 108 +++++++++++
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 201 +++++++++++++++++++++
 3 files changed, 310 insertions(+)

diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts/ultrarisc/Makefile
index 454d849a6ce4..dfd15c064d07 100644
--- a/arch/riscv/boot/dts/ultrarisc/Makefile
+++ b/arch/riscv/boot/dts/ultrarisc/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-milkv-titan.dtb
 dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-shenrongda-m0.dtb
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
new file mode 100644
index 000000000000..7a812e40a249
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000.dtsi"
+#include "dp1000-pinctrl.h"
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		pins = <PA12 PA13>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins = <PB6 PB7>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c2_pins: i2c2-pins {
+		pins = <PC0 PC1>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c3_pins: i2c3-pins {
+		pins = <PC2 PC3>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	io_pins: io-pins {
+		pins = <PA10 PA15 PB0 PB1 PB2 PD6 PD7>;
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	gpio_keys_pins: gpio-keys-pins {
+		pins = <PA4 PA11 PA14>;
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	mux_dcdc_i2c_pins: mux-dcdc-i2c-pins {
+		pins = <PA5>;
+		function = "gpio";
+	};
+
+	mux_i2c3_pins: mux-i2c3-pins {
+		pins = <PA6>;
+		function = "gpio";
+	};
+
+	mux_uart0_pins: mux-uart0-pins {
+		pins = <PA7>;
+		function = "gpio";
+	};
+
+	spi0_pins: spi0-pins {
+		pins = <PD0 PD1 PD2 PD3 PD4 PD5>;
+		function = "spi";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	spi1_pins: spi1-pins {
+		pins = <PA0 PA1 PA2 PA3>;
+		function = "spi";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart0_pins: uart0-pins {
+		pins = <PA8 PA9>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart1_pins: uart1-pins {
+		pins = <PB4 PB5>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart2_pins: uart2-pins {
+		pins = <PC4 PC5>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart3_pins: uart3-pins {
+		pins = <PC6 PC7>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+};
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
new file mode 100644
index 000000000000..df4a0e60dfd6
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000-milkv-titan-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Milk-V Titan";
+	compatible = "milkv,titan", "ultrarisc,dp1000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pins>;
+
+		key-wakeup-0 {
+			label = "Wake-Up";
+			gpios = <&gpio_a 14 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+		};
+
+		key-wakeup-1 {
+			label = "Power";
+			gpios = <&gpio_a 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+		};
+
+		key-wakeup-2 {
+			label = "Wake-Up-by-USB";
+			interrupts-extended = <&gpio_a 4 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+
+	rtc@68 {
+		compatible = "st,m41t11";
+		reg = <0x68>;
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+};
+
+&spi1 {
+	num-cs = <1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+};
+
+&pcie_x16 {
+	status = "okay";
+};
+
+&pcie_x4a {
+	status = "okay";
+};
+
+&pcie_x4b {
+	status = "okay";
+};
+
+&gpio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&io_pins &mux_dcdc_i2c_pins &mux_i2c3_pins &mux_uart0_pins>;
+};
+
+&gpio_a {
+	dcdc-i2c-mux-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "dcdc-i2c-mux";
+	};
+
+	i2c3-mux-hog {
+		gpio-hog;
+		gpios = <6 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "i2c3-mux";
+	};
+
+	uart0-mux-hog {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "uart0-mux";
+	};
+};
+
+&ethernet {
+	phy-handle = <&phy0>;
+	/*
+	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
+	 * integration adds fixed delays in both directions.
+	 */
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: phy@0 {
+			reg = <0>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_INDICATOR;
+					default-state = "keep";
+					linux,default-trigger = "netdev";
+				};
+
+				led@2 {
+					reg = <2>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
+					linux,default-trigger = "netdev";
+				};
+			};
+		};
+	};
+};

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
