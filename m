Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B8C05027
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XDRCQltlBLrqgD4OR2FpuwIdsFe52+80dAzWexmrTo=; b=DkuLcamHBHeMg1
	D5DxxWVaNjSlrX12T1Ff3dNXkaNlfNHV0365Y/FQWfB1RVtLw+pf3lC9T80dZLl870vqdVCw+6N5i
	aUnCOt8xNaN457sYRvBbVLrtnbxYiQrAhPG+EJoxYBdOtiQ7oflXOIupwKcWGz46NVRU3bLQ4MkPe
	10Y9MoP7PZiZNhaCaJNLi6DD1gSIJvF2Q2GtWwpBVqtEjSr6bXxJMhdSiyT3yudQh6zvQt/YnaHzQ
	a6+d0EzOzAzDjqJxoElWY0vvAP1MrtniuPnfp8/7g6IyldLOsLEYdjiortdk8OJiwebe0hIsJd28o
	Hnhp0rk/kuTKHYDmBoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx3R-002Qht-Fz; Fri, 03 Feb 2023 14:28:41 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwtl-002Ldd-A6
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 14:18:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8F32924E24E;
	Fri,  3 Feb 2023 22:18:04 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 22:18:04 +0800
Received: from ubuntu.localdomain (113.72.144.84) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 22:18:03 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Andreas Schwab <schwab@suse.de>, "Emil Renner
 Berthing" <emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: pinctrl: Add StarFive JH7110 sys pinctrl
Date: Fri, 3 Feb 2023 22:17:58 +0800
Message-ID: <20230203141801.59083-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203141801.59083-1-hal.feng@starfivetech.com>
References: <20230203141801.59083-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.84]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_061841_715282_EC058111 
X-CRM114-Status: GOOD (  17.83  )
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

From: Jianlong Huang <jianlong.huang@starfivetech.com>

Add pinctrl bindings for StarFive JH7110 SoC sys pinctrl controller.

Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 141 ++++++++++++++++++
 MAINTAINERS                                   |   6 +-
 .../pinctrl/starfive,jh7110-pinctrl.h         | 115 ++++++++++++++
 3 files changed, 260 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
new file mode 100644
index 000000000000..22554e68ec91
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 SYS Pin Controller
+
+description: |
+  Bindings for the JH7110 RISC-V SoC from StarFive Technology Ltd.
+
+  Out of the SoC's many pins only the ones named PAD_GPIO0 to PAD_GPIO63
+  can be multiplexed and have configurable bias, drive strength,
+  schmitt trigger etc.
+  Some peripherals have their I/O go through the 64 "GPIOs". This also
+  includes a number of other UARTs, I2Cs, SPIs, PWMs etc.
+  All these peripherals are connected to all 64 GPIOs such that
+  any GPIO can be set up to be controlled by any of the peripherals.
+
+maintainers:
+  - Jianlong Huang <jianlong.huang@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-sys-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate and drive strength.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the GPIOMUX or PINMUX
+              macros.
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            maximum: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@13040000 {
+        compatible = "starfive,jh7110-sys-pinctrl";
+        reg = <0x13040000 0x10000>;
+        clocks = <&syscrg 112>;
+        resets = <&syscrg 2>;
+        interrupts = <86>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        uart0-0 {
+            tx-pins {
+                pinmux = <0xff140005>;
+                bias-disable;
+                drive-strength = <12>;
+                input-disable;
+                input-schmitt-disable;
+                slew-rate = <0>;
+            };
+
+            rx-pins {
+                pinmux = <0x0E000406>;
+                bias-pull-up;
+                drive-strength = <2>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f61eb221415b..babd133cdc4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19890,13 +19890,15 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
 F:	drivers/clk/starfive/clk-starfive-jh7100*
 F:	include/dt-bindings/clock/starfive-jh7100*.h
 
-STARFIVE JH7100 PINCTRL DRIVER
+STARFIVE JH71X0 PINCTRL DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Jianlong Huang <jianlong.huang@starfivetech.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/starfive,jh71*.yaml
 F:	drivers/pinctrl/starfive/
 F:	include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
+F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
 
 STARFIVE JH7100 RESET CONTROLLER DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
new file mode 100644
index 000000000000..57c1659e4bbf
--- /dev/null
+++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
+
+/* sys_iomux pins */
+#define	PAD_GPIO0		0
+#define	PAD_GPIO1		1
+#define	PAD_GPIO2		2
+#define	PAD_GPIO3		3
+#define	PAD_GPIO4		4
+#define	PAD_GPIO5		5
+#define	PAD_GPIO6		6
+#define	PAD_GPIO7		7
+#define	PAD_GPIO8		8
+#define	PAD_GPIO9		9
+#define	PAD_GPIO10		10
+#define	PAD_GPIO11		11
+#define	PAD_GPIO12		12
+#define	PAD_GPIO13		13
+#define	PAD_GPIO14		14
+#define	PAD_GPIO15		15
+#define	PAD_GPIO16		16
+#define	PAD_GPIO17		17
+#define	PAD_GPIO18		18
+#define	PAD_GPIO19		19
+#define	PAD_GPIO20		20
+#define	PAD_GPIO21		21
+#define	PAD_GPIO22		22
+#define	PAD_GPIO23		23
+#define	PAD_GPIO24		24
+#define	PAD_GPIO25		25
+#define	PAD_GPIO26		26
+#define	PAD_GPIO27		27
+#define	PAD_GPIO28		28
+#define	PAD_GPIO29		29
+#define	PAD_GPIO30		30
+#define	PAD_GPIO31		31
+#define	PAD_GPIO32		32
+#define	PAD_GPIO33		33
+#define	PAD_GPIO34		34
+#define	PAD_GPIO35		35
+#define	PAD_GPIO36		36
+#define	PAD_GPIO37		37
+#define	PAD_GPIO38		38
+#define	PAD_GPIO39		39
+#define	PAD_GPIO40		40
+#define	PAD_GPIO41		41
+#define	PAD_GPIO42		42
+#define	PAD_GPIO43		43
+#define	PAD_GPIO44		44
+#define	PAD_GPIO45		45
+#define	PAD_GPIO46		46
+#define	PAD_GPIO47		47
+#define	PAD_GPIO48		48
+#define	PAD_GPIO49		49
+#define	PAD_GPIO50		50
+#define	PAD_GPIO51		51
+#define	PAD_GPIO52		52
+#define	PAD_GPIO53		53
+#define	PAD_GPIO54		54
+#define	PAD_GPIO55		55
+#define	PAD_GPIO56		56
+#define	PAD_GPIO57		57
+#define	PAD_GPIO58		58
+#define	PAD_GPIO59		59
+#define	PAD_GPIO60		60
+#define	PAD_GPIO61		61
+#define	PAD_GPIO62		62
+#define	PAD_GPIO63		63
+#define	PAD_SD0_CLK		64
+#define	PAD_SD0_CMD		65
+#define	PAD_SD0_DATA0		66
+#define	PAD_SD0_DATA1		67
+#define	PAD_SD0_DATA2		68
+#define	PAD_SD0_DATA3		69
+#define	PAD_SD0_DATA4		70
+#define	PAD_SD0_DATA5		71
+#define	PAD_SD0_DATA6		72
+#define	PAD_SD0_DATA7		73
+#define	PAD_SD0_STRB		74
+#define	PAD_GMAC1_MDC		75
+#define	PAD_GMAC1_MDIO		76
+#define	PAD_GMAC1_RXD0		77
+#define	PAD_GMAC1_RXD1		78
+#define	PAD_GMAC1_RXD2		79
+#define	PAD_GMAC1_RXD3		80
+#define	PAD_GMAC1_RXDV		81
+#define	PAD_GMAC1_RXC		82
+#define	PAD_GMAC1_TXD0		83
+#define	PAD_GMAC1_TXD1		84
+#define	PAD_GMAC1_TXD2		85
+#define	PAD_GMAC1_TXD3		86
+#define	PAD_GMAC1_TXEN		87
+#define	PAD_GMAC1_TXC		88
+#define	PAD_QSPI_SCLK		89
+#define	PAD_QSPI_CS0		90
+#define	PAD_QSPI_DATA0		91
+#define	PAD_QSPI_DATA1		92
+#define	PAD_QSPI_DATA2		93
+#define	PAD_QSPI_DATA3		94
+
+#define GPOUT_LOW		0
+#define GPOUT_HIGH		1
+
+#define GPOEN_ENABLE		0
+#define GPOEN_DISABLE		1
+
+#define GPI_NONE		255
+
+#endif
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
