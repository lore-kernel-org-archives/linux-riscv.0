Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6EEC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRT0T9wf4LomGQcjIDQ7TmH071A1rVACpnqzkWdd6Vo=; b=wmL/iUiib8BcOt
	Ea4bLt0mtMoRmLlzduJj2ouMZ6XMLVvWXy7/8c8DVWeRsrkzTUobelrv/1MJjj5FqFnYY156AS7PE
	1ArAtYmCf2757/YwdqLUwbB04FhZkefL3b2afw2NCnbfzyPowf7bXxTu9S6mQgGJFM+jZoRSjer33
	uFcyle/fAqMG+fGxsticr2/c6Na6a3BcANMqdIUEg7DYoVsbBVS1dvEjSHD59Be7WsLnAQ5R8PGeL
	OnPyd6rWuZuL+mnoXD3LYz1zGskPoTt4/sySLmkFxapGUqSQefjVziisBMjDHtGfBQBBNPg+LcVw/
	8XwdFCR8SJ25dbJEQq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuff-0036fL-1S;
	Thu, 13 Jul 2023 11:39:43 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJufW-0036XZ-2e
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:39:39 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D089124E266;
	Thu, 13 Jul 2023 19:39:04 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Jul
 2023 19:39:04 +0800
Received: from localhost.localdomain (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Jul
 2023 19:39:03 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	"Emil Renner Berthing" <emil.renner.berthing@canonical.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v8 1/9] dt-bindings: clock: Add StarFive JH7110 System-Top-Group clock and reset generator
Date: Thu, 13 Jul 2023 19:38:54 +0800
Message-ID: <20230713113902.56519-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
References: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_043935_271612_88E54F03 
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

Add bindings for the System-Top-Group clock and reset generator (STGCRG)
on the JH7110 RISC-V SoC by StarFive Ltd.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-stgcrg.yaml         | 82 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 34 ++++++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 28 +++++++
 3 files changed, 144 insertions(+)
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
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 06257bfd9ac1..6c8e8b4cf1f6 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * Copyright 2022 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright 2022 StarFive Technology Co., Ltd.
  */
 
 #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
@@ -218,4 +219,37 @@
 
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
+#define JH7110_STGCLK_PCIE_SLV_MAIN		14
+#define JH7110_STGCLK_SEC_AHB			15
+#define JH7110_STGCLK_SEC_MISC_AHB		16
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
index d78e38690ceb..4e96ab81dd8e 100644
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
+#define JH7110_STGRST_SYSCON			0
+#define JH7110_STGRST_HIFI4_CORE		1
+#define JH7110_STGRST_HIFI4_AXI			2
+#define JH7110_STGRST_SEC_AHB			3
+#define JH7110_STGRST_E24_CORE			4
+#define JH7110_STGRST_DMA1P_AXI			5
+#define JH7110_STGRST_DMA1P_AHB			6
+#define JH7110_STGRST_USB0_AXI			7
+#define JH7110_STGRST_USB0_APB			8
+#define JH7110_STGRST_USB0_UTMI_APB		9
+#define JH7110_STGRST_USB0_PWRUP		10
+#define JH7110_STGRST_PCIE0_AXI_MST0		11
+#define JH7110_STGRST_PCIE0_AXI_SLV0		12
+#define JH7110_STGRST_PCIE0_AXI_SLV		13
+#define JH7110_STGRST_PCIE0_BRG			14
+#define JH7110_STGRST_PCIE0_CORE		15
+#define JH7110_STGRST_PCIE0_APB			16
+#define JH7110_STGRST_PCIE1_AXI_MST0		17
+#define JH7110_STGRST_PCIE1_AXI_SLV0		18
+#define JH7110_STGRST_PCIE1_AXI_SLV		19
+#define JH7110_STGRST_PCIE1_BRG			20
+#define JH7110_STGRST_PCIE1_CORE		21
+#define JH7110_STGRST_PCIE1_APB			22
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
