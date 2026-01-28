Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F1DD35690
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Te1JKkw6s/8ECXxXLJlRTv41wRFAyxLzyZxPUfCHzOs=; b=lrARyvpqsSC7DL
	eOVGMveckLCltJbNsGdbE24KqOdd+6nfpLZz8M0LM1fpIaGqa/qKsqJt0lfogGrv93LxQQgwqvByx
	XLyEw86uIK2BOvf3A+xFUZTVvCAj+t/RmHl9ut4KdCfxftEMeOZ1qnPRL1LpuubDeXo48rESVB//h
	b0tbYo2Mc8bUqiw+Rg8NJ4IggYGAhkr9B+v8r/up16s+MBHb/mD5+2hTMCskHht7W+0sIUK4C5p9x
	maa0/mIn381DsIq0BmZyPgV/YplqgZjssopfRi6dOoSK4+c3ajntsjxabShrWh81U0x2uK4H3axeF
	xKXRmc64ZmWfzJYyqoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1cM-0000000Fj3j-1eVF;
	Wed, 28 Jan 2026 09:13:42 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1cK-0000000Fj3N-1mzX
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 09:13:41 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b72e49776eso10970404eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 01:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769591619; x=1770196419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEOFkSi2N0vtkbtCff5kn8mqsv72spWR8lTmAsEOTX4=;
        b=M9Hi9d0nrL7N0SEPbY+5KId+3LtPusroEva2GQW+6+dF1LRPHeQIx+q8+uH3CklhTo
         Ixh753VHUN7TAp5K5FOoE/28ZA5CMZX1+bTKkOv+8ZAV6FM2TLvdEFq9wDVmkUmFlFra
         DiWI0AgOB4xvw9aluRdyCkDF735fQbEjzJ6LGp+2SEYqXkXi8ad0zXJEyt1cwudAVFhP
         n/hes7JlyHUrl5BDvPec++mFeQxdYOGK7aq7N5VyWKAa6HjRq2SmazrHw/Dd9JRFF9Av
         pju5cQQF1Lwy09AKZMLLE0qis4vMlwUPwGiuuvQkf72TSJug5Q4Xilz9x2lsB+oYH7xc
         dXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591619; x=1770196419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yEOFkSi2N0vtkbtCff5kn8mqsv72spWR8lTmAsEOTX4=;
        b=Ex8a98v/UdP4qxRV20j0Arz+VRfY/Mw+D4uMcoDjCj2EjP170MtX0XY0xmFgpCiLGI
         o6xf3IpbhRb1NiW/6Y8+aZpLiCnlE58seQB0PImIC4KeMq3eqLbbRFGKiT2hW2SAK1qT
         EVL5S0L3vCj0ftPrf8OMrnOKhTW2B0Sw7LKcpqDMp4TaJaOrojaJKQr3i363SXQT/4zk
         SyS4zajbyB1EFwCnx6bfBG3y5VEjhwCHYNO+3ntTr9XOJBbPi/r/SroIALyh3oPUQW0x
         daxHJc15MKnhcP9UN2G4injHR/O/6G25TIQoUsy1Qw9lu4xo6w5JgZnv1OSR3rTvaG3s
         4L2A==
X-Forwarded-Encrypted: i=1; AJvYcCV0/PneQGlf9Wceq96ZxYTabT6CGc48vZLPiW9dVfT2zCOQuv4EF/KVopcFlUqBDLDn5Kj38lyAN+xZPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL2ujSzTZvJEXv5555svWuDdKs45DW4eWwtIxDD2uHIdpEyxBs
	JewjhO15HnE0sy9y+a3i3WDzptimeC07gprtYLsTCb1kfI57mk19Jktadl6stQHl
X-Gm-Gg: AZuq6aKbYCEzrdceYXdUZKzyo/pHlIVlup5DoA4m21P2KKpWIh7JQ4k81TyWOaiRk/m
	s0nuZrDDBIkTreMoEw2QeTb7E2kBfFTDmrHlNLbpuCFnZ4MbGnUqcjbRAcLLZoYB5vW/3jEwFV7
	PpNOAZoVae7O8S0fr/11CQrzw/sjsUqupARbvglfA8pzR8L0BdMYpNlZM1EigUXOaWQaYRLCC8e
	mLEKfuQLSGvL2z5NGBxcRZgGBNOHAL208ucunwtI4RSDpL7t9oMTRlbkKI9MIQQOGVU65ByoX4Y
	vKTsNwOCuU+hOFL7hC+FytEvBg24h4+EhOLw2c+kJhsOtjnoUdYUbccIsyKIDiQARNNSyxoO5eG
	FhwIy3V7tYa4d5mrxOJ4cl7+skKveP0+4PFZjnuWkLiyXsJBrOfdmhFfpBW863WFoTKvt0Y4wb5
	fSt6zDLkS2U2ydGIiVWJkN
X-Received: by 2002:a05:7300:a188:b0:2a4:3594:d540 with SMTP id 5a478bee46e88-2b78d90178cmr2919827eec.13.1769585396662;
        Tue, 27 Jan 2026 23:29:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm1515483eec.13.2026.01.27.23.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:56 -0800 (PST)
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
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v3 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed, 28 Jan 2026 15:29:27 +0800
Message-ID: <20260128072931.875041-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128072931.875041-1-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_011340_462733_69DF2CA9 
X-CRM114-Status: GOOD (  14.52  )
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
index dd3c72e8363e..a3fcb9a251fa 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -34,6 +34,7 @@ select:
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
+          - snps,dwmac-5.40a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
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
