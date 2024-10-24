Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534FDD0BB64
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHFlsQYvSEcbq+APz+pB2FH7WUBBEJT3Odtifbr9Sts=; b=IoZuRb6OnxJHYu
	PJpXDtnE1V1mzt57qeGH9/8W0qGSQpV8psid3XHm7EBD7O6htvCL2A9Y694FQn8TsonZJY+NEJzjV
	6HcoGGC4L8nrLnEqGsBG5FC5c2OZ+9g0c+1PEdtznlImHWpkWEUbk67QbHukxDeRfdg19rg8Fq8QC
	jZlQDm/QgMtIW84GzWhIsKdBSQJGd5V2wo2yk7FlcvV20ep6VBwNYtvWhAofCCR/dxjynBGTWNLBM
	ysu1fsgOHYRVx9EiYHxm8V7Md5SpUfKX+Q/5OVCJ8Qwb9yNV0pP/0jDoyuct2FMpvGJyFNYbAuw8y
	8247SzvdGtf/Qa2mQj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ra6-0000000GxS5-0MGp;
	Thu, 24 Oct 2024 06:44:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ra2-0000000GxQx-06dF
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 06:44:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so446609a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 23:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729752261; x=1730357061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaogxiHUoCYyHxAdte/yNMniP8G2o14XXGmFLTDHNXU=;
        b=IX1/c8zOeD1HVlRzaeOQ2Vs7EVS7yFsxappyS1XhqdOTlpwNzpikZfuGt3RjNWdFHK
         lKTXUbOAURT58bus5ia5blZQCSY9JTQSr/Dk4hjxnQsV2Jcny/0NaozS98+M+PB8kFZy
         GqSzx1q3XtbodIfuTBsFhEu4zQF2egwRxpt+gl9xAu0MLZJkED3ti4b6ZKi0G4qMquD+
         Qj6NyecFawy308J1lkk5a7G7iezDdlNCEwa+8D02qXJNIXnPkEJqf6mDGuceZmLRxpPl
         I4+CPUckjPxxafES60vv7kR2zf3i9ScjlvLwGxBMZbcdNr60j8hS71O9wVqboytok5Ou
         RYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752261; x=1730357061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaogxiHUoCYyHxAdte/yNMniP8G2o14XXGmFLTDHNXU=;
        b=VTxrZhXVSqIHP7GoYl/h9HGukqzhitK0umSvchpPNFX4o2bFneYd84oaI+kqbEPvzj
         GvaLCXDpSpt4os/d1ZZD8X3Q9Ztdgq+80a03Wki2lHl3LTVrvW+rBMqGu8dk5/Pgg1e4
         D86NI/dttSIwK52c9H02fzlxAod7UCYyNbGs33uTdMv588wY6RKNogDOYsi17mudY0n/
         A+s7rFI5IS/1XYYnKvqDFERMBlQeJLEtOO/m/0QLvd9NIn2zCW+O1SNLHiGcSZyE+rZY
         Ezgb13jbv5fXPYubeGNmQjgCmIBl1KL62WwvPtkrvPj3d+OYVDE1vcx8mY0jX9Pgulmp
         gm4w==
X-Forwarded-Encrypted: i=1; AJvYcCWpBDZiZeStaO0C/2nyHlIJfbnQeCMTdHSF7EGFLW4mvXY27do/YojI9VpvIb72vM5zt91XVze5vYaCNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YypPlPwsTpfCJYMRyR6Z1Z5nnVGuHBmPkz/i8dXdQPrJTXFJP1l
	gk37R7tl8d/UgxIGX7DAQp+S8pikykkZhRCAVTwy1WHM+vcDzm/XWWqPgA==
X-Google-Smtp-Source: AGHT+IFO3UiABhI+bPJ0y2wgQJOiCFf/0oQbrvXjoKa6w6HlFw6fHRVp+DnR2U0pG+alS4yvg04Xdw==
X-Received: by 2002:a17:90b:3007:b0:2e0:a926:19b1 with SMTP id 98e67ed59e1d1-2e77f74ef8fmr957730a91.38.1729752260937;
        Wed, 23 Oct 2024 23:44:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76df29f23sm2654774a91.3.2024.10.23.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:44:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
Date: Thu, 24 Oct 2024 14:43:54 +0800
Message-ID: <20241024064356.865055-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024064356.865055-1-inochiama@gmail.com>
References: <20241024064356.865055-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_234422_092751_D6726507 
X-CRM114-Status: GOOD (  15.91  )
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

SG2042 introduces a simple pinctrl device for all configurable pins.
The pinconf and pinmux are mixed in a 16 bits register for each pin.
It supports setting pull up/down, drive strength and input schmitt
trigger.

Add support for SG2042 pinctrl device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../pinctrl/sophgo,sg2042-pinctrl.yaml        |  96 +++++++++
 include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++++++++++++++
 2 files changed, 292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
new file mode 100644
index 000000000000..5060deacd580
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/sophgo,sg2042-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Pin Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2042-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-cfg$':
+    type: object
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias input
+          enable/disable, input schmitt trigger enable, drive strength
+          output enable/disable state. For configuration detail,
+          refer to https://github.com/sophgo/sophgo-doc/.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the GPIOMUX
+              macro.
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength-microamp:
+            description: typical current when output high level.
+            enum: [ 4300, 6400, 8500, 10600, 12800, 14900, 17000, 19100,
+                    21200, 23300, 25500, 27600, 29700, 31800, 33900, 36000]
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-sg2042.h>
+
+    pinctrl@30011000 {
+        compatible = "sophgo,sg2042-pinctrl";
+        reg = <30011000 0x1000>;
+
+        uart0_cfg: uart0-cfg {
+            uart0-pins {
+                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+                         <PINMUX(PIN_UART0_RX, 0)>;
+                bias-pull-up;
+                drive-strength-microamp = <10600>;
+            };
+        };
+    };
+
+...
diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2042.h b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
new file mode 100644
index 000000000000..79d5bb8e04f8
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SG2042_H
+#define _DT_BINDINGS_PINCTRL_SG2042_H
+
+#define PINMUX(pin, mux) \
+	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
+
+#define PIN_LPC_LCLK			0
+#define PIN_LPC_LFRAME			1
+#define PIN_LPC_LAD0			2
+#define PIN_LPC_LAD1			3
+#define PIN_LPC_LAD2			4
+#define PIN_LPC_LAD3			5
+#define PIN_LPC_LDRQ0			6
+#define PIN_LPC_LDRQ1			7
+#define PIN_LPC_SERIRQ			8
+#define PIN_LPC_CLKRUN			9
+#define PIN_LPC_LPME			10
+#define PIN_LPC_LPCPD			11
+#define PIN_LPC_LSMI			12
+#define PIN_PCIE0_L0_RESET		13
+#define PIN_PCIE0_L1_RESET		14
+#define PIN_PCIE0_L0_WAKEUP		15
+#define PIN_PCIE0_L1_WAKEUP		16
+#define PIN_PCIE0_L0_CLKREQ_IN		17
+#define PIN_PCIE0_L1_CLKREQ_IN		18
+#define PIN_PCIE1_L0_RESET		19
+#define PIN_PCIE1_L1_RESET		20
+#define PIN_PCIE1_L0_WAKEUP		21
+#define PIN_PCIE1_L1_WAKEUP		22
+#define PIN_PCIE1_L0_CLKREQ_IN		23
+#define PIN_PCIE1_L1_CLKREQ_IN		24
+#define PIN_SPIF0_CLK_SEL1		25
+#define PIN_SPIF0_CLK_SEL0		26
+#define PIN_SPIF0_WP			27
+#define PIN_SPIF0_HOLD			28
+#define PIN_SPIF0_SDI			29
+#define PIN_SPIF0_CS			30
+#define PIN_SPIF0_SCK			31
+#define PIN_SPIF0_SDO			32
+#define PIN_SPIF1_CLK_SEL1		33
+#define PIN_SPIF1_CLK_SEL0		34
+#define PIN_SPIF1_WP			35
+#define PIN_SPIF1_HOLD			36
+#define PIN_SPIF1_SDI			37
+#define PIN_SPIF1_CS			38
+#define PIN_SPIF1_SCK			39
+#define PIN_SPIF1_SDO			40
+#define PIN_EMMC_WP			41
+#define PIN_EMMC_CD			42
+#define PIN_EMMC_RST			43
+#define PIN_EMMC_PWR_EN			44
+#define PIN_SDIO_CD			45
+#define PIN_SDIO_WP			46
+#define PIN_SDIO_RST			47
+#define PIN_SDIO_PWR_EN			48
+#define PIN_RGMII0_TXD0			49
+#define PIN_RGMII0_TXD1			50
+#define PIN_RGMII0_TXD2			51
+#define PIN_RGMII0_TXD3			52
+#define PIN_RGMII0_TXCTRL		53
+#define PIN_RGMII0_RXD0			54
+#define PIN_RGMII0_RXD1			55
+#define PIN_RGMII0_RXD2			56
+#define PIN_RGMII0_RXD3			57
+#define PIN_RGMII0_RXCTRL		58
+#define PIN_RGMII0_TXC			59
+#define PIN_RGMII0_RXC			60
+#define PIN_RGMII0_REFCLKO		61
+#define PIN_RGMII0_IRQ			62
+#define PIN_RGMII0_MDC			63
+#define PIN_RGMII0_MDIO			64
+#define PIN_PWM0			65
+#define PIN_PWM1			66
+#define PIN_PWM2			67
+#define PIN_PWM3			68
+#define PIN_FAN0			69
+#define PIN_FAN1			70
+#define PIN_FAN2			71
+#define PIN_FAN3			72
+#define PIN_IIC0_SDA			73
+#define PIN_IIC0_SCL			74
+#define PIN_IIC1_SDA			75
+#define PIN_IIC1_SCL			76
+#define PIN_IIC2_SDA			77
+#define PIN_IIC2_SCL			78
+#define PIN_IIC3_SDA			79
+#define PIN_IIC3_SCL			80
+#define PIN_UART0_TX			81
+#define PIN_UART0_RX			82
+#define PIN_UART0_RTS			83
+#define PIN_UART0_CTS			84
+#define PIN_UART1_TX			85
+#define PIN_UART1_RX			86
+#define PIN_UART1_RTS			87
+#define PIN_UART1_CTS			88
+#define PIN_UART2_TX			89
+#define PIN_UART2_RX			90
+#define PIN_UART2_RTS			91
+#define PIN_UART2_CTS			92
+#define PIN_UART3_TX			93
+#define PIN_UART3_RX			94
+#define PIN_UART3_RTS			95
+#define PIN_UART3_CTS			96
+#define PIN_SPI0_CS0			97
+#define PIN_SPI0_CS1			98
+#define PIN_SPI0_SDI			99
+#define PIN_SPI0_SDO			100
+#define PIN_SPI0_SCK			101
+#define PIN_SPI1_CS0			102
+#define PIN_SPI1_CS1			103
+#define PIN_SPI1_SDI			104
+#define PIN_SPI1_SDO			105
+#define PIN_SPI1_SCK			106
+#define PIN_JTAG0_TDO			107
+#define PIN_JTAG0_TCK			108
+#define PIN_JTAG0_TDI			109
+#define PIN_JTAG0_TMS			110
+#define PIN_JTAG0_TRST			111
+#define PIN_JTAG0_SRST			112
+#define PIN_JTAG1_TDO			113
+#define PIN_JTAG1_TCK			114
+#define PIN_JTAG1_TDI			115
+#define PIN_JTAG1_TMS			116
+#define PIN_JTAG1_TRST			117
+#define PIN_JTAG1_SRST			118
+#define PIN_JTAG2_TDO			119
+#define PIN_JTAG2_TCK			120
+#define PIN_JTAG2_TDI			121
+#define PIN_JTAG2_TMS			122
+#define PIN_JTAG2_TRST			123
+#define PIN_JTAG2_SRST			124
+#define PIN_GPIO0			125
+#define PIN_GPIO1			126
+#define PIN_GPIO2			127
+#define PIN_GPIO3			128
+#define PIN_GPIO4			129
+#define PIN_GPIO5			130
+#define PIN_GPIO6			131
+#define PIN_GPIO7			132
+#define PIN_GPIO8			133
+#define PIN_GPIO9			134
+#define PIN_GPIO10			135
+#define PIN_GPIO11			136
+#define PIN_GPIO12			137
+#define PIN_GPIO13			138
+#define PIN_GPIO14			139
+#define PIN_GPIO15			140
+#define PIN_GPIO16			141
+#define PIN_GPIO17			142
+#define PIN_GPIO18			143
+#define PIN_GPIO19			144
+#define PIN_GPIO20			145
+#define PIN_GPIO21			146
+#define PIN_GPIO22			147
+#define PIN_GPIO23			148
+#define PIN_GPIO24			149
+#define PIN_GPIO25			150
+#define PIN_GPIO26			151
+#define PIN_GPIO27			152
+#define PIN_GPIO28			153
+#define PIN_GPIO29			154
+#define PIN_GPIO30			155
+#define PIN_GPIO31			156
+#define PIN_MODE_SEL0			157
+#define PIN_MODE_SEL1			158
+#define PIN_MODE_SEL2			159
+#define PIN_BOOT_SEL0			160
+#define PIN_BOOT_SEL1			161
+#define PIN_BOOT_SEL2			162
+#define PIN_BOOT_SEL3			163
+#define PIN_BOOT_SEL4			164
+#define PIN_BOOT_SEL5			165
+#define PIN_BOOT_SEL6			166
+#define PIN_BOOT_SEL7			167
+#define PIN_MULTI_SCKT			168
+#define PIN_SCKT_ID0			169
+#define PIN_SCKT_ID1			170
+#define PIN_PLL_CLK_IN_MAIN		171
+#define PIN_PLL_CLK_IN_DDR_L		172
+#define PIN_PLL_CLK_IN_DDR_R		173
+#define PIN_XTAL_32K			174
+#define PIN_SYS_RST			175
+#define PIN_PWR_BUTTON			176
+#define PIN_TEST_EN			177
+#define PIN_TEST_MODE_MBIST		178
+#define PIN_TEST_MODE_SCAN		179
+#define PIN_TEST_MODE_BSD		180
+#define PIN_BISR_BYP			181
+
+#endif /* _DT_BINDINGS_PINCTRL_SG2042_H */
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
