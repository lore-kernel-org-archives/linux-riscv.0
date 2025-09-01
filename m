Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB69CCA1007
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMeJFpOyXZO6CI9JIg/1PvTWR3cUcCYW8Ggx4Z6biSA=; b=c8XlcSOE/5umYK
	WRiHMHDbJ4I/L4FF4b5ZldZLrg7mZTVIzByBYjzif4CAT3tRMOhClEWxLv3DQQi2jzMZB97Th9VDl
	8z1s+KFm2QzGClU0X8/Y723Iuj9eKvkB100aprQj27CQFaSTGh7LVbza1WGJq5/1zNIp69LIj7fKN
	PYdD5HnjyC92ZJ5B6jdTQxaMOtdanaEK+/ib17uKKseyYOLCB299NXtci3H9CPNcdGJKkRBiWHJFr
	TwxrliFOGE/e0AGp6X0oNcq9WKen0bwPTroj9qq3gnU0kQcNWYfMMUYBARQpRAHK8Nph1WR3v+mE6
	w6cfvLsoacSDWOQDFBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4DT-0000000CciC-210b;
	Mon, 01 Sep 2025 13:04:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2LQ-0000000BzSl-2kbM
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A58C601D6;
	Mon,  1 Sep 2025 11:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8390C4CEF0;
	Mon,  1 Sep 2025 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724703;
	bh=m5ocoAhQ9i2Yxyd23Uis14ToLuXf0jZLSM0DHyjyLJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bq6Y8EX7ppY3fE5wNtkCzbJNicM5PKEp91aTlMiYjbAboyoWAEzuxiY9IJLz0KRlb
	 A9wL4kRm0TKg40uteBK4RO7HJXqRw5zaiQNNHzWU93qcypItGmQr+X6E7fNRv6yUrP
	 ApbWsR4AyVBjjGdOb9soTx+0d6vWxshEGG+RIJjqV7mw/t4rcu5StTREgBQb268lhY
	 i9mFVs7zDJuaeBr4CG9xDrMYdxh4YBALwZXlmV9YAA8dSeRbupxonBixMTz84KlCzw
	 K9sEuy5Dnc04kp9dpUeQurzsNSwYejCclUJpdz6bdgErQp6ae1UjtPPqkj+jCBNrxE
	 uItuv34qUBjNw==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/9] dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC
Date: Mon,  1 Sep 2025 12:04:14 +0100
Message-ID: <20250901-garbage-hardship-027861fb3380@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901-rigid-sacrifice-0039c6e6234e@spud>
References: <20250901-rigid-sacrifice-0039c6e6234e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=b+aGSGhQUJdmsPs1oLuFh7qLo75fMDz/w1qPMM5tYX0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlba9eGXrq6UORSxIapJ96K6FccM8zh8rKbsqHPteSd8 Emb/PnrO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR2RqMDPcn6Z0+Ofdaqq6k 6/9Ixpz1y1Tf2TK8O6gc/d9TY+Pdb+YMPxnNP1Q5RN/+LZM06eaRdbGbHrFEex9rmeBlfv7n/XM b8lgB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

"mss-top-sysreg" contains clocks, pinctrl, resets, an interrupt controller
and more. At this point, only the reset controller child is described as
that's all that is described by the existing bindings.
The clock controller already has a dedicated node, and will retain it as
there are other clock regions, so like the mailbox, a compatible-based
lookup of the syscon is sufficient to keep the clock driver working as
before, so no child is needed. There's also an interrupt multiplexing
service provided by this syscon, for which there is work in progress at
[1].

Link: https://lore.kernel.org/linux-gpio/20240723-uncouple-enforcer-7c48e4a4fefe@wendy/ [1]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v3:
- drop simple-mfd at Krzysztof's request since the child nodes do not
  yet exist.

v2:
- clean up various minor comments from Rob on mpfs-mss-top-sysreg
- remove mpfs-control-scb from this patch
---
 .../microchip,mpfs-mss-top-sysreg.yaml        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
new file mode 100644
index 0000000000000..1ab691db87950
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC Microprocessor Subsystem (MSS) sysreg register region
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description:
+  An wide assortment of registers that control elements of the MSS on PolarFire
+  SoC, including pinmuxing, resets and clocks among others.
+
+properties:
+  compatible:
+    items:
+      - const: microchip,mpfs-mss-top-sysreg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      The AHB/AXI peripherals on the PolarFire SoC have reset support, so
+      from CLK_ENVM to CLK_CFM. The reset consumer should specify the
+      desired peripheral via the clock ID in its "resets" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list
+      of PolarFire clock/reset IDs.
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@20002000 {
+      compatible = "microchip,mpfs-mss-top-sysreg", "syscon";
+      reg = <0x20002000 0x1000>;
+      #reset-cells = <1>;
+    };
+
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
