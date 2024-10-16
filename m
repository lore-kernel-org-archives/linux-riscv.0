Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED9DD2068A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPs3rrlVAwSyq2U8WdW8KlLHj1JP7u2jEpw186Sv3ZI=; b=asA21PzX5fCGzS
	TW3YUG9DiTRlM0K3zQw6Bvs+drs3WabCRUu8s9xueszJMKRQCodWjHT8ylYW8+KnUDE7dnf5DOQOq
	jyHoc5Agnb6qJPQUEhXIGjIw3JHXqBlVcAm31/7krJHkyXzfD6upA7tD2thmjMFsBUEWo3MNDTy7w
	+HOgFuyboJg8aZNIFd/EKGUQ/GEEBgxc5SA9pIVffKPl6rTK+m8IpTPT72A6rQxXhmkQ9Ovc8AQme
	CU4Ef8g9ffLrrN0ymRbI301VlNJzPowXyirI1P97DAId8Z6o8N7jaVad+zfY1QMjSAb1A4HaBxSns
	Mci6mhKyKbwrxuywX7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0sOj-0000000A3cq-0Z5D;
	Wed, 16 Oct 2024 01:00:21 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0sOf-0000000A3b3-1Fyx
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 01:00:19 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Oct 2024 08:59:41 +0800
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: spacemit: add support for K1
 SoC
MIME-Version: 1.0
Message-Id: <20241016-02-k1-pinctrl-v5-1-03d395222e4f@gentoo.org>
References: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
In-Reply-To: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4424; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=qyH8+zwtfupiOe/jy/SZs2UIFz14M9UjXCHZWD/dI4A=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnDxAN9BemnpUR2VOjyi4ScO4yFh4f2+ztYGoO1
 0PCiVwEEOqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZw8QDV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TQBD/0TPxQCPkEfWkEhUR
 88GOihluvrChv0PpKX581f0RvpsLATDDwYgx107RGpfJ347spOL8TD9MebQ9K0F3ye0kU2+xNZ9
 Y+S5f/B0zKiqvh73x1KuBeOPIdZiaTYpceLsJ1ulYTXLcclUWma/+cqX4MZ31YffU0MiB/Qk9WU
 R3BN9uhBdArweZC/bZPc9uq8sXoMkkwCcR7NYcTPC95WSHgFhVKtZuoovz4aoK89PZFN89r+MGt
 bFCkKqyV2GbShf0bSdHY6mMlx2VzpjBu9xKHbLW5HF8aLL7dzvaleCNKVrkVMbAJeyiMiWAqUB5
 319440KCkiscKgq7+XgnwCgiv1EOtuu91upVPEtGFeW1x4Ddxh8vv1b54f0mPQLPVfK5iRv/GoU
 R+Iy6XR9ncyDoWIyHm1AUakDYE56TG3UlSGlA14J7jlGddjzDiH5bzVAMg2G8qQdRRoPW1wTlC6
 +ry78GGDvKYw8xUlDuojkdRTZn7nK4hPWa9Ov/21VWbCFGxStdKDWbwwbyJ0bq9y7EchtYrlVLq
 ZFzGB5fHMkmUsRsWEdvjHZzQhekv82fNa0WPsGgW9BeH0NJ5pZ+Cg0n9yyWMwUUokQk97JB0eGf
 mwnNyCBkbTYQqXVKX1V/LjK9pxf5TyVbgNg2HLcndKBxITfSe8gM863hiwunX9+o49ww==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_180017_584231_D6008002 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v5:
- no change

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
index 0000000000000000000000000000000000000000..b01ecd83b71b5e9f47256adde23bc8b183bef05e
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
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
