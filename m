Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1597FC35FE7
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ioNcfIyEMc2el9T+L+PoGAO8EThLp8/Iq4IOh9XQPdA=; b=RQd5H2McD58OZV
	8oZxw8tT5Pvl1ILgRSmWZmkV+MC1YFD67UF/frYcst/zItNFgWV0l1GhNxJMpq26Vd2218OSM6t6m
	vNL5qN724T/D0c1T+ZTASrN3j3GjotksEfvChw1H0dAnJ+GosC0JTP48i3hrWcM/a8rCNLRzedQdi
	FAjRipDxn1NZX/RhdJVZVsiUPTwZwTzwFE9p9/GmqaB74Sl9hoqHcYwhUvlkXxCun8XR4eSqqjtk7
	bYOZbTR+OfGCWoghNASEZ+cc4lAOtfdoh9qcyxNsWXtcjHdBcf/JqVtp8yj9XkhQ7Fg9b09frPdCW
	4e4U2L4V6PwzvViat4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spqAl-00000002Bxd-0Vgm;
	Sun, 15 Sep 2024 14:24:19 +0000
Received: from mail-8160.188.com ([60.191.81.60])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spqAh-00000002BwV-3ySx
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 14:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VmvseBodIPHwPD2IY1KUDWoyNyfnQqV7tVtR4Merht0=;
	b=bg2KKK0Vy7znRnL4Ag6f9GnrUzZsutmZPlHM9fjR9O7yBfL1SVFyelE4hQ3fYZ
	HpuyvKTn2AdGsKnkIXOTT5wX1Yu2D/cgbumyHkmPd7shxr9rungxiNnAecja/iL3
	wZRatEcB1VzC4ikgn7UrWK9yeBXImde8fpmht2IbrNNy0=
Received: from localhost (unknown [27.18.168.209])
	by gzga-smtp-mta-g3-4 (Coremail) with SMTP id _____wCnvJnF7eZmD1SdEA--.24094S2;
	Sun, 15 Sep 2024 22:23:02 +0800 (CST)
Date: Sun, 15 Sep 2024 22:23:01 +0800
From: Ze Huang <18771902331@163.com>
To: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, conor@kernel.org
Subject: [PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
Message-ID: <ZubtxUMTRbHg_N6n@jean.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CM-TRANSID: _____wCnvJnF7eZmD1SdEA--.24094S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw15Ww1DXr4Dtr4fKF1UAwb_yoW3Zw15pF
	WS9rn3K34j9rWrK3y0qr1jgF1UWF4q9r1rK3srKry7tw10gFs5K3s5Cr1YqFn8ur1Yk34j
	g3ykZw4Ivrs7AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi2jg-UUUUU=
X-Originating-IP: [27.18.168.209]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNwlbomXAnRCmlgAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_072416_249770_91E899E3 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: 18771902331@163.com, devicetree@vger.kernel.org, dlan@gentoo.org, zhangmeng.kevin@spacemit.com, linux-kernel@vger.kernel.org, jesse@rivosinc.com, cyy@cyyself.name, inochiama@outlook.com, jszhang@kernel.org, kevin.z.m@hotmail.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add pinctrl device, containing default config for uart, pwm, iis, iic and
mmc.

Signed-off-by: Ze Huang <18771902331@163.com>
---
 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 318 +++++++++++++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
 arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
 3 files changed, 338 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h

diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
new file mode 100644
index 000000000000..7537d3286e5a
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Ze Huang <18771902331@163.com>
+ */
+#include "k230-pinctrl.h"
+
+/ {
+	soc {
+		pinctrl: pinctrl@91105000 {
+			compatible = "canaan,k230-pinctrl";
+			reg = <0x0 0x91105000 0x0 0x100>;
+
+			jtag_pins: jtag-pins {
+				jtag-tck-cfg {
+					pinmux = <K230_PINMUX(2, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-pull-down;
+					input-schmitt-enable;
+				};
+
+				jtag-tdi-cfg {
+					pinmux = <K230_PINMUX(3, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+				};
+
+				jtag-tdo-cfg {
+					pinmux = <K230_PINMUX(4, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+
+				jtag-tms-cfg {
+					pinmux = <K230_PINMUX(5, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
+			uart2_pins: uart2-pins {
+				uart2-pins-cfg {
+					pinmux = <K230_PINMUX(5, 3)>, /* uart2 txd */
+						 <K230_PINMUX(6, 3)>; /* uart2 rxd */
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+				};
+			};
+
+			pwm2_pins: pwm2-pins {
+				pwm2-pin-cfg {
+					pinmux = <K230_PINMUX(7, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			pwm3_pins: pwm3-pins {
+				pwm3-pin-cfg {
+					pinmux = <K230_PINMUX(8, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			pwm4_pins: pwm4-pins {
+				pwm4-pin-cfg {
+					pinmux = <K230_PINMUX(9, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			iis_pins: iis-pins {
+				iis-clk-cfg {
+					pinmux = <K230_PINMUX(32, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+
+				iis-ws-cfg {
+					pinmux = <K230_PINMUX(33, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+
+				iis-din0-cfg {
+					pinmux = <K230_PINMUX(34, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+				};
+
+				iis-dout0-cfg {
+					pinmux = <K230_PINMUX(35, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+			};
+
+			uart4_pins: uart4-pins {
+				uart4-txd-cfg {
+					pinmux = <K230_PINMUX(36, 4)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				uart4-rxd-cfg {
+					pinmux = <K230_PINMUX(37, 4)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			uart0_pins: uart0-pins {
+				uart0-txd-cfg {
+					pinmux = <K230_PINMUX(38, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				uart0-rxd-cfg {
+					pinmux = <K230_PINMUX(39, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			iic1_pins: iic1-pins {
+				iic1-pins-cfg {
+					pinmux = <K230_PINMUX(40, 2)>, /* iic1 scl */
+						 <K230_PINMUX(41, 2)>; /* iic1 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			iic3_pins: iic3-pins {
+				iic3-pins-cfg {
+					pinmux = <K230_PINMUX(44, 2)>, /* iic3 scl */
+						 <K230_PINMUX(45, 2)>; /* iic3 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			iic4_pins: iic4-pins {
+				iic4-pins-cfg {
+					pinmux = <K230_PINMUX(46, 3)>, /* iic4 scl */
+						 <K230_PINMUX(47, 3)>; /* iic4 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			iic0_pins: iic0-pins {
+				iic0-pins-cfg {
+					pinmux = <K230_PINMUX(48, 3)>, /* iic0 scl */
+						 <K230_PINMUX(49, 3)>; /* iic0 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			uart3_pins: uart3-pins {
+				uart3-txd-cfg {
+					pinmux = <K230_PINMUX(50, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				uart3-rxd-cfg {
+					pinmux = <K230_PINMUX(51, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			key_pins: key-pins {
+				key-pins-cfg {
+					pinmux = <K230_PINMUX(52, 0)>, /* key0 */
+						 <K230_PINMUX(53, 0)>; /* key1 */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			mmc1_pins: mmc1-pins {
+				mmc1-cmd-cfg {
+					pinmux = <K230_PINMUX(54, 2)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+
+				mmc1-clk-cfg {
+					pinmux = <K230_PINMUX(55, 2)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				mmc1-data-cfg {
+					pinmux = <K230_PINMUX(56, 2)>, /* mmc1 data0 */
+						 <K230_PINMUX(57, 2)>, /* mmc1 data1 */
+						 <K230_PINMUX(58, 2)>, /* mmc1 data2 */
+						 <K230_PINMUX(59, 2)>; /* mmc1 data3 */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+		};
+	};
+};
+
diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.h b/arch/riscv/boot/dts/canaan/k230-pinctrl.h
new file mode 100644
index 000000000000..9a34d75afd9f
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.h
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Copyright (C) 2024 Canaan Bright Sight Co. Ltd
+ * Copyright (C) 2024 Ze Huang <18771902331@163.com>
+ */
+
+#ifndef _DT_BINDINGS_K230_PINCTRL_H
+#define _DT_BINDINGS_K230_PINCTRL_H
+
+#define K230_MSC_3V3 0
+#define K230_MSC_1V8 1
+
+#define BANK_VOLTAGE_DEFAULT       K230_MSC_1V8
+#define BANK_VOLTAGE_IO50_IO61     K230_MSC_3V3
+
+#define K230_PINMUX(pin, mode) (((pin) << 8) | (mode))
+
+#endif /* _DT_BINDINGS_K230_PINCTRL_H */
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb11..a9354e538642 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -140,3 +140,5 @@ uart4: serial@91404000 {
 		};
 	};
 };
+
+#include "k230-pinctrl.dtsi"
-- 
2.46.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
