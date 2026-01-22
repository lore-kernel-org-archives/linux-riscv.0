Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FD3C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 03:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoYh1C4wffxRDzpL/DMYOnsWEx+8WbPWJQboTYI7IBc=; b=Hov0RVpGAr9uWH
	kk8VQ8H9wGM8RLxSvyI6czbmsVDFNLGktbkaQvFaXdgeoEIU5EbHPUyuNW3nKolrU7BlK7h+lmZrN
	0a1MoMga4URf5ZgYJCc6SZvuONKm6FeA2DjGWpz2ZfvJ7fvAXUyUJc1TzYVA2Oov/XtGEpPfEZ/DN
	upZy2ReMKCOiLU/D5cUIQ4dMWngyKFufedN9lI+flZBvKtafT3K67yq79pvrgtgqZNzzmM7erIlvA
	IQTMelFx3SFwqC16inR2u+Vc0TbWKptO4EVsCwgNeHlW3iuHur400XDZvn9wxDjOYsN0EqAX5U+oH
	XiChuaNFFcastZZv47BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1villL-00000006OZm-45M4;
	Thu, 22 Jan 2026 03:53:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1villH-00000006OXv-2HFM
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 03:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF0FF44322;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92496C19422;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769054013;
	bh=6yOhuHzNdTY30xD/XYfZjff1L82lMLcjgD+SFKPnxTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y+lN9bJC/OHh6pjeCDwLN+4tn/hu2+LX6v15VoiWVpO3Zr0gU0T1nYSiijkqfYZfX
	 8rR+kHJ+PzJ/NcFnj3daFZ6rbdCuOgKyuzF9B9pYi1QnIfPy/a74lBhXLZAXfY4rL1
	 nJUTmQQRx8Be4nqxOwCBIAiOamV8WTVB+I5eaQwporb6C4hAg6AMvpja+sZZWCaMqB
	 WOVnBuFox8TqU495d97ugwOha2fO0nPsk8t59HtME9DeuZrN2OxFcvXrnY8wjZMkTa
	 QyypRMh5Ojm6OrhccWkuDAAn7DeH4eoLqvIMoQjzh8JGD/dc2R1wtdgMNw7vIbIluU
	 g31EZ7pVBN5YA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831F7D625E7;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Thu, 22 Jan 2026 11:53:18 +0800
Subject: [PATCH v2 1/4] dt-bindings: i2c: add support for AE350 I2C
 controller
MIME-Version: 1.0
Message-Id: <20260122-atciic100-v2-1-7559136d07cf@andestech.com>
References: <20260122-atciic100-v2-0-7559136d07cf@andestech.com>
In-Reply-To: <20260122-atciic100-v2-0-7559136d07cf@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769054012; l=1551;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=bzYjfsqz3N3OJ2j9q6l3BfHCzA65mq7d2npy3Ry0CC0=;
 b=cae9XqVaBijHpGFgb5ZB/sdG9gKCTINR921/4Qy5OD1h21DNmNwnafowJvlmWthFpi9or8KCX
 C+KJXDzvmThANQo0SX0may8Eanire4JSRp0jXdgjucOtcPuKWi2gVZ+
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_195335_621742_FAFF8134 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
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
