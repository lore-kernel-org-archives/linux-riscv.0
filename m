Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CCAC48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfSifVKTUWEdvG7S/GOvNCiMZMw/vKDxv3/vDBmIUiA=; b=OUmB/8L0M4k+gC
	763eSpZhLcXWs1daN3Rb3YOgAmVzPy2S1CcFfJx4wKSOD5XyNd3hz4gk8dE+rkhxxB51JJtpSNlL5
	mEfeSP9CeoPkoA0B2/f0/vkjnmOFcUB2hz3RNiUWVLVbHLOLD1+NhU6n7G5E5noIpXWZCrLM76Urx
	GQdA6AQ3/HcF4wItS1o/OodOM82CtFluO/pMe+uIp6hzxgi3lbZi1mcV2eD+1VZavbraGSWsQ4vlq
	5WkSM2cB724TxthUiTTG1zhzYYtuw/ToyfTYK4d+VD4zY8M3F3ViN/rjG5c7kwezZE/QXhHeTlPh7
	Q37Tcg2TtqGpE6VHxJYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd6ad-00000004X0I-3VAx;
	Thu, 22 Feb 2024 10:46:07 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5Zc-00000004I8B-1Jiq
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:41:03 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3c15d1bd5b1so3045096b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594858; x=1709199658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDM6EjBjzZEX6uCYOZJ5gyfkm0OuYc/6ObrJgVAlOzc=;
        b=nGtmVsWAaFJTEXq++0yrKgWSqDevODRDU8lj5d+G3Gni18Q5i9wOm1wXxWTahCmfCA
         rJiEllsdBdjYL7mzZM5vvBB0wnprf0HRT+JVB+4ZLuCfV0lZtNqfx9nYdvRiPcukP8vV
         4ufZHJ8je4+X6LJ1gD8/hsf6A7f90fTD43TcEDpa9UNVDwfp1FhOiBNXZtsfd+OXJU9o
         1q/Ius6hXPDpEStbQaZ3Qsi10MYO8oRCZkX3K8I7rrU6OXAI3g/uK1e3LYdc4+ZYoUMW
         uLYWS6A9a4H2dkF6fNZAYuU0BtKA7xhrQmNWLiw1k9UYLZXMB8wTzkvrfDtb5bNL4Irg
         gw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594858; x=1709199658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDM6EjBjzZEX6uCYOZJ5gyfkm0OuYc/6ObrJgVAlOzc=;
        b=cg8aYIdoS3uu++WDeb8oDVLxxXaXssHRQ1m/Pd/aiA6C25OeQkJSs8O1Eg0RjiHIi5
         94n7QS+tgJybQFkRiIRE4TEJKAX0MIn351r6t6pD3SzOQ84QoRsZ8UTJZOzwct2R87ka
         4OIWygXr5j+Ikwa9VvG1CglMc/fZIgAYL+W9Ql4EShm4JqQrEaSlepqxMak1i9vkpuyN
         SFgTgAXUaXwCFK5uf2UiVZfkt6RFtKk/GjA2RlC0pFfx14IxXSD9MpJbQSTIXsflFAlJ
         TNm+JHuy+fgD+WGgE6rjuyCFdVjhVw/9870xZUxDw3zK8PzRf6MhwDoPwy1aA1HkAVNs
         n4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCV5o1owZSKG3Q0TavKYgc0zOy7AuGNMiDB6gps5qpBA0Xop4nR9PfKrrQKJObXRCEn5m1QuykGSFzjtHuDFkK+ab26wVc79NDwu65uQ1SNL
X-Gm-Message-State: AOJu0Yx2mvZz4Zd3ElKNLyyNB1afCpWFYnOPXpCRNdGt+K4+jSf4Grd5
	TX3KeEsLdpAXvp76EE6b9RtPKtzQhWB2b+JkYeEA/cGJqxaRobEOYEMv2I0PzuU=
X-Google-Smtp-Source: AGHT+IGT29HtRoxTfhVvish182aY0aMpJ/2Uit/NlU+Lw0THPvmpBIMgrKBSZWm+oKAJD2qN/cmTKA==
X-Received: by 2002:a05:6808:1291:b0:3c1:377a:4641 with SMTP id a17-20020a056808129100b003c1377a4641mr28333878oiw.24.1708594857974;
        Thu, 22 Feb 2024 01:40:57 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:40:57 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 05/18] irqchip/sifive-plic: Cleanup PLIC contexts upon irqdomain creation failure
Date: Thu, 22 Feb 2024 15:09:53 +0530
Message-Id: <20240222094006.1030709-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014100_640158_14BAD221 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SiFive PLIC contexts should not be left dangling if irqdomain creation
fails because plic_starting_cpu() can crash accessing unmapped registers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 73 ++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 615498071b6e..f0df5d0cb76e 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -416,17 +416,45 @@ static const struct of_device_id plic_match[] = {
 	{}
 };
 
+static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
+				     u32 *parent_hwirq, int *parent_cpu)
+{
+	struct device *dev = &pdev->dev;
+	struct of_phandle_args parent;
+	unsigned long hartid;
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
+	rc = riscv_of_parent_hartid(parent.np, &hartid);
+	if (rc)
+		return rc;
+
+	*parent_hwirq = parent.args[0];
+	*parent_cpu = riscv_hartid_to_cpuid(hartid);
+	return 0;
+}
+
 static int plic_probe(struct platform_device *pdev)
 {
-	int error = 0, nr_contexts, nr_handlers = 0, i;
+	int error = 0, nr_contexts, nr_handlers = 0, cpu, i;
 	struct device *dev = &pdev->dev;
 	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
+	u32 nr_irqs, parent_hwirq;
 	struct irq_domain *domain;
 	struct plic_priv *priv;
+	irq_hw_number_t hwirq;
 	bool cpuhp_setup;
-	unsigned int cpu;
-	u32 nr_irqs;
 
 	if (is_of_node(dev->fwnode)) {
 		const struct of_device_id *id;
@@ -462,13 +490,9 @@ static int plic_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	for (i = 0; i < nr_contexts; i++) {
-		struct of_phandle_args parent;
-		irq_hw_number_t hwirq;
-		int cpu;
-		unsigned long hartid;
-
-		if (of_irq_parse_one(to_of_node(dev->fwnode), i, &parent)) {
-			dev_err(dev, "failed to parse parent for context %d.\n", i);
+		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu);
+		if (error) {
+			dev_warn(dev, "hwirq for context%d not found\n", i);
 			continue;
 		}
 
@@ -476,7 +500,7 @@ static int plic_probe(struct platform_device *pdev)
 		 * Skip contexts other than external interrupts for our
 		 * privilege level.
 		 */
-		if (parent.args[0] != RV_IRQ_EXT) {
+		if (parent_hwirq != RV_IRQ_EXT) {
 			/* Disable S-mode enable bits if running in M-mode. */
 			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
 				void __iomem *enable_base = priv->regs +
@@ -489,13 +513,6 @@ static int plic_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		error = riscv_of_parent_hartid(parent.np, &hartid);
-		if (error < 0) {
-			dev_warn(dev, "failed to parse hart ID for context %d.\n", i);
-			continue;
-		}
-
-		cpu = riscv_hartid_to_cpuid(hartid);
 		if (cpu < 0) {
 			dev_warn(dev, "Invalid cpuid for context %d\n", i);
 			continue;
@@ -534,7 +551,7 @@ static int plic_probe(struct platform_device *pdev)
 		handler->enable_save = devm_kcalloc(dev, DIV_ROUND_UP(nr_irqs, 32),
 						    sizeof(*handler->enable_save), GFP_KERNEL);
 		if (!handler->enable_save)
-			return -ENOMEM;
+			goto fail_cleanup_contexts;
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
 			plic_toggle(handler, hwirq, 0);
@@ -547,7 +564,7 @@ static int plic_probe(struct platform_device *pdev)
 	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
 						&plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain))
-		return -ENOMEM;
+		goto fail_cleanup_contexts;
 
 	/*
 	 * We can have multiple PLIC instances so setup cpuhp state
@@ -575,6 +592,22 @@ static int plic_probe(struct platform_device *pdev)
 	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
 		 nr_irqs, nr_handlers, nr_contexts);
 	return 0;
+
+fail_cleanup_contexts:
+	for (i = 0; i < nr_contexts; i++) {
+		if (plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu))
+			continue;
+		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
+			continue;
+
+		handler = per_cpu_ptr(&plic_handlers, cpu);
+		handler->present = false;
+		handler->hart_base = NULL;
+		handler->enable_base = NULL;
+		handler->enable_save = NULL;
+		handler->priv = NULL;
+	}
+	return -ENOMEM;
 }
 
 static struct platform_driver plic_driver = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
