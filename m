Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D8E103E163
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iocjcy9Uv4RKQQi53nIpK2m66ftuickTEauiRupdOWI=; b=pGn3P+bRSCEXwZ
	pKtopBpBYslynXyCSA2XrHcnUWrDDSNF7ZNJVXzmD7+EEZovPhANvZf8rYu/X8Q4MvSUUJIlRtkw7
	C4FGEXSw1/8LIORw23RZ8kYb6UoOxLK1JTLYPQ46hShySGlBO+IjeLZddWZXF/c1224XLTo2nE2SK
	4djIcJT+sIkcB4OSTbV7hxl8Wwvj/9leS1H0B6JEWnyGjQmr6wHZtQce72ZtPGSjg/CNxO81nRUFv
	NgnTfMOdhgCKdyDfVO8kl2ezMo+2YZA/VDbUN2gq5TxNmOzCPSQn8PGAX1++Vt6OT+mv6GZduu5tu
	jLRvFU/d1PJe6rGcMr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oht-00000008Gb1-0Wp2;
	Wed, 18 Mar 2026 11:04:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ohr-00000008GaX-3woc
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 11:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6182060130;
	Wed, 18 Mar 2026 11:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE94EC2BCB2;
	Wed, 18 Mar 2026 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831895;
	bh=ibJRUfU6Xesj/AT2j6L/6W1DSm2j7eke+aFZWYsow44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AE6CGxWAqqRddKzIADfVMNULZCMiiBRbWbH1TRAB72+eDae3Tjshb5lF84r1ve3L8
	 Rceh/CLEvfe+LcHy37DpwZPIMGx0aCtEdhzjC3KO2vU7N7iWvHotD7YCheDfzB6vNY
	 jnoqQS6uwC8tQMoZa5YIwbT//JM1/DUP22W/Fi1mBRu9xjSL+CICLDzmcFkaaGsKNH
	 PsYeDvSAIwBzZpOI3KfKJhPX10nwEUYxe6N6wcXKdM8DjU9gYy32J1RVwEygB9VTXm
	 BswueGYxP6vDfyZqJ2tL6eU8/rQHseKTgw8KJ3Ve+HakH6AkSC1+7ccfjUeZFtrW1Y
	 JWLtHlLIPjmTg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 3/5] dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
Date: Wed, 18 Mar 2026 11:04:34 +0000
Message-ID: <20260318-whisking-steadily-91b2497f6fb9@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5607; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wBo9yWbFkmoIJWrjOw6aKTDA8JEfCYkbuuKymCWysYg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o7Ynngv2unhERCW4Dexxzm+Odnv6PujL0Ic+wrTl oQaJWl3lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIbIxn+5wYWsZ7yntpjVOd1 f7Nv7Qqz+CNLEo6+Td914Z2Tl5jiPoY/nFs/pRvNPHZBbd6KebsOZC5sy3rcet5ywp9A6YALM8u EmAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On PolarFire SoC there are more GPIO interrupts than there are interrupt
lines available on the PLIC, and a runtime configurable mux is used to
decide which interrupts are assigned direct connections to the PLIC &
which are relegated to sharing a line.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-irqmux.yaml  | 103 ++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
new file mode 100644
index 0000000000000..51164772724f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire SoC GPIO Interrupt Mux
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  There are 3 GPIO controllers on this SoC, of which:
+  - GPIO controller 0 has 14 GPIOs
+  - GPIO controller 1 has 24 GPIOs
+  - GPIO controller 2 has 32 GPIOs
+
+  All GPIOs are capable of generating interrupts, for a total of 70.
+  There are only 41 IRQs available however, so a configurable mux is used to
+  ensure all GPIOs can be used for interrupt generation.
+  38 of the 41 interrupts are in what the documentation calls "direct mode",
+  as they provide an exclusive connection from a GPIO to the PLIC.
+  Lines 18 to 23 on GPIO controller 1 are always in "direct mode".
+  The 3 remaining interrupts are used to mux the interrupts which do not have
+  a exclusive connection, one for each GPIO controller.
+
+properties:
+  compatible:
+    const: microchip,mpfs-irqmux
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-map-mask:
+    items:
+      - const: 0x7f
+
+  interrupt-map:
+    description: |
+      Specifies the mapping from GPIO interrupt lines to plic interrupts.
+
+      The child interrupt number set in arrays items is computed using the
+      following formula:
+          gpio_bank * 32 + gpio_number
+      with:
+        - gpio_bank: The GPIO bank number
+            - 0 for GPIO0,
+            - 1 for GPIO1,
+            - 2 for GPIO2
+        - gpio_number: Number of the gpio in the bank (0..31)
+    maxItems: 70
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#interrupt-cells"
+  - interrupt-map-mask
+  - interrupt-map
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@54 {
+        compatible = "microchip,mpfs-irqmux";
+        reg = <0x54 0x4>;
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0x7f>;
+        interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+                        <3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+                        <6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+                        <9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+                        <12 &plic 25>, <13 &plic 26>,
+
+                        <32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+                        <35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+                        <38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+                        <41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+                        <44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+                        <47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+                        <50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+                        <53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+                        <64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+                        <67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+                        <70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+                        <73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+                        <76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+                        <79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+                        <82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+                        <85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+                        <88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+                        <91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+                        <94 &plic 53>, <95 &plic 53>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 44e4a50c31554..276d48ba15f01 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -38,6 +38,10 @@ properties:
       of PolarFire clock/reset IDs.
     const: 1
 
+  interrupt-controller@54:
+    type: object
+    $ref: /schemas/soc/microchip/microchip,mpfs-irqmux.yaml
+
   pinctrl@200:
     type: object
     $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
