Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652C6C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 12:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22b4/NqNFO75je2TTIWiuVBnP5uO98fEXSM16QsFSJo=; b=one5JDezu/6Zmp
	WNO54u2CPEd5GLdv6eB+UUh+JLsIMPChM2RDowFUoVs7LF0ozG/UvovL0z95uvtM8rj41e2pg5vej
	C02ufGi0S0a/LpKzzf55F8KY+hBjd3w2aqwAFZcP8pegJZ6bC184JgiCKg98F9qrJnINi9ZVMuqBi
	/AGUaq1ff7P2AQVJDHHWZ+UY/YR0xOhRoodwkH3Uvu8LAtKFnUd60DgbTI6Yb8CBCCRSfqHjSG9Rw
	zOJBeL7yhE+HtWnfvG7Rr/G7pFcshkxytPm88lGB+b74e/QsVZLRNaTVXuvCPXcEs3lf8JdfrjHgw
	qY6vdtSQrA1U1vLJ5zdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA897-0043vx-11;
	Mon, 04 Dec 2023 12:33:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA890-0043cf-0E
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 12:33:56 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 44EDC24E240;
	Mon,  4 Dec 2023 20:33:17 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:17 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:16 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Keith Zhao <keith.zhao@starfivetech.com>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <william.qiu@starfivetech.com>,
	<xingyu.wu@starfivetech.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <p.zabel@pengutronix.de>,
	<shengyang.chen@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<changhuang.liang@starfivetech.com>, <maarten.lankhorst@linux.intel.com>,
	<suijingfeng@loongson.cn>
Subject: [v3 1/6] dt-bindings: display: Add yamls for JH7110 display system
Date: Mon, 4 Dec 2023 20:33:10 +0800
Message-ID: <20231204123315.28456-2-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204123315.28456-1-keith.zhao@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_043350_562220_8A935710 
X-CRM114-Status: GOOD (  19.89  )
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

StarFive SoCs JH7110 display system:
dc controller, hdmi controller,
encoder, vout syscon.

add the path of yaml file in MAINTAINERS

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 .../starfive/starfive,display-subsystem.yaml  | 104 ++++++++++++++++
 .../starfive/starfive,dsi-encoder.yaml        |  92 ++++++++++++++
 .../starfive/starfive,jh7110-dc8200.yaml      | 113 ++++++++++++++++++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |  82 +++++++++++++
 .../soc/starfive/starfive,jh7110-syscon.yaml  |   1 +
 MAINTAINERS                                   |   7 ++
 6 files changed, 399 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
new file mode 100644
index 000000000000..d5ebdba3fb36
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,display-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starfive JH7110 Soc Display SubSystem
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+  - ShengYang Chen <shengyang.chen@starfivetech.com>
+
+description:
+  This is the bindings documentation for the JH7110 Soc Display Subsystem that
+  includes front-end video data capture, display controller and display
+  interface. such as HDMI and MIPI.
+
+  JH7110 display pipeline have several components as below description,
+  multi display controllers and corresponding physical interfaces.
+  For different display scenarios, pipe0 and pipe1 maybe binding to different
+  encoder. for example,
+
+  pipe0 binding to HDMI for primary display,
+  pipe1 binding to DSI for external display.
+
+          +------------------------------+
+          |                              |
+          |                              |
+  +----+  |   +-------------------+      |   +-------+   +------+   +------+
+  |    +----->+  dc controller 0  +--->----->+HDMICtl| ->+ PHY  +-->+PANEL0+
+  |AXI |  |   +-------------------+      |   +-------+   +------+   +------+
+  |    |  |                              |
+  |    |  |                              |
+  |    |  |                              |
+  |    |  |                              |
+  |APB |  |   +-------------------+         +---------+    +------+  +-------+
+  |    +----->+  dc controller 1  +--->---->+ dsiTx   +--->+DPHY  +->+ PANEL1+
+  |    |  |   +-------------------+         +---------+    +------+  +-------+
+  +----+  |                              |
+          +------------------------------+
+
+
+properties:
+  compatible:
+    const: starfive,display-subsystem
+
+  clocks:
+    items:
+      - description: Clock for display system noc bus.
+      - description: Core clock for display controller.
+      - description: Clock for axi bus to access ddr.
+      - description: Clock for ahb bus to R/W the phy regs.
+
+  clock-names:
+    items:
+      - const: noc_bus
+      - const: dc_core
+      - const: axi_core
+      - const: ahb
+
+  resets:
+    items:
+      - description: Reset for axi bus.
+      - description: Reset for ahb bus.
+      - description: Core reset of display controller.
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
+
+  ports:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+    description:
+      Should contain a list of phandles pointing to display interface port
+      of dc-controller devices.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    display-subsystem {
+        compatible = "starfive,display-subsystem";
+        ports = <&dc_out>;
+
+        clocks = <&syscrg 60>,
+               <&voutcrg 4>,
+               <&voutcrg 5>,
+               <&voutcrg 6>;
+        clock-names = "noc_bus", "dc_core", "axi_core", "ahb";
+        resets = <&voutcrg 0>, <&voutcrg 1>, <&voutcrg 2>;
+        reset-names = "axi", "ahb", "core";
+    };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
new file mode 100644
index 000000000000..2cc0ad8e65ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,dsi-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: starfive jh7110 soc Encoder
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+description:
+  Device-Tree bindings for simple encoder.
+  Simple encoder driver only has basic functionality.
+  the hardware of dc8200 has 2 output interface, use
+  syscon to select which one to be used.
+
+properties:
+  compatible:
+    const: starfive,dsi-encoder
+
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that select crtc output.
+          - description: Offset of crtc selection
+          - description: Shift of crtc selection
+    description:
+      A phandle to syscon with two arguments that configure select output.
+      The argument one is the offset of crtc selection, the
+      argument two is the shift of crtc selection.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          The first port should be the input coming from the associated dc channel.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          The second port should be the output coming from the associated bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+        dssctrl: dssctrl@295b0000 {
+            compatible = "starfive,jh7110-vout-syscon", "syscon";
+            reg = <0x295b0000 0x90>;
+        };
+
+        dsi_encoder: dsi_encoder {
+            compatible = "starfive,dsi-encoder";
+            starfive,syscon = <&dssctrl 0x8 0x12>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                /* input */
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+                    dsi_input0:endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&dc_out_dpi1>;
+                    };
+                };
+                /* output */
+                port@1 {
+                    reg = <1>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    dsi_out:endpoint {
+                        remote-endpoint = <&mipi_in>;
+                    };
+                };
+            };
+        };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
new file mode 100644
index 000000000000..0b083effec02
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc8200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive display controller
+
+description:
+  The StarFive SoC uses the display controller based on Verisilicon IP
+  to transfer the image data from a video memory buffer to an external
+  LCD interface.
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-dc8200
+
+  reg:
+    minItems: 1
+    items:
+      - description:
+          host interface
+      - description:
+          display physical base address and length.
+
+  interrupts:
+    items:
+      - description: The interrupt will be generated when DC finish one frame
+
+  clocks:
+    items:
+      - description: Pixel clock for display channel 0.
+      - description: Pixel clock for display channel 1.
+      - description: Pixel clock from hdmi.
+      - description: Pixel clock for soc .
+  clock-names:
+    items:
+      - const: channel0
+      - const: channel1
+      - const: hdmi_tx
+      - const: dc_parent
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          channel 0 output
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          channel 1 output
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dc8200: lcd-controller@29400000 {
+        compatible = "starfive,jh7110-dc8200";
+        reg = <0x29400000 0x100>, <0x29400800 0x2000>;
+        interrupts = <95>;
+        clocks = <&voutcrg 7>,
+               <&voutcrg 8>,
+               <&voutcrg 9>,
+               <&voutcrg 10>;
+        clock-names = "channel0", "channel1","hdmi_tx", "dc_parent";
+
+        crtc_out: ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            dc_out0: port@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dc_out_dpi0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&hdmi_in_dc>;
+                };
+
+            };
+
+            dc_out1: port@1 {
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dc_out_dpi1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&dsi_input0>;
+                };
+
+            };
+          };
+    };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
new file mode 100644
index 000000000000..3640d97ab789
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starfive JH7110 HDMI controller
+
+description:
+  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innosilicon IP
+  to generate HDMI signal from its input and transmit the signal to the screen.
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+properties:
+  compatible:
+    const: "starfive,jh7110-inno-hdmi"
+
+  reg:
+    minItems: 1
+
+  interrupts:
+    items:
+      - description: The HDMI hot plug detection interrupt.
+
+  clocks:
+    items:
+      - description: System clock of HDMI module.
+      - description: Mclk clock of HDMI audio.
+      - description: Bclk clock of HDMI audio.
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: mclk
+      - const: bclk
+
+  resets:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Should contain a remote endpoint phandle of display controller device.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - '#sound-dai-cells'
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi: hdmi@29590000 {
+        compatible = "starfive,jh7110-inno-hdmi";
+        reg = <0x29590000 0x4000>;
+        interrupts = <99>;
+        clocks = <&voutcrg 17>,
+               <&voutcrg 15>,
+               <&voutcrg 16>;
+        clock-names = "sysclk", "mclk","bclk";
+        resets = <&voutcrg 9>;
+        #sound-dai-cells = <0>;
+        hdmi_in: port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            hdmi_in_dc: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&dc_out_hdmi>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe..cf9b657d0e8a 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index 7b151710e8c5..7caaadb83f3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6881,6 +6881,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
 F:	drivers/gpu/drm/mcde/
 
+DRM DRIVERS FOR STARFIVE
+M:	Keith Zhao <keith.zhao@starfivetech.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/starfive/
+
 DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
