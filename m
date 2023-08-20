Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64866EE49A4
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Aug 2023 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcKD863epasJgS6tKbIgPP4JjdrhUdgJntz71BeljOo=; b=43HZjitAeSChhS
	DtQ3MrFHSUiNq9S7oYbtG3qTcRBWXPtIUIjV03sJRNCtoBBgLy95liyv5mrRFcpbzu59mzNcIy1ke
	EWgrs+2rZ5ky8WYrn9gNE0HZHcBWRFY0wk2ogQ6kmBzA3P7cfUAOVerETIy6jBhUIMoBZ2qqHFpCL
	Lf99MynyhpjOLlve5YmmhASxl4713rZ0xIed1stimFd9OJ2AZ2XmDOTl/1XFLcIGJ0pYnFyG0o1X7
	OLS+ZmmyRvRpuUeiYgPxl6DiI2vdnG0NzMtcKvfyRqXeDVgZ7MK82BkD7hw3Hln4PlSeP9aoWsHpV
	Q1qiWpxNqhC941qwoiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhK6-00Bscp-07;
	Sun, 20 Aug 2023 12:14:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhJs-00BsYj-38;
	Sun, 20 Aug 2023 12:14:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6172960A6D;
	Sun, 20 Aug 2023 12:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E68C433CB;
	Sun, 20 Aug 2023 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692533651;
	bh=EWb+P3txvbafg7rtyKSyM9vIE84CV5SI1rjEO7WrC7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q2xkdFXW9IDM4IEr5OO9OFBpFD5VxDqpX80tvSxxF14Z6z+DYDTv3j1UFDSFcqOqL
	 1EdUE3yXcdCkFyRMOVj767X0ETveH/PRAVcMXH9GOWYkV8CKdAnq/+WQG9bns0kuEU
	 svD7noomEBmZZPBpHeFxJ4NCxGNE18ESX+geeIn9unHfpZVVtxQvZ/YYuHS0vAiMAi
	 uXLkWw6VjzpXND1nYqcXcz9i8z3WBapUs3+KZBtk4IbOkXOYXFpRcELTsSIsJ2xG/1
	 CU44q1bQp2cObVDRMd8J1vec6VcFmEl35A8HVyLRj90KRvA8Lndt+Xp9wzHdJ4tvnY
	 WlQH4OCv1+r6g==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 2/3] dt-bindings: net: add T-HEAD dwmac support
Date: Sun, 20 Aug 2023 20:02:12 +0800
Message-Id: <20230820120213.2054-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230820120213.2054-1-jszhang@kernel.org>
References: <20230820120213.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_051413_095099_9B94A940 
X-CRM114-Status: GOOD (  13.11  )
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

Add documentation to describe T-HEAD dwmac.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../devicetree/bindings/net/thead,dwmac.yaml  | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 7626289157df..b8f61db0e9d9 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -96,6 +96,7 @@ properties:
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - starfive,jh7110-dwmac
+        - thead,th1520-dwmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
new file mode 100644
index 000000000000..8ab16c408537
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD DWMAC glue layer
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: AXI clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: axi
+
+  thead,gmacapb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle to the syscon node that control ethernet
+      interface and timing delay.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phy-mode
+  - thead,gmacapb
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
+        reg = <0xe7070000 0x2000>;
+        clocks = <&clk 1>, <&clk 2>;
+        clock-names = "stmmaceth", "axi";
+        interrupts = <66>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,pbl = <32>;
+        thead,gmacapb = <&gmacapb_syscon>;
+        phy-handle = <&phy0>;
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "snps,dwmac-mdio";
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
