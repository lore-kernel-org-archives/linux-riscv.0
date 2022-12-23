Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qd3uNljPlDKjPwGX/+ybo12EA+M/intm4NPnQxdEwuA=; b=didiJl8cWbIOIl
	Fn/PncCjJkuzkZ6q1s863POzrw7ebOIJrcvwgGcKV0vWFbRa+g0TH7wZUmxkNK0LGH5Uzt+hXvXTA
	qyGyFuRHZWaUfTzurkly0eQ1HD1B1rQJZo8IY1smr2xuSWcEzTAknOd5xqanffP/Ar/8VOlQ7Bk2o
	t9XtCfhy+3IfghDAy3hvKMiTNezJpxqjmnFO50ur7yadfKg3ZJWaF1GZ5ED7ZcafiP73a2NlRTBQr
	AJyrcdoydiiodV9uTqgHIR7hDhkmzPv2+dbxdHetbId59GQ9qbj7M68hdf87CVb6yTD1rzHzZqQOB
	IGdMk2oK3EIJChdNNkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fDJ-006Ln6-HQ; Fri, 23 Dec 2022 10:23:41 +0000
Received: from [61.152.239.75] (helo=ex01.ufhost.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8efZ-005wUc-LK
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 09:49:01 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BCEEE24E2A1;
	Fri, 23 Dec 2022 17:48:03 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 17:48:03 +0800
Received: from localhost.localdomain (183.27.97.120) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 17:48:02 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] dt-bindings: timer: Add timer for StarFive JH7110 SoC
Date: Fri, 23 Dec 2022 17:47:59 +0800
Message-ID: <20221223094801.181315-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
References: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_014850_210698_8093F2FD 
X-CRM114-Status: GOOD (  12.06  )
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

Add bindings for the timer on the JH7110
RISC-V SoC by StarFive Technology Ltd.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../timer/starfive,jh7110-timers.yaml         | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml

diff --git a/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
new file mode 100644
index 000000000000..fe58dc056313
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/starfive,jh7110-timers.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Timers
+
+maintainers:
+  - Samin Guo <samin.guo@starfivetech.com>
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-timers
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: timer channel 0 interrupt
+      - description: timer channel 1 interrupt
+      - description: timer channel 2 interrupt
+      - description: timer channel 3 interrupt
+
+  interrupt-names:
+    items:
+      - const: timer0
+      - const: timer1
+      - const: timer2
+      - const: timer3
+
+  clocks:
+    items:
+      - description: timer channel 0 clock
+      - description: timer channel 1 clock
+      - description: timer channel 2 clock
+      - description: timer channel 3 clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: timer0
+      - const: timer1
+      - const: timer2
+      - const: timer3
+      - const: apb
+
+  resets:
+    items:
+      - description: timer channel 0 reset
+      - description: timer channel 1 reset
+      - description: timer channel 2 reset
+      - description: timer channel 3 reset
+      - description: APB reset
+
+  reset-names:
+    items:
+      - const: timer0
+      - const: timer1
+      - const: timer2
+      - const: timer3
+      - const: apb
+
+  clock-frequency:
+    description: The frequency of the clock that drives the counter, in Hz.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - clock-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    timer@13050000 {
+        compatible = "starfive,jh7110-timers";
+        reg = <0x13050000 0x10000>;
+        interrupts = <69>, <70>, <71> ,<72>;
+        interrupt-names = "timer0", "timer1", "timer2", "timer3";
+        clocks = <&clk 125>,
+                 <&clk 126>,
+                 <&clk 127>,
+                 <&clk 128>,
+                 <&clk 124>;
+        clock-names = "timer0", "timer1",
+                      "timer2", "timer3", "apb";
+        resets = <&rst 118>,
+                 <&rst 119>,
+                 <&rst 120>,
+                 <&rst 121>,
+                 <&rst 117>;
+        reset-names = "timer0", "timer1",
+                      "timer2", "timer3", "apb";
+        clock-frequency = <24000000>;
+    };
+
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
