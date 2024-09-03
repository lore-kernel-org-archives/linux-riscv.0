Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0325CD342C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 04:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo+q9ifk8q/nnbunXc5oxQ5NrsfmMsw8OQdRGuYMQlg=; b=LhmnmGbWjvDdqd
	+Ac0Yf169FkHBAP1DjBRiFsh3c83SebRkSJSigq1FsMsUurEKuS8oEJ2G7qlvKaeWsJXMSGLHsQ3+
	Y72TzK5IIe6MU8+exYXmVyCSOdlikiPJNTVYzs/8usWGLi/6hCS0N/7iwUET7/hUxsRDPsgqHZ9IS
	3Um/lwokymFdohgg8fARWiSWcyS84ppNngL9X/ulFWEwh7qTQqNwao0aMFTbkVw9LEhdWJySNJ0vL
	EG5SKVMcfxKFBfu1KwVqzKmKgHO/ar/X0mgSbwaiVEalekEKCWMRvL98pXt1YWKnK9yeXNSA6OxGQ
	4CpKaVMjj1d5vrs9PQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqg-0000000GFhG-1geF;
	Tue, 03 Sep 2024 04:08:58 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqc-0000000GFfA-2aDS
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 04:08:56 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5dfb53d4b13so2022395eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 21:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336533; x=1725941333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQeWC4esiWQu66sp58Ti2PlUMH3QkENQQzReu8XsD5I=;
        b=gwtfpwwnOXy5v8+tuD9r0l53tr2VJD0Y9/tfcMWZlFWbezXk+ng1ZBNHhXtvQxBYpT
         zfMOLczO4lC7HMrzOl9kBlWxZhidCH43Zo7RwHwVQdCmOGT+jTMWs1l6gMYUqe+XZUAU
         lSYi/psytzrvaj/yn9+2lc7BpjUq5WzGbHG/9obYQw6y5GXCE0zzuJE5zrFnErFyMntK
         z01poxPukuvrS8URStI9By5OWQwGDpphlrRAiv76ufXaCHmXFMoh8gg1u1rDZpTyW5AH
         2XwnAEWS2ClisozvoCIdFmV4OjxtfxZPD13YMZTgmTZqh4PDXYR+mgEUQa5ibrPsCZzD
         8XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336533; x=1725941333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQeWC4esiWQu66sp58Ti2PlUMH3QkENQQzReu8XsD5I=;
        b=N1ToSwf55PmcFPB4Edrl/+fhHZEY4h77825bZviZ7l4cBa02rUHTR/Fe8z4iXPz7ub
         LS/ZhziS1jvX0G/efvrWBDFLkC7PIld2DlK1kyzUdNuygRpN4s13mTV3A6mJmg6HxkxE
         7+xhj7HA2BekzuBwVj5EGWAwvRmklxmRCWU8AIA2Gy90ZolGCnKo1vqpzoSFjTpgY5jb
         P4vqAlDtsOpDzGZwxb1+f5ty9oXVjaNwOsmOzV4Ks7fNEaRmuj3VXCHN975bNiIolek/
         DApBrO+8ohzm+H7AkYjLpdiAC/QLQoSOPh/cJrbrCQam322EGGIYjvOeYoJ8XI+Q/230
         zMhg==
X-Gm-Message-State: AOJu0Yx5yQtCiIAj7/zB0OYOooccFdLK0I+RBviI5+ANXP4tzYMgGzKl
	bvjJytRFN+hossJ0XuDj7uMxetwtBfSMjki8kyP2Grr1hH9IZ7gUqoQIeLNLoGY=
X-Google-Smtp-Source: AGHT+IGZsVVofu2/84YfJAfWiuIMKDFVPUHS/Q38VYNegZ3WnElEbZyyB2BraUzn5Hqai839ktDPdA==
X-Received: by 2002:a05:6358:9391:b0:1b5:fb48:e588 with SMTP id e5c5f4694b2df-1b7f1b1b8acmr1121494755d.23.1725336532888;
        Mon, 02 Sep 2024 21:08:52 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:52 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:06:54 -0700
Subject: [PATCH 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
MIME-Version: 1.0
Message-Id: <20240902-th1520-pinctrl-v1-1-639bf83ef50a@tenstorrent.com>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_210854_851409_2403DD70 
X-CRM114-Status: GOOD (  19.63  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[dfustini: use a single compatible for all pin controller instances]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 165 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
new file mode 100644
index 000000000000..429cc0bc1100
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
@@ -0,0 +1,165 @@
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
+  Each pad can be muxed individually to up to 6 different functions. For most
+  pads only a few of those 6 configurations are valid though, and a few pads in
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
+      - thead,th1520-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        additionalProperties: false
+
+        description:
+          A pinctrl node should contain at least one subnode describing one
+          or more pads and their associated pinmux and pinconf settings.
+
+        properties:
+          pins:
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins
+            description: List of pads that properties in the node apply to.
+
+          function:
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/function
+            enum: [ gpio, pwm, uart, ir, i2c, spi, qspi, sdio, audio, i2s,
+                    gmac0, gmac1, dpu0, dpu1, isp, hdmi, bootsel, debug,
+                    clock, jtag, iso7816, efuse, reset ]
+            description: The mux function to select for the given pins.
+
+          bias-disable: true
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: Enable the regular 48kOhm pull-up
+              - enum: [ 2100, 48000 ]
+                description: Enable the strong 2.1kOhm pull-up or regular 48kOhm pull-up
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - const: 44000
+            description: Enable the regular 44kOhm pull-down
+
+          drive-strength:
+            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25 ]
+            description: Drive strength in mA
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
+        required:
+          - pins
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+
+examples:
+  - |
+    padctrl0_apsys: pinctrl@ec007000 {
+        compatible = "thead,th1520-pinctrl";
+        reg = <0xec007000 0x1000>;
+        clocks = <&apb_clk>;
+
+        uart0_pins: uart0-0 {
+            tx-pins {
+                pins = "UART0_TXD";
+                function = "uart";
+                bias-disable;
+                drive-strength = <3>;
+                input-disable;
+                input-schmitt-disable;
+                slew-rate = <0>;
+            };
+
+            rx-pins {
+                pins = "UART0_RXD";
+                function = "uart";
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
+        compatible = "thead,th1520-pinctrl";
+        reg = <0xe7f3c000 0x1000>;
+        clocks = <&apb_clk>;
+
+        i2c5_pins: i2c5-0 {
+            i2c-pins {
+                pins = "QSPI1_CSN0",    /* I2C5_SCL */
+                       "QSPI1_D0_MOSI"; /* I2C5_SDA */
+                function = "i2c";
+                bias-pull-up = <2100>;
+                drive-strength = <7>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 878dcd23b331..a73953c0f080 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19700,6 +19700,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
