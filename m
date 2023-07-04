Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93597EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 02:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG/td9I0XNlVqlzkGZ8Zrh1h0f646jUE0pKyzWqk4rU=; b=YazZ+uBlveMYVj
	9l6mTMV5Hc5jhbeUe0M3HRwpYM8jZN0/IrCDB7UD1OzR+gAOz1hFyg7APeKx9URGbSM7iPvuFxW19
	IXHkgz97zStEjesUlMc5xDLTAVCJesHmLbrAenewpuP9olElvDhuuM8k6oQgxMvvydhh095izeuhZ
	EMdYFr/SjIKeTzKe/Gi3UI8L8lq7mVYi45jCKJMx/ss0KIV3vsSuEDDQI38Na2kRZuK8cfC3VSWgZ
	wa8z2E56ly9ng6GxXe/4Qr+36ju+EHBrUw7BLU76H8qxDFpcW1SCAWO2yfbS+9M2qLUWsLcaBPEha
	HlG3aLcrZpQ8Y+Dfv7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGVNi-00BsJ4-0c;
	Tue, 04 Jul 2023 02:03:06 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGVNf-00BsGs-10
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 02:03:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5591024E26B;
	Tue,  4 Jul 2023 10:02:43 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 10:02:43 +0800
Received: from localhost.localdomain (113.72.144.31) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 10:02:42 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, "William
 Qiu" <william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive syscon module
Date: Tue, 4 Jul 2023 10:02:34 +0800
Message-ID: <20230704020239.288500-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230704020239.288500-1-xingyu.wu@starfivetech.com>
References: <20230704020239.288500-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.31]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_190303_648883_C3B50723 
X-CRM114-Status: GOOD (  13.14  )
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
 .../soc/starfive/starfive,jh7110-syscon.yaml  | 93 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
new file mode 100644
index 000000000000..b30383eab32c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -0,0 +1,93 @@
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
+description:
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
+            const: starfive,jh7110-sys-syscon
+    then:
+      required:
+        - clock-controller
+    else:
+      properties:
+        clock-controller: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-aon-syscon
+    then:
+      required:
+        - "#power-domain-cells"
+    else:
+      properties:
+        "#power-domain-cells": false
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
+    syscon@13030000 {
+        compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
+        reg = <0x0 0x13030000 0x0 0x1000>;
+
+        clock-controller {
+            compatible = "starfive,jh7110-pll";
+            clocks = <&osc>;
+            #clock-cells = <1>;
+        };
+    };
+
+    syscon@17010000 {
+        compatible = "starfive,jh7110-aon-syscon", "syscon";
+        reg = <0x0 0x17010000 0x0 0x1000>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 35e19594640d..58ba04bd0bc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20127,6 +20127,12 @@ S:	Supported
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
@@ -20164,6 +20170,7 @@ STARFIVE SOC DRIVERS
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
