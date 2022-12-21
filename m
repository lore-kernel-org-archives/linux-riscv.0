Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101B6C10F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7M0XRBXZBD9AbklH1lKJ9GW4jbTW5kRvoo+kF0R9DrA=; b=QHDJPcd+U6SEj2
	mHYKAYu1XzHjTiTeLYykPnNJBR2iM3IucUY2NtNq6FTNIZ0xwT3UvkS/jeyOR84RrWuX+7zAVzRR1
	lQMLMVqdWeQ90a5jx0rEM2wF5UmLNvEGKce7b3nAilIzvyJWhlT5iiWI0I4kRmhtoiFDkJ+dc3vuT
	/ZaG2pmbmhjb//Hm4S+VurTKsHl61NgI2fIh8xawpimZNz1wmRd4+QOsf/qD7UYjC/m2ewqnkAUM/
	0PlAKkC0GP8Sq9pTWsPGkDp8x4D75X4mePpIXR0CF0IvVIXaFnMTECtGJbxAqPqCCdQUSnyKxbmZG
	HQgWfOWHyLaeZ36l4tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81wC-00H1iY-Lc; Wed, 21 Dec 2022 16:27:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81vn-00H1OZ-4y
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 16:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671640018; x=1703176018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lmQwp2EaxP9EgZRBYuUg5fGcLlliqr1no4CRaLRhepA=;
  b=SjF/UAw93SrKNxIYcK7J7x4G4F8wkzjGcFXylcdt+dAvFnhl3xhUYzNX
   IjAkG+Kldby7wgr07VTDNaamuw3nNW9WCYtf9cUzFk4KmEydMlU6kJ0Ze
   /CXgURzdxYnOCsjN9J39utBsMjWlAqS7KDNtYkQWsc4x08bKHr6lVyPk/
   wxNPGq16G7zikf/fXlvkkHW7V69eDs/Bq99m5ekV/FkqBBGr7Pe3Ice/0
   vYNJy2VaYkvalH1BJQ7nygFUJrC0qHJ92lApdcDtUnMgcCdLYw+9oyzPO
   XiiY9yN3zF0rtL4QgrDc77z+MxiUuIIsoFXruClv+YRZgJYlQ4ET5Fc9o
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="192725246"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Dec 2022 09:26:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 21 Dec 2022 09:26:55 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 21 Dec 2022 09:26:52 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v2 7/9] PCI: microchip: Partition outbound address translation
Date: Wed, 21 Dec 2022 16:26:28 +0000
Message-ID: <20221221162630.3632486-8-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221162630.3632486-1-daire.mcnamara@microchip.com>
References: <20221221162630.3632486-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_082659_401120_8E21D61E 
X-CRM114-Status: GOOD (  21.03  )
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

From: Daire McNamara <daire.mcnamara@microchip.com>

On Microchip PolarFire SoC the PCIe Root Port is behind a set of Fabric
Interface Controller (FIC) buses that encapsulate buses like ABP/AHP and
AXI-M. Depending on which FIC(s) the Root Port is wired through to cpu
space, the Root Port driver needs to take account of the address
translation done by a parent (e.g. fabric) node before setting up its
own outbound address translation tables to config space and attached
devices.

Parse the range properties to determine how much address translation
needs to be done in the Root Port.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 109 +++++++++++++++----
 1 file changed, 86 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 2ba96d7f9095..ee8796db461e 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -85,27 +85,42 @@
 #define IMSI_ADDR				0x190
 #define ISTATUS_MSI				0x194
 
+#define ATR_WINDOW_DESC_SIZE			32
+#define ATR_PCIE_ATR_SIZE			0x25
+#define ATR_SIZE_SHIFT				1
+#define ATR_IMPL_ENABLE				1
+
 /* PCIe Master table init defines */
 #define ATR0_PCIE_WIN0_SRCADDR_PARAM		0x600u
-#define  ATR0_PCIE_ATR_SIZE			0x25
-#define  ATR0_PCIE_ATR_SIZE_SHIFT		1
 #define ATR0_PCIE_WIN0_SRC_ADDR			0x604u
 #define ATR0_PCIE_WIN0_TRSL_ADDR_LSB		0x608u
 #define ATR0_PCIE_WIN0_TRSL_ADDR_UDW		0x60cu
 #define ATR0_PCIE_WIN0_TRSL_PARAM		0x610u
 
+enum {
+	TRSL_ID_PCIE_TXRX,
+	TRSL_ID_PCIE_CONFIG,
+	TRSL_ID_AXI4_LITE_MASTER,
+	TRSL_ID_AXI4_MASTER_0 = 4,
+	TRSL_ID_AXI4_MASTER_1,
+	TRSL_ID_AXI4_MASTER_2,
+	TRSL_ID_AXI4_MASTER_3,
+	TRSL_ID_AXI4_STREAM_0,
+	TRSL_ID_AXI4_STREAM_1,
+	TRSL_ID_AXI4_STREAM_2,
+	TRSL_ID_AXI4_STREAM_3,
+	TRSL_ID_INTERNAL_BRIDGE_REGISTERS
+};
+
+#define ATR0_PCIE_WIN0_TRSL_MASK_LSB		0x618u
+#define ATR0_PCIE_WIN0_TRSL_MASK_UDW		0x61cu
+
 /* PCIe AXI slave table init defines */
 #define ATR0_AXI4_SLV0_SRCADDR_PARAM		0x800u
-#define  ATR_SIZE_SHIFT				1
-#define  ATR_IMPL_ENABLE			1
 #define ATR0_AXI4_SLV0_SRC_ADDR			0x804u
 #define ATR0_AXI4_SLV0_TRSL_ADDR_LSB		0x808u
 #define ATR0_AXI4_SLV0_TRSL_ADDR_UDW		0x80cu
 #define ATR0_AXI4_SLV0_TRSL_PARAM		0x810u
-#define  PCIE_TX_RX_INTERFACE			0x00000000u
-#define  PCIE_CONFIG_INTERFACE			0x00000001u
-
-#define ATR_ENTRY_SIZE				32
 
 /* PCIe Controller Phy Regs */
 #define SEC_ERROR_EVENT_CNT			0x20
@@ -270,6 +285,7 @@ struct mc_pcie {
 	struct irq_domain *event_domain;
 	raw_spinlock_t lock;
 	struct mc_msi msi;
+	u64 outbound_range_offset;
 };
 
 struct cause {
@@ -930,36 +946,36 @@ static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
 				 phys_addr_t axi_addr, phys_addr_t pci_addr,
 				 size_t size)
 {
-	u32 atr_sz = ilog2(size) - 1;
+	u32 atr_size = ilog2(size) - 1;
 	u32 val;
 
 	if (index == 0)
-		val = PCIE_CONFIG_INTERFACE;
+		val = TRSL_ID_PCIE_CONFIG;
 	else
-		val = PCIE_TX_RX_INTERFACE;
+		val = TRSL_ID_PCIE_TXRX;
 
-	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
+	writel(val, bridge_base_addr + (index * ATR_WINDOW_DESC_SIZE) +
 	       ATR0_AXI4_SLV0_TRSL_PARAM);
 
-	val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
+	val = lower_32_bits(axi_addr) | (atr_size << ATR_SIZE_SHIFT) |
 			    ATR_IMPL_ENABLE;
-	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
+	writel(val, bridge_base_addr + (index * ATR_WINDOW_DESC_SIZE) +
 	       ATR0_AXI4_SLV0_SRCADDR_PARAM);
 
 	val = upper_32_bits(axi_addr);
-	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
+	writel(val, bridge_base_addr + (index * ATR_WINDOW_DESC_SIZE) +
 	       ATR0_AXI4_SLV0_SRC_ADDR);
 
 	val = lower_32_bits(pci_addr);
-	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
+	writel(val, bridge_base_addr + (index * ATR_WINDOW_DESC_SIZE) +
 	       ATR0_AXI4_SLV0_TRSL_ADDR_LSB);
 
 	val = upper_32_bits(pci_addr);
-	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
+	writel(val, bridge_base_addr + (index * ATR_WINDOW_DESC_SIZE) +
 	       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
 
 	val = readl(bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
-	val |= (ATR0_PCIE_ATR_SIZE << ATR0_PCIE_ATR_SIZE_SHIFT);
+	val |= (ATR_PCIE_ATR_SIZE << ATR_SIZE_SHIFT);
 	writel(val, bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
 	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
 }
@@ -972,14 +988,14 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
 	struct resource_entry *entry;
 	u64 pci_addr;
-	u32 index = 1;
+	u32 index = 1; /* Window 0 used for config space */
 
 	resource_list_for_each_entry(entry, &bridge->windows) {
 		if (resource_type(entry->res) == IORESOURCE_MEM) {
 			pci_addr = entry->res->start - entry->offset;
 			mc_pcie_setup_window(bridge_base_addr, index,
-					     entry->res->start, pci_addr,
-					     resource_size(entry->res));
+					     entry->res->start - port->outbound_range_offset,
+					     pci_addr, resource_size(entry->res));
 			index++;
 		}
 	}
@@ -1103,6 +1119,44 @@ static int mc_init_interrupts(struct platform_device *pdev, struct mc_pcie *port
 	return 0;
 }
 
+static int mc_check_for_parent_range_handling(struct platform_device *pdev, struct mc_pcie *port)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *dn = dev->of_node;
+	struct of_range_parser parser;
+	struct of_range range;
+	u64 cpu_addr;
+
+	/* Find any pcie range */
+	if (of_range_parser_init(&parser, dn)) {
+		dev_err(dev, "missing ranges property\n");
+		return -EINVAL;
+	}
+
+	for_each_of_range(&parser, &range) {
+		cpu_addr = range.cpu_addr;
+		/*
+		 * First range is enough - extend if anyone ever needs more
+		 * than one fabric interface
+		 */
+		break;
+	}
+
+	/* Check for one level up; that is enough */
+	dn = of_get_parent(dn);
+	if (dn) {
+		of_range_parser_init(&parser, dn);
+		for_each_of_range(&parser, &range) {
+			/* Find the parent range that contains cpu_addr */
+			if (range.cpu_addr > port->outbound_range_offset &&
+			    range.cpu_addr < cpu_addr)
+				port->outbound_range_offset = range.cpu_addr;
+		}
+	}
+
+	return 0;
+}
+
 static int mc_platform_init(struct pci_config_window *cfg)
 {
 	struct device *dev = cfg->parent;
@@ -1111,9 +1165,18 @@ static int mc_platform_init(struct pci_config_window *cfg)
 		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 	int ret;
 
+	/*
+	 * Need information about any parent bus that may be performing some
+	 * of the outbound address translation to setup outbound address
+	 * translation tables later
+	 */
+	ret = mc_check_for_parent_range_handling(pdev, port);
+	if (ret)
+		return ret;
+
 	/* Configure address translation table 0 for PCIe config space */
-	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
-			     cfg->res.start,
+	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start - port->outbound_range_offset,
+			     cfg->res.start - port->outbound_range_offset,
 			     resource_size(&cfg->res));
 
 	/* Need some fixups in config space */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
