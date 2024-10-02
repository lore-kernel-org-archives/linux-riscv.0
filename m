Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44864CF31AF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 10:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQ44kXt2ic1EEjOcgD0PMqZD1Z6mFm69vz1kNDj/8aY=; b=itbxf2v/0xj0kZ
	Hoaj0BRXAPT8RZoF+ADijCPQKcwOBuPwTNAuPg0E4gF9GhF9tn5A7+HKcCV1JC35U+70s5T1z+Px4
	nGCG+S7bD8+p+g5XszBZlnxcy1TBuSG3q8CfvLSwAaCutWXob5TRWMUhWP3egqTcjg4tRzX9w6IFz
	+XwD8L/v67LSr43OX9X0/ojCYbPYtp4H5++NgD2coSjUglVYd0KOqHc/RHmy4SKxWvn/0yj3DA3I3
	8KPrFzAtYKEuN+tvTbbqt69Qe7IBmMb4piMw0DL+qnb4TfOd0fTwl+LaeTG17WUkKEccupwFkt89r
	Pfr4jc1uCy0E5DRKPmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svx1k-00000005Zm8-3dHN;
	Wed, 02 Oct 2024 10:56:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svwuF-00000005Xqz-2aLg;
	Wed, 02 Oct 2024 10:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D749B5C0114;
	Wed,  2 Oct 2024 10:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D86CC4CECD;
	Wed,  2 Oct 2024 10:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866110;
	bh=KK+BcsuRJN2IOP669Lit6r47G+i7DjeNaOKrR0WxAuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4dDEoN1NJoAdiCx4sX6sJTdfUEH32BAxlOp155DHNynwFcMEfMcjJueGjAQhAyP3
	 N3rijFSFfPqvIoo+YIvp7yRvyWSW/u8TNiMHpP43KX1cY2GDqGjTQhLVAPK8YAWFof
	 DIANwA+glWNgin8PxtTbboXuo+rGfrJPV2MUeSSyHlyaB3mx95iqaJX4wEJ5bGg2BX
	 qflJiD8LyR7bJJ3uvE9/j4OyGlo+CpHXmV2Bak5VJDNuJNZm76p5pZD932/gusDZvn
	 gBghleQ2FMFlne0NCGQEZTS66B+vpCdlmyHiFdCV0+ZxLcaOGCOVHqMJoOpeZxF+Fw
	 y0vh1fI4THvdw==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 04/11] dt-bindings: soc: microchip: document the two simple-mfd syscons on PolarFire SoC
Date: Wed,  2 Oct 2024 11:48:02 +0100
Message-ID: <20241002-unvaried-clever-374b4d763849@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-private-unequal-33cfa6101338@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4842; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=seCx3G0dokXhsXdE+ckJ6wFNG9AN2iOsqmMg73QRyzA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/VR7cKntxc7H+lki1DLObUgz3TpjK3edhcDpivKeQY cdjzWOhHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIy+0M/ysPqmy0tE9+1zNj RW6sj2FhmA2D1umNPpZefJ8F3O4teMjwz5Dpg/9+w13CyS7SXHscJ154fD1oreiDN6d0vnpvm7N nMQ8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_034831_769251_6E0F9A44 
X-CRM114-Status: GOOD (  18.31  )
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

There are two syscons on PolarFire SoC that provide various functionality of
use to the OS.

The first of these is the "control-scb" region, that contains the "tvs"
temperature and voltage sensors and the control/status registers for the
system controller's mailbox. The mailbox has a dedicated node, so
there's no need for a child node describing it, looking the syscon up by
compatible is sufficient.

The second, "mss-top-sysreg", contains clocks, pinctrl, resets, and
interrupt controller and more. At this point, only the reset controller
child is described as that's all that is described by the existing
bindings. The clock controller already has a dedicated node, and will
retain it as there are other clock regions, so like the mailbox,
a compatible-based lookup of the syscon is sufficient to keep the clock
driver working as before so no child is needed. There's also an
interrupt multiplexing service provided by this syscon, for which there
is work in progress at [1].

Link: https://lore.kernel.org/linux-gpio/20240723-uncouple-enforcer-7c48e4a4fefe@wendy/ [1]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip,mpfs-control-scb.yaml | 44 +++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        | 54 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml
new file mode 100644
index 0000000000000..4f9168320243c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-control-scb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC System Controller Bus (SCB) Control Register region
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description:
+  An assortment of system controller related registers, including voltage and
+  temperature sensors and the status/control registers for the system
+  controller's mailbox.
+
+properties:
+  compatible:
+    items:
+      - const: microchip,mpfs-control-scb
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      syscon@37020000 {
+        compatible = "microchip,mpfs-control-scb", "syscon", "simple-mfd";
+        reg = <0x37020000 0x100>;
+      };
+    };
+
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
new file mode 100644
index 0000000000000..98ccec3caad51
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC Microprocessor Subsystem (MSS) sysreg Register region
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
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    description: |
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
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      syscon@20002000 {
+        compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
+        reg = <0x20002000 0x1000>;
+        #reset-cells = <1>;
+      };
+    };
+
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
