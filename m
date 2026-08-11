Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6247C5AD7B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoWD8FugTmpooZkQKiuLZs9Mqdr7wwRCutp0ocI8GIc=; b=aaUyVOgCWF5eF6
	K20Q9VdOY8YgeBJNSkyv5YlXz6GQKl3dP2RW+mKksv8XIZVY0KZhu3kQjNtluKHTK7CYjCuBTdBF9
	ck9FBf2K2VHG456VqkOinh3Xr3rd6bBkRViAMqs8EZUkIsuXiV5NXYMUMARXbHQBG0HaP2cZcMdIh
	hp7/hEcByZRJhlAqNjIs8kPy8LgOx03xt6cKTyGnxzT5d78sopJ6Bj/ZNVLqVczarJdbs6CgZeIiL
	B1HkBVOUKLu6iGrAzOdQmDrezkGqa5ToYfrHbX9uCxH/4A/hN+AIKvAN1n+WmHcHpXohzOapXOELN
	5x33Yqvp1f+5ENu7tTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfzm-0000000DPrw-2Fqw;
	Tue, 11 Aug 2026 06:29:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfzj-0000000DPqC-1xgL
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9090B600BB;
	Tue, 11 Aug 2026 06:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 352E9C2BCF7;
	Tue, 11 Aug 2026 06:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786429790;
	bh=rxbnkO5Bo9eMuXTx/7aC8GXRAwV4Vgxstp+S/wWtRJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ff/NyR1FN50F4B2rrNlK4y4oUH9BwfVNRofg73n4e+xOIv+g8dgEpVg+dKoJFlwDg
	 MGcYb5QEJvfZ8L7rW4IcYEgVjlKcnil6enhhbCRxyfl9Dm9FzKL8YQa2L4WRenuT4x
	 ZLRc4rJLIhm8D6lE6S0Cnm1h6TiQpaKb6IMz9vD6NJ1T4YDDLVNAoiSF6AqBOy4A/K
	 3OiO+XxQVJk3ggn4KK7n1njwS0DSuBIyogTKIpFYZzZTG4Yw5aiXj8evHkckgyqoR/
	 5IP/leX2PNpLK4sqqDrjocHSZU6k19gZ5uI6yAsX9H9ynELJBA5/wh4iSPUmnKuUaz
	 AnUY7SZlPLmqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BBAC5AD7B;
	Tue, 11 Aug 2026 06:29:50 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Tue, 11 Aug 2026 14:29:48 +0800
Subject: [PATCH v5 1/4] dt-bindings: i2c: add support for AE350 I2C
 controller
MIME-Version: 1.0
Message-Id: <20260811-atciic100-v5-1-1d306c21dba3@andestech.com>
References: <20260811-atciic100-v5-0-1d306c21dba3@andestech.com>
In-Reply-To: <20260811-atciic100-v5-0-1d306c21dba3@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev-09770
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786429789; l=2147;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=bq3xzDJ/OIuUwfBkMViZX6pvpmLXUhLZ07QGmtn5ZDY=;
 b=jLQ0aV2x15w7MTRX/V+ERzbSHB3sC2BMYjnGoGn5kladTHrDAZW/eeYb/kKShILU4286x9sVH
 CWF2HlU6y4FAD3ercY0Q8wV70E6dKPeNlqeQjQI4vFtub8gJpQgiIcv
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
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
Reply-To: ben717@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ben Zong-You Xie <ben717@andestech.com>

Document device tree bindings for the I2C controller on Andes AE350
platform.

The ATCIIC100 is a dedicated I2C controller IP developed by
Andes Technology. This IP block is a core component of the Andes
AE350 platform, which serves as a reference architecture for SoC
designs. The QiLai SoC also integrates this I2C controller.

The binding introduces the following compatible strings:
- "andestech,qilai-i2c": For the implementation integrated into the
  Andes QiLai SoC.
- "andestech,ae350-i2c": As a fallback compatible string representing
  the base IP design used across the AE350 platform architecture.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/i2c/andestech,ae350-i2c.yaml          | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/andestech,ae350-i2c.yaml b/Documentation/devicetree/bindings/i2c/andestech,ae350-i2c.yaml
new file mode 100644
index 000000000000..59a521fb249b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/andestech,ae350-i2c.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/andestech,ae350-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes I2C controller on AE350 platform
+
+maintainers:
+  - Ben Zong-You Xie <ben717@andestech.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - andestech,qilai-i2c
+          - const: andestech,ae350-i2c
+      - const: andestech,ae350-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c@f0a00000 {
+        compatible = "andestech,ae350-i2c";
+        reg = <0xf0a00000 0x100000>;
+        interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
