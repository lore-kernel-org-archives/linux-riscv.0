Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A535C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 02:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xq9mo+cXw5oepi8cy9/7aiHkR87K/8Ze4NvZTmPGpB8=; b=mAh0eRCEm4oUwG
	D39GhxgpTP0KBqJmRaN9aeWpD9exgu65d1x8ozdUu8D2WjJA6Q88GC9FpkU7EM3kyv+50Aika2uF9
	WIz0Q5f4TjTNvuKESbrBUK38+uLmi4Oykg/fEZ9RN9XIaM/MDjJzHOuxx6hfHQhgrMipv0A9Fyb/E
	GKO53c8MHlNRqOvbA09d0pP93Y/MBAhaGriC+SKumQz4JX1wfsvGCDT34b7aX+ie966OhTvmzl9sM
	74OL/ah8DVnI44Bid8Wd4v7VMqR/VBPBns+tMNfWMred5jldYMoFTpOt4w5uMFQOFkitA6gBQx04N
	Yp0Jdy+iJgFUX6rmvk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhPa-0087A9-O5; Fri, 20 Jan 2023 02:45:50 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhPI-0086kH-2a
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 02:45:34 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 37D9A24E1F4;
	Fri, 20 Jan 2023 10:44:52 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:52 +0800
Received: from localhost.localdomain (113.72.144.40) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:51 +0800
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
Subject: [PATCH v1 07/11] dt-bindings: clock: Add StarFive JH7110 Video-Output clock and reset generator
Date: Fri, 20 Jan 2023 10:44:41 +0800
Message-ID: <20230120024445.244345-8-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_184532_479068_95A08647 
X-CRM114-Status: GOOD (  12.73  )
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

Add bindings for the Video-Output clock and reset generator (VOUTCRG)
on the JH7110 RISC-V SoC by StarFive Ltd.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-voutcrg.yaml        | 96 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
 3 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
new file mode 100644
index 000000000000..a6a43d86a392
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-voutcrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Video-Output Clock and Reset Generator
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-voutcrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Vout Top core
+      - description: Vout Top Ahb
+      - description: Vout Top Axi
+      - description: Vout Top HDMI MCLK
+      - description: I2STX0 BCLK
+      - description: external HDMI pixel
+
+  clock-names:
+    items:
+      - const: vout_src
+      - const: vout_top_ahb
+      - const: vout_top_axi
+      - const: vout_top_hdmitx0_mclk
+      - const: i2stx0_bclk
+      - const: hdmitx0_pixelclk
+
+  resets:
+    items:
+      - description: Vout Top core
+
+  reset-names:
+    items:
+      - const: vout_top_src
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
+      Vout domain power
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
+    voutcrg: clock-controller@295C0000 {
+        compatible = "starfive,jh7110-voutcrg";
+        reg = <0x295C0000 0x10000>;
+        clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
+                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
+                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
+                 <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
+                 <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
+                 <&hdmitx0_pixelclk>;
+        clock-names = "vout_src", "vout_top_ahb",
+                      "vout_top_axi", "vout_top_hdmitx0_mclk",
+                      "i2stx0_bclk", "hdmitx0_pixelclk";
+        resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
+        reset-names = "vout_top_src";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        power-domains = <&pwrc JH7110_PD_VOUT>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 91ee589809c3..3ebece93cbd3 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -274,4 +274,26 @@
 
 #define JH7110_ISPCLK_END			14
 
+/* VOUTCRG clocks */
+#define JH7110_VOUTCLK_APB			0
+#define JH7110_VOUTCLK_DC8200_PIX		1
+#define JH7110_VOUTCLK_DSI_SYS			2
+#define JH7110_VOUTCLK_TX_ESC			3
+#define JH7110_VOUTCLK_DC8200_AXI		4
+#define JH7110_VOUTCLK_DC8200_CORE		5
+#define JH7110_VOUTCLK_DC8200_AHB		6
+#define JH7110_VOUTCLK_DC8200_PIX0		7
+#define JH7110_VOUTCLK_DC8200_PIX1		8
+#define JH7110_VOUTCLK_DOM_VOUT_TOP_LCD		9
+#define JH7110_VOUTCLK_DSITX_APB		10
+#define JH7110_VOUTCLK_DSITX_SYS		11
+#define JH7110_VOUTCLK_DSITX_DPI		12
+#define JH7110_VOUTCLK_DSITX_TXESC		13
+#define JH7110_VOUTCLK_MIPITX_DPHY_TXESC	14
+#define JH7110_VOUTCLK_HDMI_TX_MCLK		15
+#define JH7110_VOUTCLK_HDMI_TX_BCLK		16
+#define JH7110_VOUTCLK_HDMI_TX_SYS		17
+
+#define JH7110_VOUTCLK_END			18
+
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
index 1b40df62cdac..f89589610cf5 100644
--- a/include/dt-bindings/reset/starfive,jh7110-crg.h
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -195,4 +195,20 @@
 
 #define JH7110_ISPRST_END			12
 
+/* VOUTCRG resets */
+#define	JH7110_VOUTRST_DC8200_AXI		0
+#define	JH7110_VOUTRST_DC8200_AHB		1
+#define	JH7110_VOUTRST_DC8200_CORE		2
+#define	JH7110_VOUTRST_DSITX_DPI		3
+#define	JH7110_VOUTRST_DSITX_APB		4
+#define	JH7110_VOUTRST_DSITX_RXESC		5
+#define	JH7110_VOUTRST_DSITX_SYS		6
+#define	JH7110_VOUTRST_DSITX_TXBYTEHS		7
+#define	JH7110_VOUTRST_DSITX_TXESC		8
+#define	JH7110_VOUTRST_HDMI_TX_HDMI		9
+#define	JH7110_VOUTRST_MIPITX_DPHY_SYS		10
+#define	JH7110_VOUTRST_MIPITX_DPHY_TXBYTEHS	11
+
+#define JH7110_VOUTRST_END			12
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
