Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DB6CD3420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHDdTsG/sU44IY2Zr2Z+qFC6NK83bd/si29DJkDeTPo=; b=lLYoZommLvks++
	/gbtmkr63zRLVIqP4jdDMB/1Q79Efie54KA6NWSBONtaXUpXooZyuNTtMvhkPDcmYQrtmzAZLcvHX
	IDjua2QPcmb/dN/K+TVb/nCgPKrZFdKxbNu/2Z/adZ4XT0sA02JNevw4KjE3qzOXemEWy8ck6o5qc
	9C83fDtsSdDV3/RqLgt8N4B3JeuIjplYfMbK6jL87eU8of+cGXYHJUqJPRBIPNDHDVlT8f2S+GtSi
	hi/OTWw/afn1yIkfuABLuntsVAAcdvxGrIz08S7136eY9P7/y0cytke5NegLm/Pa87UcAb7wyD6kW
	V3D9UxkNiLTgP0MICgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slSd0-000000009Df-3ocE;
	Tue, 03 Sep 2024 12:27:22 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slScy-000000009C0-0VGn
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 12:27:22 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 03 Sep 2024 12:26:44 +0000
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: spacemit: add support for K1
 SoC
MIME-Version: 1.0
Message-Id: <20240903-02-k1-pinctrl-v4-1-d76c00a33b2b@gentoo.org>
References: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
In-Reply-To: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4339; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=YBpT/3PqGgtZFSNBAnPeMlslzAclFshMpPrK579COGU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm1wCUEbvr8+/5FNss5zfyKq9w+eMy/Cy5pBUXG
 k0glKkbII6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtcAlF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277avMD/9kig+JxRIVo9rUKW
 iusSVCLOzi4WUuog1YkjMPM9FbMVBNd5Yof3kbOYvbMM7GABrbQm28/4aZdnjvCQU6svRGIJ0YG
 uiL1qa43A+/EYZOWB+97KBDHathok9w3RziCBJPYtnL8T/+5iJSf695Pq33zK4S6TJd9vvcZF8g
 GfPwc052gF/FHUbG58SlzFr1FMzC9uzR2R841lV4ioEtRYHxSwEnpQSe3xchO6SoeAvbKazNpxS
 Y11hG46e/iCq/n3/o2o91Bh/RiTAhufhcuJ1EMfJxmVcTeb0+D0GE9ss9HfjmmRZgwrZt9AT25u
 cQZ7vcHdyTC6gkDnig10cMkH6Uk0ELe6LscuKxHtZlqkO6Xwx97oVGLzVv65XsFxKpXOaWFJqEj
 v92mOfW9AHflAiux/+dTdRM9H2V8UlJb4dXGp9SUfPRObqBkJn8s22cUWOioWNTV3ZL/5WjuaSY
 YzWtX9EvW4X4Z+kwhH4mBaR8PZUsOdbt2CYI4npL17bsv1CPeIMMaEXPDfskx1fTClWTWM2gctQ
 XBlub0bNF0Edp7Np2q5KpjzE+CwXC08g+8QAKIol0Jj7aQQCHyQi9ktE1TSKNuYWu16K+/YpaFO
 hYaXxWxezocWmnJdTHzXxxgLsm7ziXOiUrxlP/UZf1CSC0U2rruGV7pf0DSpaTJn78jg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_052720_237047_E7FA29E4 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Meng Zhang <kevin.z.m@hotmail.com>, Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- collect tags

Changes in v3:
- drop spacemit,slew-rate-{enable,disable} property
- use drive-strength instead of drive-strength-microamp
- fold strong-pull-up into bias-pull-up
- format fixed
- title fixed
---
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
new file mode 100644
index 0000000000000..b01ecd83b71b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -0,0 +1,124 @@
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
+                    pinmux = <K1_PADCONF(68, 2)>,
+                             <K1_PADCONF(69, 2)>;
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
