Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143FEC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTzaRDTb1RvHTzCVUoUkW5Zt8Ctnq8sfRdfficogt2I=; b=tyUoxNwbRU71BC
	Fe7WeKTalm2CuBAg6jdJxQjfe8HaP4EdHM9IH0sOKCrAb+ICcUufn/imThVaAzAEKZR2av63guwSI
	0i2dYML52JXjhxhqAV+0D+fSmsh3tAktR5H78nTAjrhk1fvtgMFFiG5uW1OHle6i6kIZOhTmdYO7o
	TpJoP012HAKUzuefo9aUc1Zj+vJZ2rk38/q/W+9wOQSQPiUWxZtbn9+bGGEC+HMupodR2D4fcIv+j
	cc6qxBfaFExuca1mZgUcYBxUYXO9tOiTyZCnVSfwDPud0VOKGnSg/h8EL0GNu/vWki5SxdBUFNXoc
	TOGDDszHkaroHID6q0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSG2K-005cFA-IC; Wed, 15 Feb 2023 11:33:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSG2H-005c7t-9A
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 11:33:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A845F24E2A9;
	Wed, 15 Feb 2023 19:32:51 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 19:32:51 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 15 Feb 2023 19:32:50 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: mmc: Add StarFive MMC module
Date: Wed, 15 Feb 2023 19:32:46 +0800
Message-ID: <20230215113249.47727-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215113249.47727-1-william.qiu@starfivetech.com>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_033317_653289_9C890775 
X-CRM114-Status: GOOD (  12.38  )
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

Add documentation to describe StarFive designware mobile storage
host controller driver.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mmc/starfive,jh7110-mmc.yaml     | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
new file mode 100644
index 000000000000..51e1b04e799f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/starfive,jh7110-mmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Designware Mobile Storage Host Controller
+
+description:
+  StarFive uses the Synopsys designware mobile storage host controller
+  to interface a SoC with storage medium such as eMMC or SD/MMC cards.
+
+allOf:
+  - $ref: synopsys-dw-mshc-common.yaml#
+
+maintainers:
+  - William Qiu <william.qiu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-mmc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: biu clock
+      - description: ciu clock
+
+  clock-names:
+    items:
+      - const: biu
+      - const: ciu
+
+  interrupts:
+    maxItems: 1
+
+  starfive,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller syscon node
+          - description: offset of SYS_SYSCONSAIF__SYSCFG register for MMC controller
+          - description: shift of SYS_SYSCONSAIF__SYSCFG register for MMC controller
+          - description: mask of SYS_SYSCONSAIF__SYSCFG register for MMC controller
+    description:
+      Should be four parameters, the phandle to System Register Controller
+      syscon node and the offset/shift/mask of SYS_SYSCONSAIF__SYSCFG register
+      for MMC controller.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - starfive,sysreg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc@16010000 {
+        compatible = "starfive,jh7110-mmc";
+        reg = <0x16010000 0x10000>;
+        clocks = <&syscrg 91>,
+                 <&syscrg 93>;
+        clock-names = "biu","ciu";
+        resets = <&syscrg 64>;
+        reset-names = "reset";
+        interrupts = <74>;
+        fifo-depth = <32>;
+        fifo-watermark-aligned;
+        data-addr = <0>;
+        starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
