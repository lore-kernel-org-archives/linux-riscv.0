Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377BCC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 05:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBesqMWEnBAGeaUHTw0N10jWrRppa4qq75BQ1/LWE9M=; b=tSUoH7k/do0rdU
	JGMbjFbmHCTf6EKTy0dLR9EzBUQEBDZKunDUAcFWxykvlYFnOmEQo8INt19kGyBNz64Q/Sn5SGfrG
	eH911pdqhsFJcGzdS4AkWAyr41cfC1fEQLKUJ/TIaIqBfn4OytUg1EOgbzkqFRHvKwABbwf83hKqJ
	VSKEyk3XWhtknhwAUcAZcOfz55Eivgv/oFkyNLc3JJ4jJ1CkSkHD7/lATOtmNvm/lTlauyfj+m3i2
	uGbdAI5ZtpPRJknFTfYXrWJCjxudVUPCsaR4OpZ+yDelommvnicKgGQWx5LHcC9hiIZwBzB2Czuqg
	ni5hc4Fj59ZclPukZ2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLvj-00000004HM0-3p6u;
	Fri, 21 Feb 2025 05:50:31 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLvh-00000004HL0-0Jv5
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 05:50:30 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3f41091f7c5so933953b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 21:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740117028; x=1740721828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQEtVB5peFkUVrk+VE9+6V14katRhVhojmMt1aZTL5s=;
        b=VWsl4EQFiZljqsixZ5wBse3YEPFaYG6QjMZvh7lEk99FBjsCg7BOMf/wJJ7F1722OF
         1p+KsZsHpF1ud0TpAaNeIdCtrrrCKvpa0YBuQ/41FO5L8H1ikC2vHj9KuMxkoqhd6pll
         2oqq8AkKWtIa1zfBQiBH+BVm6nKdUjLIgF/y7C1CYuC6BIIKzXLADuNSb8WNag3Dmn4n
         1e07edjpV60QohkMsVybzmntCa4l3JdHHKkHTcS+VL2wTAOgof5c9rLz9fyUVL+g+CcY
         1PT2fbHaXbzJjBCJLtuuEpbHRt/hBtgVxWNI/yJ6qGNuhDg9oCfdbb7ZMX7TxC7uzbET
         GEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740117028; x=1740721828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQEtVB5peFkUVrk+VE9+6V14katRhVhojmMt1aZTL5s=;
        b=GbuYnN4dcvUTA0ZpQO2Zb1S0JR69y9OYs4J6owZyZJ/pxnb8COEu5yjCg8fbu9Xlb7
         6bt8LanqGP+vWxQOJqoBnkmdJteFTnh921rExLS6CDMLwI3iqpIwLm1M+EoaRgkqEoS2
         0u9e1Zh2KYfQdknUrLhSOeFo4nXgbOiyE1HvZw/vXsiU22GKAChYhYVIa9HyM6qPbUYs
         373gC5gcFqMAsA0PTTZBdAAYWjxo2TVkERh7Edd7yyMG13ZIY+lCoL+eQrqL3wkde3k/
         QQYbZjadK1K8303VjJtaa44zgEEqB8tRcHZbCaMyLogOOrksdEBdzNPiv8NcuUHbgWM2
         PijQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1XGXlLwrpOn5K9hsFBzCd8zkFxZuCuBDuMOxKwsbr3LaxNX2nGDwWznFvR57fWT6Ds8zvuAsnixpmXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAkpXGtlv03UBdi28AX8BVM9uoVF8qbAyED0auLOyqU8EOkosj
	lPdTty8B/EdfsuAiOGYG/q8uf2QntFt/MsEq8sWmi2K+KxR3tSWQ
X-Gm-Gg: ASbGnctLAJRo9mOr5qE014yCs1bYYcGQMa3OZ2n2ww1ZMdY1P18Sg3hwfUpmX5QvJpj
	l0rxXVqwxQP+vwtqaudsAIpf76TFsvAa7QaQ9sVQzCLVIyAyGj6HEA+hcCbjGD6vrlhEsDY0HP4
	Jg8UBB3MQwbpK69z+F3XBBdcI3/KVnf9O80DsrIdyYFZH9q9HHSXLt2who4BOrrX/hreeX3jraj
	mxwyBADgf2NRKr0wCth6aKWk4+NPPtQmWAX863fXNA64MbVeJFD4dtLMdyWXnNojEbRZRfo6AmA
	hL2qNhuGu0pafxhK6OBE0FDpwQuG5FiqbPRR
X-Google-Smtp-Source: AGHT+IGJX0Wo5ZRHH1ezNQwtiBeWjkQ5e9atU+JTlNYEf9NYlannLDQH2oXTboVIc546GfKGuVVnZg==
X-Received: by 2002:a05:6808:1392:b0:3f4:1dc8:f52e with SMTP id 5614622812f47-3f425bf28cemr1019954b6e.30.1740117027830;
        Thu, 20 Feb 2025 21:50:27 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f4120266e1sm1106369b6e.44.2025.02.20.21.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:50:26 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v4 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt controller
Date: Fri, 21 Feb 2025 13:50:19 +0800
Message-Id: <f438742bdf7bf3ef8a65e1d88ad57fd1ac66273f.1740116190.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1740116190.git.unicorn_wang@outlook.com>
References: <cover.1740116190.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_215029_152062_85F54E14 
X-CRM114-Status: GOOD (  25.64  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add driver for Sophgo SG2042 MSI interrupt controller.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/Kconfig          |  12 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-sg2042-msi.c | 264 +++++++++++++++++++++++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 drivers/irqchip/irq-sg2042-msi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index be063bfb50c4..cdb0accd826a 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -751,6 +751,18 @@ config MCHP_EIC
 	help
 	  Support for Microchip External Interrupt Controller.
 
+config SOPHGO_SG2042_MSI
+	bool "Sophgo SG2042 MSI Controller"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on PCI
+	select IRQ_DOMAIN_HIERARCHY
+	select IRQ_MSI_LIB
+	select PCI_MSI
+	help
+	  Support for the Sophgo SG2042 MSI Controller.
+	  This on-chip interrupt controller enables MSI sources to be
+	  routed to the primary PLIC controller on SoC.
+
 config SUNPLUS_SP7021_INTC
 	bool "Sunplus SP7021 interrupt controller" if COMPILE_TEST
 	default SOC_SP7021
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 25e9ad29b8c4..dd60e597491d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -128,4 +128,5 @@ obj-$(CONFIG_WPCM450_AIC)		+= irq-wpcm450-aic.o
 obj-$(CONFIG_IRQ_IDT3243X)		+= irq-idt3243x.o
 obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
+obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
new file mode 100644
index 000000000000..b7950872ed2e
--- /dev/null
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SG2042 MSI Controller
+ *
+ * Copyright (C) 2024 Sophgo Technology Inc.
+ * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#include "irq-msi-lib.h"
+
+#define SG2042_MAX_MSI_VECTOR	32
+
+struct sg2042_msi_chipdata {
+	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+
+	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
+
+	u32		irq_first;	// The vector number that MSIs starts
+	u32		num_irqs;	// The number of vectors for MSIs
+
+	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
+	struct mutex	msi_map_lock;	// lock for msi_map
+};
+
+static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_req)
+{
+	int first;
+
+	guard(mutex)(&data->msi_map_lock);
+	first = bitmap_find_free_region(data->msi_map, data->num_irqs,
+					get_count_order(num_req));
+	return first >= 0 ? first : -ENOSPC;
+}
+
+static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data,
+				  int hwirq, int num_req)
+{
+	guard(mutex)(&data->msi_map_lock);
+	bitmap_release_region(data->msi_map, hwirq, get_count_order(num_req));
+}
+
+static void sg2042_msi_irq_ack(struct irq_data *d)
+{
+	struct sg2042_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
+	int bit_off = d->hwirq;
+
+	writel(1 << bit_off, data->reg_clr);
+
+	irq_chip_ack_parent(d);
+}
+
+static void sg2042_msi_irq_compose_msi_msg(struct irq_data *d,
+					   struct msi_msg *msg)
+{
+	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+
+	msg->address_hi = upper_32_bits(data->doorbell_addr);
+	msg->address_lo = lower_32_bits(data->doorbell_addr);
+	msg->data = 1 << d->hwirq;
+}
+
+static const struct irq_chip sg2042_msi_middle_irq_chip = {
+	.name			= "SG2042 MSI",
+	.irq_ack		= sg2042_msi_irq_ack,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+#endif
+	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
+};
+
+static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain,
+					  unsigned int virq, int hwirq)
+{
+	struct sg2042_msi_chipdata *data = domain->host_data;
+	struct irq_fwspec fwspec;
+	struct irq_data *d;
+	int ret;
+
+	fwspec.fwnode = domain->parent->fwnode;
+	fwspec.param_count = 2;
+	fwspec.param[0] = data->irq_first + hwirq;
+	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
+	if (ret)
+		return ret;
+
+	d = irq_domain_get_irq_data(domain->parent, virq);
+	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
+}
+
+static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain,
+					  unsigned int virq,
+					  unsigned int nr_irqs, void *args)
+{
+	struct sg2042_msi_chipdata *data = domain->host_data;
+	int hwirq, err, i;
+
+	hwirq = sg2042_msi_allocate_hwirq(data, nr_irqs);
+	if (hwirq < 0)
+		return hwirq;
+
+	for (i = 0; i < nr_irqs; i++) {
+		err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
+		if (err)
+			goto err_hwirq;
+
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &sg2042_msi_middle_irq_chip, data);
+	}
+
+	return 0;
+
+err_hwirq:
+	sg2042_msi_free_hwirq(data, hwirq, nr_irqs);
+	irq_domain_free_irqs_parent(domain, virq, i);
+
+	return err;
+}
+
+static void sg2042_msi_middle_domain_free(struct irq_domain *domain,
+					  unsigned int virq,
+					  unsigned int nr_irqs)
+{
+	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
+	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+	sg2042_msi_free_hwirq(data, d->hwirq, nr_irqs);
+}
+
+static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
+	.alloc	= sg2042_msi_middle_domain_alloc,
+	.free	= sg2042_msi_middle_domain_free,
+	.select	= msi_lib_irq_domain_select,
+};
+
+#define SG2042_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
+				   MSI_FLAG_USE_DEF_CHIP_OPS)
+
+#define SG2042_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
+
+static const struct msi_parent_ops sg2042_msi_parent_ops = {
+	.required_flags		= SG2042_MSI_FLAGS_REQUIRED,
+	.supported_flags	= SG2042_MSI_FLAGS_SUPPORTED,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.prefix			= "SG2042-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
+static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
+				   struct device *dev)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct irq_domain *plic_domain, *middle_domain;
+	struct fwnode_handle *plic_node;
+
+	plic_node = fwnode_find_reference(fwnode, "msi-ranges", 0);
+	if (IS_ERR(plic_node)) {
+		pr_err("Failed to find the PLIC node!\n");
+		return PTR_ERR(plic_node);
+	}
+
+	plic_domain = irq_find_matching_fwnode(plic_node, DOMAIN_BUS_ANY);
+	fwnode_handle_put(plic_node);
+	if (!plic_domain) {
+		pr_err("Failed to find the PLIC domain\n");
+		return -ENXIO;
+	}
+
+	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs,
+						    fwnode,
+						    &sg2042_msi_middle_domain_ops,
+						    data);
+	if (!middle_domain) {
+		pr_err("Failed to create the MSI middle domain\n");
+		return -ENOMEM;
+	}
+
+	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
+
+	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
+	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
+
+	return 0;
+}
+
+static int sg2042_msi_probe(struct platform_device *pdev)
+{
+	struct fwnode_reference_args args = {};
+	struct sg2042_msi_chipdata *data;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
+	if (IS_ERR(data->reg_clr)) {
+		dev_err(dev, "Failed to map clear register\n");
+		return PTR_ERR(data->reg_clr);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "doorbell");
+	if (!res) {
+		dev_err(dev, "Failed get resource from set\n");
+		return -EINVAL;
+	}
+	data->doorbell_addr = res->start;
+
+	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
+						 "#interrupt-cells", 0, 0, &args);
+	if (ret) {
+		dev_err(dev, "Unable to parse MSI vec base\n");
+		return ret;
+	}
+	fwnode_handle_put(args.fwnode);
+
+	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
+						 NULL, args.nargs + 1,
+						 0, &args);
+	if (ret) {
+		dev_err(dev, "Unable to parse MSI vec number\n");
+		return ret;
+	}
+	fwnode_handle_put(args.fwnode);
+
+	data->irq_first = (u32)args.args[0];
+	data->num_irqs = (u32)args.args[args.nargs - 1];
+
+	mutex_init(&data->msi_map_lock);
+
+	return sg2042_msi_init_domains(data, dev);
+}
+
+static const struct of_device_id sg2042_msi_of_match[] = {
+	{ .compatible	= "sophgo,sg2042-msi" },
+	{}
+};
+
+static struct platform_driver sg2042_msi_driver = {
+	.driver = {
+		.name		= "sg2042-msi",
+		.of_match_table	= sg2042_msi_of_match,
+	},
+	.probe = sg2042_msi_probe,
+};
+builtin_platform_driver(sg2042_msi_driver);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
