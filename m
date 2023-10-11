Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02F9CD6E5E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptQHo/py1LsLfBOtLGlAmuntXgU8bemo6CE5utbVBxw=; b=ue+/+ReIPMJWT6
	ER9j1KNF2YIFPXRAJZQABAqTSJRKBJkrMHl0DuZ5XZpZK6FB5Em/co5B08GaeTQRREyc+CwdK/e6S
	aBmm5Sx/TEPnlfPkHPQuhue8uf7+x5r+DTppU2hsr8meGp5RCoa5j4Y830zuNEgqAnKfKqXnXwuh5
	XMc8j72HaLqbbHOXxRJTBl+3g8oZELNom621bb+XdZVe/Zjqu1orcDzJpJkReQCRKY9Anh+gaWCSU
	gv6zqLLHir89sjOfCxTlxYZKmtQn6CE+TGQtcN6pAtoS7vpqoFExBbaWaqEKycvgj9i6ur0Hh6HVh
	lb2C9SwO8oARmS+Gc3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqX2d-00Fgce-1e;
	Wed, 11 Oct 2023 11:06:15 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqX2X-00FgVP-1q
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:06:11 +0000
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by ex01.ufhost.com (Postfix) with ESMTP id 6E3FA24E381;
	Wed, 11 Oct 2023 19:05:30 +0800 (CST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5795824DEED;
	Wed, 11 Oct 2023 19:05:30 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 11 Oct
 2023 19:05:30 +0800
Received: from ubuntu.localdomain (183.27.96.95) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 11 Oct
 2023 19:05:29 +0800
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
Subject: [PATCH v8 16/22] PCI: microchip: Add event IRQ domain ops to struct plda_event
Date: Wed, 11 Oct 2023 19:05:08 +0800
Message-ID: <20231011110514.107528-17-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231011110514.107528-1-minda.chen@starfivetech.com>
References: <20231011110514.107528-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.95]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_040609_902849_8E46D28A 
X-CRM114-Status: GOOD (  15.42  )
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

PolarFire Implements none-PLDA event interrupts. So the whole event
domain ops can not be re-used.
PLDA event domain ops instances will be implemented
in later patch.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/pci/controller/plda/pcie-microchip-host.c | 9 ++++++---
 drivers/pci/controller/plda/pcie-plda.h           | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index fca1520d56c9..2825c1f5563d 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -811,13 +811,15 @@ static const struct plda_event_ops mc_event_ops = {
 };
 
 static const struct plda_event mc_event = {
+	.domain_ops             = &mc_event_domain_ops,
 	.event_ops              = &mc_event_ops,
 	.request_event_irq      = mc_request_event_irq,
 	.intx_event             = EVENT_LOCAL_PM_MSI_INT_INTX,
 	.msi_event              = EVENT_LOCAL_PM_MSI_INT_MSI,
 };
 
-static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
+static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port,
+				      const struct irq_domain_ops *ops)
 {
 	struct device *dev = port->dev;
 	struct device_node *node = dev->of_node;
@@ -831,7 +833,8 @@ static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
 	}
 
 	port->event_domain = irq_domain_add_linear(pcie_intc_node, port->num_events,
-						   &mc_event_domain_ops, port);
+						   ops, port);
+
 	if (!port->event_domain) {
 		dev_err(dev, "failed to get event domain\n");
 		of_node_put(pcie_intc_node);
@@ -930,7 +933,7 @@ static int plda_init_interrupts(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	ret = plda_pcie_init_irq_domains(port);
+	ret = plda_pcie_init_irq_domains(port, event->domain_ops);
 	if (ret) {
 		dev_err(dev, "failed creating IRQ domains\n");
 		return ret;
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index 6571a4befac9..080932cbe8c4 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -129,6 +129,7 @@ struct plda_pcie_rp {
 };
 
 struct plda_event {
+	const struct irq_domain_ops *domain_ops;
 	const struct plda_event_ops *event_ops;
 	int (*request_event_irq)(struct plda_pcie_rp *pcie,
 				 int event_irq, int event);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
