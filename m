Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41591C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrCEpy2zvJirJETqQbRWCa51wbyy7Yh6PVQF9XlJYE0=; b=OBp80Kw5UG9kIR
	qpCW9T7sCcVRL2YT9rIdVEjDtUSWFnBpDXWlktBuU28/gWaS6pQqTmR1ACEkTC4WQVWRH0LxbRfwt
	ZpY7yYB8sHTbUXFOZnvBFvT0tys0BTCUAX4sdNSro4jbHRHu74e6RRv/V1yAAg19Ss2WwkOOWBjW+
	cX/RNaI95OEhegQDPDXVIiK9ptf4bWkMBQ9PrP5YgGP05yP7lsn1tJOJUiRZF5CBx2YAKwRnXN0fo
	eCutEoRAK9xlVj5n5pji8GsLlKiMmDYdlmprhF1+Yg/IbOBezdwBUI3LxdXdyXheiODfTusRDMPtv
	KEGXrgi91GICy76YpYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpAM-003yZy-KU; Wed, 08 Mar 2023 08:28:54 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpAI-003yLX-Th; Wed, 08 Mar 2023 08:28:52 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 01B1024E33E;
	Wed,  8 Mar 2023 16:28:04 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 16:28:04 +0800
Received: from ubuntu.localdomain (183.27.97.46) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 16:28:02 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 1/3] dt-bindings: phy: Add StarFive JH7110 USB dt-binding
Date: Wed, 8 Mar 2023 16:27:58 +0800
Message-ID: <20230308082800.3008-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308082800.3008-1-minda.chen@starfivetech.com>
References: <20230308082800.3008-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_002851_293073_1D77B60E 
X-CRM114-Status: GOOD (  14.38  )
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

Add StarFive JH7110 SoC USB 3.0 phy dt-binding.
USB controller is cadence USB 3.0 IP.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../bindings/phy/starfive,jh7110-usb-phy.yaml | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
new file mode 100644
index 000000000000..daa88d065deb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive USB 2.0 and 3.0 PHY
+
+maintainers:
+  - Minda Chen<minda.chen@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jh7110-usb
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: usb3
+      - const: usb2
+
+  clocks:
+    items:
+      - description: usb 125m clock
+      - description: app 125m clock
+      - description: lpm clock
+      - description: stb clock
+      - description: apb clock
+      - description: axi clock
+      - description: utmi apb clock
+
+  clock-names:
+    items:
+      - const: usb_125m
+      - const: usb0_app_125
+      - const: usb0_lpm
+      - const: usb0_stb
+      - const: usb0_apb
+      - const: usb0_axi
+      - const: usb0_utmi_apb
+
+  resets:
+    items:
+      - description: USB0_PWRUP reset
+      - description: USB0_APB reset
+      - description: USB0_AXI reset
+      - description: USB0_UTMI_APB reset
+
+  starfive,sys-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to System Register Controller sys_syscon node.
+        - description: offset of SYS_SYSCONSAIF__SYSCFG register for USB.
+    description:
+      The phandle to System Register Controller syscon node and the offset
+      of SYS_SYSCONSAIF__SYSCFG register for USB.
+
+  starfive,stg-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to System Register Controller stg_syscon node.
+        - description: register0 offset of STG_SYSCONSAIF__SYSCFG register for USB.
+        - description: register1 offset of STG_SYSCONSAIF__SYSCFG register for USB.
+        - description: register2 offset of STG_SYSCONSAIF__SYSCFG register for USB.
+        - description: register3 offset of STG_SYSCONSAIF__SYSCFG register for USB.
+    description:
+      The phandle to System Register Controller syscon node and the offset
+      of STG_SYSCONSAIF__SYSCFG register for USB. Total 4 regsisters offset
+      for USB.
+
+  dr_mode:
+    description: PHY mode.
+    enum:
+      - host
+      - peripheral
+      - otg
+
+  "#address-cells":
+    maximum: 2
+
+  "#size-cells":
+    maximum: 2
+
+  ranges: true
+
+  starfive,usb2-only:
+    type: boolean
+    description: Set USB using usb 2.0 phy. Supprt USB 2.0 only
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - starfive,sys-syscon
+  - starfive,stg-syscon
+  - dr_mode
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    type: object
+    description: |
+      usbphy node should have '1' usb controller subnode.
+      It could be Cadence USB3 DRD controller.
+      Cadence USB3 should follow the bindings specified in
+      Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    usbphy@10200000 {
+      compatible = "starfive,jh7110-usb";
+      reg = <0x10210000 0x1000>,
+            <0x10200000 0x1000>;
+      reg-names = "usb3", "usb2";
+      clocks = <&syscrg 95>,
+               <&stgcrg 6>,
+               <&stgcrg 4>,
+               <&stgcrg 5>,
+               <&stgcrg 1>,
+               <&stgcrg 3>,
+               <&stgcrg 2>;
+      clock-names = "usb_125m", "usb0_app_125", "usb0_lpm",
+                    "usb0_stb", "usb0_apb", "usb0_axi", "usb0_utmi_apb";
+      resets = <&stgcrg 10>,
+               <&stgcrg 8>,
+               <&stgcrg 7>,
+               <&stgcrg 9>;
+      starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
+      starfive,sys-syscon = <&sys_syscon 0x18>;
+      dr_mode = "host";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      usb@10100000 {
+        compatible = "cdns,usb3";
+        reg = <0x10100000 0x10000>,
+              <0x10110000 0x10000>,
+              <0x10120000 0x10000>;
+        reg-names = "otg", "xhci", "dev";
+        interrupts = <100>, <108>, <110>;
+        interrupt-names = "host", "peripheral", "otg";
+        phy-names = "cdns3,usb3-phy", "cnds3,usb2-phy";
+        maximum-speed = "super-speed";
+      };
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
