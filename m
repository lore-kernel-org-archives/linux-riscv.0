Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BAFC7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpkfZgIHY/j1Wy5rnaq4C+mebr5yOhW8GbwdnXAZNcQ=; b=bqsb8QR6ebjamY
	pB6d+4HXrbfQCgHRvUZnqVOtDQljQX/c4Y5q6CgkfSu840M/RGZBLdm7iDEujRpYHaFss7PgA7v31
	HRe0knvw4EoOpXU8zCZf3jrmCJ+3MOiRWiVRm8vlPIgwYI5ulh/IjEc6Losn1iQLAGWpvbvO5Muyi
	1WfVQB3SNBH61iAXx10bWfF2OlDdpCziK2GvEMq5+WnE20mImFOZove+dIcUrPL/dmapu/gYJHOrM
	6WoY5/NehopIpI6CgVgih41f96QhyYZb2aL7T4wN2erihBAFEAHTagfv23M9jKiltItUouVayr273
	MXNPGkmDhLwpfOLGsIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqnQ-0000000CPRK-0rsQ;
	Thu, 26 Jun 2025 17:54:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnv1-0000000C00z-443R;
	Thu, 26 Jun 2025 14:49:41 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efayX2kB19e/5fOKxvWIg5Uzbqjfs8VRJ75B0fwk9Gc=;
	b=CMq1Gxr5Pm9ZIdl+tCHNTj5Y8eDMa6aOMVaWCiah6HMWHVkoqypyaI4kBj2TVhLyHSJZJ8
	rKbbdzqWUe7rZAp/7qUj+Jv/rLXVqIlsbVD6O6fHnDVWdnkzaHTSXkHx0HptmbhvX+UrSY
	Eo4QmPYp0rwnRTMNenqkwXydEI2sAZIX6Jpn9BPXlgrQ9I/dY55qI/JI20zV9LYbDM/GPS
	tYhU5DmSC0blfhgyHAnJ5ZqIHdkkSsRtVxOTf1tilTSj5RD9uvTWZJqTJifnR8tB/uyNPw
	oSljTW5mHY1cR5EhI2gPmp5rSyGOMKpnSnlAfCuN2CxIN02tVhPHMsfhEXv0qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efayX2kB19e/5fOKxvWIg5Uzbqjfs8VRJ75B0fwk9Gc=;
	b=VrtZi3tDzFyI/vKrmM8P7d4h4FoLDKNKc8U1MNdg/bMGAjgPWvWTnKevlK7Ag39wgLEQGj
	lCAnFdnQjLWGZNBA==
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
Subject: [PATCH 10/12] irqchip/alpine-msi: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:07 +0200
Message-Id: <ec08fea004e7c3aa18c3f5657a8cafeb1adfcc1d.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074940_151654_2B1AC1BB 
X-CRM114-Status: GOOD (  14.39  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Move away from the legacy MSI domain setup, switch to use
msi_create_parent_irq_domain().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/Kconfig          |  1 +
 drivers/irqchip/irq-alpine-msi.c | 69 +++++++++++++-------------------
 2 files changed, 28 insertions(+), 42 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0d196e4471426..dbdb988e4f7e0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -85,6 +85,7 @@ config ALPINE_MSI
 	bool
 	depends on PCI
 	select PCI_MSI
+	select IRQ_MSI_LIB
 	select GENERIC_IRQ_CHIP
 
 config AL_FIC
diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 43d6db290138a..159d9ec7c0ddc 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -14,6 +14,7 @@
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -36,26 +37,6 @@ struct alpine_msix_data {
 	unsigned long	*msi_map;
 };
 
-static void alpine_msix_mask_msi_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void alpine_msix_unmask_msi_irq(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
-static struct irq_chip alpine_msix_irq_chip = {
-	.name			= "MSIx",
-	.irq_mask		= alpine_msix_mask_msi_irq,
-	.irq_unmask		= alpine_msix_unmask_msi_irq,
-	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_set_affinity	= irq_chip_set_affinity_parent,
-};
-
 static int alpine_msix_allocate_sgi(struct alpine_msix_data *priv, int num_req)
 {
 	int first;
@@ -88,12 +69,6 @@ static void alpine_msix_compose_msi_msg(struct irq_data *data, struct msi_msg *m
 	msg->data = 0;
 }
 
-static struct msi_domain_info alpine_msix_domain_info = {
-	.flags	= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_PCI_MSIX,
-	.chip	= &alpine_msix_irq_chip,
-};
-
 static struct irq_chip middle_irq_chip = {
 	.name			= "alpine_msix_middle",
 	.irq_mask		= irq_chip_mask_parent,
@@ -164,13 +139,35 @@ static void alpine_msix_middle_domain_free(struct irq_domain *domain, unsigned i
 }
 
 static const struct irq_domain_ops alpine_msix_middle_domain_ops = {
+	.select	= msi_lib_irq_domain_select,
 	.alloc	= alpine_msix_middle_domain_alloc,
 	.free	= alpine_msix_middle_domain_free,
 };
 
+#define ALPINE_MSI_FLAGS_REQUIRED  (MSI_FLAG_USE_DEF_DOM_OPS |		\
+				    MSI_FLAG_USE_DEF_CHIP_OPS |		\
+				    MSI_FLAG_PCI_MSI_MASK_PARENT)
+
+#define ALPINE_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |		\
+				    MSI_FLAG_PCI_MSIX)
+
+static struct msi_parent_ops alpine_msi_parent_ops = {
+	.supported_flags	= ALPINE_MSI_FLAGS_SUPPORTED,
+	.required_flags		= ALPINE_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.prefix			= "ALPINE-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
 static int alpine_msix_init_domains(struct alpine_msix_data *priv, struct device_node *node)
 {
-	struct irq_domain *middle_domain, *msi_domain, *gic_domain;
+	struct irq_domain_info info = {
+		.fwnode		= of_fwnode_handle(node),
+		.ops		= &alpine_msix_middle_domain_ops,
+		.host_data	= priv,
+	};
 	struct device_node *gic_node;
 
 	gic_node = of_irq_find_parent(node);
@@ -179,29 +176,17 @@ static int alpine_msix_init_domains(struct alpine_msix_data *priv, struct device
 		return -ENODEV;
 	}
 
-	gic_domain = irq_find_host(gic_node);
+	info.parent = irq_find_host(gic_node);
 	of_node_put(gic_node);
-	if (!gic_domain) {
+	if (!info.parent) {
 		pr_err("Failed to find the GIC domain\n");
 		return -ENXIO;
 	}
 
-	middle_domain = irq_domain_create_hierarchy(gic_domain, 0, 0, NULL,
-						    &alpine_msix_middle_domain_ops, priv);
-	if (!middle_domain) {
-		pr_err("Failed to create the MSIX middle domain\n");
-		return -ENOMEM;
-	}
-
-	msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(node),
-					       &alpine_msix_domain_info,
-					       middle_domain);
-	if (!msi_domain) {
+	if (!msi_create_parent_irq_domain(&info, &alpine_msi_parent_ops)) {
 		pr_err("Failed to create MSI domain\n");
-		irq_domain_remove(middle_domain);
 		return -ENOMEM;
 	}
-
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
