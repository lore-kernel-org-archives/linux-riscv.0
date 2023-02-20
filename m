Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69768C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7/QtEnWbwf3xESr5YcKfPWFtGAEn1QOyXE0KZi/PEI=; b=qYvNtkgT/oKAU6
	EnuULWkTAdcrnTMtUsjerALrnBhKyGxau87HRS05qeFJtRT6nTBwK/++cVcKGNGpTfMij5pdPzazr
	6SjOfwGNLTLjvOxJeon4mE8L+pixIoBqEuQ1A1qrAi0ECJpfyhKSDb1+pNZ+GOG60kC/4VlFgRY2f
	VPNVmeL7t9AyRbY+C8NaZ+/7oxeNwJxLDsHeuxPsnZSxVVSWJcbtCiis1DdzRfwkyOB/eF+N1GOXN
	pBbnkqhb6oR6P8Uh8u55AWKzAmKUy2yJqhZKYg8Aoo5/pXvEOj5RG/NtI3EhtwFCtirOXJJYDsLFi
	pNuHzIN3ek0Xchy5vjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1PF-003ILj-81; Mon, 20 Feb 2023 08:20:18 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1On-003IHk-2W
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 08:19:54 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0F1DD24E2C2;
	Mon, 20 Feb 2023 16:19:01 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Feb
 2023 16:19:01 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Feb
 2023 16:19:00 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: watchdog: Add watchdog for StarFive JH7110
Date: Mon, 20 Feb 2023 16:19:25 +0800
Message-ID: <20230220081926.267695-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_001951_850234_4839821D 
X-CRM114-Status: GOOD (  13.00  )
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

Add bindings to describe the watchdog for the StarFive JH7110 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../watchdog/starfive,jh7110-wdt.yaml         | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
new file mode 100644
index 000000000000..05ba7069e29a
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/starfive,jh7110-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Watchdog
+
+maintainers:
+  - Samin Guo <samin.guo@starfivetech.com>
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+description:
+  The watchdog is a 32 bit counter and has two timeout phases.
+  At the first phase, the signal of watchdog interrupt output(WDOGINT)
+  will rise when counter is 0. The counter will reload the timeout value.
+  And then, if counter decreases to 0 again and WDOGINT isn't cleared,
+  the watchdog will reset the system unless the watchdog reset is disabled.
+
+allOf:
+  - $ref: watchdog.yaml#
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
+  reset-names:
+    items:
+      - const: apb
+      - const: core
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@13070000 {
+        compatible = "starfive,jh7110-wdt";
+        reg = <0x13070000 0x10000>;
+        clocks = <&clk 122>,
+                 <&clk 123>;
+        clock-names = "apb", "core";
+        resets = <&rst 109>,
+                 <&rst 110>;
+        reset-names = "apb", "core";
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
