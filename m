Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1D8CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k8GG0Xa6LynT5V3bvmAWiPwZbqtoNBP0PBEI0ceLfU=; b=kP5Zw50ILpX3L0
	tfJFHNb7NfUyRQ8toCv36iL+oaLn8ExMIIuCMd4WOeI7MtsxjTDnJrh/pwH0Sbgv/naabomKC/ilY
	+WQzkaoAsu7EFkQGy6JFOqYC4C7B1bHiA9QuyxOjr6Cp5vhDXQS4dM58B9tUHsoi208scSzQ+Xcey
	NZMwvEhtwcKG8S8QNngKBPI+GyITTozLa4vibdlSaj93qxFQ9BzMdzcJods9iiftIZUUfiBMg5qg2
	50k3oBA0B7492e2y0c9BcIJlmhrS1jkp2LR9QxJAiKDjMzR33RTiKPrjHO5JqZaJ1NdZ3508ihT6b
	YmWkfQe8hj1yOx7ouaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeG-0000000E4mU-094J;
	Mon, 13 Oct 2025 17:47:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeE-0000000E4lk-0Uvu
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04E5745024;
	Mon, 13 Oct 2025 17:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C78C116B1;
	Mon, 13 Oct 2025 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377667;
	bh=LlxOX0XdXGOPt3oDaTbfcdhtJfrWKo6DQBQFWyQqX78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5G6GReDfu7EobXs19mLrzGPdFL55sM1gsACHZxoUUTdSZTbp7IhPh9idUciZ7Wf+
	 hbb4KrgLBny0irXbzF3sbFDUWcGAEaP+NXMeni0ky4HAkCjJWK3vlXKuEoiJtH5/TX
	 jOLGVS7R1ActZlJ6xVyLbRCd5Ys/5Z+UZqWc7bvYOq1zHubd92XXGA5zJfXV1Kvj3H
	 N8EcwGKsTtpInSM2RF0BNrCjILCVOI7O2ZVZdaziFL8VGaMq7dkoTfPz0j1JMigQbw
	 eip5P4w9bTYX5LBRFwuWYjVJ/jRejhw6DZcyFWRLjOEFoQoaaV8pKDnVgRPFnIxjSG
	 i5W5+cIUbtGxA==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/9] dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC
Date: Mon, 13 Oct 2025 18:45:33 +0100
Message-ID: <20251013-posting-alright-8f945a4bebfd@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-album-bovine-faf9f5ebc5d4@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2941; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=W/92o0rvdQPG7KvXPwubOldJUAMEfyDDSsE844RVnYI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlvrfbr6kyrsTRy3z7FrEv6xe399bPylN4G3Vl9LeDJK Zn1MaaaHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIlzcjw2wOw/ZlG19HOXIb ZZ+IvPE5V/LeBo68+vybpz9ydITWVjEyvHonNFNGKuzWdWeD94uCVjs85Dv10f1g3ULhxfU/Oj3 9eAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_104750_202860_FD5E1522 
X-CRM114-Status: GOOD (  15.40  )
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
index 000000000000..1ab691db8795
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
