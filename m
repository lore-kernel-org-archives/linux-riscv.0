Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83101C38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjPNCCggEF6siZecN+n4uwgj8cjokC21p2O1MrgF2es=; b=M4KfIKiPx/wt0V
	hv3xdjJ48/yJNFWx2TzuzPUfW6vxMUcbHxzBlv6vFxGjoPIKfN659TbbtGCd8Q3b7iF4S/qR+Jl2L
	Ifrxb/QEGKR7EUjBEFR6Ao2cvqrwmK9Gq+SZ7Zd0Cb1omnX+3c8LJo5dyl07mzaq1tanwWYDVwMoJ
	GsC3AoeLHue2sVPQoc4hARv8UX7bGKKpATsG5FIPPq6N/zR2lJqJZGAx34D4t5NlY7qaiuDh2wSI6
	1wAE6tVrarthPCwNqMmgZJjK4ql/dwGDXwrqwjqmeibpiueqRD0PbWtyzJtAWm3OCPtXvpSRM5zel
	10XSyqj5vxHGpy2hM48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7ZA-005Vqr-Ox; Fri, 02 Sep 2022 14:22:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7Z8-005Vp2-42
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 14:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662128557; x=1693664557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Obajmxu5RArASYmlyf62HbTUThXup5Mw1+gmQJFUCgI=;
  b=d6YKtR98ssdpcbztL0CDFMuGi1gJNqiBFlswx8XMCILe/qGgfYPaH1zK
   xMQrYUeoUH71by4xBFYIMAv1nrM7FELwwYKzTqd5Ki6g1a+9V8mBC/4jQ
   O46HUjn+FwiQrAsykPDTTqoZj1aEuYSoKAIp1xkU2vG6VwXTOQjoCXLcA
   RovohpSHOw9URqfVJ+dvGveCIEK4egnTh7SYkw76G4CM3O18KBTv2BBRj
   OurQUvKaZT4euzE1hVYbhXqNMzofLyhY9M5RgVHu5wW1p6BNLIm6Fnl+u
   qTH2hjEQAH1IHGxcBlMy4rferrC4/6kbH6WSWAtUJZvO+RVYHQWeGjBL/
   A==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178942567"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 07:22:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 07:22:36 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 07:22:33 -0700
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
Subject: [PATCH v1 3/4] PCI: microchip: add fabric address translation properties
Date: Fri, 2 Sep 2022 15:22:01 +0100
Message-ID: <20220902142202.2437658-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_072238_246756_A3A6421A 
X-CRM114-Status: GOOD (  15.84  )
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

On PolarFire SoC both in- & out-bound address translations occur in two
stages. The specific translations are tightly coupled to the FPGA
designs and supplement the {dma-,}ranges properties. The first stage of
the translation is done by the FPGA fabric & the second by the root
port.
Use outbound address translation information so that the translation
tables in the root port's bridge layer can be configured to account for
any translation done by the FPGA fabric, for example,  on Icicle Kit
reference design.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 59 +++++++++++++++++---
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 7263d175b5ad..d78745eaa4b4 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -269,6 +269,8 @@ struct mc_pcie {
 	struct irq_domain *event_domain;
 	raw_spinlock_t lock;
 	struct mc_msi msi;
+	u32 num_outbound_ranges;
+	u64 outbound_range_adjustments[32];
 };
 
 struct cause {
@@ -964,6 +966,37 @@ static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
 	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
 }
 
+static void mc_pcie_parse_outbound_range_adjustments(struct mc_pcie *port, struct device_node *np)
+{
+	const __be32 *range;
+	int range_len, num_ranges, range_size, i;
+
+	range = of_get_property(np, "microchip,outbound-fabric-translation-ranges", &range_len);
+	if (!range)
+		return;
+
+	num_ranges = of_n_addr_cells(np);
+	range_size = range_len / sizeof(__be32) / num_ranges;
+
+	for (i = 0; i < num_ranges; i++, range += range_size) {
+		u64 pcieaddr = of_read_number(range + 1, 2);
+		u64 cpuaddr = of_read_number(range + 3, 2);
+
+		port->outbound_range_adjustments[i] = cpuaddr - pcieaddr;
+		port->num_outbound_ranges++;
+	}
+}
+
+static inline u64 mc_pcie_adjust_axi(struct mc_pcie *port, int index, u64 axi_addr)
+{
+	u64 offset = 0;
+
+	if (index < port->num_outbound_ranges)
+		offset = port->outbound_range_adjustments[index];
+
+	return axi_addr - offset;
+}
+
 static int mc_pcie_setup_windows(struct platform_device *pdev,
 				 struct mc_pcie *port)
 {
@@ -971,14 +1004,28 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
 	struct resource_entry *entry;
+	u64 axi_addr;
 	u64 pci_addr;
-	u32 index = 1;
+	u32 index = 0;
+	u32 num_outbound_ranges = 0;
+
+	resource_list_for_each_entry(entry, &bridge->windows) {
+		if (resource_type(entry->res) == IORESOURCE_MEM || resource_type(entry->res) == 0)
+			num_outbound_ranges++;
+	}
+
+	if (port->num_outbound_ranges && port->num_outbound_ranges != num_outbound_ranges) {
+		dev_err(&pdev->dev, "Mismatches in outbound range adjustment\n");
+		return -EINVAL;
+	}
 
 	resource_list_for_each_entry(entry, &bridge->windows) {
-		if (resource_type(entry->res) == IORESOURCE_MEM) {
+		if (resource_type(entry->res) == IORESOURCE_MEM || resource_type(entry->res) == 0) {
+			axi_addr = entry->res->start;
+			axi_addr = mc_pcie_adjust_axi(port, index, axi_addr);
 			pci_addr = entry->res->start - entry->offset;
 			mc_pcie_setup_window(bridge_base_addr, index,
-					     entry->res->start, pci_addr,
+					     axi_addr, pci_addr,
 					     resource_size(entry->res));
 			index++;
 		}
@@ -1005,6 +1052,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
 		return -ENOMEM;
 	port->dev = dev;
 
+	mc_pcie_parse_outbound_range_adjustments(port, dev->of_node);
+
 	ret = mc_pcie_init_clks(dev);
 	if (ret) {
 		dev_err(dev, "failed to get clock resources, error %d\n", ret);
@@ -1099,10 +1148,6 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	writel_relaxed(0, bridge_base_addr + IMASK_HOST);
 	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
 
-	/* Configure Address Translation Table 0 for PCIe config space */
-	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
-			     cfg->res.start, resource_size(&cfg->res));
-
 	return mc_pcie_setup_windows(pdev, port);
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
