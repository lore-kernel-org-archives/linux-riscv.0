Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EAFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNOB14GI1bdq36IjzGsAlKNB1kzpFZlGG4O3ExX9Y/Q=; b=KNrMiToC19AfXJ
	t5nx9PO9APad5kC33LkOKDCbyma0Sal/bxLK1NHjLbJIpzEUgr4HwK4M8MCvYsa4+S3a9lbz/EYIX
	6nQuAyXhT6iKqeXjssGmFMW5SfLr9Yx2phRhw8Pddo7HzCahYA7xW5duAscfYH3UxS6oYLMZIa8nw
	rohF2/uNqlfL06HaBInFgqcgCqJ4gx5J8NJ+574ZUsme9efXhkuWueSrPmS5hxg+2DAekszwTWd5/
	QNXWtnEGU+5y+UwTBWFkVjSuqvqEqQ2jCcBzp9H896pCw3I+qOU5+JFWuazgo3Uj+8YCAv6x06iME
	iDVChriTKRZWViNZ8L1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpr6-0017CI-1F; Fri, 18 Nov 2022 01:07:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpqt-00171P-LE
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:07:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0669124E1DF;
	Fri, 18 Nov 2022 09:06:36 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:36 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:35 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
Date: Fri, 18 Nov 2022 09:06:22 +0800
Message-ID: <20221118010627.70576-10-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118010627.70576-1-hal.feng@starfivetech.com>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_170732_080504_773C433D 
X-CRM114-Status: GOOD (  13.13  )
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

Add bindings for the system clock and reset generator (SYSCRG) on the
JH7110 RISC-V SoC by StarFive Ltd.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../clock/starfive,jh7110-syscrg.yaml         | 80 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
new file mode 100644
index 000000000000..a8cafbc0afe2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 System Clock and Reset Generator
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    const: starfive,jh7110-syscrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main Oscillator (24 MHz)
+      - description: RMII reference clock
+      - description: RGMII RX clock
+      - description: I2S TX bit clock
+      - description: I2S TX left/right clock
+      - description: I2S RX bit clock
+      - description: I2S RX left/right clock
+      - description: TDM
+      - description: mclk
+
+  clock-names:
+    items:
+      - const: osc
+      - const: gmac1_rmii_refin
+      - const: gmac1_rgmii_rxin
+      - const: i2stx_bclk_ext
+      - const: i2stx_lrck_ext
+      - const: i2srx_bclk_ext
+      - const: i2srx_lrck_ext
+      - const: tdm_ext
+      - const: mclk_ext
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive-jh7110.h> for valid indices.
+
+  '#reset-cells':
+    const: 1
+    description:
+      See <dt-bindings/reset/starfive-jh7110.h> for valid indices.
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
+    clock-controller@13020000 {
+        compatible = "starfive,jh7110-syscrg";
+        reg = <0x13020000 0x10000>;
+        clocks = <&osc>, <&gmac1_rmii_refin>,
+                 <&gmac1_rgmii_rxin>,
+                 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
+                 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
+                 <&tdm_ext>, <&mclk_ext>;
+        clock-names = "osc", "gmac1_rmii_refin",
+                      "gmac1_rgmii_rxin",
+                      "i2stx_bclk_ext", "i2stx_lrck_ext",
+                      "i2srx_bclk_ext", "i2srx_lrck_ext",
+                      "tdm_ext", "mclk_ext";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eeab26f5597c..ec6647e2772f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19602,7 +19602,7 @@ STARFIVE CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Hal Feng <hal.feng@starfivetech.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
+F:	Documentation/devicetree/bindings/clock/starfive*
 F:	drivers/clk/starfive/
 F:	include/dt-bindings/clock/starfive*
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
