Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43171C8303B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 01:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPKrUHIC84HUTFDSH+y0wnEEWpBgwF2fWPv10lLLEg8=; b=J0Mx2GG+eZZ3pB
	F+9Njw41Ve2spuOe4YdqVxLZYA+EgMdHm/Qc2+JOM4EBoo12tA5nPUqRLYbvqynp0UIvoSPQ1LWeb
	QI9K9zmvKaksDExloQgbsDACckSaUlb4q0djXhFYyaAnla+jL/3FbGuKd2Dz/qZQU0vER9QdZg3Zl
	/h+BkHK/2bVdVK7Xb/1mgJh9RQcYUko0ykMGI4rDkaIqM9YVyw0Oqi4sIYuPxahykGZXfO2s29K1t
	eJZnsq2kHyi9u6QsE29NDYxNt+tUATVQdqa4d0NE+W9pn4nfNZNixNgzofl9QEyrhQFZIKEgrgfj+
	GOSywoiz7CxheABA2R3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdE-00000003o2i-445q;
	Tue, 01 Jul 2025 01:17:56 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdB-00000003o1r-3Wvg
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 01:17:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so1703234a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 18:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332673; x=1751937473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6V/oR/DnwI2Qi+5VQkNfiNRfkRvGXnx3kp/m9SpAb0=;
        b=bhiz2OIBBOnzlyh46K1xccj6TTMC3GhOzTvGrYqbXmocltaObsTk2GUasIvrZf9Ggd
         PGTPx/1NnObBgve+k44ALUucDYXOLERlWwt5qQlm5Id0qhy7PGSNURY7QOyrPTnGNM8y
         qA7jiwvLeJCd146kiPSWClWvTjjrz9azstXJalvrvbbejI7S4PsYWiAExNDb9peXgNWN
         dCik35IktkmKcnDHl+SZa83aeWeyQDxYXv92yeOzOgWxf7f7xA/iU4ZVDFCrE2aR7xgg
         LxCmkZ/aL87tGRgMLofL3e3EWbVnrgkCT3LvW31n6uZVMZy2iHk3trB8kZfv1VfJy2d9
         d4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332673; x=1751937473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6V/oR/DnwI2Qi+5VQkNfiNRfkRvGXnx3kp/m9SpAb0=;
        b=qQM0utsSeh/4HtxybT3yrPdwTJbPHKE4Ur+SWQtH20c559zOiV8aY/LMKzZyH/+gXI
         9AXiZnxsYyTGRglmbkbUPcklbh34+DO1z9QFsw2Kw6X1gO5LMfzm1nehI1AqmappMtlX
         k2fmwISEiSw2kyZ8vUhHHeAYMHsuY3mKWrCGuTlKS/7yxkLZ8gkqDx1zSFRLb7BHeu7p
         Hw3umIQts706Z9RJpch3o54877DgN84VlC5uejZRiOwUA2Hr1nlMhimLWBNEhzi9UXGz
         JsWqSb24WoiBhX/M+pmYAghMklKAR9gAtjcYACnvEkPulXRTUVnQlHgezABl92Nlzv0v
         90KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbTdfnCNpv4VcPUvXR24dpTOz50RfQtZb7vCbf+rNiRTq9YVBO+k3Sy9SP1AHYDavYnKN4TbS+sJkSpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv3TIzMczYwbWG3iPAReXxX5+mGOnjDO47PUixK0ZngBcN2KhV
	4jNvHv3XkzSj3Q9rxlq0oc0EFDGy9Usv+AuXPMZiy8w6CecUYXTa5t0z
X-Gm-Gg: ASbGncvR8vlkEepwiNoQ/IhqrJjUm9xYt3tQm4TDklkAaUem0cdLX9bvmxCWey218aL
	WXdzUw8AWUuVy1FCSR3tmdBIvPBczfcMh5/wPreelC6NfFRT/i0/ppR2EGpz2klmR6DPXlE/mJR
	tWrhJkJj5rHZ4v7RAJ+ytuP11e2r2wfWXOkD5tbEuGgoUHTvp9C6anziJ2pLIL0P3KgyWszeEZv
	7lXcz+3RuNT3JAaDMsfGtpvQZEJGN9ZNOuvHfeo9Rlv/KLC5EGn48Vki2napCuWDHJ9Xvy0esZA
	W5ebX+JLdeJStqAq/QAtnLxm4piLBP23xA6wuamZdTcFSRllvvyPaOeDxwyTsg==
X-Google-Smtp-Source: AGHT+IEFk/FnRYvs6Y6xEEcbP+1Lq6A9vyPI9waISIZsADUyiuWGqUmeYCfcJmprh6OASfWb+Olujw==
X-Received: by 2002:a17:90a:e703:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-318c93101afmr23958419a91.33.1751332672895;
        Mon, 30 Jun 2025 18:17:52 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e1af8sm91067735ad.41.2025.06.30.18.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:52 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next RFC v4 1/4] dt-bindings: net: Add support for Sophgo CV1800 dwmac
Date: Tue,  1 Jul 2025 09:17:26 +0800
Message-ID: <20250701011730.136002-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
References: <20250701011730.136002-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_181753_887878_4946C500 
X-CRM114-Status: GOOD (  13.19  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
new file mode 100644
index 000000000000..8abd2cf06e2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B DWMAC glue layer
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
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
