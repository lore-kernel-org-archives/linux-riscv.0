Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22896C7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsLpm22Gu3kxc/FsKXLKPwMkwshmrAg0oKszZXuLH1o=; b=hadMpYoVACWl2r
	9yvfnjHwtxC7YhX2hFvEYvZdK+hkjXFHI8q0se5UW6GcerDhxuI6j/LpXfmrm3uDUV6S6EpWO0uXN
	WiNNEnSeuDTTfdRX+UGSzGWndKTjbIRU+cA6pjqL5/gXfVYQ0613D6TxozBkw8ry/Y2I1CuztfXRN
	Kd51pZyW8qbrLXTZMJ07R68/Sr+otYDUovdvk7+6hAzc2iivmJvmV/NwNSS7FugkXVIwBHjFmDrfS
	Bczmd5H6EaetyYh7Gr+gpxKHaE68v2vMZVxscodr0tYHg8r1iBzKkhSES1sOOAgg0waM2ApU4YPsQ
	zwRQM4TghBWnq2sFc7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbo8-00Cpv2-2O;
	Thu, 18 May 2023 11:28:32 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbo4-00Cpq8-1K;
	Thu, 18 May 2023 11:28:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9549F80D6;
	Thu, 18 May 2023 19:27:57 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 19:27:57 +0800
Received: from ubuntu.localdomain (113.72.146.100) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 19:27:56 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Minda Chen" <minda.chen@starfivetech.com>, Mason Huo
	<mason.huo@starfivetech.com>
Subject: [PATCH v6 5/7] dt-bindings: usb: Add StarFive JH7110 USB controller
Date: Thu, 18 May 2023 19:27:48 +0800
Message-ID: <20230518112750.57924-6-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518112750.57924-1-minda.chen@starfivetech.com>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.100]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_042828_759975_0E48907C 
X-CRM114-Status: GOOD (  13.14  )
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

StarFive JH7110 platforms USB have a wrapper module around
the Cadence USBSS-DRD controller. Add binding information doc
for that.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../bindings/usb/starfive,jh7110-usb.yaml     | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
new file mode 100644
index 000000000000..24aa9c10d6ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
+
+maintainers:
+  - Minda Chen <minda.chen@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-usb
+
+  ranges: true
+
+  starfive,stg-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller stg_syscon node.
+          - description: dr mode register offset of STG_SYSCONSAIF__SYSCFG register for USB.
+    description:
+      The phandle to System Register Controller syscon node and the offset
+      of STG_SYSCONSAIF__SYSCFG register for USB.
+
+  dr_mode:
+    enum: [host, otg, peripheral]
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+  clocks:
+    items:
+      - description: link power management clock
+      - description: standby clock
+      - description: APB clock
+      - description: AXI clock
+      - description: UTMI APB clock
+
+  clock-names:
+    items:
+      - const: lpm
+      - const: stb
+      - const: apb
+      - const: axi
+      - const: utmi_apb
+
+  resets:
+    items:
+      - description: Power up reset
+      - description: APB clock reset
+      - description: AXI clock reset
+      - description: UTMI APB clock reset
+
+  reset-names:
+    items:
+      - const: pwrup
+      - const: apb
+      - const: axi
+      - const: utmi_apb
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    $ref: cdns,usb3.yaml#
+    description: Required child node
+
+required:
+  - compatible
+  - ranges
+  - starfive,stg-syscon
+  - '#address-cells'
+  - '#size-cells'
+  - dr_mode
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    usb@10100000 {
+        compatible = "starfive,jh7110-usb";
+        ranges = <0x0 0x10100000 0x100000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        starfive,stg-syscon = <&stg_syscon 0x4>;
+        clocks = <&syscrg 4>,
+                 <&stgcrg 5>,
+                 <&stgcrg 1>,
+                 <&stgcrg 3>,
+                 <&stgcrg 2>;
+        clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
+        resets = <&stgcrg 10>,
+                 <&stgcrg 8>,
+                 <&stgcrg 7>,
+                 <&stgcrg 9>;
+        reset-names = "pwrup", "apb", "axi", "utmi_apb";
+        dr_mode = "host";
+
+        usb@0 {
+            compatible = "cdns,usb3";
+            reg = <0x0 0x10000>,
+                  <0x10000 0x10000>,
+                  <0x20000 0x10000>;
+            reg-names = "otg", "xhci", "dev";
+            interrupts = <100>, <108>, <110>;
+            interrupt-names = "host", "peripheral", "otg";
+            maximum-speed = "super-speed";
+        };
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
