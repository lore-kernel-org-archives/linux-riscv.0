Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99977EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJvVRNKcelUyfIav+YyHbMeDkuNW8lh/5KGWXZaE3qY=; b=jGPiZmymWMIMLT
	y/waXFGOmtn93jowImAZAi0DqabLa9Vq5okoDJtlMrl8FN7/PxXg8+2KBLvJ04qvINOet7cHstoRu
	h6NJ92o/2fFaiQDN9Nz59Sph6S3Bhe84EJVVPghTDTqvcCg98oiZwMBeUYw2kvna8OiW6PqiAW9mM
	bwIWPtMjSj+SmcLFQj/8G3XeByD5L5h51JF94W036UnJsODqCruhDmEz29xbtuoL9vaXOfIjxInlB
	Q8CG7c5auqeaDBqZOKLYUUplMeBx2g5EHakfmLp7EXaXLhY/H7f2aKIZc2QP7/Nkrh4spc57sYmcp
	rrdC9rI4uT6TzzKF9uCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94Co-008CjK-33;
	Tue, 13 Jun 2023 13:37:06 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94Ci-008CdT-1F
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 13:37:05 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D58CB24DCF1;
	Tue, 13 Jun 2023 21:36:11 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Jun
 2023 20:58:55 +0800
Received: from localhost.localdomain (113.72.145.34) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Jun
 2023 20:58:54 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, "William
 Qiu" <william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v5 2/7] dt-bindings: soc: starfive: Add StarFive syscon module
Date: Tue, 13 Jun 2023 20:58:47 +0800
Message-ID: <20230613125852.211636-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.34]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_063700_889362_556F3331 
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

From: William Qiu <william.qiu@starfivetech.com>

Add documentation to describe StarFive System Controller Registers.

Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 .../soc/starfive/starfive,jh7110-syscon.yaml  | 62 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
new file mode 100644
index 000000000000..a81190f8a54d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 SoC system controller
+
+maintainers:
+  - William Qiu <william.qiu@starfivetech.com>
+
+description: |
+  The StarFive JH7110 SoC system controller provides register information such
+  as offset, mask and shift to configure related modules such as MMC and PCIe.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: starfive,jh7110-sys-syscon
+          - const: syscon
+          - const: simple-mfd
+      - items:
+          - enum:
+              - starfive,jh7110-aon-syscon
+              - starfive,jh7110-stg-syscon
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
+    type: object
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-aon-syscon
+    then:
+      required:
+        - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@10240000 {
+        compatible = "starfive,jh7110-stg-syscon", "syscon";
+        reg = <0x10240000 0x1000>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f794002a192e..ae037ba7fc47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20122,6 +20122,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/mmc/starfive*
 F:	drivers/mmc/host/dw_mmc-starfive.c
 
+STARFIVE JH7110 SYSCON
+M:	William Qiu <william.qiu@starfivetech.com>
+M:	Xingyu Wu <xingyu.wu@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+
 STARFIVE JH71X0 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Hal Feng <hal.feng@starfivetech.com>
@@ -20159,6 +20165,7 @@ STARFIVE SOC DRIVERS
 M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+F:	Documentation/devicetree/bindings/soc/starfive/
 F:	drivers/soc/starfive/
 
 STARFIVE TRNG DRIVER
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
