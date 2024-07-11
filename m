Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9313CC3DA41
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NP/lcnAlhBTIvKBbMEP9mlfn7hzzrWEOy1gkUil7v5c=; b=Xm7gBgIzqGBBge
	6XnVmAjoaNxGB7gPeCeVJnQlWI3wSGB8Nrd4ePg+sA4iSm+sqcsHJ/66AU+EgyUy0bYEU9w3oB0gH
	j2fsYvlyiZSXZ0xwDlEncALA654nF/4s/Z6MFmo9inUBUTVVGemf1kWZ7XHDb6I33AZ/UWJgYIGUu
	KpeHgBz3Uv4svlFW9CFVLxRgMcB5h0L1Pzgq4ib17SK9uWxyMYdLR6lA/x4mnrdTrAYwiu6L89j6Y
	lJuM5Xzh1L/v2IdiP+Bm9uTSdI4/uLzaBV+O49LF4V2Cvjxos8Tm6ZZAJtqTof8LP40VFKyhagnN8
	oDbqpz4eedmYMwFdhQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqxJ-0000000DW4K-01lt;
	Thu, 11 Jul 2024 10:23:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqxF-0000000DW2o-1fKz
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 10:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720693394; x=1752229394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=po6JcgW+HLlGJYh0A5KZZt8rZ8NAuWbj/QfkNLTnywM=;
  b=ddMBxoWLRkB9jYbz4OMlty/mkEgrMohpEXDKlk2siurlLk5NZw5N/Q1G
   QCsP6zpMNJxmgvWniKrWaeuyYxmzaqBtuvdhBTmJBdc7Tsd6pWszFj9/S
   iSDkyt2Ue+EaOmDuIvOTTNAfHDqwoSfnbbvY9BR1sh+hvfM61SLEwwmeY
   PzjdNS1efnCJpsODpoDd1RSPxV5Ej6h/WLy2eD1DY/8hgNvW3gLN0r2lm
   Kl9q68OE/6mGxF3huMDiRWVn2+Rvdj0w0EMuMusqrTfiLxebBJtd79ssa
   YfTBxyEGCooDOrX+FHeGAb2hp1fyFCK/V8bnCzGkoILJ51ZQjgjPMQ+iV
   g==;
X-CSE-ConnectionGUID: oE7M2H4IRp2wJBQtwWzi7w==
X-CSE-MsgGUID: 5bHCZ26dRpiZyX5hE7z5DQ==
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="29112248"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2024 03:23:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jul 2024 03:22:55 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Jul 2024 03:22:53 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 1/3] PCI: microchip: Fix outbound address translation tables
Date: Thu, 11 Jul 2024 11:22:17 +0100
Message-ID: <20240711102218.2895429-3-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240711102218.2895429-2-daire.mcnamara@microchip.com>
References: <20240711102218.2895429-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_032313_471414_8BD480D1 
X-CRM114-Status: GOOD (  13.33  )
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

On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
three general-purpose Fabric Interface Controller (FIC) buses that
encapsulate an AXI-M interface. That FIC is responsible for managing
the translations of the upper 32-bits of the AXI-M address. On MPFS,
the Root Port driver needs to take account of that outbound address
translation done by the parent FIC bus before setting up its own
outbound address translation tables.  In all cases on MPFS,
the remaining outbound address translation tables are 32-bit only.

Limit the outbound address translation tables to 32-bit only.

This necessitates changing a size_t in mc_pcie_setup_window
to a u64 to avoid a compile error on 32-bit platforms.

Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 137fb8570ba2..47c397ae515a 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -23,6 +23,8 @@
 /* Number of MSI IRQs */
 #define MC_MAX_NUM_MSI_IRQS			32
 
+#define MC_OUTBOUND_TRANS_TBL_MASK		GENMASK(31, 0)
+
 /* PCIe Bridge Phy and Controller Phy offsets */
 #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
 #define MC_PCIE1_CTRL_ADDR			0x0000a000u
@@ -933,7 +935,7 @@ static int mc_pcie_init_irq_domains(struct mc_pcie *port)
 
 static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
 				 phys_addr_t axi_addr, phys_addr_t pci_addr,
-				 size_t size)
+				 resource_size_t size)
 {
 	u32 atr_sz = ilog2(size) - 1;
 	u32 val;
@@ -983,7 +985,8 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 		if (resource_type(entry->res) == IORESOURCE_MEM) {
 			pci_addr = entry->res->start - entry->offset;
 			mc_pcie_setup_window(bridge_base_addr, index,
-					     entry->res->start, pci_addr,
+					     entry->res->start & MC_OUTBOUND_TRANS_TBL_MASK,
+					     pci_addr,
 					     resource_size(entry->res));
 			index++;
 		}
@@ -1117,9 +1120,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	int ret;
 
 	/* Configure address translation table 0 for PCIe config space */
-	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
-			     cfg->res.start,
-			     resource_size(&cfg->res));
+	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & MC_OUTBOUND_TRANS_TBL_MASK,
+			     0, resource_size(&cfg->res));
 
 	/* Need some fixups in config space */
 	mc_pcie_enable_msi(port, cfg->win);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
