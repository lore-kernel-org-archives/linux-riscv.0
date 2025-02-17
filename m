Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A0EC021AA
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEM46eTXdjf+Bps+BeHObu80LGPMhZDNSgzhsObWGgs=; b=4jQ1I7/+ARDmUN
	uwLgv1x0S3Fo82cCl243CEzP8Q8Tc9800r6hUbpaOGQvq+wXuqitROdZXhAWsVWTIqx1R3prBoYjB
	AAVCvgMhFH6NuMm0yrF69TCyKgeoERK47almom+JSRZXe8K+z1qUoGTQmZGQ87IIMPtcT46AtYwZs
	HobPP5ewRd3wyKsdDrwHKOxdXTuIgyKa1jbncaBTaWSqla1FqxNLHXrOVYpegwGNTfE95xi8n88TI
	wl2cxWlSnpqDqT6S+3ULx+vkbIfxOSbWkdD1TgqKmW06/QqCjmidvib3Y0Z1G8ZRonV8+HpDUaOHR
	Wfd9uIN5cVhIHwI4abPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0hs-00000004Xzp-3idQ;
	Mon, 17 Feb 2025 12:58:40 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0hp-00000004Xy3-41d8
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 12:58:39 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 77BC83430E1;
	Mon, 17 Feb 2025 12:58:31 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:45 +0800
Subject: [PATCH v5 2/5] dt-bindings: gpio: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=J4LzejSQ5iFcYvYi6JNYyYrOhmebJg2E7is5cCBuyAo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJd8XdZlWM84TE7E4yfh3s3Y2ffGC9HCA9Rr
 W1ZkVUj3MqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyXV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XkJD/9g1AnlmJcqBqTJUS
 FxmoX5jHQBALyWdYSfLNNcT1+UYG6v9ZOMGr93Kc2LHeaB7NDY6U1xxElCeUOE6gE3f1GfHJfHL
 XObxPeC4BUcIIgsBNi01juk5S4zZJYhureO96EV7Gn9C9ZJ6/UyXM3nCaEsZUY8zOdPqFCXqwlC
 Agz1Jqz+VvA0ICceCJh/DXdCZfupwsqP/VPB8a4Br6oQp0RO1ggbiVKVqHePviAoU+RFzYZ2/HG
 Qk+L//zr9cL7Uyp3lOuL/J8o10330fGpbUnDpYlYHZYMLnJ+IC5XizhJCmQ+eJUT0001n2PjKT0
 9FiDgEqFMGslaHBz2L+1vs3Ajd+tP0w8NdwQc0m8aHhYGOx7eu/ITDjp3iOTKwSQBrlzvJo6f/S
 OA7FR/BvPqLeAUdRwUIWtyWppUb9CmZ6B/jhd8/5O35IdT/6GrImCQHnAqjkzw9Ip/mKezgR3A0
 0UdlIk9/fmIuhoxXKeih8JSb4sARKhWK/PX3s8crwfI5N8DH3e0ligncwhQ7Ji4RWUyCEG+VnoA
 7oLK3s7zBt3FZRgt1YxjzXqfd02jju4UO+lVZ499yshRuFW6xDxJfF3MOUQmvnSwvIcCVRMLikd
 kz3p4tiNuZVlp9xY+qsQIqyCScaDTGVKEjaSm/PfWZkwu+qgizJqVAyXRHafHPktpS7w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_045838_027256_2A8D75B0 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..72a3ed2882782e5d22cf7d7a499c9084aefd961a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,81 @@
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
+      support level interrupts, so flags of IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW
+      should not be used. Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
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
+dependencies:
+  interrupt-controller: [ interrupts ]
+
+examples:
+  - |
+    gpio: gpio@d4019000 {
+      compatible = "spacemit,k1-gpio";
+      reg = <0xd4019000 0x800>;
+      gpio-controller;
+      #gpio-cells = <3>;
+      interrupts = <58>;
+      interrupt-controller;
+      interrupt-parent = <&plic>;
+      #interrupt-cells = <3>;
+      gpio-ranges = <&pinctrl 0 0 32>,
+                    <&pinctrl 0 32 32>,
+                    <&pinctrl 0 64 32>,
+                    <&pinctrl 0 96 32>;
+    };
+...

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
