Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8444C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flfhSk6oFqWpZ1q3dv99rwvLPDMiqCf/amhnGQuJERM=; b=nG7Hbm+GPSedgM
	uzc+OIc7onw6vBYge0w9y07MpphdlRk3/yvpk04ou2uKuOaQJA+l1oBlPsU5PrrFw8eT/UhhiIQTH
	X8QosQ+eUt2x0bJjY1kXiT7U42OlAe7rKl1XO2/7NgJRJgrJ+TQ24h6HeI4iJsCOMXfcJ8cLKvVhM
	qmcjJsOvHVZ3cN8gAEPqPH+n0kJQl6uBJzSaxn7+V7/N8CxJBzWCuMkK8ymXCD0nMijiOIjXaAyq+
	kyzEpLY1kQJmQLsohocr8eTt+O5y5XiLaAM1WhAHN7MuqhVfyPwaZZy09MVCTsUH/0tmaEfPjNH+T
	NQ9s32n4hxuy2LjT6H5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56d-00000006pAw-2J4h;
	Tue, 21 Jan 2025 03:39:11 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56b-00000006pA7-0inT
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 03:39:10 +0000
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33A45342F94;
	Tue, 21 Jan 2025 03:39:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Jan 2025 11:38:11 +0800
Subject: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
In-Reply-To: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=DscMYv3enzAGZGUA7P5eEREoN3GC1937aMOucAj7ncY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbDAodos70mhPrcP1Vp9XEVKplA4pnbbJSoH
 dI2fCaMeKiJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48Ww18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277bwwD/4lcyKHl+9mOfUuIW
 jZKw+CqCZN4yJzCiC4RFJT368Vz66M+JAx4AeCWTO3NDLjUYc1OV4mNFTuIilyqatz+rgNJm1Xx
 6uLVGgkdVYrfcY0kxW8lGaTUyeBjCFFsTOFDzeYk5vvvXxHHLUc/1NUrdQytYUmhy6TG/dpZPhA
 ljUC+xWAQ3Igeb7R7PxmaB1iBkfUl0x0gnuydWkRxWVyht+heHatYr5Qysbig+GdLPSl7BxEkvf
 aqQLZkg3gSWx8uw70PHrnbWECj1hctShLDFbBb+0oX7odbd6zk0h5JYn5Cb39xm61qWb/3txFgt
 G65+hVz07/pcrgp5g0RFkZ1EejTzZPy5yNAsiuoHo33dk4v+KzhXd4mhNYGG34J9hzHdtZzm+vL
 OKDpLPQLPq3pa21w/+fhjItCQaFv3NhCVHGPVfCONuOETOhyNnN/yiFx1Rth5GdIN/rW5DOT+Ni
 58lw4ajBKiemFcKUiapVX/tLpU1K+E9BHnXp2wq6/RzuPDctqa1FCgzXfLdOJx+SMB7KNWCTbTI
 DzUAobBb9skFXes1EOzPCrws250jkpaSPyrQxUoncvn6oGb4XQK+OS7VJ/n+XRX7UvOZu2abB3g
 IXqqG306Z+/k51XNUXGGeKWs7WwoHPPtJXoVxhOkF/CyBgK3SeonMr0Fb8kqNtMtUzkQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_193909_249782_C288A91C 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, failing edge, or both.
There are four GPIO ports, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 GPIO controller
+
+maintainers:
+  - Yixun Lan <dlan@gentoo.org>
+
+description:
+  The controller's registers are organized as sets of eight 32-bit
+  registers with each set of port controlling 32 pins.  A single
+  interrupt line is shared for all of the pins by the controller.
+  Each port will be represented as child nodes with the generic
+  GPIO-controller properties in this bindings file.
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: spacemit,k1-gpio
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^gpio-port@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: spacemit,k1-gpio-port
+
+      reg:
+        maxItems: 1
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges: true
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+        description:
+          The first cell is the GPIO number, the second should specify interrupt
+          flag. The controller does not support level interrupts, so flags of
+          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
+          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - "#gpio-cells"
+
+    dependencies:
+      interrupt-controller: [ interrupts ]
+
+    additionalProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    gpio: gpio@d4019000 {
+      compatible = "spacemit,k1-gpio";
+      reg = <0xd4019000 0x800>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      port0: gpio-port@0 {
+        compatible = "spacemit,k1-gpio-port";
+        reg = <0>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-parent = <&plic>;
+        interrupts = <58>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 32>;
+      };
+
+      port1: gpio-port@4 {
+        compatible = "spacemit,k1-gpio-port";
+        reg = <4>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-parent = <&plic>;
+        interrupts = <58>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&pinctrl 0 32 32>;
+      };
+    };
+...

-- 
2.48.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
