Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15F2C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1EFRauAs6OmZTnW0NQagHJaKGxDZrP8yCt+Jk5K0NEE=; b=VKb8TJOLvxQZV4
	+oRNYX+KeA7qqCTgH4bnKg/hLTD79w/BcMIRDUM5UwdyA+iLVZTjlPCkTFGWBjyksjyuvjCAFAL71
	nnXKXvPewFYhjw37PjrvlypYK00TXpuThjpbncmKss0j/tR3MsJxX7PuxU1NwpqBU0TnoAngN0gow
	hcHpjCKxy9QGOVIOVCzYBMO1MHaCahQH505QyA4w73nXD43Y5jR3nBoIj/eGplKnuD13Wh92Jeyr8
	l3/pe4wgqIcqjVYe9jX9Sg09OpOj+9r7znq0FmibjPQPfI9w2EeAv07jytsxFfTTaPkcS6v7t6v1c
	aR6yyYydxbmanUBIuNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhXq-00000003CZH-2iTc;
	Mon, 24 Mar 2025 13:08:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhJ6-000000036Yw-2G7v
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 12:53:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43935d1321aso5470775e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820811; x=1743425611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kN/OpfBAAZEiIoWKLqJAcN4TLH3/hS8jGoptF5162sA=;
        b=LEq6bkiUF5kQatRaNdnU6DCpxxZJ0LJTA7mG15i7ItFJWtCnWOpPFbYI+JGt6MTyje
         YEj05UPW8O0z2bfiyUJ+Ex3+NK6RyD+Yza0qrNT7GW7L7JyGxYIWJ2nJYnSQnL2HvTPe
         q917D7NYCAVaIR2jEUyuc604JnCNCx3BFYjEnDS1tOe0GipEVabTHFkiKuZ1hm2/cvWg
         s4QjWJoooHwSjrV2o57DWsfWshwdpufi9IqhOwhWyBplHfr+Gqq1LU4t2Dr6k2S/GQn4
         6cC9EUZpGhjg5hFDBRqnM/gd7456ONID/4CIcnTTzgBqYaL372TsYDnEyUKzfFQ04CMl
         PiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820811; x=1743425611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kN/OpfBAAZEiIoWKLqJAcN4TLH3/hS8jGoptF5162sA=;
        b=R2cnTmMbdL0j1tMZIK8m0fgWWNtqjcXIut+YMlVSzzgASnZgtZy4l+Lt0Gpee8Mbtl
         WXX1TYzyY6KxonGqb1k40A3/88NH4VV6b/JciTEdB/x2fToz+wR5Qy5yNFnqrHh1kV6Q
         bjprrQAShb6IVDS7GjauIZScDlLdRSVojl0/UAsql6XNsz/n2768Hp1z52P9z4OhXw/p
         VnMf1UsufPALrdMZUwENGU7E7Fe9bO9kMxWh6H6iJ7JCQRVttoBhF7iv+k52Ys1ZR50z
         +HpgaBTqrQJMsvz65ZitUZ74QXi3JwZUTQ719HDuBGZwmBfhBYChgmzDpBEubSVzyEMm
         aO2w==
X-Forwarded-Encrypted: i=1; AJvYcCW8mR17tFhdfo2ZYpYW6vB1ru2BctIHuE6rIKH1r67DtOCbC7QY85SM1cY4QCEfsks4kPBmlMhnLATiTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx12HGc4PL+kle/hM2t6hTSbqjd2ZvKW+l29o5F76EYC6gcczh
	V6s8JC2/sWowgGaxobsY1/jkq1q/NK2INWMPaeuoGoT4mBjRC/AKCdf2rCDqusM=
X-Gm-Gg: ASbGncs4Rehe4+ucClFmfvSRRlzO66an+L8N+Z8GTrF/xu3ZTkZ8o4Rt/VUGZ+kaxpN
	1xmjPTUTXGTXzC2YRvecRXXcyMN19W8vbH6QL7yrOsbqtLHfnhkZY6cw3eGi9cOzCFAIWyiibgW
	YZwE+boyj4sYWEg3o5WZU2E636gHIuwcTVeP7Mb1rbZhVvZmuEqvLVqBEmbFpwwa2dtUn8rGYnE
	oNxtZtnjKCT7rH4uV9s1h+lYng9scAzdXlIfdmh4ijBlittuhkKKOVkuyMcl1i+PWbQgzllH/mt
	R0smv3AEHNER75Qh5/M0yid7DSfFA/xJFQzys0YL34pb/V9Nwop9U8dcSgYy1ePGaxgW
X-Google-Smtp-Source: AGHT+IFGl5UH7JEkweKaiQScp+fP058Ehf+t6oBnFmBfdv/F300EXT1IjZTgd+srP2QLSOk9FBTuGg==
X-Received: by 2002:a05:600c:35ca:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-43d50a3b4c2mr48017095e9.4.1742820810970;
        Mon, 24 Mar 2025 05:53:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdeb79sm171039565e9.25.2025.03.24.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:53:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:53:26 +0100
Message-ID: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055332_709705_A40EB931 
X-CRM114-Status: GOOD (  11.65  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
unused labels.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 16 ++---
 .../bindings/gpio/fairchild,74hc595.yaml      | 20 +++---
 .../devicetree/bindings/gpio/gpio-mxs.yaml    | 70 +++++++++----------
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 24 +++----
 .../bindings/gpio/realtek,otto-gpio.yaml      |  8 +--
 .../bindings/gpio/renesas,em-gio.yaml         | 20 +++---
 .../bindings/gpio/renesas,rcar-gpio.yaml      | 24 +++----
 .../devicetree/bindings/gpio/sifive,gpio.yaml |  6 +-
 .../bindings/gpio/toshiba,gpio-visconti.yaml  | 24 +++----
 .../bindings/gpio/xlnx,gpio-xilinx.yaml       | 48 ++++++-------
 10 files changed, 130 insertions(+), 130 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
index 3dd70933ed8e..d810043b56b6 100644
--- a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
@@ -69,13 +69,13 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     gpio@fffff400 {
-            compatible = "atmel,at91rm9200-gpio";
-            reg = <0xfffff400 0x200>;
-            interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
-            #gpio-cells = <2>;
-            gpio-controller;
-            interrupt-controller;
-            #interrupt-cells = <2>;
-            clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+        compatible = "atmel,at91rm9200-gpio";
+        reg = <0xfffff400 0x200>;
+        interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 0e5c22929bde..ab35bcf98101 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -71,15 +71,15 @@ unevaluatedProperties: false
 examples:
   - |
     spi {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            gpio5: gpio5@0 {
-                    compatible = "fairchild,74hc595";
-                    reg = <0>;
-                    gpio-controller;
-                    #gpio-cells = <2>;
-                    registers-number = <4>;
-                    spi-max-frequency = <100000>;
-            };
+        gpio5@0 {
+            compatible = "fairchild,74hc595";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            registers-number = <4>;
+            spi-max-frequency = <100000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index 8ff54369d16c..b58e08c8ecd8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -84,52 +84,52 @@ examples:
         reg = <0x80018000 0x2000>;
 
         gpio@0 {
-                compatible = "fsl,imx28-gpio";
-                reg = <0>;
-                interrupts = <127>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <0>;
+            interrupts = <127>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@1 {
-                compatible = "fsl,imx28-gpio";
-                reg = <1>;
-                interrupts = <126>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <1>;
+            interrupts = <126>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@2 {
-                compatible = "fsl,imx28-gpio";
-                reg = <2>;
-                interrupts = <125>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <2>;
+            interrupts = <125>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@3 {
-                compatible = "fsl,imx28-gpio";
-                reg = <3>;
-                interrupts = <124>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <3>;
+            interrupts = <124>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@4 {
-                compatible = "fsl,imx28-gpio";
-                reg = <4>;
-                interrupts = <123>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <4>;
+            interrupts = <123>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
     };
diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
index 8bca574bb66d..5a6ecaa7b44b 100644
--- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
+++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
@@ -128,17 +128,17 @@ additionalProperties: false
 examples:
   - |
     i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            pcf8575: gpio@20 {
-                    compatible = "nxp,pcf8575";
-                    reg = <0x20>;
-                    interrupt-parent = <&irqpin2>;
-                    interrupts = <3 0>;
-                    gpio-controller;
-                    #gpio-cells = <2>;
-                    interrupt-controller;
-                    #interrupt-cells = <2>;
-            };
+        gpio@20 {
+            compatible = "nxp,pcf8575";
+            reg = <0x20>;
+            interrupt-parent = <&irqpin2>;
+            interrupts = <3 0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
index 39fd959c45d2..728099c65824 100644
--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -81,7 +81,7 @@ dependencies:
 
 examples:
   - |
-      gpio@3500 {
+    gpio@3500 {
         compatible = "realtek,rtl8380-gpio", "realtek,otto-gpio";
         reg = <0x3500 0x1c>;
         gpio-controller;
@@ -91,9 +91,9 @@ examples:
         #interrupt-cells = <2>;
         interrupt-parent = <&rtlintc>;
         interrupts = <23>;
-      };
+    };
   - |
-      gpio@3300 {
+    gpio@3300 {
         compatible = "realtek,rtl9300-gpio", "realtek,otto-gpio";
         reg = <0x3300 0x1c>, <0x3338 0x8>;
         gpio-controller;
@@ -103,6 +103,6 @@ examples:
         #interrupt-cells = <2>;
         interrupt-parent = <&rtlintc>;
         interrupts = <13>;
-      };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
index 8bdef812c87c..49fb8f613ead 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
@@ -57,14 +57,14 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     gpio0: gpio@e0050000 {
-            compatible = "renesas,em-gio";
-            reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
-            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-ranges = <&pfc 0 0 32>;
-            ngpios = <32>;
-            interrupt-controller;
-            #interrupt-cells = <2>;
+        compatible = "renesas,em-gio";
+        reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
+        interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pfc 0 0 32>;
+        ngpios = <32>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
     };
diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index cc7a950a6030..d32e103a64aa 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -138,16 +138,16 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a77470-sysc.h>
     gpio3: gpio@e6053000 {
-            compatible = "renesas,gpio-r8a77470", "renesas,rcar-gen2-gpio";
-            reg = <0xe6053000 0x50>;
-            interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 909>;
-            power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
-            resets = <&cpg 909>;
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-ranges = <&pfc 0 96 30>;
-            gpio-reserved-ranges = <17 10>;
-            interrupt-controller;
-            #interrupt-cells = <2>;
+        compatible = "renesas,gpio-r8a77470", "renesas,rcar-gen2-gpio";
+        reg = <0xe6053000 0x50>;
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 909>;
+        power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+        resets = <&cpg 909>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pfc 0 96 30>;
+        gpio-reserved-ranges = <17 10>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
      };
diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index fc095646adea..4bdc201b719e 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -76,8 +76,8 @@ additionalProperties: false
 
 examples:
   - |
-      #include <dt-bindings/clock/sifive-fu540-prci.h>
-      gpio@10060000 {
+    #include <dt-bindings/clock/sifive-fu540-prci.h>
+    gpio@10060000 {
         compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
         interrupt-parent = <&plic>;
         interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
@@ -88,6 +88,6 @@ examples:
         #gpio-cells = <2>;
         interrupt-controller;
         #interrupt-cells = <2>;
-      };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
index b085450b527f..712063417bc8 100644
--- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
+++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
@@ -48,22 +48,22 @@ additionalProperties: false
 
 examples:
   - |
-      #include <dt-bindings/interrupt-controller/irq.h>
-      #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-      soc {
+    soc {
         #address-cells = <2>;
         #size-cells = <2>;
 
         gpio: gpio@28020000 {
-          compatible = "toshiba,gpio-tmpv7708";
-          reg = <0 0x28020000 0 0x1000>;
-          #gpio-cells = <0x2>;
-          gpio-ranges = <&pmux 0 0 32>;
-          gpio-controller;
-          interrupt-controller;
-          #interrupt-cells = <2>;
-          interrupt-parent = <&gic>;
+            compatible = "toshiba,gpio-tmpv7708";
+            reg = <0 0x28020000 0 0x1000>;
+            #gpio-cells = <0x2>;
+            gpio-ranges = <&pmux 0 0 32>;
+            gpio-controller;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&gic>;
         };
-      };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
index d3d8a2e143ed..8fbf12ca067e 100644
--- a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
+++ b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
@@ -126,29 +126,29 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        gpio@a0020000 {
-            compatible = "xlnx,xps-gpio-1.00.a";
-            reg = <0xa0020000 0x10000>;
-            #gpio-cells = <2>;
-            #interrupt-cells = <0x2>;
-            clocks = <&zynqmp_clk 71>;
-            gpio-controller;
-            interrupt-controller;
-            interrupt-names = "ip2intc_irpt";
-            interrupt-parent = <&gic>;
-            interrupts = <0 89 4>;
-            xlnx,all-inputs = <0x0>;
-            xlnx,all-inputs-2 = <0x0>;
-            xlnx,all-outputs = <0x0>;
-            xlnx,all-outputs-2 = <0x0>;
-            xlnx,dout-default = <0x0>;
-            xlnx,dout-default-2 = <0x0>;
-            xlnx,gpio-width = <0x20>;
-            xlnx,gpio2-width = <0x20>;
-            xlnx,interrupt-present = <0x1>;
-            xlnx,is-dual = <0x1>;
-            xlnx,tri-default = <0xFFFFFFFF>;
-            xlnx,tri-default-2 = <0xFFFFFFFF>;
-        };
+    gpio@a0020000 {
+        compatible = "xlnx,xps-gpio-1.00.a";
+        reg = <0xa0020000 0x10000>;
+        #gpio-cells = <2>;
+        #interrupt-cells = <0x2>;
+        clocks = <&zynqmp_clk 71>;
+        gpio-controller;
+        interrupt-controller;
+        interrupt-names = "ip2intc_irpt";
+        interrupt-parent = <&gic>;
+        interrupts = <0 89 4>;
+        xlnx,all-inputs = <0x0>;
+        xlnx,all-inputs-2 = <0x0>;
+        xlnx,all-outputs = <0x0>;
+        xlnx,all-outputs-2 = <0x0>;
+        xlnx,dout-default = <0x0>;
+        xlnx,dout-default-2 = <0x0>;
+        xlnx,gpio-width = <0x20>;
+        xlnx,gpio2-width = <0x20>;
+        xlnx,interrupt-present = <0x1>;
+        xlnx,is-dual = <0x1>;
+        xlnx,tri-default = <0xFFFFFFFF>;
+        xlnx,tri-default-2 = <0xFFFFFFFF>;
+    };
 
 ...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
