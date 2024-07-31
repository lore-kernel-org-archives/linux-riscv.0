Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55375C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQDF62cmomp0eYAlMkOSRLfNx14/611/9Jj3gbt9R4E=; b=rX4WDCo5axD326
	uogowtqcqk++tfA92ySdgpb/olXy2mwqAEO5ru0bC3PV0fxEYSDo7xJbxJ8tTe8RjbZyx4mJOQCO+
	cr4L1POTiI4A8oDCX3L2rAqgzFVMrNNiIyTrMUmdBMreHSHNCIfvxGYSUgu/JWluqPvVIWASspFIb
	UZrihGxZzHOz9AQQZciLFg0DmZNM1TaKUKkzDYp9mP9Twa94EK0w518iKFyLw0AY9nFAqaKFOwACs
	flNveWBc2wtFgzTfKNcod7+PA5KT1xXpYbeAWgVX/cnPvkK45YrzKHkABiA/nqng221TCm7c+EMII
	g9JeBJA0h9/x0ADplNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8NX-000000013ay-0Qoy;
	Wed, 31 Jul 2024 12:24:27 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8NT-000000013YS-1Sen
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 12:24:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B4ABFF805;
	Wed, 31 Jul 2024 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722428660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX/Hj4Pt/yRxr0nGT2LrpjQSv1HGzsNeBfY67q/Rvu4=;
	b=fPzfAHUNbUy5m7YrD5YmT3tsa0XZG7WXll2mNXIdKBTb4Pe7aXyJxUoaO0xJT30g8pjn4N
	FI4pe8Uo8eaEK3DPf47eHRGN8xtv7R9ePhekWPKX874lffXvyRIoc8VUYYLEKdckFPLY51
	o5cg77Ha4B/jb3LEk5bp8g9lMCKQdbu/V/17jlP3BqC+f0FVZYqXgLvxMzcZeJNNy14apW
	J30aG3/JGSxY61dXkE4h8iboNSH4c3wTUYjsaaRplNklDdB5DGIXRufybZh7zUb2OCtC5h
	gjZc90KOthvlqIvg6JhH+LxOAIPbqakAOelbfa6MIHBJLEFctbmYYXExVmmvYA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 31 Jul 2024 14:24:14 +0200
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
MIME-Version: 1.0
Message-Id: <20240731-sg2002-adc-v3-1-5ac40a518c0a@bootlin.com>
References: <20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com>
In-Reply-To: <20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com>
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
X-CRM114-CacheID: sfid-20240731_052423_667869_09CB1719 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
new file mode 100644
index 000000000000..79d8cb52279f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
@@ -0,0 +1,48 @@
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
+          - const: sophgo,cv1800b-saradc
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
+required:
+  - clocks
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    adc@30f0000 {
+        compatible = "sophgo,cv1800b-saradc";
+        clocks = <&clk CLK_SARADC>;
+        interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0x030F0000 0x1000>;
+    };

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
