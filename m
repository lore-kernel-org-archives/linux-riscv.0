Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0912EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfi5FOCHsubzgQ0VVUCYAjSwhuENIPyJHXgQQ0rX7NM=; b=KrK6D3c4JNLpIS
	ajiI6uoWw+vIZ59dcdqAM2QT2rRyM4P4lv5kh7F270K1VTvq0/WsH93JnyQ4wiT2BAi0nriTgvKau
	2wTW0FkvMEsksjPOXk73jveE0Aq/maGV/Do6762U+b0Pti4C5JdGJ5N1xOzcNhArax/dwshLSkygu
	3QbStAY1dvm9okL6+VgcYd2JpwV6+LrXoFaK6CKsgbzdf5M+81hLLm1Ua0bw4DvXHNxZgmx5pE/GY
	3nQb57d7x5wYuiveTZbkcoqNgFPwp7OluZ7KvLN1pIDtiBiRS9jOdpnhWVJWNpOLJbd+ckONYkqua
	qFpZeofpEX6o5Jc6ETsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW1t-00H1Pg-1M;
	Wed, 12 Jul 2023 09:21:01 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW1n-00H19Y-33
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 09:20:58 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 893F382D6;
	Wed, 12 Jul 2023 17:20:12 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:12 +0800
Received: from localhost.localdomain (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:11 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v7 5/9] dt-bindings: clock: Add StarFive JH7110 Video-Output clock and reset generator
Date: Wed, 12 Jul 2023 17:20:03 +0800
Message-ID: <20230712092007.31013-6-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_022056_368225_064A103C 
X-CRM114-Status: GOOD (  13.07  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-voutcrg.yaml        | 90 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
 3 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
new file mode 100644
index 000000000000..af77bd8c86b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
@@ -0,0 +1,90 @@
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
+    maxItems: 1
+    description: Vout Top core
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
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        power-domains = <&pwrc JH7110_PD_VOUT>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 39acf30db491..016227c64a27 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -270,4 +270,26 @@
 
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
index 2c5d9dcefffa..eaf4a0d84f6a 100644
--- a/include/dt-bindings/reset/starfive,jh7110-crg.h
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -195,4 +195,20 @@
 
 #define JH7110_ISPRST_END			12
 
+/* VOUTCRG resets */
+#define JH7110_VOUTRST_DC8200_AXI		0
+#define JH7110_VOUTRST_DC8200_AHB		1
+#define JH7110_VOUTRST_DC8200_CORE		2
+#define JH7110_VOUTRST_DSITX_DPI		3
+#define JH7110_VOUTRST_DSITX_APB		4
+#define JH7110_VOUTRST_DSITX_RXESC		5
+#define JH7110_VOUTRST_DSITX_SYS		6
+#define JH7110_VOUTRST_DSITX_TXBYTEHS		7
+#define JH7110_VOUTRST_DSITX_TXESC		8
+#define JH7110_VOUTRST_HDMI_TX_HDMI		9
+#define JH7110_VOUTRST_MIPITX_DPHY_SYS		10
+#define JH7110_VOUTRST_MIPITX_DPHY_TXBYTEHS	11
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
