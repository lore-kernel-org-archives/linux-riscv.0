Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E5C6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3hwOQhlVbqjheaEJfzhdeLI8vPJny3kfFRnegikByw=; b=sqYfWACrfVngPq
	yZ52M3bCnkBPQ01UF77znxw3Xl3Ldm5mHM1urUG9TCdMvDw6k71i1bgA1QSO6Lfy6y+FqUYXiijrB
	QYmT/BcZJPGVZA/Li9ipEN6A4U7+EdzKnJrrqd5t7naS7u7Rn2B5W154cBbvWcKO2TlEAdwTT0fSO
	54sdG38t+VYfOo6HtY9ltu6xeFljFnsJwrIsLQDi+kvselua5MD8iaAhs25jy8GA5GEOTDcWm1zFr
	sITqrvhg/zS0Jj7369aVHAPYcZ9Ar+DLyRVcI33G3XUgHhDX5nbEZDPudhzic6MX/o9MoIrxKOLT2
	T6aEjq8clC50uelEI5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUO6U-00742X-Nv; Tue, 21 Feb 2023 08:34:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUO6R-0073n8-6y
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 08:34:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 67DE724DC13;
	Tue, 21 Feb 2023 16:33:33 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 16:33:33 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 16:33:31 +0800
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
Subject: [PATCH v2 04/11] dt-bindings: clock: Add StarFive JH7110 Image-Signal-Process clock and reset generator
Date: Tue, 21 Feb 2023 16:33:16 +0800
Message-ID: <20230221083323.302471-5-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_003423_537040_89A12CF4 
X-CRM114-Status: GOOD (  13.23  )
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

Add bindings for the Image-Signal-Process clock and reset
generator (ISPCRG) on the JH7110 RISC-V SoC by StarFive Ltd.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-ispcrg.yaml         | 97 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 18 ++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 +++
 3 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
new file mode 100644
index 000000000000..32794f809364
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-ispcrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Image-Signal-Process Clock and Reset Generator
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-ispcrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ISP Top core
+      - description: ISP Top Axi
+      - description: NOC ISP Bus
+      - description: external DVP
+
+  clock-names:
+    items:
+      - const: isp_top_core
+      - const: isp_top_axi
+      - const: noc_bus_isp_axi
+      - const: dvp_clk
+
+  resets:
+    items:
+      - description: ISP Top core
+      - description: ISP Top Axi
+      - description: NOC ISP Bus
+
+  reset-names:
+    items:
+      - const: isp_top_core
+      - const: isp_top_axi
+      - const: noc_bus_isp_axi
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
+  power-domains:
+    maxItems: 1
+    description:
+      ISP domain power
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/power/starfive,jh7110-pmu.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    ispcrg: clock-controller@19810000 {
+        compatible = "starfive,jh7110-ispcrg";
+        reg = <0x19810000 0x10000>;
+        clocks = <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
+                 <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>,
+                 <&syscrg JH7110_SYSCLK_NOC_BUS_ISP_AXI>,
+                 <&dvp_clk>;
+        clock-names = "isp_top_core", "isp_top_axi",
+                      "noc_bus_isp_axi", "dvp_clk";
+        resets = <&syscrg JH7110_SYSRST_ISP_TOP>,
+                 <&syscrg JH7110_SYSRST_ISP_TOP_AXI>,
+                 <&syscrg JH7110_SYSRST_NOC_BUS_ISP_AXI>;
+        reset-names = "isp_top_core",
+                      "isp_top_axi",
+                      "noc_bus_isp_axi";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        power-domains = <&pwrc JH7110_PD_ISP>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 5ac8a4d90a7a..91ee589809c3 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -256,4 +256,22 @@
 
 #define JH7110_STGCLK_END			29
 
+/* ISPCRG clocks */
+#define JH7110_ISPCLK_DOM4_APB_FUNC		0
+#define JH7110_ISPCLK_MIPI_RX0_PXL		1
+#define JH7110_ISPCLK_DVP_INV			2
+#define JH7110_ISPCLK_M31DPHY_CFGCLK_IN		3
+#define JH7110_ISPCLK_M31DPHY_REFCLK_IN		4
+#define JH7110_ISPCLK_M31DPHY_TXCLKESC_LAN0	5
+#define JH7110_ISPCLK_VIN_PCLK			6
+#define JH7110_ISPCLK_VIN_SYS_CLK		7
+#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF0		8
+#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF1		9
+#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF2		10
+#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF3		11
+#define JH7110_ISPCLK_VIN_CLK_P_AXIWR		12
+#define JH7110_ISPCLK_ISPV2_TOP_WRAPPER_CLK_C	13
+
+#define JH7110_ISPCLK_END			14
+
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
index 4a865ded78b8..f23c160ec538 100644
--- a/include/dt-bindings/reset/starfive,jh7110-crg.h
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -179,4 +179,20 @@
 
 #define JH7110_STGRST_END			23
 
+/* ISPCRG resets */
+#define JH7110_ISPRST_ISPV2_TOP_WRAPPER_P	0
+#define JH7110_ISPRST_ISPV2_TOP_WRAPPER_C	1
+#define JH7110_ISPRST_M31DPHY_HW		2
+#define JH7110_ISPRST_M31DPHY_B09_ALWAYS_ON	3
+#define JH7110_ISPRST_VIN_PCLK			4
+#define JH7110_ISPRST_VIN_PIXEL_CLK_IF0		5
+#define JH7110_ISPRST_VIN_PIXEL_CLK_IF1		6
+#define JH7110_ISPRST_VIN_PIXEL_CLK_IF2		7
+#define JH7110_ISPRST_VIN_PIXEL_CLK_IF3		8
+#define JH7110_ISPRST_VIN_SYS_CLK		9
+#define JH7110_ISPRST_VIN_P_AXIRD		10
+#define JH7110_ISPRST_VIN_P_AXIWR		11
+
+#define JH7110_ISPRST_END			12
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
