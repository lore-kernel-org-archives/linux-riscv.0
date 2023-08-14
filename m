Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA47EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33rS6fduAKmJHe8sr6RAuUcuAI6wRMQXympuL4KE3d0=; b=gz3E5QLtt/lUp/
	89rPkFitE0ulHL1AH6KBocpTs139PNyaxsJ9lunCGlFLxd6JHuXpaTurRSd3q/nIIGyMnNA/+pEZ+
	ExAs0MdJWttazr6F/2QZoTAj3YywEOYZlMgeE3aUCNCmnCFt5/mpGCoxjPC2ACXdffLXhxrbr1g7V
	EiPyrC8VSDy6GZF6NdYINss/dV0C+P7vcNm3nfNjn7rjbKDXyGOmFBjCkfETz0BU0NRn8XaPZE+IP
	WS1NinP29Vq2cGIMtX0yq+s+BeEekxM93J/B8zk3RRb2o6mE5WyENWFgAqWugCwIl3f72Jlg2k1xO
	e7yWvjZf4NsNWMok95GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUd4-00GhtV-2b;
	Mon, 14 Aug 2023 10:16:54 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUd1-00Gho9-1F
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 10:16:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 697A282A9;
	Mon, 14 Aug 2023 18:16:05 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 18:16:05 +0800
Received: from localhost.localdomain (183.27.98.20) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 18:16:04 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: timer: Add timer for StarFive JH7110 SoC
Date: Mon, 14 Aug 2023 18:16:01 +0800
Message-ID: <20230814101603.166951-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814101603.166951-1-xingyu.wu@starfivetech.com>
References: <20230814101603.166951-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_031651_835377_A7CAAFAC 
X-CRM114-Status: GOOD (  12.11  )
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

Add bindings for the timer on the JH7110 RISC-V SoC
by StarFive Technology Ltd.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/timer/starfive,jh7110-timer.yaml | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml b/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
new file mode 100644
index 000000000000..9a2dac11eb06
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/starfive,jh7110-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Timer
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+  - Samin Guo <samin.guo@starfivetech.com>
+
+description:
+  This timer has four free-running 32 bit counters in StarFive JH7110 SoC.
+  And each channel(counter) triggers an interrupt when timeout. They support
+  one-shot mode and continuous-run mode.
+
+properties:
+  compatible:
+    const: starfive,jh7110-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: channel 0
+      - description: channel 1
+      - description: channel 2
+      - description: channel 3
+
+  clocks:
+    items:
+      - description: timer APB
+      - description: channel 0
+      - description: channel 1
+      - description: channel 2
+      - description: channel 3
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ch0
+      - const: ch1
+      - const: ch2
+      - const: ch3
+
+  resets:
+    items:
+      - description: timer APB
+      - description: channel 0
+      - description: channel 1
+      - description: channel 2
+      - description: channel 3
+
+  reset-names:
+    items:
+      - const: apb
+      - const: ch0
+      - const: ch1
+      - const: ch2
+      - const: ch3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@13050000 {
+        compatible = "starfive,jh7110-timer";
+        reg = <0x13050000 0x10000>;
+        interrupts = <69>, <70>, <71> ,<72>;
+        clocks = <&clk 124>,
+                 <&clk 125>,
+                 <&clk 126>,
+                 <&clk 127>,
+                 <&clk 128>;
+        clock-names = "apb", "ch0", "ch1",
+                      "ch2", "ch3";
+        resets = <&rst 117>,
+                 <&rst 118>,
+                 <&rst 119>,
+                 <&rst 120>,
+                 <&rst 121>;
+        reset-names = "apb", "ch0", "ch1",
+                      "ch2", "ch3";
+    };
+
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
