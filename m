Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC902D73EB8
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 04:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAU6aK8amN1bUIoEqr+u4KifE1F4hGHPqygUV5WUVHA=; b=GVMc6173wCBCLQ
	t0gSF096FypNxMdc/pdNsKBLeHEt5gKxLvDk9uvsIM4ugCE+lZ1uq48SZARCyptYGG5vaP9aljg6H
	vYlSLWxTV1NEWMOk3veLmKEZsXd6JxUl1l3kY8g3bnSvpFqYeCepjkQkUKz2WMqUW9OQXxDWnrG2A
	Lbzg5DgYLGhgBBrg3zG4cpKltVUOjKceXY3qqdkSlUjptV02v2UA2FwMwi45plfyDWpZ6bf1dg39d
	YU1IUY8LrpuZAWxs3qmw1p1f8tpFMLFqwNrByGnIjjYmZew6R4D4xC7MvhjDp3mEV4qEil2sWStIx
	AbwED/M3Ezg3Kniq9Lag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfre-00000000zTF-1YB8;
	Fri, 30 Jan 2026 04:12:10 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfra-00000000zSt-41bI
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 04:12:08 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-502a789834fso13454191cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 20:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769746325; x=1770351125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+T2Zlo06xiXQn/gacLojfwLwZ7jz+x2wxOefgL6ljo=;
        b=AYJDEKK6i/Gyi/A9RGtg38hgOdgpLmvxagFXWOAoJf5SwmS/MnUpycpz6IMdKl8Fw1
         tYv3UqscHKhkS9rVnvQZ0sI592LFuG/Ner07cw4ZTIim76v+g7W0eoUT4QoeZmIDKKGN
         /5isS/HM17d/l1r4PcyicMgJngK/U3yltqWkqYvGyoQyzEie8LDWSwdpjHAlJ7hW5yrh
         z0KllQxj5G/bpXNImNnwYe0gbAxyDin00EynpjfBeETV5ARPyH3MuoXCw/wXZf/B4OxH
         3edzZ9mBglV/ejM/B2vKrlvKn7QpVTBclTrOqOvrDp399ftBPdWknOrkePX2XbLMh0Ob
         UBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769746325; x=1770351125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H+T2Zlo06xiXQn/gacLojfwLwZ7jz+x2wxOefgL6ljo=;
        b=d4vRwsM3c6mkQ3SyKR5rrCsDcYQxvCdl+GRwidwp/cwdJ0YmgRPiR7HuxvgUENI6/2
         MYlVu2119cy2Qv8DYESjVcAnC3It+5JIQUXpzCjO4lMe5Yi9hM9H11N1BySQ4XpQJ5BR
         NnrYoHSzpeJW7SV6ns1z7dk+yYJTK26DlEXiIOyrup3tSKw+vNbVBlec0KMKgF04sWBu
         /76/vL6MBJ/61b2RZsUe6loUsI2f+sQA4HraXO3IxwJJFFtzrzZtYQ44OEOsG11CtA/V
         Z5GPVF4t9rQn8V0LXrXMYTJE6+N3QLn6hJ5sSUWqDVt7ZCeVO0FvnOrtgpTVJ/j9o/Ay
         7UtA==
X-Forwarded-Encrypted: i=1; AJvYcCUQhteSykNEQ1VHsDvPY8z/pOunFlUhXYEnqNg4ZGBNnG7twcjoA8PK4/vHzCvEE30ZROVqnN8FRdZ4SQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJPTjM/3B8g09RmjcDbW2XB65myzwMfwy9qIZc/iX2ZBsYB4Ed
	HkH1mm3o/6A4kTeBdk8TWnnBiSffhbX+qEIwS/5zr8x7NPkaKULvf5CF
X-Gm-Gg: AZuq6aKmWE68G0PL9MY73iMceW7JnbyKjTDCc4hjLL1VDQ4mDSip2uo1dK3UyQYpv8N
	dANrgEpwnOHI3v2guDFCx/mw/Wr3uzeDLyvFqHdictdnixwfAjCWEHJAMc36L9HASKepm7kiq9h
	EhZplNfoyP+PB+BfOcBnxJ5/DGYYEiIEH5NAI0A2OXY58zuyr35bpAmicSkS41JYnQTeQ/EQY6t
	o3zSJAIfTI9cVV6t6mOnmjQ2f/CeXQHm27IK5P2nId4XEFSqbqTcF9ixl6Q0LfSm8BbJBaLzZ6c
	6+NCsxDnjHm8BFWin6i51CQOWeGizRkMNyYnP41GlzQZ2j0WX7NdPZdZtRH4LksXQ2NPOS+qVMX
	L/+8hbOcIJ2qgMM/bxdf0j+5lGYbhNjO0yJjGzBG1ju+A8Uuf4i30Y2PcY6OTUK6FvRhJrKFnrB
	OVOyD0QSSCZJ/D+BqgUkmq
X-Received: by 2002:a05:693c:2b08:b0:2b0:5834:44d2 with SMTP id 5a478bee46e88-2b7c894932cmr655603eec.39.1769740049721;
        Thu, 29 Jan 2026 18:27:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7bb9ca10csm4119874eec.30.2026.01.29.18.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:29 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Fri, 30 Jan 2026 10:27:02 +0800
Message-ID: <20260130022705.1059214-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_201207_408003_5423B1C6 
X-CRM114-Status: GOOD (  14.56  )
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
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..faa598c19bf7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -108,6 +108,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -653,6 +654,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..fc024a927fcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,103 @@
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
+      - description: GMAC main clock
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
+
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
