Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA46C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB1B61027
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEB1B61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvHXHNU5nAgDQ6vrJlKJQ8Aj4ZHqSuDSQGyw98iqM9E=; b=CDCzReFmYVf5ip
	dn4Efz3mZsWjEOFrcvgr8Ynm7SpJObAooRykAIu8IGJ8Xhxb0cCdbwTy3d+ooCKe7YQdvg9dIBlK4
	r4ufPoPeTfxypf8oRq8gAx3JyRNnne/5aMWKQmzGg370aTnVXPsum38Nicf2l98ADbEoYUd69QaXu
	9vP6+iTSio2zXfk7SlDr8IVPeff081RWicX2kxgwVWLFlEwINbRpKpwMjBpWW1zfWxB1R+CK/RKdf
	gS4n7P9ZtrtYIx/QH5fWpsxlEtWExE4cSXwcG6eDxq4U4y4VrBmlMglyOWJfjBCyxJRD4j2ETkp6S
	dEROJRw6+YC64XMSLNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6El-00GmLH-O8; Mon, 08 Nov 2021 15:07:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6Ej-00GmGw-46
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384024; x=1667920024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+1oOULA+X1tBNq85nvLBj0dUKiDbIcrC8BGtfHpz8s=;
 b=cH/vwjU/fTheqNMWUiEZD6yBXiXK0iWk0slCV5r899t4JPQlUieftBMc
 cNIp4otV7BUTzJa7qPt6KAh1HDGQpj6jLOXh3GE5P+QM/wgOPS5Vk8JVe
 0RGXV5zp9zIz01yuo/sob2Js2508jJGCod10OAd5SISrKjRHTdI4siKsy
 lLO+jCWLoFWSXIvYkjD4hZeCOB+bWHAJ80lcTdKxhC/LAfU/nDgEqKRc9
 AQO6wZUMj47lHkOyiRMnjyDR4cjrIp+DXM7/qgc9Rzw/geb0CblERq5vd
 k1kh8JqA84gF4f/qhnokCoKmMkqB3T/wd/W/GrSbY+9TJmfiLpnSDGCi6 g==;
IronPort-SDR: FYAPzOnF3NwHb03IhyY9qlG6Hg3FjlKg1XstHYXF3//yvBDio1NwMMQOQJ64RI1AMmMinD1DRT
 LDT9fjLFRw/vol6AaQwr6bu9OTQdl9gv0JnAHfL6pknV+uGOJnwZlAP1sOgwYC8H7aMliZAS2Q
 y8P4G8Ufb9504wc9l2rZmvEDBIuYRAI2db4/7BRAJtpydfexRifC6m/Af3VwkTNnRsfa2UPwnq
 o0N42/tgwMO7mb+0DB56RQuRJQBn9PSSZwW3kuRKaMEdpDac+vIaSZ3Q+A8qcQPtbpvF9qkcpi
 CLsrYEpqcZQlPO7b0jnj70Lt
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="75727248"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:07:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:06:59 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 05/13] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date: Mon, 8 Nov 2021 15:05:46 +0000
Message-ID: <20211108150554.4457-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070705_285016_1F0A269D 
X-CRM114-Status: GOOD (  10.81  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the i2c controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
new file mode 100644
index 000000000000..bc4ea4498d35
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS I2C Controller Device Tree Bindings
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+
+description: |
+  This I2C controller is found on the Microchip PolarFire SoC.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: Phandle of the clock feeding the I2C controller.
+    minItems: 1
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. As only Standard and Fast
+      modes are supported, possible values are 100000 and 400000.
+    enum: [100000, 400000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        i2c@2010a000 {
+            compatible = "microchip,mpfs-i2c";
+            reg = <0 0x2010a000 0 0x1000>;
+            interrupts = <58>;
+            clock-frequency = <100000>;
+            clocks = <&clkcfg CLK_I2C0>;
+        };
+    };
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        i2c@2010b000 {
+            compatible = "microchip,mpfs-i2c";
+            reg = <0 0x2010b000 0 0x1000>;
+            interrupts = <61>;
+            clock-frequency = <100000>;
+            clocks = <&clkcfg CLK_I2C1>;
+        };
+    };
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
