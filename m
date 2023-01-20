Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB1CC46467
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 02:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bg53FOiCbDfOzkKq6d+uq43Xs8OIkNvOSAiai4cdo6A=; b=4qwTnDV7LTgM5O
	PNMej130R/CmJ7UFJ/9OZJWAjrrL6GZbpxbS6l8Kc2FsXtvolqUaLoTE3t5hVEH8/tBzH3exhLEc0
	OuY1h6eO83D/SocDDIpTMY/yoKbwSG5AAtRz/P9F/p7prexhre6+UGlh10F9cYkiUWgC/X7ASsGLo
	TAf9oD+EwRxMu2po8Zt9vMjNXoPM8S5uk1Nkz4haSNItlugoMAPrStvg3wXqoibBrUT8z1fH1mcjo
	03YlJQAXAVrho7HrEBVsNVNxn3zGamTertI50ts9fa9jh2KTA0Jg1CO+FerPS+hBDfWl3sOHYHGHR
	SzG631TDs/Ms1laQGZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhPJ-0086xD-GD; Fri, 20 Jan 2023 02:45:33 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhP3-0086lb-NZ
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 02:45:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 65D0D24E020;
	Fri, 20 Jan 2023 10:44:47 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:47 +0800
Received: from localhost.localdomain (113.72.144.40) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:46 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v1 01/11] dt-bindings: clock: Add StarFive JH7110 System-Top-Group clock and reset generator
Date: Fri, 20 Jan 2023 10:44:35 +0800
Message-ID: <20230120024445.244345-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_184518_215379_8537856B 
X-CRM114-Status: GOOD (  14.29  )
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

Add bindings for the System-Top-Group clock and reset generator (STGCRG)
on the JH7110 RISC-V SoC by StarFive Ltd.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-stgcrg.yaml         | 82 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 34 ++++++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 28 +++++++
 4 files changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
new file mode 100644
index 000000000000..b64ccd84200a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-stgcrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 System-Top-Group Clock and Reset Generator
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-stgcrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main Oscillator (24 MHz)
+      - description: HIFI4 core
+      - description: STG AXI/AHB
+      - description: USB (125 MHz)
+      - description: CPU Bus
+      - description: HIFI4 Axi
+      - description: NOC STG Bus
+      - description: APB Bus
+
+  clock-names:
+    items:
+      - const: osc
+      - const: hifi4_core
+      - const: stg_axiahb
+      - const: usb_125m
+      - const: cpu_bus
+      - const: hifi4_axi
+      - const: nocstg_bus
+      - const: apb_bus
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
+
+  '#reset-cells':
+    const: 1
+    description:
+      See <dt-bindings/reset/starfive,jh7110-crg.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+
+    stgcrg: clock-controller@10230000 {
+        compatible = "starfive,jh7110-stgcrg";
+        reg = <0x10230000 0x10000>;
+        clocks = <&osc>,
+                 <&syscrg JH7110_SYSCLK_HIFI4_CORE>,
+                 <&syscrg JH7110_SYSCLK_STG_AXIAHB>,
+                 <&syscrg JH7110_SYSCLK_USB_125M>,
+                 <&syscrg JH7110_SYSCLK_CPU_BUS>,
+                 <&syscrg JH7110_SYSCLK_HIFI4_AXI>,
+                 <&syscrg JH7110_SYSCLK_NOCSTG_BUS>,
+                 <&syscrg JH7110_SYSCLK_APB_BUS>;
+        clock-names = "osc", "hifi4_core",
+                      "stg_axiahb", "usb_125m",
+                      "cpu_bus", "hifi4_axi",
+                      "nocstg_bus", "apb_bus";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 84fd7054cb6e..20243eb5470c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19635,6 +19635,7 @@ F:	arch/riscv/boot/dts/starfive/
 STARFIVE JH71X0 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Hal Feng <hal.feng@starfivetech.com>
+M:	Xingyu Wu <xingyu.wu@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/starfive,jh71*.yaml
 F:	drivers/clk/starfive/clk-starfive-jh71*
@@ -19654,6 +19655,7 @@ F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
 STARFIVE JH71X0 RESET CONTROLLER DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Hal Feng <hal.feng@starfivetech.com>
+M:	Xingyu Wu <xingyu.wu@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
 F:	drivers/reset/starfive/reset-starfive-jh71*
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 5e4f21ca0642..5ac8a4d90a7a 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * Copyright 2022 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright 2022 StarFive Technology Co., Ltd.
  */
 
 #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
@@ -222,4 +223,37 @@
 
 #define JH7110_AONCLK_END			14
 
+/* STGCRG clocks */
+#define JH7110_STGCLK_HIFI4_CLK_CORE		0
+#define JH7110_STGCLK_USB0_APB			1
+#define JH7110_STGCLK_USB0_UTMI_APB		2
+#define JH7110_STGCLK_USB0_AXI			3
+#define JH7110_STGCLK_USB0_LPM			4
+#define JH7110_STGCLK_USB0_STB			5
+#define JH7110_STGCLK_USB0_APP_125		6
+#define JH7110_STGCLK_USB0_REFCLK		7
+#define JH7110_STGCLK_PCIE0_AXI_MST0		8
+#define JH7110_STGCLK_PCIE0_APB			9
+#define JH7110_STGCLK_PCIE0_TL			10
+#define JH7110_STGCLK_PCIE1_AXI_MST0		11
+#define JH7110_STGCLK_PCIE1_APB			12
+#define JH7110_STGCLK_PCIE1_TL			13
+#define JH7110_STGCLK_PCIE01_SLV_DEC_MAINCLK	14
+#define JH7110_STGCLK_SEC_HCLK			15
+#define JH7110_STGCLK_SEC_MISCAHB		16
+#define JH7110_STGCLK_GRP0_MAIN			17
+#define JH7110_STGCLK_GRP0_BUS			18
+#define JH7110_STGCLK_GRP0_STG			19
+#define JH7110_STGCLK_GRP1_MAIN			20
+#define JH7110_STGCLK_GRP1_BUS			21
+#define JH7110_STGCLK_GRP1_STG			22
+#define JH7110_STGCLK_GRP1_HIFI			23
+#define JH7110_STGCLK_E2_RTC			24
+#define JH7110_STGCLK_E2_CORE			25
+#define JH7110_STGCLK_E2_DBG			26
+#define JH7110_STGCLK_DMA1P_AXI			27
+#define JH7110_STGCLK_DMA1P_AHB			28
+
+#define JH7110_STGCLK_END			29
+
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
index d78e38690ceb..cb70a1759482 100644
--- a/include/dt-bindings/reset/starfive,jh7110-crg.h
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
  */
 
 #ifndef __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__
@@ -151,4 +152,31 @@
 
 #define JH7110_AONRST_END			8
 
+/* STGCRG resets */
+#define	JH7110_STGRST_SYSCON			0
+#define	JH7110_STGRST_HIFI4_CORE		1
+#define	JH7110_STGRST_HIFI4_AXI			2
+#define	JH7110_STGRST_SEC_TOP_HRESETN		3
+#define	JH7110_STGRST_E24_CORE			4
+#define	JH7110_STGRST_DMA1P_AXI			5
+#define	JH7110_STGRST_DMA1P_AHB			6
+#define	JH7110_STGRST_USB0_AXI			7
+#define	JH7110_STGRST_USB0_APB			8
+#define	JH7110_STGRST_USB0_UTMI_APB		9
+#define	JH7110_STGRST_USB0_PWRUP		10
+#define	JH7110_STGRST_PCIE0_AXI_MST0		11
+#define	JH7110_STGRST_PCIE0_AXI_SLV0		12
+#define	JH7110_STGRST_PCIE0_AXI_SLV		13
+#define	JH7110_STGRST_PCIE0_BRG			14
+#define	JH7110_STGRST_PCIE0_CORE		15
+#define	JH7110_STGRST_PCIE0_APB			16
+#define	JH7110_STGRST_PCIE1_AXI_MST0		17
+#define	JH7110_STGRST_PCIE1_AXI_SLV0		18
+#define	JH7110_STGRST_PCIE1_AXI_SLV		19
+#define	JH7110_STGRST_PCIE1_BRG			20
+#define	JH7110_STGRST_PCIE1_CORE		21
+#define	JH7110_STGRST_PCIE1_APB			22
+
+#define JH7110_STGRST_END			23
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
