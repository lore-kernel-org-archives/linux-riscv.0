Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57196C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99Y9J/zjviGql3WfGSoB4TV7WrkAq12yDTEwo9+zahA=; b=Q0uKOg2Ajafj+A
	TEqvNRK+LZPL0C91kN4Qr2/2PD7jB15I6mu5Rnp5/0ASnHUHr+EiAkaYMUm0BsJpqoItSOAvTN8MQ
	ACACOd69DbnNs0Ia0WQHxKYONoZuoKmDhW95baNuCCJLjVtr6BIpYwoagAZ7opnQj08C7IHMDPvC1
	7TRYXPBOiqqxo0pri+lfHUdgD3+HVOONXyTPIxFhHlgIwY6chN9mDSBjhFSZD/iNZvDDX3gtZUWoy
	OdHS2NAQhwpAyGuAdPN7/oZ+ctG5l5Nt7j7E2UWk6Gr/74IqjmdI65x1CVmpCdLRFs/MhvKrhKtMd
	TWtaF0LA2k17hI+lPF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWXs-00000000fVn-17O8;
	Mon, 12 Aug 2024 15:01:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWXn-00000000fQz-3jZn
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 15:01:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA2AAFF805;
	Mon, 12 Aug 2024 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723474867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABArNOKCL6dmgKSQJ2r1D6tE7nlhSkwhi7zy54L8RZI=;
	b=Vyq++eeHe730h/JM9G8nzdge0nnhbrCqHl4CrV+1FM3mCsUVmDP1w9nPM8ruKnzoN2wha9
	YbWuWLAKtAjfAntXX4MPtnN+zKksCClIF5AC3bD4HIutks+PmXyTfyw4VtEys4pu9ntIg9
	kuctfrCgq6Wy7peQMg3d18ZdrobDxNoesdrlIoZveA8D7Du+CG9WrOzNVMrXNCFF5mFwMX
	tdoXoPJMuFia0UWtJOr1EHyefAFQ+sTK5obn9tTqn7KWtgTcqkAUukPhc9DImakPrEQWbL
	CtefTNJ20izh2w5p0RL1RDZHUzcNUsG04M3KJrQWvTQNTwJsz+gXct5ICIoCng==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 12 Aug 2024 17:00:55 +0200
Subject: [PATCH v4 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo CV18XX SARADC binding
MIME-Version: 1.0
Message-Id: <20240812-sg2002-adc-v4-1-599bdb67592f@bootlin.com>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
In-Reply-To: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
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
X-CRM114-CacheID: sfid-20240812_080112_737613_C805D81C 
X-CRM114-Status: GOOD (  11.00  )
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
 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
new file mode 100644
index 000000000000..846590808e5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
@@ -0,0 +1,85 @@
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
+  "^channel@[0-3]+$":
+    $ref: adc.yaml
+
+    description: |
+      Represents the channels of the ADC.
+
+    properties:
+      reg:
+        description: |
+          The channel number. It can have up to 3 channels numbered from 0 to 2.
+        items:
+          - minimum: 0
+            maximum: 2
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
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
+        channel@1 {
+            reg = <1>;
+        };
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
