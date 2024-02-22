Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201C5C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mktdXK8wKj06KlQNckxgTKpEUZgEAGNsufhc9r8IehA=; b=05vvpb+OmybJ9/
	PvBgN4SK0UD56roiG9stfxnLMLuz5/n+/ZPwrq3WhX8KmkBl8bv6DbRHKDRLwSthO2qYxPFS4lPpA
	NHANMX9BpWfy3gNtEmgqusgjXdnZigI5Zjm9JXXiUQafJ+ta6vgCM83loE2Moww61x+NPLPL5EKSR
	b1Zt62fdQ9n36YtgFFDHB3hVFDVW0q7OYpGswcdqt2tIoOiI77SBR38GtwIFbf4UZoItoaKhlP3bu
	eJPOihSWYP01F2ojBVY7sfBQZ7vjTBoUfsTFzV2miEsCSjcSJ+br9HbK7rY9shAypeL8/tBfPY3DZ
	LatCArFy+81Xe/Vk5qzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZE-00000004Hqd-21So;
	Thu, 22 Feb 2024 09:40:36 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZA-00000004Hng-2qXm
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:40:34 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3c167d33fcbso715839b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594827; x=1709199627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dj3oCufc6Z60lUZder73d11F5tDZT/lvQFSoe6lWEM=;
        b=cH5vP70LlEi8pJ33RozEoHtBVJDhMer9WIO+OuCVjuUBzGYeEWZsSHNOxfQRtjr90B
         4GOrkLjnRu9v9Xa/ZAhfpWHP46sPdLJcALQkiioynYTxobEH4ZnWxdrHwm1gIwZISBHj
         QdUBI+lIlz8/ga3SSUOvet2TNlyIDp9Sr4xCWzgrxKEBX5OyIzyzHBE6QuUoeR7xN5VP
         lYnQbApm6QJrDUCeWcJmWN59qkXBsHnDN5Pb90SB6WjZdowIBOonsiKIOD5KtUb7Xm2I
         WHVNV4P1ouUeOm26xBthJ5TSvNI/Cti8zkXGObFTsxcYQZM8NiBWepObrrnGSJryc/ly
         qF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594827; x=1709199627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dj3oCufc6Z60lUZder73d11F5tDZT/lvQFSoe6lWEM=;
        b=g5DgxsTUxWqmsM7gdrmggAgJbE1NRp4jd7RMKzbBKJI51PjuNHiVTpHOPWEvwIzQ+5
         +A9AeThHJ9p9tilvxEwD8+sZSYDAJmaYVs7cGksKCd+eZFHOD633v3z9q6rdAHYJqD9S
         FLdxQ8udFKMa0jAEFlzpa84wJXGzYlT1P5hRgWZxMRa6UahbRFjEDAHpTm/PC/TC23GT
         Oq4oubZTmarT3W+vInVkYaWEkKtdlbq6Jb5lUiwuDoNMyRN/4liwaEPkZNh2R7VZzS65
         XseSFF4V8di7A4Pc4pH/M8DVHil+gYwf+ciZE9SFW+7pRgzgIGfXky8djFzXUMM01WNC
         +ipQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuoUPkeNGPmYckuH6Gvy59c7hHFZ2RNPmLxHROv+PQRHHy7hk3zrFQkZATjORoI1cq3uwlAtzA0ZxljC41qYa7aiqEMGDAt7tB8v43KgEo
X-Gm-Message-State: AOJu0YyBNYYoTg0Zn+S/L7U5rVKqm3w5HQgVagesQiog9pr5n31B22cb
	oG1Oop5zw9eoUm9UvlkFeTayUyaxONWBlcYYXv1BS1gQKklcGgf88QxKjGpqyOI=
X-Google-Smtp-Source: AGHT+IEMC2Gw2U+K/I31BOQ/0tYUUFoyA89BnpD5eMsdYUC2+krc9XmYMDpjTMmB/wdmAL6h17iVfw==
X-Received: by 2002:a54:4898:0:b0:3be:d897:2880 with SMTP id r24-20020a544898000000b003bed8972880mr19161618oic.52.1708594827392;
        Thu, 22 Feb 2024 01:40:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:40:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a platform driver
Date: Thu, 22 Feb 2024 15:09:49 +0530
Message-Id: <20240222094006.1030709-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014032_733731_8467A655 
X-CRM114-Status: GOOD (  20.55  )
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

The PLIC driver does not require very early initialization so convert
it into a platform driver.

After conversion, the PLIC driver is probed after CPUs are brought-up
so setup cpuhp state after context handler of all online CPUs are
initialized otherwise PLIC driver crashes for platforms with multiple
PLIC instances.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 101 ++++++++++++++++++------------
 1 file changed, 61 insertions(+), 40 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b7bc4fd9517..7400a07fc479 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -64,6 +64,7 @@
 #define PLIC_QUIRK_EDGE_INTERRUPT	0
 
 struct plic_priv {
+	struct device *dev;
 	struct cpumask lmask;
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
@@ -406,30 +407,50 @@ static int plic_starting_cpu(unsigned int cpu)
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
+static int plic_probe(struct platform_device *pdev)
 {
 	int error = 0, nr_contexts, nr_handlers = 0, i;
-	u32 nr_irqs;
-	struct plic_priv *priv;
+	struct device *dev = &pdev->dev;
+	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
+	struct plic_priv *priv;
+	bool cpuhp_setup;
 	unsigned int cpu;
+	u32 nr_irqs;
+
+	if (is_of_node(dev->fwnode)) {
+		const struct of_device_id *id;
+
+		id = of_match_node(plic_match, to_of_node(dev->fwnode));
+		if (id)
+			plic_quirks = (unsigned long)id->data;
+	}
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = dev;
 	priv->plic_quirks = plic_quirks;
 
-	priv->regs = of_iomap(node, 0);
+	priv->regs = of_iomap(to_of_node(dev->fwnode), 0);
 	if (WARN_ON(!priv->regs)) {
 		error = -EIO;
 		goto out_free_priv;
 	}
 
 	error = -EINVAL;
-	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
+	of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", &nr_irqs);
 	if (WARN_ON(!nr_irqs))
 		goto out_iounmap;
 
@@ -439,13 +460,13 @@ static int __init __plic_init(struct device_node *node,
 	if (!priv->prio_save)
 		goto out_free_priority_reg;
 
-	nr_contexts = of_irq_count(node);
+	nr_contexts = of_irq_count(to_of_node(dev->fwnode));
 	if (WARN_ON(!nr_contexts))
 		goto out_free_priority_reg;
 
 	error = -ENOMEM;
-	priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
-			&plic_irqdomain_ops, priv);
+	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
+						&plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain))
 		goto out_free_priority_reg;
 
@@ -455,7 +476,7 @@ static int __init __plic_init(struct device_node *node,
 		int cpu;
 		unsigned long hartid;
 
-		if (of_irq_parse_one(node, i, &parent)) {
+		if (of_irq_parse_one(to_of_node(dev->fwnode), i, &parent)) {
 			pr_err("failed to parse parent for context %d.\n", i);
 			continue;
 		}
@@ -491,7 +512,7 @@ static int __init __plic_init(struct device_node *node,
 
 		/* Find parent domain and register chained handler */
 		if (!plic_parent_irq && irq_find_host(parent.np)) {
-			plic_parent_irq = irq_of_parse_and_map(node, i);
+			plic_parent_irq = irq_of_parse_and_map(to_of_node(dev->fwnode), i);
 			if (plic_parent_irq)
 				irq_set_chained_handler(plic_parent_irq,
 							plic_handle_irq);
@@ -533,20 +554,29 @@ static int __init __plic_init(struct device_node *node,
 
 	/*
 	 * We can have multiple PLIC instances so setup cpuhp state
-	 * and register syscore operations only when context handler
-	 * for current/boot CPU is present.
+	 * and register syscore operations only once after context
+	 * handlers of all online CPUs are initialized.
 	 */
-	handler = this_cpu_ptr(&plic_handlers);
-	if (handler->present && !plic_cpuhp_setup_done) {
-		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
-				  "irqchip/sifive/plic:starting",
-				  plic_starting_cpu, plic_dying_cpu);
-		register_syscore_ops(&plic_irq_syscore_ops);
-		plic_cpuhp_setup_done = true;
+	if (!plic_cpuhp_setup_done) {
+		cpuhp_setup = true;
+		for_each_online_cpu(cpu) {
+			handler = per_cpu_ptr(&plic_handlers, cpu);
+			if (!handler->present) {
+				cpuhp_setup = false;
+				break;
+			}
+		}
+		if (cpuhp_setup) {
+			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
+					  "irqchip/sifive/plic:starting",
+					  plic_starting_cpu, plic_dying_cpu);
+			register_syscore_ops(&plic_irq_syscore_ops);
+			plic_cpuhp_setup_done = true;
+		}
 	}
 
-	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
-		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
+	pr_info("%pOFP: mapped %d interrupts with %d handlers for %d contexts.\n",
+		to_of_node(dev->fwnode), nr_irqs, nr_handlers, nr_contexts);
 	return 0;
 
 out_free_enable_reg:
@@ -563,20 +593,11 @@ static int __init __plic_init(struct device_node *node,
 	return error;
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
