Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D006FC47088
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JH70dnK5OGOMVmjPM4vUkmayfBQ3nJ66pTblKcP3Lkw=; b=34N0qvnost/AjE
	+MMXjhs576JSQOplTg3IVJMYQx+aMsSroppuSXzSQ4t8kv3dlkbUyj8P9W4xQ7Frl3akwYThnbN+L
	SLE/4KSXrYE8LMdSPjxn0xYn8m9jXibXe74qMXcloLzXtK0YXSs1hRqFXmRuClMNzuKv60Zf0fuma
	H4bLsPjU6hjJmTf0T0zLXUjAox3QXL3U2ZiawkWbgeaEXb8gpyrRk4J7NbWKMldoLU9vzpe70eaF/
	p7E9cnBFjrdtUd5iKsDrbE19+xzB+U/m/QMUarj2DttnZfJQMENthW3LL8JMOX2nMR3MAlAHv5Mt2
	2Tc7yDi6T/FmKGnHw3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12ZK-00F4hj-G5; Fri, 02 Dec 2022 09:42:54 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12ZH-00F4bI-ME
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 09:42:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 531BB24E248;
	Fri,  2 Dec 2022 17:41:55 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 17:39:46 +0800
Received: from localhost.localdomain (113.72.147.18) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 17:39:45 +0800
From: xingu.wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] dt-bindings: watchdog: Add watchdog for StarFive
Date: Fri, 2 Dec 2022 17:39:41 +0800
Message-ID: <20221202093943.149674-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.147.18]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_014252_009664_9C519690 
X-CRM114-Status: GOOD (  12.29  )
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

From: Xingyu Wu <xingyu.wu@starfivetech.com>

Add bindings to describe the watchdog for the StarFive SoCs.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/watchdog/starfive,wdt.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
new file mode 100644
index 000000000000..ece3e80153a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/starfive,wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Watchdog
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Samin Guo <samin.guo@starfivetech.com>
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: core_clk
+      - const: apb_clk
+
+  resets:
+    items:
+      - description: APB reset
+      - description: Core reset
+
+  reset-names:
+    items:
+      - const: rst_apb
+      - const: rst_core
+
+  timeout-sec: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - timeout-sec
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive-jh7110.h>
+    #include <dt-bindings/reset/starfive-jh7110.h>
+
+    watchdog@13070000 {
+            compatible = "starfive,jh7110-wdt";
+            reg = <0x13070000 0x10000>;
+            interrupts = <68>;
+            clocks = <&syscrg_clk JH7110_SYSCLK_WDT_CORE>,
+                     <&syscrg_clk JH7110_SYSCLK_WDT_APB>;
+            clock-names = "core_clk", "apb_clk";
+            resets = <&syscrg_rst JH7110_SYSRST_WDT_APB>,
+                     <&syscrg_rst JH7110_SYSRST_WDT_CORE>;
+            reset-names = "rst_apb", "rst_core";
+            timeout-sec = <15>;
+    };
+
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
