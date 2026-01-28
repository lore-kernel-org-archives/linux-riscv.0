Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01858D25B48
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xL13Q9M+ZIRmIctTVGw5ufKTQp/fIUgBf7dSp7bLIEg=; b=qL0vtsWme3Os4I
	JWHf5W+QKdIY00VzycjOv0UqfXIVEAkU6qT18+V+KufQ7GGG1UPmO7i/DzBz2reRSA2wMCz4kkGQW
	KJkz7f428zXfTP8hSSSJpM04TV9xEbPqBzcfAG/NJahl1hjYI4ztlkFAMMQFDhTDW7k4yts7uBIjj
	ZL+VC41b3F/sIiz9SLIVGELbUehM4KAdqYcUAxg442qefoB5uMb6dxwcBtXoCw7Lz6MjBI68V5dhj
	2ly09ex8ZmlbcrbeW1SQ5hJapEkHFlqcjp9jO6lqMLm9+ViMAxQu2w9Q2Ymb9nhar5RU7/Dxwav0O
	Bt2nW3ThY1IAaqQLGr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cM-0000000FzjM-06ba;
	Wed, 28 Jan 2026 12:25:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cH-0000000FziA-0RWA
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 12:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26EDD60122;
	Wed, 28 Jan 2026 12:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5FABC16AAE;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769603147;
	bh=I6SFiFiNnzvjnHZJQs1yZdEPLEEph5L365SmIUtly8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OU2o3bBxSM5A1rMHXtUw9xEqtmgkmj6cXbmCxGqS6X0EtidnKkPBYjT6krRGOojqI
	 mpDR7Kd6Uh2BjIfIV8dXhTyZwRJxiyT5fEidmjHEKf7HlSB48E5zsoY2NyfxyQ4012
	 Wjao+LvJjsDC9V3ZEpb7vW/N+IEr7WfSMbUYHvLY/boEqcGMKSx6JKOR1O7DwUBoOB
	 UkiOFBtB1zzKqmtiQqMpls34ECv54pQxXHdPvHDyJuZkU78hTswdVlp6rtSrFjkdhN
	 sk6h2XK0zdTlVh+ZlQqmDGITUOuFUMgBLS7YZjM3UEJasM2x/8/5ns/56fK6QJuv7F
	 EriuEYMdCmx6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A886ED25B4C;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Wed, 28 Jan 2026 20:25:44 +0800
Subject: [PATCH v3 1/4] dt-bindings: i2c: add support for AE350 I2C
 controller
MIME-Version: 1.0
Message-Id: <20260128-atciic100-v3-1-8c002fcc2bb4@andestech.com>
References: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
In-Reply-To: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603146; l=2094;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=NMbc3VIfpHJETsANLk21QTpskUGQ9uYRp5oUEqlzxCU=;
 b=5BwaIZCAGLFCyGw3oyx8lje/xt4KUylEHsKwfH29eFwHiK8DsNZLbEUPtNEOvRXUFkgOlQEUP
 cPrJK8pSVBNCXgEwlVdGvD0GBSAuyrI39JRoINgSgovvIEbyrAEo22t
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
