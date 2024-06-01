Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D69C25B7E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPkox104ukAhZmO40aBVesey4Qgr2QwWK+1SckmYCXY=; b=O6D/y09dlkEREh
	d1VuMbE1Q843wRZLCU+qlSVl40aCl/IRac6z3yM3JQyMVW6Pa5eAG28zUNwqyAWxrkMnbYjdndgkK
	Xbwif9POovNtfOVpCALA7mNjia5TBe1e+zaT8p2Xq5C4xkeBnE7IYR3LPW0R+XfkUDeOkEvis3mm1
	1EvOPe5VnrTMR8NMsSeO2Z8mGKofxxF16gJtEmkvqaHPbkk292031TPSWbuVojuWooTfWRL3wOW64
	o8tyu2uJCu4oZ7qC36TE34wbBGsYk3CRKXjdOgkaEzzpLmpMmwDO9CDBPQWs5bVfO5D0i9WOxQkMa
	7iDG5ZZeFnFfrMAPC4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQJj-0000000CqM7-2qEN;
	Sat, 01 Jun 2024 15:06:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQJM-0000000Cq03-0T9U
	for linux-riscv@bombadil.infradead.org;
	Sat, 01 Jun 2024 15:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DRgQ4J8YfksV/Gcn1aZkdoBTGJR4bgqwnPhHrgwgqwc=; b=A6PIAsaNkXKAWmkKMqNbx/LpcD
	nmYxoxs/pBKAolXXcuhfIvBtbfmPG8bHbF9DTS/+gzATIyQB43LsNjnVWwdFxppcNSiY8C7Ox6Ga6
	IPxxhUopPhwg9umRtoc42c72r1ZdoZN5lqDkXFjxeP3uIqhn16e/lwqnqlOxTN7FIed7MmYnbmrnX
	E15ZL+dDZRj1mTpArzfzw9GTFcWVbpwZxEvn2csB3H7rw/rfyRFZzXBoQA2mxtvGH3NfYU262yKZe
	k925FdOWoIswl0tNvdsDqk4I5Z1kVVLhDSWcMtGVoWCxkI1xIf8SQ75V4kGqFMIqOPwS0Fg7wc2p7
	Z+5ibCQw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQJG-0000000F3bY-20LF
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:06:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-701ae8698d8so2390874b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254375; x=1717859175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRgQ4J8YfksV/Gcn1aZkdoBTGJR4bgqwnPhHrgwgqwc=;
        b=R3CqmyJMbszpb5cebXpqAGDosZr8W4W7Cf3HO4FqrSFL9miw77LhSRwwa+p8Ud3YCE
         M1GVi2+VXBiO7egpkA320fovndxLNhoLsjTh9m4Fu81EsHkWi2Pag95QBZnTossJiYtw
         t0GcsYfEHo73XToI0AX1PComo9t2Ie46PvoM6GyyyaqIzFWGJfrHfCqXnX1TRa23XwMt
         0x3zATH60TpLdyPB8uW5TZx8VbQpeLouPDb+W4n//a1fL7oyReAz7BIeIFSLuTMdn2++
         3eTGv7vyd420kCuNAk4fJx57gEDnOYklogh4Cg3aO8G5zLUOFA3SFcu+2dCuXYk8FFsZ
         v1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254375; x=1717859175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRgQ4J8YfksV/Gcn1aZkdoBTGJR4bgqwnPhHrgwgqwc=;
        b=XAV98KOqc1VUdPxsc7irbX8dQt1Pq4Ob3fDlUDN8iPHRBiZbEqi7zuVdMzivnkmZgl
         CjvYat69RdtK5b40kzdEYuXLVhQuIEfJ64s90WQAyESd6UF+Frh1ltoYXnjra4VrxbJ+
         DQyw575xi9H0jyzoUkytmqHNrT1l+lw/CC3kUgCeowBT6I+tYGl2mp/UfFKvuAO8ZO0D
         bo05ZcL3o5hYnWqeYzSHGR3Ae4SZfPCCeeveEZkXSUt0NExqI0HatIZ2oqJGvuI4ZUlI
         WX1ctz2M1H1S5qXXqUmoP531MrxpAmL8317mM2z/a62Ghq381HA1LxBZ5/iyIHaXqIl8
         GmWg==
X-Forwarded-Encrypted: i=1; AJvYcCU1yb7/MLzKcfscJ5s3T4X9nhwgGzszF4DnKvvMFmwj3TtnIIJt3+fsi6mENJ9ZQSxWdFeaNZ7lTOTmLUt/cAxon2rv5JVgqRX6ELeQRzbx
X-Gm-Message-State: AOJu0Yx3b1aI2ap/pLASeYXdXkShA5FGiEiP2u45nms5jJxPtgYZeXFj
	80zYAYxd6oeb/kS4Nncu4/EA4QvMq1Op9h2TuBfYjNuaysXhnbIavZ1vWl/P5qs=
X-Google-Smtp-Source: AGHT+IFU6JKmResfgB0jJdbEODfj1EWOkBHlEYzPPEI1h1vZvVKa5zFXkvWGxZojFLKJau0PKL7BKw==
X-Received: by 2002:a05:6a21:32a0:b0:1a7:94ea:a9b4 with SMTP id adf61e73a8af0-1b26f1855f2mr5494518637.32.1717254375001;
        Sat, 01 Jun 2024 08:06:15 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:06:14 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 16/17] irqchip/riscv-aplic: Add ACPI support
Date: Sat,  1 Jun 2024 20:34:10 +0530
Message-Id: <20240601150411.1929783-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_160619_519575_B2A9425C 
X-CRM114-Status: GOOD (  25.90  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add ACPI support in APLIC drivers. Use the mapping created early during
boot to get the details about the APLIC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c | 22 +++++---
 drivers/irqchip/irq-riscv-aplic-main.c   | 68 ++++++++++++++++--------
 drivers/irqchip/irq-riscv-aplic-main.h   |  1 +
 drivers/irqchip/irq-riscv-aplic-msi.c    |  9 +++-
 4 files changed, 68 insertions(+), 32 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 4a3ffe856d6c..34540a0ca4da 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2022 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cpu.h>
@@ -189,17 +190,22 @@ static int aplic_direct_starting_cpu(unsigned int cpu)
 }
 
 static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
-					   u32 *parent_hwirq, unsigned long *parent_hartid)
+					   u32 *parent_hwirq, unsigned long *parent_hartid,
+					   struct aplic_priv *priv)
 {
 	struct of_phandle_args parent;
+	unsigned long hartid;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
+	if (!is_of_node(dev->fwnode)) {
+		hartid = acpi_get_ext_intc_parent_hartid(priv->id, index);
+		if (hartid == INVALID_HARTID)
+			return -ENODEV;
+
+		*parent_hartid = hartid;
+		*parent_hwirq = RV_IRQ_EXT;
+		return 0;
+	}
 
 	rc = of_irq_parse_one(to_of_node(dev->fwnode), index, &parent);
 	if (rc)
@@ -237,7 +243,7 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
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
+	if (is_of_node(dev->fwnode)) {
+		/* Find out number of interrupt sources */
+		rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,num-sources",
+					  &priv->nr_irqs);
+		if (rc) {
+			dev_err(dev, "failed to get number of interrupt sources\n");
+			return rc;
+		}
 
-	/*
-	 * Find out number of IDCs based on parent interrupts
-	 *
-	 * If "msi-parent" property is present then we ignore the
-	 * APLIC IDCs which forces the APLIC driver to use MSI mode.
-	 */
-	if (!of_property_present(to_of_node(dev->fwnode), "msi-parent")) {
-		while (!of_irq_parse_one(to_of_node(dev->fwnode), priv->nr_idcs, &parent))
-			priv->nr_idcs++;
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
