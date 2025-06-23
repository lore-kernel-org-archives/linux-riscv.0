Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E8C7115A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 00:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEs86MIwachcdCcJvbNF3S8mJlrvxe6nURGBjh7tj5I=; b=Iqs215yFOb0L76
	E9y3n7Y4uKsBPqTnkr3Oj9AQP9u6ijVqqw+Z1YBQYffaJTbStjs89NuFcapb/vLH+GLM7ky87ggGN
	sY5w42Kugg2wNUa3/CvtUj1QASkPVDdo29Q51jjeBK8B+OQ8OdYQOGhZJgTjSYUf/21qy9SEeNgkl
	SCTnybmKP81YaLWTyN3mMW5unU03uhlNtAX6NCUIDxPCtGg1EPC0+f/2kdpaKqa03hEOAqB3SWW1b
	WYGkU+q2TnDeNqCCBFdhVWwJ8ENJQE33rGNDtaIGNLECS85ByRmmGWHqO6TztSrNuCY7X601pWqrc
	lxFpEUMUGQFEDN3IaArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5U-00000001M0r-3dqw;
	Mon, 23 Jun 2025 00:31:04 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5S-00000001M02-0I9P
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 00:31:03 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-748fe69a7baso3202382b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 17:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638661; x=1751243461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbYiO19sh3IJdvvUSW/e03MZMQRypRJDEB888I8b3Cc=;
        b=UXcCdBdoTv+Ypcf18CvCiazrgczTynQmn3bUGofmXCfwgpsxYEDswrRhu63fnjHkEb
         snpx66HyOOPbsCEp9bt9K9s3VATIOlli5hKH3C5R7OyWtZQMe7xwC2SKH/w1ZzwH8HXs
         +oGExjZpCoR4uAT/ekh/YDJkeNFp6EVlQ1V7mC0U8KSBV+ojEIsfQloI+QkSAqx9vukX
         4YKvbQHliUofJS/zXcxmbOKD/JSnV2kTuA3AqEYAL5iA23JOM/I0QC83q73w8NM0DL9T
         SPd2aCjNyZRiqm4U+PNggFbpoM2Fayz8RzsMEvYPcNjZ8GGX3QOTUsxTbI8yoRp/BPJv
         mtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638661; x=1751243461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbYiO19sh3IJdvvUSW/e03MZMQRypRJDEB888I8b3Cc=;
        b=E/PoyTOn1bWwS0DtojTZTIkCXAaPO1EbDCCNlFbQfSos6YXbYDKNmbEfucm3Ox0LSt
         SltlgI00EjIe5XCO/b8/gOWFnwQimxyJoVRCjWVC4q0a3pwSkia+IKvV+QMQDg+rmXjv
         oNtd86/i286LzESP307+ghyk3fLKB5pzoA0rtDoripDZbXhAqxnjKzElZdQNKU8MAtKm
         7J8Qsh1UocXDhBENNSu6wPtodpCaGHHfHptvP6m7ZLm5iuGnlK0R1Swt/uezcmqoPpC3
         b0jI6q+nwYhfBCYlleE2pT9+PrSxVeHWl/sjxKL8vZ4XF+9Q6SYCT/8o7rNt2japc4ZM
         /vmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm9V1/6ulJgmAoVwbR9fqsF9sexOEmKZH8Ug7GR9gnM+XGlgNFQET4GJBw+C43hRhf7iu+GbG/TJgZxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxuz9RGdtu1maJDf1w3p8ZjazQzjETOF8q1XqKa8XP80vdyiX8j
	lvYydMIfXFer+zGVOEljTsxJoJOnEKj2J/TsPPYwQzQtIz9O8KIGvUve
X-Gm-Gg: ASbGncsgfmo12DUXin5s232wt3Kb+Rv0qIkMDJghOBMnknEQGtxp4C3a+eMY9hzHKpf
	PXVBjZAt3oZXtAduJBAnePakd/x2ctSa1z2IU/0RyvO1qG/b/ky/FmSARL5j7MAslvnAEOWZ922
	1gH08HCYe7xakZXxJKCrxTXXMkEyvYdU+b5n9IgMc7FB09M+3amHLHVDkFdVBjRvv/dZeLzW+1J
	x34K4CiZbr4rpxdmCSsEXKFLvBOnDmGfVW7E/LxzpnQtQgVstczeODNJb2h0ZSFgVFHFxbNi8qQ
	qozaSzmeHXGAPJ79NfDOs/BBqBFWVFVd4KAeORaNUSvXBXPUQf93BGdZrsJ1gQ==
X-Google-Smtp-Source: AGHT+IFjUa0B87qNht8ZgulbTuJng0m9HcDVwcnodg7C5wpEEen3v8W1bwLiOFMIWmrUqYCVfsCUkg==
X-Received: by 2002:a05:6a00:2e88:b0:746:31d1:f7d0 with SMTP id d2e1a72fcca58-7490d540a23mr15000357b3a.9.1750638661258;
        Sun, 22 Jun 2025 17:31:01 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7490a6492fasm6826040b3a.111.2025.06.22.17.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:31:00 -0700 (PDT)
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next RFC v2 1/4] dt-bindings: net: Add support for Sophgo CV1800 dwmac
Date: Mon, 23 Jun 2025 08:30:43 +0800
Message-ID: <20250623003049.574821-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623003049.574821-1-inochiama@gmail.com>
References: <20250623003049.574821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_173102_109152_3F4526D9 
X-CRM114-Status: GOOD (  13.00  )
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
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
