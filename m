Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26ACC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AW/AZ2dMrTdmdVO4elL3y1Deu5DYYKoXDk6+LfdxkGo=; b=kOdh2ddgEw5pwZ
	u2QJnNa5nnIKCmCrO9GlGuVQWGOps207FUpQneycmQY0lEUXaCXhKKCL7lgqdvjeLpsxu4/VrnSqh
	qYMOPoYJW5jJSxDlGQmu0NwikifFRjPj//rsirFdoybUU9GYo5Vlmu9ZFPyBn1+jW90fWgglBw1OW
	Jz0N7f8PENc+9S7NLRfvncM/LNAxr88EyfoMfPCzoq5ovdy63jlo2sW92gfU80/rqcsiWEQe+NX/B
	VZvidBDPllozSI2e5TN6VKL3ahSpY0zpVNp4GcPv+tg73svV9AamIZAtU4xR+y/xJWlDl7Xo0fMwh
	YPWCYIL3DPA7JeLcko/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1Uf-00495q-E3; Fri, 18 Nov 2022 13:33:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1Uc-0048nz-2C
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 13:33:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C81FE24E1A6;
	Fri, 18 Nov 2022 21:32:28 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 21:32:28 +0800
Received: from localhost.localdomain (183.27.96.116) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 21:32:27 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/4] dt-bindings: power: Add starfive,jh71xx-power bindings
Date: Fri, 18 Nov 2022 21:32:14 +0800
Message-ID: <20221118133216.17037-3-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221118133216.17037-1-walker.chen@starfivetech.com>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_053318_281501_1129D917 
X-CRM114-Status: GOOD (  12.22  )
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

Add bindings for the power domain controller on the StarFive JH71XX SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../bindings/power/starfive,jh71xx-power.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml

diff --git a/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
new file mode 100644
index 000000000000..2537303b4829
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/starfive,jh71xx-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH71xx Power Domains Controller
+
+maintainers:
+  - Walker Chen <walker.chen@starfivetech.com>
+
+description: |
+  StarFive JH71xx SoCs include support for multiple power domains which can be
+  powered on/off by software based on different application scenes to save power.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - starfive,jh7110-pmu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwrc: power-controller@17030000 {
+        compatible = "starfive,jh7110-pmu";
+        reg = <0x17030000 0x10000>;
+        interrupts = <111>;
+        #power-domain-cells = <1>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
