Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4A9CCA47B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOwP8as6LYaow9mAWr+wYq2Qhx1uMiNmA+Bcv4Wt7Jc=; b=s2v7XUgxvZ58Pr
	xzh7HoBnzd2DsWWtvclOJJkfuDHBb8cli7BkiPj/nVwO7mZNXlM5kZGKfugtWTwRekEjiZJHfadOS
	lCYjRNZnxrG8BtiTj0BzGNhrZbH1eLslwtraYsR0Q/Pdf/OA54gcZZS4Ol9IKPROuJbT32L3uV/fV
	u5TIQnL/mmR8MNCfTGalMUuQQJnAsEl0+fPaRpXOzWdmiJRTW8It8pbFQutxYzhqgmzA8Gj5I+WOL
	5svyJJ8Dt9zTkhHFz+19Ll9zDqo/19KqiRbzAAP/x2FtNWnY4ue3ZUqGGFtg/LHlFPk9gI7TV+e46
	ZsyMsxlDZLY1gT8P74tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTA-0030Rm-FA; Tue, 05 Jul 2022 21:52:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qT6-0030P0-Ae
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id f2so14015358wrr.6
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3BjWvucdRFvohacwJ3jYd8p0VPrMYvEd2khIu7aHRc=;
        b=AVC32Xgv3rjyXT5pJFSx3LvOc6t7VkeJNrcAYwZ+GUdVf+5/sApO4tvdxLsbFiZdAD
         5AoPLMow5tHJqk3SwzpH/oKNaXNZKvLK8tOYwiGgEmneamdwZTLS/8FuJe2ww1CPpItH
         gULoWBzsUosnwI0pYWhE0+34l6FUDchOZ3gObKcfNn6FIoVHyqexaoOj4e83t+lHpyRa
         itVJseTDOe3v8oUbES0rdY1qjhrWxSFeZG7BcSb8xrAhvcZp0ONvt1Bm/Q2GGgWE3fHg
         uxPTH0lUbDPqpdqCZOcMyCG1jLIeXDTGY8EZa3TQ93s+LVyxMQzMZsXbiNYmvMfxB4rv
         wV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3BjWvucdRFvohacwJ3jYd8p0VPrMYvEd2khIu7aHRc=;
        b=vDVv9iwJC1HZX0mhknmQ6bJ4WGuDgNtpaGMO3Kt4IHCAt9kK1JZ0nKOQ8RyIRJXAts
         1FhQ2qb9rZQihShvG3LA8p9KXR66ohtbhGJIQVXc7PNBUxdDQ/1ySlVZEJNEpgxu+0Z2
         f3zJVBV6eH51We7axPn/UDlaavuikhD6OEQhqZtTgNBtTZJaITE16dijYI7+hi7bajc4
         s4YSpiQfscQypJKLsA9gLFRkhva07dKoBePTlq3f3qJJ3GUi3dFwXcewSHMzbCaD8/QU
         Fmote/hr6OGm1X/aVVhHrFiCceXs+07Vqmkbp/MNe3PzI4+S8govSIdrWBlKKrXxSKcL
         xwkw==
X-Gm-Message-State: AJIora8LJzpWD1iVNqN1Hc8YRW9nQaIZXoq5z4sf9XSi4icHgt4rlCOx
	zLq93iMLQciWfgxXLwTfeuwduQ==
X-Google-Smtp-Source: AGRyM1ucMKMSRmGlh9FqNyhH2728/ALCXILByIUnLxXbuxkj3cZlvPD3T95oxg6qoIA4h+0C8V2AAw==
X-Received: by 2002:adf:ec07:0:b0:21d:669c:6a78 with SMTP id x7-20020adfec07000000b0021d669c6a78mr14716491wrn.401.1657057945251;
        Tue, 05 Jul 2022 14:52:25 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:24 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 01/13] dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
Date: Tue,  5 Jul 2022 22:52:02 +0100
Message-Id: <20220705215213.1802496-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145228_434736_550203F1 
X-CRM114-Status: GOOD (  14.44  )
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

From: Conor Dooley <conor.dooley@microchip.com>

A dt-schema binding for the Ilitek ili9341 was created as
panel/ilitek,ili9341.yaml but the txt binding was ignored in the
process. Move the remaining items in the txt binding to the yaml one &
delete it.

The example in the txt binding has a spi-max-frequency which disagrees
with the yaml replacement (and its own documentation) so change that to
conform with the binding. There are no users in tree of the Adafruit
yx240qv29 to check against.

Link: https://cdn-learn.adafruit.com/assets/assets/000/046/879/original/SPEC-YX240QV29-T_Rev.A__1_.pdf
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/ilitek,ili9341.txt       | 27 -----------
 .../display/panel/ilitek,ili9341.yaml         | 48 +++++++++++++------
 2 files changed, 34 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
deleted file mode 100644
index 169b32e4ee4e..000000000000
--- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Ilitek ILI9341 display panels
-
-This binding is for display panels using an Ilitek ILI9341 controller in SPI
-mode.
-
-Required properties:
-- compatible:	"adafruit,yx240qv29", "ilitek,ili9341"
-- dc-gpios:	D/C pin
-- reset-gpios:	Reset pin
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-- backlight:	phandle of the backlight device attached to the panel
-
-Example:
-	display@0{
-		compatible = "adafruit,yx240qv29", "ilitek,ili9341";
-		reg = <0>;
-		spi-max-frequency = <32000000>;
-		dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
-		rotation = <270>;
-		backlight = <&backlight>;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 6058948a9764..c5571391ca28 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - adafruit,yx240qv29
           # ili9341 240*320 Color on stm32f429-disco board
           - st,sf-tc240t-9370-t
       - const: ilitek,ili9341
@@ -47,31 +48,50 @@ properties:
   vddi-led-supply:
     description: Voltage supply for the LED driver (1.65 .. 3.3 V)
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
   - reg
   - dc-gpios
-  - port
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - st,sf-tc240t-9370-t
+then:
+  required:
+    - port
 
 examples:
   - |+
+    #include <dt-bindings/gpio/gpio.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel: display@0 {
-                 compatible = "st,sf-tc240t-9370-t",
-                              "ilitek,ili9341";
-                 reg = <0>;
-                 spi-3wire;
-                 spi-max-frequency = <10000000>;
-                 dc-gpios = <&gpiod 13 0>;
-                 port {
-                         panel_in: endpoint {
-                           remote-endpoint = <&display_out>;
-                      };
-                 };
-             };
+            compatible = "st,sf-tc240t-9370-t",
+                         "ilitek,ili9341";
+            reg = <0>;
+            spi-3wire;
+            spi-max-frequency = <10000000>;
+            dc-gpios = <&gpiod 13 0>;
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
+                };
+            };
+        };
+        display@1{
+            compatible = "adafruit,yx240qv29", "ilitek,ili9341";
+            reg = <1>;
+            spi-max-frequency = <10000000>;
+            dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+            rotation = <270>;
+            backlight = <&backlight>;
         };
+    };
 ...
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
