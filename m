Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF01AD12D6E
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9P+0eCfLH7DWqbuXlMblorTf+7kMDw1uPBw9rkwmXhY=; b=RVwQybg/W9JLO2
	KszHzPXNQMAIouSAfuycQ1I8J9hE4dt0OXQ8g8M6vYB4mI0Q6JPcC8kkDSpsr6WXChOHVOLSZZqYT
	8ymZHUrsolO/Ftdlh9lDFVwUdfe6h1sy4BclEQ6DCzK3vABdF0lpP4nV7b4RlBBjgRdSLHfSRhsKl
	mr+Uz7sAbLBgB49a7YjAPZTf13beSMTO+ot2l6erPOgA1H8/HJdraRqayictHBaw+DpSSM5GSqEaE
	yInHcCCLEW50VYW2/6zvPlJDvz7DSYx2KJ2SWIMkVfdc82E9YUbEk0d6jgyVwfLND6nfNyepibGfQ
	ui8ygLZX6WOTtIAUSgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALcv-0000000GGn6-1QoV;
	Mon, 11 Nov 2024 04:02:09 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALcs-0000000GGmQ-362n
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 04:02:08 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-288d74b3a91so2641501fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 20:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731297725; x=1731902525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+fPQhcktyhn766PuZ6e67L6+1wcYRMcJZUggR/XiQ0=;
        b=i/YATcfcEnC6O1dRy4wh0PRgSjV9C+v7kvHs59GlwS+Cjb6m+7PlHn259FVpdujX7G
         Bm909PDSWH/m1FEsuOG/N0jOyv5d63/HXbNAqZjg9jf+T/f0w8VD63bcHZK8BDM4fqYD
         No0YPqYcnrMkuj8HohOfd7GHBRRHPTygGu6cVmOP0wkbJRfTA6x5IrNsXPwrm3mmMXcX
         r6a9MYt9VC59zKjMSTWRO3z9AGyFt9F7XS1xCPBc2HE1x3RR8DdcFFG3eu31mbXPkDDF
         dSncQ1UZdWPFjg9w7xJ7MbE2Vvl8UbLtwHfek4SFa6UJe4YtsvnNm1ZfG+qVqGIG2/UX
         YBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731297725; x=1731902525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+fPQhcktyhn766PuZ6e67L6+1wcYRMcJZUggR/XiQ0=;
        b=iZFPdqoxjDJpprQut+pmchIlNEI679i7t9TS4Bc1s8atFkfRWGX1jVb/+b6avolBGd
         SAI2nxfQoO2xcjb4RtJCH9xDicvQ22dRTF3O1eeO3I4E7XQhCSGYyTLIIjPAM5/1blnc
         EJDn/NFUNWDPOJ7HvRUD9hbP9kIPvdvJKLhCSp1op27B4QqY/CvHrX/8+MpxoKwD0Lk6
         NAvgKt/rQtViLsyc1qK7egRjJk0isz56cvzrzcBrYGyC1wwzFOFBS9YHoUA/o9noinZ1
         W/OiJkWNMuxaRvRKrKZB9cLesevjkF9XJ1liiTuSD0+I6xLvhbjIeTo64UKW7GXJwyhI
         NQzw==
X-Forwarded-Encrypted: i=1; AJvYcCVuwCdvUeWMnCOuhPaeIKgb6cibQknTW+gtcugcVK4oHhINS/R6n4lxUfUxi90rvDBPrt373PDzbl3Drg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkf/WKTPIclTscBKGo+WEXrb84ajIx17DGBrL8hA7c3WxXDlHw
	0g0/DgoQ9sOQ7hGjr6xeT8V1Js3V2BxnNEnwCHTzYsjXgqYkMbjC
X-Google-Smtp-Source: AGHT+IE1+3vDt96wuzJHta3Nkt+aV05zWOrqsajEFRzvGnq1988dsLWPrG80m3LN6mFGflF/nyetBQ==
X-Received: by 2002:a05:6870:380d:b0:277:e08a:23a0 with SMTP id 586e51a60fabf-295602fd28cmr7803476fac.41.1731297723750;
        Sun, 10 Nov 2024 20:02:03 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a108e29f8sm2121721a34.47.2024.11.10.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:02:02 -0800 (PST)
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
Subject: [PATCH 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt controller
Date: Mon, 11 Nov 2024 12:01:55 +0800
Message-Id: <8076fe2af9f2b007a42c986ed193ba50ff674bfa.1731296803.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731296803.git.unicorn_wang@outlook.com>
References: <cover.1731296803.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_200206_817653_173E2BE0 
X-CRM114-Status: GOOD (  25.62  )
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
 drivers/irqchip/Kconfig          |   8 +
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-sg2042-msi.c | 255 +++++++++++++++++++++++++++++++
 3 files changed, 264 insertions(+)
 create mode 100644 drivers/irqchip/irq-sg2042-msi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d82bcab233a1..76a38a4d62eb 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -729,6 +729,14 @@ config MCHP_EIC
 	help
 	  Support for Microchip External Interrupt Controller.
 
+config SOPHGO_SG2042_MSI
+	bool "Sophgo SG2042 MSI controller"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Support for the Sophgo SG2042 MSI Controller.
+	  This on-chip interrupt controller enables MSI sources to be
+	  routed to the primary PLIC controller on SoC.
+
 config SUNPLUS_SP7021_INTC
 	bool "Sunplus SP7021 interrupt controller" if COMPILE_TEST
 	default SOC_SP7021
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index e3679ec2b9f7..53617890268a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -125,4 +125,5 @@ obj-$(CONFIG_WPCM450_AIC)		+= irq-wpcm450-aic.o
 obj-$(CONFIG_IRQ_IDT3243X)		+= irq-idt3243x.o
 obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
+obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
new file mode 100644
index 000000000000..79449f974ed5
--- /dev/null
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SG2042 MSI Controller
+ *
+ * Copyright (C) 2024 Sophgo Technology Inc.
+ * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
+ */
+
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_pci.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct sg2042_msi_data {
+	void __iomem	*reg_clr; /* clear reg, see TRM, 10.1.33, GP_INTR0_CLR */
+
+	u64		doorbell_addr; /* see TRM, 10.1.32, GP_INTR0_SET */
+
+	u32		irq_first; /* The vector number that MSIs starts */
+	u32		num_irqs;  /* The number of vectors for MSIs */
+
+	unsigned long	*msi_map;
+	struct mutex	msi_map_lock; /* lock for msi_map */
+};
+
+static int sg2042_msi_allocate_hwirq(struct sg2042_msi_data *priv, int num_req)
+{
+	int first;
+
+	mutex_lock(&priv->msi_map_lock);
+
+	first = bitmap_find_free_region(priv->msi_map, priv->num_irqs,
+					get_count_order(num_req));
+	if (first < 0) {
+		mutex_unlock(&priv->msi_map_lock);
+		return -ENOSPC;
+	}
+
+	mutex_unlock(&priv->msi_map_lock);
+
+	return priv->irq_first + first;
+}
+
+static void sg2042_msi_free_hwirq(struct sg2042_msi_data *priv,
+				  int hwirq, int num_req)
+{
+	int first = hwirq - priv->irq_first;
+
+	mutex_lock(&priv->msi_map_lock);
+	bitmap_release_region(priv->msi_map, first, get_count_order(num_req));
+	mutex_unlock(&priv->msi_map_lock);
+}
+
+static void sg2042_msi_irq_ack(struct irq_data *d)
+{
+	struct sg2042_msi_data *data  = irq_data_get_irq_chip_data(d);
+	int bit_off = d->hwirq - data->irq_first;
+
+	writel(1 << bit_off, (unsigned int *)data->reg_clr);
+
+	irq_chip_ack_parent(d);
+}
+
+static void sg2042_msi_irq_compose_msi_msg(struct irq_data *data,
+					   struct msi_msg *msg)
+{
+	struct sg2042_msi_data *priv = irq_data_get_irq_chip_data(data);
+
+	msg->address_hi = upper_32_bits(priv->doorbell_addr);
+	msg->address_lo = lower_32_bits(priv->doorbell_addr);
+	msg->data = 1 << (data->hwirq - priv->irq_first);
+
+	pr_debug("%s hwirq[%d]: address_hi[%#x], address_lo[%#x], data[%#x]\n",
+		 __func__,
+		 (int)data->hwirq, msg->address_hi, msg->address_lo, msg->data);
+}
+
+static struct irq_chip sg2042_msi_middle_irq_chip = {
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
+	struct irq_fwspec fwspec;
+	struct irq_data *d;
+	int ret;
+
+	fwspec.fwnode = domain->parent->fwnode;
+	fwspec.param_count = 2;
+	fwspec.param[0] = hwirq;
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
+	struct sg2042_msi_data *priv = domain->host_data;
+	int hwirq, err, i;
+
+	hwirq = sg2042_msi_allocate_hwirq(priv, nr_irqs);
+	if (hwirq < 0)
+		return hwirq;
+
+	for (i = 0; i < nr_irqs; i++) {
+		err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
+		if (err)
+			goto err_hwirq;
+
+		pr_debug("%s: virq[%d], hwirq[%d]\n",
+			 __func__, virq + i, (int)hwirq + i);
+
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &sg2042_msi_middle_irq_chip, priv);
+	}
+
+	return 0;
+
+err_hwirq:
+	sg2042_msi_free_hwirq(priv, hwirq, nr_irqs);
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
+	struct sg2042_msi_data *priv = irq_data_get_irq_chip_data(d);
+
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+	sg2042_msi_free_hwirq(priv, d->hwirq, nr_irqs);
+}
+
+static const struct irq_domain_ops pch_msi_middle_domain_ops = {
+	.alloc	= sg2042_msi_middle_domain_alloc,
+	.free	= sg2042_msi_middle_domain_free,
+};
+
+static int sg2042_msi_init_domains(struct sg2042_msi_data *priv,
+				   struct device_node *node)
+{
+	struct irq_domain *plic_domain, *middle_domain;
+	struct device_node *plic_node;
+	struct fwnode_handle *fwnode = of_node_to_fwnode(node);
+
+	if (!of_find_property(node, "interrupt-parent", NULL)) {
+		pr_err("Can't find interrupt-parent!\n");
+		return -EINVAL;
+	}
+
+	plic_node = of_irq_find_parent(node);
+	if (!plic_node) {
+		pr_err("Failed to find the PLIC node!\n");
+		return -ENXIO;
+	}
+
+	plic_domain = irq_find_host(plic_node);
+	of_node_put(plic_node);
+	if (!plic_domain) {
+		pr_err("Failed to find the PLIC domain\n");
+		return -ENXIO;
+	}
+
+	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, priv->num_irqs,
+						    fwnode,
+						    &pch_msi_middle_domain_ops,
+						    priv);
+	if (!middle_domain) {
+		pr_err("Failed to create the MSI middle domain\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int sg2042_msi_probe(struct platform_device *pdev)
+{
+	struct sg2042_msi_data *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(struct sg2042_msi_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
+	if (IS_ERR(data->reg_clr)) {
+		dev_err(&pdev->dev, "Failed to map clear register\n");
+		return PTR_ERR(data->reg_clr);
+	}
+
+	if (of_property_read_u64(pdev->dev.of_node, "sophgo,msi-doorbell-addr",
+				 &data->doorbell_addr)) {
+		dev_err(&pdev->dev, "Unable to parse MSI doorbell addr\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(pdev->dev.of_node, "sophgo,msi-base-vec",
+				 &data->irq_first)) {
+		dev_err(&pdev->dev, "Unable to parse MSI vec base\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(pdev->dev.of_node, "sophgo,msi-num-vecs",
+				 &data->num_irqs)) {
+		dev_err(&pdev->dev, "Unable to parse MSI vec number\n");
+		return -EINVAL;
+	}
+
+	mutex_init(&data->msi_map_lock);
+
+	data->msi_map = bitmap_zalloc(data->num_irqs, GFP_KERNEL);
+	if (!data->msi_map)
+		return -ENOMEM;
+
+	return sg2042_msi_init_domains(data, pdev->dev.of_node);
+}
+
+static const struct of_device_id sg2042_msi_of_match[] = {
+	{ .compatible = "sophgo,sg2042-msi" },
+	{}
+};
+
+static struct platform_driver sg2042_msi_driver = {
+	.driver = {
+		.name = "sg2042-msi",
+		.of_match_table = of_match_ptr(sg2042_msi_of_match),
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
