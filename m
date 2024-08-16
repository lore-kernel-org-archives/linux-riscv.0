Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE484C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UfZSc6ek8lUCNdXTGPL/MEVkpRsH+ScTSGFAQn+DWkw=; b=KQ6thVZnVGkEE8
	SQNyaPNmktLalWezKHsOm8EDWlsKgvt8NjzPBSC1dUotB696RxbUhwV8CPvJXHJb1LoPAVMjK89PN
	qaQHFSCVuGyjDpIUJ0DW1OUErPkqIMo5FBZVGVzwcwVslk/SA6+lHf/NI54fM3xqeEaOUTeAnF/12
	JFBFaaPW8uoXgfrjIW3KrDiBI75OXiLIxNdr/50nokpXODBo5paqba4XRvf38gYI/AgRgmvE8ts0w
	0ix3RiHMfQSP4CwY2FD/SOtJHinOlKbAcwMmGLKWtOxq/P2egFEfLXf1UxxF7ldI1sdrmcClZcHz5
	5IK60Tn7ZukfTeNLAOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sezfA-0000000DYJM-3YoZ;
	Fri, 16 Aug 2024 16:18:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sezf7-0000000DYHI-0IJj
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 16:18:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so1780295b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 09:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723825127; x=1724429927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZZikUWcFIiur6KRWSBUsNZWuDMMUD3k6uVLXjwK8fA=;
        b=JZarg1Gmg9+jtk++VvYx1jSmv3DuAiBeFE8P7w4n/3ZiW5D2dec99yXNo7Ae02FePQ
         gfLoFNZParV+Gem2IRM+Tnk42albcc4KmyJqKh6Et1el0f/6gjD+VLlS2oJfGarsbeHz
         zYhTUXb9HRHftC2DMPfjpuODXRjXsviDIO3X9gXhwScVnH8fReT3/FcyyZ6/0KURPK7R
         /eeCUMLk/leHKU8KJlEOUvfiz4KU9uG6qOgPAwDYcxrU7Mmtai5nY2uNnsodG2xLkRB/
         Vfe6UoJRZGHAE6+Xti/pbikLfIHTuuHBjzYJxtL4m1Qk5GxmOnE5iJLm8f6STJorE5MK
         4qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723825127; x=1724429927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZZikUWcFIiur6KRWSBUsNZWuDMMUD3k6uVLXjwK8fA=;
        b=UCvC1icNqdZJNAfh0hmeIhTntb+ZVMxM9v7WB6wFUHN+YwW6uUFD4Q9me5IlooUX0d
         +ibmfReVAOSYErAMDQGEf8RRd/H7/kctgGjudTBmGsbKy4H3thDF2JrFc5poVtUzkRlX
         GVkDWVn+jubHavuzm+ldq+nDuz9zcql3tWhjl7MJnpUL/qQyzDUHxzDCHzNDy3PT/SF+
         sNwSEvlOrGmjTw5e2P5rrNNx1O7TJz1hK/2MBszofKmRaiXaEtzwILwtBJPnUs0fifmE
         CPiKQYHkrKNhExfXBnCbklwPLubA8lJ9Er/wk3Ev1xMDkkcDw6RbW+zq2iaMUDvSBBfB
         kD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhngh8k9H4QhOw2qcmV4Cu1ykaW3z3U/IjuzsqarwmxbwpaArpjfDsdqFanoMQX0w4yIuc0TCWs02h/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTSFQq4NKmSAz3dPDZHWnm51DELYJl5B7L/ZzsXnI8Hrz2oPOM
	4iWaay3nbKtR45SDpwjdDxk0t30wS8zE+OtSVS5ud2sCqq7YH3cu07CPXDuRc7A=
X-Google-Smtp-Source: AGHT+IH8kyrRAevxD7wRd50Blo1eYBO43zB6e13vqwyAxMBP6us+Hyy10y0H/uPPVpd0e8gy5gfN3Q==
X-Received: by 2002:a05:6a21:8ccb:b0:1c4:87b9:7ef9 with SMTP id adf61e73a8af0-1c905027f73mr3893015637.42.1723825126559;
        Fri, 16 Aug 2024 09:18:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add6e6bsm2896982b3a.18.2024.08.16.09.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 09:18:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] irqchip/sifive-plic: Probe plic driver early for Allwinner D1 platform
Date: Fri, 16 Aug 2024 21:48:28 +0530
Message-Id: <20240816161828.2979143-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_091849_137540_AD9B5A06 
X-CRM114-Status: GOOD (  26.55  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The latest Linux RISC-V no longer boots on the Allwinner D1 platform
because the sun4i_timer driver fails to get an interrupt from PLIC.

The real fix requires enabling the SBI time extension in the platform
firmware (OpenSBI) and convert sun4i_timer into platform driver.
Unfortunately, the real fix involves changing multiple places and
can't be achieved in a short duration.

As a work-around, retrofit plic probing such that plic is probed
early only for the Allwinner D1 platform and probed as a regular
platform driver for rest of the RISC-V platforms. In the process,
partially revert some of the previous patches because PLIC device
pointer is not available in all probing paths.

More detailed discussion can found here:
https://lore.kernel.org/lkml/20240814145642.344485-1-emil.renner.berthing@canonical.com/

Fixes: e306a894bd51 ("irqchip/sifive-plic: Chain to parent IRQ after handlers are ready")
Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 128 +++++++++++++++++++-----------
 1 file changed, 80 insertions(+), 48 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 9e22f7e378f5..357d25662718 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 SiFive
  * Copyright (C) 2018 Christoph Hellwig
  */
+#define pr_fmt(fmt) "riscv-plic: " fmt
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -63,7 +64,7 @@
 #define PLIC_QUIRK_EDGE_INTERRUPT	0
 
 struct plic_priv {
-	struct device *dev;
+	struct fwnode_handle *fwnode;
 	struct cpumask lmask;
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
@@ -378,8 +379,8 @@ static void plic_handle_irq(struct irq_desc *desc)
 		int err = generic_handle_domain_irq(handler->priv->irqdomain,
 						    hwirq);
 		if (unlikely(err)) {
-			dev_warn_ratelimited(handler->priv->dev,
-					     "can't find mapping for hwirq %lu\n", hwirq);
+			pr_warn_ratelimited("%pfwP: can't find mapping for hwirq %lu\n",
+					    handler->priv->fwnode, hwirq);
 		}
 	}
 
@@ -408,15 +409,14 @@ static int plic_starting_cpu(unsigned int cpu)
 		enable_percpu_irq(plic_parent_irq,
 				  irq_get_trigger_type(plic_parent_irq));
 	else
-		dev_warn(handler->priv->dev, "cpu%d: parent irq not available\n", cpu);
+		pr_warn("%pfwP: cpu%d: parent irq not available\n",
+			handler->priv->fwnode, cpu);
 	plic_set_threshold(handler, PLIC_ENABLE_THRESHOLD);
 
 	return 0;
 }
 
-static const struct of_device_id plic_match[] = {
-	{ .compatible = "sifive,plic-1.0.0" },
-	{ .compatible = "riscv,plic0" },
+static const struct of_device_id plic_quirks_match[] = {
 	{ .compatible = "andestech,nceplic100",
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
 	{ .compatible = "thead,c900-plic",
@@ -424,38 +424,36 @@ static const struct of_device_id plic_match[] = {
 	{}
 };
 
-static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
+static int plic_parse_nr_irqs_and_contexts(struct fwnode_handle *fwnode,
 					   u32 *nr_irqs, u32 *nr_contexts)
 {
-	struct device *dev = &pdev->dev;
 	int rc;
 
 	/*
 	 * Currently, only OF fwnode is supported so extend this
 	 * function for ACPI support.
 	 */
-	if (!is_of_node(dev->fwnode))
+	if (!is_of_node(fwnode))
 		return -EINVAL;
 
-	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", nr_irqs);
+	rc = of_property_read_u32(to_of_node(fwnode), "riscv,ndev", nr_irqs);
 	if (rc) {
-		dev_err(dev, "riscv,ndev property not available\n");
+		pr_err("%pfwP: riscv,ndev property not available\n", fwnode);
 		return rc;
 	}
 
-	*nr_contexts = of_irq_count(to_of_node(dev->fwnode));
+	*nr_contexts = of_irq_count(to_of_node(fwnode));
 	if (WARN_ON(!(*nr_contexts))) {
-		dev_err(dev, "no PLIC context available\n");
+		pr_err("%pfwP: no PLIC context available\n", fwnode);
 		return -EINVAL;
 	}
 
 	return 0;
 }
 
-static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
+static int plic_parse_context_parent(struct fwnode_handle *fwnode, u32 context,
 				     u32 *parent_hwirq, int *parent_cpu)
 {
-	struct device *dev = &pdev->dev;
 	struct of_phandle_args parent;
 	unsigned long hartid;
 	int rc;
@@ -464,10 +462,10 @@ static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
 	 * Currently, only OF fwnode is supported so extend this
 	 * function for ACPI support.
 	 */
-	if (!is_of_node(dev->fwnode))
+	if (!is_of_node(fwnode))
 		return -EINVAL;
 
-	rc = of_irq_parse_one(to_of_node(dev->fwnode), context, &parent);
+	rc = of_irq_parse_one(to_of_node(fwnode), context, &parent);
 	if (rc)
 		return rc;
 
@@ -480,48 +478,55 @@ static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
 	return 0;
 }
 
-static int plic_probe(struct platform_device *pdev)
+static int plic_probe(struct fwnode_handle *fwnode)
 {
 	int error = 0, nr_contexts, nr_handlers = 0, cpu, i;
-	struct device *dev = &pdev->dev;
 	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
 	u32 nr_irqs, parent_hwirq;
 	struct plic_priv *priv;
 	irq_hw_number_t hwirq;
+	void __iomem *regs;
 
-	if (is_of_node(dev->fwnode)) {
+	if (is_of_node(fwnode)) {
 		const struct of_device_id *id;
 
-		id = of_match_node(plic_match, to_of_node(dev->fwnode));
+		id = of_match_node(plic_quirks_match, to_of_node(fwnode));
 		if (id)
 			plic_quirks = (unsigned long)id->data;
+
+		regs = of_iomap(to_of_node(fwnode), 0);
+		if (!regs)
+			return -ENOMEM;
+	} else {
+		return -ENODEV;
 	}
 
-	error = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts);
+	error = plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts);
 	if (error)
-		return error;
+		goto fail_free_regs;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		error = -ENOMEM;
+		goto fail_free_regs;
+	}
 
-	priv->dev = dev;
+	priv->fwnode = fwnode;
 	priv->plic_quirks = plic_quirks;
 	priv->nr_irqs = nr_irqs;
+	priv->regs = regs;
 
-	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (WARN_ON(!priv->regs))
-		return -EIO;
-
-	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
-	if (!priv->prio_save)
-		return -ENOMEM;
+	priv->prio_save = bitmap_zalloc(nr_irqs, GFP_KERNEL);
+	if (!priv->prio_save) {
+		error = -ENOMEM;
+		goto fail_free_priv;
+	}
 
 	for (i = 0; i < nr_contexts; i++) {
-		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu);
+		error = plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu);
 		if (error) {
-			dev_warn(dev, "hwirq for context%d not found\n", i);
+			pr_warn("%pfwP: hwirq for context%d not found\n", fwnode, i);
 			continue;
 		}
 
@@ -543,7 +548,7 @@ static int plic_probe(struct platform_device *pdev)
 		}
 
 		if (cpu < 0) {
-			dev_warn(dev, "Invalid cpuid for context %d\n", i);
+			pr_warn("%pfwP: Invalid cpuid for context %d\n", fwnode, i);
 			continue;
 		}
 
@@ -554,7 +559,8 @@ static int plic_probe(struct platform_device *pdev)
 		 */
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		if (handler->present) {
-			dev_warn(dev, "handler already present for context %d.\n", i);
+			pr_warn("%pfwP: handler already present for context %d.\n",
+				fwnode, i);
 			plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
 			goto done;
 		}
@@ -568,8 +574,8 @@ static int plic_probe(struct platform_device *pdev)
 			i * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 
-		handler->enable_save = devm_kcalloc(dev, DIV_ROUND_UP(nr_irqs, 32),
-						    sizeof(*handler->enable_save), GFP_KERNEL);
+		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
+					       sizeof(*handler->enable_save), GFP_KERNEL);
 		if (!handler->enable_save)
 			goto fail_cleanup_contexts;
 done:
@@ -581,7 +587,7 @@ static int plic_probe(struct platform_device *pdev)
 		nr_handlers++;
 	}
 
-	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
+	priv->irqdomain = irq_domain_add_linear(to_of_node(fwnode), nr_irqs + 1,
 						&plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain))
 		goto fail_cleanup_contexts;
@@ -619,13 +625,13 @@ static int plic_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
-		 nr_irqs, nr_handlers, nr_contexts);
+	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d contexts.\n",
+		fwnode, nr_irqs, nr_handlers, nr_contexts);
 	return 0;
 
 fail_cleanup_contexts:
 	for (i = 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu))
+		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu))
 			continue;
 		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
 			continue;
@@ -634,17 +640,43 @@ static int plic_probe(struct platform_device *pdev)
 		handler->present = false;
 		handler->hart_base = NULL;
 		handler->enable_base = NULL;
+		kfree(handler->enable_save);
 		handler->enable_save = NULL;
 		handler->priv = NULL;
 	}
-	return -ENOMEM;
+	bitmap_free(priv->prio_save);
+fail_free_priv:
+	kfree(priv);
+fail_free_regs:
+	iounmap(regs);
+	return error;
+}
+
+static int plic_platform_probe(struct platform_device *pdev)
+{
+	return plic_probe(pdev->dev.fwnode);
 }
 
+static const struct of_device_id plic_platform_match[] = {
+	{ .compatible = "sifive,plic-1.0.0" },
+	{ .compatible = "riscv,plic0" },
+	{ .compatible = "andestech,nceplic100" },
+	{}
+};
+
 static struct platform_driver plic_driver = {
 	.driver = {
 		.name		= "riscv-plic",
-		.of_match_table	= plic_match,
+		.of_match_table	= plic_platform_match,
 	},
-	.probe = plic_probe,
+	.probe = plic_platform_probe,
 };
 builtin_platform_driver(plic_driver);
+
+static int __init plic_early_probe(struct device_node *node,
+				   struct device_node *parent)
+{
+	return plic_probe(&node->fwnode);
+}
+
+IRQCHIP_DECLARE(riscv, "thead,c900-plic", plic_early_probe);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
