Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833DDE75420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnczTlSrSBdPmyj2zKrfQ1jZTR1JSJ+KO3TsgfcFCDU=; b=3gQbN0/fb8U10S
	d1MEH2CBgPlRntOHrmh/KrM6xSUISilM+BBNuVmlv0IwGPNWdY6iii23yHNxiv42/yEhuUpW9FLuw
	8WYIAuV2sa3+kULX1ePqtip1CK2AyFH+Tf23e2x7VvhlBxIpS7+zMTcgNvi/jqnQ/qBVIneusC0Wx
	nLy8OoP6F8TTA9QoRujOzXvlQ5czFH6hPzPvmxah9beM6Hv2y5zYf5NrY9hq8rfJEfjp8IgY808Qy
	j8Wk58IrduUpvxCnxpgy2LKLjLgnkQAPnwXENb6sHLsm3c5FApTLSRp+NXX6l2Y1qalcPluzPAOZ9
	fQSeIhlZ2h6BdTMq87Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHO-00Do3c-22;
	Tue, 03 Oct 2023 04:45:06 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHK-00Dnyi-34
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:45:04 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-57b6a7e0deeso294911eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308298; x=1696913098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1xL9ry/qVc8LB9ADTXQzYyB8xKqzcFMAT7WOD9fcwk=;
        b=SI3L10GhsbBHA3qWz1H9guUhOl+UBTzktwaG/q6mMiALTvyPhs+TCEn9Twqd/yhFX3
         8UGcbichTNdegP5k5xI1pYOWLQTzUlWiZ8AfBJsNY0NYWYGeK75b+VNS4XVj0bpJEumE
         3XGs5pB9+4uFkPhma+zNXDHym0vbb86TVT457NUX1xktlt90mS/e8tjJErigV8EdpPXM
         Lr4C0eZ9veeHLnkW2jKSCllbQ3v832LGRAzwdD44s0/O9T0Ki9qwylxJsTlAU3CS7/xU
         SWc8j9GxXJeBA/6skpwwNQBHmpUQLoGdFMk6SbFEk8LtdHfeE7hH+5xv4N3qYWuDonPL
         CooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308298; x=1696913098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1xL9ry/qVc8LB9ADTXQzYyB8xKqzcFMAT7WOD9fcwk=;
        b=Yf9Nq+o7TcLeln2YJgoxHLCJ67HF0nWGGT1mffVGtznB7eOBxmTRvqELYTfO3H5Chc
         dtImlbb3P/de9EEtC2cQr087pAE8d6qGFSMIdobSjppVxFoDg3hOtYaZTHgVyYV1YBTH
         vugwWS0tOLdPuYqJZSXokg83xKI/r/u9e+cY/F7nljp39IowHi/0bIIefnFpVYNw3LQs
         QJBQn08Re8zKPlWDP9xWx7pRFvobsyKRniDCHJtpUI8PU6RVnOLYZp6yAzvCw5CbwGJ7
         BPJQtyx6jL606aPHF7AwwABdbuoNxh7m8N6Kyc+L+cuwsTR2TFpR12aD8N1RG4okm/SH
         XsnA==
X-Gm-Message-State: AOJu0YzB2eAAW//QrbDykd4N3xNHjEcT2aykXZqpvAUAcgSJml9DQDJu
	6q9vohzN2Jgc4inKJ5xfc8Id6lI17TJhoCVMSQ4=
X-Google-Smtp-Source: AGHT+IFyRpOgdHYeZLOyIvPA9wf57u8ThabB53N8oiK8yaJGP5/0RtKTxYis3WNH6OtvpRyu5t4ycw==
X-Received: by 2002:a05:6358:8813:b0:143:5eaf:d6fa with SMTP id hv19-20020a056358881300b001435eafd6famr14137082rwb.9.1696308298270;
        Mon, 02 Oct 2023 21:44:58 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:44:57 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 05/15] irqchip/sifive-plic: Convert PLIC driver into a platform driver
Date: Tue,  3 Oct 2023 10:13:53 +0530
Message-Id: <20231003044403.1974628-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214502_989464_E7BA00DA 
X-CRM114-Status: GOOD (  27.44  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The PLIC driver does not require very early initialization so let
us convert it into a platform driver.

As part of the conversion, the PLIC probing undergoes the following
changes:
1. Use dev_info(), dev_err() and dev_warn() instead of pr_info(),
   pr_err() and pr_warn()
2. Use devm_xyz() APIs wherever applicable
3. PLIC is now probed after CPUs are brought-up so we have to
   setup cpuhp state after context handler of all online CPUs
   are initialized otherwise we see crash on multi-socket systems

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 239 ++++++++++++++++++------------
 1 file changed, 148 insertions(+), 91 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b7bc4fd9517..c8f8a8cdcce1 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017 SiFive
  * Copyright (C) 2018 Christoph Hellwig
  */
-#define pr_fmt(fmt) "plic: " fmt
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -64,6 +63,7 @@
 #define PLIC_QUIRK_EDGE_INTERRUPT	0
 
 struct plic_priv {
+	struct device *dev;
 	struct cpumask lmask;
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
@@ -85,7 +85,6 @@ struct plic_handler {
 	struct plic_priv	*priv;
 };
 static int plic_parent_irq __ro_after_init;
-static bool plic_cpuhp_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 static int plic_irq_set_type(struct irq_data *d, unsigned int type);
@@ -371,7 +370,8 @@ static void plic_handle_irq(struct irq_desc *desc)
 		int err = generic_handle_domain_irq(handler->priv->irqdomain,
 						    hwirq);
 		if (unlikely(err))
-			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
+			dev_warn_ratelimited(handler->priv->dev,
+					"can't find mapping for hwirq %lu\n",
 					hwirq);
 	}
 
@@ -406,57 +406,126 @@ static int plic_starting_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init __plic_init(struct device_node *node,
-			      struct device_node *parent,
-			      unsigned long plic_quirks)
+static const struct of_device_id plic_match[] = {
+	{ .compatible = "sifive,plic-1.0.0" },
+	{ .compatible = "riscv,plic0" },
+	{ .compatible = "andestech,nceplic100",
+	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
+	{ .compatible = "thead,c900-plic",
+	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
+	{}
+};
+
+static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
+					   u32 *nr_irqs, u32 *nr_contexts)
 {
-	int error = 0, nr_contexts, nr_handlers = 0, i;
-	u32 nr_irqs;
-	struct plic_priv *priv;
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	/*
+	 * Currently, only OF fwnode is supported so extend this
+	 * function for ACPI support.
+	 */
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	rc = of_property_read_u32(to_of_node(dev->fwnode),
+				  "riscv,ndev", nr_irqs);
+	if (rc) {
+		dev_err(dev, "riscv,ndev property not available\n");
+		return rc;
+	}
+
+	*nr_contexts = of_irq_count(to_of_node(dev->fwnode));
+	if (WARN_ON(!(*nr_contexts))) {
+		dev_err(dev, "no PLIC context available\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int plic_parse_context_parent_hwirq(struct platform_device *pdev,
+					   u32 context, u32 *parent_hwirq,
+					   unsigned long *parent_hartid)
+{
+	struct device *dev = &pdev->dev;
+	struct of_phandle_args parent;
+	int rc;
+
+	/*
+	 * Currently, only OF fwnode is supported so extend this
+	 * function for ACPI support.
+	 */
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	rc = of_irq_parse_one(to_of_node(dev->fwnode), context, &parent);
+	if (rc)
+		return rc;
+
+	rc = riscv_of_parent_hartid(parent.np, parent_hartid);
+	if (rc)
+		return rc;
+
+	*parent_hwirq = parent.args[0];
+	return 0;
+}
+
+static int plic_probe(struct platform_device *pdev)
+{
+	int rc, nr_contexts, nr_handlers = 0, i, cpu;
+	unsigned long plic_quirks = 0, hartid;
+	struct device *dev = &pdev->dev;
 	struct plic_handler *handler;
-	unsigned int cpu;
+	u32 nr_irqs, parent_hwirq;
+	struct irq_domain *domain;
+	struct plic_priv *priv;
+	irq_hw_number_t hwirq;
+	struct resource *res;
+	bool cpuhp_setup;
+
+	if (is_of_node(dev->fwnode)) {
+		const struct of_device_id *id;
+
+		id = of_match_node(plic_match, to_of_node(dev->fwnode));
+		if (id)
+			plic_quirks = (unsigned long)id->data;
+	}
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-
+	priv->dev = dev;
 	priv->plic_quirks = plic_quirks;
 
-	priv->regs = of_iomap(node, 0);
-	if (WARN_ON(!priv->regs)) {
-		error = -EIO;
-		goto out_free_priv;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get MMIO resource\n");
+		return -EINVAL;
+	}
+	priv->regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (!priv->regs) {
+		dev_err(dev, "failed map MMIO registers\n");
+		return -EIO;
 	}
 
-	error = -EINVAL;
-	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
-	if (WARN_ON(!nr_irqs))
-		goto out_iounmap;
-
+	rc = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts);
+	if (rc) {
+		dev_err(dev, "failed to parse irqs and contexts\n");
+		return rc;
+	}
 	priv->nr_irqs = nr_irqs;
 
-	priv->prio_save = bitmap_alloc(nr_irqs, GFP_KERNEL);
+	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
 	if (!priv->prio_save)
-		goto out_free_priority_reg;
-
-	nr_contexts = of_irq_count(node);
-	if (WARN_ON(!nr_contexts))
-		goto out_free_priority_reg;
-
-	error = -ENOMEM;
-	priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
-			&plic_irqdomain_ops, priv);
-	if (WARN_ON(!priv->irqdomain))
-		goto out_free_priority_reg;
+		return -ENOMEM;
 
 	for (i = 0; i < nr_contexts; i++) {
-		struct of_phandle_args parent;
-		irq_hw_number_t hwirq;
-		int cpu;
-		unsigned long hartid;
-
-		if (of_irq_parse_one(node, i, &parent)) {
-			pr_err("failed to parse parent for context %d.\n", i);
+		rc = plic_parse_context_parent_hwirq(pdev, i,
+						     &parent_hwirq, &hartid);
+		if (rc) {
+			dev_warn(dev, "hwirq for context%d not found\n", i);
 			continue;
 		}
 
@@ -464,7 +533,7 @@ static int __init __plic_init(struct device_node *node,
 		 * Skip contexts other than external interrupts for our
 		 * privilege level.
 		 */
-		if (parent.args[0] != RV_IRQ_EXT) {
+		if (parent_hwirq != RV_IRQ_EXT) {
 			/* Disable S-mode enable bits if running in M-mode. */
 			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
 				void __iomem *enable_base = priv->regs +
@@ -477,21 +546,17 @@ static int __init __plic_init(struct device_node *node,
 			continue;
 		}
 
-		error = riscv_of_parent_hartid(parent.np, &hartid);
-		if (error < 0) {
-			pr_warn("failed to parse hart ID for context %d.\n", i);
-			continue;
-		}
-
 		cpu = riscv_hartid_to_cpuid(hartid);
 		if (cpu < 0) {
-			pr_warn("Invalid cpuid for context %d\n", i);
+			dev_warn(dev, "Invalid cpuid for context %d\n", i);
 			continue;
 		}
 
 		/* Find parent domain and register chained handler */
-		if (!plic_parent_irq && irq_find_host(parent.np)) {
-			plic_parent_irq = irq_of_parse_and_map(node, i);
+		domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
+						  DOMAIN_BUS_ANY);
+		if (!plic_parent_irq && domain) {
+			plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
 			if (plic_parent_irq)
 				irq_set_chained_handler(plic_parent_irq,
 							plic_handle_irq);
@@ -504,7 +569,7 @@ static int __init __plic_init(struct device_node *node,
 		 */
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		if (handler->present) {
-			pr_warn("handler already present for context %d.\n", i);
+			dev_warn(dev, "handler already present for context%d.\n", i);
 			plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
 			goto done;
 		}
@@ -518,10 +583,13 @@ static int __init __plic_init(struct device_node *node,
 			i * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 
-		handler->enable_save =  kcalloc(DIV_ROUND_UP(nr_irqs, 32),
-						sizeof(*handler->enable_save), GFP_KERNEL);
+		handler->enable_save =  devm_kcalloc(dev,
+						DIV_ROUND_UP(nr_irqs, 32),
+						sizeof(*handler->enable_save),
+						GFP_KERNEL);
 		if (!handler->enable_save)
-			goto out_free_enable_reg;
+			return -ENOMEM;
+
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
 			plic_toggle(handler, hwirq, 0);
@@ -531,52 +599,41 @@ static int __init __plic_init(struct device_node *node,
 		nr_handlers++;
 	}
 
+	priv->irqdomain = irq_domain_create_linear(dev->fwnode, nr_irqs + 1,
+						   &plic_irqdomain_ops, priv);
+	if (WARN_ON(!priv->irqdomain))
+		return -ENOMEM;
+
 	/*
 	 * We can have multiple PLIC instances so setup cpuhp state
-	 * and register syscore operations only when context handler
-	 * for current/boot CPU is present.
+	 * and register syscore operations only after context handlers
+	 * of all online CPUs are initialized.
 	 */
-	handler = this_cpu_ptr(&plic_handlers);
-	if (handler->present && !plic_cpuhp_setup_done) {
+	cpuhp_setup = true;
+	for_each_online_cpu(cpu) {
+		handler = per_cpu_ptr(&plic_handlers, cpu);
+		if (!handler->present) {
+			cpuhp_setup = false;
+			break;
+		}
+	}
+	if (cpuhp_setup) {
 		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 				  "irqchip/sifive/plic:starting",
 				  plic_starting_cpu, plic_dying_cpu);
 		register_syscore_ops(&plic_irq_syscore_ops);
-		plic_cpuhp_setup_done = true;
 	}
 
-	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
-		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
+	dev_info(dev, "mapped %d interrupts with %d handlers for"
+		" %d contexts.\n", nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-out_free_enable_reg:
-	for_each_cpu(cpu, cpu_present_mask) {
-		handler = per_cpu_ptr(&plic_handlers, cpu);
-		kfree(handler->enable_save);
-	}
-out_free_priority_reg:
-	kfree(priv->prio_save);
-out_iounmap:
-	iounmap(priv->regs);
-out_free_priv:
-	kfree(priv);
-	return error;
 }
 
-static int __init plic_init(struct device_node *node,
-			    struct device_node *parent)
-{
-	return __plic_init(node, parent, 0);
-}
-
-IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
-IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
-
-static int __init plic_edge_init(struct device_node *node,
-				 struct device_node *parent)
-{
-	return __plic_init(node, parent, BIT(PLIC_QUIRK_EDGE_INTERRUPT));
-}
-
-IRQCHIP_DECLARE(andestech_nceplic100, "andestech,nceplic100", plic_edge_init);
-IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_edge_init);
+static struct platform_driver plic_driver = {
+	.driver = {
+		.name		= "riscv-plic",
+		.of_match_table	= plic_match,
+	},
+	.probe = plic_probe,
+};
+builtin_platform_driver(plic_driver);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
