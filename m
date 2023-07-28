Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7615C41513
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7tekEq3m/M1qIaMAfuao5rJ7BLJ0jWPYYylv5PItnQ=; b=qtxnbOMYcPbs4g
	JrdTJWuha5SLw1dGoPQgVUCYy764e7cXUsOko/jhOkijivREiOUHX85AULt02hHZzHo1S7k/yZjeu
	0dVDuqNWs9mcvrSbFWb1aBrQhpOhhUD0DMoW0HxwBFfdbBBNH9XNIzZopHMp2LWpPJToDzM6LMhxb
	3lH5A+pOrfQfN2TsxEBXLOBQPDus3M0b7jI2A3+brTtcd4MSCZXbP2Brd08nlRZh3jU/D2nqXMac+
	mLgXsMBIxzqUP+C8QN8lXtXUMHunvoBOW2SkdcqhvPVqFMufbPbQ2lTdZZkr2sGsCzjJBQqG44Maf
	kopW7WOjh6JWs0EBpE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNIY-003VIq-1x;
	Fri, 28 Jul 2023 13:14:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNIS-003VDG-0W
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690550060; x=1722086060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=47sf+VlB1kga61y7PJFUihyZNXOUyGlCGTScl9eDSBs=;
  b=ygTW/BYmkMFjSCLWnSI7hElDAVUoh5qZxF7Uvs7R5IvCB7OQLQVMN9/Q
   2Lume11WtLnt6O647rzr0yg4FIaDPe0Cn9ZB76Xhgwh925nS9jQJsdDF7
   qG5EQUW9cYbyEl13gRSb895OWRoxfE8ISt3+LhtzwHXC7EXBrzG+rmIbX
   bDkIs2qm1VnfxzgamUNxbnQf1ziii1/IAQMObBfidtgdgQo4gWTNV2Zw+
   3wBtzAzEPqCrQ09v8/BNNMOmOQhCYDqXxQPwU1RZBNojbyTAHxE+Ldt2t
   BIq+iVXza8S/kY0I06KLvRvRmDnQ8CFcdpQYRXB7tPRaU0gvwH82ofjBe
   A==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="238431628"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 06:14:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 06:14:18 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 06:14:16 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 6/7] PCI: microchip: Gather MSI information from hardware config registers
Date: Fri, 28 Jul 2023 14:14:00 +0100
Message-ID: <20230728131401.1615724-7-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728131401.1615724-1-daire.mcnamara@microchip.com>
References: <20230728131401.1615724-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_061420_202745_635F922B 
X-CRM114-Status: GOOD (  16.39  )
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

The PCIe Root Complex on PolarFire SoC is configured at bitstream creation
time using Libero.  Key MSI-related parameters include the number of
MSIs (1/2/4/8/16/32) and the MSI address. In the device driver, extract
this information from hw registers at init time, and use it to configure
MSI system, including configuring MSI capability structure correctly in
configuration space.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 65 +++++++++++---------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 7b212eea42d2..ca13fd56a0d9 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -7,6 +7,7 @@
  * Author: Daire McNamara <daire.mcnamara@microchip.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -20,8 +21,7 @@
 #include "../pci.h"
 
 /* Number of MSI IRQs */
-#define MC_NUM_MSI_IRQS				32
-#define MC_NUM_MSI_IRQS_CODED			5
+#define MC_MAX_NUM_MSI_IRQS			32
 
 /* PCIe Bridge Phy and Controller Phy offsets */
 #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
@@ -31,6 +31,11 @@
 #define MC_PCIE_CTRL_ADDR			(MC_PCIE1_CTRL_ADDR)
 
 /* PCIe Bridge Phy Regs */
+#define PCIE_PCI_IRQ_DW0			0xa8
+#define  MSIX_CAP_MASK				BIT(31)
+#define  NUM_MSI_MSGS_MASK			GENMASK(6, 4)
+#define  NUM_MSI_MSGS_SHIFT			4
+
 #define IMASK_LOCAL				0x180
 #define  DMA_END_ENGINE_0_MASK			0x00000000u
 #define  DMA_END_ENGINE_0_SHIFT			0
@@ -79,7 +84,6 @@
 #define IMASK_HOST				0x188
 #define ISTATUS_HOST				0x18c
 #define IMSI_ADDR				0x190
-#define  MSI_ADDR				0x190
 #define ISTATUS_MSI				0x194
 
 /* PCIe Master table init defines */
@@ -158,8 +162,6 @@
 
 /* PCIe Config space MSI capability structure */
 #define MC_MSI_CAP_CTRL_OFFSET			0xe0u
-#define  MC_MSI_MAX_Q_AVAIL			(MC_NUM_MSI_IRQS_CODED << 1)
-#define  MC_MSI_Q_SIZE				(MC_NUM_MSI_IRQS_CODED << 4)
 
 /* Events */
 #define EVENT_PCIE_L2_EXIT			0
@@ -259,7 +261,7 @@ struct mc_msi {
 	struct irq_domain *dev_domain;
 	u32 num_vectors;
 	u64 vector_phy;
-	DECLARE_BITMAP(used, MC_NUM_MSI_IRQS);
+	DECLARE_BITMAP(used, MC_MAX_NUM_MSI_IRQS);
 };
 
 struct mc_pcie {
@@ -382,25 +384,27 @@ static struct {
 
 static char poss_clks[][5] = { "fic0", "fic1", "fic2", "fic3" };
 
-static void mc_pcie_enable_msi(struct mc_pcie *port, void __iomem *base)
+static void mc_pcie_enable_msi(struct mc_pcie *port, void __iomem *ecam)
 {
 	struct mc_msi *msi = &port->msi;
-	u32 cap_offset = MC_MSI_CAP_CTRL_OFFSET;
-	u16 msg_ctrl = readw_relaxed(base + cap_offset + PCI_MSI_FLAGS);
+	u16 reg;
+	u8 queue_size;
 
-	msg_ctrl |= PCI_MSI_FLAGS_ENABLE;
-	msg_ctrl &= ~PCI_MSI_FLAGS_QMASK;
-	msg_ctrl |= MC_MSI_MAX_Q_AVAIL;
-	msg_ctrl &= ~PCI_MSI_FLAGS_QSIZE;
-	msg_ctrl |= MC_MSI_Q_SIZE;
-	msg_ctrl |= PCI_MSI_FLAGS_64BIT;
+	/* Fixup MSI enable flag */
+	reg = readw_relaxed(ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
+	reg |= PCI_MSI_FLAGS_ENABLE;
+	writew_relaxed(reg, ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
 
-	writew_relaxed(msg_ctrl, base + cap_offset + PCI_MSI_FLAGS);
+	/* Fixup PCI MSI queue flags */
+	queue_size = FIELD_GET(PCI_MSI_FLAGS_QMASK, reg);
+	reg |= FIELD_PREP(PCI_MSI_FLAGS_QSIZE, queue_size);
+	writew_relaxed(reg, ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
 
+	/* Fixup MSI addr fields */
 	writel_relaxed(lower_32_bits(msi->vector_phy),
-		       base + cap_offset + PCI_MSI_ADDRESS_LO);
+		       ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_ADDRESS_LO);
 	writel_relaxed(upper_32_bits(msi->vector_phy),
-		       base + cap_offset + PCI_MSI_ADDRESS_HI);
+		       ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_ADDRESS_HI);
 }
 
 static void mc_handle_msi(struct irq_desc *desc)
@@ -473,10 +477,7 @@ static int mc_irq_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
 {
 	struct mc_pcie *port = domain->host_data;
 	struct mc_msi *msi = &port->msi;
-	void __iomem *bridge_base_addr =
-		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 	unsigned long bit;
-	u32 val;
 
 	mutex_lock(&msi->lock);
 	bit = find_first_zero_bit(msi->used, msi->num_vectors);
@@ -490,11 +491,6 @@ static int mc_irq_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	irq_domain_set_info(domain, virq, bit, &mc_msi_bottom_irq_chip,
 			    domain->host_data, handle_edge_irq, NULL, NULL);
 
-	/* Enable MSI interrupts */
-	val = readl_relaxed(bridge_base_addr + IMASK_LOCAL);
-	val |= PM_MSI_INT_MSI_MASK;
-	writel_relaxed(val, bridge_base_addr + IMASK_LOCAL);
-
 	mutex_unlock(&msi->lock);
 
 	return 0;
@@ -1111,6 +1107,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	struct mc_pcie *port;
 	void __iomem *bridge_base_addr;
 	int ret;
+	u32 val;
 
 	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
@@ -1131,12 +1128,24 @@ static int mc_platform_init(struct pci_config_window *cfg)
 
 	bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 
-	port->msi.vector_phy = MSI_ADDR;
-	port->msi.num_vectors = MC_NUM_MSI_IRQS;
+	/* Allow enabling MSI by disabling MSI-X */
+	val = readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
+	val &= ~MSIX_CAP_MASK;
+	writel(val, bridge_base_addr + PCIE_PCI_IRQ_DW0);
 
 	/* Hardware doesn't setup MSI by default */
 	mc_pcie_enable_msi(port, cfg->win);
 
+	/* Pick num vectors from bitfile programmed onto FPGA fabric */
+	val = readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
+	val &= NUM_MSI_MSGS_MASK;
+	val >>= NUM_MSI_MSGS_SHIFT;
+
+	port->msi.num_vectors = 1 << val;
+
+	/* Pick vector address from design */
+	port->msi.vector_phy = readl_relaxed(bridge_base_addr + IMSI_ADDR);
+
 	/* Configure Address Translation Table 0 for PCIe config space */
 	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
 			     cfg->res.start, resource_size(&cfg->res));
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
