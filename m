Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC40C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rU7zu2TnyV4tnv5+q1/nJwlqJd51G3yDvAaLqL5q3Js=; b=gbG3KW3ghNPtWy
	Ej0TC5uE3aqyjTeNEV2ao5gFjEodYfT5L6cMU5g6Ky0+AEm39QGMiawMjp02fDxAc+bpZoMHZGpwe
	oeNYbaoCsyKUFBIQREfdxu7q2eFTQfF6sdbMJfxIiMnw4QVKKPanVta7EsAAZLOF/HnlDRRNME6qz
	05uNihQ2QYzNQt+XviFw9iWjli6ls0aTqyu+aUZ4tOHWm2qY9gpc/oNdP7MQpV6NTDzJMd62LsguC
	xCZPhL6mgmlSuzRaIeiYuky07+nC8WL/mWdo580cmybcBGH+hJR1fMxPAlzyQPIWnKQQOK9AKi4bo
	5OZV1oW/r/boR1ZztwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGw7-00000009HhC-1Qul;
	Wed, 11 Jun 2025 08:35:55 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGVV-00000009DbT-0OiR
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:08:26 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so47706311cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629304; x=1750234104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKco8WF5XLIx4+g+zOsrDdvMj/5C2WSueef/n5luzHI=;
        b=B37VP56ThK7LhMLQ4aZ7rC4OfCLOOzwL59PCsVXGygCe8+uzTXsi6yTOOBTHxuEmZn
         yvb+Y1LrOrmR9ilDPe6yyc+6xmvrWR6tydoD8qE2zdb0PIWjn6Xa2vLPHCfsGI2SmdWX
         UG5tCb6og0jHeBazcb96/Z8mF16MnQgZ37o01Usj5LLS/VRd9fi/e7JTP3JbQwOZS6GC
         lcb6ND+jaGymF/sY1oULrbWHgewAaEL3ECun34yZiS+OxRnBNsCEp/P7FHS8m0AeVRA9
         QWjGR6Ro3Jp3MWj3n6Il7GYuiOSC2iU4YY7JCnAq+BjI3EMGeOE6Dpz+2QZdQRgW/dBZ
         TeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629304; x=1750234104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKco8WF5XLIx4+g+zOsrDdvMj/5C2WSueef/n5luzHI=;
        b=p3/linV+iYDJfSfWDgRBWMhf85lcW93mPE9wf5i8ltJvbiOgN4JjwI/RHiUcPAwb9i
         Ct2K26eLKQKj1/yDwqNUsHwUxtNjNcxoJjzs8GXZ0ZXkg4wVsv5yLmC1nwHu2Ufv+mxc
         8Qh2IsmxPTor/hkq/9DuK7Q7jF9wwwFuq283dOukik54AdYETwfBFlmltGWGuantNtwE
         yXN1ODfe22jo5Fi7T7IuOmwVQJMZI3nCW1u+xhZarYgneAt88uRgMV67Bx0x7aw6D02+
         Lpa5Iisl17Ak5OWA6OCyAxBSUQTWsMNaFtwPe1mXvBGZqm7Dg2gI363BOzdoXjXuwqG6
         bnQA==
X-Forwarded-Encrypted: i=1; AJvYcCWels7QtEYk2wJ3bHprKnGDVxF2YFlmOLu3JMw/isd39ckrlh/FSUq3a5VH3Tsi+nZWXfSMhwv6K2j3Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTMbZQ4gR9QloXFe+XyqecP2EnWxH7IhB7F0xfmK4PVhoHGQf2
	GAUpMo822zl5nev69dAThrZe0jVjyCGRna2x1UPtIVKT8rha2+7soWGN
X-Gm-Gg: ASbGncsrPdrtw5JVXky0IUA9Df1vSX22sPvOhAXb3u6QdbuPTdaVJvXX5Q9KoxQRCR/
	fevbgoM6nxhCXIsBB4PyA78kZkW4GO5ttgdjqVUxyAHKJxqEQCPNEm1yUUV1QJAbm0RMKrxoI3k
	QYFbhqUf1xN2g5+FIO2vOK51ldYFvPN0mB//JSV0Eh1O2ojHxl+Odfa48XUdHsGKtoXWsmOSqyX
	UBgNoYJTujRDvDaBEDrOmywJROFwHMJ+t6x5hJS9tyjZEv3eDvGw7W1mZUURCuPpfFwhYqflC4D
	Y3BqkFS2NTrLTGG6JHEvY/nsUaODQ636AG91WA==
X-Google-Smtp-Source: AGHT+IE0wepui9ZWUWrK1RdnFP2P1vv+cUAkbMh57NubxjGl2orNJ+i+g4FXFBHss/bMOX/R1l7e7Q==
X-Received: by 2002:a05:622a:5907:b0:476:87f6:3ce4 with SMTP id d75a77b69052e-4a714c9d74amr33190841cf.39.1749629303992;
        Wed, 11 Jun 2025 01:08:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a611150462sm84318391cf.14.2025.06.11.01.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:08:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC 1/3] dt-bindings: net: Add support for Sophgo CV1800 dwmac
Date: Wed, 11 Jun 2025 16:07:06 +0800
Message-ID: <20250611080709.1182183-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010825_134059_64F99258 
X-CRM114-Status: GOOD (  12.89  )
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

The GMAC IP on CV1800 series SoC is a standard Synopsys
DesignWare MAC (version 3.70a).

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
new file mode 100644
index 000000000000..2821cca26487
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sophgo,cv1800b-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,cv1800b-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
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
+    ethernet@4070000 {
+      compatible = "sophgo,cv1800b-dwmac", "snps,dwmac-3.70a";
+      reg = <0x04070000 0x10000>;
+      clocks = <&clk 35>, <&clk 36>;
+      clock-names = "stmmaceth", "ptp_ref";
+      interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      resets = <&rst 12>;
+      reset-names = "stmmaceth";
+      rx-fifo-depth = <8192>;
+      tx-fifo-depth = <8192>;
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,txpbl = <8>;
+      snps,rxpbl = <8>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+      status = "disabled";
+
+      mdio {
+        compatible = "snps,dwmac-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <1>;
+        queue0 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <1>;
+        queue0 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,rd_osr_lmt = <2>;
+        snps,wr_osr_lmt = <1>;
+      };
+    };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
