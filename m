Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91744E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Dec 2024 00:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vS+dwYfPZLeltx0lHHINwjN7qTf0r5fTgy9j/ULFiyA=; b=XA5+Jx4BO4+BVT
	SgDmqAcwnIx8Ze49uXjxJrsx2UgkebE9BCJX36Kdm0nsNMCVQRjE4bXoqB2uRqdWdtrAEVWUHfKkx
	V7kAf/sGLvcwV9DQ8LcrnxQn/mSy30QuqEYvRtqs68uniOkNGGKxu/xN2f9VJWLSxtlAs4Q4uYVL5
	DtNWs9ubkgaCyJJ/7rpW57ZU8dqt4Pa+IK2q9AeFBMjs2eZxZbMM63grX2Dsw6mQavhb7IF0d8CGr
	uKbWInkChXXMg6Ge/8A/z3Ob0dbmn7r4YxIwX9ocdQB63lMNfOhNimIfPGgzLUw1xA9Q3znbqjs/e
	m7/JVBiRTlLVHD4u0TRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQFL5-0000000CzeW-2ojR;
	Wed, 25 Dec 2024 00:33:27 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQFL3-0000000Czdm-1fZd
	for linux-riscv@lists.infradead.org;
	Wed, 25 Dec 2024 00:33:26 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 25 Dec 2024 08:32:39 +0800
Subject: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=azsMLWSU24kZOm/Gqa8SMlagV4Qub9G9lNilVBghqyI=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGdrUr2g757rWEynp1Ky5mHaV0bRmznm0pWMiqscTAKftYugU
 4kCkwQAAQoAfRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJna1K9XxSAAAAAAC4AKGlzc3Vlci1m
 cHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCNUJBQjhDOUMzMUI3MTE1Njc
 wMjIzREMzMUFBRUE0NzU5NERCQkVEAAoJEDGq6kdZTbvtNIEQAIyE4LzGcZuN0fqPdFWbFaWiiW
 5cQqKqT8Ul/wyIWPsH+U0LE36bSf5UVs185RzlRuRoGsnkSo0+QWvisclaHZ0ZTAEEATO3ZNs+F
 tH+4CYVgpoG4d5YEwI9f9M7CVUVOW4HquNMy5nagruWd5RNUcUoDQvBd8h8lGdW/Heyl5JhknNW
 0dNfb8Cao9rts99vpB8h2tQ69n0gtoZnHIOGf0uKfchi06siz6NYoQPor9mvhrxzlgwNJBlU1Rf
 wOxWkmXkxi28LeFCVn4Ja1x1dBWvW/tr6Pm/TUNT0nEaTu4BCp2L7Ae9kSqPPhIbvx9Kwdpm0em
 IWiRl1AI/yFxLHNcFbXLnnGAsKrTgEuCF08TEVKQUdtvz2V1Kt7ZLb35TYpd9Hb2mGJYKCoTznx
 WO4A6r6tOHdG+E0kGbvSjnVOtRRPNKt6ubGpJ82jf+rHlH9G6JRKvxRA1bh/Ctr95BPp61hmg4p
 wOOWDJp3wVtsAlUv/yB9wfwLynbJcC86a9ziYD8omvTeGuAqZmiS1ir66P4Jqoym24bPZLYux9s
 Yasl9Q9rljSzNsny8IXLvKL9UKbqS2+c6ImjU8ORIgofhY5qI5H2JJynrclWLDIny844SJfnTjL
 0jygnGyE7zXab6lmLXcYm8fgO47upExnZPV8kmUQAdwFDOhX+7MMVJ61OL
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_163325_480763_DE1D01FD 
X-CRM114-Status: GOOD (  12.29  )
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
There are four GPIO banks, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6ce8f27bd4a5a85f730420e103ea51710200d301
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,69 @@
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
+  registers with each set controlling a bank of up to 32 pins.  A single
+  interrupt is shared for all of the banks handled by the controller.
+
+properties:
+  compatible:
+    const: spacemit,k1-gpio
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges: true
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt shared by all GPIO lines for this controller.
+
+  "#interrupt-cells":
+    const: 2
+    description:
+      The first cell is the GPIO number, the second should specify interrupt
+      flag. The controller does not support level interrupts, flags of
+      IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
+      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@d4019000 {
+        compatible = "spacemit,k1-gpio";
+        reg = <0xd4019000 0x800>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupts = <58>;
+        interrupt-parent = <&plic>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 128>;
+    };

-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
