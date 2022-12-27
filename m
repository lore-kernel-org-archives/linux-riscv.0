Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E735DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qt08u4GZnNmd3eLpkQiQkOis91WlxryWrwHce6Hnj8g=; b=qN5uDuXxEXlmTc
	3HGOJMPNBBrgO/S9aYhEtvyhQs8lRRpicthk4t05bqbzzWd2f03jQpVta5Akqa1cqzqUjVDEDWgJu
	A7snTnsUCvN6KEPwdhwUg68EgwNv0UQ7at8J4DtwzXcVwoPZ7O1mJkBBrD+TCsOgPJrpE2LP7BACA
	vB1TXAgWhozybTn9Nyqwa0Rc0T31Tz0pkFgPfszAS/JWg99wEqForg7H/G/DsztHyTGy3Ptb/rIIl
	EA2qlnYxxanMJsA8v7iTd0nZlQHyXUmUTf6zhp7j8vSaXyHTOcC5H3iJslXcu0V72wuoI1eQCfVAT
	FdGgwnzJnTfZ1qTNjPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA913-00Cq3d-GY; Tue, 27 Dec 2022 12:25:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8ys-00Covk-S4
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 12:23:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1A94C24E1AB;
	Tue, 27 Dec 2022 20:22:30 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 27 Dec
 2022 20:22:30 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 27 Dec 2022 20:22:29 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: mmc: Add bindings for StarFive
Date: Tue, 27 Dec 2022 20:22:25 +0800
Message-ID: <20221227122227.460921-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227122227.460921-1-william.qiu@starfivetech.com>
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_042255_401294_D9EECD23 
X-CRM114-Status: GOOD (  12.98  )
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

Add documentation to describe StarFive
designware mobile storage host controller driver.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 .../bindings/mmc/starfive,jh7110-mmc.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
new file mode 100644
index 000000000000..430dd5f24933
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
@@ -0,0 +1,72 @@
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
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      arg0:arg0 is syscon.
+      arg1:arg1 is syscon register offset, used to enable MMC function.
+      arg2:arg2 is used to enable the register shift of the MMC function.
+      arg3:arg3 is used to enable the register mask of the MMC function.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - starfive,syscon
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
+        starfive,syscon = <&syscon 0x14 0x1a 0x7c000000>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
