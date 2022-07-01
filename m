Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOwP8as6LYaow9mAWr+wYq2Qhx1uMiNmA+Bcv4Wt7Jc=; b=Bqg5LOTX3FEcP1
	e3kecqrdmxOmidQGK+eFH/ku38gp4CMfqTXbxcYhs7TgUwQEmarayBbDK0xMBUwI+P7EjughhWng7
	g6yywIRADBJz3gQuvhSI2nxGesG7ydv9b9QDmI5rWaXjKJqK8NLSzmuy6qmY8znhwJ5x8WJvlVx28
	bVYG1BLeplDAWfXgl+3ceGk4d8As5xddn3WocVctIUe5TYIdFxc38S5Xtg+/x0yWXhLmrCfGn88L8
	G16VZfrRZqNIPUWUblK8BZ5ywonoDosnSedIQSGg6VmWNd11Hz5XgNfYYxbSelqVzGW3xK6MMafG0
	crxrwrvHCgtkbwahi3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MF2-006X9r-1E; Fri, 01 Jul 2022 19:23:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MEy-006X7P-Cd
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 19:23:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 20CD8B831A7;
	Fri,  1 Jul 2022 19:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B5AC341CF;
	Fri,  1 Jul 2022 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656703421;
	bh=1yg6g6Dt75IP1Wz+MvEhKMC/hFgjUrx+vobCiTAxcA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGEFwfazLXWdnjF7RfZu70c+iyAMNhheupFJDlre0rMUFX7dgNHtIyrKzW0qbgjrP
	 JD4dj8j8Jr9h1lyw7bXiA7krq0lPFTJybbSiz00+BHkPGLU7LH4effDGs3223Rq29k
	 9vP8iw1sy2jXyx9bdjH+5ym1oQ9gKiNMvnYJjkJJrE3HsihQOWKscB6lftTFkMkK4f
	 seaPjeUJMiO5EVvE+HjLNATOJ7kwwOhr37S6dd3DlyghozH0wBRd6eNUJumyA/1qow
	 iAJ6zxAOMlbJflV/t+AAKihjgWPjg8tkvPz9vJkFAFuw6LCDXdD/1j5tP68epptPtr
	 mssqwzdKe+niQ==
From: Conor Dooley <conor@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 01/14] dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
Date: Fri,  1 Jul 2022 20:22:47 +0100
Message-Id: <20220701192300.2293643-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_122344_757041_B0E5E7FD 
X-CRM114-Status: GOOD (  15.78  )
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
