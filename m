Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAE2C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ISLtqK+F8eZAWp34jP03MKW/6oDR0RxH1Cb06L749A=; b=BIIThD+5tCt2jz
	o8q50pl10XAYiV2JxX/l45JUkCqS+n6kVTAu51BNqKUMyHUiQpYoARvQ76Yl5rG5asHyZolLMHrRE
	eMTALmMVZjyyKCPruxpsH3Q+eqaGTI3BfDfQj6vBU8NgnkdCGrqel6899Iv/0ihJH+nYE7Tpwu1ma
	AY90HX1HbRMs+dGEG3n4kS6UIB/CDa2iHJEPT9L+64dL9CmF05nrh4kNvyF7AqQyV7912elZvfkTj
	mALxFVIX+jsUTBG7mLqcnM8tc64GX/lELjuFTKQFIIK456logxHgmaao2CaHaRZonPYp6rTtmo9yV
	MrRWlhlkkP9LvZhw6WBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdlZ-009p5o-U3; Mon, 27 Feb 2023 13:42:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdlM-009ox7-0b
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 13:42:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 172F324E1AB;
	Mon, 27 Feb 2023 21:41:30 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:41:29 +0800
Received: from ubuntu.localdomain (113.72.145.171) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:41:28 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Samin Guo <samin.guo@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: Add starfive,jh71x0-temp
Date: Mon, 27 Feb 2023 21:41:24 +0800
Message-ID: <20230227134125.120638-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227134125.120638-1-hal.feng@starfivetech.com>
References: <20230227134125.120638-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_054205_564689_31C3DE3B 
X-CRM114-Status: GOOD (  11.05  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/hwmon/starfive,jh71x0-temp.yaml  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
new file mode 100644
index 000000000000..f5b34528928d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
@@ -0,0 +1,70 @@
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
+    temperature-sensor@124a0000 {
+        compatible = "starfive,jh7100-temp";
+        reg = <0x124a0000 0x10000>;
+        clocks = <&clkgen JH7100_CLK_TEMP_SENSE>,
+                 <&clkgen JH7100_CLK_TEMP_APB>;
+        clock-names = "sense", "bus";
+        #thermal-sensor-cells = <0>;
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
