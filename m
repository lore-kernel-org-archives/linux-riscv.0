Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39937C83F15
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fk9j/iR/x23ryKV+9rfE1Zk8PwS7zlaYjF1lAXNuIcg=; b=goeeMIdrXPYcX4
	QPD11M5iLFvVfkx0xsHxElquJcAJJ11y/0CfDgNnHlqXKa9ZCuAsIYM2p1VU+DWPTqF9vU1aUvaLF
	c/ZBMTnoUILbjsnt8nO64sn47Ljo6XoGUf4SFQdMWGqwWcVFneUyIqimsLdOTf/ZxOi47V5xJOu+1
	V2gJWI6GDQmX+t0KAl/hbZ8CChTieVpTSjdvr5E3qwwpY0SGugF1+jHK2+c70/FpmXJA1JMXKHjE0
	KamiffyXCkvas3fs7HqBge/t7BWNpM4I5WCK9ckJWW6QAAUyNzYhD08gyTcjIatBOVlaOxVEDZoIT
	E0qApU0+kkA+6+3YDCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjeJw-00000001w0P-12T9;
	Thu, 29 Aug 2024 12:32:12 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjeJs-00000001vy0-1VBY
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 12:32:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 067A11C000B;
	Thu, 29 Aug 2024 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724934724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZFMETiTqp68bZQf/Uc678bUmyXC3+gumwmJpkb2eIU=;
	b=SrO1QxtjtfBWoeT+ncaKYKkh8QcRaLPYH50TYcLxfrqwBDbn4qX0LE6AM+bDcwR2Nln5sT
	naVx7vsPDjBCLwjIbPgIAAbMuxCGWU7e5xmsYG+H1zgFMNA6SJAnmRexAONAIJ2fG20z0H
	JKsGtk58Vm21cvw9LLxj+17umVVSmWez3ThiRIzhROOIUlLXjGKY4gwbA+SrVSgsNbHSp0
	CY8ZBV12MjpbPETuNrC/6Ya3Yp4v2NrED24DSAyke3N1Uv8X9cpydYy42Xs81dr9P7ZEiQ
	2753iAOk4bjqdLnplRAtzBsDdfABVj8fKv1CDWI9MIDTQqkIsQDUsttFBeoVVQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Thu, 29 Aug 2024 14:31:50 +0200
Subject: [PATCH v5 1/3] dt-bindings: iio: adc: sophgo,cv1800b-saradc: Add
 Sophgo CV1800B SARADC
MIME-Version: 1.0
Message-Id: <20240829-sg2002-adc-v5-1-aacb381e869b@bootlin.com>
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
In-Reply-To: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_053209_158477_F065478A 
X-CRM114-Status: GOOD (  10.17  )
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

The Sophgo CV1800B SARADC is a Successive Approximation ADC that can be
found in the Sophgo CV1800B SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../bindings/iio/adc/sophgo,cv1800b-saradc.yaml    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv1800b-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv1800b-saradc.yaml
new file mode 100644
index 000000000000..f652b98615f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv1800b-saradc.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/sophgo,cv1800b-saradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+  Sophgo CV1800B SoC 3 channels Successive Approximation Analog to
+  Digital Converters
+
+maintainers:
+  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+
+description:
+  Datasheet at https://github.com/sophgo/sophgo-doc/releases
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-saradc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^channel@[0-2]$":
+    $ref: adc.yaml
+
+    properties:
+      reg:
+        items:
+          - minimum: 0
+            maximum: 2
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    adc@30f0000 {
+        compatible = "sophgo,cv1800b-saradc";
+        reg = <0x030f0000 0x1000>;
+        clocks = <&clk CLK_SARADC>;
+        interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+            reg = <0>;
+        };
+
+        channel@1 {
+            reg = <1>;
+        };
+
+        channel@2 {
+            reg = <2>;
+        };
+    };

-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
