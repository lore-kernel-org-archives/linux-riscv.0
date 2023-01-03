Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D1FC53210
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 01:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGKpoE7f4a9qrViKEPS8d+TnBwjE7XjBL4z7QoX8K0w=; b=K3k58QPFNfUh6d
	I659yz3BLYZN1QCHSt8y9O6AtOMxsrcOARJYkAN4PrmAd/Vdu+vD+xUkqkiypRJA6BYBZzhEwpDyu
	Brs4eexMt/slVMSM9hEZOR62evaKpznSyK4IMdmRL3tkfyVuGco6ixJMiOj7occnICwM1ZNpzYzqj
	eihcOjBsG5G52zhZ5g6ULrLGHMb4G0yJPPnZsABTPOYpQ6WHOrrzM0dtcj8ud5v2vOSS3lqhObIs4
	34JQk8sOIb7frAQscXqgSwCCtp8r4SV/J4FpKhrM459+13vT4QreV7k0v/smzn9cdTSIFfTrJNHXm
	g4URqbpi98d0AnXQ+F0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWBm-00FbaB-IA; Tue, 03 Jan 2023 01:34:02 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWAO-00FbI7-1n
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 01:32:38 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1239324E0FC;
	Tue,  3 Jan 2023 09:31:50 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 09:31:50 +0800
Received: from ubuntu.localdomain (113.72.146.202) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 09:31:49 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/4] dt-bindings: hwmon: Add starfive,jh71x0-temp
Date: Tue, 3 Jan 2023 09:31:42 +0800
Message-ID: <20230103013145.9570-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230103013145.9570-1-hal.feng@starfivetech.com>
References: <20230103013145.9570-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.202]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_173236_434485_BF2D3E45 
X-CRM114-Status: GOOD (  11.61  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add bindings for the temperature sensor on the StarFive JH7100 and
JH7110 SoCs.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../bindings/hwmon/starfive,jh71x0-temp.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
new file mode 100644
index 000000000000..2600881e2cdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/starfive,jh71x0-temp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH71x0 Temperature Sensor
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+description: |
+  StarFive Technology Co. JH71x0 embedded temperature sensor
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7100-temp
+      - starfive,jh7110-temp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: "sense"
+      - const: "bus"
+
+  '#thermal-sensor-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    minItems: 2
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: "sense"
+      - const: "bus"
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive-jh7100.h>
+    #include <dt-bindings/reset/starfive-jh7100.h>
+
+    tmon@124a0000 {
+        compatible = "starfive,jh7100-temp";
+        reg = <0x124a0000 0x10000>;
+        clocks = <&clkgen JH7100_CLK_TEMP_SENSE>,
+                 <&clkgen JH7100_CLK_TEMP_APB>;
+        clock-names = "sense", "bus";
+        #thermal-sensor-cells = <0>;
+        interrupts = <122>;
+        resets = <&rstgen JH7100_RSTN_TEMP_SENSE>,
+                 <&rstgen JH7100_RSTN_TEMP_APB>;
+        reset-names = "sense", "bus";
+    };
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
