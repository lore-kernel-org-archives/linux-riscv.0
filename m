Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAABC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZTvat/uV/uaPJkym6xfPBA+pUguBWWZ9lAwkOU8M/M=; b=15QN5mTdLDx0Uj
	nq3dQ2Fv+vYAjGzcJF3kE5WLD4ts4pCUnk8kD7n1IC3ACfqTm3sKA3TGux0xo2T2vSAisha3vkk4P
	FdnpuUD5LosPe7/TZQqcETGcHzFukHI861NYdqlu8ZJjixHqs+/MoJKX1uuVxsM58U/JkXWZ8bcUE
	QSj9V6Eteob+D8Yvrjbr+EicyExszieBXDANupPBl/ZrxNESk4LPg9m/CcU15/zcXJ6eVcSE6A0Vy
	95pATCu+r919ZGF4R2D+RZk7lB0AdeDHsIopdxa9szvLtLytMY6m04aKQbADVpvemO0PVpSluH+1z
	A4VsbN6HS5FV7XSK8PNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxnLS-005Cr3-0D;
	Tue, 31 Oct 2023 11:55:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxnLC-005CdC-1T
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 11:55:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8574924E311;
	Tue, 31 Oct 2023 19:54:42 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Oct
 2023 19:54:42 +0800
Received: from ubuntu.localdomain (113.72.146.247) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Oct
 2023 19:54:41 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Minda Chen
	<minda.chen@starfivetech.com>
Subject: [PATCH v10 11/20] PCI: microchip: Add num_events field to struct plda_pcie_rp
Date: Tue, 31 Oct 2023 19:54:21 +0800
Message-ID: <20231031115430.113586-12-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231031115430.113586-1-minda.chen@starfivetech.com>
References: <20231031115430.113586-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.247]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_045526_807917_1988D9EB 
X-CRM114-Status: GOOD (  14.69  )
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

The event num is different in other platform. For re-use interrupt
process codes, replace with variable.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/plda/pcie-microchip-host.c | 8 +++++---
 drivers/pci/controller/plda/pcie-plda.h           | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index 54a0d431a471..d42278c006bc 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -654,7 +654,7 @@ static void plda_handle_event(struct irq_desc *desc)
 
 	events = mc_get_events(port);
 
-	for_each_set_bit(bit, &events, NUM_EVENTS)
+	for_each_set_bit(bit, &events, port->num_events)
 		generic_handle_domain_irq(port->event_domain, bit);
 
 	chained_irq_exit(chip, desc);
@@ -817,7 +817,8 @@ static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
 		return -EINVAL;
 	}
 
-	port->event_domain = irq_domain_add_linear(pcie_intc_node, NUM_EVENTS,
+	port->event_domain = irq_domain_add_linear(pcie_intc_node,
+						   port->num_events,
 						   &mc_event_domain_ops, port);
 	if (!port->event_domain) {
 		dev_err(dev, "failed to get event domain\n");
@@ -920,7 +921,7 @@ static int plda_init_interrupts(struct platform_device *pdev, struct plda_pcie_r
 	if (irq < 0)
 		return -ENODEV;
 
-	for (i = 0; i < NUM_EVENTS; i++) {
+	for (i = 0; i < port->num_events; i++) {
 		event_irq = irq_create_mapping(port->event_domain, i);
 		if (!event_irq) {
 			dev_err(dev, "failed to map hwirq %d\n", i);
@@ -1012,6 +1013,7 @@ static int mc_host_probe(struct platform_device *pdev)
 
 	bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 	plda->bridge_addr = bridge_base_addr;
+	plda->num_events = NUM_EVENTS;
 
 	/* Allow enabling MSI by disabling MSI-X */
 	val = readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index 3deefd35fa5a..e3d35cef9894 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -118,6 +118,7 @@ struct plda_pcie_rp {
 	raw_spinlock_t lock;
 	struct plda_msi msi;
 	void __iomem *bridge_addr;
+	int num_events;
 };
 
 void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
