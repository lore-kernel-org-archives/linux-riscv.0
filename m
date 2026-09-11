Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22690C88E50
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Nvm79aNgqH1G7onq8VpBVvG6ugiDeJjyf5tpUnYgxk=; b=2NZVNeji0pArMM
	FlFPcQgcvCPJI/x7xZl5SVlpAgKX+m+PgdOsmwMRnBxcgHGyHAZHJ6eQelwmgKHxpWuo4QYzA//r6
	rRxlke5qM1b2XDHRHEtWKlZwHAEXKnw5E6/JY2YbGEopkXBcnbrugijJRCCvzZHe+cB4OkbMfDwXL
	Cz4Kd31l1tsPQ83zEMO8tHWhIC+i267137WpcPCa//xJDJFNlJQIZ3p1uJVclX/lzyZT+c1s31TGP
	UjPGS5QgX8u0mhqCM3cwUNsp7x4LLi5G4g91JHg36a4HwrJpMxkz8itNSl++UF6PHwS0hLn4O/yB0
	2AmdQo3w+jEPkm8jf/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52aY-0000000GxgJ-07Gj;
	Fri, 11 Sep 2026 14:50:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52aV-0000000GxfO-1rFj
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 14:50:48 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789138242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DofMgJ4HQJP6KXLOPb6VSmbpACWlyfd2dHezMOI9WDY=;
	b=qasgzA6Aq/R/H8P5AWE5YxpCPz6ZVxw6CdbEFnKcZ/p+erXvgEjC0vGM9KVIg14JXO+MQS
	GjMST0QNDNXbT7TzuHZ31OMaVpV0NYwZ51QUFSXA0j0KaztKYjLswtqRHPIR7zUERH0uY2
	G1OOmCakdukX7lNAsMDudXG4BLpr7EAxI0/t3AuR2SFzzGPFEb0Rw9mpvnIJrXypv3lEle
	ZjivBxIiid+UgVwpKeMZloD+BGPNa3Vb0jGH/WuJ6CdH7ewJOLi0kVX524KGb/jKwkW+Zh
	nI9Q2daIaV7A/yPnkSsdZSpHDAoS96NA5hcAAY0pNxZQxTGrtxYM22W1SNxxvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789138242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DofMgJ4HQJP6KXLOPb6VSmbpACWlyfd2dHezMOI9WDY=;
	b=EQCI9Wwadzqc6WKyoR4BWQinngOIOMwsz4iw+O8I0kZGfp5Nixp21v6wXYEdtXuasoeRuZ
	wGfBBDFLboXCZHCA==
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] irqchip/sifive-plic: Panic if initialization fails
Date: Fri, 11 Sep 2026 16:50:37 +0200
Message-ID: <20260911145037.427896-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_075047_671232_007FE1AE 
X-CRM114-Status: GOOD (  11.01  )
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

If PLIC initialization fails, the driver unwinds and returns an error.
However, that is futile because the system cannot function without the
PLIC: all device interrupts are routed through it.

Instead of the unnecessary cleanups, panic when PLIC initialization fails.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/irqchip/irq-sifive-plic.c | 56 +++++++++----------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index a7cddadddf40..70a7478373e4 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -643,13 +643,11 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 	error = plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts, &gsi_base, &id);
 	if (error)
-		goto fail_free_regs;
+		return error;
 
 	priv = kzalloc_obj(*priv);
-	if (!priv) {
-		error = -ENOMEM;
-		goto fail_free_regs;
-	}
+	if (!priv)
+		return -ENOMEM;
 
 	priv->fwnode = fwnode;
 	priv->plic_quirks = plic_quirks;
@@ -668,10 +666,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	priv->acpi_plic_id = id;
 
 	priv->prio_save = bitmap_zalloc(nr_irqs, GFP_KERNEL);
-	if (!priv->prio_save) {
-		error = -ENOMEM;
-		goto fail_free_priv;
-	}
+	if (!priv->prio_save)
+		return -ENOMEM;
 
 	for (i = 0; i < nr_contexts; i++) {
 		error = plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu,
@@ -735,10 +731,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 		handler->enable_save = kcalloc(priv->irq_groups, sizeof(*handler->enable_save),
 					       GFP_KERNEL);
-		if (!handler->enable_save) {
-			error = -ENOMEM;
-			goto fail_cleanup_contexts;
-		}
+		if (!handler->enable_save)
+			return -ENOMEM;
 done:
 		for_each_device_irq(hwirq, priv) {
 			plic_toggle(handler, hwirq, 0);
@@ -748,10 +742,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	}
 
 	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs, &plic_irqdomain_ops, priv);
-	if (WARN_ON(!priv->irqdomain)) {
-		error = -ENOMEM;
-		goto fail_cleanup_contexts;
-	}
+	if (!priv->irqdomain)
+		return -ENOMEM;
 
 	/*
 	 * We can have multiple PLIC instances so setup global state
@@ -799,33 +791,13 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d contexts.\n",
 		fwnode, nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-fail_cleanup_contexts:
-	for (i = 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu, priv->acpi_plic_id))
-			continue;
-		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
-			continue;
-
-		handler = per_cpu_ptr(&plic_handlers, cpu);
-		handler->present = false;
-		handler->hart_base = NULL;
-		handler->enable_base = NULL;
-		kfree(handler->enable_save);
-		handler->enable_save = NULL;
-		handler->priv = NULL;
-	}
-	bitmap_free(priv->prio_save);
-fail_free_priv:
-	kfree(priv);
-fail_free_regs:
-	iounmap(regs);
-	return error;
 }
 
 static int plic_platform_probe(struct platform_device *pdev)
 {
-	return plic_probe(pdev->dev.fwnode);
+	if (plic_probe(pdev->dev.fwnode))
+		panic("%pfwP: Failed to initialize\n", pdev->dev.fwnode);
+	return 0;
 }
 
 static struct platform_driver plic_driver = {
@@ -842,7 +814,9 @@ builtin_platform_driver(plic_driver);
 static int __init plic_early_probe(struct device_node *node,
 				   struct device_node *parent)
 {
-	return plic_probe(&node->fwnode);
+	if (plic_probe(&node->fwnode))
+		panic("%pfwP: Failed to initialize\n", &node->fwnode);
+	return 0;
 }
 
 IRQCHIP_DECLARE(riscv, "allwinner,sun20i-d1-plic", plic_early_probe);
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
