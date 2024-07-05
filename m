Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F6BC3DA41
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G048rbvy3qNX4iDg+FMwh5kO2RgFbW4rxoxzpqNoBk=; b=jfNmlamr//EeQh
	TmW2D1vOt5K/ybsrGt4U4vpGWUL2/6g4PFS5fAD0UWCtsfdMJhfnEKOWvgLVFCuOJTtGgKb1h7Pu/
	AN99/SZAan6N5578lRUyHPoMBuWnXZV5QoKcok87e9VCoe+vKK7Lors0VuzQ44C1+7Xa4DnK2TDNB
	j8ya2mysKnB+X+YE4PtRQZWegb7/zixW009fWWWX48Ak+P03wJ5k408l2rxZItyBrEJjrTsNhxqpl
	jT5ks4qqgALa2CsSB1qRy/pbVjTpgA9zjDVp63GFX811snBOZtDmBLUyymi9PfDSae+UVZmF8QBaR
	/PVgtD9hGxCiCEo20i7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjD2-0000000G5oA-49gC;
	Fri, 05 Jul 2024 13:42:44 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjCu-0000000G5jV-1FrW
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 13:42:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A367B240006;
	Fri,  5 Jul 2024 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720186952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODottIJUZD5cbwACBdwt28E6WF2p4dCijXNFos9RZ6s=;
	b=cYemTJtwaBgKyuYuDe1/QjDtG1Xo55/jjihYG4oMnzU7p8Mwhxtne1hv/DjMfm5ZLSBTje
	88rEkrCGXP8BSL+LUW+LNWD8QQOW2nRDVeTBgjUcLAAL5W3Uf9qYg+YjVVjSH0lq4MEiUp
	dGOTKE6RXafz+nffLqgaEBcn/K6COSCANd8QYfO2G4oJQZLmbNHt+Z+j4I/aW1LVH12nCo
	A/imJDvpA+FHYRL6tg0AEtHFnbjByAm08Lzc9nJv8uUd31AALMAjT+2A1lRm5IeKlzgGzs
	HHUKMzlWnfTzYBenKKloR3a0gFYH4M4/BSOMMz0AeOpICaUwn8/p39HyNOOGwA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 05 Jul 2024 15:42:23 +0200
Subject: [PATCH v2 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
MIME-Version: 1.0
Message-Id: <20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
In-Reply-To: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
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
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_064237_689632_9476F8F2 
X-CRM114-Status: GOOD (  11.58  )
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

The Sophgo SARADC is a Successive Approximation ADC that can be found in
the Sophgo SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
new file mode 100644
index 000000000000..31bd8ac6dfa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+  Sophgo CV18XX SoC series 3 channels Successive Approximation Analog to
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
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,cv1800b-saradc
+          - const: sophgo,cv18xx-saradc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description:
+      SARADC will use the presence of this clock to determine if the controller
+      needs to be explicitly clocked by it (Active domain) or if it is part of
+      the No-Die Domain, along with the RTC, which does not require explicit
+      clocking.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    /* ADC in the Active domain */
+    adc@30f0000 {
+        compatible = "sophgo,cv1800b-saradc", "sophgo,cv18xx-saradc";
+        clocks = <&clk CLK_SARADC>;
+        interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0x030F0000 0x1000>;
+    };
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    /* ADC in the No-Die domain */
+    adc@502c000 {
+        compatible = "sophgo,cv1800b-saradc", "sophgo,cv18xx-saradc";
+        reg = <0x0502C000 0x1000>;
+    };

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
