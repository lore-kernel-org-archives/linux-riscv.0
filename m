Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC6EC3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAxpsyFVfAbZ5xY9ZRA2LlnkUDRo8oA0MIVk7UBQ8OQ=; b=GOiTGmh3daL5WG
	MvmTySkZRRWTEYSxaQCWsxeSt0kEKTovWNWfn9085VgdTDbJyM5JriLLMoRwDBAXd0bkDNBTgSYUO
	oVzJMhJeeseXRvKTbSu7GHPlJUdRl/54lU1HkjWkH6+uRdK54mz4YYlL4lm4S1UUA2q+HwyCrvWTR
	9R3Q4zEW3DW/rpHrY34AQxxD517IX0LVtA2YimK1k4z8WZs11o4R/IWtW2JXGq2ararFPZ/0Ao35N
	YHMRAmSvMbReCSc1c2Qam0HYhKNAlhSycdzwHOflZoL3yda5T2u2tovqyECtH++S4Q0E7zbmH3Evk
	SUlQ+tl6sonVAUARs+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRZI-0000000BgrK-27tI;
	Mon, 29 Jul 2024 14:41:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRIY-0000000BZCH-11VQ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:24:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fd70ba6a15so19926405ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263065; x=1722867865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtHN5RSatiirKkuRPrN7Xezrvz6FAse7wNTwc5cY9vQ=;
        b=CDPxF6LVV5sasQdR+PoDz2iABiu9KNQVZPfA9mb9HkQkHFnLxbDY6Ze7TaSGlmw8mU
         g0GNbxVoLeB6f+tvWIgtEqanK1c0jgHiBVKOY5NA4OITSKsYvxZov4ZCign4cpU0yFwV
         jpvx4I94x1BNXCMCwrqQlx74C9dJaMMytrTLfTWA7VvZ9DD0XdEtx6HkB5Vh3+yhppCO
         9qv80kB82GKz+9Z/h+6no1KIJ7jb620sDmCEGJ76xqTtDiCvxD9lkxEdfta52rg2xpVM
         En/cCFcKosuHjmyEQjKJZhco9U8jpkSCo+43CX12SDquktJkvG307Jt2Jm05jcXVYKCF
         snFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263065; x=1722867865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtHN5RSatiirKkuRPrN7Xezrvz6FAse7wNTwc5cY9vQ=;
        b=l9tdEM9BTHY/o19y91Vh4ilRixyHuBzLiwBxnoZJNxxj4N98+KF6jZpuSQTHBI+ZGw
         i9xSeAVE7kBgU/5TpIs5DtXzUcy943OgaplFaOvFmt+sjzzsBO88Doj708ROc05F/lTV
         TkBtR3IZTLB12olZe+Z0ErNjgANIm9DaLrDXGpcFc+U9R7GLfeDHZ9LOghg4ly0lyMEd
         L2tj7nsHmcIOzAh5FA2Pjd4/Wk6xV86C5BclIx2RgJAhacuiswqkyGETvhjRUYXECwE0
         +F3N+u/tOcRn6gZWZVs4x6spvYfWu4uNOPt2JXUP9sYJQd/PlyvvqNLOyq/blqBV7E1u
         qpIg==
X-Forwarded-Encrypted: i=1; AJvYcCUa6dWxB5nFmXaW9kzvHA3sl0mhuXA2OVG2PMv3/x36G6k7og+UnMHoU8Whd3s0mRZ6M8P6A6+VI4uz4hp77TWtn86ZvUD0v2+DHzobtdMs
X-Gm-Message-State: AOJu0YyH+PgonYKF4pmL0Xx4Ax3sMxV8s51o55Knh1C2ieCGG22Tr37S
	pM4f1tYZ+Yxz/jFySQOMq6nsz57ApwkXMwXF0vMSpMDRlMUHQqWB/jvfqh4Y7Kc=
X-Google-Smtp-Source: AGHT+IFQUf/+EhYfgsVrzK2L/oleohsnmuLKT1iKr9sPO9lBK/mJauG7ujc+tgm88sfndaMqzPY+Eg==
X-Received: by 2002:a17:902:eccf:b0:1fb:34ef:4467 with SMTP id d9443c01a7336-1ff048e2267mr57478325ad.43.1722263065556;
        Mon, 29 Jul 2024 07:24:25 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:24:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 16/17] irqchip/riscv-aplic: Add ACPI support
Date: Mon, 29 Jul 2024 19:52:38 +0530
Message-ID: <20240729142241.733357-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072426_292490_98AA448D 
X-CRM114-Status: GOOD (  26.53  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Anup Patel <anup@brainfault.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add ACPI support in APLIC drivers. Use the mapping created early during
boot to get the details about the APLIC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c | 22 +++++---
 drivers/irqchip/irq-riscv-aplic-main.c   | 69 ++++++++++++++++--------
 drivers/irqchip/irq-riscv-aplic-main.h   |  1 +
 drivers/irqchip/irq-riscv-aplic-msi.c    |  9 +++-
 4 files changed, 69 insertions(+), 32 deletions(-)

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
index 28dd175b5764..8357c5f9921a 100644
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
 	struct device_node *np = to_of_node(dev->fwnode);
 	struct of_phandle_args parent;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!np)
-		return -EINVAL;
-
 	/* Save device pointer and register base */
 	priv->dev = dev;
 	priv->regs = regs;
 
-	/* Find out number of interrupt sources */
-	rc = of_property_read_u32(np, "riscv,num-sources", &priv->nr_irqs);
-	if (rc) {
-		dev_err(dev, "failed to get number of interrupt sources\n");
-		return rc;
-	}
+	if (np) {
+		/* Find out number of interrupt sources */
+		rc = of_property_read_u32(np, "riscv,num-sources", &priv->nr_irqs);
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
-	if (!of_property_present(np, "msi-parent")) {
-		while (!of_irq_parse_one(np, priv->nr_idcs, &parent))
-			priv->nr_idcs++;
+		/*
+		 * Find out number of IDCs based on parent interrupts
+		 *
+		 * If "msi-parent" property is present then we ignore the
+		 * APLIC IDCs which forces the APLIC driver to use MSI mode.
+		 */
+		if (!of_property_present(np, "msi-parent")) {
+			while (!of_irq_parse_one(np, priv->nr_idcs, &parent))
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
@@ -184,7 +197,11 @@ static int aplic_probe(struct platform_device *pdev)
 	 * If msi-parent property is present then setup APLIC MSI
 	 * mode otherwise setup APLIC direct mode.
 	 */
-	msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
+	if (is_of_node(dev->fwnode))
+		msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
+	else
+		msi_mode = imsic_acpi_get_fwnode(NULL) ? 1 : 0;
+
 	if (msi_mode)
 		rc = aplic_msi_setup(dev, regs);
 	else
@@ -192,6 +209,11 @@ static int aplic_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
+
 	return rc;
 }
 
@@ -204,6 +226,7 @@ static struct platform_driver aplic_driver = {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
