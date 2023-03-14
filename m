Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785C6C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4t3h1wzUR1WoR0dBwbPKJ1K2uqtDmNt0/547R7e6/ng=; b=fnpte7Vhg0IgII
	QeaNtOjFOhm6o3A6DwEr9T0UH+yKHwp5UYuOjc20Cg81RKS4U3bJroR9Qii/cmCYxTfY/2Ln9iPp7
	FuIa4NBwHrh5qDFuoGPXCdjIsKFpdPcd9cGmI3phiwCAWtQsPApizmd5HVZns4kU1Axv/EHhWjWxy
	DTXRCj3FtwDyF0tO2x2uS4Q8t0p0RWsKEREXpn4Ss67XE+7uGRxxxmNgDs3fS0aMdXZfkLLF/2ivk
	yitTClulox/96gIpe0iINoznM0Uw9kGolIJGJ3XtI+XF6eOI57F0B1A/7a3pTsGFCUBj5xG8rYA/6
	dM3OY61cKjBPAizN+fGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4eO-00AHh7-2E;
	Tue, 14 Mar 2023 13:25:12 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4eJ-00AHd3-2x
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 13:25:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 76F7124E300;
	Tue, 14 Mar 2023 21:24:42 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 21:24:42 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 21:24:38 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/3] dt-bindings: watchdog: Add watchdog for StarFive JH7100 and JH7110
Date: Tue, 14 Mar 2023 21:24:35 +0800
Message-ID: <20230314132437.121534-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314132437.121534-1-xingyu.wu@starfivetech.com>
References: <20230314132437.121534-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_062508_587473_53C7599F 
X-CRM114-Status: GOOD (  12.89  )
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

Add bindings to describe the watchdog for the StarFive JH7100/JH7110 SoC.
And Use JH7100 as first StarFive SoC with watchdog.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../watchdog/starfive,jh7100-wdt.yaml         | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
new file mode 100644
index 000000000000..68f3f6fd08a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/starfive,jh7100-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Watchdog for JH7100 and JH7110 SoC
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+  - Samin Guo <samin.guo@starfivetech.com>
+
+description:
+  The JH7100 and JH7110 watchdog both are 32 bit counters. JH7100 watchdog
+  has only one timeout phase and reboots. And JH7110 watchdog has two
+  timeout phases. At the first phase, the signal of watchdog interrupt
+  output(WDOGINT) will rise when counter is 0. The counter will reload
+  the timeout value. And then, if counter decreases to 0 again and WDOGINT
+  isn't cleared, the watchdog will reset the system unless the watchdog
+  reset is disabled.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7100-wdt
+      - starfive,jh7110-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB clock
+      - description: Core clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: core
+
+  resets:
+    items:
+      - description: APB reset
+      - description: Core reset
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@12480000 {
+        compatible = "starfive,jh7100-wdt";
+        reg = <0x12480000 0x10000>;
+        clocks = <&clk 171>,
+                 <&clk 172>;
+        clock-names = "apb", "core";
+        resets = <&rst 99>,
+                 <&rst 100>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
