Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7156FF4959
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQKn7MX7OkjDSOhmRBFU8FLO2qJx18VOS+y9NPhw8UM=; b=R6W7z0qr4vqIc5
	BgNITArmc6gE7gjxLJ0VjwA2ohBVbaj6WB4hGWLl0Hdh3GeIhovqGmDBchf3jWoMBTHr+h2t+i+ny
	A5AoPSVH0XXnVPY9a5HWJurjVJ9V7m+7vnEC1UIHEu6hiMY/uwLYJY/BdF1TIEREExxmXLb+xV2g+
	dsXXMD/oaQjWnCzOs7h01uQaScgVT9VCmb8whreInA6uKHRuS/xRC4sJhBwb9YiLzE9YjLnCls9/8
	t29NMMHE30RfPCX4SDJIT/zu5s5R+BBzLGY57SaFUmQlTMUu7iVoTaryVLhg7XIN/qsh9ETxYK8cP
	31DyrT6PyIYq778WIJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7754-0000000Alf8-2YEM;
	Mon, 30 Mar 2026 07:30:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7752-0000000Ale5-3uVF
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 07:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3033D600CB;
	Mon, 30 Mar 2026 07:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3BB5C4CEF7;
	Mon, 30 Mar 2026 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774855835;
	bh=jeJK/0eq1Juwssxo5nwTiMxxOoLDoi/bwnaw/cpSUuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H4chgCCLXKFNvFgh7JzxWjeoTUzf8/hdOicdhlvxRLrZ8y0R1pGs+9eKg07poylYO
	 i8jzveeWw/EJAajv//5MaGBrDXGnwq/yPwQ8kpkhyvIXp9ZsilGF8dXrX9xMb/kT9v
	 PKXV0qpNkrsq5MnhRugCpmwdw+UY/hGZs8tRZrf9q1d7JuE/j6VsCnDzBKtKs+vkvx
	 wp+3woz9D2cvMJeSAAUc/cSJVb/NwW+9fOsCC/hOJDWGY5xmOwc7gcSY/hcnoZgcdU
	 hrW2OQL+6zKmEqu/cOyWHgwMULHWchVUu9DZsdHtg+7fDf6omdpPGJKQ2Llx2OClas
	 +d16kZVtTOYfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37C8FF4958;
	Mon, 30 Mar 2026 07:30:35 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Mon, 30 Mar 2026 15:30:31 +0800
Subject: [PATCH v4 1/4] dt-bindings: i2c: add support for AE350 I2C
 controller
MIME-Version: 1.0
Message-Id: <20260330-atciic100-v4-1-d40822f63e4e@andestech.com>
References: <20260330-atciic100-v4-0-d40822f63e4e@andestech.com>
In-Reply-To: <20260330-atciic100-v4-0-d40822f63e4e@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774855834; l=2147;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=QY1WQtlgEcHyWij1EoGxUJsa8Gq3KZczgBDeH8ReATU=;
 b=aHryHMU39d3nmQBj2v/ecoPILsTHhtNBnf2NaJeaHpgWmMN4mWwlO7BjgIc2PiMrQS1qMdSQz
 wPlUIdPFk0jB10HmN/v0kh3YrevU0Xe1sxNUcUYN1f1zHBHHq3cApl+
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
