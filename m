Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA23C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QCpEI6VXbLCeSzIfD8p8wCSvN8U7Q3dEesf9/pQRzk=; b=CB2OS1MsXQwj/o
	PRP6Q7B68L8rSRtI/ofYsuADpKD57NtOsU+DWRviDMg3toMlQsXmcLp+tsrWCQRVyHHm6Ku4DHwKS
	qgeobRPtKYreRwbhK/JTCoDmiFlqf/AHAolIXc8INYnli/GY6XgryhhtQ6QYBKSYPSrb1XsUiwiKj
	cS00yatp1YxTnEwGmtCgy29FiLnjnQYZEz0mbvGGky6+mx34SVHOYQp32RmYmiZWWLb/mYdJdyFeZ
	Pqv4rLfMmWjQ16lkuNilIwCW2b9gKE4kC6cRGBXkz0nJB58UNaKZ3KLf0ZsJe70c9XvpYWz1T5/oN
	xWDHr5B9ns3pNOkSa7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFYh-002u7Y-KD; Tue, 24 Jan 2023 09:25:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTQ-002rPV-8S
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:20:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id g10so10916771wmo.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ewopPFbg8lqGUnYqrIszF3Y9URN/YZNP6/Pco8hxa4=;
        b=nVAyNq7IlPgNvvVVRS4p/0qgwBnQczGH8HVrJSQ7NfxO92fzYUnhoI1GzFgrtgzV+V
         ZtTIHRF+d55RWOsXyvKFnya8EuQSagaPgG6Kx+8WD5f9KYOZ+C//4ivU0z43NApCuXeu
         GGS87XEazvbYzV8+de9Q0sOoYxJ1D1MWwVaFiO8bsgJs39U0+JH67MHCQL8uj3daoUyL
         ysv1qbeEkC82k+Kv50725n9wmm+PIm0+rRYXeNSXT0P5iEA2TBwn84Kcc9fbGGgj7iix
         25fnnWMt+CkvVfz+wRcX+fOF/TLiGDVQZlvm4z5ORC15/YwOqdH6Qt5w4tRCXzBQ5mUZ
         KAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ewopPFbg8lqGUnYqrIszF3Y9URN/YZNP6/Pco8hxa4=;
        b=dJxrLQQ3rFjGssF2Kj+0zKy1DRS7L+nBchJ5EDh2+tGDFKD2nCvEyJ2viV/U1+4tr6
         9LRgPsDhqnTW51llFrZR7GBSsyQXwtL6hkp+kXx3j9wpnJoSOJ2n2z0rPDC8hsqpm+id
         B2h++t/7ByUCNM3VuN04KWdOyRJqlTSFfeOrfGJHhKt+OELoKp0+QAQYBkpeR5Dd+SHH
         hWMA3OzFQ1TH0dhMvbbblY4OXx+7Kz9GVCkAiR1c6HkPBd/giZ88EHCBt2u1+Zmrxaom
         bnsdG8s7W4DEqa9/BNbtLFQFJf2uT0gyIqjn0/x+KTptE4xvb/NX3tn3q1czvlls6EI7
         FVJA==
X-Gm-Message-State: AFqh2kpofYMWQcGC02d1EZOBjZu5K8/XPGNZAU3/XOZnTDuuv+3p2tj0
	JaVZC/j/JbAHcEM30dWyAWkXZg==
X-Google-Smtp-Source: AMrXdXtHFdcqIZjtMTuVw/LpM136oty57IzZ7DREQ3Ar2E2pC7pPdCH/Dp/vKzCKoYwubiXGz2w4Zw==
X-Received: by 2002:a05:600c:5390:b0:3d9:a145:4d1a with SMTP id hg16-20020a05600c539000b003d9a1454d1amr24023366wmb.34.1674552011719;
        Tue, 24 Jan 2023 01:20:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:20:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 12/12] dt-bindings: serial: example cleanup
Date: Tue, 24 Jan 2023 10:19:16 +0100
Message-Id: <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_012012_414349_1FD5C72A 
X-CRM114-Status: GOOD (  11.78  )
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

Adjust example DTS indentation to match recommended style of 4-spaces
and use lower-case hex for address in reg.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/8250_omap.yaml | 18 ++++++-------
 .../bindings/serial/amlogic,meson-uart.yaml   | 10 +++----
 .../devicetree/bindings/serial/cdns,uart.yaml | 10 +++----
 .../bindings/serial/renesas,em-uart.yaml      | 10 +++----
 .../bindings/serial/renesas,hscif.yaml        | 26 +++++++++----------
 .../bindings/serial/renesas,sci.yaml          | 24 ++++++++---------
 .../bindings/serial/renesas,scif.yaml         | 24 ++++++++---------
 .../bindings/serial/renesas,scifa.yaml        | 22 ++++++++--------
 .../bindings/serial/renesas,scifb.yaml        | 12 ++++-----
 .../devicetree/bindings/serial/serial.yaml    | 18 ++++++-------
 .../bindings/serial/sifive-serial.yaml        |  6 ++---
 .../bindings/serial/xlnx,opb-uartlite.yaml    |  4 +--
 12 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 7db8e5477b03..eb3488d8f9ee 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -104,12 +104,12 @@ else:
 
 examples:
   - |
-          serial@49042000 {
-            compatible = "ti,omap3-uart";
-            reg = <0x49042000 0x400>;
-            interrupts = <80>;
-            dmas = <&sdma 81 &sdma 82>;
-            dma-names = "tx", "rx";
-            ti,hwmods = "uart4";
-            clock-frequency = <48000000>;
-          };
+    serial@49042000 {
+        compatible = "ti,omap3-uart";
+        reg = <0x49042000 0x400>;
+        interrupts = <80>;
+        dmas = <&sdma 81 &sdma 82>;
+        dma-names = "tx", "rx";
+        ti,hwmods = "uart4";
+        clock-frequency = <48000000>;
+    };
diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 44cb3cf22bfb..3cbdde85ed71 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -77,9 +77,9 @@ unevaluatedProperties: false
 examples:
   - |
     serial@84c0 {
-          compatible = "amlogic,meson-gx-uart";
-          reg = <0x84c0 0x14>;
-          interrupts = <26>;
-          clocks = <&xtal>, <&pclk>, <&xtal>;
-          clock-names = "xtal", "pclk", "baud";
+        compatible = "amlogic,meson-gx-uart";
+        reg = <0x84c0 0x14>;
+        interrupts = <26>;
+        clocks = <&xtal>, <&pclk>, <&xtal>;
+        clock-names = "xtal", "pclk", "baud";
     };
diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 38925b79cb38..a8b323d7bf94 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -69,9 +69,9 @@ unevaluatedProperties: false
 examples:
   - |
     uart0: serial@e0000000 {
-      compatible = "xlnx,xuartps", "cdns,uart-r1p8";
-      clocks = <&clkc 23>, <&clkc 40>;
-      clock-names = "uart_clk", "pclk";
-      reg = <0xE0000000 0x1000>;
-      interrupts = <0 27 4>;
+        compatible = "xlnx,xuartps", "cdns,uart-r1p8";
+        clocks = <&clkc 23>, <&clkc 40>;
+        clock-names = "uart_clk", "pclk";
+        reg = <0xe0000000 0x1000>;
+        interrupts = <0 27 4>;
     };
diff --git a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
index b25aca733b72..12d0fa34f9f9 100644
--- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
@@ -66,9 +66,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     uart0: serial@e1020000 {
-            compatible = "renesas,em-uart";
-            reg = <0xe1020000 0x38>;
-            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&usia_u0_sclk>;
-            clock-names = "sclk";
+        compatible = "renesas,em-uart";
+        reg = <0xe1020000 0x38>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&usia_u0_sclk>;
+        clock-names = "sclk";
     };
diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
index 1957b9d782e8..afedb6edfc34 100644
--- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -131,20 +131,20 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a7795-sysc.h>
     aliases {
-            serial1 = &hscif1;
+        serial1 = &hscif1;
     };
 
     hscif1: serial@e6550000 {
-            compatible = "renesas,hscif-r8a7795", "renesas,rcar-gen3-hscif",
-                         "renesas,hscif";
-            reg = <0xe6550000 96>;
-            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 519>, <&cpg CPG_CORE R8A7795_CLK_S3D1>,
-                     <&scif_clk>;
-            clock-names = "fck", "brg_int", "scif_clk";
-            dmas = <&dmac1 0x33>, <&dmac1 0x32>, <&dmac2 0x33>, <&dmac2 0x32>;
-            dma-names = "tx", "rx", "tx", "rx";
-            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-            resets = <&cpg 519>;
-            uart-has-rtscts;
+        compatible = "renesas,hscif-r8a7795", "renesas,rcar-gen3-hscif",
+                     "renesas,hscif";
+        reg = <0xe6550000 96>;
+        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 519>, <&cpg CPG_CORE R8A7795_CLK_S3D1>,
+                 <&scif_clk>;
+        clock-names = "fck", "brg_int", "scif_clk";
+        dmas = <&dmac1 0x33>, <&dmac1 0x32>, <&dmac2 0x33>, <&dmac2 0x32>;
+        dma-names = "tx", "rx", "tx", "rx";
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 519>;
+        uart-has-rtscts;
     };
diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
index bf7708a7a2c0..dc445b327e0b 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
@@ -91,19 +91,19 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     aliases {
-            serial0 = &sci0;
+        serial0 = &sci0;
     };
 
     sci0: serial@1004d000 {
-            compatible = "renesas,r9a07g044-sci", "renesas,sci";
-            reg = <0x1004d000 0x400>;
-            interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "eri", "rxi", "txi", "tei";
-            clocks = <&cpg CPG_MOD R9A07G044_SCI0_CLKP>;
-            clock-names = "fck";
-            power-domains = <&cpg>;
-            resets = <&cpg R9A07G044_SCI0_RST>;
+        compatible = "renesas,r9a07g044-sci", "renesas,sci";
+        reg = <0x1004d000 0x400>;
+        interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "eri", "rxi", "txi", "tei";
+        clocks = <&cpg CPG_MOD R9A07G044_SCI0_CLKP>;
+        clock-names = "fck";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A07G044_SCI0_RST>;
     };
diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index f81f2d67a1ed..1989bd67d04e 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -180,19 +180,19 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a7791-sysc.h>
     aliases {
-            serial0 = &scif0;
+        serial0 = &scif0;
     };
 
     scif0: serial@e6e60000 {
-            compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
-                         "renesas,scif";
-            reg = <0xe6e60000 64>;
-            interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 721>, <&cpg CPG_CORE R8A7791_CLK_ZS>,
-                     <&scif_clk>;
-            clock-names = "fck", "brg_int", "scif_clk";
-            dmas = <&dmac0 0x29>, <&dmac0 0x2a>, <&dmac1 0x29>, <&dmac1 0x2a>;
-            dma-names = "tx", "rx", "tx", "rx";
-            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-            resets = <&cpg 721>;
+        compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
+                     "renesas,scif";
+        reg = <0xe6e60000 64>;
+        interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 721>, <&cpg CPG_CORE R8A7791_CLK_ZS>,
+                 <&scif_clk>;
+        clock-names = "fck", "brg_int", "scif_clk";
+        dmas = <&dmac0 0x29>, <&dmac0 0x2a>, <&dmac1 0x29>, <&dmac1 0x2a>;
+        dma-names = "tx", "rx", "tx", "rx";
+        power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+        resets = <&cpg 721>;
     };
diff --git a/Documentation/devicetree/bindings/serial/renesas,scifa.yaml b/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
index 3c67d3202e1b..4c3b5e7270da 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
@@ -95,18 +95,18 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a7790-sysc.h>
     aliases {
-            serial0 = &scifa0;
+        serial0 = &scifa0;
     };
 
     scifa0: serial@e6c40000 {
-            compatible = "renesas,scifa-r8a7790", "renesas,rcar-gen2-scifa",
-                         "renesas,scifa";
-            reg = <0xe6c40000 64>;
-            interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 204>;
-            clock-names = "fck";
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 204>;
-            dmas = <&dmac0 0x21>, <&dmac0 0x22>, <&dmac1 0x21>, <&dmac1 0x22>;
-            dma-names = "tx", "rx", "tx", "rx";
+        compatible = "renesas,scifa-r8a7790", "renesas,rcar-gen2-scifa",
+                     "renesas,scifa";
+        reg = <0xe6c40000 64>;
+        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 204>;
+        clock-names = "fck";
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 204>;
+        dmas = <&dmac0 0x21>, <&dmac0 0x22>, <&dmac1 0x21>, <&dmac1 0x22>;
+        dma-names = "tx", "rx", "tx", "rx";
     };
diff --git a/Documentation/devicetree/bindings/serial/renesas,scifb.yaml b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
index d5571c7a4424..2f7cbbb48960 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
@@ -94,10 +94,10 @@ examples:
     #include <dt-bindings/clock/r8a7740-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     scifb: serial@e6c30000 {
-            compatible = "renesas,scifb-r8a7740", "renesas,scifb";
-            reg = <0xe6c30000 0x100>;
-            interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&mstp2_clks R8A7740_CLK_SCIFB>;
-            clock-names = "fck";
-            power-domains = <&pd_a3sp>;
+        compatible = "renesas,scifb-r8a7740", "renesas,scifb";
+        reg = <0xe6c30000 0x100>;
+        interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp2_clks R8A7740_CLK_SCIFB>;
+        clock-names = "fck";
+        power-domains = <&pd_a3sp>;
     };
diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 11e822bf09e2..e05ad3ac2abc 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -141,13 +141,13 @@ additionalProperties: true
 examples:
   - |
     serial@1234 {
-            compatible = "ns16550a";
-            reg = <0x1234 0x20>;
-            interrupts = <1>;
-
-            bluetooth {
-                    compatible = "brcm,bcm4330-bt";
-                    interrupt-parent = <&gpio>;
-                    interrupts = <10>;
-            };
+        compatible = "ns16550a";
+        reg = <0x1234 0x20>;
+        interrupts = <1>;
+
+        bluetooth {
+            compatible = "brcm,bcm4330-bt";
+            interrupt-parent = <&gpio>;
+            interrupts = <10>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index b0a8871e3641..b0df1cac4968 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -53,13 +53,13 @@ unevaluatedProperties: false
 
 examples:
   - |
-      #include <dt-bindings/clock/sifive-fu540-prci.h>
-      serial@10010000 {
+    #include <dt-bindings/clock/sifive-fu540-prci.h>
+    serial@10010000 {
         compatible = "sifive,fu540-c000-uart", "sifive,uart0";
         interrupt-parent = <&plic0>;
         interrupts = <80>;
         reg = <0x10010000 0x1000>;
         clocks = <&prci FU540_PRCI_CLK_TLCLK>;
-      };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
index 6f65e9a81c29..08dcb275d8e2 100644
--- a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
@@ -76,7 +76,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-      serial@800c0000 {
+    serial@800c0000 {
         compatible = "xlnx,xps-uartlite-1.00.a";
         reg = <0x800c0000 0x10000>;
         interrupts = <0x0 0x6e 0x1>;
@@ -84,5 +84,5 @@ examples:
         current-speed = <115200>;
         xlnx,data-bits = <8>;
         xlnx,use-parity = <0>;
-      };
+    };
 ...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
