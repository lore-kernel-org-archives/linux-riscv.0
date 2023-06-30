Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351CEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJEQdcs8kuGfEHqywPKPtH3nyifOb8CvkRO2BtSL1r0=; b=DeLrt4mCWjePBT
	OmnrkXa0x+/3fN2I/0raH1W7e4UEfoSLlLNtYRwjHyYQsZAVud3P3y3Vbcbt1ALs6rd19eDZB7OL1
	vgvYeHjLLrbK/m2mZcB9+kt2OZ3XtrGSr2tTcxa0Jsm7ShB2UYcnvBrY4M4Kx/gzRvXM9DLZe1GBA
	rzd2GGwTE2KgYUGUVFBBqzMN5ncty4ym6ENIvAl8PYSQxQqhi45mQDaH7HDKa0Fmw0iKeC6Hr7h17
	Bh4kz+Kb4NvO2krS2JRRsWqZVbzU2GApe/QlAs4ylAxdBqIuxqaBvWo+KEnenGvBZoLrS62gbs8i+
	wDAbrf1+M76x27pL7K2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGNN-003ytU-2t;
	Fri, 30 Jun 2023 15:49:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGNI-003yqs-2L
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 15:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688140172; x=1719676172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YPpoEmBl+Fmm4/uZPPWUVxXiMPINCj27HNgIRLpHDeo=;
  b=FijnKyfeMMFdzPFnxra5SsNUuq2oLZ/nhsvi0rETg3tec73P5dj5Of9N
   krbScnP1Pmr/b6eFzU+drFU+FblW57BXHndmTMT8ghrDLSRiMrk9/xsYJ
   G1aoIlN4ntsUGmngv+LgDIsrxZlSxSbGv0CM0Vs+lUmX26mSK6lTZH0Am
   0QQdG/JiLQH3cBl94eahE+/MU8tdQHKFfn2tAWBy9HpBrY4iyqtl4QWx/
   cAz84HwZHPTIPRk4fGKchCfzc4Rj1IfPqmXB4iR7H3KpHTRQkOTfDqz5F
   LF6bL+9T65Be8PL8dNsBnhi+8d4zeZPGS0AXosFnRBl9pC4cVkqWGG1HM
   A==;
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="159339770"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2023 08:49:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 30 Jun 2023 08:49:17 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 30 Jun 2023 08:49:15 -0700
From: <daire.mcnamara@microchip.com>
To: <conor@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH v2 6/8] PCI: microchip: Gather MSI information from hardware config registers
Date: Fri, 30 Jun 2023 16:48:57 +0100
Message-ID: <20230630154859.2049521-7-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
References: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_084932_833450_54DE679D 
X-CRM114-Status: GOOD (  14.59  )
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

This is backward compatible with all devices in the field.  All devices
report their MSI parameters.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 40 +++++++++++++-------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 6b28442ffe5a..20ce21438a7e 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -20,8 +20,7 @@
 #include "../pci.h"
 
 /* Number of MSI IRQs */
-#define MC_NUM_MSI_IRQS				32
-#define MC_NUM_MSI_IRQS_CODED			5
+#define MC_MAX_NUM_MSI_IRQS			32
 
 /* PCIe Bridge Phy and Controller Phy offsets */
 #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
@@ -31,6 +30,11 @@
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
@@ -79,7 +83,6 @@
 #define IMASK_HOST				0x188
 #define ISTATUS_HOST				0x18c
 #define IMSI_ADDR				0x190
-#define  MSI_ADDR				0x190
 #define ISTATUS_MSI				0x194
 
 /* PCIe Master table init defines */
@@ -158,8 +161,6 @@
 
 /* PCIe Config space MSI capability structure */
 #define MC_MSI_CAP_CTRL_OFFSET			0xe0u
-#define  MC_MSI_MAX_Q_AVAIL			(MC_NUM_MSI_IRQS_CODED << 1)
-#define  MC_MSI_Q_SIZE				(MC_NUM_MSI_IRQS_CODED << 4)
 
 /* Events */
 #define EVENT_PCIE_L2_EXIT			0
@@ -259,7 +260,7 @@ struct mc_msi {
 	struct irq_domain *dev_domain;
 	u32 num_vectors;
 	u64 vector_phy;
-	DECLARE_BITMAP(used, MC_NUM_MSI_IRQS);
+	DECLARE_BITMAP(used, MC_MAX_NUM_MSI_IRQS);
 };
 
 struct mc_pcie {
@@ -387,14 +388,14 @@ static void mc_pcie_enable_msi(struct mc_pcie *port, void __iomem *base)
 	struct mc_msi *msi = &port->msi;
 	u32 cap_offset = MC_MSI_CAP_CTRL_OFFSET;
 	u16 msg_ctrl = readw_relaxed(base + cap_offset + PCI_MSI_FLAGS);
+	u8 queue_size;
 
 	msg_ctrl |= PCI_MSI_FLAGS_ENABLE;
-	msg_ctrl &= ~PCI_MSI_FLAGS_QMASK;
-	msg_ctrl |= MC_MSI_MAX_Q_AVAIL;
+	/* Fixup PCI MSI queue flags */
+	queue_size = msg_ctrl & PCI_MSI_FLAGS_QMASK;
+	queue_size >>= 1;
 	msg_ctrl &= ~PCI_MSI_FLAGS_QSIZE;
-	msg_ctrl |= MC_MSI_Q_SIZE;
-	msg_ctrl |= PCI_MSI_FLAGS_64BIT;
-
+	msg_ctrl |= queue_size << 4;
 	writew_relaxed(msg_ctrl, base + cap_offset + PCI_MSI_FLAGS);
 
 	writel_relaxed(lower_32_bits(msi->vector_phy),
@@ -1103,6 +1104,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	struct mc_pcie *port;
 	void __iomem *bridge_base_addr;
 	int ret;
+	u32 val;
 
 	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
@@ -1123,12 +1125,24 @@ static int mc_platform_init(struct pci_config_window *cfg)
 
 	bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 
-	port->msi.vector_phy = MSI_ADDR;
-	port->msi.num_vectors = MC_NUM_MSI_IRQS;
+	/* Allow enabling MSI by disabling MSI-X */
+	val = readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
+	val &= ~MSIX_CAP_MASK;
+	writel(val, bridge_base_addr + PCIE_PCI_IRQ_DW0);
+
+	/* Pick num vectors from bitfile programmed onto FPGA fabric */
+	val = readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
+	val &= NUM_MSI_MSGS_MASK;
+	val >>= NUM_MSI_MSGS_SHIFT;
+
+	port->msi.num_vectors = 1 << val;
 
 	/* Hardware doesn't setup MSI by default */
 	mc_pcie_enable_msi(port, cfg->win);
 
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
