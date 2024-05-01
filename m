Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC909C10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSiO0JeybRvhXcPLgl0Jrlo1qRqyug5NNCRG3SE9Owk=; b=MycAop3r2IUhIG
	sjqkADT20g5IJosAkPjjijIK6XoSST9CCEX2ih6GnnoH/AK+1yOCwGEyUr610dmOfhDrw9yJxu2PU
	ydZ14H+IQwHzwjulu14s/P0bac0IHL7qrt2j4tlPW90vKFkBtrpfbi4wCWGWcUu93u7qg7TMc/9sx
	RxWNaeUyIq1TFaidKwOCYW9ii3i1MohByFU0Lh5jtr0+sBZj2Qt4cNh1Fy/jshyl3LMFnJWAltScP
	xt0UlEYOXlERHdz3f+HzTGgLW1brH1p+OlkmYxngBjYqJu5gKdvtXZzwwycqC1Omaa2NcwYM70NpQ
	9b2O6dibrgyPXP+yWSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29Ej-00000009VjW-04Qw;
	Wed, 01 May 2024 12:39:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28wK-00000009NOO-3am5
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:20:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e651a9f3ffso33948475ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714566000; x=1715170800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKprQ9DjgmWeNOp2jgUX6DT/fQdt5/GgPVbDil8wt68=;
        b=P2xF/gUQNdzMZepSJMC5sPBmCgEfWnAmOofORLqLDIPVDP7SAtAmUJt/Wpbwy4ulW1
         asUYGWTmHeRwWsjxGOCVH4PfGBtTFAlVLn/CXsgdAU2Gl9srWTN7o27/kEzPZIcYYiTi
         oGUfU4k/TKmMwISc9unkZ1CRmdrmwQuQ7EWFmRq0z9U2xIKHfDlV297NNEC4RKc5JNj5
         NuTRQOhp744Y5Ra5sMxFtl1tqOtRo/ElcJEA02GqwHRDBwM+drIhRmQgymNpRzjBwzYs
         s6Q2/oRhSMqCxHHP6lwRhFdd1NwwdjgIlsoplk+/CiMCPRSUymB8Osa+QpWVI3v6uFxI
         cCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714566000; x=1715170800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKprQ9DjgmWeNOp2jgUX6DT/fQdt5/GgPVbDil8wt68=;
        b=dnVrDS9nGQnXK+kbNAP1Q4RmjxiqN48naFC0sWMeQ2IQC9QeX2mmDh6u0DdDlxPMnn
         YFTkqQOCZ8xGf6fDjUO6ED6ZriEjPcmrRqgqaEFUFHbgmHZ/lfdFhuXwAtU9yNiwC0JJ
         FouQFZPCYwrJfcblthfk5sP4FPIKGOhwi8qmhsfgsAjQTVzMiwa41M9Zhli+Wp5CqV7q
         yoHUnJ2ma9dMrCBKKdjF0CPPsaF2rclwLsm7qEtVmB6nezFKXSn+ig9+aLY2aH5XnxYX
         pem+p/AG12HZAA24dNKx0oJDdYUtCHaDvQjlynndEkJzFzrZUz5bzOqtqxPwSgmONfe9
         WGDw==
X-Forwarded-Encrypted: i=1; AJvYcCWPEpEF9Im5UIoJWQiU5zC8UNLIaOfVirQKvvJY8DxX3jX+rSZFq+x9s7kxXINYxvSeHNvBxkbOWBszEyuUm6NPhx0bFvQpgoXhn61OBGM4
X-Gm-Message-State: AOJu0YzEz6wseIMq0Jg9wGBVMWw5PkFf2InPJsXVERwpzjcBLrjsTX/I
	ypjSV13RgZ3m/spqsdgxWw5ZLC2V4l4RpWFkLQQlHk1RFWp7Kcsk6rbV13UvSeI=
X-Google-Smtp-Source: AGHT+IHXX5ILEyglT/Py3DGUVj43d4poupz49yi1BZblVtQazhBuHxJlZGQemov9OMPe6qk3xCXV3Q==
X-Received: by 2002:a17:902:e841:b0:1eb:156f:8d01 with SMTP id t1-20020a170902e84100b001eb156f8d01mr2061754plg.40.1714566000196;
        Wed, 01 May 2024 05:20:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:19:59 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 15/17] irqchip/riscv-aplic: Add ACPI support
Date: Wed,  1 May 2024 17:47:40 +0530
Message-Id: <20240501121742.1215792-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_052001_039895_EC129BF9 
X-CRM114-Status: GOOD (  26.20  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add ACPI support in APLIC drivers. Use the mapping created early during
boot to get the details about the APLIC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c | 20 ++++---
 drivers/irqchip/irq-riscv-aplic-main.c   | 70 ++++++++++++++++--------
 drivers/irqchip/irq-riscv-aplic-main.h   |  1 +
 drivers/irqchip/irq-riscv-aplic-msi.c    |  9 ++-
 4 files changed, 67 insertions(+), 33 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 4a3ffe856d6c..e24c2d3c78f6 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2022 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cpu.h>
@@ -189,17 +190,20 @@ static int aplic_direct_starting_cpu(unsigned int cpu)
 }
 
 static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
-					   u32 *parent_hwirq, unsigned long *parent_hartid)
+					   u32 *parent_hwirq, unsigned long *parent_hartid,
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
@@ -237,7 +241,7 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
 	/* Setup per-CPU IDC and target CPU mask */
 	current_cpu = get_cpu();
 	for (i = 0; i < priv->nr_idcs; i++) {
-		rc = aplic_direct_parse_parent_hwirq(dev, i, &hwirq, &hartid);
+		rc = aplic_direct_parse_parent_hwirq(dev, i, &hwirq, &hartid, priv);
 		if (rc) {
 			dev_warn(dev, "parent irq for IDC%d not found\n", i);
 			continue;
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 774a0c97fdab..c1fd328ddf7d 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -4,8 +4,10 @@
  * Copyright (C) 2022 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/irqchip/riscv-aplic.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -125,39 +127,50 @@ static void aplic_init_hw_irqs(struct aplic_priv *priv)
 	writel(0, priv->regs + APLIC_DOMAINCFG);
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id aplic_acpi_match[] = {
+	{ "RSCV0002", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, aplic_acpi_match);
+
+#endif
+
 int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs)
 {
 	struct of_phandle_args parent;
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
-	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,num-sources",
-				  &priv->nr_irqs);
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
-		while (!of_irq_parse_one(to_of_node(dev->fwnode), priv->nr_idcs, &parent))
-			priv->nr_idcs++;
+	if (is_of_node(dev->fwnode)) {
+		/* Find out number of interrupt sources */
+		rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,num-sources",
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
+			while (!of_irq_parse_one(to_of_node(dev->fwnode), priv->nr_idcs, &parent))
+				priv->nr_idcs++;
+		}
+	} else {
+		rc = riscv_acpi_get_gsi_info(dev->fwnode, &priv->gsi_base, &priv->id,
+					     &priv->nr_irqs, &priv->nr_idcs);
+		if (rc) {
+			dev_err(dev, "failed to find GSI mapping\n");
+			return rc;
+		}
 	}
 
 	/* Setup initial state APLIC interrupts */
@@ -186,6 +199,9 @@ static int aplic_probe(struct platform_device *pdev)
 	 */
 	if (is_of_node(dev->fwnode))
 		msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
+	else
+		msi_mode = imsic_acpi_get_fwnode(NULL) ? 1 : 0;
+
 	if (msi_mode)
 		rc = aplic_msi_setup(dev, regs);
 	else
@@ -193,6 +209,11 @@ static int aplic_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
+
 	return rc;
 }
 
@@ -205,6 +226,7 @@ static struct platform_driver aplic_driver = {
 	.driver = {
 		.name		= "riscv-aplic",
 		.of_match_table	= aplic_match,
+		.acpi_match_table = ACPI_PTR(aplic_acpi_match),
 	},
 	.probe = aplic_probe,
 };
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index 4393927d8c80..9fbf45c7b4f7 100644
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
index 028444af48bd..f5020241e0ed 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -157,6 +157,7 @@ static const struct msi_domain_template aplic_msi_template = {
 int aplic_msi_setup(struct device *dev, void __iomem *regs)
 {
 	const struct imsic_global_config *imsic_global;
+	struct irq_domain *msi_domain;
 	struct aplic_priv *priv;
 	struct aplic_msicfg *mc;
 	phys_addr_t pa;
@@ -239,8 +240,14 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
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
 
 	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN, &aplic_msi_template,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
