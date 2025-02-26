Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E60C021B2
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVYGYh4C7u6EzKv0MnxiwCnhhGxs/Sw57Ed3jTZ/Dvo=; b=bvwHmTcZYWsDnM
	7DMG4o+bIT7s/ZOxprWAVh1bLTlPXwcHy9Flq6+0UDITVDz8FoHViSFR4eAjN1RMHtBhEGfHhPisD
	bX1ZdpsIavnnKZnceVoiBCE06D47ObclZYIbJHC1xR7VA0f85hw/jfXzRs5DApYDA2GlUCzhtNZic
	ZYa6oF5HD+vILudF8mrFjVSUVrXFXptWijIPSPssFTZOk5fqEi/TNqgkh2R7559XuQJ8sGs/tjTLr
	563rFg3I5nJlJLrweD9cUqYcAyYrji5oR5Ll2P9lBVaXci4XWFpZ4kltu8osgXjTqkoELUrTiJ3LZ
	ycH5VX7VnPHUsbsiTRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5VG-00000001tV4-3Mpz;
	Wed, 26 Feb 2025 00:42:22 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5VE-00000001tU1-0gwQ
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 00:42:21 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F2706343294;
	Wed, 26 Feb 2025 00:42:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Feb 2025 08:41:17 +0800
Subject: [PATCH v7 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250226-03-k1-gpio-v7-1-be489c4a609b@gentoo.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2915; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=WH0/VTh61l0QsJuNF/iOodgWqrXFSar6PL7qgSyL8ko=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnvmNPdiA4mYGMfmM105DDB61to2aFpYc6rNj8O
 vq4OAncV+mJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ75jT18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QTrD/9uUg+iXLPceiw9Bx
 PER7uARndL4Pl8uSJagG9FH0xw6hmmNo/mev6u+JqbiNw3+imPKA9u2ctvIwNR0MA54KC8+lBFy
 77AJ3jEFosyR5DbQtFuqFLl5GFllMFyoBJ4yhHP5U1j/IihB5IjqMvC4VChFLk0ox0GZ3hx5C26
 B088HnYGiywI0ZmswNW8q1tmqcILFiY7TEdizNkvKJ3Z78ICJqBjax7ltly/IWG5Ssevy35/EC8
 EbzME60ot+J2xAvtFYR7l1iUz0qk95mYOU0FPJcBkB4yeijqOtplRYJmT0OORQSligeAK4x6IXh
 qw9jMK5yUdjvqI/54hVN1Doq66yqpIYOithvrNWQs6p77E1Y7sGtgAcXgzjilc2kio9criqnxzL
 XBeWX1cBVy2PEmfsSGvLruywdlqYKu5XApJTpGc69Hph1bstwwYpvew6RBRqibU8vImM1tbdnNK
 eUuru9pxk8frLFPsiXGsSaWp1WECmBm5BFzFxB9DCTA+Yua3FoSJ0Ekte8plW/pjkE6Tie45p+1
 sxcI6qBagkbNuAhkKKvSdxEfg0jU6gja1uj9jPChO5nW+OkvbCvZ10U4MIKe+6rgCnGvrAX8HcF
 p3k7wNC4Np5tVEDXyhPdteHvAopsNH4GyGKklEXoeHWCG+AbAph/rvLUdMmKWKNsgAsg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_164220_240673_4AB2B9FC 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, falling edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dc28135e008a2acaadf0366b9d50d1c2e4954b21
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,79 @@
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
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 3
+    description:
+      The first two cells are the GPIO bank index and offset inside the bank,
+      the third cell should specify GPIO flag.
+
+  gpio-ranges: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+    description:
+      The first two cells are the GPIO bank index and offset inside the bank,
+      the third cell should specify interrupt flag. The controller does not
+      support level interrupts, so flags of IRQ_TYPE_LEVEL_HIGH,
+      IRQ_TYPE_LEVEL_LOW should not be used.
+      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@d4019000 {
+      compatible = "spacemit,k1-gpio";
+      reg = <0xd4019000 0x800>;
+      gpio-controller;
+      #gpio-cells = <3>;
+      interrupts = <58>;
+      interrupt-controller;
+      interrupt-parent = <&plic>;
+      #interrupt-cells = <3>;
+      gpio-ranges = <&pinctrl 0 0 0 32>,
+                    <&pinctrl 1 0 32 32>,
+                    <&pinctrl 2 0 64 32>,
+                    <&pinctrl 3 0 96 32>;
+    };
+...

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
