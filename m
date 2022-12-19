Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EFDC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lu3E1dm4jvVY0I1J6nnKbvaFrXmgt00X2q9ibzk/unQ=; b=i0DZHKRh+1RY8P
	RsNXktUTGBIEj6aEm971Znr1nX68pESSfC+YRaEBxJlOChkI3rQ1sx+X8KPJkDfj3KTC0CCAaDyt7
	MW2QgryVPGxFg7CppNIwiiaF10DKlED+d5J5zu8LXmQd0p4AsjJiQR0ZsFFKfY06cx00J6/3aPT8T
	p+zUMI/A7n6K+FJG1edyx7QGRmDHV/vPHJoleK2nhUbP5Wv84KLZ8/oz7yQfPCdepUuT+6mepy/+t
	l1SgNEhq5KmlIgvzV3BxerIuXFTPrd4jCMPQPj8SrWwvmFzPtl6Pgvamx9LT6vP+iWLKzYc1f4PM3
	OfrvcIAkoh+l319MMNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Cge-00BOiH-S6; Mon, 19 Dec 2022 09:43:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7CgC-00BNur-00
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 09:43:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9324C24E137;
	Mon, 19 Dec 2022 17:42:40 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 19 Dec
 2022 17:42:40 +0800
Received: from localhost.localdomain (183.27.97.120) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 19 Dec
 2022 17:42:39 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: watchdog: Add watchdog for StarFive JH7110
Date: Mon, 19 Dec 2022 17:42:31 +0800
Message-ID: <20221219094233.179153-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_014328_337964_9A8E1AB2 
X-CRM114-Status: GOOD (  11.91  )
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
 .../watchdog/starfive,jh7110-wdt.yaml         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
new file mode 100644
index 000000000000..a7bfe0751928
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
@@ -0,0 +1,64 @@
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
+additionalProperties: false
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
