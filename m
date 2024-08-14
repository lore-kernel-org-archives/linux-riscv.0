Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E8C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zihMuQGDg1FKSTdBTqwkCjkqSwBYLP11ilVLw7M2KkM=; b=1AlKOo7adibVxG
	ZUEvin78QfaoauYhn/peofGa5NU38r2ynfF1ou3Vqgn/Uq1Kn+CrUoOkM+h6Bmms0wodV67v4ZzoN
	DeLYP8My1ymFR4Ug/ht92CUtRSUtD2HWYqoNi93fiU1DZLW+TWHa+ycJV//ZFEXLLNlJxK0hYocdV
	6zaWrmAisnAxTsrVUAe+y+LgohYTW6eS/40LyvCc1LyOZOTYyppiX3nX5xeDIlTeY6EtpmEoGgEDU
	BEDqnQGvLwDsHfI/iEekYqzSQhkoGQ5SdKhQAfQMWfV6TS8Uoa+BN6JRnr1vf4mjVZ+3fDKiJsk19
	r2r4757IU11c0tnKn2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRr-00000007OQF-3nd1;
	Wed, 14 Aug 2024 14:58:03 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQo-00000007O4E-0CiO
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:57:00 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CF1034463E
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647412;
	bh=IUM6jkgHqliS7TLynxdyuCPNYS9WvP3ZzPTH9v/4Y8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=KY/QEfG0HoBFxyAoG1kwFQdh/u9qtpMe6wZd19gd+1+5kV2S7NjcGSVvigW3uP29p
	 B9i67jDe1vDAKpdNCB5PfiNECeWmDkyawOp899OhQ3cQ+5sAm5Y+0HJJNZ09AfXJ3O
	 bI8/rVnZ63SqzOIl5bxOTg2cYnsWwFfuS9NdklGTjmKYUVfxUqNlKqU+RJ3y4GHeDT
	 76DRn+zJhHI61jhCeTphPw+HE7AV0GDCycegDFsLQS/VLR+090xB8mTcc/YZ3MIGuW
	 AjyqazdYhl2E+UVn88n5qfac/kb6MpQPXmlXqH6W1+L64RyZyuvpw5KxL7o+7+1cHG
	 6Pcj5lwzksf7g==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7d2f42df2dso132712466b.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647409; x=1724252209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUM6jkgHqliS7TLynxdyuCPNYS9WvP3ZzPTH9v/4Y8U=;
        b=n/fS1Zb5n95dYIk0GlnWEYdyiSNAaxNI6sN1x70wm6cWxSzxmgdhPKioyN2h1by7Vh
         XCS00Jyug5Ar0uYpXS/cW6XP63kL0JUstL3wg9Wawqo+iluAexkMwz+4ZzjQYuxDaIXB
         /GE6nBdGPHwbpjiglXTsH8DNzjP0mmfY8+Tnwpez4RFqQlYXT16pmvLcBRsW7lA4rMFm
         dC1AjZuCkh3CmNvuzqAEKmrwEbMfAj9DQj//qPImPE3JRO43hIUuNsrdbQWeIAbZbYK5
         iNTJxPjxtaBLORkPJhqjYTlaHsQm4yF1sFzCFo1VxK3igrxopRQIQjpU4iBdQhbwVMgA
         i9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgxUaF+2Nf0jx1qj4TSWX6YL/N/v6M4i7ZiHx+py2uTHcX/+V7hEt/kffhdoEbbG+W9gGEr/p2UWIk126ucLCuZIe5xDCU1KtYvHXldeZI
X-Gm-Message-State: AOJu0Yz3d2aUer0/Rfwi+ntihMIixEFDLKSzvoCG/AVn6zDbNYhEy5Ts
	goe602D4iGmCzyitJKpujTJeJLzBCZRwYwd/vwcg2b8soyTrjaKIaJN00vQbRPvKbBfXZgMxAys
	brgUNpmbPThXmufoP9gm/YPWxQPwrwFbkJyn8dS6hFh7rd+pfY56qBJNern/9tglRCg4t+KbvNQ
	oP0UBs7w==
X-Received: by 2002:a17:907:3201:b0:a7a:bcbc:f7f4 with SMTP id a640c23a62f3a-a836abb358emr234363966b.14.1723647409187;
        Wed, 14 Aug 2024 07:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEys6MrI5aQcVwmiLrXuNC8jHi0+dek+tdNfiAtj1CA05xQUkevZWjodULXyUBCHbZ9S/jcUg==
X-Received: by 2002:a17:907:3201:b0:a7a:bcbc:f7f4 with SMTP id a640c23a62f3a-a836abb358emr234359466b.14.1723647408318;
        Wed, 14 Aug 2024 07:56:48 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:47 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 5/9] Revert "irqchip/sifive-plic: Cleanup PLIC contexts upon irqdomain creation failure"
Date: Wed, 14 Aug 2024 16:56:37 +0200
Message-ID: <20240814145642.344485-6-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075658_320996_A3120B63 
X-CRM114-Status: GOOD (  20.31  )
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

This reverts commit a15587277a246c388c83b1cd9cf7c1a868cd752f.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 73 +++++++++----------------------
 1 file changed, 20 insertions(+), 53 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index b4c4050a02fb..85e94b8f4c06 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -423,45 +423,17 @@ static const struct of_device_id plic_match[] = {
 	{}
 };
 
-static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
-				     u32 *parent_hwirq, int *parent_cpu)
-{
-	struct device *dev = &pdev->dev;
-	struct of_phandle_args parent;
-	unsigned long hartid;
-	int rc;
-
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
-
-	rc = of_irq_parse_one(to_of_node(dev->fwnode), context, &parent);
-	if (rc)
-		return rc;
-
-	rc = riscv_of_parent_hartid(parent.np, &hartid);
-	if (rc)
-		return rc;
-
-	*parent_hwirq = parent.args[0];
-	*parent_cpu = riscv_hartid_to_cpuid(hartid);
-	return 0;
-}
-
 static int plic_probe(struct platform_device *pdev)
 {
-	int error = 0, nr_contexts, nr_handlers = 0, cpu, i;
+	int error = 0, nr_contexts, nr_handlers = 0, i;
 	struct device *dev = &pdev->dev;
 	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
-	u32 nr_irqs, parent_hwirq;
 	struct irq_domain *domain;
 	struct plic_priv *priv;
-	irq_hw_number_t hwirq;
 	bool cpuhp_setup;
+	unsigned int cpu;
+	u32 nr_irqs;
 
 	if (is_of_node(dev->fwnode)) {
 		const struct of_device_id *id;
@@ -497,9 +469,13 @@ static int plic_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	for (i = 0; i < nr_contexts; i++) {
-		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu);
-		if (error) {
-			dev_warn(dev, "hwirq for context%d not found\n", i);
+		struct of_phandle_args parent;
+		irq_hw_number_t hwirq;
+		int cpu;
+		unsigned long hartid;
+
+		if (of_irq_parse_one(to_of_node(dev->fwnode), i, &parent)) {
+			dev_err(dev, "failed to parse parent for context %d.\n", i);
 			continue;
 		}
 
@@ -507,7 +483,7 @@ static int plic_probe(struct platform_device *pdev)
 		 * Skip contexts other than external interrupts for our
 		 * privilege level.
 		 */
-		if (parent_hwirq != RV_IRQ_EXT) {
+		if (parent.args[0] != RV_IRQ_EXT) {
 			/* Disable S-mode enable bits if running in M-mode. */
 			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
 				void __iomem *enable_base = priv->regs +
@@ -520,6 +496,13 @@ static int plic_probe(struct platform_device *pdev)
 			continue;
 		}
 
+		error = riscv_of_parent_hartid(parent.np, &hartid);
+		if (error < 0) {
+			dev_warn(dev, "failed to parse hart ID for context %d.\n", i);
+			continue;
+		}
+
+		cpu = riscv_hartid_to_cpuid(hartid);
 		if (cpu < 0) {
 			dev_warn(dev, "Invalid cpuid for context %d\n", i);
 			continue;
@@ -557,7 +540,7 @@ static int plic_probe(struct platform_device *pdev)
 		handler->enable_save = devm_kcalloc(dev, DIV_ROUND_UP(nr_irqs, 32),
 						    sizeof(*handler->enable_save), GFP_KERNEL);
 		if (!handler->enable_save)
-			goto fail_cleanup_contexts;
+			return -ENOMEM;
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
 			plic_toggle(handler, hwirq, 0);
@@ -570,7 +553,7 @@ static int plic_probe(struct platform_device *pdev)
 	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
 						&plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain))
-		goto fail_cleanup_contexts;
+		return -ENOMEM;
 
 	/*
 	 * We can have multiple PLIC instances so setup cpuhp state
@@ -598,22 +581,6 @@ static int plic_probe(struct platform_device *pdev)
 	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
 		 nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-fail_cleanup_contexts:
-	for (i = 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu))
-			continue;
-		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
-			continue;
-
-		handler = per_cpu_ptr(&plic_handlers, cpu);
-		handler->present = false;
-		handler->hart_base = NULL;
-		handler->enable_base = NULL;
-		handler->enable_save = NULL;
-		handler->priv = NULL;
-	}
-	return -ENOMEM;
 }
 
 static struct platform_driver plic_driver = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
