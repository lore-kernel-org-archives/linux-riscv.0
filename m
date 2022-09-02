Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8779ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5eQJi3cngB544Hvb7r88OVho+NzvyE7WkE4Fqfmj/4=; b=DHFQcKi3KCmu+i
	weAEE34ALFv5Bvg9h7gKbl9qt5RDPxYCsmusSsdoymw9B5SuiDICVR6rfDX/kiCqL+hSSCkwjIU53
	EbxvH2MeiUMumX4mtvNSAsZJXk0JyqoyAZO9g0Sya5wWom88WO4wmyF76FZPDcqIo+GwmqrSpNbIK
	zsF/GQ07d+VF83oW00nKnuxOVgo3WvjDaLmuyr7+1x3pUOvmUc3CBnptwKDLqQxqGJ3IDk/FJB4Le
	Ab2tWxWRNSjn4fIg+RYlJNorrez8vuGzN95ARAEFNXqmbLAdEPIrkHcIuHOuA9xTexcdUmTFQbjX0
	xjP8mqwUsIwkIn3GaeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7Z8-005Voz-2Y; Fri, 02 Sep 2022 14:22:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7Z4-005VmK-9l
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 14:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662128554; x=1693664554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ruUuCbd7+5Ub1DZrutHdCrvbcDkefYKJFQJhor7JwlU=;
  b=R8fN+65Xz7+UVgbjoHsnKDk5ZVhAr1fmWIJ8E/sEKUeeKwA7KhktC17k
   pauDhyim2Wx3wCvJ7pth5tzTLOkCD5wjeaBYkn2OoSdEwFhph9Jk2X6ps
   mCC1Ih+Y1Rst6FwWWVzDwWUNt0soBKdJVNTrcs5me5l5wJoYQ9GZuYu9a
   H+tu6iu2rYb6RyxwlIdbAfTOA7v/7vkigmdNTy2pCxlriI1QBgt9p1Dxx
   291RQBuUfXkTzTeSCSsIopw7XiwpHCC0Yt1pB3w73FgeiNsTU9EO/s4uc
   sbpCpBkR0UfqioCqw+uI/T5b5cLUzT5eJBrd9AEjm5+lUeFKEJYP3qPkW
   A==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="111937895"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 07:22:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 07:22:25 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 07:22:22 -0700
From: <daire.mcnamara@microchip.com>
To: <aou@eecs.berkeley.edu>, <bhelgaas@google.com>,
	<conor.dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <kw@linux.com>,
	<linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<lpieralisi@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <robh@kernel.org>
CC: <cyril.jean@microchip.com>, <padmarao.begari@microchip.com>,
	<heinrich.schuchardt@canonical.com>, <david.abdurachmanov@gmail.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>
Subject: [PATCH v1 1/4] dt-bindings: PCI: microchip: add fabric address translation properties
Date: Fri, 2 Sep 2022 15:21:59 +0100
Message-ID: <20220902142202.2437658-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_072234_434448_00DD008D 
X-CRM114-Status: GOOD (  16.96  )
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

On PolarFire SoC both in- & out-bound address translations occur in two
stages. The specific translations are tightly coupled to the FPGA
designs and supplement the {dma-,}ranges properties. The first stage of
the translation is done by the FPGA fabric & the second by the root
port.
Add two properties so that the translation tables in the root port's
bridge layer can be configured to account for the translation done by
the FPGA fabric.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/pci/microchip,pcie-host.yaml     | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 23d95c65acff..29bb1fe99a2e 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -71,6 +71,113 @@ properties:
     minItems: 1
     maxItems: 6
 
+  microchip,outbound-fabric-translation-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 32
+    description: |
+      The CPU-to-PCIe (outbound) address translation takes place in two stages.
+      Depending on the FPGA bitstream, the outbound address translation tables
+      in the PCIe root port's bridge layer will need to be configured to account
+      for only its part of the overall outbound address translation.
+
+      The first stage of outbound address translation occurs between the CPU address
+      and an intermediate "FPGA address". The second stage of outbound address
+      translation occurs between this FPGA address and the PCIe address. Use this
+      property, in conjunction with the ranges property, to divide the overall
+      address translation into these two stages so that the PCIe address
+      translation tables can be correctly configured.
+
+      If this property is present, one entry is required per range. This is so
+      FPGA designers can choose to route different address ranges through different
+      Fabric Interface Controllers and other logic as they see fit.
+
+      If this property is not present, the entire address translation
+      in any ranges property is attempted by the root port driver via its outbound
+      address translation tables.
+
+      Each element in this property has three components. The first is a
+      PCIe address, the second is an FPGA address, and the third is a size.
+      These properties may be 32 or 64 bit values.
+
+      In operation, the driver will expect a one-to-one correspondance between
+      range properties and this property.  For each pair of range and
+      outbound-fabric-translation-range properties, the root port driver will
+      subtract the FPGA address in this property from the CPU address in the
+      corresponding range property and use the remainder to program its
+      outbound address translation tables.
+
+      For each range, take its PCIe address and size - these are the PCIe
+      address & size for the element. The FPGA address is derived from a given
+      FPGA fabric design and is the address delivered by that FPGA fabric
+      design to the Core Complex. For a trivial configuration, it is likely to be the
+      lower 32 bits of the PCIe address in the range property and the upper
+      bits of the base address of the Fabric Interface Controller the design uses.
+      Otherwise, it is tightly coupled with the data path configured in the
+      FPGA fabric between the root port and the Core Complex.
+
+      For more information on the tables, see Section 1.3.3,
+      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe User Guide:
+      https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
+
+    items:
+      minItems: 3
+      maxItems: 6
+
+  microchip,inbound-fabric-translation-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 32
+    description: |
+      The PCIe-to-CPU (inbound) address translation takes place in two stages.
+      Depending on the FPGA bitstream, the inbound address translation tables
+      in the PCIe root port's bridge layer will need to be configured to account
+      for only its part of the overall inbound address translation.
+
+      The first stage of address translation occurs between the PCIe address and
+      an intermediate FPGA address. The second stage of address translation
+      occurs between the FPGA address and the CPU address. Use this property
+      in conjunction with the dma-ranges property to divide the address
+      translation into these two stages.
+
+      If this property is present, one entry is required per dma-range. This is so
+      FPGA designers can choose to route different address ranges through different
+      Fabric Interface Controllers and other logic as they see fit.
+
+      If this property is not present, the entire address translation
+      in any dma-ranges property is attempted by the root port driver via its
+      inbound address translation tables.
+
+      Each element in this property has three components. The first is a
+      PCIe address, the second is an FPGA address, and the third is a size.
+      These properties may be 32 or 64 bit values.
+
+      In operation, the driver will expect a one-to-one correspondance between
+      dma-range properties and this property.  For each pair of dma-range and
+      inbound-fabric-translation-range properties, the root port driver will
+      subtract the FPGA address in this property from the CPU address in the
+      corresponding dma-range property and use the remainder to program its
+      inbound address translation tables.
+
+      From each dma-range, take its PCIe address and size - these are the PCIe
+      address & size for the element. The FPGA address is derived from a given
+      FPGA fabric design and is the address delivered by that FPGA fabric
+      design to the Core Complex. For a trivial configuration, this property
+      is unlikely to be required (i.e. no fabric translation on the inbound
+      interface).  Otherwise, it is tightly coupled with the inbound data path
+      configured in the FPGA fabric between the root port and the Core Complex.
+      It is expected that more than one translation range may be added to
+      an FPGA fabric design, e.g. to deliver data to cached or non-cached
+      DDR.
+
+      For more information on the tables, see Section 1.3.3,
+      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe User Guide:
+      https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
+
+    items:
+      minItems: 4
+      maxItems: 7
+
   msi-controller:
     description: Identifies the node as an MSI controller.
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
