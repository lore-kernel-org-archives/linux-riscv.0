Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98ED6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A75660720
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A75660720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D55KHjeJj4vOXqScMqW7k65uaxWWhQwfp2rHe2D8zfQ=; b=OWS5aapFXeubWN
	apGGODIK4dJUvE+QnGZXMCl3YLaWeTGtiVUvl9eeKQwUAT0EROMKndYa/hcQOKrNELylVU6zEFZ04
	WcXqMTXrjvYLpli3QTfNG1i+KJzpBFqvFyZ//71s3u4RUv8ytfG8rCA7qTI/McNngP50vq1B+mEg1
	VFtpQiLVpL2o/SHcap04F50/tRtl5kgALlz5AhcQuxE5Wg605mf6ukFXst7GAqNG0XwxNXtyjuWCR
	BQv0YySX1DIUJGYnHfqYIFbcTEkC1DdKq3q5sIUvNXIyhJCDyq/9hbxpaaLd+PDtGCHUzJruedP7F
	VaJYoW6OhqbDBSVZSAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwOz-002Fzn-4i; Tue, 02 Nov 2021 16:12:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwOJ-002FVU-8y
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:12:06 +0000
Received: by mail-ed1-x529.google.com with SMTP id j21so55058567edt.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/wOP5VTEPevLiR6m3lbRdM5ynLiHKYh2CxfP0wI67s=;
 b=oVlkN2hQuPgvVpYigDq5NucN2UMfOc0JO3vADCz+iB1X7kfPRUJhZmoTeBViuhr0cG
 OFT5+jEaLsX+Dm5ucNFMQ9zA22HwYHtOA61eD1uwjP9TChvkbm3NCiEbbzm811ySl5M4
 pVvPeT6PgJM+UI5AgTjyfs1pzka/ridG7wmNDnEKFCP97wu5/OUn9SEpuv+2XNGylXdX
 Sz2cJu15ILfDD9Z1ag2yzgmK46CfXfaXNLqTokf82Lgsc646toaAR6ffAsZIY7I1deNB
 DcCKJh9JX4iFuv/JoevrJQAlbmLaADTJU0oBpUwD9fVhFJzqbT1kImDI6W4STRwt4P8B
 D4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1/wOP5VTEPevLiR6m3lbRdM5ynLiHKYh2CxfP0wI67s=;
 b=UwxtECGHkQyPeC4DDhgJs6SK9Zb7Zm0pM189keTeO9+mKgTuPPu11tFajNvusMppF1
 AoTatOJb0ngx1nx3mUpVWu+jBjiurIzYyKoLVIvq/0sfX28SFZZaPDVGbfmf/BZU1jMo
 K9ocb3Kmg7XHV2J7z8WM66+2bPter6rBYb+mQ0gmLyEqEA1XiV/4XuLz4Utlv14e6PBM
 TwKmReYJwLwr+GAHej0PoDotRGz3BGEnRXBjrNOMbJ/mMduxK/r92muUCo4XQlQzrogz
 fg4H1XY9JXbwB9WGWYRgr/SF3QWFC6EeJF2qqdSirOlhaz7u7pM+WKGUDBh9tAvfH3bv
 NhfQ==
X-Gm-Message-State: AOAM532M2H9T/fGXi17Q8bZHI4lCCy3Nz7AWi/geltidg9cph29kuroY
 Q45VY+tHq5avs8Bv1r3d+LxQUr/wbQgl+g==
X-Google-Smtp-Source: ABdhPJyeLfVTx4/lAisNYB2sjThu1KfiHo+qlhLMuZKDwyC9NkjsVKLlZgTpsR77jq9SXrtfSSWpFg==
X-Received: by 2002:a17:906:f88d:: with SMTP id
 lg13mr9385024ejb.310.1635869521841; 
 Tue, 02 Nov 2021 09:12:01 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:12:01 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
Date: Tue,  2 Nov 2021 17:11:20 +0100
Message-Id: <20211102161125.1144023-12-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091203_481704_76EA00B9 
X-CRM114-Status: GOOD (  23.90  )
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

Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---

@Linus: I'm really struggling to find a good way to describe how pin
muxing works on the JH7100. As you can see I've now resorted to
ascii-art to try to explain it, but please let me know if it's still
unclear.

 .../pinctrl/starfive,jh7100-pinctrl.yaml      | 307 ++++++++++++++++++
 1 file changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
new file mode 100644
index 000000000000..92963604422f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
@@ -0,0 +1,307 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jh7100-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 Pin Controller Device Tree Bindings
+
+description: |
+  Bindings for the JH7100 RISC-V SoC from StarFive Ltd.
+
+  Out of the SoC's many pins only the ones named PAD_GPIO[0] to PAD_GPIO[63]
+  and PAD_FUNC_SHARE[0] to PAD_FUNC_SHARE[141] can be multiplexed and have
+  configurable bias, drive strength, schmitt trigger etc. The SoC has an
+  interesting 2-layered approach to pin muxing best illustrated by the diagram
+  below.
+
+                          Signal group 0, 1, ... or 6
+                                 ___|___
+                                |       |
+    LCD output -----------------|       |
+    CMOS Camera interface ------|       |--- PAD_GPIO[0]
+    Ethernet PHY interface -----|  MUX  |--- PAD_GPIO[1]
+      ...                       |       |      ...
+                                |       |--- PAD_GPIO[63]
+     -------- GPIO0 ------------|       |
+    |  -------|-- GPIO1 --------|       |--- PAD_FUNC_SHARE[0]
+    | |       |   |             |       |--- PAD_FUNC_SHARE[1]
+    | |       |   |  ...        |       |       ...
+    | |       |   |             |       |--- PAD_FUNC_SHARE[141]
+    | |  -----|---|-- GPIO63 ---|       |
+    | | |     |   |   |          -------
+    UART0     UART1 --
+
+
+  The big MUX in the diagram only has 7 different ways of mapping peripherals
+  on the left to pins on the right. StarFive calls the 7 configurations "signal
+  groups".
+  However some peripherals have their I/O go through the 64 "GPIOs". The
+  diagram only shows UART0 and UART1, but this also includes a number of other
+  UARTs, I2Cs, SPIs, PWMs etc. All these peripherals are connected to all 64
+  GPIOs such that any GPIO can be set up to be controlled by any of the
+  peripherals.
+  Note that signal group 0 doesn't map any of the GPIOs to pins, and only
+  signal group 1 maps the GPIOs to the pins named PAD_GPIO[0] to PAD_GPIO[63].
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+  - Drew Fustini <drew@beagleboard.org>
+
+properties:
+  compatible:
+    const: starfive,jh7100-pinctrl
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: gpio
+      - const: padctl
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+    description: The GPIO parent interrupt.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  starfive,signal-group:
+    description: |
+      Select one of the 7 signal groups. If this property is not set it
+      defaults to the configuration already chosen by the earlier boot stages.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate and drive strength.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pins:
+            description: |
+              The list of pin identifiers that properties in the node apply to.
+              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
+              macros.
+              Either this or "pinmux" has to be specified, but not both.
+            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pins"
+
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the GPIOMUX macro.
+              Either this or "pins" has to be specified, but not both.
+            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pinmux"
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
+            enum: [ 14, 21, 28, 35, 42, 49, 56, 63 ]
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
+            maximum: 7
+
+          starfive,strong-pull-up:
+            description: enable strong pull-up.
+            type: boolean
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive-jh7100.h>
+    #include <dt-bindings/reset/starfive-jh7100.h>
+    #include <dt-bindings/pinctrl/pinctrl-starfive.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl@11910000 {
+            compatible = "starfive,jh7100-pinctrl";
+            reg = <0x0 0x11910000 0x0 0x10000>,
+                  <0x0 0x11858000 0x0 0x1000>;
+            reg-names = "gpio", "padctl";
+            clocks = <&clkgen JH7100_CLK_GPIO_APB>;
+            resets = <&clkgen JH7100_RSTN_GPIO_APB>;
+            interrupts = <32>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            starfive,signal-group = <6>;
+
+            gmac_pins_default: gmac-0 {
+                gtxclk-pins {
+                    pins = <PAD_FUNC_SHARE(115)>;
+                    bias-pull-up;
+                    drive-strength = <35>;
+                    input-enable;
+                    input-schmitt-enable;
+                    slew-rate = <0>;
+                };
+                miitxclk-pins {
+                    pins = <PAD_FUNC_SHARE(116)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-disable;
+                    slew-rate = <0>;
+                };
+                tx-pins {
+                    pins = <PAD_FUNC_SHARE(117)>,
+                           <PAD_FUNC_SHARE(119)>,
+                           <PAD_FUNC_SHARE(120)>,
+                           <PAD_FUNC_SHARE(121)>,
+                           <PAD_FUNC_SHARE(122)>,
+                           <PAD_FUNC_SHARE(123)>,
+                           <PAD_FUNC_SHARE(124)>,
+                           <PAD_FUNC_SHARE(125)>,
+                           <PAD_FUNC_SHARE(126)>;
+                    bias-disable;
+                    drive-strength = <35>;
+                    input-disable;
+                    input-schmitt-disable;
+                    slew-rate = <0>;
+                };
+                rxclk-pins {
+                    pins = <PAD_FUNC_SHARE(127)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-disable;
+                    slew-rate = <6>;
+                };
+                rxer-pins {
+                    pins = <PAD_FUNC_SHARE(129)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-disable;
+                    slew-rate = <0>;
+                };
+                rx-pins {
+                    pins = <PAD_FUNC_SHARE(128)>,
+                           <PAD_FUNC_SHARE(130)>,
+                           <PAD_FUNC_SHARE(131)>,
+                           <PAD_FUNC_SHARE(132)>,
+                           <PAD_FUNC_SHARE(133)>,
+                           <PAD_FUNC_SHARE(134)>,
+                           <PAD_FUNC_SHARE(135)>,
+                           <PAD_FUNC_SHARE(136)>,
+                           <PAD_FUNC_SHARE(137)>,
+                           <PAD_FUNC_SHARE(138)>,
+                           <PAD_FUNC_SHARE(139)>,
+                           <PAD_FUNC_SHARE(140)>,
+                           <PAD_FUNC_SHARE(141)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-enable;
+                    slew-rate = <0>;
+                };
+            };
+
+            i2c0_pins_default: i2c0-0 {
+                i2c-pins {
+                    pinmux = <GPIOMUX(62, GPO_LOW,
+                              GPO_I2C0_PAD_SCK_OEN,
+                              GPI_I2C0_PAD_SCK_IN)>,
+                             <GPIOMUX(61, GPO_LOW,
+                              GPO_I2C0_PAD_SDA_OEN,
+                              GPI_I2C0_PAD_SDA_IN)>;
+                    bias-disable; /* external pull-up */
+                    input-enable;
+                    input-schmitt-enable;
+                };
+            };
+
+            uart3_pins_default: uart3-0 {
+                rx-pins {
+                    pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
+                              GPI_UART3_PAD_SIN)>;
+                    bias-pull-up;
+                    input-enable;
+                    input-schmitt-enable;
+                };
+                tx-pins {
+                    pinmux = <GPIOMUX(14, GPO_UART3_PAD_SOUT,
+                              GPO_ENABLE, GPI_NONE)>;
+                    bias-disable;
+                    input-disable;
+                    input-schmitt-disable;
+                };
+            };
+        };
+
+        gmac {
+            pinctrl-0 = <&gmac_pins_default>;
+            pinctrl-names = "default";
+        };
+
+        i2c0 {
+            pinctrl-0 = <&i2c0_pins_default>;
+            pinctrl-names = "default";
+        };
+
+        uart3 {
+            pinctrl-0 = <&uart3_pins_default>;
+            pinctrl-names = "default";
+        };
+    };
+
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
