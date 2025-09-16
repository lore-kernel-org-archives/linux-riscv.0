Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81594CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUAUdhaaVpkPOzvgX05IQqflFZRzyzkmrXnThwmB3oc=; b=J9Pz3nuC8tCQGA
	CRbIV7s0qHYz27XQE9curCqZGewwtdfvgSROLSwaki4rYDhGaBbt6SaEz32uvgyTnGJ6aYfjqkMq5
	kmmWqBq36x3yi4nMFbA8Pmp5CFK7kODjM81cn0jdu/naHxYnFpaz+qOk2001BhN6wUOgACxiaKfdq
	Gz6BQd+sLLcFRqZ/hm97GWX4h1N5OT8looLu0TK1/Ahfo4zgoV/pW4M+YTMjogFZlDGFV/MqGhdJh
	VUSff/xiAn3b4UAiIcIXmLgXm2aiSg/+jrtJ6P0cJapNJ09Zu1CWbj2OrMNHbPFXm4b9lMWxmpzX+
	MgEFioQnjKfUnu+YL7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyT34-00000007YOM-3RTF;
	Tue, 16 Sep 2025 10:36:34 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyT32-00000007YNM-0tAa
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 10:36:33 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 58GA6w0V069110
	for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 18:06:58 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 58GA4SgF067801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 18:04:28 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Tue, 16 Sep 2025
 18:04:28 +0800
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
Subject: [PATCH v2 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver support
Date: Tue, 16 Sep 2025 18:04:16 +0800
Message-ID: <20250916100417.3036847-5-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916100417.3036847-1-randolph@andestech.com>
References: <20250916100417.3036847-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 58GA6w0V069110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_033632_568094_AA22A061 
X-CRM114-Status: GOOD (  24.65  )
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

Add driver support for DesignWare based PCIe controller in Andes
QiLai SoC. The driver only supports the Root Complex mode.

Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 drivers/pci/controller/dwc/Kconfig            |  16 ++
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-andes-qilai.c | 214 ++++++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-andes-qilai.c

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index ff6b6d9e18ec..6dc7af3dcea9 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -49,6 +49,22 @@ config PCIE_AMD_MDB
 	  DesignWare IP and therefore the driver re-uses the DesignWare
 	  core functions to implement the driver.
 
+config PCIE_ANDES_QILAI
+	bool "ANDES QiLai PCIe controller"
+	depends on OF && (RISCV || COMPILE_TEST)
+	depends on PCI_MSI
+	depends on ARCH_ANDES
+	select PCIE_DW_HOST
+	help
+          Say Y here to enable PCIe controller support on Andes QiLai SoCs,
+	  which operate in Root Complex mode. The Andes QiLai SoCs PCIe
+	  controller is based on DesignWare IP (5.97a version) and therefore
+	  the driver re-uses the DesignWare core functions to implement the
+	  driver. The Andes QiLai SoC has three Root Complexes (RCs): one
+	  operates on PCIe 4.0 with 4 lanes at 0x80000000, while the other
+	  two operate on PCIe 4.0 with 2 lanes at 0xA0000000 and 0xC0000000,
+	  respectively.
+
 config PCI_MESON
 	tristate "Amlogic Meson PCIe controller"
 	default m if ARCH_MESON
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index 6919d27798d1..de9583cbd675 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PCIE_DW_HOST) += pcie-designware-host.o
 obj-$(CONFIG_PCIE_DW_EP) += pcie-designware-ep.o
 obj-$(CONFIG_PCIE_DW_PLAT) += pcie-designware-plat.o
 obj-$(CONFIG_PCIE_AMD_MDB) += pcie-amd-mdb.o
+obj-$(CONFIG_PCIE_ANDES_QILAI) += pcie-andes-qilai.o
 obj-$(CONFIG_PCIE_BT1) += pcie-bt1.o
 obj-$(CONFIG_PCI_DRA7XX) += pci-dra7xx.o
 obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
diff --git a/drivers/pci/controller/dwc/pcie-andes-qilai.c b/drivers/pci/controller/dwc/pcie-andes-qilai.c
new file mode 100644
index 000000000000..c7f5dffa3e20
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-andes-qilai.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the PCIe Controller in QiLai from Andes
+ *
+ * Copyright (C) 2025 Andes Technology Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include "pcie-designware.h"
+
+#define PCIE_INTR_CONTROL1			0x15c
+#define PCIE_MSI_CTRL_INT_EN			BIT(28)
+
+#define PCIE_LOGIC_COHERENCY_CONTROL3		0x8e8
+
+/*
+ * Refer to Table A4-5 (Memory type encoding) in the
+ * AMBA AXI and ACE Protocol Specification.
+ * The selected value corresponds to the Memory type field:
+ * "Write-back, Read and Write-allocate".
+ */
+#define IOCP_ARCACHE				0b1111
+#define IOCP_AWCACHE				0b1111
+
+#define PCIE_CFG_MSTR_ARCACHE_MODE		GENMASK(6, 3)
+#define PCIE_CFG_MSTR_AWCACHE_MODE		GENMASK(14, 11)
+#define PCIE_CFG_MSTR_ARCACHE_VALUE		GENMASK(22, 19)
+#define PCIE_CFG_MSTR_AWCACHE_VALUE		GENMASK(30, 27)
+
+#define PCIE_GEN_CONTROL2			0x54
+#define PCIE_CFG_LTSSM_EN			BIT(0)
+
+#define PCIE_REGS_PCIE_SII_PM_STATE		0xc0
+#define SMLH_LINK_UP				BIT(6)
+#define RDLH_LINK_UP				BIT(7)
+#define PCIE_REGS_PCIE_SII_LINK_UP		(SMLH_LINK_UP | RDLH_LINK_UP)
+
+struct qilai_pcie {
+	struct dw_pcie pci;
+	struct platform_device *pdev;
+	void __iomem *apb_base;
+};
+
+#define to_qilai_pcie(_pci) container_of(_pci, struct qilai_pcie, pci)
+
+static
+bool qilai_pcie_outbound_atu_addr_valid(struct dw_pcie *pci,
+					const struct dw_pcie_ob_atu_cfg *atu,
+					u64 *limit_addr)
+{
+	u64 parent_bus_addr = atu->parent_bus_addr;
+
+	*limit_addr = parent_bus_addr + atu->size - 1;
+
+	/*
+	 * Addresses below 4 GB are not 1:1 mapped; therefore, range checks
+	 * only need to ensure addresses below 4 GB match pci->region_limit.
+	 */
+	if (lower_32_bits(*limit_addr & ~pci->region_limit) !=
+	    lower_32_bits(parent_bus_addr & ~pci->region_limit) ||
+	    !IS_ALIGNED(parent_bus_addr, pci->region_align) ||
+	    !IS_ALIGNED(atu->pci_addr, pci->region_align) || !atu->size)
+		return false;
+
+	return true;
+}
+
+static bool qilai_pcie_link_up(struct dw_pcie *pci)
+{
+	struct qilai_pcie *pcie = to_qilai_pcie(pci);
+	u32 val;
+
+	/* Read smlh & rdlh link up by checking debug port */
+	val = readl(pcie->apb_base + PCIE_REGS_PCIE_SII_PM_STATE);
+
+	return (val & PCIE_REGS_PCIE_SII_LINK_UP) == PCIE_REGS_PCIE_SII_LINK_UP;
+}
+
+static int qilai_pcie_start_link(struct dw_pcie *pci)
+{
+	struct qilai_pcie *pcie = to_qilai_pcie(pci);
+	u32 val;
+
+	val = readl(pcie->apb_base + PCIE_GEN_CONTROL2);
+	val |= PCIE_CFG_LTSSM_EN;
+	writel(val, pcie->apb_base + PCIE_GEN_CONTROL2);
+
+	return 0;
+}
+
+static const struct dw_pcie_ops qilai_pcie_ops = {
+	.outbound_atu_addr_valid = qilai_pcie_outbound_atu_addr_valid,
+	.link_up = qilai_pcie_link_up,
+	.start_link = qilai_pcie_start_link,
+};
+
+/*
+ * Setup the Qilai PCIe IOCP (IO Coherence Port) Read/Write Behaviors to the
+ * Write-Back, Read and Write Allocate mode.
+ * The IOCP HW target is SoC last-level cache (L2 Cache), which serves as the
+ * system cache.
+ * The IOCP HW helps maintain cache monitoring, ensuring that the device can
+ * snoop data from/to the cache.
+ */
+static void qilai_pcie_iocp_cache_setup(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u32 val;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	dw_pcie_read(pci->dbi_base + PCIE_LOGIC_COHERENCY_CONTROL3,
+		     sizeof(val), &val);
+	FIELD_MODIFY(PCIE_CFG_MSTR_ARCACHE_MODE, &val, IOCP_ARCACHE);
+	FIELD_MODIFY(PCIE_CFG_MSTR_AWCACHE_MODE, &val, IOCP_AWCACHE);
+	FIELD_MODIFY(PCIE_CFG_MSTR_ARCACHE_VALUE, &val, IOCP_ARCACHE);
+	FIELD_MODIFY(PCIE_CFG_MSTR_AWCACHE_VALUE, &val, IOCP_AWCACHE);
+	dw_pcie_write(pci->dbi_base + PCIE_LOGIC_COHERENCY_CONTROL3,
+		      sizeof(val), val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
+static void qilai_pcie_enable_msi(struct qilai_pcie *pcie)
+{
+	u32 val;
+
+	val = readl(pcie->apb_base + PCIE_INTR_CONTROL1);
+	val |= PCIE_MSI_CTRL_INT_EN;
+	writel(val, pcie->apb_base + PCIE_INTR_CONTROL1);
+}
+
+static int qilai_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qilai_pcie *pcie = to_qilai_pcie(pci);
+
+	qilai_pcie_enable_msi(pcie);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops qilai_pcie_host_ops = {
+	.init = qilai_pcie_host_init,
+};
+
+static int qilai_pcie_probe(struct platform_device *pdev)
+{
+	struct qilai_pcie *pcie;
+	struct dw_pcie *pci;
+	struct device *dev;
+	int ret;
+
+	pcie = devm_kzalloc(&pdev->dev, sizeof(*pcie), GFP_KERNEL);
+	if (!pcie)
+		return -ENOMEM;
+
+	pcie->pdev = pdev;
+	platform_set_drvdata(pdev, pcie);
+
+	pci = &pcie->pci;
+	dev = &pcie->pdev->dev;
+	pcie->pci.dev = dev;
+	pcie->pci.ops = &qilai_pcie_ops;
+	pcie->pci.pp.ops = &qilai_pcie_host_ops;
+	pci->use_parent_dt_ranges = true;
+
+	dw_pcie_cap_set(&pcie->pci, REQ_RES);
+
+	pcie->apb_base = devm_platform_ioremap_resource_byname(pdev, "apb");
+	if (IS_ERR(pcie->apb_base)) {
+		dev_err_probe(dev, ret, "Failed to Get APB registers.\n");
+		return PTR_ERR(pcie->apb_base);
+	}
+
+	ret = dw_pcie_host_init(&pcie->pci.pp);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to initialize PCIe host\n");
+		return ret;
+	}
+
+	qilai_pcie_iocp_cache_setup(&pcie->pci.pp);
+
+	return 0;
+}
+
+static const struct of_device_id qilai_pcie_of_match[] = {
+	{ .compatible = "andestech,qilai-pcie" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, qilai_pcie_of_match);
+
+static struct platform_driver qilai_pcie_driver = {
+	.probe = qilai_pcie_probe,
+	.driver = {
+		.name	= "qilai-pcie",
+		.of_match_table = qilai_pcie_of_match,
+		/* only test passed at PROBE_DEFAULT_STRATEGY */
+		.probe_type = PROBE_DEFAULT_STRATEGY,
+	},
+};
+
+builtin_platform_driver(qilai_pcie_driver);
+
+MODULE_AUTHOR("Randolph Lin <randolph@andestech.com>");
+MODULE_DESCRIPTION("Andes Qilai PCIe driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
