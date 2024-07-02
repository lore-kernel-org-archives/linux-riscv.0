Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C205C3065C
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vt0z7nul69UYpKcIAtQPjlf088Cqbf+Jn6Z4wJ/OOyQ=; b=i4ocplU4AdIs1a
	SlVhD/Xjo1jOc4sfMn5DlTWUzSvgR1GjM75lls/SwAlSgv55Esy/2OUXzcx4fHrY7n6wqImDcxb+H
	3zan+ycIom9E9pEnwZ01eeIcf4lbracqNH3xQOQEGtkcX0nDQCL0nBcFQJT0+sagsuNSDrKlBboqr
	CSLA4uT8606OXbMykz60tREOpQxMMaz04PAQiTB8pTfA6N+FQ9GKVr+UMGrUEC7My8PcY1tFAoJpg
	coVCKJi6rPPowYFe0gC0rJXPAOuiP9g6I60ah72KH9hNl73G/jWcMXrFk6OHQ1muXHmpxc2qTz5gM
	M6wzMHIPd8oXp3rmquUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc4Y-00000006ZWB-0hK9;
	Tue, 02 Jul 2024 11:53:22 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc4U-00000006ZTv-0mGJ
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 11:53:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 084991BF213;
	Tue,  2 Jul 2024 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719921194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqC7auAvQgW9A/VK3641+r1UdxlnIIFJMqdNw3IN0E8=;
	b=h7w8X7Ymc/zvg+nQGNtcHw99Z+LNVB4kkkykGYu1pNVAwfUAOJGqYPwIX4EO1l/UW7qfV6
	MsR/SRV06v6diweqPiAPi5hIw80hC40El59u52AB5lOR/YEg1mEaxK4ffe/JmICNilGJnG
	/C9D9LyAlJxmkw876Ltaz01I3TTz6bwwXwD17cHpDemzFCQzyHyFwWFMNo8D5e/1jV/tn8
	eO2cFGHP8fvaLTXOkzcI+RyJ/VezVBx0NCdmuKNZAY6BSy7vCsbHW2lf0t/hiFdMDTvq8o
	/WEaSmPHk7X0y1WCly5PwlRLR/MGfutj2Yn80KmC5Sr+a1ONVdmFV3vY3GR/RQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 02 Jul 2024 13:52:21 +0200
Subject: [PATCH 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml: Add
 Sophgo SARADC binding documentation
MIME-Version: 1.0
Message-Id: <20240702-sg2002-adc-v1-1-ac66e076a756@bootlin.com>
References: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
In-Reply-To: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
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
X-CRM114-CacheID: sfid-20240702_045318_829956_09071D98 
X-CRM114-Status: GOOD (  12.78  )
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
 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 +++
 2 files changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
new file mode 100644
index 000000000000..21fd5dc8e24e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo 3 channels Successive Approximation Analog to Digital Converters
+
+maintainers:
+  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+
+description:
+  Datasheet at https://github.com/sophgo/sophgo-doc/releases
+
+properties:
+  compatible:
+    const: sophgo,cv18xx-saradc
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
+examples:
+  - |
+    # ADC in the Active domain
+    adc@30f0000 {
+      compatible = "sophgo,cv18xx-saradc";
+      clocks = <&clk CLK_SARADC>;
+      interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+      reg = <0x030F0000 0x1000>;
+    };
+  - |
+    # ADC in the No-Die domain
+    adc@502c000 {
+      compatible = "sophgo,cv18xx-saradc";
+      reg = <0x0502C000 0x1000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..dc87898c518c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20901,6 +20901,11 @@ S:	Maintained
 N:	sophgo
 K:	sophgo
 
+SOPHGO SARADC DEVICE DRIVER
+M:	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
+
 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
 M:	Takashi Iwai <tiwai@suse.com>

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
