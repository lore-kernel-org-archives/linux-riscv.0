Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A919BC25B4A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBPMpA67W2/QIOUwBEovoJ9tMROBXLxILafrDK8Itig=; b=1oQsOuacrrYRTg
	GUkIUEwSmWc/czBBRii1O2TvZuPOSNurdSN+L7uX8k1U/yLKL6L66EhBGwFkRakZ1agHezrUR5zaC
	+2eNXDSacIcDDRbHNt/SFNULAkJ/fOjDDKz8YIx1QnISDILaoXsnh7wPUWPbBXWc9RcmNr2OiBGAa
	F7SW39AKT4cvkWLfoVmBGs7jwcwHt9IXgGUhRX/u6j+9lOuFFKAx2+HoShbOMfwa2CUEnz4FOr4Fc
	dgfz3XtH29XFjkrGP5PiKEairZbO4+1SC9Japw0n2bIuhABjUB8I3RaHo66+KfMspZs22UimON/zS
	x0WPadDdRL3BI2os0/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyjb-007wR0-1X;
	Mon, 23 Oct 2023 17:28:59 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyjY-007wPS-2E
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 17:28:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b3c2607d9bso2869933b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698082136; x=1698686936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAkfutBo3nsUV3HCsxsM2k1RXnz72Gyz1ATUfewlcRg=;
        b=DJ9aHG/mpIduldRI5pA3/xaINmq8MlyJ0XSSX3pl7NMyvM61LGxBxEp20zRDBAvOQS
         gO3X+xgysZhf9+7vCcY4gxlDW3ERKd5ukipcRD627g+Hsl3DXs1jdWg0lPliNKfGPisf
         LL8GR11ra+DrK13hc2UkfU3d/toL2lyu0Eh87hZd1OpPBRTALKyQEQBFUYYIRRyS3lzj
         k+5y+VB6xtq7kUrWO73G2WHT+yEDrWC+j3afSFU7QHqauX6tkwNt0n8lb/a29NF/OhBA
         MbxQcXB4c2O/75LnAZ+xYJF+5a1AVUTW+tz2qTSpviqpleiusTRk+jjekVvsmCLZECM4
         WcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698082136; x=1698686936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAkfutBo3nsUV3HCsxsM2k1RXnz72Gyz1ATUfewlcRg=;
        b=VMq03OA9Towxe/vJr+fFepL5amE8c7ab2+cjPRVNQLmHx/b8uWURw4m49L9CiX2Ugo
         0M5r34jqwyplCx4aeXLvaTt31+hr1q3OktMwDfVtvwLkHMhKqxSxIt8v4907GWJNK8ay
         RjRbnSm127JFja1uj8A6fWpeimfR1VvIiTRi08XG1iPdv8y1+ju5u2sRtYdF58oObwCo
         7qX0Wgb5Tu1AIesXPoTFDYMXCnkWpzE1W5yLA9/J+/FRA7YXBs+4or+iy/ThBUNJM1Zf
         ZMK15ITJa6r0sPh12SPnzUt+KX0sx9MpVslLll/FvEA8bV3HqFs37YgQ1Oh0JjvesS5u
         8QpQ==
X-Gm-Message-State: AOJu0Yy7EHcMdrXh0MHqkV0fpUwHS5+aSfA/a+B3twW0fbcnv2FcnI8Q
	O61bYb3uZnghKBp2nGNdcwo34g==
X-Google-Smtp-Source: AGHT+IHEv622PTW8MXUm9/v9050C6S07lO3IVyzS+4QpJbZY1khLeZlRwyIxweFH/lEjSsN7iN7amg==
X-Received: by 2002:a05:6a00:c94:b0:6be:35f:631b with SMTP id a20-20020a056a000c9400b006be035f631bmr8503824pfv.33.1698082136066;
        Mon, 23 Oct 2023 10:28:56 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.9])
        by smtp.gmail.com with ESMTPSA id g5-20020aa79f05000000b006be055ab117sm6473194pfr.92.2023.10.23.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 10:28:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v11 09/14] irqchip/riscv-imsic: Add support for PCI MSI irqdomain
Date: Mon, 23 Oct 2023 22:57:55 +0530
Message-Id: <20231023172800.315343-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023172800.315343-1-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102856_728050_BD39CA5E 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Linux PCI framework requires it's own dedicated MSI irqdomain so
let us create PCI MSI irqdomain as child of the IMSIC base irqdomain.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |  7 +++
 drivers/irqchip/irq-riscv-imsic-platform.c | 51 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 59 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index bdd80716114d..c1d69b418dfb 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -552,6 +552,13 @@ config RISCV_IMSIC
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
index 23d286cb017e..cdb659401199 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -13,6 +13,7 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
@@ -215,6 +216,42 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 #endif
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
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
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
 #ifdef CONFIG_SMP
@@ -243,6 +280,18 @@ static int imsic_irq_domains_init(struct fwnode_handle *fwnode)
 	}
 	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
 
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	/* Create PCI MSI domain */
+	imsic->pci_domain = pci_msi_create_irq_domain(fwnode,
+						&imsic_pci_domain_info,
+						imsic->base_domain);
+	if (!imsic->pci_domain) {
+		pr_err("%pfwP: failed to create IMSIC PCI domain\n", fwnode);
+		irq_domain_remove(imsic->base_domain);
+		return -ENOMEM;
+	}
+#endif
+
 	/* Create Platform MSI domain */
 	imsic->plat_domain = platform_msi_create_irq_domain(fwnode,
 						&imsic_plat_domain_info,
@@ -250,6 +299,8 @@ static int imsic_irq_domains_init(struct fwnode_handle *fwnode)
 	if (!imsic->plat_domain) {
 		pr_err("%pfwP: failed to create IMSIC platform domain\n",
 			fwnode);
+		if (imsic->pci_domain)
+			irq_domain_remove(imsic->pci_domain);
 		irq_domain_remove(imsic->base_domain);
 		return -ENOMEM;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 82911b8b08b4..8d209e77432e 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -67,6 +67,7 @@ struct imsic_priv {
 
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
