Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F716CAC5B0
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 11:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXcn70bj8H+ufv7qOKHPGq43VA5th5Kh177BWWBQxFQ=; b=PzMMoEWvnzHSY7
	FNXWRxLIAK+R7cVvRRsHq+oWH35FIlmHw3CxD9Ujulro4HrhLniHmSe8cLNmeYFm3V0MB5TaXWikT
	0sbfIqjlpI0qHjNj8IIvv9LV7bUYLZyxcRy/BGXKolFu7wBkLqT/P5Zkrgto+69RWTxGHUcbyIwgp
	kxSIPujCzZlmHTRkvyuRt32QM5uAxkqr/hGv31B+kfvIIf0U7m8HsGYcNM/eFkziXivm86um7fdN0
	SMmGablJ+R34czUfkEDF/laZ1/vJpuDUBU9ZCHB4s0DLrC1frSISNSYk2AkngmMOPY7nBqV+xeh2c
	sun+nBoiSQu8fslhwhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NkA-0000000Gx10-2COy;
	Wed, 24 Sep 2025 11:33:06 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Nk1-0000000Gwqq-1uHB
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 11:33:05 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 58OBSUKS074424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 19:28:30 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Sep 2025
 19:28:30 +0800
From: Randolph Lin <randolph@andestech.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <jingoohan1@gmail.com>,
        <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <ben717@andestech.com>, <inochiama@gmail.com>,
        <thippeswamy.havalige@amd.com>, <namcao@linutronix.de>,
        <shradha.t@samsung.com>, <randolph.sklin@gmail.com>,
        <tim609@andestech.com>, Randolph Lin <randolph@andestech.com>
Subject: [PATCH v4 2/5] dt-bindings: PCI: Add Andes QiLai PCIe support
Date: Wed, 24 Sep 2025 19:28:17 +0800
Message-ID: <20250924112820.2003675-3-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924112820.2003675-1-randolph@andestech.com>
References: <20250924112820.2003675-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 58OBSUKS074424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_043257_809257_71F0134A 
X-CRM114-Status: GOOD (  12.31  )
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

Add the Andes QiLai PCIe node, which includes 3 Root Complexes.
Only one example is required in the DTS bindings YAML file.

Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 .../bindings/pci/andestech,qilai-pcie.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
new file mode 100644
index 000000000000..8effe6ebd9d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/andestech,qilai-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes QiLai PCIe host controller
+
+description: |+
+  Andes QiLai PCIe host controller is based on the Synopsys DesignWare
+  PCI core. It shares common features with the PCIe DesignWare core and
+  inherits common properties defined in
+  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
+
+maintainers:
+  - Randolph Lin <randolph@andestech.com>
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: andestech,qilai-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers.
+      - description: APB registers.
+      - description: PCIe configuration space region.
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: apb
+      - const: config
+
+  ranges:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-map: true
+
+required:
+  - reg
+  - reg-names
+  - "#interrupt-cells"
+  - interrupts
+  - interrupt-names
+  - interrupt-map-mask
+  - interrupt-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      bus@80000000 {
+        compatible = "simple-bus";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        dma-ranges = <0x44 0x00000000 0x04 0x00000000 0x04 0x00000000>;
+        ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x20000000>,
+                 <0x00 0x04000000 0x00 0x04000000 0x00 0x00001000>,
+                 <0x00 0x00000000 0x20 0x00000000 0x20 0x00000000>;
+
+        pci@80000000 {
+          compatible = "andestech,qilai-pcie";
+          device_type = "pci";
+          reg = <0x0 0x80000000 0x0 0x20000000>,
+                <0x0 0x04000000 0x0 0x00001000>,
+                <0x0 0x00000000 0x0 0x00010000>;
+          reg-names = "dbi", "apb", "config";
+
+          linux,pci-domain = <0>;
+          bus-range = <0x0 0xff>;
+          num-viewport = <4>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x0 0xf0000000>,
+                   <0x43000000 0x01 0x00000000 0x01 0x0000000 0x1f 0x00000000>;
+
+          #interrupt-cells = <1>;
+          interrupts = <0xf>;
+          interrupt-names = "msi";
+          interrupt-parent = <&plic0>;
+          interrupt-map-mask = <0 0 0 7>;
+          interrupt-map = <0 0 0 1 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
+                          <0 0 0 2 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
+                          <0 0 0 3 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
+                          <0 0 0 4 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
