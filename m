Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F88BC5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 05:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzgniybiGMefTOhQ136QDyCQbPXosB+CrKq+NBWuPx8=; b=3CDWTn/KDbRHQa
	kvSgTLFLNxIebgM79barWkp0D4tL/FI59wbxM4RrE81luQg3G36ek6IG2gYe9iwS/qgdgBZNg0NRL
	RQ5oYGFx5G3Z7WC7YR+RMhENmZT+sN0etdtLGbQLgXpmf8Z93rqjNZqLadKxFRMrNIepw1zkSRh2K
	JRlYJFO1PlbrIyZEMGGXyzDMOr6cl/RHpGkIWaILtSrMqloBbAKajeaLP+x0CrjaCVJcQTDmcGzMa
	AATBDuHtHVQhxesdb+JxHEexIuoAykWMuEh6S7iDVfaTWKqSqy022xYupbz6j6pX18MErKxL1iPna
	MslTZXjrzkYqvBuHz+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reTLO-0000000GVpv-0WG0;
	Mon, 26 Feb 2024 05:16:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSJ0-0000000GNVC-1TXX
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 04:09:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d95d67ff45so15337075ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 20:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708920568; x=1709525368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jRh4tMvuYcqr95qV4EQU7BolCnIgD6A0sDxFfSdHTU=;
        b=SCbhHYAh0PB5vY8gCcdNEA7qKajY7Pz5rqcAUtxWmIqISdYFJPA8QIT94H8iYsCyer
         PL1HCVsHDgiakLOsb78i25Nl+JWUdpxbJjoIrkVRzeIlVVPq1oZHXh/OdiFQ0AwN/FdX
         RHMzzKl7LXvc0N9dN4d8g2Gy9YxmnwEutz5IwuCzT09w73wBNz/XA8GayF76AGYglrQH
         BHU7uwp4wifbZRQ6ItDzVy8TadJzO7xD/l4+DnxTn2Gl50bTOjIwQPXWtMTy7ILXxJY+
         q7ux1ZP3AXn7rUV2PPbUPdKpyDRN7qQL7GfRms1GZsIRkSiUZjyCH+UJwXv54HD0NYoz
         H7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708920568; x=1709525368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jRh4tMvuYcqr95qV4EQU7BolCnIgD6A0sDxFfSdHTU=;
        b=LOWScA+5QJweMqslXQBB+V+CfUZMDiuDIFdfK1mZwnZOF8+oTmlmY9GPDLDmgJ4kQ5
         puR1jqma2TY+sLJpW5MC43RPC3CIMgvblOFpPt+W5n4V5qg88rosPRCfKF0gWLmKKYbB
         t4PP8z5ilTi0fG30PkOJQoVFJxcQXrX2xswYqCs0bNiQ5EGzWAN7IUWDvc93C8ZrTnpD
         m1AU0N2cCXy9bJMFXxD5mtW0hYyKoPtmUBe4fiTe0sqo3EXwMacOCTH63wKzhIhRs+jb
         ASzdg8sjEz7gHKuk7vIvHWd7ZiEsd6nnSyVjdE2Rbdkwr+GWUsVfn83f0eN1fBTsrKC4
         MdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Ss4xtmHarfTDL+ganpthCQnLam2qjlHi7SBnOcHPWconTpQdtto4HqQ327LaaoAjyH7lorr1fYvuBI1gqh6YnBUcxsXMW99NppSlCfvg
X-Gm-Message-State: AOJu0YwU+FxuY5G7zoUj+d+R598z8nQ3aROcGss0mJ+4rTFLa6Xj7lHn
	uOrKrcFeOrpEN1Arwda1aCdNDQVFdrRnxyV7yHTqdukyW9msy4+o/S1Ys6084uM=
X-Google-Smtp-Source: AGHT+IFb5nfTnsngif5R24W+zDTwXCsdIbt9IxWe6Et50phyVLUhDui9STPSBvBSVJnrNYZYK5nNgQ==
X-Received: by 2002:a17:902:e885:b0:1dc:a84c:987c with SMTP id w5-20020a170902e88500b001dca84c987cmr626941plg.10.1708920568219;
        Sun, 25 Feb 2024 20:09:28 -0800 (PST)
Received: from localhost.localdomain ([171.76.86.62])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001dc6f7e794dsm3023258pln.16.2024.02.25.20.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 20:09:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v15 05/10] irqchip/riscv-imsic: Add device MSI domain support for PCI devices
Date: Mon, 26 Feb 2024 09:37:41 +0530
Message-Id: <20240226040746.1396416-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226040746.1396416-1-apatel@ventanamicro.com>
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_200930_808475_278899F9 
X-CRM114-Status: GOOD (  15.16  )
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

The Linux PCI framework supports per-device MSI domains for PCI devices
so extend the IMSIC driver to allow PCI per-device MSI domains.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |  7 +++++
 drivers/irqchip/irq-riscv-imsic-platform.c | 35 ++++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 85f86e31c996..2fc0cb32341a 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -553,6 +553,13 @@ config RISCV_IMSIC
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
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
index 35291bf90d65..1e6dddfd3046 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -14,6 +14,7 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
@@ -207,6 +208,28 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
+	irq_chip_unmask_parent(d);
+	pci_msi_unmask_irq(d);
+}
+
+#define MATCH_PCI_MSI		BIT(DOMAIN_BUS_PCI_MSI)
+
+#else
+
+#define MATCH_PCI_MSI		0
+
+#endif
+
 static bool imsic_init_dev_msi_info(struct device *dev,
 				    struct irq_domain *domain,
 				    struct irq_domain *real_parent,
@@ -230,6 +253,13 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 
 	/* Is the target supported? */
 	switch (info->bus_token) {
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	case DOMAIN_BUS_PCI_DEVICE_MSI:
+	case DOMAIN_BUS_PCI_DEVICE_MSIX:
+		info->chip->irq_mask = imsic_pci_mask_irq;
+		info->chip->irq_unmask = imsic_pci_unmask_irq;
+		break;
+#endif
 	case DOMAIN_BUS_DEVICE_MSI:
 		/*
 		 * Per-device MSI should never have any MSI feature bits
@@ -269,11 +299,12 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 #define MATCH_PLATFORM_MSI		BIT(DOMAIN_BUS_PLATFORM_MSI)
 
 static const struct msi_parent_ops imsic_msi_parent_ops = {
-	.supported_flags	= MSI_GENERIC_FLAGS_MASK,
+	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
+				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
 				  MSI_FLAG_USE_DEF_CHIP_OPS,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
-	.bus_select_mask	= MATCH_PLATFORM_MSI,
+	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.init_dev_msi_info	= imsic_init_dev_msi_info,
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
