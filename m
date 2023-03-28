Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226EDC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 06:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOpXHn2pVuCLaBlNGf11IT1Jqn9Zq7fLSyloXi/jdR8=; b=iX8fEYGrASmLav
	3/zHKtwKzhrwRRqE5W97TAtBiAnJA9ym9HjItAZoBHGmNEyvGcqf4t9EwNwyIauaY654+OCDM5UMI
	X98UcLPU20KEc/a3w79RVldqbasL8D+UgQ4k5aS26T1Fyme8idOeRdxTk4bkP017Ovyws6lMWzFoi
	dfCp2uaZ1g3n22R2BLQBXOGwKI/hLnltbwKr2ORp4yDRToQINCQnLGnPyEY8Toqr0yrU0BMA59yoi
	4NcU/eKYeEZhKJ5SrFcnO6auW1f5zU9/V+eZ06pp4+qruxrvOTdR3Z5OideA6JlzrhzByDF3fjEqj
	nKpktDhJBUrmbZ77YRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2hc-00DIKM-2A;
	Tue, 28 Mar 2023 06:21:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2hX-00DIDO-2q
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 06:21:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3A86524E328;
	Tue, 28 Mar 2023 14:20:16 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 14:20:16 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 28 Mar 2023 14:20:14 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [net-next v9 4/6] dt-bindings: net: Add support StarFive dwmac
Date: Tue, 28 Mar 2023 14:20:07 +0800
Message-ID: <20230328062009.25454-5-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230328062009.25454-1-samin.guo@starfivetech.com>
References: <20230328062009.25454-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_232100_221398_2D188DE2 
X-CRM114-Status: GOOD (  15.93  )
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

From: Yanhong Wang <yanhong.wang@starfivetech.com>

Add documentation to describe StarFive dwmac driver(GMAC).

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 144 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 3 files changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index e4519cf722ab..245f7d713261 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -91,6 +91,7 @@ properties:
         - snps,dwmac-5.20
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - starfive,jh7110-dwmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
new file mode 100644
index 000000000000..5861426032bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 StarFive Technology Co., Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 DWMAC glue layer
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+  - Samin Guo <samin.guo@starfivetech.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - starfive,jh7110-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - starfive,jh7110-dwmac
+      - const: snps,dwmac-5.20
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: GMAC AHB clock
+      - description: PTP clock
+      - description: TX clock
+      - description: GTX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+      - const: ptp_ref
+      - const: tx
+      - const: gtx
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+
+  interrupt-names:
+    minItems: 3
+    maxItems: 3
+
+  resets:
+    items:
+      - description: MAC Reset signal.
+      - description: AHB Reset signal.
+
+  reset-names:
+    items:
+      - const: stmmaceth
+      - const: ahb
+
+  starfive,tx-use-rgmii-clk:
+    description:
+      Tx clock is provided by external rgmii clock.
+    type: boolean
+
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that configures phy mode
+          - description: Offset of phy mode selection
+          - description: Shift of phy mode selection
+    description:
+      A phandle to syscon with two arguments that configure phy mode.
+      The argument one is the offset of phy mode selection, the
+      argument two is the shift of phy mode selection.
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+
+examples:
+  - |
+    ethernet@16030000 {
+        compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
+        reg = <0x16030000 0x10000>;
+        clocks = <&clk 3>, <&clk 2>, <&clk 109>,
+                 <&clk 6>, <&clk 111>;
+        clock-names = "stmmaceth", "pclk", "ptp_ref",
+                      "tx", "gtx";
+        resets = <&rst 1>, <&rst 2>;
+        reset-names = "stmmaceth", "ahb";
+        interrupts = <7>, <6>, <5>;
+        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
+        phy-mode = "rgmii-id";
+        snps,multicast-filter-bins = <64>;
+        snps,perfect-filter-entries = <8>;
+        rx-fifo-depth = <2048>;
+        tx-fifo-depth = <2048>;
+        snps,fixed-burst;
+        snps,no-pbl-x8;
+        snps,tso;
+        snps,force_thresh_dma_mode;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,en-tx-lpi-clockgating;
+        snps,txpbl = <16>;
+        snps,rxpbl = <16>;
+        starfive,syscon = <&aon_syscon 0xc 0x12>;
+        phy-handle = <&phy0>;
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "snps,dwmac-mdio";
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+
+        stmmac_axi_setup: stmmac-axi-config {
+            snps,lpi_en;
+            snps,wr_osr_lmt = <4>;
+            snps,rd_osr_lmt = <4>;
+            snps,blen = <256 128 64 32 0 0 0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d8ebab595b2a..7a060ade704d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19905,6 +19905,12 @@ M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
 F:	arch/riscv/boot/dts/starfive/
 
+STARFIVE DWMAC GLUE LAYER
+M:     Emil Renner Berthing <kernel@esmil.dk>
+M:     Samin Guo <samin.guo@starfivetech.com>
+S:     Maintained
+F:     Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+
 STARFIVE JH7100 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
