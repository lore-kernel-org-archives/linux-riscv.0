Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0137C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4qcYcRNgSkpjXx9Z0m7FGJW/OY+Lv1FfsvZpcrarnQ=; b=SQIThFb9y7Y9mR
	udk7+/DORti7+u5OUoY8lrnJdt9aaIeOV0hoBSUKOyrZNmhXgXgdce92ppwB4HIqtt1wnTu22xNmI
	losLAyywsDdbiizKEJ1XD037xuXpnpdmj7wRDq3n6eCSFDLCBU/zrXb7b8OpwGVpIJaKvb+C/M41h
	Qjfng2UpSML/vwY8gs/Uo3SVu/XGyMRNdVAYs8HKEbIPv1koBP83TJdjskAFW93JKCFM5nzdggSWp
	QAlshLbEk44hRzs/eP3sIA6xM40ZSiuckBKfFj+3CCMC+ClcZOrN1W2jmTkrQFUbN9lExEZ8DCIvz
	y0p6idmGPkkqyGx8iH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcT3-00000008wV8-1qgG;
	Fri, 21 Jun 2024 11:30:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcSy-00000008wRe-0vuI
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 11:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718969404; x=1750505404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oFdeEmSZCx2CmTI24Mlau+qRlUsKvxGoVQk9WMKPt7Y=;
  b=atx5nxogPkAWWtrryGks2CTHleF05jgFth1+AMwPHir5zW92qW4HDsCt
   J2ylYBBBYEQPPROxe20ZMlhu8n+zCxuIZJmqP1GuFJd+r+mmAUcZ1u7/K
   qv2CHQiHeNlmkKMZ/2iIygXqgEJ5yG9uNx2OWc9EaQvIKB6nV7NuXnH9T
   1SpVe9pR6KFrXRp+ZYQdzNm0/ACtLfy006oXyoNzT4fF+i6Gw2uC/iYkW
   SDAelFO036pcSb19Ale2rz9kMZyD4hJGlvhOxD9WJHS6BHjesfJmYxRH+
   /TMPvxU7bZfs4AU1cF/mRlDVZOi+geyVkEehWZNy7isMpf/KSn+8iLEfF
   A==;
X-CSE-ConnectionGUID: OY1EIogCSZWH3lfFjfiKrA==
X-CSE-MsgGUID: u/x0nTPATFya386j9m2P9g==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="28970656"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 04:29:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 04:29:30 -0700
Received: from daire-X570.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 21 Jun 2024 04:29:28 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 1/3] PCI: microchip: Fix outbound address translation tables
Date: Fri, 21 Jun 2024 12:29:13 +0100
Message-ID: <20240621112915.3434402-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621112915.3434402-1-daire.mcnamara@microchip.com>
References: <20240621112915.3434402-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_043004_375350_CA26717D 
X-CRM114-Status: GOOD (  12.74  )
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

Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 137fb8570ba2..853adce24492 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -933,7 +933,7 @@ static int mc_pcie_init_irq_domains(struct mc_pcie *port)
 
 static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
 				 phys_addr_t axi_addr, phys_addr_t pci_addr,
-				 size_t size)
+				 u64 size)
 {
 	u32 atr_sz = ilog2(size) - 1;
 	u32 val;
@@ -983,7 +983,8 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 		if (resource_type(entry->res) == IORESOURCE_MEM) {
 			pci_addr = entry->res->start - entry->offset;
 			mc_pcie_setup_window(bridge_base_addr, index,
-					     entry->res->start, pci_addr,
+					     entry->res->start & 0xffffffff,
+					     pci_addr,
 					     resource_size(entry->res));
 			index++;
 		}
@@ -1117,9 +1118,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	int ret;
 
 	/* Configure address translation table 0 for PCIe config space */
-	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
-			     cfg->res.start,
-			     resource_size(&cfg->res));
+	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
+			     0, resource_size(&cfg->res));
 
 	/* Need some fixups in config space */
 	mc_pcie_enable_msi(port, cfg->win);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
