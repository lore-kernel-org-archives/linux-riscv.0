Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78FD3C92F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 02:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7T7depLJIncBfRcViCRiiRcMZ6PCm7pcSWGSvqMdto=; b=ntC4UV2gEqjzkE
	W0zpkFy8KJahJTbeVDr1noKhcJT7hpHLIWaUZBLpjl9d/7EYShv2jImvz8Vzugd7stJ8CNliwfkz2
	ADBbSxFFRgw5BzoOmgC+juHiRTtSLmZEn7bYoKFn3A0QN9XdJgEZ+kZd7+dM4NGB4KLdD0uCaX3Mg
	TdGyUOVot96D4cTmPakxpgNi7FDHYYr0PPjxPbRBc8UdCFBDzqLaP9npsENuy8c19ttNsL2LjzRrf
	bonXpBdSJSw1Aqry5N0VHrOKOdkfWhr+N3SBCTavDOD4En4r3dHspXTWh7UXBFfmBGVDeVqTyOtIo
	GfHIQscnTAYKj46DWatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2iKv-00000005stF-21a3;
	Mon, 21 Oct 2024 02:40:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2iHv-00000005sIn-3Ig0
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 02:36:58 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so2493383a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 19:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729478215; x=1730083015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUNFNowz14dkfUGFMLmJpIFRrRBzO1OU5EXyGYyuqF0=;
        b=Fe21lCDpM1bls8zu4PPwlujiao1twwMu8cXvEy+v4BEmYOoR9mIKROwjb5WmxiJx+e
         kuaddKU3HeDXOTLrOBLeIQexw0VBIDNliymGdS0kkh3OJ5S+X+GZ0matiBH93W16FraN
         Qiz1dGF4jHdbch8wfN9GOl1U88g+w5ao/Py/eaNeCtT02zksHnwBwcvfc0x+Tu7Wwn23
         pm4uYKEZ7o4kNIZbwiTROzHkkx++7/CJRa30nzPFkS51DzNi/bcKrfm46RxQNf01xfFS
         vLDLFVs+r0H4M095hHHDq/SZPt9B2wr+ELh5kYIHYUmktuMI6qnBl46SsGGtnghpVuYg
         Idqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729478215; x=1730083015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUNFNowz14dkfUGFMLmJpIFRrRBzO1OU5EXyGYyuqF0=;
        b=GmzCf7866GiepPbP+0VecTpr3zqlnynxk1AmfmzDiz/DLDLfLtgBrFf04B/V/To6lM
         v7t+IKQEMTaagmOG12oSwRxYpo5Czj5w0chUfLDHlW1L1B3d3vP9ET+7BwMuQne427vq
         ZZOpG1dEu3y9iiTivwgfpUnOf00xHA0oHzffqYUnsYjoypeMybec1rcQlicWf0kMD9tW
         WqY4SkFIGWUMYDobCEySJomNgc6z+O/zJ77myaSB85MCcEQ7tqpLqXrLBQ9V7Vus3NmC
         9nYqm6SM3QPQ4hRCoZZpP1SXfXVzlwMt2CTvhlNimNwcvXfNEwSp++gqymEnVJApxV0K
         f/5g==
X-Forwarded-Encrypted: i=1; AJvYcCWAc7HQU2+U+9tThaj62qx8feyJ5U7g9f/z9JauqsCPBpfVQ3N+p8m/bRFjePVdfk5Y8ciHxq3OdpLBhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgKSvnvtmkKbvK3btYqq7a4np+QkXfz91T9IqgbGfIggznG5wr
	HxGnNX1YJx/8HjX9ii6rPv3XmVRQNh3AwCeslvdEwFB7KeHq4/pDn+hZwhOz7LI=
X-Google-Smtp-Source: AGHT+IFNTpbNDFgH8LuAVW9Gkv6jojNSOBsKW5UinaIGSi9hSSIrshAVU6Zb7qkpi/uqMXAvslY7AQ==
X-Received: by 2002:a05:6a20:e617:b0:1cf:3f2a:d1dd with SMTP id adf61e73a8af0-1d92c4dfd14mr14319446637.12.1729478214886;
        Sun, 20 Oct 2024 19:36:54 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad355bebsm2337008a91.7.2024.10.20.19.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 19:36:54 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 20 Oct 2024 19:36:00 -0700
Subject: [PATCH net-next v4 1/3] dt-bindings: net: Add T-HEAD dwmac support
MIME-Version: 1.0
Message-Id: <20241020-th1520-dwmac-v4-1-c77acd33ccef@tenstorrent.com>
References: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
In-Reply-To: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_193655_893043_615D7039 
X-CRM114-Status: GOOD (  15.62  )
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

Add documentation to describe the DesginWare-based GMAC controllers in
the T-HEAD TH1520 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: rename compatible, add apb registers as second reg of gmac node,
       add clocks and interrupts poroperties]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 115 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 117 insertions(+)

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
index 000000000000..cea652ff6255
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -0,0 +1,115 @@
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
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: Peripheral registers interface clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+
+  interrupt-names:
+    items:
+      - const: macirq
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
index a858224b59d5..a16418d68383 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20066,6 +20066,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
