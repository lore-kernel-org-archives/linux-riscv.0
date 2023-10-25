Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814F3C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdQY6K+Kkty7boK/mTV+sl0U+GEVACxgcTNZuYbb6vg=; b=I9NTrovgCvRqz/
	gfaB0lRr94I69o33IJ7i2IfLNjL49n3AXViTTSrmKOTcLibIkkWKiKITRj2kuJM6ruNdHFT60GQC1
	89/InG4OqJjjFpb4VqVEsK1pevjsd5jSzWpPxe8o1ukYdPHn+HEAgL6HisYcuYx+uK2WovcTxI/vq
	ITa7XW9xvk7MwMnT0xWiLzfOaGPahodWdoV9ogtYBPTNcipqdspE9fwMLIMTP4Q+Lw32pKaJS7xk5
	VVFF04n3+jN0UN+2E70px0SAhScKV7vlqXD8TRdzGE93jWhIncNYrHPsPqIcfxiVp6PbSihoA/Lp+
	MPBRPdSLtJpk9Eym8mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkSK-00D42C-0s;
	Wed, 25 Oct 2023 20:26:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRc-00D3PD-2s
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so121341b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265536; x=1698870336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkYG/eGJal6MBtrQ87/cX58dSpgaeRVgeKplUcim3I8=;
        b=LEGmqqS6iAtcpQlX4QopKsEaq+ad4qUJVau8fYkniT7yQUYe8HbxrcPN67HH9Gq3jU
         kNN3HjJ98VlhJL3CK+N9rwr8StR3TbUpW6COu0iDraBXi3x/WH12ar9oVEv0JfNLsB1T
         dzcCkzpBajOIAckyj/QWQ77liKbLdGAuLJ6wet0vOA075zEOq71ocMSYKSHVepIX85P8
         mFNlCLaCo8xxDkhi4L3LxFNITn/jckAoCO3w+yQIAAhS/+vSjJYIeyOjblJs8DELoFSL
         gEVxKoFuGGGhmc73iSOJetcZlymLqyGhnjw3n55UO4M+0AeOv3eQShK5b6be/YR6na52
         UaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265536; x=1698870336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkYG/eGJal6MBtrQ87/cX58dSpgaeRVgeKplUcim3I8=;
        b=NkArnZhqUcf+SP93T6cNE6zUmHoB1zxHbAJjXpBkJM4t22lKHYUQ0skcpOgHSqyqAR
         w7p1vxL6Qn/5meJVAKDlnju5yCsrLGEOhDPvnTJEZr8dOKeyZ/eqUpjUPG6XvUT1OUl1
         hGy8lTIDPbjxu3//bbdu0YFZ8nLzHDB4ywMvHinif2+MKKBTFuBRlBLRzqEJmCK1bZ5S
         7lnUocuHiFxqUKQ/QaMHDVTuxg92feEWt/kUVZGxSBjo0R7o/R6d0hJeSl39VdwQW0X8
         9v8ICN1GRlKeKbq8sW8ABcP1VUs8bGtdHoC8KqskQgxK6IGXb+Olxwlg9mSMgz1UweFT
         Go3Q==
X-Gm-Message-State: AOJu0YywIu+ESosMiJIdqT0JJtkPybTbKCYVlHobLOfdmZfgMI7qS+2b
	NolBgPGTzv4SfU2Wp/xlMtfCrg==
X-Google-Smtp-Source: AGHT+IH2n0LFFVwlMf95ArsCfhkr+WfWmtkWgHTq+KT7Ef6QJzeo2URCzfVgfZYb7yk++CFrabN8pA==
X-Received: by 2002:a05:6a20:bf19:b0:17b:cd83:6555 with SMTP id gc25-20020a056a20bf1900b0017bcd836555mr5312664pzb.23.1698265536197;
        Wed, 25 Oct 2023 13:25:36 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:35 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 15/21] irqchip: riscv-aplic: Add ACPI support
Date: Thu, 26 Oct 2023 01:53:38 +0530
Message-Id: <20231025202344.581132-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132536_949676_73D1B040 
X-CRM114-Status: GOOD (  27.34  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add ACPI support in APLIC drivers. In ACPI, IO devices use Global System
Interrupts (GSI) which is a flat space split across multiple APLICs. So,
the driver also need to provide the mapping from GSI to correct APLIC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h             |   6 ++
 drivers/irqchip/irq-riscv-aplic-direct.c |  22 +++--
 drivers/irqchip/irq-riscv-aplic-main.c   | 105 +++++++++++++++++------
 drivers/irqchip/irq-riscv-aplic-main.h   |   1 +
 drivers/irqchip/irq-riscv-aplic-msi.c    |  10 ++-
 5 files changed, 109 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index ef102b6fa86e..00eb8b0333c2 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -22,6 +22,12 @@
 #define APLIC_PLIC_ID(x) ((x) >> 24)
 #define IDC_CONTEXT_ID(x) ((x) & 0x0000ffff)
 
+#ifdef CONFIG_RISCV_APLIC
+struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi);
+#else
+static inline struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi) { return NULL; }
+#endif
+
 int __init acpi_get_intc_index_hartid(u32 index, unsigned long *hartid);
 int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid);
 void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts);
diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 9ed2666bfb5e..3902e6d32856 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2022 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
@@ -14,6 +15,7 @@
 #include <linux/of_address.h>
 #include <linux/printk.h>
 #include <linux/smp.h>
+#include <asm/acpi.h>
 
 #include "irq-riscv-aplic-main.h"
 
@@ -203,17 +205,20 @@ static int aplic_direct_starting_cpu(unsigned int cpu)
 
 static int aplic_direct_parse_parent_hwirq(struct device *dev,
 					   u32 index, u32 *parent_hwirq,
-					   unsigned long *parent_hartid)
+					   unsigned long *parent_hartid,
+					   struct aplic_priv *priv)
 {
 	struct of_phandle_args parent;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
+	if (!is_of_node(dev->fwnode)) {
+		rc = acpi_get_ext_intc_parent_hartid(priv->id, index, parent_hartid);
+		if (rc)
+			return rc;
+
+		*parent_hwirq = RV_IRQ_EXT;
+		return 0;
+	}
 
 	rc = of_irq_parse_one(to_of_node(dev->fwnode), index, &parent);
 	if (rc)
@@ -251,7 +256,7 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
 
 	/* Setup per-CPU IDC and target CPU mask */
 	for (i = 0; i < priv->nr_idcs; i++) {
-		rc = aplic_direct_parse_parent_hwirq(dev, i, &hwirq, &hartid);
+		rc = aplic_direct_parse_parent_hwirq(dev, i, &hwirq, &hartid, priv);
 		if (rc) {
 			dev_warn(dev, "parent irq for IDC%d not found\n", i);
 			continue;
@@ -335,6 +340,7 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
 		return -ENOMEM;
 	}
 
+	dev_set_drvdata(dev, priv);
 	/* Advertise the interrupt controller */
 	dev_info(dev, "%d interrupts directly connected to %d CPUs\n",
 		 priv->nr_irqs, priv->nr_idcs);
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d1b342b66551..f0ba1411c95e 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -4,12 +4,15 @@
  * Copyright (C) 2022 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/printk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/irqchip/riscv-aplic.h>
+#include <linux/irqchip/riscv-imsic.h>
+#include <asm/acpi.h>
 
 #include "irq-riscv-aplic-main.h"
 
@@ -137,38 +140,44 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev,
 		     void __iomem *regs)
 {
 	struct of_phandle_args parent;
+	struct acpi_madt_aplic *aplic;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
-
 	/* Save device pointer and register base */
 	priv->dev = dev;
 	priv->regs = regs;
 
-	/* Find out number of interrupt sources */
-	rc = of_property_read_u32(to_of_node(dev->fwnode),
-					     "riscv,num-sources",
-					     &priv->nr_irqs);
-	if (rc) {
-		dev_err(dev, "failed to get number of interrupt sources\n");
-		return rc;
-	}
-
-	/*
-	 * Find out number of IDCs based on parent interrupts
-	 *
-	 * If "msi-parent" property is present then we ignore the
-	 * APLIC IDCs which forces the APLIC driver to use MSI mode.
-	 */
-	if (!of_property_present(to_of_node(dev->fwnode), "msi-parent")) {
-		while (!of_irq_parse_one(to_of_node(dev->fwnode),
-					 priv->nr_idcs, &parent))
-			priv->nr_idcs++;
+	if (is_of_node(dev->fwnode)) {
+		/* Find out number of interrupt sources */
+		rc = of_property_read_u32(to_of_node(dev->fwnode),
+					  "riscv,num-sources",
+					  &priv->nr_irqs);
+		if (rc) {
+			dev_err(dev, "failed to get number of interrupt sources\n");
+			return rc;
+		}
+
+		/*
+		 * Find out number of IDCs based on parent interrupts
+		 *
+		 * If "msi-parent" property is present then we ignore the
+		 * APLIC IDCs which forces the APLIC driver to use MSI mode.
+		 */
+		if (!of_property_present(to_of_node(dev->fwnode), "msi-parent")) {
+			while (!of_irq_parse_one(to_of_node(dev->fwnode),
+						 priv->nr_idcs, &parent))
+				priv->nr_idcs++;
+		}
+	} else {
+		aplic = *(struct acpi_madt_aplic **)dev_get_platdata(dev);
+		if (!aplic) {
+			dev_err(dev, "APLIC platform data is NULL!\n");
+			return -1;
+		}
+		priv->gsi_base = aplic->gsi_base;
+		priv->nr_irqs = aplic->num_sources;
+		priv->nr_idcs = aplic->num_idcs;
+		priv->id = aplic->id;
 	}
 
 	/* Setup initial state APLIC interrupts */
@@ -177,9 +186,36 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev,
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
+
+LIST_HEAD(aplic_list);
+struct aplic_priv_list {
+	struct aplic_priv *priv;
+	struct list_head list;
+};
+
+struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi)
+{
+	struct aplic_priv_list *aplic_element;
+	struct list_head *i, *tmp;
+
+	/* Find the APLIC that manages this GSI. */
+	list_for_each_safe(i, tmp, &aplic_list) {
+		aplic_element = list_entry(i, struct aplic_priv_list, list);
+		if (gsi >= aplic_element->priv->gsi_base &&
+		    gsi < (aplic_element->priv->gsi_base + aplic_element->priv->nr_irqs))
+			return aplic_element->priv->dev->fwnode;
+	}
+
+	return NULL;
+}
+
+#endif
+
 static int aplic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct aplic_priv *priv;
 	bool msi_mode = false;
 	struct resource *res;
 	void __iomem *regs;
@@ -204,6 +240,9 @@ static int aplic_probe(struct platform_device *pdev)
 	if (is_of_node(dev->fwnode))
 		msi_mode = of_property_present(to_of_node(dev->fwnode),
 						"msi-parent");
+	else
+		msi_mode = imsic_acpi_get_fwnode(NULL) ? 1 : 0;
+
 	if (msi_mode)
 		rc = aplic_msi_setup(dev, regs);
 	else
@@ -214,6 +253,20 @@ static int aplic_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	struct aplic_priv_list *aplic_element;
+
+	priv = dev_get_drvdata(dev);
+	if (priv) {
+		aplic_element = devm_kzalloc(dev, sizeof(*aplic_element), GFP_KERNEL);
+		if (!aplic_element)
+			return -ENOMEM;
+
+		aplic_element->priv = priv;
+		list_add_tail(&aplic_element->list, &aplic_list);
+	}
+#endif
+
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index 78267ec58098..dc022e89bc97 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.h
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -28,6 +28,7 @@ struct aplic_priv {
 	u32			gsi_base;
 	u32			nr_irqs;
 	u32			nr_idcs;
+	u32			id;
 	void __iomem		*regs;
 	struct aplic_msicfg	msicfg;
 };
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 086d00e0429e..433ab2f270d9 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -178,6 +178,7 @@ static void aplic_msi_write_msg(struct msi_desc *desc, struct msi_msg *msg)
 int aplic_msi_setup(struct device *dev, void __iomem *regs)
 {
 	const struct imsic_global_config *imsic_global;
+	struct irq_domain *msi_domain;
 	struct irq_domain *irqdomain;
 	struct aplic_priv *priv;
 	struct aplic_msicfg *mc;
@@ -261,8 +262,14 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
 		 * IMSIC and the IMSIC MSI domains are created later through
 		 * the platform driver probing so we set it explicitly here.
 		 */
-		if (is_of_node(dev->fwnode))
+		if (is_of_node(dev->fwnode)) {
 			of_msi_configure(dev, to_of_node(dev->fwnode));
+		} else {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			if (msi_domain)
+				dev_set_msi_domain(dev, msi_domain);
+		}
 	}
 
 	/* Create irq domain instance for the APLIC MSI-mode */
@@ -276,6 +283,7 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
 		return -ENOMEM;
 	}
 
+	dev_set_drvdata(dev, priv);
 	/* Advertise the interrupt controller */
 	pa = priv->msicfg.base_ppn << APLIC_xMSICFGADDR_PPN_SHIFT;
 	dev_info(dev, "%d interrupts forwared to MSI base %pa\n",
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
