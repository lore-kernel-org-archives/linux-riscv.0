Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291ED0E6EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NVLghayt+Kqpdd3MNfljvMduZg7XscX8f4vPBxl+NI=; b=IHcMpjilRWqa5O
	BqKrmMD8Sg+crnwU0o+pcteDuUyO17wGzs3o112gWG5Ukmxoon2vF5hGo/Vsvx0a71NbJbzDE1AMc
	rPZj6gV7d4oDRN8LRnedmEJQ5njIVcyFuvgaDbAOo6mN6zirC9H7kRiryTVYAvwyi70QIeZBDgacB
	T01X9OpEbwqYu5RJmayoIHBfBu9Lr+nIYFwfg8tlNHTncDniXia332hdDTDu3Ib+JCmVhKSA8M6lt
	Gzp3YKFWh1eQP79X8PIOcBeNCmmeBuo/6aS5oPqOHWrtgYAC09tW6eNnnwEaRdrLfcCRao30Ie+BC
	7zujK+MyttSQA2G4H74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pql-00000006vGX-1b6T;
	Mon, 21 Oct 2024 10:41:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pmO-00000006uUl-1Ulq;
	Mon, 21 Oct 2024 10:36:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cdbe608b3so34641135ad.1;
        Mon, 21 Oct 2024 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507011; x=1730111811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROalFAeuv2FT5XJcCDsa2eyjiagS1IAfhK+ybSBBNOk=;
        b=FjjyGw0oZdTC1EfxciLl8HB6w1iFiegonUvD/kdiUTVY4d//NbEB/hqlAPDCcN2EHC
         dy3XWDJCgNsmRtn5YuZ9wZo1P7aMuun2pJREK7uuhFmjdhPeROn4x3B1wtS0StHMSsXx
         3RwNQcFXFT2sA5lNujlotvdz9eKk431hrJxLh1c8kVctIEMfhy57azZByxQp5pNmtz4u
         iuX3Bde4FyVUfy3iqhvFVPmYCMH0V4g/Zu9RLgCjDACWZLhacZjqFhA9QrB3pLMkunj2
         1mq1pFHgL/O+OHP34may2cxcIJ1aV1jpbprqsLzXIAHRQSDjihedpwD8x1D93GmpndX1
         G0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507011; x=1730111811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROalFAeuv2FT5XJcCDsa2eyjiagS1IAfhK+ybSBBNOk=;
        b=YfZFf3Digv3z/MwXyeCuZp0GqiT2rwX1jBUNqBgre9Cal5X2b4+gJZ4LhbLldJ/QOM
         wtPficlMXziiyvh6reaqUddWF6gPAJ+rric5V1XkFkhpfGOeSoft60wfVKzUaBM78qMy
         9r+6rMGLbbHakg+xgGMeuacYTmvHYccv5z1YnzxcoFJfQjQAlcnyY8Z9Cs1cwxxq1wvh
         Jj60tUsk0XLHZHIUG/4dyV4uIn2PJS+GuRg6wl2uOnHLn8sdQBliYTa+Q0o/g7PwK2Qw
         LD+cavFxE2061Qwt9AWmkX7wbUSZKmPEUnZuoZO1LkZDl5gaCTfZAgimBSjKCSLfXuzQ
         wAkg==
X-Forwarded-Encrypted: i=1; AJvYcCVJhe2hO26YCTieyFLc4r686qDMIcdglYoKgCWMDJxlUPKpDVIz9mx8mmHyu/LsRDqht9+ka6LqOEPYHEXmlIje@lists.infradead.org, AJvYcCXct8MhyXSzRoVTuhcweGRsEMoXcaOujp6HRjAESLeySjYdQd7Xie24sEDvp6ayCPPHgLtgXylJMYKK84c=@lists.infradead.org
X-Gm-Message-State: AOJu0YycJ/xIMCmZBnEeajhTP+dvjLvnlmgA9f5zVh6IrvkFLejfcFVh
	hQaZ7X+ad+WVrVBIDVqpAydLlutPmvpfDqRsdkB/xCeib9a7yFfG
X-Google-Smtp-Source: AGHT+IGtGQdZs96OgFnH+jxQO02blnd9Mr30IOhQfnSRFPAMbUhlzzNhum28G7bu+yZXf1ru9cnQAw==
X-Received: by 2002:a17:902:e846:b0:20c:a8cf:fa25 with SMTP id d9443c01a7336-20e5a9339efmr140267755ad.46.1729507011181;
        Mon, 21 Oct 2024 03:36:51 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0c0e5asm22850335ad.167.2024.10.21.03.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:36:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Mon, 21 Oct 2024 18:36:15 +0800
Message-ID: <20241021103617.653386-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021103617.653386-1-inochiama@gmail.com>
References: <20241021103617.653386-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_033652_423694_1AF69B4D 
X-CRM114-Status: GOOD (  16.17  )
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

The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 3c4007cb65f8..69f6bb36970b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -99,6 +99,7 @@ properties:
         - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
 
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
new file mode 100644
index 000000000000..93c41550b0b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sophgo,sg2044-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2044-dwmac
+      - const: snps,dwmac-5.30a
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
+  sophgo,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that configures phy
+          - description: offset of phy mode register
+          - description: length of the phy mode register
+    description:
+      A phandle to syscon with two arguments that configure phy mode.
+      The argument one is the offset of phy mode register, the
+      argument two is the length of phy mode register.
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2044-dwmac
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+        interrupt-names:
+          minItems: 1
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          const: stmmaceth
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@30006000 {
+      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
+      reg = <0x30006000 0x4000>;
+      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupt-parent = <&intc>;
+      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      resets = <&rst 30>;
+      reset-names = "stmmaceth";
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,tso;
+      snps,txpbl = <32>;
+      snps,rxpbl = <32>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+      status = "disabled";
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <8>;
+        snps,rx-sched-wsp;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <8>;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,wr_osr_lmt = <1>;
+        snps,rd_osr_lmt = <2>;
+      };
+    };
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
