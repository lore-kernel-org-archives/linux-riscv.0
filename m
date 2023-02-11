Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525AAC636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCj4vlvWzEOoizzuSmBu3IXHPN5pJzEzS7YQAM20ZC0=; b=hDI+jnKodpRkml
	ECvm1vJMXt17yFSFcFwmMJRzCKRWAYOMuh49EAszhDPqddj2d+I9nGkr3pJK7xmsRL9eWUADzaTHV
	IKDqHaviCWS+AhrfDclPjY6UE05td6nJ7oW1hL2xuVi5oQghHSzsTsmW47841U/M7Qq6aZkkM6Hbm
	6CE6iGWxHKWLRU4FBxaBpIHXVg2oRFuhoEWRTyKNwKhv1EN8g6DvNVdakC/V3Jhm2ljf0SiL2Jt4R
	ZKPUX9+y1i1ZBu4BRElue9R03IT5vJSfIDEQLS0F2yuK+8jjJKNnuzLbIe5HxXaddV+83Qknr3z6L
	QAhK/JZoTP6aH6Djrl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgbc-008XKc-Pc; Sat, 11 Feb 2023 03:31:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPd-008Rsr-UO; Sat, 11 Feb 2023 03:18:56 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 651E6660211A;
	Sat, 11 Feb 2023 03:18:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085532;
	bh=0BO882sWApwI6Wscjhip8MF0KqwHYe/THm/J3y/0b0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3s2oQkcRGhZ6jdQzVpXMV0mBoYa0lo/RGpLmrG3pXtSu/54qSeNOsfy66KoMutEI
	 3E53lyoSKP2pabRbWqY04m5Yo1cJKbP0+w5PiKuqeKJmJTIBB+vbK9uj9SvKX3KrvD
	 dMkEpLflWHL+vEq5ylHS9BFhKkteQS8DSXmUOEFxG4Xtfo2N7aalN8+z2fS0SspDSf
	 jf6K67v35sKNfkWTll7SJcpO1BtBFPtF8srXAmpGJOHge0+WdJWyLVXzjpeQ5vBlgI
	 acJKoyW9JCSip1guYzv6xw7VW3zlF0q/deKqa0Kn1CXq4OVnWgzETD3dBCM5Jx4S4Z
	 VFcUOdqcyElng==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 07/12] dt-bindings: net: Add StarFive JH7100 SoC
Date: Sat, 11 Feb 2023 05:18:16 +0200
Message-Id: <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191854_278227_A30AE837 
X-CRM114-Status: GOOD (  14.86  )
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

Add DT bindings documentation for the Synopsys DesignWare MAC found on
the StarFive JH7100 SoC.

Adjust 'reset' and 'reset-names' properties to allow using 'ahb' instead
of the 'stmmaceth' reset signal, as required by JH7100.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  15 ++-
 .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 3 files changed, 122 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index e88a86623fce..71522a2cd7a4 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -89,6 +89,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - starfive,jh7100-dwmac
 
   reg:
     minItems: 1
@@ -131,12 +132,17 @@ properties:
         - ptp_ref
 
   resets:
-    maxItems: 1
-    description:
-      MAC Reset signal.
+    minItems: 1
+    items:
+      - description: MAC Reset signal
+      - description: AHB Reset signal
 
   reset-names:
-    const: stmmaceth
+    minItems: 1
+    contains:
+      enum:
+        - stmmaceth
+        - ahb
 
   power-domains:
     maxItems: 1
@@ -578,6 +584,7 @@ allOf:
               - snps,dwxgmac
               - snps,dwxgmac-2.10
               - st,spear600-gmac
+              - starfive,jh7100-dwmac
 
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
new file mode 100644
index 000000000000..6afe30690172
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 StarFive Technology Co., Ltd.
+# Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/starfive,jh7100-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 DWMAC Ethernet Controller
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+# We need a select here so we don't match all nodes with 'snps,dwmac'
+select:
+  properties:
+    compatible:
+      contains:
+        const: starfive,jh7100-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jh7100-dwmac
+      - const: snps,dwmac
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: GMAC AHB clock
+      - description: PTP clock
+      - description: GTX clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+      - const: ptp_ref
+      - const: gtxc
+      - const: tx
+
+  resets:
+    description: AHB Reset signal
+
+  reset-names:
+    const: ahb
+
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the syscon node
+
+  starfive,gtxclk-dlychain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: GTX clock delay chain setting
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive-jh7100.h>
+    #include <dt-bindings/reset/starfive-jh7100.h>
+
+    gmac: ethernet@10020000 {
+      compatible = "starfive,jh7100-dwmac", "snps,dwmac";
+      reg = <0x0 0x10020000 0x0 0x10000>;
+      clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
+               <&clkgen JH7100_CLK_GMAC_AHB>,
+               <&clkgen JH7100_CLK_GMAC_PTP_REF>,
+               <&clkgen JH7100_CLK_GMAC_GTX>,
+               <&clkgen JH7100_CLK_GMAC_TX_INV>;
+      clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
+      resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
+      reset-names = "ahb";
+      interrupts = <6>, <7>;
+      interrupt-names = "macirq", "eth_wake_irq";
+      max-frame-size = <9000>;
+      phy-mode = "rgmii-txid";
+      snps,multicast-filter-bins = <32>;
+      snps,perfect-filter-entries = <128>;
+      starfive,syscon = <&sysmain>;
+      rx-fifo-depth = <32768>;
+      tx-fifo-depth = <16384>;
+      snps,axi-config = <&stmmac_axi_setup>;
+      snps,fixed-burst;
+      snps,force_thresh_dma_mode;
+      snps,no-pbl-x8;
+
+      stmmac_axi_setup: stmmac-axi-config {
+        snps,wr_osr_lmt = <0xf>;
+        snps,rd_osr_lmt = <0xf>;
+        snps,blen = <256 128 64 32 0 0 0>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index abed40db41f0..d48468b81b94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19816,6 +19816,11 @@ M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
 F:	arch/riscv/boot/dts/starfive/
 
+STARFIVE DWMAC GLUE LAYER
+M:	Emil Renner Berthing <kernel@esmil.dk>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
+
 STARFIVE JH7100 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
