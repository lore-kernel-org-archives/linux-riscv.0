Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C271BC7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdKO2hsGu38Geo8eMVda3sv201UKGo+FnhmBD3jL5qI=; b=XpuwV+z6gVkIni
	1kdfM3gjaozDRe4R3IQKqNgIgeEs83U3Yvrlk9xzOgkdLqpaJkdfGtdaRAS3okMpkIRRuJ022TV/J
	i51tOy5vJDhYfr3X7einggK4Z6QRkonsnF0o/f93rUw+tXLb0SdwiOlsr+Dh1uEmpZ2C3W2tOqAzC
	IvLjuXOxUTK+CyRifa8Atj86DYWHXqPFfgQny4cALjDgqc1snCx8L9HYT26Iy4LR9VryzEGCtAsKr
	qOkRDAHPT3oeuINx1bcNIp2ebpXRKX9WqcvSoZvIEHF+cTSag5Ihu75cketvBM381B9SAI8H3h0Fp
	zZJ3BpIOPsQaLu3FvuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUosm-0000000CBdb-3XLc;
	Thu, 26 Jun 2025 15:51:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnv2-0000000C01V-1VdD;
	Thu, 26 Jun 2025 14:49:41 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/srjJS8SpdA7rae21v1b2OCu0wY7FvRZqCovg9jsm+4=;
	b=0L9sJ+J0lGMHXi9sXXwJ6qVdupzww1GZ/fr8SasVb+ZcNdO1UiV303eM9JPEyD5GF+PGwn
	BXMJT6cl+FxmcwI4VhiSONWCOz0v2Y7IzOYSGlwhKdw/GliGm3UzFlyKnwKe1OW+tMsHHw
	RfI2PWuxS0CIWu2x6OIpoTCqrZMmsi1XdcQ+TSfRCRx4GhZQleagG6TIDmb8sV6LAwBjuG
	sprTujt2C50JqstWLsakWZZh2ZUUdZVSeAf7b+KR//LnVfluLpfXjnZh/4v2bYWXSE+eH3
	hHMdfDRHdJj3nUPd5iRQ3X+ZGiUQczxjPZyprFi4YddPk5fNejsxrlo28b/kQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/srjJS8SpdA7rae21v1b2OCu0wY7FvRZqCovg9jsm+4=;
	b=sbfSD0BWvrAgRhBcegRlcQqgCXdpvvHxqZy65JoSiK8oLqw2C8NkyA+pbt0BNkqMlkxEAj
	mct9Qnkaw/gXlwBQ==
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
Subject: [PATCH 11/12] irqchip/armada-370-xp: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:08 +0200
Message-Id: <976892e3ce64fcf52387833abee08ddfa47d2a82.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074940_673581_88CCAA83 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/Kconfig             |  1 +
 drivers/irqchip/irq-armada-370-xp.c | 48 +++++++++++++++--------------
 2 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index dbdb988e4f7e0..afd7bae30a788 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -79,6 +79,7 @@ config ARMADA_370_XP_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
 	select PCI_MSI if PCI
+	select IRQ_MSI_LIB if PCI
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config ALPINE_MSI
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index 67b672a788626..a44c49e985b75 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/cpu.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
@@ -156,7 +157,6 @@
  * @parent_irq:		parent IRQ if MPIC is not top-level interrupt controller
  * @domain:		MPIC main interrupt domain
  * @ipi_domain:		IPI domain
- * @msi_domain:		MSI domain
  * @msi_inner_domain:	MSI inner domain
  * @msi_used:		bitmap of used MSI numbers
  * @msi_lock:		mutex serializing access to @msi_used
@@ -176,7 +176,6 @@ struct mpic {
 	struct irq_domain *ipi_domain;
 #endif
 #ifdef CONFIG_PCI_MSI
-	struct irq_domain *msi_domain;
 	struct irq_domain *msi_inner_domain;
 	DECLARE_BITMAP(msi_used, PCI_MSI_FULL_DOORBELL_NR);
 	struct mutex msi_lock;
@@ -234,18 +233,6 @@ static void mpic_irq_unmask(struct irq_data *d)
 
 #ifdef CONFIG_PCI_MSI
 
-static struct irq_chip mpic_msi_irq_chip = {
-	.name		= "MPIC MSI",
-	.irq_mask	= pci_msi_mask_irq,
-	.irq_unmask	= pci_msi_unmask_irq,
-};
-
-static struct msi_domain_info mpic_msi_domain_info = {
-	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
-	.chip	= &mpic_msi_irq_chip,
-};
-
 static void mpic_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 {
 	unsigned int cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
@@ -314,6 +301,7 @@ static void mpic_msi_free(struct irq_domain *domain, unsigned int virq, unsigned
 }
 
 static const struct irq_domain_ops mpic_msi_domain_ops = {
+	.select	= msi_lib_irq_domain_select,
 	.alloc	= mpic_msi_alloc,
 	.free	= mpic_msi_free,
 };
@@ -331,6 +319,21 @@ static void mpic_msi_reenable_percpu(struct mpic *mpic)
 	writel(1, mpic->per_cpu + MPIC_INT_CLEAR_MASK);
 }
 
+#define MPIC_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS | \
+				 MSI_FLAG_USE_DEF_CHIP_OPS)
+#define MPIC_MSI_FLAGS_SUPPORTED (MSI_FLAG_MULTI_PCI_MSI  | \
+				  MSI_FLAG_PCI_MSIX       | \
+				  MSI_GENERIC_FLAGS_MASK)
+
+static const struct msi_parent_ops mpic_msi_parent_ops = {
+	.required_flags		= MPIC_MSI_FLAGS_REQUIRED,
+	.supported_flags	= MPIC_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.prefix			= "MPIC-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
 static int __init mpic_msi_init(struct mpic *mpic, struct device_node *node,
 				phys_addr_t main_int_phys_base)
 {
@@ -348,17 +351,16 @@ static int __init mpic_msi_init(struct mpic *mpic, struct device_node *node,
 		mpic->msi_doorbell_mask = PCI_MSI_FULL_DOORBELL_MASK;
 	}
 
-	mpic->msi_inner_domain = irq_domain_create_linear(NULL, mpic->msi_doorbell_size,
-						       &mpic_msi_domain_ops, mpic);
-	if (!mpic->msi_inner_domain)
-		return -ENOMEM;
+	struct irq_domain_info info = {
+		.fwnode		= of_fwnode_handle(node),
+		.ops		= &mpic_msi_domain_ops,
+		.host_data	= mpic,
+		.size		= mpic->msi_doorbell_size,
+	};
 
-	mpic->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(node), &mpic_msi_domain_info,
-						     mpic->msi_inner_domain);
-	if (!mpic->msi_domain) {
-		irq_domain_remove(mpic->msi_inner_domain);
+	mpic->msi_inner_domain = msi_create_parent_irq_domain(&info, &mpic_msi_parent_ops);
+	if (!mpic->msi_inner_domain)
 		return -ENOMEM;
-	}
 
 	mpic_msi_reenable_percpu(mpic);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
