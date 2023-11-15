Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C59C07548
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mebndBBD0rrc5hTKYVp5MpMZGJDEG0S7urmFfV4/eG4=; b=xiugqfnYc/ye8R
	016j1qGHEwMJa7tzEhMJdzYFj7i3w/jJhs6jiV5wUYRIbQmtvRU+BQAJfAN59ZeTgiCexBmtSO0Qc
	Lsj3B05i0Ecv5vosFGc8D2Tuv+WFc3fY/cEAZ2GLo7hednSM/yWx9K5M8M94di/GvzuFNBFr0FQKO
	XAOLZM6jhouBrzDiNNemfVCgvhuFXt5bH7g8M5kuaoOJ9O701NoqcJaP1mMEr0jTS0Mv9cA8Shhj8
	N6KYlzOectoD26VjHyslZsyFC8NSc3tzaDHWrlYMxXQOzN1dR3RwrWeKQUl1W8K5FYIT6BuaIYMd5
	ys3uXMXJhFvAMRMM6UGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3EPz-000ham-1p;
	Wed, 15 Nov 2023 11:50:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3EPy-000hZT-0o
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Nov 2023 11:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4E7jLlyNWDykg4K0Hs29SedYGWNS9nQGvx9EcIrgOUQ=; b=bZU9jLoT8PCyit9E+LSeMsVPIA
	UoR8OuNpS6EHAzOX+PZXADZW7p4ureWZMt6R9bx13C96XzqrjF1C3ufW4LNeoGowXHrBFeLv+/5wA
	P+UrK+hU/4jdUfSXN1lTyZ91XuKf8jLc0tiKFYaurDzCsl6Lqkkxm7e7wopPpdUvAVvidjioa7XCX
	BN7fW2tRgEX3a2M8jQ22One6H71Z7/YOUpTesgAeN7CEUvED57WJSl39nJncWWVFm8tr9ce75BIwL
	vZPNOudwLEA/OnzIMTVL48336f5x9f8TD3eaedVxTNELFEuQrFM/zlvhouUya2OHIy/jz+q0GoQ45
	3g4b5a3A==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3EPs-003xyE-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 11:50:48 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A3F6F8008;
	Wed, 15 Nov 2023 19:49:26 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 19:49:26 +0800
Received: from ubuntu.localdomain (183.27.97.246) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 19:49:25 +0800
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
Subject: [PATCH v11 13/20] PCI: microchip: Add INTx and MSI event num to struct plda_event
Date: Wed, 15 Nov 2023 19:49:05 +0800
Message-ID: <20231115114912.71448-14-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231115114912.71448-1-minda.chen@starfivetech.com>
References: <20231115114912.71448-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.246]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_115045_409402_B6E8C145 
X-CRM114-Status: GOOD (  12.93  )
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

The INTx and MSI interrupt event num is different in Microchip and
StarFive platform.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/plda/pcie-microchip-host.c | 6 ++++--
 drivers/pci/controller/plda/pcie-plda.h           | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index f89d102f4979..2c03b0354f15 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -818,6 +818,8 @@ static int mc_request_event_irq(struct plda_pcie_rp *plda, int event_irq,
 
 static const struct plda_event mc_event = {
 	.request_event_irq = mc_request_event_irq,
+	.intx_event        = EVENT_LOCAL_PM_MSI_INT_INTX,
+	.msi_event         = EVENT_LOCAL_PM_MSI_INT_MSI,
 };
 
 static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
@@ -960,7 +962,7 @@ static int plda_init_interrupts(struct platform_device *pdev,
 	}
 
 	intx_irq = irq_create_mapping(port->event_domain,
-				      EVENT_LOCAL_PM_MSI_INT_INTX);
+				      event->intx_event);
 	if (!intx_irq) {
 		dev_err(dev, "failed to map INTx interrupt\n");
 		return -ENXIO;
@@ -970,7 +972,7 @@ static int plda_init_interrupts(struct platform_device *pdev,
 	irq_set_chained_handler_and_data(intx_irq, plda_handle_intx, port);
 
 	msi_irq = irq_create_mapping(port->event_domain,
-				     EVENT_LOCAL_PM_MSI_INT_MSI);
+				     event->msi_event);
 	if (!msi_irq)
 		return -ENXIO;
 
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index 28ed1374e1de..fba7343f9a96 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -124,6 +124,8 @@ struct plda_pcie_rp {
 struct plda_event {
 	int (*request_event_irq)(struct plda_pcie_rp *pcie,
 				 int event_irq, int event);
+	int intx_event;
+	int msi_event;
 };
 
 void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
