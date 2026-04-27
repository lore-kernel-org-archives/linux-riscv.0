Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B764FF8860
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 01:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRCzaxLoRjnJE5pPNQAmvLOcL+d9KBhciOh7w5zfO1w=; b=JPkUxow9aBcicQ
	/FSLC9jirik63c2Lubsv/BT28SaKJoLep1pfknn0NgT96vp1x/TZnoV1ibbjBNYmRAe/Ke84/mO9D
	1lVlgDWN14OX45nN9VrhcE0VOFYEEFmZS+/H/NnaWP857qOg5EL2eevJtgaA8bCr8FKQZto2A85GH
	763kX6umilXTcjLJfazkghFvlXjQgNsoXyzJF/CXpbM1WWES3NzWimPbpfHS1WQbCFU3CAckRepRH
	Z6AD9q53bVdWlMLHEqEaC/Rn1HRx1Jv1pPueAlr5hRzjOjaySIJNlTtVvgT2j6y1eiT61KmnMYdvM
	4w4W9sllsZPqd3Y4QvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHAqz-0000000G1B3-1wVU;
	Mon, 27 Apr 2026 01:33:41 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHAqw-0000000G19f-1R6U
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 01:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=HYT/JtcTeb4xRDUsI9fYBdNKr0Iy0dm
	MBfAidPI4MF0=; b=AFal1g22bTU1RB0ZyPdZxZh1Gr5dgbxDw1U3ujsC7Ba4e19
	g/Co9uTO78COGOtBGNerxdqBcZbJvRIVPeIzWswL3Yzx1q45rElfpcB/Vx40MiHJ
	7gu9G9fbs7JSYHSlgxvu697lLEpkMAWy5VAM6rK79H8BElhFvnWGnyCW5CeU=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cULPvO5ps_0CAA--.1758S4;
	Mon, 27 Apr 2026 09:33:07 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Mon, 27 Apr 2026 09:32:11 +0800
Subject: [PATCH v4 2/3] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
MIME-Version: 1.0
Message-Id: <20260427-ultrarisc-pcie-v4-2-98935f6cdfb5@ultrarisc.com>
References: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
In-Reply-To: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777253539; l=3982;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=X2bzlR0Ihg946bcqWPf1jyyPRrQHRRPJWRN220hfPCo=;
 b=lshqQvLyVCLepawcXw2Cbbkx0v3nUFfXgwvfeqxhZwaD45Ew/JmEnP0f8MOvq2H/eUjgWrpFx
 rV+O9xzlmGQDmAr1ex4NAvl1/AGEZK4jTxc0cv1tFgVvXCt79CpmbSP
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cULPvO5ps_0CAA--.1758S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGryDXryUGw15XrW5WFW8Xrb_yoW5Kw17pF
	WUCa4kuF4xtr13uw4fK3W0kF15XF4vkF9YywnFgw1UtFZYgw1jqrsIkw13G3W5Gr4UXry2
	gFn0kr17Kw4UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ABwAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_183338_575755_67DD5832 
X-CRM114-Status: GOOD (  10.63  )
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

Add UltraRISC DP1000 SoC PCIe controller devicetree bindings.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pci/ultrarisc,dp1000-pcie.yaml        | 93 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
new file mode 100644
index 000000000000..512b935bf5d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/ultrarisc,dp1000-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC DP1000 PCIe Host Controller
+
+description:
+  UltraRISC DP1000 SoC PCIe host controller is based on the DesignWare PCIe IP.
+
+maintainers:
+  - Xincheng Zhang <zhangxincheng@ultrarisc.com>
+  - Jia Wang <wangjia@ultrarisc.com>
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: ultrarisc,dp1000-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers.
+      - description: PCIe configuration space region.
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: config
+
+  num-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [4, 16]
+    description: Number of lanes to use.
+
+  interrupts:
+    items:
+      - description: MSI interrupt
+      - description: Legacy INTA interrupt
+      - description: Legacy INTB interrupt
+      - description: Legacy INTC interrupt
+      - description: Legacy INTD interrupt
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: inta
+      - const: intb
+      - const: intc
+      - const: intd
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pcie@21000000 {
+        compatible = "ultrarisc,dp1000-pcie";
+        reg = <0x0 0x21000000 0x0 0x01000000>,
+              <0x0 0x4fff0000 0x0 0x00010000>;
+        reg-names = "dbi", "config";
+        ranges = <0x81000000 0x0 0x4fbf0000 0x0 0x4fbf0000 0x0 0x00400000>,
+                 <0x82000000 0x0 0x40000000 0x0 0x40000000 0x0 0x0fbf0000>,
+                 <0xc3000000 0x40 0x00000000 0x40 0x00000000 0xd 0x00000000>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        #interrupt-cells = <1>;
+        device_type = "pci";
+        dma-coherent;
+        bus-range = <0x0 0xff>;
+        num-lanes = <16>;
+        interrupt-parent = <&plic>;
+        interrupts = <43>, <44>, <45>, <46>, <47>;
+        interrupt-names = "msi", "inta", "intb", "intc", "intd";
+        interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+        interrupt-map = <0x0 0x0 0x0 0x1 &plic 44>,
+                        <0x0 0x0 0x0 0x2 &plic 45>,
+                        <0x0 0x0 0x0 0x3 &plic 46>,
+                        <0x0 0x0 0x0 0x4 &plic 47>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d238590a31f2..818685933541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20583,6 +20583,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
 F:	drivers/pci/controller/plda/pcie-starfive.c
 
+PCIE DRIVER FOR ULTRARISC DP1000
+M:	Xincheng Zhang <zhangxincheng@ultrarisc.com>
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
+
 PCIE ENDPOINT DRIVER FOR QUALCOMM
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
