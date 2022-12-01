Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96095C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgXVetrd0smKvzEJgX36eI+M53smBaFxWg6c+OBAkUY=; b=GUd2lKB+tHe5H0
	LWDKkEvUf39Ufc0jL1czsSDZ0IpQrNLIIg/LCLQgpfJAin9OGyoXfz7reP8JZkIau7kT9U7Ac3Nop
	EI2/BAG+XGHslMruGb594w8PhgB/gNSA3FSp6hW/HTBAP9+KLUQo8cymxCGLpNzJJygVNqCC241CL
	NhCB7TWiCSdYq9iqgmIIMQQyvuaOVqdRH6EhgsdoO0mKn/6b+35nxbm+hERqiHm0l2xc38IIi4wwt
	DmRtqAejYwbyNs4wic3hqEMH2AvEZIm8uVkS6oSb3npUOxtJdbHp4YtsNyNlQ5qY0Ssxl0z2tGRQc
	69h456ep45U2hZdqOmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fTD-0068WZ-EA; Thu, 01 Dec 2022 09:03:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fSy-00687h-Nx
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:02:51 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1F87A24E0AC;
	Thu,  1 Dec 2022 17:02:06 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:02:06 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 1 Dec 2022 17:02:04 +0800
From: Yanhong Wang <yanhong.wang@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Date: Thu, 1 Dec 2022 17:02:38 +0800
Message-ID: <20221201090242.2381-4-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_010249_082639_F1EA7C15 
X-CRM114-Status: GOOD (  14.06  )
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

Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../bindings/net/starfive,dwmac-plat.yaml     | 106 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 3 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index d8779d3de3d6..13c5928d7170 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -33,6 +33,7 @@ select:
           - snps,dwmac-5.20
           - snps,dwxgmac
           - snps,dwxgmac-2.10
+          - starfive,dwmac
 
           # Deprecated
           - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
new file mode 100644
index 000000000000..561cf2a713ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 StarFive Technology Co., Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/net/dwmac-starfive.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: StarFive DWMAC glue layer
+
+maintainers:
+  - Yanhong Wang <yanhong.wang@starfivetech.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - starfive,dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: "snps,dwmac.yaml#"
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+               - starfive,dwmac
+          - const: snps,dwmac-5.20
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: GMAC AHB clock
+      - description: PTP clock
+      - description: TX clock
+      - description: GTXC clock
+      - description: GTX clock
+
+  clock-names:
+    contains:
+      enum:
+        - stmmaceth
+        - pclk
+        - ptp_ref
+        - tx
+        - gtxc
+        - gtx
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive-jh7110.h>
+    #include <dt-bindings/reset/starfive-jh7110.h>
+
+    stmmac_axi_setup: stmmac-axi-config {
+        snps,wr_osr_lmt = <4>;
+        snps,rd_osr_lmt = <4>;
+        snps,blen = <256 128 64 32 0 0 0>;
+    };
+
+    gmac0: ethernet@16030000 {
+        compatible = "starfive,dwmac", "snps,dwmac-5.20";
+        reg = <0x16030000 0x10000>;
+        clocks = <&aoncrg_clk JH7110_AONCLK_GMAC0_AXI>,
+                 <&aoncrg_clk JH7110_AONCLK_GMAC0_AHB>,
+                 <&syscrg_clk JH7110_SYSCLK_GMAC0_PTP>,
+                 <&aoncrg_clk JH7110_AONCLK_GMAC0_TX>,
+                 <&syscrg_clk JH7110_SYSCLK_GMAC0_GTXC>,
+                 <&syscrg_clk JH7110_SYSCLK_GMAC0_GTXCLK>;
+        clock-names = "stmmaceth",
+                      "pclk",
+                      "ptp_ref",
+                      "tx",
+                      "gtxc",
+                      "gtx";
+        resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
+                 <&aoncrg JH7110_AONRST_GMAC0_AHB>;
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
+        snps,force_thresh_dma_mode;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,tso;
+        snps,en-tx-lpi-clockgating;
+        snps,lpi_en;
+        snps,txpbl = <16>;
+        snps,rxpbl = <16>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a70c1d0f303e..7eaaec8d3b96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19606,6 +19606,11 @@ F:	Documentation/devicetree/bindings/clock/starfive*
 F:	drivers/clk/starfive/
 F:	include/dt-bindings/clock/starfive*
 
+STARFIVE DWMAC GLUE LAYER
+M:	Yanhong Wang <yanhong.wang@starfivetech.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
+
 STARFIVE PINCTRL DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Jianlong Huang <jianlong.huang@starfivetech.com>
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
