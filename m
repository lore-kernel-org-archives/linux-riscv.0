Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBD3CDE02B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 18:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRrK+R7lwhuWYB/ZCvHJoN5zRk2jFlhk/t1UK2v3UmQ=; b=K31kGXhmJCVC8P
	DaxUeXnS3lzbr/2AAmxmS2HaVzWKMxJKC+fajaDCMnfoM9uc9b94Qe7cJ5LqMvOVX2WO/1T0I/+ZM
	U489UiWSkLOxLUC28GEKA8BV2anBfYm9qfT20ClmTLK9KRz8U0Y5hiBplfjx8nTVmNUXySO6EY1Fm
	iiysWlHb0mF7dMuMondGcQLIkMn0bGFHKtqYHlExYtbJZwPoLEhNR6W1UYdEr6mjnCHjrcVv+7G1Y
	yUL7d3XBdKuvFLGawe4Fg/Td8tQeUEkBo0zH6CmohmFKrLrDx4PN/MG4dvrr3YeBAguYTR1+sJII+
	LszXUlIUT0w6ldl/DwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stt58-000000096vD-3fw7;
	Thu, 26 Sep 2024 18:19:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stt2J-000000096Ks-2zx5
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 18:16:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2053525bd90so13018525ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727374578; x=1727979378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HADv+qSfkgZ8nk61nX3QcQ1gwTszTm91CMmr80W4IFM=;
        b=dqDgzhyxlY8RgpO2NjEzfCcc9jRyfF9dxVbyJckwg+Ii0RLEpZvuq2dwujc8i6gGDo
         euc1KrsGGhnu3e9XdHVDvmUuZyR/uqqPru5AbxwptDo4orfcA8rPt8fGSamkJicd6O3d
         DjG+g5K8q84edrn1S+T+zuNpZuqY7Y2jcdiXNIo0oHAmjz+dCrIv5qXULQknX4Wu0tEb
         rbQtmIn53/EWt1AV+B7oH7mejV/osCvx4sK7v4iQJFVrQsQD1Ry5CzkNPlvYaEDRIAPX
         6Kdi0v9biT7djBznQgRmsyX6nUE3r/GbKvX4vj2NoWNxERrxDG1M3kLsLIIV7q4pXPOI
         FDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727374578; x=1727979378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HADv+qSfkgZ8nk61nX3QcQ1gwTszTm91CMmr80W4IFM=;
        b=oUcAtwDX1ffyjbztmTKNpglD++i6jPayEdcmGmwgjzvVP0JMkz9bTzTikTcDssEW/m
         39M2Mj+SZgBkc94BLAfqR6gdA9UYXp66AjyVJYnJKPRdD298xrROC7ooRpR5+i+k6Fqn
         VAZklF+f8keMeF84oGjtgTsVXHNoNtHCSj3G/BWpXttXVXAC91b1Vk0jH6IQyQjX/AEU
         fN3SP9meWmnjq2UEwCp4IxjXJ0A+n/2xqKODVC2/GTmE4+8dc51hQ9MABjQIOAVcdKV9
         QbC6YpHiSk4n+u0J2yD8i9O1Nht4+t9KP4MG72KG+Uu1VZ9KRJ+eDcsGiJPYuX96+9v+
         4RWg==
X-Forwarded-Encrypted: i=1; AJvYcCVr1tSsAWVtkotSi/Sq+/UdvmBeibAaWSu0RK9rYzTXx4LAD5mATvif0n1Xnm2zZk+JTsM+DPWMnApPIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjCznF1O08G8Xxlr+0awE+pDBMz+n/IUURqpO1CeB1Gsrm4jVR
	EM32CProbsFHE8p8/WfPiPM3dlueBBqjs7onmziZX/yXSDMw0SfbNx688TQyih0=
X-Google-Smtp-Source: AGHT+IGj65OstZpitcA04pfkL8g5/NbyWX6+B/UQFa6le4tH/WNWTgOmFuHD32LjEcHjtAPKzkH/Qw==
X-Received: by 2002:a17:902:fc47:b0:205:7e3f:9e31 with SMTP id d9443c01a7336-20b37ba6a1emr7187025ad.60.1727374578172;
        Thu, 26 Sep 2024 11:16:18 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d5ef5dsm1454145ad.32.2024.09.26.11.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 11:16:17 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 26 Sep 2024 11:15:50 -0700
Subject: [PATCH v2 1/3] dt-bindings: net: Add T-HEAD dwmac support
MIME-Version: 1.0
Message-Id: <20240926-th1520-dwmac-v2-1-f34f28ad1dc9@tenstorrent.com>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
In-Reply-To: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Drew Fustini <dfustini@tenstorrent.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_111619_906505_40957CDB 
X-CRM114-Status: GOOD (  16.56  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Add documentation to describe T-HEAD dwmac.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: change apb registers from syscon to second reg of gmac node]
[drew: rename compatible, add thead rx/tx internal delay properties]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..474ade185033 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -99,6 +99,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - thead,th1520-gmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
new file mode 100644
index 000000000000..1070e891c025
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 GMAC Ethernet controller
+
+maintainers:
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+description: |
+  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
+  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
+
+  Features include
+    - Compliant with IEEE802.3 Specification
+    - IEEE 1588-2008 standard for precision networked clock synchronization
+    - Supports 10/100/1000Mbps data transfer rate
+    - Supports RGMII/MII interface
+    - Preamble and start of frame data (SFD) insertion in Transmit path
+    - Preamble and SFD deletion in the Receive path
+    - Automatic CRC and pad generation options for receive frames
+    - MDIO master interface for PHY device configuration and management
+
+  The GMAC Registers consists of two parts
+    - APB registers are used to configure clock frequency/clock enable/clock
+      direction/PHY interface type.
+    - AHB registers are use to configure GMAC core (DesignWare Core part).
+      GMAC core register consists of DMA registers and GMAC registers.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-gmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-gmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    items:
+      - description: DesignWare GMAC IP core registers
+      - description: GMAC APB registers
+
+  reg-names:
+    items:
+      - const: dwmac
+      - const: apb
+
+  thead,rx-internal-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      RGMII receive clock delay. The value is used for the delay_ctrl
+      field in GMAC_RXCLK_DELAY_CTRL. Units are not specified.
+
+  thead,tx-internal-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      RGMII transmit clock delay. The value is used for the delay_ctrl
+      field in GMAC_TXCLK_DELAY_CTRL. Units are not specified.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+        reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
+        reg-names = "dwmac", "apb";
+        clocks = <&clk 1>, <&clk 2>;
+        clock-names = "stmmaceth", "pclk";
+        interrupts = <66>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,pbl = <32>;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 3e18aefd1222..aaa24189de43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19940,6 +19940,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,dwmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
