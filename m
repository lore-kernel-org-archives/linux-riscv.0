Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B507EC54ED1
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy63/KRw9VKZo5dvHtIwbKFwY4PU6Wudwlbt6Yw2DhQ=; b=L7BkUM/OsyFau7
	+CfQuzyCMgg6pqlKPNvxVs8tuGbOJwblUGFJvbnDKOd8c4UIfglc3nJ7OQHwU92VYgvsohinhnmBE
	1SDmegYxRlNcBjnaQ2f7x89nABN9nQ86oAwjSlDIUxOTQfy5BwVSpB6OY5y2SHWA1a3aKNCjg2B16
	U5n2v5NzoY9bivfwl70YPoFo6GK/dtZSJ5Nk8Op/SZJNCKwH7hHwTl9zVodOeW0kK+7uR23EDxO5c
	ttv2eZKMcQ2zRg+S6/rW2Y8IFQxBgodIlseCmOadUOrJnpbCmq50W6ctVk43yuSnTtaflZTgnvqyg
	Q+lPG/C95Q/e99qHZT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGtY-0000000F9Um-3IGv;
	Wed, 28 Aug 2024 11:31:24 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGtV-0000000F9T0-2MdZ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 11:31:23 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 28 Aug 2024 11:30:23 +0000
Subject: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: add support for K1
 SoC
MIME-Version: 1.0
Message-Id: <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
In-Reply-To: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4318; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=EhXdvTJICZ/CPHgBVnkqp92mbVQd/cH/vOKFkcWHcAI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmzwp0rycktKHFvryD1vu55Ph4DoP4jJjOWQB5m
 BI0bYTLHa6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZs8KdF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TMkD/9o5DemKkC5q2PP/p
 NDonyaDiLDDGYD0ku3QGS5SUuA0bkvC65Pzokq5Xxvh2WH5VpFxwSW4NL8IPjfe8hx2gt/TRQ4R
 l0rQbiH0sUfSj5OM+N7G00CusSkDXL3Vz2ZsVUuXA1tZdvMZOHgp0ZIE0MjmC/sdKL8cEyu+Yf2
 N+rJbfXlmoOnKYo/fUu2FjmZ9cqkvyXdxtyJfUpFf332h5wl68nOFRFkwk0bTD5HPJajTcRqakJ
 WWU/DCC/Nzx80CDdJGQgyZuupyPPJbWLF2ROaSYMtlnCFhMBqohfJjDTVoBC8xHClvlSlDeh45i
 u1KUCuJJdx5J+nZM7VUMC8jEf0UDloKvYvGxEWRuBr1wF/I3/E2xGXM07VvFicYljEScwUoTR6Y
 2o7OGgxv6X76sQriSHaiY8ofzdr+mn3G4YTWlLjkwtOhQ4P+Ef4fV8noxYTbo9hBV+ObKbZ3Pdy
 /yblC2Yz649oR2MRUghcC/R7JK9Vdi0f46Mi8cmR9xFde7BBurezz51yM7l/CfdmEVaXaxCA/S8
 WA5wKBz3UNX7JunrfoB5Mw6aowQHCBLJbTe7wWjnbGgN8nucy6Q02ppsZT21p2xHOxiUGugBefx
 lfBh4Wp11ia9h6iEFexcyeFMrgmNTn4M54k66dThp1zbcZAO2eek4ESPXV4gV1AmQ1Yg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_043121_666747_9249CF3B 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- drop spacemit,slew-rate-{enable,disable} property
- use drive-strength instead of drive-strength-microamp
- fold strong-pull-up into bias-pull-up
- format fixed
- title fixed
---
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
new file mode 100644
index 0000000000000..166e529b54b27
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC Pin Controller
+
+maintainers:
+  - Yixun Lan <dlan@gentoo.org>
+
+properties:
+  compatible:
+    const: spacemit,k1-pinctrl
+
+  reg:
+    items:
+      - description: pinctrl io memory base
+
+patternProperties:
+  '-cfg$':
+    type: object
+    additionalProperties: false
+
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    patternProperties:
+      '-pins$':
+        type: object
+        additionalProperties: false
+
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias pull,
+          drive strength, input schmitt trigger, slew rate, power source.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description:
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the K1_PADCONF macro to
+              construct the value.
+
+          bias-disable: true
+
+          bias-pull-down: true
+
+          bias-pull-up:
+            description: |
+              typical value for selecting bias pull up or strong pull up.
+              0: normal bias pull up
+              1: strong bias pull up
+            enum: [ 0, 1 ]
+
+          drive-strength:
+            description: |
+              typical current when output high level.
+              1.8V output: 11, 21, 32, 42 (mA)
+              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+
+          input-schmitt:
+            description: |
+              typical threshold for schmitt trigger.
+              0: buffer mode
+              1: trigger mode
+              2, 3: trigger mode
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          power-source:
+            description: external power supplies at 1.8v or 3.3v.
+            enum: [ 1800, 3300 ]
+
+          slew-rate:
+            description: |
+              slew rate for output buffer.
+              0: disable it
+              1: enable it (via bundled value from drive strength)
+              2: slow speed 0
+              3: slow speed 1
+              4: medium speed
+              5: fast speed
+            enum: [ 0, 1, 2, 3, 4, 5 ]
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
+    #define GPIO_68 69
+    #define GPIO_69 70
+
+    #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl@d401e000 {
+            compatible = "spacemit,k1-pinctrl";
+            reg = <0x0 0xd401e000 0x0 0x400>;
+
+            uart0_2_cfg: uart0-2-cfg {
+                uart0-2-pins {
+                    pinmux = <K1_PADCONF(GPIO_68, 2)>,
+                             <K1_PADCONF(GPIO_69, 2)>;
+
+                    bias-pull-up = <0>;
+                    drive-strength = <32>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
