Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4566C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8y0zxd3my3XauTjrpMbSE7Rcmh8Kw9PeOPEoqCTUFU=; b=xIzuEWnIdzNUJO
	40QKGkDgqEGP5e4t7tX46bzHAQPC7NtBIw/CbDYHAacL6IC0OgpjbrhH/zvzB3SoxXmHaU3AJQWD+
	QYpsFNFyBSoPF0jm020k8294wu/NixTsDbF34LYvc5FflIKpM6bsf7DS1Tmmrtn/fHaHnXDULguM3
	/r9+gPs0l7+ikgvvZrJ27sf2d7/EsVYd4qYlhBaKuKgQje1ggH3eOOZp+Tkm0ZgAeDGHBErKUOCug
	SrvV75F/WI+qm9nvFR4KlCP9ABw3M1QJgXBM0XfCnNncE/HOtdwxNL7ENLu1UdoUx9WBIlt/1OOc5
	Wbkuqmqky2r1U7aQhcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUov4-0000000CBw0-0fBm;
	Thu, 26 Jun 2025 15:53:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnv3-0000000C020-1jBI;
	Thu, 26 Jun 2025 14:49:42 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIhKQ4RQQi3D5IJg+JFkYdGIygyIoXiLyEsOtUGkCjs=;
	b=RM5tpvvs+MbLl9f7SQ4Y4ZdLiJ6gkF0qGYmpFYd1vgciUYEome+/nKuo3y8YNQqaRl9zlG
	vK1suWMloNhESxrs+IfhZ0Ir0uq+WbbIHtZTJ2H8ZkutgRI3Yum3zAczYWNoJ3VR71Mex6
	fsgdiE+j3itHmBfek6RXeFNDcJE66HYbToqjerqVB4SG9GKNoyqLM6ubDDe3bIVCXzYX6C
	4Ix6zqpNBaIWk0L9nYtIJstz4x+qM9MLqKMPz+0eqHFX2bnBPOr8e8oaetpxb9aab4Myd+
	l22+2HQLy3/qGyN+ylhIfZaBxzJtN+2HcbXXw2XRaqbVdVinmwc752tr4tm6OQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIhKQ4RQQi3D5IJg+JFkYdGIygyIoXiLyEsOtUGkCjs=;
	b=3g8rK+mpfrVGe4Vw+aUfM9tHYiyJfZRoezDvLVA2kq5SNuyB89vV0NChva4wdm0ota7ehM
	z4hy2jp1szfWSsCw==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 12/12] irqchip/ls-scfg-msi: Switch to use msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:09 +0200
Message-Id: <6d23d93fa1f1e65526698f97c9888fa5d12abc7b.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074941_591389_509EFBE6 
X-CRM114-Status: GOOD (  12.54  )
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

Move away from the legacy MSI domain setup, switch to use
msi_create_parent_irq_domain().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-ls-scfg-msi.c | 49 ++++++++++++++-----------------
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index afd7bae30a788..f1aaf3a0fcdb0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -436,6 +436,7 @@ config LS_SCFG_MSI
 	def_bool y if SOC_LS1021A || ARCH_LAYERSCAPE
 	select IRQ_MSI_IOMMU
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 
 config PARTITION_PERCPU
 	bool
diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-msi.c
index 84bc5e4b47cf5..7eca751d6548b 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -14,6 +14,7 @@
 #include <linux/iommu.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
 #include <linux/of_pci.h>
@@ -47,7 +48,6 @@ struct ls_scfg_msi {
 	spinlock_t		lock;
 	struct platform_device	*pdev;
 	struct irq_domain	*parent;
-	struct irq_domain	*msi_domain;
 	void __iomem		*regs;
 	phys_addr_t		msiir_addr;
 	struct ls_scfg_msi_cfg	*cfg;
@@ -57,17 +57,18 @@ struct ls_scfg_msi {
 	unsigned long		*used;
 };
 
-static struct irq_chip ls_scfg_msi_irq_chip = {
-	.name = "MSI",
-	.irq_mask	= pci_msi_mask_irq,
-	.irq_unmask	= pci_msi_unmask_irq,
-};
-
-static struct msi_domain_info ls_scfg_msi_domain_info = {
-	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS |
-		   MSI_FLAG_USE_DEF_CHIP_OPS |
-		   MSI_FLAG_PCI_MSIX),
-	.chip	= &ls_scfg_msi_irq_chip,
+#define MPIC_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS | \
+				 MSI_FLAG_USE_DEF_CHIP_OPS)
+#define MPIC_MSI_FLAGS_SUPPORTED (MSI_FLAG_PCI_MSIX       | \
+				  MSI_GENERIC_FLAGS_MASK)
+
+static const struct msi_parent_ops ls_scfg_msi_parent_ops = {
+	.required_flags		= MPIC_MSI_FLAGS_REQUIRED,
+	.supported_flags	= MPIC_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.prefix			= "MSI-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
 static int msi_affinity_flag = 1;
@@ -185,6 +186,7 @@ static void ls_scfg_msi_domain_irq_free(struct irq_domain *domain,
 }
 
 static const struct irq_domain_ops ls_scfg_msi_domain_ops = {
+	.select	= msi_lib_irq_domain_select,
 	.alloc	= ls_scfg_msi_domain_irq_alloc,
 	.free	= ls_scfg_msi_domain_irq_free,
 };
@@ -214,21 +216,15 @@ static void ls_scfg_msi_irq_handler(struct irq_desc *desc)
 
 static int ls_scfg_msi_domains_init(struct ls_scfg_msi *msi_data)
 {
-	/* Initialize MSI domain parent */
-	msi_data->parent = irq_domain_create_linear(NULL,
-						    msi_data->irqs_num,
-						    &ls_scfg_msi_domain_ops,
-						    msi_data);
+	struct irq_domain_info info = {
+		.fwnode		= of_fwnode_handle(msi_data->pdev->dev.of_node),
+		.ops		= &ls_scfg_msi_domain_ops,
+		.host_data	= msi_data,
+		.size		= msi_data->irqs_num,
+	};
+
+	msi_data->parent = msi_create_parent_irq_domain(&info, &ls_scfg_msi_parent_ops);
 	if (!msi_data->parent) {
-		dev_err(&msi_data->pdev->dev, "failed to create IRQ domain\n");
-		return -ENOMEM;
-	}
-
-	msi_data->msi_domain = pci_msi_create_irq_domain(
-				of_fwnode_handle(msi_data->pdev->dev.of_node),
-				&ls_scfg_msi_domain_info,
-				msi_data->parent);
-	if (!msi_data->msi_domain) {
 		dev_err(&msi_data->pdev->dev, "failed to create MSI domain\n");
 		irq_domain_remove(msi_data->parent);
 		return -ENOMEM;
@@ -405,7 +401,6 @@ static void ls_scfg_msi_remove(struct platform_device *pdev)
 	for (i = 0; i < msi_data->msir_num; i++)
 		ls_scfg_msi_teardown_hwirq(&msi_data->msir[i]);
 
-	irq_domain_remove(msi_data->msi_domain);
 	irq_domain_remove(msi_data->parent);
 
 	platform_set_drvdata(pdev, NULL);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
