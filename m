Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A98C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3Au3qmk+E35rFWigiSUYU97hMCKtivAKjzz+NLEVZ4=; b=PB5/ryDPhEATZ1
	eoccgmoNorNvXOVy81jaJ5m26HGGIiSpM1+ngThTkcVY/lysrt2auOOL5XVp/RTzjdJbvaCqXeKLk
	Faf6ycXR07+GLPusE7QyhOijoAOWs8VrjOoZUklKqNboyGllDSIpJ6s5kmsKD51Z5mbnoC3iC9KSe
	s+Uo/w+TDYJikzPuV0V9Q/wYZIJoiZCXgSbJujP7knvEBY1PRRo3Rgbj/w8BM9nvyicxhiB1VIKuT
	fiAZRGM/XbQg1VT8fEFaSDUY7qXwzg++EJI6sAsuXNgSgvn0g/1AKd1d34KF5QGdrbsOOSSWwKpvX
	vAhw4vpn4nGShjekWKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4JH-006g80-17;
	Wed, 19 Jul 2023 10:21:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4JB-006g0J-1z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 10:21:27 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A376A24E270;
	Wed, 19 Jul 2023 18:21:04 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Jul
 2023 18:21:04 +0800
Received: from ubuntu.localdomain (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Jul
 2023 18:21:03 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Minda Chen
	<minda.chen@starfivetech.com>
Subject: [PATCH v1 5/9] dt-bindings: PLDA: Add PLDA XpressRICH PCIe host controller
Date: Wed, 19 Jul 2023 18:20:53 +0800
Message-ID: <20230719102057.22329-6-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230719102057.22329-1-minda.chen@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_032125_962999_EB4F3FB8 
X-CRM114-Status: GOOD (  12.52  )
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

Add PLDA XpressRICH host controller dt-bindings. Both Microchip
PolarFire SoC and StarFive JH7110 SoC are using PLDA XpressRICH
PCIe host controller IP.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../pci/plda,xpressrich-pcie-host.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
new file mode 100644
index 000000000000..10a10862a078
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/plda,xpressrich-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PLDA XpressRICH PCIe host controller
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+  - Minda Chen <minda.chen@starfivetech.com>
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: plda,xpressrich-pcie-common.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: plda,xpressrich-pcie-host
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#interrupt-cells"
+  - interrupts
+  - interrupt-map-mask
+  - interrupt-map
+  - msi-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            pcie0: pcie@12000000 {
+                    compatible = "plda,xpressrich-pcie-host";
+                    reg = <0x0 0x12000000 0x0 0x00010000>,
+                          <0x0 0x43000000 0x0 0x00010000>;
+                    reg-names = "host", "cfg";
+                    ranges = <0x03000000 0x0 0x88000000 0x0 0x88000000 0x0 0x04000000>;
+                    device_type = "pci";
+                    #address-cells = <3>;
+                    #size-cells = <2>;
+                    #interrupt-cells = <1>;
+                    interrupts = <131>;
+                    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+                    interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+                                    <0 0 0 2 &pcie_intc0 1>,
+                                    <0 0 0 3 &pcie_intc0 2>,
+                                    <0 0 0 4 &pcie_intc0 3>;
+                    interrupt-parent = <&plic0>;
+                    msi-parent = <&pcie0>;
+                    msi-controller;
+                    bus-range = <0x00 0x7f>;
+
+                    pcie_intc0: interrupt-controller {
+                        #address-cells = <0>;
+                        #interrupt-cells = <1>;
+                        interrupt-controller;
+                    };
+            };
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
