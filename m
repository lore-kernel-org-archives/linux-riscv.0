Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA55CFD006E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGm8FC9bvRwQC14XvIExAlhllOHV70lJHTIGRgSPSQQ=; b=Bym1EdQ8JU0ncB
	l2SEcI09hoaS8ZI9T8AQh4v1C9WzxAaoQPCd3FlP3rt1WzksVgBROpMLunIpNjE59QvB/byfFZFMC
	3o/JtCMzUXD2Ze5Mp2dZ3KKwXixlJQohnLXTazZC4CyVx5l3BHaJwCASKGeZtxy4lEwEzDg7V/LgY
	XYtZcczOMXGcv9TizvkyyXvEMr3+OwK8MymPgO+lR3hk/6sZdTe4Z+dFf5m9vGAfj5L+TJhVv1+hS
	T8ytj3HTbV19EiiOV33GqCfL+Ir0cZXWHSwPNgVnyCiVyXmRVNrQH3pI1GXJEGYYkOlLp03aDxxNs
	994NpKfvngsRbweQfosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGy-0000000Ggsr-0FAB;
	Wed, 04 Mar 2026 08:08:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGv-0000000Ggr5-0GH9
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:07:58 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3597fea200dso2617307a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611676; x=1773216476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=XUJx/BNh1QWiOy8GKtj9sC9mD14II/CTu4dd1yayAhvRKozvUg4Ebd2Duu/Rl0uEp+
         7qI8Koik5Nf3dc1SKzr2wkmutLGaxcFZcyIHvpWX4PYGE9uXkXBhgb/NfcKVlHNj1hUd
         +VJreR+H162elSzG/OE1FjWdcIXF9Ocn0Nad8sQwZ79fw8jMPKVH0JtKM0dHHComYIA1
         OcL40b1IgI2s7UsYPGmoEviGOnRIxk3JvBREH1/9eXEhjFMcjMD4HdEorh/UBtv8S9Lk
         swr4fQMAikTv+61n5qReA2K2iEs/FNM4YVYsFujyhVioM3ItWMv5AQOUEngfcPgTm/iu
         YHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611676; x=1773216476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=E5PK1T5CFJX83XWfPn8h9PTKBPj2O2CvJzRNEGSN/iIRCYmdrCP7Kg3Vj59UBpoY4t
         P5jv+qGj2vx7koVxm3aY12d2md8sngIkWhZeZYeTOmHiFTe74k7Aawz7sNsbLF5sZGc5
         UrUtl0qQHjFPJ7UkPskaNH32qbMNTfwygXHq9exaT1tXin0R51YVhMs57PiOZ3Ie4eaW
         /7Sk913bOLw3EfENxkVm8ACCzk12RBiF0f/o8jr4TbwnX4QHDOCd9umbRI40lvPRzOSu
         /04Yj86cx8pUfQtKb38r1+vtTQ0CldtS5FMK1nya9b3JlUyLfwT0p9ow6yYaUWQmJkjo
         6Bgw==
X-Forwarded-Encrypted: i=1; AJvYcCVnVDUfnWFhvnYYpF/k+AakdhiN4C1GAb+knGsMLxhger+aYYXd1E7oWahPYQS6P8wfQzjAP1ZKf/wIoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybeTUqku89tBZInltoZNjwhpNhgaZx8uCvsK/tKroyqw2ANNvq
	JHlivf/Q9AflEdDWGp9ESCYqKRXqNFl3aMAOrMXsrl1S53oXzLB2g+28
X-Gm-Gg: ATEYQzwbRF/IY66lgd6rRShrelMN+PED0zzQQNh8wpnzejUxXMJHLF16/r+qjr8kOFk
	AOm1shgfivzqQM7zLLxLlAPgCRKvj9UcEEllvvsErv5TAqlTaRGdU8w1K+q2da6OPeFcd30S2lr
	Qt0Gz4O572YKNlBmTSPmtla4gibulNP2VRPbNcY4KevIdhsgmNUIbD7b8Rw/x1+5kxtoUIQf+7w
	zFqhOe7kE+rI3c0keknB7aZ/n+j+XXaDORfU9gH+S3kOBpC74vDnUYvYAFKGqD1MiTd00muAwrB
	N5dAN6RxBKASrqWdHdfT9tuFnHSsdP+lmFpQPzclSQuh6hSwm63uSaAo+xmstFlEYOwWid6pfoO
	bLmFGE5VgQQS9A+BirdyFSAZtgkluJVyXaOSpDeWVbx+ppYG5f8UZkY8ffN20cjNjyx0vdphf+b
	0u9PX2cQkWzyhPDg4GIaFcMaA=
X-Received: by 2002:a17:90a:e70e:b0:359:8ed3:8a65 with SMTP id 98e67ed59e1d1-359a6a7e138mr1340347a91.34.1772611676045;
        Wed, 04 Mar 2026 00:07:56 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa84855esm16728289a12.34.2026.03.04.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:55 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v7 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed,  4 Mar 2026 16:07:18 +0800
Message-ID: <20260304080721.1658224-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304080721.1658224-1-inochiama@gmail.com>
References: <20260304080721.1658224-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000757_102612_FC0DCAC2 
X-CRM114-Status: GOOD (  14.72  )
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

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
MAC (version 5.40a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 38bc34dc4f09..98ebb6276bc6 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -109,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -656,6 +657,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..678eccf044f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k3-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: spacemit,k3-dwmac
+      - const: snps,dwmac-5.40a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC application clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: MAC interrupt
+      - description: MAC wake interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node which control the glue register
+          - description: offset of the control register
+          - description: offset of the dline register
+    description:
+      A phandle to syscon with offset to control registers for this MAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - spacemit,apmu
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@cac80000 {
+      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+      reg = <0xcac80000 0x2000>;
+      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
+               <&syscon_apmu 69>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_wake_irq";
+      phy-mode = "rgmii-id";
+      phy-handle = <&phy0>;
+      resets = <&syscon_apmu 67>;
+      reset-names = "stmmaceth";
+      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
+    };
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
