Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE6CC04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhtYG7XxW6fo7kxFyRAkVJ/JKwmpCSRZ87gX6Da/AnI=; b=hV3ong7RSDRC6z
	Z9WlQZ08fjdJx++r7OG+EGhmSToEM2WfdG3lsknIBYBU0zqQiqECbuZZHvBNle1P4EZe4ROf1mTjH
	X+4tZW3C/Ce7wkyWuq0R9iUtaLovYrK85TjoAhiidmPTZjIwBhGNMEyL51VsVSS1qaH14N5qBkT2N
	R9Tdf4yn9ONUm5/duCAfPtFxYNZ9aKwWDvWtMsXw0ASdkobA9gKXFPS/jTZewOlgxZLvU11wroGC1
	YO76poOyIJtbNubWpKdRSGvc3Pqgn60EIPqO5CPr1+28gn17gb8dwg4Jq5skj4O2iThWDybjtyGKV
	SQGfs7q/NrgyZdyAm/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDM2-0059uJ-0w;
	Wed, 02 Aug 2023 15:01:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLz-0059si-14
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:01:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bbf8cb61aeso29203985ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988495; x=1691593295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmvz1qAJlhi1JiLtSKn9YxPTKy/BQ3KTcH/R0EN23A0=;
        b=C/o2zBenrpA6l2Lqx38UHIvXhJEUEFSqz/kAeJMWcXZ8X0yWT0oSHfh99DLFfFpsEB
         5Bh/+tvnBJXl0Afb4kr/f9K6VDTrW6rS/stKXNVRuadw0TUQzCZnzOduMhkks47bko6o
         cFbgBUS/OPQ5I5H0jrPlp52bzyvXgbtScIGXFIk9QPO50sJfUnpvtNJihwijJmrAaCjZ
         BuxBy7lBbKmKu0+Vw5POdNJL4UItKa9UjniW1AQtqWwUTXw0NCvGfIuEAAzsj4hFh6fH
         /RzkFiob9z/bfqYH1xakZgfcKTrcx6pxMP2FgIHyBys57mmH4HaWyOcesJ6Aw9J3ezH8
         swRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988495; x=1691593295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmvz1qAJlhi1JiLtSKn9YxPTKy/BQ3KTcH/R0EN23A0=;
        b=VEFoMieO7kdHdv5xFfUomZomPDWfaDG1vamRcWjOYWYGYaKAIQVhsIqEnTWTtXLToA
         d0anmr+progIh3JrNq5kxAbzgWBGLxwBeOaIa42wxyFgkae8X6mudzJemB59DDgmJyF9
         +LwaD1ZV6U/8YNGYc8oesTfgiEgwkXx7/9chlR4VaIjw2Piqwbqt6w5QgtcDFz/xr4Xg
         Hahw3tZJ8QXqkJ0cDA8OjRhYA4h4b8+fZhnbv/uJvhY8ZVR4BGozhDXo0oOV9eF71RH5
         KcgeADiETcuv3BTZh+vKczAkIGJZCD7/ETwF3jc8dqalIDIolnoOg0+eCQnpJnhn/mz0
         Mymw==
X-Gm-Message-State: ABy/qLaZQrQdniIGzLhibQh2dnDTqegm5M8ikh6YklFpuyOpc3nC06rS
	DosKv0YRst5138YVZ6c2vt5LsQ==
X-Google-Smtp-Source: APBJJlGjsLkcV62lQARrHNB4Kz73nZ2dPU32azUrBPiU/hC1zNIKsp2u3haiOAl2WgkRiy/N7PdjVA==
X-Received: by 2002:a17:902:b187:b0:1b8:4e69:c8f7 with SMTP id s7-20020a170902b18700b001b84e69c8f7mr13241302plr.23.1690988494595;
        Wed, 02 Aug 2023 08:01:34 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:01:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 10/15] irqchip/riscv-imsic: Add support for PCI MSI irqdomain
Date: Wed,  2 Aug 2023 20:30:13 +0530
Message-Id: <20230802150018.327079-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080135_371880_1302FF48 
X-CRM114-Status: GOOD (  17.40  )
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
index b78f1b2ee3dc..ff737b4e195f 100644
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
@@ -208,12 +242,26 @@ static int imsic_irq_domains_init(struct device *dev)
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
