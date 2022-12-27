Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B9CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qt08u4GZnNmd3eLpkQiQkOis91WlxryWrwHce6Hnj8g=; b=KhbydsIIE7/abm
	ZPUPqMKnlvjD6WRo/J0z0qzzj6o02pl4n6KeO1vPfJscNsrX05xrkS2uomZtF6F0FJQ7pAzKACTQX
	9lagqJX1TgA7cvqJ5GFa1N4ZyuZtaNvbRjExO2tiqpCbF1FkoXESbZE+6elQtSI6J4NG4w2MAq1zk
	7G8gU5bNuAmGziiAU1Jjh3xp1QyxASLCBvZ2syNjfnmKKv4La3FIP/x5GO3EaUjddO2/LtrPJ0E24
	dCtBPmE4leaiN2hb+4Y4VXr4HTTwxKjzwwxIJtaWehxORPf2bsa7HE99mTQ6syA75ggQAlk0091nt
	LrABjQHkp/KF4F+urjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8dp-00Cf3h-W0; Tue, 27 Dec 2022 12:01:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8cc-00CeMJ-25
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 11:59:58 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5944824DDB2;
	Tue, 27 Dec 2022 19:59:07 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 27 Dec
 2022 19:59:06 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 27 Dec 2022 19:59:05 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@linux.starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: mmc: Add bindings for StarFive
Date: Tue, 27 Dec 2022 19:58:54 +0800
Message-ID: <20221227115856.460790-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227115856.460790-1-william.qiu@starfivetech.com>
References: <20221227115856.460790-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_035954_792321_9839E886 
X-CRM114-Status: GOOD (  12.56  )
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
