Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4958AC7EE25
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=487bHbFV3kmkuQ2pCF1eGP50dEhZc2vlJEcnOwcdwDc=; b=HRKwK38gRUXh8s
	N2E3ab9+H8IcRNQyjZutsRuO2j7GqjqNX3wKf79Wh0KJXfdJ20ccY3vmRs9soCg9cdGuwB+ae6M01
	ob9onUDzzYah0vNjuE1offSlC281YhcyF4s6a37pn0pjqRAzwjKmZfZw8ErUXvQHVtXq7O1/dsncd
	DgcPGVymtmLh6QTc55yKTe9tx7t4oCjPTJbmOZLZhCxdGN28kMvFZ3NuGO02nM8f9yW0W59X9D50X
	VJso5TqLJgYTKqoqBa6SRd6KlJ3x6vLiR5NB3MO8MH2R8dve7KEf1W5fq3ybeMF3e4Lgnj0bX5gmd
	JI3UV2hvryEhyXdjvSdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rp-000kcd-1n;
	Mon, 08 May 2023 14:29:33 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rn-000kab-0x
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:29:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5144043d9d1so3048341a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683556169; x=1686148169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZx8pVyFJqTIpr4BnDr/88VmIIeD0a98LNl1bXs4aCI=;
        b=dTnj8jF9WIu+jQo5yru3eJjRqiAEHZBZJ/aJ7cgeYj1zF9lv1xflSCfcl+LSKqGaIV
         jfZ1+t1HwtTt4GwgZN4XIOqbWYNhXDuQf/JKZTk9qPDhdLmaU8lezhkQeblu/H1yu1E1
         Cv1IzlK841t90PK+K6bgn9E61JdlrFKX+7uMjSs2uLq/7V3lN2WDOAc3v3Pzwoyzqp7f
         QnN2moOnjD+ijPu/4+Rjz6CoJ+FC/Gg6vZ2w9ps1LXA1H50BzOFIWUUp2TeV+G3C3cjD
         w+2EcfAuNkf2HweC4ChcYrYIR7rD9bHgJBlMPvEf31IwarO+gcTz/fKSUPbeyqTAuUBL
         2ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556169; x=1686148169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZx8pVyFJqTIpr4BnDr/88VmIIeD0a98LNl1bXs4aCI=;
        b=iTeE7tIHymAi4sZbmHGSkI8bEySvdFRoAt0+Nf6Vb6hCFGIWw0l8EG837GJhr9rySP
         vHu5ppTRKjpspIqiJ9eO/lzp3ZPUQNg9PNovqL7YZpIV/dErLtShEYy7ybYeyWHkKHbZ
         gc3uRdQvBjOYkmad5F6Rwh9MEf936Xu5imAF8hQQ7Hja7/i1MqM8gTSd8ue5zzdvRSxu
         gsBkKozvKgK1Hz+zgiKrkxKCLXPosSxRNuaIybp4qcQSn/Da46cPo4/TZyCpLDvPUska
         j/mlseNh/kBA4sOoNb1JtvwAOCoPzdDCLCXqCwS196vC4n4VOP778GPwoT+14hx4c0db
         IPOA==
X-Gm-Message-State: AC+VfDzv+3Ei6IUTbB2W3hGp7EpaTjNTV66pjRiQ0fVOpUXd4NOxkrnx
	r04AlnXMEmpckLj4YI4ORd1gnw==
X-Google-Smtp-Source: ACHHUZ7uHyXdoGyRXbKaY6kklyMIWJI3o768YEmZqRcW81svn5/B1xtVVAkqcXoSxAkeEozUbYGp2A==
X-Received: by 2002:a05:6a21:339c:b0:100:2c5c:8e69 with SMTP id yy28-20020a056a21339c00b001002c5c8e69mr5992538pzb.49.1683556168895;
        Mon, 08 May 2023 07:29:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.206])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm6082pfk.158.2023.05.08.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:29:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 06/11] irqchip/riscv-imsic: Add support for PCI MSI irqdomain
Date: Mon,  8 May 2023 19:58:37 +0530
Message-Id: <20230508142842.854564-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508142842.854564-1-apatel@ventanamicro.com>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_072931_335286_38A1009A 
X-CRM114-Status: GOOD (  17.56  )
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

The Linux PCI framework requires it's own dedicated MSI irqdomain so
let us create PCI MSI irqdomain as child of the IMSIC base irqdomain.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig           |  7 +++++
 drivers/irqchip/irq-riscv-imsic.c | 49 +++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

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
diff --git a/drivers/irqchip/irq-riscv-imsic.c b/drivers/irqchip/irq-riscv-imsic.c
index 971fad638c9f..30247c84a6b0 100644
--- a/drivers/irqchip/irq-riscv-imsic.c
+++ b/drivers/irqchip/irq-riscv-imsic.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
@@ -81,6 +82,7 @@ struct imsic_priv {
 
 	/* IRQ domains */
 	struct irq_domain *base_domain;
+	struct irq_domain *pci_domain;
 	struct irq_domain *plat_domain;
 };
 
@@ -547,6 +549,39 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
+	.name			= "RISC-V IMSIC-PCI",
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
 	.name			= "RISC-V IMSIC-PLAT",
 };
@@ -571,12 +606,26 @@ static int __init imsic_irq_domains_init(struct fwnode_handle *fwnode)
 	}
 	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
 
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	/* Create PCI MSI domain */
+	imsic->pci_domain = pci_msi_create_irq_domain(fwnode,
+						&imsic_pci_domain_info,
+						imsic->base_domain);
+	if (!imsic->pci_domain) {
+		pr_err("Failed to create IMSIC PCI domain\n");
+		irq_domain_remove(imsic->base_domain);
+		return -ENOMEM;
+	}
+#endif
+
 	/* Create Platform MSI domain */
 	imsic->plat_domain = platform_msi_create_irq_domain(fwnode,
 						&imsic_plat_domain_info,
 						imsic->base_domain);
 	if (!imsic->plat_domain) {
 		pr_err("Failed to create IMSIC platform domain\n");
+		if (imsic->pci_domain)
+			irq_domain_remove(imsic->pci_domain);
 		irq_domain_remove(imsic->base_domain);
 		return -ENOMEM;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
