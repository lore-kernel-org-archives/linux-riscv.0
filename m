Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAECEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LC3wmzB5ZcSk0KJhPUnIVO23lBv4odZzUFZK8pIGgh8=; b=Z3JKUJXopJeB32
	BrJMUhAO3Wlp1LKzYMS0PfUzWcAkfY6BM8mR5QZW8DIl2G3+CSCLhRO6B5LltF/G7cVrQ74I/BdeZ
	ulpl90NvNymnLLIxGrX2i/LEpIT6/FvzXT81C4qbysACCtvUgc6VB8nbof+RYfmduAA3TYHLhud00
	EXAmYUV9RxR/bMvvKfI2Qx/GiDGAGTDtr2mqvB6sTCjhVe4MJn7cIDZFry5UHBdXkN18K2sl4GnRv
	k51LT59y1uoTzM03ULJLXshPHBSxj5LccL0vx0aovOhmt86W7wiYgDa4vPbjVQhPIlnRAqH2cynlY
	cxgG3pADUb7JR6auHXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGNI-003yrB-39;
	Fri, 30 Jun 2023 15:49:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGNF-003ypE-2S
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 15:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688140169; x=1719676169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1oCatm2lA3eWUDmZs5GjcKbFyyVaBn4C2DspCHTW8Sc=;
  b=BP+x6nom68b9AJB1TsEImSSZDvZ+vEnylI0/q1mIBljgV9lFjdy8XvPn
   3FIvSthKOhGJ9TRkUsHh/SPwcBhMhc/XJFGvYyaGCrdJ73aEsmkkjmK5b
   YP+6ETeo8vrglyYhbKhQXDTvQRICVBxmqTAJKABCoz79CH0a+4Vq/Yh7g
   Ak+FG83lPxzMYuMra5pSUX1D0XhAn7qP6VdQFJLumMbD0nAmD5VeXaQsq
   9iQIYmApPRKW6UtoRGVMxQFemvrBLPELm4DtQ0JyNjlzv5bvCa5df46W1
   5Hju4VKBCeCCrBAAAhLkGuyXG6n2ay/rXe9bJa4aPu6T8OjQohtnMmcUK
   w==;
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="233133675"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2023 08:49:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 30 Jun 2023 08:49:19 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 30 Jun 2023 08:49:17 -0700
From: <daire.mcnamara@microchip.com>
To: <conor@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH v2 7/8] PCI: microchip: Rename and refactor mc_pcie_enable_msi()
Date: Fri, 30 Jun 2023 16:48:58 +0100
Message-ID: <20230630154859.2049521-8-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
References: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_084929_848899_ECDB3354 
X-CRM114-Status: GOOD (  12.39  )
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

After improving driver to get MSI-related information from
configuration registers (set at power on from the Libero FPGA
design), its now clear that mc_pcie_enable_msi() is not a good
name for this function.  The function is better named as
mc_pcie_fixup_ecam() as its purpose is to correct the queue
size of the MSI CAP CTRL.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 28 +++++++++++---------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 20ce21438a7e..5bb467de9cc5 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -383,25 +383,29 @@ static struct {
 
 static char poss_clks[][5] = { "fic0", "fic1", "fic2", "fic3" };
 
-static void mc_pcie_enable_msi(struct mc_pcie *port, void __iomem *base)
+static void mc_pcie_fixup_ecam(struct mc_pcie *port, void __iomem *ecam)
 {
 	struct mc_msi *msi = &port->msi;
-	u32 cap_offset = MC_MSI_CAP_CTRL_OFFSET;
-	u16 msg_ctrl = readw_relaxed(base + cap_offset + PCI_MSI_FLAGS);
+	u16 reg;
 	u8 queue_size;
 
-	msg_ctrl |= PCI_MSI_FLAGS_ENABLE;
+	/* Fixup MSI enable flag */
+	reg = readw_relaxed(ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
+	reg |= PCI_MSI_FLAGS_ENABLE;
+	writew_relaxed(reg, ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
+
 	/* Fixup PCI MSI queue flags */
-	queue_size = msg_ctrl & PCI_MSI_FLAGS_QMASK;
+	queue_size = reg & PCI_MSI_FLAGS_QMASK;
 	queue_size >>= 1;
-	msg_ctrl &= ~PCI_MSI_FLAGS_QSIZE;
-	msg_ctrl |= queue_size << 4;
-	writew_relaxed(msg_ctrl, base + cap_offset + PCI_MSI_FLAGS);
+	reg &= ~PCI_MSI_FLAGS_QSIZE;
+	reg |= queue_size << 4;
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
@@ -1137,8 +1141,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
 
 	port->msi.num_vectors = 1 << val;
 
-	/* Hardware doesn't setup MSI by default */
-	mc_pcie_enable_msi(port, cfg->win);
+	/* Need some fixups for MSI in config space */
+	mc_pcie_fixup_ecam(port, cfg->win);
 
 	/* Pick vector address from design */
 	port->msi.vector_phy = readl_relaxed(bridge_base_addr + IMSI_ADDR);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
