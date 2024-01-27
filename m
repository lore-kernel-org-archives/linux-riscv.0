Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D5C47DDF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72uPD4ORuej3A9yrmeWFBT6DzI5cOoBzKKAS95Ns+Do=; b=4T8HUjWh8UmU7m
	iZDxVCXKOpXcL6gkaD8nfcisV8QcjLEns2T7iiiGyfbrZwMQYijdJJdEUzrYRBLymqDyAOUWwAbLt
	IL0N7y/tMXyaKvT9MJpcBqrfF5+ctoLe+2NMPvBvtslnhIlWb9ms3hf7Hzv1GwGLY4ur4KTISDA3z
	Xa0JrRaCP6IQPoB24rCGkN2tmcySqpssanJOOMe+2Uj78ckLUaRnta0RsCzTCMvD2JIYs7h51iZHO
	7MkPdamXWHhN7TibkT+T1LsvOLGaVytWdBVua92oQYqndvNTbMq7Y5fjw5WnwqpvXYu1MACV/yLU0
	Z3rJqLLKmZQIqZT1L6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlSM-00000007mzZ-07Sy;
	Sat, 27 Jan 2024 16:22:58 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlPh-00000007lFz-0bEN
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:20:21 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-290b9f83037so901078a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372412; x=1706977212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWyTlHThOIP2PmYrOkTqrnYOBnpBzPmOIxliRiyO7gY=;
        b=E1eGL1cRePQaDCp2afBtrZEjIjdDWK6KObxF6U9qu8jxLHHE02RfffJjDA+tBQB07E
         HUVXz+68JUjlfwEDxJkh0iyzrskKgMHVcq8JPwZ1A1M7r3rNgYEbVUm6m/gwjTO1+2hp
         rnD8CfdBcCXl1ftDTrGIwAZx+/w+Iq2lSIzt6xQ7rrHvgMcOIgBAABEttJ8PVKgkq+fP
         ULXjUGzetvpe4Cnm5jrC4INDNxcywyIJD9IYNQCfDf1Kgqah/OQee/BI0kkjWe4NPCs+
         jyFzAh3EYkFpriKo4SkxXOnsvsGPRewBYFAUTVPUMQykTImIIGG4/1oQh/YaZrVJYzSt
         tePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372412; x=1706977212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWyTlHThOIP2PmYrOkTqrnYOBnpBzPmOIxliRiyO7gY=;
        b=HRHB9ZkVQoBgc8gJOojmB+dgalIppXfO61ITZMrNphdFIEF/AWG3QpX//Dl9qOorfz
         B85DFwRzJcrEDWrhrw3qBtdmCa+0Fk6ReeDEsRBGzRqSZEaEA//DOQr+qJHFeIUemP0s
         RnmursEU+YPwx4PxRBh59W+eLcQOfkpWms5DHsImKd031X9s5lcKUrZfBfoCa+Sc3lCr
         sbhkcZ15l1LfKjtP3l5JAYo7+7WjVNqge+nQa1dNB+4rCi4zgEvww11UVmble4rp9r55
         cDK0NlO9AgQbWZDnn8GW99EuLVdIaGCLt8kq4mIJbus7DHkhgHsrn+dUiZEaM4sXp/dt
         Cazg==
X-Gm-Message-State: AOJu0Yx1XcFXBAvlS6mRqw+bAbnqM22D5fK27LMdDxg+YADbXX4jNK2j
	6ysEjkOx2OdBsh7ubvK8H7MH28aIFX3ncxpSa5L6ShGW/y1NmOefTTXM4TwktxU=
X-Google-Smtp-Source: AGHT+IFrKJaMrUUnXUlX9Xg/yzaWu/kqwtNsAtmGyQxWv5XM9lg2H6U7/sf2rrzmbZzLdQh1c/SffA==
X-Received: by 2002:a17:90a:d48a:b0:28e:8e78:8ba6 with SMTP id s10-20020a17090ad48a00b0028e8e788ba6mr1902639pju.43.1706372412102;
        Sat, 27 Jan 2024 08:20:12 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:20:11 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 20/25] irqchip/riscv-imsic: Add device MSI domain support for PCI devices
Date: Sat, 27 Jan 2024 21:47:48 +0530
Message-Id: <20240127161753.114685-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_082013_716546_EC387905 
X-CRM114-Status: GOOD (  14.93  )
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
index 65791a6b0727..d78c93e2cf2b 100644
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
@@ -233,6 +234,28 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
@@ -242,6 +265,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 
 	/* MSI parent domain specific settings */
 	switch (real_parent->bus_token) {
+	case DOMAIN_BUS_PCI_MSI:
 	case DOMAIN_BUS_NEXUS:
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
@@ -256,6 +280,13 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 
 	/* Is the target supported? */
 	switch (info->bus_token) {
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	case DOMAIN_BUS_PCI_DEVICE_MSI:
+	case DOMAIN_BUS_PCI_DEVICE_MSIX:
+		info->chip->irq_mask = imsic_pci_mask_irq;
+		info->chip->irq_unmask = imsic_pci_unmask_irq;
+		break;
+#endif
 	case DOMAIN_BUS_DEVICE_IMS:
 		/*
 		 * Per device IMS should never have any MSI feature bits
@@ -295,11 +326,12 @@ static bool imsic_init_dev_msi_info(struct device *dev,
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
