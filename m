Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28393C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x23N6OC52SSitaRt9WSuw7PyZ03zU4kEpc5nGoDfUZU=; b=p1HJE5HZ9whRDS
	2XB+qIrdhBo0z/Yx0yTIwLUU7X1bjcasuQmcf90KJr8zcUERVhR0q0UDVXaglEokEBRLppLKjYzG9
	JEBmzqUBZ6BAH3+e7DJnLEbdZDx1fWH/9Kpa8aFe1TYv9inMC04An0EpXy8R8j0aNTpwsIzC07YyL
	m9Q/Ty9HS5Z07gFvXTo4ZQPmGAaLMqGOTJs6l8cj5fQCJFAS8aRBD6F8Wz8mDjBEHyW2f6aa8SqOo
	UWZFGKpcSx/LDCT3UdoOiZknwuLZPH68elTRJC1wYEEaB9I/l3Xs3hKhpJx6Znuj5xgosUL584FoG
	0HgA4h9wHwq9bnVkDKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5U8-007GEw-1b;
	Wed, 19 Jul 2023 11:36:48 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5U4-007GC8-33
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:36:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666e64e97e2so4589488b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766603; x=1690371403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqMLD6GnTmKyZf6qDJ2/qOFn7vKzTS5oYxh4x8Esfkk=;
        b=NN12gld9xeVSD1XqFYqqOkUsDLTAOj0BChmw1+LO9CBPoy65dIN72zPlCUuYmm/oH1
         BCY/jD67qb6hcwtMqmHVe6fn9DAMB+ymN/4IuUBou9LDlg/OYKJkJwYCc0tKoA4mFQai
         +1k4PyeVVFgfFzVRSdYqeI/piNwuh5LLs4ByrddtO/6NzBHaIujdZLhww+uw3ehQgjzj
         S3HjM3q8VRa2brVvquULOSNzkZOrcFWe0BkzAxhKdX6ilEjIZJtbkQ8hbCfWzwQV4gBt
         sL6A55Jzl07cOON7oq38+AG6fW7DOr1sYGCnivE0UJQxVv9O78KiNEV5U7KrzVN7efa3
         TzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766603; x=1690371403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqMLD6GnTmKyZf6qDJ2/qOFn7vKzTS5oYxh4x8Esfkk=;
        b=fCShIzSOYMREjJa/oq/ovERTPToHzXba0oFaEpYg6q9eijNjSToXcE+czQZ4E15JzE
         FQkFLgxUFwsZWAC9suqLh0hp5g1kNr0RdLr1Arz8q22efZVVUHFy6tq4SNMWEFRHYuKr
         WkyTSivFsBZ7aKkgKIf++PWEnGUqHhF3FCr4giTkLZ22TeUvZ3XDWDmxg5JYH68VwgS0
         1nc+XlTkixw5BLa/16agqHyfqiAnCOhuVWDrn4LBqHrjZfWriUQIKbXIbfVMmCV1o1sc
         XjBgoYaLMCGhEUUSeoRxTSCLdKhnNw9s5BYXKWo4OXZ8kNu+qk25Ni9iD3NnW+Axbx0H
         HE2g==
X-Gm-Message-State: ABy/qLYP7Fs7g97DJFK/R/Bx+UmNbvZTBWM8nxtWdWD4YXw7K2wSGZ0U
	a2pC9DjvPvSEcVnykOb5peF8rg==
X-Google-Smtp-Source: APBJJlGr0yvfq1VSpM38ymZp6zXV9JVb0RyDgP5UE0cHxI5kUDfBNYULtOdQX28yVGzgM6T/qgfDkg==
X-Received: by 2002:a05:6a21:6d8f:b0:137:7198:af9b with SMTP id wl15-20020a056a216d8f00b001377198af9bmr332146pzb.56.1689766603141;
        Wed, 19 Jul 2023 04:36:43 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:36:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 09/14] irqchip/riscv-imsic: Add support for PCI MSI irqdomain
Date: Wed, 19 Jul 2023 17:05:37 +0530
Message-Id: <20230719113542.2293295-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043645_114960_F1D60A1F 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Linux PCI framework requires it's own dedicated MSI irqdomain so
let us create PCI MSI irqdomain as child of the IMSIC base irqdomain.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |  7 ++++
 drivers/irqchip/irq-riscv-imsic-platform.c | 48 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 56 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8ef18be5f37b..d700980372ef 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -550,6 +550,13 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 
+config RISCV_IMSIC_PCI
+	bool
+	depends on RISCV_IMSIC
+	depends on PCI
+	depends on PCI_MSI
+	default RISCV_IMSIC
+
 config EXYNOS_IRQ_COMBINER
 	bool "Samsung Exynos IRQ combiner support" if COMPILE_TEST
 	depends on (ARCH_EXYNOS && ARM) || COMPILE_TEST
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index db896b6e51ff..02175e4e5cb9 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -12,6 +12,7 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
@@ -184,6 +185,39 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 	.free		= imsic_irq_domain_free,
 };
 
+#ifdef CONFIG_RISCV_IMSIC_PCI
+
+static void imsic_pci_mask_irq(struct irq_data *d)
+{
+	pci_msi_mask_irq(d);
+	irq_chip_mask_parent(d);
+}
+
+static void imsic_pci_unmask_irq(struct irq_data *d)
+{
+	pci_msi_unmask_irq(d);
+	irq_chip_unmask_parent(d);
+}
+
+static struct irq_chip imsic_pci_irq_chip = {
+	.name			= "IMSIC-PCI",
+	.irq_mask		= imsic_pci_mask_irq,
+	.irq_unmask		= imsic_pci_unmask_irq,
+	.irq_eoi		= irq_chip_eoi_parent,
+};
+
+static struct msi_domain_ops imsic_pci_domain_ops = {
+};
+
+static struct msi_domain_info imsic_pci_domain_info = {
+	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
+		   MSI_FLAG_PCI_MSIX | MSI_FLAG_MULTI_PCI_MSI),
+	.ops	= &imsic_pci_domain_ops,
+	.chip	= &imsic_pci_irq_chip,
+};
+
+#endif
+
 static struct irq_chip imsic_plat_irq_chip = {
 	.name			= "IMSIC-PLAT",
 };
@@ -208,12 +242,26 @@ static int __init imsic_irq_domains_init(struct device *dev)
 	}
 	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
 
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	/* Create PCI MSI domain */
+	imsic->pci_domain = pci_msi_create_irq_domain(dev->fwnode,
+						&imsic_pci_domain_info,
+						imsic->base_domain);
+	if (!imsic->pci_domain) {
+		dev_err(dev, "failed to create IMSIC PCI domain\n");
+		irq_domain_remove(imsic->base_domain);
+		return -ENOMEM;
+	}
+#endif
+
 	/* Create Platform MSI domain */
 	imsic->plat_domain = platform_msi_create_irq_domain(dev->fwnode,
 						&imsic_plat_domain_info,
 						imsic->base_domain);
 	if (!imsic->plat_domain) {
 		dev_err(dev, "failed to create IMSIC platform domain\n");
+		if (imsic->pci_domain)
+			irq_domain_remove(imsic->pci_domain);
 		irq_domain_remove(imsic->base_domain);
 		return -ENOMEM;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 3170018949a8..ff3c377b9b33 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -31,6 +31,7 @@ struct imsic_priv {
 
 	/* IRQ domains (created by platform driver) */
 	struct irq_domain *base_domain;
+	struct irq_domain *pci_domain;
 	struct irq_domain *plat_domain;
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
