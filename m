Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABD4C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3Wi7o7flvq2CsVhHQhotPGHmQFTYKGUxVpjKnjZtmQ=; b=FNAPKryyqRPQIB
	qgsiCzri34sYpQs0fnaJcnryWrNNoLssB/OxmXJrhStmUGpuw+1stqrCpu4oUYP/tX8q/N2hpcPfI
	gughWn8ksklsOqxI9JtG96QWa0IARujUWrXJ6brDedjHMwAEEn2PB7qRb7Mopi8tGkcqjncEJDzpJ
	96EXt/r/9NK9wWLkKhPpRoaOzvtSfcAIetluC8bSSIdemPXWuUiygIfms1aUSKSBlOZyJLLLqIO52
	FYjtuHn8/d10Q5j4HzBamNV6m8mT5UCMR5Hqur6MenSsi1Uu/ZRH1HwNl3YJRp0gtWQecNsDjgC9K
	GmHw2Z4EhSkB0RCVQQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5bh-00000004JuV-0x37;
	Thu, 22 Feb 2024 09:43:09 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ab-00000004Iwt-3w2c
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:42:07 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c031c24fbeso1095348b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594921; x=1709199721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp730QJfPl3UdF1ypk+MZODRkE+rBOU76pBYGEsA07M=;
        b=Xc03KqhczKBQv6OiVz5p7L58kjSURxAlQYcP7rLNnRZ2sqNaZD1Ep2W75D18osRZOW
         Dk7K0XNkEWUEvVPIYBTIDg1vYWBKuLA2QnXE8is9cPvBzilOeGm53B0lSbnq4h3pfs63
         HFMYIDBKiJI8VIp0u79GqBO4HoYM21LaXBh3zr/GJ8oB2SUYg4hHo1JAgYF1AwbWBLFF
         dGXQaKEV0EFbENUz1cPklOvwffBDIMSDZSmU11kmpz+Pe/0eS/vmLQjQkdAboTYBsuOm
         c8fN4uh9xG1IEH0VXALOTaX69QDqlLGrfdq6Qp+hr687yw/pZrz6D6CuMrlOzmQZf9hs
         xGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594921; x=1709199721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp730QJfPl3UdF1ypk+MZODRkE+rBOU76pBYGEsA07M=;
        b=xEzbdHl2UUrSRFn6VhuQwncea+5yOCCKbz9lYzoLKQykel4Y7WGisIwd/LBU533ooQ
         OOg4ZZmaSCqXDTOg9kgR463AC4lB22KcCnRWB6jAsi/Q7Jsz+fgrnh1Wy+rkAGN1i78Z
         o7MdHPMagB11NSO8zBE4MWXG6/DTyeiLlyaRpG+UowwSnUP7TKfVIeZnGQvG+1hvbpMB
         hBPAI+Wui9TzJTFSZSv/IhasaEkPkWbfX7H9wLRIfnwZOAfiGYPaSI65dRWyqWdU22Oy
         oqvldOLfzUP0sNSlxD7aR9mV2u5NS/gnE68Ioem+p6L59DQLdo4D2gNQ2CCECqOAcJzb
         00TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXim6RsLgp3KepfZ7YRb4kdG4xrz33OQZ4m5vuA0LYCkgvTSnRNUMexXI8GUH8umUwlJ3hyrggvMNnMWUlyOSF4wf1FjpUygDs5w+xxR9RV
X-Gm-Message-State: AOJu0Yw/Y02gdmgEXVPLgAOh8522mi8D4no0X5kV2tiwMkivXyLW3l6O
	ItIZgalzf61RPmbE17F3OqJMcqDvXV7v1lOoiqD99Io/P1mKB0CnTsdP+qatS20=
X-Google-Smtp-Source: AGHT+IFami/eHbrAuwdif34EK9jrr/gIrhjNiuyviyiZpgrNHVm6xVJTUyG+0a808idQ56fvM4bgXA==
X-Received: by 2002:a05:6808:308a:b0:3c1:782e:b8e1 with SMTP id bl10-20020a056808308a00b003c1782eb8e1mr1966233oib.39.1708594920963;
        Thu, 22 Feb 2024 01:42:00 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:42:00 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 13/18] irqchip/riscv-imsic: Add device MSI domain support for PCI devices
Date: Thu, 22 Feb 2024 15:10:01 +0530
Message-Id: <20240222094006.1030709-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014202_249579_BAE79F5F 
X-CRM114-Status: GOOD (  14.90  )
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
index e2344fc08dca..90ddcdd0bba5 100644
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
@@ -208,6 +209,28 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
@@ -231,6 +254,13 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 
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
@@ -270,11 +300,12 @@ static bool imsic_init_dev_msi_info(struct device *dev,
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
