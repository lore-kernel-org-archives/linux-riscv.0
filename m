Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F6DC61DB2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZTW6fip/hikuOjXwxOLNVduLDo3wZQNMR+sZpMwmFA=; b=0DnsVYsSDuHDLv
	rWI6EierrVSJvsqaXyi+NuwBpCHCCBi56moh7Cro8tbIUTaZunoV5Vo24l1UfdPzfcMqwy2dENIZ9
	qGD7iWiuKKdwi3Ph8yDqNiIDvjdKqqol8kuWtyBsnckcGI9r4Z0vaNAZskwRcjyEUzVCq35Dpei7f
	TJgiO8JgJaJBk6YMr8m2C7a4PzDJ4Zdoj8Aaymac7jJkDcphPvvEjnk4JvEbSA+cMMovq6eA9SUnJ
	opo5cAhmxidLD/OvDuIVgYLng+UoY00GSPyGaLMxCsjMD/TEFdkf6AoyXlrgfQl6NDQw1xY0DQZag
	fiJWEWWQvHgVZhRYaW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWkE-00000000IPK-0mPN;
	Fri, 06 Jun 2025 13:04:26 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWkA-00000000IMh-2taL
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 13:04:24 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 9A0E2B4C4432;
	Fri,  6 Jun 2025 15:04:19 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v1 1/3] dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
Date: Fri,  6 Jun 2025 06:02:36 -0700
Message-ID: <20250606130253.1105273-2-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606130253.1105273-1-e@freeshell.de>
References: <20250606130253.1105273-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_060422_913650_81BD06B6 
X-CRM114-Status: GOOD (  10.24  )
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

Document bindings for the JH7110 SoC DMC as implemented in downstream
U-Boot driver starfive_ddr.c

Signed-off-by: E Shattow <e@freeshell.de>
---
 .../starfive,jh7110-dmc.yaml                  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml
new file mode 100644
index 000000000000..299c86893db1
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/starfive,jh7110-dmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 DMC
+
+maintainers:
+  - E Shattow <e@freeshell.de>
+
+description:
+  JH7110 DMC as implemented by U-Boot boot loader driver starfive_ddr.c
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jh7110-dmc
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pll1_out
+
+  clock-frequency:
+    enum: [2133, 2800]
+    default: 2133
+
+  resets:
+    minItems: 3
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: axi
+      - const: osc
+      - const: apb
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-frequency
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      memory-controller@15700000 {
+        compatible = "starfive,jh7110-dmc";
+        reg = <0x0 0x15700000 0x0 0x10000>,
+              <0x0 0x13000000 0x0 0x10000>;
+        clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
+        clock-names = "pll1_out";
+        clock-frequency = <2133>;
+        resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
+                 <&syscrg JH7110_SYSRST_DDR_OSC>,
+                 <&syscrg JH7110_SYSRST_DDR_APB>;
+        reset-names = "axi", "osc", "apb";
+      };
+    };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
