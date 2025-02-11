Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD59AC021A2
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 05:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBrLEuJU2ukIoTouT08CyCR3chxrfTRVwWBS9712Gv0=; b=LdmP+4Dlp47WRs
	7gfc4ucx9miq1T8eBe0rLScANmYw3jpPEsoxcgrBxUShNIqINl7A6yTX5dL8OQpXpLfQ3x+fPjbPN
	xy+wTus75w/+nZ3v4bu8mxNz2bWlgcMpPNqlxixGMv8F8Y5QUy54VK2e3yEnd8XBwlvnpBYLUvT9G
	BWotwatdRPybpGLlMQOFAVByTqenFAePG5JcWZh6xoAvMg45/FB/3LzfvbCxqfw5Y+zM1La2r3GYw
	i6uJ2AYwMq+rgItd7+MTL/FUHGoEUbI65N4i2Z8LQgvyiPzq9UfCaVKnm7QAmKje7ncpPA77Rm5j9
	ee1LHKal/SG9kaoxG9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thifM-00000002Zbe-0xk7;
	Tue, 11 Feb 2025 05:18:36 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thifK-00000002ZZa-075E
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 05:18:35 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6dd420f82e2so66438576d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 21:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251113; x=1739855913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmcLxmiQxevWfWC+Z1wpMunE+iuI6aQmEijBRLMKdcQ=;
        b=jNKyMkPq5olAZ9cayMGZ4qHdacRAOOayFfX88yas1pPs25mq4WqSmRSGndsHcycYAS
         JbizRROcAE0WlPwlllhxNjBaNm6FYKbPmxXfFDGXnOAn9KpuFSoocCxDJvKUmys3z2K4
         qGNlvq5vlK4bXP0A3EQBM+/Hwo8FFO8AtLMdujNymIp22hTQK3bgfoBwY06+tYMZGr8F
         GW3iSDODrAS+DRMkKjGr2Epi/nwqLTeVGUYNAS0DYSHOQKkmyXqYRML8dlBcOVG2bxkk
         qPG6tX8kUr58aZjmSgpTfxUFwbp5X2WvUkYrvT527VTzkk4St3DbxcqDD+nsBG/+Jz/1
         p+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251113; x=1739855913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmcLxmiQxevWfWC+Z1wpMunE+iuI6aQmEijBRLMKdcQ=;
        b=QplWrO5oNd4f2JqCV0BUxcczqXMszurkibjGlHMiOP5lZnmbWxyqCYAdEaCqUEaFko
         gGpIusL8M+GAV8ayiCPBIMsF7M4zuzcU54RPQbSu+fPgaTSrxie5YeS1j+nMY729+hqt
         JAGTKXLm7MAHPiqzypLF8QmYocJ73Jil1rAYL4b9EZb9eFK7QdaK2etYJ5nU+nwyW4nK
         lmxBzdQr0GeoTE/ZIY62+xpVbQQp/JwpUXz2Cx3+qyLdtXh2Hrt9iVgWllAPxHG1ha/Z
         VeVEC1YC+CqSnS4IJBu0EjfGazP0/S29yAkYoS3Ysjo4Q4O4uXAA6pQ38yhE6C+7+geK
         Mnqw==
X-Forwarded-Encrypted: i=1; AJvYcCV0jWvIk6Lv7/HPo2Bhuya1lMenXX7Wgv9MJB4lJSGDikhsHNUR+YmCsjLG4Li3G3fF/BAzF8xm8DghiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxM35ltDuZNfVAS3glXxLFHw72lxKRciKLfDYSTBh8C9wSgQQcQ
	w/pmZWAM1oeWf8r//BfSWL1uCZrueJ7fIiTef3aXYWtZDHJbpbLg
X-Gm-Gg: ASbGnctcoY88wXEAcx2f/lT++Qsaqd2BTAoNoHpBR6tfAMYgjpA7VQL33Rs32u3rFyX
	aBQ9TEMBYO6CiEalX4sVVgfSErmzd/EsPrn7/oYER267v5Wq1yfBPoCIxuf7feaXfDclLx+01q5
	OXM6FJ5A4qJK5WdUpOPYoavpF17Y2kbjYBalKn8K0owGbOpb8/gLc9w+JfX0gHrgd8vQTUHhls2
	Im1ulsA1v18HjBirt2+P6/uzxQSFu0Itqy+fY9F/pldJhX6vcXxm4eqnoDiGZRO+aU=
X-Google-Smtp-Source: AGHT+IGf1dHMES6FiJRXGoHXc/Ox6GEGzLR8RiRIRa71dUUszfoPgdlmu1fU4FiJemM2f9Q4xv/LjA==
X-Received: by 2002:ad4:576b:0:b0:6d8:8466:d205 with SMTP id 6a1803df08f44-6e4455d2ec1mr201376456d6.6.1739251112673;
        Mon, 10 Feb 2025 21:18:32 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e44150c6e9sm51838016d6.6.2025.02.10.21.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:32 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 5/8] dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
Date: Tue, 11 Feb 2025 13:17:53 +0800
Message-ID: <20250211051801.470800-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_211834_071197_3CA6F603 
X-CRM114-Status: GOOD (  15.31  )
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
For the SG2042 pinctl register file, each register (32 bits) is
responsible for two pins, each occupying the upper 16 bits and lower
16 bits of the register. It supports setting pull up/down, drive
strength and input schmitt trigger.

Add support for SG2042 pinctrl device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../pinctrl/sophgo,sg2042-pinctrl.yaml        | 129 ++++++++++
 include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-sg2044.h  | 221 ++++++++++++++++++
 3 files changed, 546 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2044.h

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
new file mode 100644
index 000000000000..924dfe1404a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
@@ -0,0 +1,129 @@
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
+      - sophgo,sg2044-pinctrl
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
+              node apply to. This should be set using the PINMUX macro.
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
+            description: typical current when output low level.
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-pinctrl
+    then:
+      patternProperties:
+        '-cfg$':
+          patternProperties:
+            '-pins$':
+              properties:
+                drive-strength-microamp:
+                  enum: [ 5400, 8100, 10700, 13400,
+                          16100, 18800, 21400, 24100,
+                          26800, 29400, 32100, 34800,
+                          37400, 40100, 42800, 45400 ]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2044-pinctrl
+    then:
+      patternProperties:
+        '-cfg$':
+          patternProperties:
+            '-pins$':
+              properties:
+                drive-strength-microamp:
+                  enum: [ 3200, 6400, 9600, 12700,
+                          15900, 19100, 22200, 25300,
+                          29500, 32700, 35900, 39000,
+                          42000, 45200, 48300, 51400]
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
+                drive-strength-microamp = <13400>;
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
diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2044.h b/include/dt-bindings/pinctrl/pinctrl-sg2044.h
new file mode 100644
index 000000000000..2a619f681c39
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-sg2044.h
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SG2044_H
+#define _DT_BINDINGS_PINCTRL_SG2044_H
+
+#define PINMUX(pin, mux) \
+	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
+
+#define PIN_IIC0_SMBSUS_IN		0
+#define PIN_IIC0_SMBSUS_OUT		1
+#define PIN_IIC0_SMBALERT		2
+#define PIN_IIC1_SMBSUS_IN		3
+#define PIN_IIC1_SMBSUS_OUT		4
+#define PIN_IIC1_SMBALERT		5
+#define PIN_IIC2_SMBSUS_IN		6
+#define PIN_IIC2_SMBSUS_OUT		7
+#define PIN_IIC2_SMBALERT		8
+#define PIN_IIC3_SMBSUS_IN		9
+#define PIN_IIC3_SMBSUS_OUT		10
+#define PIN_IIC3_SMBALERT		11
+#define PIN_PCIE0_L0_RESET		12
+#define PIN_PCIE0_L1_RESET		13
+#define PIN_PCIE0_L0_WAKEUP		14
+#define PIN_PCIE0_L1_WAKEUP		15
+#define PIN_PCIE0_L0_CLKREQ_IN		16
+#define PIN_PCIE0_L1_CLKREQ_IN		17
+#define PIN_PCIE1_L0_RESET		18
+#define PIN_PCIE1_L1_RESET		19
+#define PIN_PCIE1_L0_WAKEUP		20
+#define PIN_PCIE1_L1_WAKEUP		21
+#define PIN_PCIE1_L0_CLKREQ_IN		22
+#define PIN_PCIE1_L1_CLKREQ_IN		23
+#define PIN_PCIE2_L0_RESET		24
+#define PIN_PCIE2_L1_RESET		25
+#define PIN_PCIE2_L0_WAKEUP		26
+#define PIN_PCIE2_L1_WAKEUP		27
+#define PIN_PCIE2_L0_CLKREQ_IN		28
+#define PIN_PCIE2_L1_CLKREQ_IN		29
+#define PIN_PCIE3_L0_RESET		30
+#define PIN_PCIE3_L1_RESET		31
+#define PIN_PCIE3_L0_WAKEUP		32
+#define PIN_PCIE3_L1_WAKEUP		33
+#define PIN_PCIE3_L0_CLKREQ_IN		34
+#define PIN_PCIE3_L1_CLKREQ_IN		35
+#define PIN_PCIE4_L0_RESET		36
+#define PIN_PCIE4_L1_RESET		37
+#define PIN_PCIE4_L0_WAKEUP		38
+#define PIN_PCIE4_L1_WAKEUP		39
+#define PIN_PCIE4_L0_CLKREQ_IN		40
+#define PIN_PCIE4_L1_CLKREQ_IN		41
+#define PIN_SPIF0_CLK_SEL1		42
+#define PIN_SPIF0_CLK_SEL0		43
+#define PIN_SPIF0_WP			44
+#define PIN_SPIF0_HOLD			45
+#define PIN_SPIF0_SDI			46
+#define PIN_SPIF0_CS			47
+#define PIN_SPIF0_SCK			48
+#define PIN_SPIF0_SDO			49
+#define PIN_SPIF1_CLK_SEL1		50
+#define PIN_SPIF1_CLK_SEL0		51
+#define PIN_SPIF1_WP			52
+#define PIN_SPIF1_HOLD			53
+#define PIN_SPIF1_SDI			54
+#define PIN_SPIF1_CS			55
+#define PIN_SPIF1_SCK			56
+#define PIN_SPIF1_SDO			57
+#define PIN_EMMC_WP			58
+#define PIN_EMMC_CD			59
+#define PIN_EMMC_RST			60
+#define PIN_EMMC_PWR_EN			61
+#define PIN_SDIO_CD			62
+#define PIN_SDIO_WP			63
+#define PIN_SDIO_RST			64
+#define PIN_SDIO_PWR_EN			65
+#define PIN_RGMII0_TXD0			66
+#define PIN_RGMII0_TXD1			67
+#define PIN_RGMII0_TXD2			68
+#define PIN_RGMII0_TXD3			69
+#define PIN_RGMII0_TXCTRL		70
+#define PIN_RGMII0_RXD0			71
+#define PIN_RGMII0_RXD1			72
+#define PIN_RGMII0_RXD2			73
+#define PIN_RGMII0_RXD3			74
+#define PIN_RGMII0_RXCTRL		75
+#define PIN_RGMII0_TXC			76
+#define PIN_RGMII0_RXC			77
+#define PIN_RGMII0_REFCLKO		78
+#define PIN_RGMII0_IRQ			79
+#define PIN_RGMII0_MDC			80
+#define PIN_RGMII0_MDIO			81
+#define PIN_PWM0			82
+#define PIN_PWM1			83
+#define PIN_PWM2			84
+#define PIN_PWM3			85
+#define PIN_FAN0			86
+#define PIN_FAN1			87
+#define PIN_FAN2			88
+#define PIN_FAN3			89
+#define PIN_IIC0_SDA			90
+#define PIN_IIC0_SCL			91
+#define PIN_IIC1_SDA			92
+#define PIN_IIC1_SCL			93
+#define PIN_IIC2_SDA			94
+#define PIN_IIC2_SCL			95
+#define PIN_IIC3_SDA			96
+#define PIN_IIC3_SCL			97
+#define PIN_UART0_TX			98
+#define PIN_UART0_RX			99
+#define PIN_UART0_RTS			100
+#define PIN_UART0_CTS			101
+#define PIN_UART1_TX			102
+#define PIN_UART1_RX			103
+#define PIN_UART1_RTS			104
+#define PIN_UART1_CTS			105
+#define PIN_UART2_TX			106
+#define PIN_UART2_RX			107
+#define PIN_UART2_RTS			108
+#define PIN_UART2_CTS			109
+#define PIN_UART3_TX			110
+#define PIN_UART3_RX			111
+#define PIN_UART3_RTS			112
+#define PIN_UART3_CTS			113
+#define PIN_SPI0_CS0			114
+#define PIN_SPI0_CS1			115
+#define PIN_SPI0_SDI			116
+#define PIN_SPI0_SDO			117
+#define PIN_SPI0_SCK			118
+#define PIN_SPI1_CS0			119
+#define PIN_SPI1_CS1			120
+#define PIN_SPI1_SDI			121
+#define PIN_SPI1_SDO			122
+#define PIN_SPI1_SCK			123
+#define PIN_JTAG0_TDO			124
+#define PIN_JTAG0_TCK			125
+#define PIN_JTAG0_TDI			126
+#define PIN_JTAG0_TMS			127
+#define PIN_JTAG0_TRST			128
+#define PIN_JTAG0_SRST			129
+#define PIN_JTAG1_TDO			130
+#define PIN_JTAG1_TCK			131
+#define PIN_JTAG1_TDI			132
+#define PIN_JTAG1_TMS			133
+#define PIN_JTAG1_TRST			134
+#define PIN_JTAG1_SRST			135
+#define PIN_JTAG2_TDO			136
+#define PIN_JTAG2_TCK			137
+#define PIN_JTAG2_TDI			138
+#define PIN_JTAG2_TMS			139
+#define PIN_JTAG2_TRST			140
+#define PIN_JTAG2_SRST			141
+#define PIN_JTAG3_TDO			142
+#define PIN_JTAG3_TCK			143
+#define PIN_JTAG3_TDI			144
+#define PIN_JTAG3_TMS			145
+#define PIN_JTAG3_TRST			146
+#define PIN_JTAG3_SRST			147
+#define PIN_GPIO0			148
+#define PIN_GPIO1			149
+#define PIN_GPIO2			150
+#define PIN_GPIO3			151
+#define PIN_GPIO4			152
+#define PIN_GPIO5			153
+#define PIN_GPIO6			154
+#define PIN_GPIO7			155
+#define PIN_GPIO8			156
+#define PIN_GPIO9			157
+#define PIN_GPIO10			158
+#define PIN_GPIO11			159
+#define PIN_GPIO12			160
+#define PIN_GPIO13			161
+#define PIN_GPIO14			162
+#define PIN_GPIO15			163
+#define PIN_GPIO16			164
+#define PIN_GPIO17			165
+#define PIN_GPIO18			166
+#define PIN_GPIO19			167
+#define PIN_GPIO20			168
+#define PIN_GPIO21			169
+#define PIN_GPIO22			170
+#define PIN_GPIO23			171
+#define PIN_GPIO24			172
+#define PIN_GPIO25			173
+#define PIN_GPIO26			174
+#define PIN_GPIO27			175
+#define PIN_GPIO28			176
+#define PIN_GPIO29			177
+#define PIN_GPIO30			178
+#define PIN_GPIO31			179
+#define PIN_MODE_SEL0			180
+#define PIN_MODE_SEL1			181
+#define PIN_MODE_SEL2			182
+#define PIN_BOOT_SEL0			183
+#define PIN_BOOT_SEL1			184
+#define PIN_BOOT_SEL2			185
+#define PIN_BOOT_SEL3			186
+#define PIN_BOOT_SEL4			187
+#define PIN_BOOT_SEL5			188
+#define PIN_BOOT_SEL6			189
+#define PIN_BOOT_SEL7			190
+#define PIN_MULTI_SCKT			191
+#define PIN_SCKT_ID0			192
+#define PIN_SCKT_ID1			193
+#define PIN_PLL_CLK_IN_MAIN		194
+#define PIN_PLL_CLK_IN_DDR_0		195
+#define PIN_PLL_CLK_IN_DDR_1		196
+#define PIN_PLL_CLK_IN_DDR_2		197
+#define PIN_PLL_CLK_IN_DDR_3		198
+#define PIN_XTAL_32K			199
+#define PIN_SYS_RST			200
+#define PIN_PWR_BUTTON			201
+#define PIN_TEST_EN			202
+#define PIN_TEST_MODE_MBIST		203
+#define PIN_TEST_MODE_SCAN		204
+#define PIN_TEST_MODE_BSD		205
+#define PIN_BISR_BYP			206
+
+#endif /* _DT_BINDINGS_PINCTRL_SG2044_H */
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
