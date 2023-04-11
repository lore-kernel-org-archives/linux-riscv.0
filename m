Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1150C77B70
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2bCFQOaZfHoLONPG2rMlW9NUVELe0LksiSZVE80kRQ=; b=YbuwpHwicV02RH
	UbLBFpYT7C/v9vK/6JI0TUvMJYJ3a5oyZ4tzQBP0PSHYg5uyWuGbqcmw6l0/Jk380vojzsOQzFGv3
	fi2OThzqlYPXX3ZlrSBjsxPcbJe4gWNURVSRU4mprK4/N5YHfOZbP0sKK8HxfiwSxJhTkt6GnYT9M
	Swxbv5MjYulgV04bxpifksbqvy0Gzbsi3Z9EGxChpF+/H5lf9lGy62aseL4V3auKUuR2KQsE88Je2
	6Bthm2htMlYzZi5B0SSzds8YTCYpl9TA2GAGtqewWv+jcogMBo9qzqj3ls7UlpSEYKiYpwSo72b5w
	lHy88sQRKNFfbbpyzh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEUD-000AqA-1C;
	Tue, 11 Apr 2023 13:56:41 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEU6-000AjO-2L
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 13:56:39 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EB2F424E1B6;
	Tue, 11 Apr 2023 21:56:07 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 21:56:07 +0800
Received: from localhost.localdomain (113.72.145.176) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 21:56:06 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v4 04/10] dt-bindings: clock: Add StarFive JH7110 Image-Signal-Process clock and reset generator
Date: Tue, 11 Apr 2023 21:55:52 +0800
Message-ID: <20230411135558.44282-5-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411135558.44282-1-xingyu.wu@starfivetech.com>
References: <20230411135558.44282-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_065635_211708_B0FE0FBF 
X-CRM114-Status: GOOD (  12.41  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../clock/starfive,jh7110-ispcrg.yaml         | 87 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 18 ++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
 3 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
new file mode 100644
index 000000000000..3b8b85be5cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
@@ -0,0 +1,87 @@
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
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        power-domains = <&pwrc JH7110_PD_ISP>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 6c8e8b4cf1f6..39acf30db491 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -252,4 +252,22 @@
 
 #define JH7110_STGCLK_END			29
 
+/* ISPCRG clocks */
+#define JH7110_ISPCLK_DOM4_APB_FUNC		0
+#define JH7110_ISPCLK_MIPI_RX0_PXL		1
+#define JH7110_ISPCLK_DVP_INV			2
+#define JH7110_ISPCLK_M31DPHY_CFG_IN		3
+#define JH7110_ISPCLK_M31DPHY_REF_IN		4
+#define JH7110_ISPCLK_M31DPHY_TX_ESC_LAN0	5
+#define JH7110_ISPCLK_VIN_APB			6
+#define JH7110_ISPCLK_VIN_SYS			7
+#define JH7110_ISPCLK_VIN_PIXEL_IF0		8
+#define JH7110_ISPCLK_VIN_PIXEL_IF1		9
+#define JH7110_ISPCLK_VIN_PIXEL_IF2		10
+#define JH7110_ISPCLK_VIN_PIXEL_IF3		11
+#define JH7110_ISPCLK_VIN_P_AXI_WR		12
+#define JH7110_ISPCLK_ISPV2_TOP_WRAPPER_C	13
+
+#define JH7110_ISPCLK_END			14
+
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
index 4e96ab81dd8e..2c5d9dcefffa 100644
--- a/include/dt-bindings/reset/starfive,jh7110-crg.h
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -179,4 +179,20 @@
 
 #define JH7110_STGRST_END			23
 
+/* ISPCRG resets */
+#define JH7110_ISPRST_ISPV2_TOP_WRAPPER_P	0
+#define JH7110_ISPRST_ISPV2_TOP_WRAPPER_C	1
+#define JH7110_ISPRST_M31DPHY_HW		2
+#define JH7110_ISPRST_M31DPHY_B09_AON		3
+#define JH7110_ISPRST_VIN_APB			4
+#define JH7110_ISPRST_VIN_PIXEL_IF0		5
+#define JH7110_ISPRST_VIN_PIXEL_IF1		6
+#define JH7110_ISPRST_VIN_PIXEL_IF2		7
+#define JH7110_ISPRST_VIN_PIXEL_IF3		8
+#define JH7110_ISPRST_VIN_SYS			9
+#define JH7110_ISPRST_VIN_P_AXI_RD		10
+#define JH7110_ISPRST_VIN_P_AXI_WR		11
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
