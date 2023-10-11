Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AB5CD6E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF5FoehBNT57LwooQmCkh4uX2AYtezDTYBPrArUOors=; b=sURS+3bT8cJTOP
	Gimc1RaJFepEG7im1RoeIWVputp5H3Pnw0rwiIY7mRhHJPb1tdJNxplxoQqIgN7xn2Q5wFcFbiHNS
	YtyhdUE3DZq+TyygGvLkTjJXQgapA6hlmCH6RnEsxhq85vzq/TU8Td/OzrwqTgKNq0B7+r3oU/gQU
	EJxJISpiAT0ZQOxHXYP5UTtXansOQ5b0ysDQd2zo/9zguXa5sw4eH3qzGbyRRf392VrsFe/VZq0eb
	A33jYFP+cZlnjgdroXsOVfjRYp1cbFcachRnSqZGgn/eOhijZCRK0uApdVCH32T4yyBHEmZSdbv3N
	R2qXma/EZqtoPclJmpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqX37-00Fh6R-1H;
	Wed, 11 Oct 2023 11:06:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqX32-00Fgp7-2a
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:06:43 +0000
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by ex01.ufhost.com (Postfix) with ESMTP id 152EC24E32D;
	Wed, 11 Oct 2023 19:05:33 +0800 (CST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EE59824DEED;
	Wed, 11 Oct 2023 19:05:32 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 11 Oct
 2023 19:05:32 +0800
Received: from ubuntu.localdomain (183.27.96.95) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 11 Oct
 2023 19:05:31 +0800
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
Subject: [PATCH v8 19/22] PCI: plda: Add event interrupt codes and IRQ domain ops
Date: Wed, 11 Oct 2023 19:05:11 +0800
Message-ID: <20231011110514.107528-20-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231011110514.107528-1-minda.chen@starfivetech.com>
References: <20231011110514.107528-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.95]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_040641_156414_931278DC 
X-CRM114-Status: GOOD (  18.50  )
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

For PolarFire implements non-PLDA local interrupt events, most of
event interrupt process codes can not be re-used. PLDA implements
new codes and IRQ domain ops like PolarFire.

plda_get_events() adds interrupt register to event num mapping codes
for PLDA local event except DMA engine interrupt events. The DMA engine
interrupt events are implemented by vendors.

The codes basic logic is interrupt register and event num bi-direction
mapping. So draw a graph of interrupt register and event num
description.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/pci/controller/plda/pcie-plda-host.c | 105 ++++++++++++++++++-
 drivers/pci/controller/plda/pcie-plda.h      |  28 +++++
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
index 4a4a2b5ef8fb..4f2e4827bbf9 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -257,6 +257,106 @@ static irqreturn_t plda_event_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static u32 plda_get_events(struct plda_pcie_rp *port)
+{
+	u32 events, val, origin;
+
+	origin = readl_relaxed(port->bridge_addr + ISTATUS_LOCAL);
+
+	/* Error events and doorbell events */
+	events = (origin & ERROR_AND_DOORBELL_MASK) >> A_ATR_EVT_POST_ERR_SHIFT;
+
+	/* INTx events */
+	if (origin & PM_MSI_INT_INTX_MASK)
+		events |= BIT(EVENT_PM_MSI_INT_INTX);
+
+	/* MSI event and sys events */
+	val = (origin & SYS_AND_MSI_MASK) >> PM_MSI_INT_MSI_SHIFT;
+	events |= val << EVENT_PM_MSI_INT_MSI;
+
+	return events;
+}
+
+static u32 plda_hwirq_to_mask(int hwirq)
+{
+	u32 mask;
+
+	if (hwirq < EVENT_PM_MSI_INT_INTX)
+		mask = BIT(hwirq + A_ATR_EVT_POST_ERR_SHIFT);
+	else if (hwirq == EVENT_PM_MSI_INT_INTX)
+		mask = PM_MSI_INT_INTX_MASK;
+	else
+		mask = BIT(hwirq + PM_MSI_TO_MASK_OFFSET);
+
+	return mask;
+}
+
+static void plda_ack_event_irq(struct irq_data *data)
+{
+	struct plda_pcie_rp *port = irq_data_get_irq_chip_data(data);
+
+	writel_relaxed(plda_hwirq_to_mask(data->hwirq),
+		       port->bridge_addr + ISTATUS_LOCAL);
+}
+
+static void plda_mask_event_irq(struct irq_data *data)
+{
+	struct plda_pcie_rp *port = irq_data_get_irq_chip_data(data);
+	u32 mask, val;
+
+	mask = plda_hwirq_to_mask(data->hwirq);
+
+	raw_spin_lock(&port->lock);
+	val = readl_relaxed(port->bridge_addr + IMASK_LOCAL);
+	val &= ~mask;
+	writel_relaxed(val, port->bridge_addr + IMASK_LOCAL);
+	raw_spin_unlock(&port->lock);
+}
+
+static void plda_unmask_event_irq(struct irq_data *data)
+{
+	struct plda_pcie_rp *port = irq_data_get_irq_chip_data(data);
+	u32 mask, val;
+
+	mask = plda_hwirq_to_mask(data->hwirq);
+
+	raw_spin_lock(&port->lock);
+	val = readl_relaxed(port->bridge_addr + IMASK_LOCAL);
+	val |= mask;
+	writel_relaxed(val, port->bridge_addr + IMASK_LOCAL);
+	raw_spin_unlock(&port->lock);
+}
+
+static struct irq_chip plda_event_irq_chip = {
+	.name = "PLDA PCIe EVENT",
+	.irq_ack = plda_ack_event_irq,
+	.irq_mask = plda_mask_event_irq,
+	.irq_unmask = plda_unmask_event_irq,
+};
+
+static int plda_pcie_event_map(struct irq_domain *domain, unsigned int irq,
+			       irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &plda_event_irq_chip, handle_level_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops plda_evt_dom_ops = {
+	.map = plda_pcie_event_map,
+};
+
+static const struct plda_event_ops plda_event_ops = {
+	.get_events = plda_get_events,
+};
+
+struct plda_event plda_default_event = {
+	.event_ops		= &plda_event_ops,
+	.intx_event		= EVENT_PM_MSI_INT_INTX,
+	.msi_event		= EVENT_PM_MSI_INT_MSI
+};
+
 static void plda_handle_event(struct irq_desc *desc)
 {
 	struct plda_pcie_rp *port = irq_desc_get_handler_data(desc);
@@ -323,13 +423,16 @@ int plda_init_interrupts(struct platform_device *pdev,
 	int irq;
 	int i, intx_irq, msi_irq, event_irq;
 	int ret;
+	const struct irq_domain_ops *irq_dom_ops;
 
 	if (!event->event_ops || !event->event_ops->get_events) {
 		dev_err(dev, "no get events ops\n");
 		return -EINVAL;
 	}
 
-	ret = plda_pcie_init_irq_domains(port, event->domain_ops);
+	irq_dom_ops = event->domain_ops ?: &plda_evt_dom_ops;
+
+	ret = plda_pcie_init_irq_domains(port, irq_dom_ops);
 	if (ret) {
 		dev_err(dev, "failed creating IRQ domains\n");
 		return ret;
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index ce7787aef4b7..e0f8fd5ed46a 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -40,6 +40,7 @@
 #define  P_ATR_EVT_DISCARD_ERR_SHIFT		22
 #define  P_ATR_EVT_DOORBELL_MASK		0x00000000u
 #define  P_ATR_EVT_DOORBELL_SHIFT		23
+#define  ERROR_AND_DOORBELL_MASK		GENMASK(23, 16)
 #define  PM_MSI_INT_INTA_MASK			0x01000000u
 #define  PM_MSI_INT_INTA_SHIFT			24
 #define  PM_MSI_INT_INTB_MASK			0x02000000u
@@ -58,6 +59,7 @@
 #define  PM_MSI_INT_EVENTS_SHIFT		30
 #define  PM_MSI_INT_SYS_ERR_MASK		0x80000000u
 #define  PM_MSI_INT_SYS_ERR_SHIFT		31
+#define  SYS_AND_MSI_MASK			GENMASK(31, 28)
 #define  NUM_LOCAL_EVENTS			15
 #define ISTATUS_LOCAL				0x184
 #define IMASK_HOST				0x188
@@ -102,6 +104,32 @@
 #define EVENT_PM_MSI_INT_SYS_ERR		12
 #define NUM_PLDA_EVENTS				13
 
+/*
+ * PLDA local interrupt register
+ *
+ * 31         27     23              15           7          0
+ * +--+--+--+-+------+-+-+-+-+-+-+-+-+-----------+-----------+
+ * |12|11|10|9| intx |7|6|5|4|3|2|1|0| DMA error | DMA end   |
+ * +--+--+--+-+------+-+-+-+-+-+-+-+-+-----------+-----------+
+ * 0:  AXI post error
+ * 1:  AXI fetch error
+ * 2:  AXI discard error
+ * 3:  AXI doorbell
+ * 4:  PCIe post error
+ * 5:  PCIe fetch error
+ * 6:  PCIe discard error
+ * 7:  PCIe doorbell
+ * 8:  4 INTx interruts
+ * 9:  MSI interrupt
+ * 10: AER event
+ * 11: PM/LTR/Hotplug
+ * 12: System error
+ * DMA error : reserved for vendor implement
+ * DMA end : reserved for vendor implement
+ */
+
+#define PM_MSI_TO_MASK_OFFSET			19
+
 struct plda_pcie_rp;
 
 struct plda_event_ops {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
