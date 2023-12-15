Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20616C46CC6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AufKvvjDle37g4JMcR5pducS09pQbbYBOg105IFM67Q=; b=RrrIGEiHAjLc47
	ihYwZANJ/WiabMfVruseOr2rcqWfV9/QaNGxafrRaYl1iaMkzc+tkbSFg22f0Mm+nwEBCowoEqoBG
	f3qONcwIDWEHW7t99kpfv8qzTVCzlqxJkWQO8maUheJ/W0JrQKQc0PtV2/UynU+j+BtERzFWlO+2r
	9R0tN2pstPvDLlWEEy9Lbhogpyrg4hQI4Xko/Gz4/MaKFd7AIiOD9cr8UxO+pvrEkV33tzksHNhWW
	knNMjL72kxE2QI6AkgJIFOoSQT8wzhGcW45M1Jn8lY7W1xey92C9/RRiinCB4RGv/lQTuIBaZLPSh
	eJgwpFKQ7ryn+uAmmGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LU-003aES-19;
	Fri, 15 Dec 2023 14:39:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LO-003aBh-1N
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 14:39:16 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B47833F2C3
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651151;
	bh=DP/Du3U6CUcJgvW/RY0Kd++wZRLCP6RkWeO4awpzGL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=mtSOTMnEZbZm2HdUhiG+KoQq4gaTT2JNNoO2b0WzKGTAh4azqudL9jhbnfUTgPhze
	 HWGkCmbLcVYRgeOt57x5sADSImhr0UBEGeloiE+lD7amgAgxc4IyKGB8xSDhS9NJJF
	 HM2KcANzHE5vo3XK/2vghB6VC9X6vuFtpPQNCtjdECYhMsoGLAD3BNpFwdE5tI15nV
	 pjdh4OW2K0qkh8JRaqrjDmAbJks7Ys/JgFTF4w1sMgWTT3bBtFa+wVbUk/B6Y+ZUfq
	 dv6x7GRM2psMTqPlNWLMI/oMNJHZXM1Nnp2Rye47cMQBFsJLxaU6zcqt6SBQSQ3hc8
	 +t1MdYGNhen4w==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a00dd93a5f9so45206366b.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 06:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651151; x=1703255951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP/Du3U6CUcJgvW/RY0Kd++wZRLCP6RkWeO4awpzGL4=;
        b=ZA3rn4V0W0R0XVGzrLg9qTsPvtQ4es344METo39wQZjnZz7uQUlIuep42LSjTdLmSG
         YyHBC9JsnoQKQNqDUfA8ScDHV4gSXpJn4JeAbZ/l/G1//w5WwLxfSrFuFFNXkvLjB0HO
         C6W41XJWqF3s4cNntyueOnpacoYFzJMln981pa+RXC67SS/oTe2yMcpz4AKydGuoxGuC
         ZfFVRzMYiyVRUUpFredE5QYkw33GMdgEkBBkLGHnEHucaYARht/L9dctkFP5R75+MzLo
         aE274d4iddMWWUcUFxxoEcmGMckaehVaiRARkW7U0kO9LO+I3/UnnxLGj3EsNMweaPVM
         wO4Q==
X-Gm-Message-State: AOJu0YyR8N3b+oMpZ4wb91qsvQiACVwoq+vlY9yl4oeFo3h7c7mghufN
	fEa/NVXgtE7ReeAx3AOyx15DZKvs+hQIBWErFbEDbOSycdJHUfbFzg0Q5FJiPSa7du4ExyqudVa
	rZ4n0LWrKfAzT0Bzx0vX8dM4Q8o06hj/HpHxSA9VRSeBFZA==
X-Received: by 2002:a17:906:11cb:b0:a1f:69bb:1172 with SMTP id o11-20020a17090611cb00b00a1f69bb1172mr3074861eja.24.1702651151345;
        Fri, 15 Dec 2023 06:39:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTffL/doR/ETAy/wrSMpH3RUmFY43A+OIfIwmHqAuJ/qR9YE82r4WDCo8NkupJsSz0cvddfw==
X-Received: by 2002:a17:906:11cb:b0:a1f:69bb:1172 with SMTP id o11-20020a17090611cb00b00a1f69bb1172mr3074850eja.24.1702651151022;
        Fri, 15 Dec 2023 06:39:11 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:09 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
Date: Fri, 15 Dec 2023 15:38:59 +0100
Message-Id: <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_063914_628938_DDBBEA07 
X-CRM114-Status: GOOD (  19.94  )
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

Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../pinctrl/thead,th1520-pinctrl.yaml         | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
new file mode 100644
index 000000000000..1b1b446cd498
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 SoC pin controller
+
+maintainers:
+  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
+
+description: |
+  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
+
+  The TH1520 has 3 groups of pads each controlled from different memory ranges.
+  Confusingly the memory ranges are named
+    PADCTRL_AOSYS  -> PAD Group 1
+    PADCTRL1_APSYS -> PAD Group 2
+    PADCTRL0_APSYS -> PAD Group 3
+
+  Each pad can be muxed individually to up to 5 different functions. For most
+  pads only a few of those 5 configurations are valid though, and a few pads in
+  group 1 does not support muxing at all.
+
+  Pinconf is fairly regular except for a few pads in group 1 that either can't
+  be configured or has some special functions. The rest have configurable drive
+  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
+  addition to a special strong pull up.
+
+  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
+  are then meant to be used by the audio co-processor. Each such pad can then
+  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
+  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
+  also configured in different registers. All of this is done from a different
+  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
+
+properties:
+  compatible:
+    enum:
+      - thead,th1520-group1-pinctrl
+      - thead,th1520-group2-pinctrl
+      - thead,th1520-group3-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    patternProperties:
+      '-pins$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        description:
+          A pinctrl node should contain at least one subnode describing one
+          or more pads and their associated pinmux and pinconf settings.
+
+        properties:
+          pins:
+            $ref: /schemas/types.yaml#/definitions/string-array
+            description: List of pads that properties in the node apply to.
+
+          function:
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ "0", "1", "2", "3", "4", "5" ]
+            description: The mux function to select for the given pins.
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25 ]
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            maximum: 1
+
+          thead,strong-pull-up:
+            oneOf:
+              - type: boolean
+              - $ref: /schemas/types.yaml#/definitions/uint32
+                enum: [ 0, 2100 ]
+            description: Enable or disable strong 2.1kOhm pull-up.
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    padctrl0_apsys: pinctrl@ec007000 {
+        compatible = "thead,th1520-group3-pinctrl";
+        reg = <0xec007000 0x1000>;
+
+        uart0_pins: uart0-0 {
+            tx-pins {
+                pins = "UART0_TXD";
+                function = "0";
+                bias-disable;
+                drive-strength = <3>;
+                input-disable;
+                input-schmitt-disable;
+                slew-rate = <0>;
+            };
+
+            rx-pins {
+                pins = "UART0_RXD";
+                function = "0";
+                bias-disable;
+                drive-strength = <1>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+            };
+        };
+    };
+
+    padctrl1_apsys: pinctrl@e7f3c000 {
+        compatible = "thead,th1520-group2-pinctrl";
+        reg = <0xe7f3c000 0x1000>;
+
+        i2c5_pins: i2c5-0 {
+            i2c-pins {
+                pins = "QSPI1_CSN0",    /* I2C5_SCL */
+                       "QSPI1_D0_MOSI"; /* I2C5_SDA */
+                function = "2";
+                bias-disable;
+                drive-strength = <7>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+                thead,strong-pull-up;
+            };
+        };
+    };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
