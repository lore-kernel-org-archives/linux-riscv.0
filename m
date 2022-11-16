Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E1AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+hminoDFBwvYkH9acgwidq7PdAJh4U6smJo3a0A9rQ=; b=XDjkFAqx7yGKF9
	LWN42EIeSB+nIg0RVboOdNDmXRpU8PcPcRDnP4KGfXsDI4fzG/pqJsDdwtkB/2/ANCFqM5nPmrdcZ
	W1kSO0Uqatr/flyS3DB9uiHR5mHc+xRnico9YUaU/NNsf3iGd8ZzG8lJy/IZLjok/Yg6HpXTOqIGY
	NvU4pMwV8gafg63XsNMIjfzHEXQBHq/OXjSPyVaGDjwuki9UHGdYmf+y9e4xi/Ecw5ne9fc3Mh6KO
	Kqs7xy03wQGU8IjEtq7mOySim9NweguAZYQHL7xO274wTQG1oLxQNPh9sSjp7nhXtvmZYdJN+9ixa
	E2JsSiBJCQcfbSqro0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovItb-004Joq-Sp; Wed, 16 Nov 2022 13:56:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIt5-004JV3-HM
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 13:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668606936; x=1700142936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B3BqAhxWnJ7Dvd4aEBeue027MfS4UgUnrukczAD5ylg=;
  b=bPoqQrtDpO2v//vff/gu7g2mvh/65EmhGtTRmLcnSV6I62rrAdo1rcnH
   Uqt/Kf71MCDe1taVBkDoiga6hAfAQqYtQARL/HDcVI6py69+EcCue1rNe
   8OBVfE4s1YwNVxEEtIsnO/cp+Ub29OU0RDwzslyn/1UUMs/oDeDFEZ/7d
   vj2Z72Rawu/rJTqRMU3RS7QFJyy2SB8f3BZEEFr9DiYIrhKiHMu4XuTsd
   CM7qRPBrd2oYzNxKCRy5YXdw/N2F5CajKq2Z/c4k3Wc6o1vyN3sIOeMeQ
   lPvAw7A63cz01P9KfO9jvEuU7CvOzBHcIEBIUilE6bvXN/niUmsaWQ9F4
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="189259768"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Nov 2022 06:55:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 16 Nov 2022 06:55:33 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 16 Nov 2022 06:55:30 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 7/9] PCI: microchip: Partition outbound address translation
Date: Wed, 16 Nov 2022 13:55:02 +0000
Message-ID: <20221116135504.258687-8-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116135504.258687-1-daire.mcnamara@microchip.com>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_055535_726470_5598F72A 
X-CRM114-Status: GOOD (  21.28  )
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

On Microchip PolarFire SoC the PCIe rootport is behind a set of fabric
inter connect (fic) busses that encapsulate busses like ABP/AHP and
AXI-M. Depending on which fic(s) the rootport is wired through to cpu
space, the rootport driver needs to take account of the address
translation done by a parent (e.g. fabric) node before setting up its
own outbound address translation tables to config space and attached
devices.

Parse the range properties to determine how much address translation
needs to be done in the rootport.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 109 +++++++++++++++----
 1 file changed, 86 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 73856647f321..62f8c5edfd0e 100644
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
+	TRSL_ID_PCIE_TXRX = 0,
+	TRSL_ID_PCIE_CONFIG = 1,
+	TRSL_ID_AXI4_LITE_MASTER = 2,
+	TRSL_ID_AXI4_MASTER_0 = 4,
+	TRSL_ID_AXI4_MASTER_1 = 5,
+	TRSL_ID_AXI4_MASTER_2 = 6,
+	TRSL_ID_AXI4_MASTER_3 = 7,
+	TRSL_ID_AXI4_STREAM_0 = 8,
+	TRSL_ID_AXI4_STREAM_1 = 9,
+	TRSL_ID_AXI4_STREAM_2 = 10,
+	TRSL_ID_AXI4_STREAM_3 = 11,
+	TRSL_ID_INTERNAL_BRIDGE_REGISTERS = 12,
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
@@ -268,6 +283,7 @@ struct mc_pcie {
 	struct irq_domain *event_domain;
 	raw_spinlock_t lock;
 	struct mc_msi msi;
+	u64 outbound_range_offset;
 };
 
 struct cause {
@@ -928,36 +944,36 @@ static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
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
@@ -970,14 +986,14 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
 	struct resource_entry *entry;
 	u64 pci_addr;
-	u32 index = 1;
+	u32 index = 1; /* window 0 used for config space */
 
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
@@ -1093,6 +1109,44 @@ static int mc_init_interrupts(struct platform_device *pdev, struct mc_pcie *port
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
+	/* find any pcie range */
+	if (of_range_parser_init(&parser, dn)) {
+		dev_err(dev, "missing ranges property\n");
+		return -EINVAL;
+	}
+
+	for_each_of_range(&parser, &range) {
+		cpu_addr = range.cpu_addr;
+		/*
+		 * first range is enough - extend if anyone
+		 * ever needs more than one fabric interface
+		 */
+		break;
+	}
+
+	/* check for one level up; that is enough */
+	dn = of_get_parent(dn);
+	if (dn) {
+		of_range_parser_init(&parser, dn);
+		for_each_of_range(&parser, &range) {
+			/* find the parent range that contains cpu_addr */
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
@@ -1101,9 +1155,18 @@ static int mc_platform_init(struct pci_config_window *cfg)
 		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 	int ret;
 
+	/*
+	 * need information about any parent bus that may
+	 * be performing some of the outbound address translation
+	 * to setup outbound address translation tables later
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
