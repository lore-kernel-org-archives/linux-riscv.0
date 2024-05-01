Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9B2C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7jYIATTkdT7Lh/p0RpcDzQX/RvdXzDa+SpvvObpvnQ=; b=DVKo3amwUE5F6A
	WLA9yRgYEf71+oK/8DPdWG5vI6XRQz1r5TgmByM5vdrrDsj/+iKmRSSF9B7W4XgVDI7UJMRmA69y9
	LeyNr3ytZT4MSd2vVv2FHD1R99Ir+aPqj40lkSaO2Ks4ql5U4qtRJO5BmdDUk9U/vDZ1I1tOrz0+k
	9hIC8UIFvlK0g8CDsXpmWbBO0Ik99Nt5Eg3O3L0NAexVmZOsnGQCAHEBZZcDu57olIF5BS6qmCjzU
	b6M+OyXBNYE2c5FQDHfOFE8CQSinLD53zrdWwdc0T8fBOPpFKlBNpiASH8C0qPdCDvizukuy1fEZu
	JUdS0srcgFykkYynV+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29Ez-00000009VuZ-1E15;
	Wed, 01 May 2024 12:39:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28wS-00000009NUU-3w3E
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:20:10 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso5885272b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714566008; x=1715170808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCs3yrmzFwEswQj2N8wV0vpYdlRUqd+77n2ry9m3784=;
        b=oTSRPKsb6ODvn0sdHx/gV6C7oIo/lYIByHHOfuqvyB9mh92ErpOkIlQ79Z6DBirp35
         Jp3FKahIoEOAfbghFuhnVTPVQnRrTnWehz76rPVZlHZL913tuJEOlTEndivn5xkY3BdF
         NUkDxDdFYtVYmc4aYQiZXlPgi9AUOwXpGXwlaK7f9xUoye7s9rYJ8tD9BloRbc6Kv2CG
         qrcfnT7xUbdp6ODWrgnMQDKKlv06x7pwTJigE1+SnPT5s+EzENVRXjJE+AKTsHveIrSh
         9o0cfltEqu3paNgDZrheengh+UbOorcm6EsqEw1siNj7Enp/5gM8LaMkO+ihOERt+G2u
         ILTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714566008; x=1715170808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCs3yrmzFwEswQj2N8wV0vpYdlRUqd+77n2ry9m3784=;
        b=SzS3HJHsJFT1bytig437pvt99aMjnXHYezp3r4eVD/1iTSren2QrMcmQH4ghgjA1bb
         +KVGIkrtbOJLCKNsWVJM9mZdSurPfdOYok0Zz5Y9nmUzc1CMYxcICn+jUh+yXppOEe69
         Dw+MqF3Xv7SAepXAiJQKx27MC5adjw9nBzUpcX1aAo1o4OYBEwCdJTVPZb5n7S3NPmRB
         HQnnmfwg5ZMjwuJEqOJdrtuC90wy6P6nCwmfLdLJhoOzhlCMEAeC68V7uB+XQ7RAOEEf
         xcIxaei7mfn6mFh3KsJTF8pxC+OeKd1VlNiyRITggQFden+Hh7og9DYm3+kTAwqZ2jO3
         xKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXFKOl4n/Ml4vZSs9b9+62tpQt+XsZYXCAmEhf7Cu6X3QxETPWkxjc7p8eJtquRfujJ+xZ9SrLVjhvmepVEL3S2TjJRKOPejjsX1QkkFfe8
X-Gm-Message-State: AOJu0YwDbC/rP9pFrrTawKtqHZy3pIEw5W7y2XOi/zthzL/0xKXa0Jw2
	8B3lcB4P/0k7QUZQiUhyyn8f2TB1FhlxfdPw30f4DsLKoIDOoJbyRLMcM8X7rk0=
X-Google-Smtp-Source: AGHT+IEE0GElfwoFz8rK8ax73/m32/DYftPNktmYVGk+PoIc+wfQ5hYwE+vbTd662q3C/FXcAaIUlQ==
X-Received: by 2002:a17:903:2303:b0:1eb:7172:673b with SMTP id d3-20020a170903230300b001eb7172673bmr2574288plh.16.1714566007835;
        Wed, 01 May 2024 05:20:07 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:20:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 16/17] irqchip/sifive-plic: Add ACPI support
Date: Wed,  1 May 2024 17:47:41 +0530
Message-Id: <20240501121742.1215792-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_052008_989177_0EB1FEAC 
X-CRM114-Status: GOOD (  22.43  )
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

Add ACPI support in PLIC driver. Use the mapping created early during
boot to get details about the PLIC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Co-developed-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 drivers/irqchip/irq-sifive-plic.c | 89 +++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 8fb183ced1e7..b6b04b5923c2 100644
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
@@ -324,6 +327,10 @@ static int plic_irq_domain_translate(struct irq_domain *d,
 {
 	struct plic_priv *priv = d->host_data;
 
+	/* For DT, gsi_base is always zero. */
+	if (fwspec->param[0] >= priv->gsi_base)
+		fwspec->param[0] = fwspec->param[0] - priv->gsi_base;
+
 	if (test_bit(PLIC_QUIRK_EDGE_INTERRUPT, &priv->plic_quirks))
 		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
 
@@ -424,18 +431,32 @@ static const struct of_device_id plic_match[] = {
 	{}
 };
 
+#ifdef CONFIG_ACPI
+
+static const struct acpi_device_id plic_acpi_match[] = {
+	{ "RSCV0001", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, plic_acpi_match);
+
+#endif
 static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
-					   u32 *nr_irqs, u32 *nr_contexts)
+					   u32 *nr_irqs, u32 *nr_contexts,
+					   u32 *gsi_base, u32 *id)
 {
 	struct device *dev = &pdev->dev;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
+	if (!is_of_node(dev->fwnode)) {
+		riscv_acpi_get_gsi_info(dev->fwnode, gsi_base, id, nr_irqs, NULL);
+		acpi_get_plic_nr_contexts(*id, nr_contexts);
+		if (WARN_ON(!*nr_contexts)) {
+			dev_err(dev, "no PLIC context available\n");
+			return -EINVAL;
+		}
+
+		return 0;
+	}
 
 	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", nr_irqs);
 	if (rc) {
@@ -449,23 +470,29 @@ static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	*gsi_base = 0;
+	*id = 0;
+
 	return 0;
 }
 
 static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
-				     u32 *parent_hwirq, int *parent_cpu)
+				     u32 *parent_hwirq, int *parent_cpu, u32 id)
 {
 	struct device *dev = &pdev->dev;
 	struct of_phandle_args parent;
 	unsigned long hartid;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
+	if (!is_of_node(dev->fwnode)) {
+		rc = acpi_get_ext_intc_parent_hartid(id, context, &hartid);
+		if (rc)
+			return rc;
+
+		*parent_cpu = riscv_hartid_to_cpuid(hartid);
+		*parent_hwirq = RV_IRQ_EXT;
+		return 0;
+	}
 
 	rc = of_irq_parse_one(to_of_node(dev->fwnode), context, &parent);
 	if (rc)
@@ -490,7 +517,9 @@ static int plic_probe(struct platform_device *pdev)
 	struct irq_domain *domain;
 	struct plic_priv *priv;
 	irq_hw_number_t hwirq;
+	int id, context_id;
 	bool cpuhp_setup;
+	u32 gsi_base;
 
 	if (is_of_node(dev->fwnode)) {
 		const struct of_device_id *id;
@@ -500,7 +529,7 @@ static int plic_probe(struct platform_device *pdev)
 			plic_quirks = (unsigned long)id->data;
 	}
 
-	error = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts);
+	error = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts, &gsi_base, &id);
 	if (error)
 		return error;
 
@@ -511,6 +540,8 @@ static int plic_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	priv->plic_quirks = plic_quirks;
 	priv->nr_irqs = nr_irqs;
+	priv->gsi_base = gsi_base;
+	priv->id = id;
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(!priv->regs))
@@ -521,12 +552,22 @@ static int plic_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < nr_contexts; i++) {
-		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu);
+		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu, priv->id);
 		if (error) {
 			dev_warn(dev, "hwirq for context%d not found\n", i);
 			continue;
 		}
 
+		if (is_of_node(dev->fwnode)) {
+			context_id = i;
+		} else {
+			error = acpi_get_plic_context(priv->id, i, &context_id);
+			if (error) {
+				dev_warn(dev, "invalid context id for context%d\n", i);
+				continue;
+			}
+		}
+
 		/*
 		 * Skip contexts other than external interrupts for our
 		 * privilege level.
@@ -572,10 +613,10 @@ static int plic_probe(struct platform_device *pdev)
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
 
 		handler->enable_save = devm_kcalloc(dev, DIV_ROUND_UP(nr_irqs, 32),
@@ -591,8 +632,8 @@ static int plic_probe(struct platform_device *pdev)
 		nr_handlers++;
 	}
 
-	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
-						&plic_irqdomain_ops, priv);
+	priv->irqdomain = irq_domain_create_linear(dev->fwnode, nr_irqs + 1,
+						   &plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain))
 		goto fail_cleanup_contexts;
 
@@ -619,13 +660,18 @@ static int plic_probe(struct platform_device *pdev)
 		}
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
+
 	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
 		 nr_irqs, nr_handlers, nr_contexts);
 	return 0;
 
 fail_cleanup_contexts:
 	for (i = 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu))
+		if (plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu, priv->id))
 			continue;
 		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
 			continue;
@@ -644,6 +690,7 @@ static struct platform_driver plic_driver = {
 	.driver = {
 		.name		= "riscv-plic",
 		.of_match_table	= plic_match,
+		.acpi_match_table = ACPI_PTR(plic_acpi_match),
 	},
 	.probe = plic_probe,
 };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
