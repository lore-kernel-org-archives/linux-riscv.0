Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8575FC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6Chgtv154UNfAaCbDkKrk5I2bsjJnVfwShWWsU9BAE=; b=1qZSjXD9a2IVTO
	ORln1wN15KxMAPj5ecI7zC9UMQj0y6jXh5QEjv6UqcTeXa/w6uS+jcPQcVsvkU/bzim8puYorEjJq
	McWDQSyOOfXfWPIazuAb5ZFV9HPTYiNAOZGD/ZGDjnpacjTgcZAE4qVRIqCxPd/m4s2Ey7QnIoTBm
	Nr3wKfunD3UPtdU0TsAwUMHoBquPMUelLH2cC4BtXMuYhsvQolZU88dW2xLzhqh8bx/S9pc/4KzVt
	HzNymR5H2thWHBb50RozvWRCk/tAgBn1owcR2pZDOmEYj8cFWgtYZsnoQuxjmq4xTzi5dJ9sOTkZ8
	797G8FMnO+LC2dieq3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovItY-004Jm4-SG; Wed, 16 Nov 2022 13:56:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIt3-004JQS-GO
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 13:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668606933; x=1700142933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YW+Ic3szHI9xR0GV34+vZdYioxghthhZUaazNWwCVZU=;
  b=ExtSjn9jWEGylkTIoI1hEYFv2qEytTe9mio1F96pf7S7mXUAGKqK8i8z
   p51bxsEOmBURU9C0itRdiqhV4rvrqzJoxObYtjpehIXk0K6a7HVQTEJWp
   13578v6qeDrTT1x+mZnC4pVBDRx3zT5T3RypTizel7meddb5Gv/IuyQ2e
   aR2OQLEpb6F6Xtqy//r4gtW/Afw6nfjwVEA3lkSZ6Z5RxtwUXnpCuEnEH
   nWpsLsmRQlgbLZzxu1jlTLYncTw+ibSOQh2nHcQDqVlEaTbIgQnUadr5U
   EseEokbZMqAupczLwlzlPRyi4Rmc9PshiY/cgHm3txxKLqwAeS1T7LzBd
   A==;
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="123709461"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Nov 2022 06:55:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 16 Nov 2022 06:55:30 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 16 Nov 2022 06:55:27 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 6/9] PCI: microchip: Re-partition code between probe() and init()
Date: Wed, 16 Nov 2022 13:55:01 +0000
Message-ID: <20221116135504.258687-7-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116135504.258687-1-daire.mcnamara@microchip.com>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_055533_711622_19547A97 
X-CRM114-Status: GOOD (  16.37  )
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

Continuing to use pci_host_common_probe() for the PCIe root complex on
PolarFire SoC was leading to an extremely large _init() function and
some unnatural code flow. Re-partition so some tasks are done in
a _probe() routine, which calls pci_host_common_probe() and then use a
much smaller _init() function, mainly to enable interrupts after address
translation tables are set up.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 55 ++++++++++++++------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index faecf419ad6f..73856647f321 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -381,6 +381,8 @@ static struct {
 
 static char poss_clks[][5] = { "fic0", "fic1", "fic2", "fic3" };
 
+static struct mc_pcie *port;
+
 static void mc_pcie_fixup_ecam(struct mc_pcie *port, void __iomem *ecam)
 {
 	struct mc_msi *msi = &port->msi;
@@ -1095,7 +1097,34 @@ static int mc_platform_init(struct pci_config_window *cfg)
 {
 	struct device *dev = cfg->parent;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mc_pcie *port;
+	void __iomem *bridge_base_addr =
+		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
+	int ret;
+
+	/* Configure address translation table 0 for PCIe config space */
+	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
+			     cfg->res.start,
+			     resource_size(&cfg->res));
+
+	/* Need some fixups in config space */
+	mc_pcie_fixup_ecam(port, cfg->win);
+
+	/* Configure non-config space outbound ranges */
+	ret = mc_pcie_setup_windows(pdev, port);
+	if (ret)
+		return ret;
+
+	/* address translation is up; safe to enable interrupts */
+	ret = mc_init_interrupts(pdev, port);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mc_host_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	void __iomem *bridge_base_addr;
 	void __iomem *ctrl_base_addr;
 	int ret;
@@ -1104,13 +1133,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
-	port->dev = dev;
 
-	ret = mc_pcie_init_clks(dev);
-	if (ret) {
-		dev_err(dev, "failed to get clock resources, error %d\n", ret);
-		return -ENODEV;
-	}
+	port->dev = dev;
 
 	port->axi_base_addr = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(port->axi_base_addr))
@@ -1136,16 +1160,13 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	/* pick vector address from design */
 	port->msi.vector_phy = readl_relaxed(bridge_base_addr + IMSI_ADDR);
 
-	/* Configure Address Translation Table 0 for PCIe config space */
-	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
-			     cfg->res.start, resource_size(&cfg->res));
-
-	ret = mc_pcie_setup_windows(pdev, port);
-	if (ret)
-		return ret;
+	ret = mc_pcie_init_clks(dev);
+	if (ret) {
+		dev_err(dev, "failed to get clock resources, error %d\n", ret);
+		return -ENODEV;
+	}
 
-	/* address translation is up; safe to enable interrupts */
-	return mc_init_interrupts(pdev, port);
+	return pci_host_common_probe(pdev);
 }
 
 static const struct pci_ecam_ops mc_ecam_ops = {
@@ -1168,7 +1189,7 @@ static const struct of_device_id mc_pcie_of_match[] = {
 MODULE_DEVICE_TABLE(of, mc_pcie_of_match);
 
 static struct platform_driver mc_pcie_driver = {
-	.probe = pci_host_common_probe,
+	.probe = mc_host_probe,
 	.driver = {
 		.name = "microchip-pcie",
 		.of_match_table = mc_pcie_of_match,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
