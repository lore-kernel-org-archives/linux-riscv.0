Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50178C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0vr8mukJ4RNJ9Pcf5dGz4+4HyKImTaLjZGOe1zBCgE=; b=3cfkhRbHhbZ7jU
	/MI5cBBhH+JIhE/uBiV3MdRjwwQqeJZSqn9on+FIL9WW0jXl+tev/OgEY0MxSZ8XcYYe+wu8PQT6m
	eaqqo/2ynJ2D9d4fKx1UJ5zDajUKC0nXCJko45EWFLhq7W3Jo0xT6JcRVRR4fskRTgjyzia1Jpoj8
	rX3QdcKR5tCuFYXP9UI5D1B0/nq2/GLAeMT+c0WUD7cc8XWe2H9mdQLRzIIHi8SGSvXuxzXQXlaAe
	Fbvm4yt7gYA09EVsk6n4kDh7eY++w2QwT7SJxRqJGtkfHdEcUpOu4H6aJj0HhJxszt0Fbds0rNRuz
	0VVxTbd1JJQUbQJ0p1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCul-008f6d-2w;
	Mon, 20 Mar 2023 10:38:55 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCuc-008epu-1t
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 10:38:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 922C224E2B1;
	Mon, 20 Mar 2023 18:38:02 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 18:38:02 +0800
Received: from ubuntu.localdomain (183.27.97.64) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 18:38:01 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 12/21] dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
Date: Mon, 20 Mar 2023 18:37:41 +0800
Message-ID: <20230320103750.60295-13-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320103750.60295-1-hal.feng@starfivetech.com>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_033846_924994_C9CB72B4 
X-CRM114-Status: GOOD (  12.62  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add bindings for the always-on clock and reset generator (AONCRG) on the
JH7110 RISC-V SoC by StarFive Ltd.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../clock/starfive,jh7110-aoncrg.yaml         | 107 ++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   |  18 +++
 .../dt-bindings/reset/starfive,jh7110-crg.h   |  12 ++
 3 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
new file mode 100644
index 000000000000..923680a44aef
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Always-On Clock and Reset Generator
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    const: starfive,jh7110-aoncrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    oneOf:
+      - items:
+          - description: Main Oscillator (24 MHz)
+          - description: GMAC0 RMII reference or GMAC0 RGMII RX
+          - description: STG AXI/AHB
+          - description: APB Bus
+          - description: GMAC0 GTX
+
+      - items:
+          - description: Main Oscillator (24 MHz)
+          - description: GMAC0 RMII reference or GMAC0 RGMII RX
+          - description: STG AXI/AHB or GMAC0 RGMII RX
+          - description: APB Bus or STG AXI/AHB
+          - description: GMAC0 GTX or APB Bus
+          - description: RTC Oscillator (32.768 kHz) or GMAC0 GTX
+
+      - items:
+          - description: Main Oscillator (24 MHz)
+          - description: GMAC0 RMII reference
+          - description: GMAC0 RGMII RX
+          - description: STG AXI/AHB
+          - description: APB Bus
+          - description: GMAC0 GTX
+          - description: RTC Oscillator (32.768 kHz)
+
+  clock-names:
+    oneOf:
+      - minItems: 5
+        items:
+          - const: osc
+          - enum:
+              - gmac0_rmii_refin
+              - gmac0_rgmii_rxin
+          - const: stg_axiahb
+          - const: apb_bus
+          - const: gmac0_gtxclk
+          - const: rtc_osc
+
+      - minItems: 6
+        items:
+          - const: osc
+          - const: gmac0_rmii_refin
+          - const: gmac0_rgmii_rxin
+          - const: stg_axiahb
+          - const: apb_bus
+          - const: gmac0_gtxclk
+          - const: rtc_osc
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
+    clock-controller@17000000 {
+        compatible = "starfive,jh7110-aoncrg";
+        reg = <0x17000000 0x10000>;
+        clocks = <&osc>, <&gmac0_rmii_refin>,
+                 <&gmac0_rgmii_rxin>,
+                 <&syscrg JH7110_SYSCLK_STG_AXIAHB>,
+                 <&syscrg JH7110_SYSCLK_APB_BUS>,
+                 <&syscrg JH7110_SYSCLK_GMAC0_GTXCLK>,
+                 <&rtc_osc>;
+        clock-names = "osc", "gmac0_rmii_refin",
+                      "gmac0_rgmii_rxin", "stg_axiahb",
+                      "apb_bus", "gmac0_gtxclk",
+                      "rtc_osc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index fdd1852e34cc..06257bfd9ac1 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -200,4 +200,22 @@
 
 #define JH7110_SYSCLK_END			190
 
+/* AONCRG clocks */
+#define JH7110_AONCLK_OSC_DIV4			0
+#define JH7110_AONCLK_APB_FUNC			1
+#define JH7110_AONCLK_GMAC0_AHB			2
+#define JH7110_AONCLK_GMAC0_AXI			3
+#define JH7110_AONCLK_GMAC0_RMII_RTX		4
+#define JH7110_AONCLK_GMAC0_TX			5
+#define JH7110_AONCLK_GMAC0_TX_INV		6
+#define JH7110_AONCLK_GMAC0_RX			7
+#define JH7110_AONCLK_GMAC0_RX_INV		8
+#define JH7110_AONCLK_OTPC_APB			9
+#define JH7110_AONCLK_RTC_APB			10
+#define JH7110_AONCLK_RTC_INTERNAL		11
+#define JH7110_AONCLK_RTC_32K			12
+#define JH7110_AONCLK_RTC_CAL			13
+
+#define JH7110_AONCLK_END			14
+
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
index b88216a4fe40..d78e38690ceb 100644
--- a/include/dt-bindings/reset/starfive,jh7110-crg.h
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -139,4 +139,16 @@
 
 #define JH7110_SYSRST_END			126
 
+/* AONCRG resets */
+#define JH7110_AONRST_GMAC0_AXI			0
+#define JH7110_AONRST_GMAC0_AHB			1
+#define JH7110_AONRST_IOMUX			2
+#define JH7110_AONRST_PMU_APB			3
+#define JH7110_AONRST_PMU_WKUP			4
+#define JH7110_AONRST_RTC_APB			5
+#define JH7110_AONRST_RTC_CAL			6
+#define JH7110_AONRST_RTC_32K			7
+
+#define JH7110_AONRST_END			8
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__ */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
