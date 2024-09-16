Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A16FC3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9QyTm1vUdONKhlrIvkA4PTeRAJSS+/RrQoy0TyUUhc=; b=iVYUPLA/TCkfOM
	6gZvAMEupm8E0ZREOoM/ZbLbIAvaca9laBAYSFXxZVcJiZp2wGKmXSoLS7lGljartn2pfcLKFTWn/
	88E/vv9gFl5dd/CMp+VUxrJCBXdXU35kT6HJ89Alcl1hyPo/C1fXoMKBCs+t/Bg4aY7O8L9jlbptL
	kWMbpkWCw/gbfvEapM01hTSfyTHPULQy3qBZZaP1c0ndQVyDCh1X/xFE9keLhlzLlWGfgdCDgVTBZ
	caaYwBDG6RKsgmn5seWRkcIDSj7ChmZeK9BuYewkhOrekgV88ITQ8m6WA3aFEAp4SsaL2tEJCU/Fj
	lk/6wtaUsnrOAqL5QxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5Uq-00000003DLy-2Tb5;
	Mon, 16 Sep 2024 06:46:04 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5Tv-00000003D9F-2A8K
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 06:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=H5SO/
	a1hfbyVpeTzy2AAy5aKvwSqfgsGs2lOMb5bsec=; b=ELcD2D9iTL4cSN5SxjBh6
	BXgHtcjXd3q1Snt6RNk4YaZOuu2naSd+v2aGVrwlnyZTvk4kirg61qdU9m2/J6bd
	WHwF+zo+k9Z/u6AEiRrnVJRe/mY9XlCJVCu5W9h85pwJhnwxN7fme/EkWBGbZUcX
	4hclGhEXcFJ5oq7C1CoeVY=
Received: from jean.localdomain (unknown [27.18.168.209])
	by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wDXX36b0+dmVfTnDg--.31141S2;
	Mon, 16 Sep 2024 14:43:39 +0800 (CST)
From: Ze Huang <18771902331@163.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ze Huang <18771902331@163.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RESEND PATCH 1/3] dt-bindings: pinctrl: Add support for canaan,k230 SoC
Date: Mon, 16 Sep 2024 14:42:23 +0800
Message-ID: <20240916064225.316863-1-18771902331@163.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240916063021.311721-1-18771902331@163.com>
References: <20240916063021.311721-1-18771902331@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDXX36b0+dmVfTnDg--.31141S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF17Cr1xuw1rZr4rAryfXrb_yoWrJFyxpF
	ZxKa98KF1rWF47K3yfta18uF13Xa1kArsagw1Utry7tw45WF18Kr1akr4IvF4DWFn7J3Wa
	qFWIgry7KF47Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-Originating-IP: [27.18.168.209]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJwBcomXAn1YeJAAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_234507_970168_27B4FD5E 
X-CRM114-Status: GOOD (  14.78  )
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

Add device tree binding details for Canaan K230 pinctrl device.

Signed-off-by: Ze Huang <18771902331@163.com>
---
 .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
new file mode 100644
index 000000000000..979c5bd71e3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/canaan,k230-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K230 Pin Controller
+
+maintainers:
+  - Ze Huang <18771902331@163.com>
+
+description:
+  The Canaan Kendryte K230 platform includes 64 IO pins, each capable of
+  multiplexing up to 5 different functions. Pin function configuration is
+  performed on a per-pin basis.
+
+properties:
+  compatible:
+    const: canaan,k230-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    patternProperties:
+      '-cfg$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias, input
+          enable/disable, input schmitt trigger, slew-rate enable/disable,
+          slew-rate, drive strength.
+
+        properties:
+          pinmux:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description:
+              The list of GPIOs and their mux settings that properties in
+              the node apply to. This should be set with the macro
+              'K230_PINMUX(pin, mode)'
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            minimum: 0
+            maximum: 15
+
+          input-enable: true
+
+          output-enable: true
+
+          input-schmitt-enable: true
+
+          slew-rate:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              slew rate control enable
+              0: disable
+              1: enable
+
+            enum: [0, 1]
+
+          power-source:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              Specifies the power source voltage for the IO bank that the
+              pin belongs to. Each bank of IO pins operate at a specific,
+              fixed voltage levels. Incorrect voltage configuration can
+              damage the chip. The defined constants represent the
+              possible voltage configurations:
+
+              - K230_MSC_3V3 (value 0): 3.3V power supply
+              - K230_MSC_1V8 (value 1): 1.8V power supply
+
+              The following banks have the corresponding voltage
+              configurations:
+
+              - bank IO0 to IO1: Fixed at 1.8V
+              - bank IO2 to IO13: Fixed at 1.8V
+              - bank IO14 to IO25: Fixed at 1.8V
+              - bank IO26 to IO37: Fixed at 1.8V
+              - bank IO38 to IO49: Fixed at 1.8V
+              - bank IO50 to IO61: Fixed at 3.3V
+              - bank IO62 to IO63: Fixed at 1.8V
+
+            enum: [0, 1]
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl: pinctrl@91105000 {
+        compatible = "canaan,k230-pinctrl";
+        reg = <0x91105000 0x100>;
+
+        uart2_pins: uart2-pins {
+            uart2-pins-cfg {
+                pinmux = <0x503>, /* uart2 txd */
+                         <0x603>; /* uart2 rxd */
+                slew-rate = <0>;
+                drive-strength = <4>;
+                power-source = <1>;
+                input-enable;
+                output-enable;
+                bias-disable;
+            };
+        };
+    };
-- 
2.46.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
