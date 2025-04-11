Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA7C369A2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 23:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1hVPasK8xol766UKKRWxzKo/ThZmhpcPdV4gHcpq60=; b=ogTS1UiN/nBEYW
	olDUXwptNgt0BRrDnFfoOGI2fDzX4Qkt3lmodFaA5xbcKQA6zM7CXIUa20kxRSUz4n/5vU8QOP2vK
	HGkIEMCwOtMU8uv0+BzNlu2e8wrRdGR8m1HuT0j+XF5roHS5Hx/owBLi/+nTx+SuAUeiLc0zB6045
	RpkDdtyT1CSL6Ey9ME9vqiTr1Ppn7yzBrsmGcEYUsZacOLVBw+45obCcVC34asEauQvflwrTCegYo
	OeyLQqQLPsl6sgt7hIdRmQ/lBJVRmz8k4L72alnvp/yLQ0sy1BfQKw7ViT6obJ+pU7HeoWCecuIra
	l0uVLnlaeC/M9Ye2xk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NrB-0000000F5EC-0YHH;
	Fri, 11 Apr 2025 23:32:21 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Nr8-0000000F5D8-3lMg
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 23:32:20 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3ADAA3432D5;
	Fri, 11 Apr 2025 23:32:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:28 +0800
Subject: [PATCH v8 1/5] dt-bindings: gpio: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250412-03-k1-gpio-v8-1-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3458; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=M9VXnk1CtK2r3QgagZZvS//FUcoVPscUp1KyuaHsl90=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZkuqS6HejCQ9s7lpPFM94hIZRBADOGbP1fd
 dTXSQnpvyaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mmZF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277U9LEACeSmRmAW1yFr/t/g
 /stpNYRHicl0EL6RKphFEz3m5a5aEXNsHdspxfUo/ZokcKcmHcxHM6xzrh2Az7GFLdlvy69cx0F
 hHshG4ZryTi+JtvdD6NYMFxXR2rJ8BLylWnFE50ylFtW4xJ2A81nhRBX71vu/3dMhrWWH2TQx/q
 3l+F6IYlBMn+Fa9kohAa1AmnRLWqStcmwC2T1MRmU4iGmCb11Ed85okOxg1Qx0GAOOEN9+1/Ni0
 dir5e3m/fmYmtSvgzpWFFsIY5ZOhvHhRQlbwfSt0RJQrPsPJNV9YCGSY6hHb5Jji0KbUxKuUJOF
 FkulPr88eAZx+sjdCU1Ul+9Px04NFcSoVQzrvmWpZDjIsNmupXdhMkBYk4kuXW460GShAP2xIAM
 Z3ZCI8oVZLY9io95eX1NNO6mRnY0LkjBN+Tf6Iy/x20WK6rmuhXPGZGWEnTw+G9UIVFjqaPyeP7
 kFCT9EQb74j9J1WZCgCRp+FdmsgppAejnM0/R9rMz1r9A8u0NP4QlPDo8oQ7+NH/TNaR70feFYj
 QLK5uaPFZ9aPNzqNfGH5SxAIGRU9yqkAEq8q3gW8egQGhurA7jkNo5c+5THvqkOZjTbFLW02qmE
 q48V1dxfqB61Pv/B2U5c2el7JpQJ6/t/x7d4f54iIvIP6ia2IAVFH0n7XeQbxQEzQEYQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_163218_989680_E583FF37 
X-CRM114-Status: GOOD (  14.68  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
hi Rob, I've kept your Review tag in this version, but want to
mention some changes here:
 - new clock property is added
 - add reset preperty, but make it optional
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec0232e72c71221444972f0d3e0f391be05e4ef6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,96 @@
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
+  clocks:
+    items:
+      - description: GPIO Core Clock
+      - description: GPIO Bus Clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  resets:
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
+  - clocks
+  - clock-names
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
+      clocks =<&ccu 9>, <&ccu 61>;
+      clock-names = "core", "bus";
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
