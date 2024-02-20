Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887CBC5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AE0T58ms9D9pqlHbfxkNDEGF6eTFGmpZ+6FOOHjcOYA=; b=FEq3gDgq5rnmsX
	ak4qkYnNz2wngN2wVHXxObnIJwdQ7/P0+ltCeSW0KP/kwayKldzu0xSXoGnVvGqgqGm3XzhI7Xd/3
	73Vf74wVwVlwRUzu+Pey4Yw3POAeTShICJp/UilBGlS0KKkgW2dv+rRU+wsBi5D/i9/EM7FQWEDT6
	2RDZpYGufxRmv1aEIpmXP540sH12Rn24v5sMEzQVW/ZdgOiGpfsVPafRKVaSbX1cmVGma8kjYFmg1
	tGhH92TdluAjxDW8ibI/hzRBwhZTO/dDmizssusAXebvHAfk1I5ROcxTnoPig50ND2xuNB80x3wlz
	Ky1Ty8jVh5pVWyLHjdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJJn-0000000DIiA-2XEG;
	Tue, 20 Feb 2024 06:09:27 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJIx-0000000DI4N-0fTI
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:08:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dbd32cff0bso17076015ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 22:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708409314; x=1709014114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voD/meL0W7zIWdBDdYwK2ixfoNvQujQS24AsRgXA4M8=;
        b=o97SxHKK8LNvIDD3i/P91w94IluA2cR7TMjF4E1J7CVwmIRfJanbC3GbPBWD0szjd9
         g9ZClbFzi0899iRPm2CuAkHxm587uYrSdtR3ox83fnREsDDO8doEQToQg6LbkhSp867N
         nuA6WWZ9IDteXgtT4DckHXcvtbman1yWbFqyi8d8PLs2B+p/8Lyg39l9pYBFZifaMlcj
         oJU8xAPFNOD1DXMzutL5Ovya9kMEfSE40CTBilMT2RpaeShjMCgnfIHOykpy1/gUEYF9
         SJmcSgbyS1Al6VyOHtrhwb2xuXuN1a+cybheItFm1cRXtlZx8mebjvb0whCLNgdmJBjI
         AIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409314; x=1709014114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voD/meL0W7zIWdBDdYwK2ixfoNvQujQS24AsRgXA4M8=;
        b=BagdFxL5NgYqYokeqT3xgMPoA0dvxeUIWGMb/a4XH1i2VbmZ2I7WSLJi5vYHgns2Vi
         L3egu+e0zHsPoqN6CMh7kMovJWor91qXOdkANLnlfBhmBSDhRzSXw3CJY0fbvkhWtTEQ
         Fgd1VWYVW3ACVt3XwfANfqLDfaBD1p2uBAK0Xs401IvSFK5et8QMb3/p6zTsmsZfORRQ
         E6+oNowzGrhxQt+Ajjwo0XiiWCOCh2QLQ7uOg/1SDzaAE3hzasObf2ox8NO9+PwhRbsA
         rktXkucQaCslVMZEqSkrLUbdzGsc/e7r1PPXkXlwuocn3SYA4LZBNaDZibhqVImCd1wk
         B4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvzwrg6QVB3INNchfkNt59T6qbqWt6qo8mH0gocixR/DZw9UozBY6pPocri9U0/lpo48KVYxcPdqQhdvRG9auHBQ+lK8kFKcVsqI0E8kMY
X-Gm-Message-State: AOJu0YzUa22hqo2tuy7ZPUIf2247rS8xZJc4ykXPGXnTdNAvg7wiJ2wL
	UMLgmkqIauedraPSAJsDx49bEW63YMHlq8fU1g0WrY8fxSUzcSPv9Njg7rZl9E0=
X-Google-Smtp-Source: AGHT+IFHK5RUyvMii5QlAptAoirJ/ZuRW0A/bZtMk+rPS/m+OG49B3S5mOnnqlLYEWjyb8TnkNBU9Q==
X-Received: by 2002:a17:903:182:b0:1dc:25c:f67d with SMTP id z2-20020a170903018200b001dc025cf67dmr2750921plg.54.1708409313859;
        Mon, 19 Feb 2024 22:08:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.86])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b001db4c89aea5sm5368114plt.158.2024.02.19.22.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 22:08:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v13 08/13] irqchip/riscv-imsic: Add device MSI domain support for PCI devices
Date: Tue, 20 Feb 2024 11:37:13 +0530
Message-Id: <20240220060718.823229-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220060718.823229-1-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_220835_291710_5F237C88 
X-CRM114-Status: GOOD (  15.52  )
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
so let us extend the IMSIC driver to allow per-device MSI domains for
PCI devices.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |  7 +++++
 drivers/irqchip/irq-riscv-imsic-platform.c | 36 ++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

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
index 7ee44c493dbc..37f47375d5b7 100644
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
@@ -209,6 +210,28 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
@@ -218,6 +241,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 
 	/* MSI parent domain specific settings */
 	switch (real_parent->bus_token) {
+	case DOMAIN_BUS_PCI_MSI:
 	case DOMAIN_BUS_NEXUS:
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
@@ -232,6 +256,13 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 
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
@@ -271,11 +302,12 @@ static bool imsic_init_dev_msi_info(struct device *dev,
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
