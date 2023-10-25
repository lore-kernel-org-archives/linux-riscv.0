Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEB8C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNIW7yTPjJxlyIG0wjpDl0CLc3fWIBnAsowNv5lp7l8=; b=ku570fCA9eRQ14
	5FhfwaofwAv97Lycl36SUhtjo/LPuAAFtNblzCoEeFGgYrTRMFcqT9yIId0VHoDLyJTkJUjyssayW
	Xd+qvJ1SFU9nbPKEAXz0oreYIdo9siylmonFFH3fOF5slrZ/2Pq1394q/a308+1LyKVtQWgaj8Ha+
	mLrz5/yucK8ARSmeOVWNAjgHbL8eb8NnDZ2vN79S5kkrts6JzI+z2HQqsvJlJ/bMMYaXYaxvy9Olr
	1LKX0BQSMs2tRPWYkGiRAPL/T9jihQG/d3zAMe1y12qyeM3ji9ojoGz0w6+DVUlz6qaXCJ0iHo4Ng
	f7XtYgg9R0SmwAgzGbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkST-00D4A2-0t;
	Wed, 25 Oct 2023 20:26:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRi-00D3Ua-27
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:45 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6b26a3163acso122269b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265542; x=1698870342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGPt9IKGXmO6OfBeavundfuVbu/hSGKOkv1OmRAdM8o=;
        b=m54NzplEbGfFuoLbuLgWGGOAJcwMT9HS0L1ddJFIJ4JmIuyASGN5DYFbiEnlaYSMag
         vfRl8bDSJfsLvej1S2NcnKadY41i0ox/ULGoglAA37hZaFrV1O6b2OAzy8WH5+AVEJpP
         X7xGQjCbF1hC5ie8TU8JBFn+E+uhXQDC3DwFffBO4Fd15kYNR+YXIHhzF0QB51IxKGwC
         OBTFYafT6yo4PKzSGnuz196AnbeoivblGdwH5MOuQlTkLFF7Xan3BfCh23Q52bzZJ7FN
         KAb8nygX2vQx08qxASMP+hGaplz60gZF/DAZL4VqlNr2IisvXlQPLJXce4NDrZ3VljCP
         PKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265542; x=1698870342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGPt9IKGXmO6OfBeavundfuVbu/hSGKOkv1OmRAdM8o=;
        b=w9R+7RDj/Sd3xVENDtScUJY8nYQyI6pjM/U6RiJvH0qfyXcrIt14UxkIjcAzDj6hiv
         NHtiUnNH5by/j283mbnMP/KrPdBaqG2zmNkcKDkjs1MTpzPein5Oa0JXne1bahoXCfN1
         kFdkZKOJ4XZlr7jdjXjJHulMffWB+pRW+aLOMm7lBY1Qsc2T3YSYFOoob4C2KiHDn2dU
         j8Xz/FrTMh+dHfTG0z0BVho1yAFYXkl9xB0acoWoBnDDiU2l1w6r4R2RNrRW+iV7qqqH
         11WofMgytznmxDD4ArjgJeCOW2zgNSOPJ5TDk/9zGRI/k3DtCXiBdVZd/jEjVmA9peCi
         ab0w==
X-Gm-Message-State: AOJu0YyXviYrKFqo27IOU3MRMyt7mrTU2rCuVv3P5+SUMlVGJQ4tFED0
	GLRgzQnNES2Q7jplhz9CDEeuCg==
X-Google-Smtp-Source: AGHT+IHyxEDXk7Cbo1rkfq0iJxaRlkX5x7Oxvtrq3Y+QMpN8R866Z7ErWJXgR1xSj+LP6kAjPFug7Q==
X-Received: by 2002:a05:6a00:1788:b0:68f:ecb9:5fde with SMTP id s8-20020a056a00178800b0068fecb95fdemr16406181pfg.34.1698265541960;
        Wed, 25 Oct 2023 13:25:41 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:41 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 16/21] irqchip: irq-sifive-plic: Add ACPI support
Date: Thu, 26 Oct 2023 01:53:39 +0530
Message-Id: <20231025202344.581132-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132542_726355_44EAEDF5 
X-CRM114-Status: GOOD (  22.86  )
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

Add ACPI support in PLIC driver. In ACPI, IO devices use Global System
Interrupts (GSI) which is a flat space split across multiple PLICs. So,
the driver also need to provide the mapping from GSI to correct PLIC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Co-developed-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 arch/riscv/include/asm/irq.h      |   6 ++
 drivers/irqchip/irq-sifive-plic.c | 113 +++++++++++++++++++++++++-----
 2 files changed, 101 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 00eb8b0333c2..eff442766c87 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -28,6 +28,12 @@ struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi);
 static inline struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi) { return NULL; }
 #endif
 
+#ifdef CONFIG_SIFIVE_PLIC
+struct fwnode_handle *plic_get_gsi_domain_id(u32 gsi);
+#else
+static inline struct fwnode_handle *plic_get_gsi_domain_id(u32 gsi) { return NULL; }
+#endif
+
 int __init acpi_get_intc_index_hartid(u32 index, unsigned long *hartid);
 int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid);
 void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts);
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index c8f8a8cdcce1..9c61084a74eb 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 SiFive
  * Copyright (C) 2018 Christoph Hellwig
  */
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -70,6 +71,8 @@ struct plic_priv {
 	unsigned long plic_quirks;
 	unsigned int nr_irqs;
 	unsigned long *prio_save;
+	u32 gsi_base;
+	int id;
 };
 
 struct plic_handler {
@@ -316,6 +319,10 @@ static int plic_irq_domain_translate(struct irq_domain *d,
 {
 	struct plic_priv *priv = d->host_data;
 
+	/* For DT, gsi_base is always zero. */
+	if (fwspec->param[0] >= priv->gsi_base)
+		fwspec->param[0] = fwspec->param[0] - priv->gsi_base;
+
 	if (test_bit(PLIC_QUIRK_EDGE_INTERRUPT, &priv->plic_quirks))
 		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
 
@@ -417,17 +424,31 @@ static const struct of_device_id plic_match[] = {
 };
 
 static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
-					   u32 *nr_irqs, u32 *nr_contexts)
+					   u32 *nr_irqs, u32 *nr_contexts,
+					   u32 *gsi_base, u32 *id)
 {
 	struct device *dev = &pdev->dev;
+	struct acpi_madt_plic *plic;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
+	if (!is_of_node(dev->fwnode)) {
+		plic = *(struct acpi_madt_plic **)dev_get_platdata(dev);
+		if (!plic) {
+			dev_err(dev, "PLIC platform data is NULL!\n");
+			return -EINVAL;
+		}
+
+		*nr_irqs = plic->num_irqs;
+		acpi_get_plic_nr_contexts(plic->id, nr_contexts);
+		if (WARN_ON(!*nr_contexts)) {
+			dev_err(dev, "no PLIC context available\n");
+			return -EINVAL;
+		}
+
+		*gsi_base = plic->gsi_base;
+		*id = plic->id;
+		return 0;
+	}
 
 	rc = of_property_read_u32(to_of_node(dev->fwnode),
 				  "riscv,ndev", nr_irqs);
@@ -442,23 +463,28 @@ static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	*gsi_base = 0;
+	*id = 0;
+
 	return 0;
 }
 
 static int plic_parse_context_parent_hwirq(struct platform_device *pdev,
-					   u32 context, u32 *parent_hwirq,
+					   u32 context, u32 id, u32 *parent_hwirq,
 					   unsigned long *parent_hartid)
 {
 	struct device *dev = &pdev->dev;
 	struct of_phandle_args parent;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
+	if (!is_of_node(dev->fwnode)) {
+		rc = acpi_get_ext_intc_parent_hartid(id, context, parent_hartid);
+		if (rc)
+			return rc;
+
+		*parent_hwirq = RV_IRQ_EXT;
+		return 0;
+	}
 
 	rc = of_irq_parse_one(to_of_node(dev->fwnode), context, &parent);
 	if (rc)
@@ -472,6 +498,32 @@ static int plic_parse_context_parent_hwirq(struct platform_device *pdev,
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
+
+LIST_HEAD(plic_list);
+struct plic_priv_list {
+	struct plic_priv *priv;
+	struct list_head list;
+};
+
+struct fwnode_handle *plic_get_gsi_domain_id(u32 gsi)
+{
+	struct plic_priv_list *plic_element;
+	struct list_head *i, *tmp;
+
+	/* Find the PLIC that manages this GSI. */
+	list_for_each_safe(i, tmp, &plic_list) {
+		plic_element = list_entry(i, struct plic_priv_list, list);
+		if (gsi >= plic_element->priv->gsi_base &&
+		    gsi <= (plic_element->priv->gsi_base + plic_element->priv->nr_irqs))
+			return plic_element->priv->dev->fwnode;
+	}
+
+	return NULL;
+}
+
+#endif
+
 static int plic_probe(struct platform_device *pdev)
 {
 	int rc, nr_contexts, nr_handlers = 0, i, cpu;
@@ -483,7 +535,9 @@ static int plic_probe(struct platform_device *pdev)
 	struct plic_priv *priv;
 	irq_hw_number_t hwirq;
 	struct resource *res;
+	int id, context_id;
 	bool cpuhp_setup;
+	u32 gsi_base;
 
 	if (is_of_node(dev->fwnode)) {
 		const struct of_device_id *id;
@@ -510,19 +564,21 @@ static int plic_probe(struct platform_device *pdev)
 		return -EIO;
 	}
 
-	rc = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts);
+	rc = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts, &gsi_base, &id);
 	if (rc) {
 		dev_err(dev, "failed to parse irqs and contexts\n");
 		return rc;
 	}
 	priv->nr_irqs = nr_irqs;
+	priv->gsi_base = gsi_base;
+	priv->id = id;
 
 	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
 	if (!priv->prio_save)
 		return -ENOMEM;
 
 	for (i = 0; i < nr_contexts; i++) {
-		rc = plic_parse_context_parent_hwirq(pdev, i,
+		rc = plic_parse_context_parent_hwirq(pdev, i, priv->id,
 						     &parent_hwirq, &hartid);
 		if (rc) {
 			dev_warn(dev, "hwirq for context%d not found\n", i);
@@ -574,13 +630,23 @@ static int plic_probe(struct platform_device *pdev)
 			goto done;
 		}
 
+		if (is_of_node(dev->fwnode)) {
+			context_id = i;
+		} else {
+			rc = acpi_get_plic_context(priv->id, i, &context_id);
+			if (rc) {
+				dev_warn(dev, "invalid context id for context%d\n", i);
+				continue;
+			}
+		}
+
 		cpumask_set_cpu(cpu, &priv->lmask);
 		handler->present = true;
 		handler->hart_base = priv->regs + CONTEXT_BASE +
-			i * CONTEXT_SIZE;
+			context_id * CONTEXT_SIZE;
 		raw_spin_lock_init(&handler->enable_lock);
 		handler->enable_base = priv->regs + CONTEXT_ENABLE_BASE +
-			i * CONTEXT_ENABLE_SIZE;
+			context_id * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 
 		handler->enable_save =  devm_kcalloc(dev,
@@ -624,6 +690,17 @@ static int plic_probe(struct platform_device *pdev)
 		register_syscore_ops(&plic_irq_syscore_ops);
 	}
 
+#ifdef CONFIG_ACPI
+	struct plic_priv_list *plic_element;
+
+	plic_element = devm_kzalloc(dev, sizeof(*plic_element), GFP_KERNEL);
+	if (!plic_element)
+		return -ENOMEM;
+
+	plic_element->priv = priv;
+	list_add_tail(&plic_element->list, &plic_list);
+#endif
+
 	dev_info(dev, "mapped %d interrupts with %d handlers for"
 		" %d contexts.\n", nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
