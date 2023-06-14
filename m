Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDFFEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+5igPEQ8lzDZ9k8cbogvcuz5wYWYGppLhdi9kjW7xc=; b=gbIHkR0W2Fk0N1
	PGVlvUjGr6HhQB/l+WGdbBiPxMsDx8bI04TayEBhQvPWaZJSkP+wWMZbOudQPzRuqDdaO3c+pygMF
	riVehxBQr69ncrXyjMOC8F72OH8TyDFvRqvEaqxWPvmuhLwKKH8ynZJawi9kU+NSExe4L5PsVgJ+U
	tS1v+ynlDmdpVdP4X6q1b6aFZHxHGHfqoK17P2DvUXOxZhp37Jwaj/zCmxocZXVCgZa3TXeNDFNWs
	BBbFtuH6lGWgBfyx/fZn6GrQyfQZKLVapkEFQUz+5r38v6UYbpa2HLtPpV2tphbAM0abYa49P1QQ1
	l+ntQdhOtoMTu8PBtKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Sr7-00C8O9-0s;
	Wed, 14 Jun 2023 15:56:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Sr0-00C8K8-1R
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 15:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686758174; x=1718294174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u8TV9mXCtw966AkKCyV+JI7CAHPwslqmyDM5t6gJDWc=;
  b=SO6H4YCz+vlcEAO+xeCishMtax3viE1DrVodO2lBLl2QrPCYjz9M/YYU
   hNVTLfHq8mAumLH2Zr3NeSU48acuETxU23dAk/Hb2zvUxNVRN/adgSHbR
   2G2fbuq2FxhtF3VZ6F1b89E3hR7PkJ0AiQybIKHENOfmTLBcrlLKwUOD9
   HcrxRGeGkhWnmFac7i8Kls4lITJH93GRnzc8fDH8jiMMn/pLNxLhrFJxS
   FyFM2DIwLBOOYXn6nJXTff/TsN1nNEK44sjhVbvlaZfw7Ffcu8Dov51/+
   nM3WuOfxCtLYgeMZ7sOZLc0fXLOyk5sXyqCTvtZ8rT8FPsgHVSBAyZbJB
   A==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="230124320"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2023 08:56:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 08:56:12 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 14 Jun 2023 08:56:11 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 6/8] PCI: microchip: Clean up initialisation of interrupts
Date: Wed, 14 Jun 2023 16:55:54 +0100
Message-ID: <20230614155556.4095526-7-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
References: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_085614_551947_B0ECB773 
X-CRM114-Status: GOOD (  16.72  )
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

Refactor interrupt handling in _init() function into
disable_interrupts(), init_interrupts(), clear_sec_errors() and clear
ded_errors().  It was unwieldy and prone to bugs. Then clearly disable
interrupts as soon as possible and only enable interrupts after address
translation is setup to prevent spurious axi2pcie and pcie2axi
translation errors being reported

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 156 ++++++++++++-------
 1 file changed, 100 insertions(+), 56 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 444ba99b070b..751f0243deb4 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -112,6 +112,7 @@
 #define  SEC_ERROR_INT_RX_RAM_SEC_ERR_INT	GENMASK(7, 4)
 #define  SEC_ERROR_INT_PCIE2AXI_RAM_SEC_ERR_INT	GENMASK(11, 8)
 #define  SEC_ERROR_INT_AXI2PCIE_RAM_SEC_ERR_INT	GENMASK(15, 12)
+#define  SEC_ERROR_INT_ALL_RAM_SEC_ERR_INT	GENMASK(15, 0)
 #define  NUM_SEC_ERROR_INTS			(4)
 #define SEC_ERROR_INT_MASK			0x2c
 #define DED_ERROR_INT				0x30
@@ -119,6 +120,7 @@
 #define  DED_ERROR_INT_RX_RAM_DED_ERR_INT	GENMASK(7, 4)
 #define  DED_ERROR_INT_PCIE2AXI_RAM_DED_ERR_INT	GENMASK(11, 8)
 #define  DED_ERROR_INT_AXI2PCIE_RAM_DED_ERR_INT	GENMASK(15, 12)
+#define  DED_ERROR_INT_ALL_RAM_DED_ERR_INT	GENMASK(15, 0)
 #define  NUM_DED_ERROR_INTS			(4)
 #define DED_ERROR_INT_MASK			0x34
 #define ECC_CONTROL				0x38
@@ -992,39 +994,73 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 	return 0;
 }
 
-static int mc_platform_init(struct pci_config_window *cfg)
+static inline void mc_clear_secs(struct mc_pcie *port)
 {
-	struct device *dev = cfg->parent;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct mc_pcie *port;
-	void __iomem *bridge_base_addr;
-	void __iomem *ctrl_base_addr;
-	int ret;
-	int irq;
-	int i, intx_irq, msi_irq, event_irq;
+	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
+
+	writel_relaxed(SEC_ERROR_INT_ALL_RAM_SEC_ERR_INT, ctrl_base_addr +
+		       SEC_ERROR_INT);
+	writel_relaxed(0, ctrl_base_addr + SEC_ERROR_EVENT_CNT);
+}
+
+static inline void mc_clear_deds(struct mc_pcie *port)
+{
+	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
+
+	writel_relaxed(DED_ERROR_INT_ALL_RAM_DED_ERR_INT, ctrl_base_addr +
+		       DED_ERROR_INT);
+	writel_relaxed(0, ctrl_base_addr + DED_ERROR_EVENT_CNT);
+}
+
+static void mc_disable_interrupts(struct mc_pcie *port)
+{
+	void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
+	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
 	u32 val;
-	int err;
 
-	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
-	if (!port)
-		return -ENOMEM;
-	port->dev = dev;
+	/* Ensure ECC bypass is enabled */
+	val = ECC_CONTROL_TX_RAM_ECC_BYPASS |
+	      ECC_CONTROL_RX_RAM_ECC_BYPASS |
+	      ECC_CONTROL_PCIE2AXI_RAM_ECC_BYPASS |
+	      ECC_CONTROL_AXI2PCIE_RAM_ECC_BYPASS;
+	writel_relaxed(val, ctrl_base_addr + ECC_CONTROL);
 
-	ret = mc_pcie_init_clks(dev);
-	if (ret) {
-		dev_err(dev, "failed to get clock resources, error %d\n", ret);
-		return -ENODEV;
-	}
+	/* Disable SEC errors and clear any outstanding */
+	writel_relaxed(SEC_ERROR_INT_ALL_RAM_SEC_ERR_INT, ctrl_base_addr +
+		       SEC_ERROR_INT_MASK);
+	mc_clear_secs(port);
 
-	port->axi_base_addr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(port->axi_base_addr))
-		return PTR_ERR(port->axi_base_addr);
+	/* Disable DED errors and clear any outstanding */
+	writel_relaxed(DED_ERROR_INT_ALL_RAM_DED_ERR_INT, ctrl_base_addr +
+		       DED_ERROR_INT_MASK);
+	mc_clear_deds(port);
 
-	bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
-	ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
+	/* Disable local interrupts and clear any outstanding */
+	writel_relaxed(0, bridge_base_addr + IMASK_LOCAL);
+	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_LOCAL);
+	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_MSI);
+
+	/* Disable PCIe events and clear any outstanding */
+	val = PCIE_EVENT_INT_L2_EXIT_INT |
+	      PCIE_EVENT_INT_HOTRST_EXIT_INT |
+	      PCIE_EVENT_INT_DLUP_EXIT_INT |
+	      PCIE_EVENT_INT_L2_EXIT_INT_MASK |
+	      PCIE_EVENT_INT_HOTRST_EXIT_INT_MASK |
+	      PCIE_EVENT_INT_DLUP_EXIT_INT_MASK;
+	writel_relaxed(val, ctrl_base_addr + PCIE_EVENT_INT);
+
+	/* Disable host interrupts and clear any outstanding */
+	writel_relaxed(0, bridge_base_addr + IMASK_HOST);
+	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
+}
+
+static int mc_init_interrupts(struct platform_device *pdev, struct mc_pcie *port)
+{
+	struct device *dev = &pdev->dev;
+	int irq;
+	int i, intx_irq, msi_irq, event_irq;
+	int ret;
 
-	port->msi.vector_phy = MSI_ADDR;
-	port->msi.num_vectors = MC_NUM_MSI_IRQS;
 	ret = mc_pcie_init_irq_domains(port);
 	if (ret) {
 		dev_err(dev, "failed creating IRQ domains\n");
@@ -1042,11 +1078,11 @@ static int mc_platform_init(struct pci_config_window *cfg)
 			return -ENXIO;
 		}
 
-		err = devm_request_irq(dev, event_irq, mc_event_handler,
+		ret = devm_request_irq(dev, event_irq, mc_event_handler,
 				       0, event_cause[i].sym, port);
-		if (err) {
+		if (ret) {
 			dev_err(dev, "failed to request IRQ %d\n", event_irq);
-			return err;
+			return ret;
 		}
 	}
 
@@ -1071,44 +1107,52 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	/* Plug the main event chained handler */
 	irq_set_chained_handler_and_data(irq, mc_handle_event, port);
 
-	/* Hardware doesn't setup MSI by default */
-	mc_pcie_enable_msi(port, cfg->win);
+	return 0;
+}
 
-	val = readl_relaxed(bridge_base_addr + IMASK_LOCAL);
-	val |= PM_MSI_INT_INTX_MASK;
-	writel_relaxed(val, bridge_base_addr + IMASK_LOCAL);
+static int mc_platform_init(struct pci_config_window *cfg)
+{
+	struct device *dev = cfg->parent;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mc_pcie *port;
+	void __iomem *bridge_base_addr;
+	int ret;
 
-	writel_relaxed(val, ctrl_base_addr + ECC_CONTROL);
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+	port->dev = dev;
 
-	val = PCIE_EVENT_INT_L2_EXIT_INT |
-	      PCIE_EVENT_INT_HOTRST_EXIT_INT |
-	      PCIE_EVENT_INT_DLUP_EXIT_INT;
-	writel_relaxed(val, ctrl_base_addr + PCIE_EVENT_INT);
+	ret = mc_pcie_init_clks(dev);
+	if (ret) {
+		dev_err(dev, "failed to get clock resources, error %d\n", ret);
+		return -ENODEV;
+	}
 
-	val = SEC_ERROR_INT_TX_RAM_SEC_ERR_INT |
-	      SEC_ERROR_INT_RX_RAM_SEC_ERR_INT |
-	      SEC_ERROR_INT_PCIE2AXI_RAM_SEC_ERR_INT |
-	      SEC_ERROR_INT_AXI2PCIE_RAM_SEC_ERR_INT;
-	writel_relaxed(val, ctrl_base_addr + SEC_ERROR_INT);
-	writel_relaxed(0, ctrl_base_addr + SEC_ERROR_INT_MASK);
-	writel_relaxed(0, ctrl_base_addr + SEC_ERROR_EVENT_CNT);
+	port->axi_base_addr = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(port->axi_base_addr))
+		return PTR_ERR(port->axi_base_addr);
 
-	val = DED_ERROR_INT_TX_RAM_DED_ERR_INT |
-	      DED_ERROR_INT_RX_RAM_DED_ERR_INT |
-	      DED_ERROR_INT_PCIE2AXI_RAM_DED_ERR_INT |
-	      DED_ERROR_INT_AXI2PCIE_RAM_DED_ERR_INT;
-	writel_relaxed(val, ctrl_base_addr + DED_ERROR_INT);
-	writel_relaxed(0, ctrl_base_addr + DED_ERROR_INT_MASK);
-	writel_relaxed(0, ctrl_base_addr + DED_ERROR_EVENT_CNT);
+	mc_disable_interrupts(port);
 
-	writel_relaxed(0, bridge_base_addr + IMASK_HOST);
-	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
+	bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
+
+	port->msi.vector_phy = MSI_ADDR;
+	port->msi.num_vectors = MC_NUM_MSI_IRQS;
+
+	/* Hardware doesn't setup MSI by default */
+	mc_pcie_enable_msi(port, cfg->win);
 
 	/* Configure Address Translation Table 0 for PCIe config space */
 	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
 			     cfg->res.start, resource_size(&cfg->res));
 
-	return mc_pcie_setup_windows(pdev, port);
+	ret = mc_pcie_setup_windows(pdev, port);
+	if (ret)
+		return ret;
+
+	/* Address translation is up; safe to enable interrupts */
+	return mc_init_interrupts(pdev, port);
 }
 
 static const struct pci_ecam_ops mc_ecam_ops = {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
