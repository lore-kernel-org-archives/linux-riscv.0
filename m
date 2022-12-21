Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27771C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMtWuPApu19Ep5F8PLzU2FTYNUn5sk8GumMpjCiOaGk=; b=lSDBRbEqEAJUJt
	Vu+Z8u+dp3eHY0S7vzaNYMUZQjsd5A4PMy5t5Bs0kuX7rYrM9SlIenFcsZhyvFjqzEPpuQYjyPsm1
	xoDiB6izhm07en9jkgrnm0JS///Xp6bt43mNaBoPKZtdZV5gWbTlVc2e3tIc9jylUuWmCtx4ZaJ7v
	CYMwzSSk8IzQh+YG+YXNEvLXRuMJ8tXQFeLegWt5W+DE7+QgIHVwCvk+VCiLff43y+byMfKPoaj9j
	eSOw4ZLkohnfOF49dNOiLassQKkJiVrazkMPoPdWW/19bnQC3T+H3lf9B9iaPYskdxfbPyhCu813C
	DBdf7SlpgBRPAY4rEGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81w6-00H1e8-8H; Wed, 21 Dec 2022 16:27:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81vl-00H1OZ-5x
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 16:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671640016; x=1703176016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EbHuonmv80yrCnrE6RXty7uLa0/DuwwYUQQWgcp+VNc=;
  b=GZooniEYbmpzllm5B224CDsNh+vO7ZyZ7H0k8ncFDweeXqrQxc0gqcL0
   ZFXyGSA+qKGuhZTLU3xQMMINeTO2UtWqkn0R0NTOmdZ6TiNixsg03NG2g
   C+eHqndgRdKqObt9uovpcje+DOHUbOSQiCtwcbYckVBYF/8e3NFr8+9P6
   W1FYO8V+5c/lz0Kq+UjSyrLrGghJm2v+8iiGkneUMmRXM3AZwx1ZPa4+5
   XY18eijxw0KvAibflzGr/b6plXFbDJnj31QI451SQxkZ1fIW/jNIrYftX
   +gCXc4zDx3dYSVztQ6P8vwdGQcGYhmQvNgdVQUrnCZRKnnOK3m5HHFvC5
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="192725229"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Dec 2022 09:26:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 21 Dec 2022 09:26:52 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 21 Dec 2022 09:26:49 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v2 6/9] PCI: microchip: Re-partition code between probe() and init()
Date: Wed, 21 Dec 2022 16:26:27 +0000
Message-ID: <20221221162630.3632486-7-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221162630.3632486-1-daire.mcnamara@microchip.com>
References: <20221221162630.3632486-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_082657_392621_EE99FFE0 
X-CRM114-Status: GOOD (  16.28  )
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

Continuing to use pci_host_common_probe() for the PCIe Root Complex on
PolarFire SoC was leading to an extremely large _init() function and
some unnatural code flow. Re-partition so some tasks are done in
a _probe() routine, which calls pci_host_common_probe() and then use a
much smaller _init() function, mainly to enable interrupts after address
translation tables are set up.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 55 ++++++++++++++------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 5fe282d04e81..2ba96d7f9095 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -383,6 +383,8 @@ static struct {
 
 static char poss_clks[][5] = { "fic0", "fic1", "fic2", "fic3" };
 
+static struct mc_pcie *port;
+
 static void mc_pcie_fixup_ecam(struct mc_pcie *port, void __iomem *ecam)
 {
 	struct mc_msi *msi = &port->msi;
@@ -1105,7 +1107,34 @@ static int mc_platform_init(struct pci_config_window *cfg)
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
+	/* Address translation is up; safe to enable interrupts */
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
 	int ret;
 	u32 val;
@@ -1113,13 +1142,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
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
@@ -1144,16 +1168,13 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	/* Pick vector address from design */
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
 
-	/* Address translation is up; safe to enable interrupts */
-	return mc_init_interrupts(pdev, port);
+	return pci_host_common_probe(pdev);
 }
 
 static const struct pci_ecam_ops mc_ecam_ops = {
@@ -1176,7 +1197,7 @@ static const struct of_device_id mc_pcie_of_match[] = {
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
