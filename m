Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C947C021A0
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOfkU+YQxegZ5CJGoO3JIFcxZ8EEupED4WM5kBBHd3U=; b=ifjywOBlN7gK8g
	CKCSA774RZj+pIEhtQnxbxvVcUIiqoCFDn9+gB0YeX9a+pq6EZclPMh6/hDT4HncmKTYGfm1eVjJQ
	MW/5l14khTvO/DlUkgU6tw53W5YxtkQtgjX6rS+OB3jabn+PFUDTrrp284jYfZDAneg9oSulOOcgG
	XrP0AGQOdq0eFH6Vg/fmOfLG+K8Iiyzm2AaY+ruqWzXZMavsix8vC9lw7TnthKAVh86NMwbYvNWxV
	T2n2EH4wo5NE9coQLh/z0qedTV5IoeXF+f8N5LI/0JG6zMb5A4lmtXYiffr9WvdWBQheDrjyJT6SQ
	BtPupng4reZmMsH0g/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyp3-0000000E3G1-11kW;
	Sun, 09 Feb 2025 04:21:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgylI-0000000E2Ng-1Wnq
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f3c119fe6so71873585ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074659; x=1739679459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=XB70fzpmLxHJQMIwdTzyY4ZxIlL84Ppk/QbOktOpmYC57Q9vEcbjdI30QCnsIoiyNU
         InevfyS60FdRDF5yBVfq5ndhaQZTVj2CBFprlpGzoNqnYfWt9mkwbnsrZvisB0UlE0kR
         rbUzQSZQNGFdO5MZFXEbgnvDSzPPbnECOqKfLVfqxfY2zZSQrGQrt+ihOlLzuio3+7W6
         GKJuI/EnJcPwI1ad3jgk1BG1UWnFB0bZVvTeD3kB80MZiQgIY+B5tHc0AaHIBZpR7VA8
         Huxp4y42yL4iHS0PH5NRLqDMlcgQY7f6moeb5So4LGkAHU8dRA/M+SpI9PPaZ1RghFCu
         t71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074659; x=1739679459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=Mx+HHAJkoz1kTem5aDKKfHw6n1Mu93PAUC2iTNcnJN6lKZJ1Hw3e6QPFrt1In65RLK
         mdMMPkg0uGKPQ41O76YZvmjOGjux7vPmkpStZL3WtqbiqyASL8HnWZkUF9+LOdu4TToY
         +Xz8EfNX9BeAqxEPoDmAV04Ww+StzIQomzbXSdlgIR16f1FvBzF9gHyu9ZiZ25PN8qxJ
         laTJsJ2vx8sAQN3AL6L3DdaXMbm+5I984SkTcTbDuF5aolO8KLneXLIKsrol9OMYABpV
         k4bzgZ308g+u9u3V/xH/9MxrpBvRwYQBmkR14MrPe/9Es3zvsg6pcueqFEdSrz6mbvFh
         6mQg==
X-Forwarded-Encrypted: i=1; AJvYcCWQXM/uDvsVssI0+JcGPDC2MicXTvyKiEwSOEkc+0K9W5mHNhWOS2tt9eQzRvkLAVqeAKla8m2nmUlYgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0lVtJ01gOnGSkY7AcpBPUDx5167lkBbb4fAaNSsnmZ29gjJ6+
	FnwT5W2zMAcC4MtEsjkOJ/cnTMLbXG7EjtvF3f9cEXl8I8mTrtdeLBGDaSaCg90=
X-Gm-Gg: ASbGncsNgOiZV8xHUFsjfKmsJB31IwxGB/wV8jsszl4Zx452wiBP8oZXZwsAB7cOx/a
	zG+iZkA7Ea2tI2kxOt9SxCQQTthlPDdQJePVuMmDoaBM8LL0tuTLbYNowZ/1SwvgYtSTg4IFS4B
	iSEH+w77zoq5JJcECmLkcuZIOcOz7YxQlkLAYg/TaQkd4JAxsBxuZUWzX6+CbpDWJ0OigzU0tnZ
	pM6DHVtQk9dLorUqkG588UvkkOitl6xbui4d5Z40xJjtD92+loBQopYZPx4pxRU0XGIcr9mMQTm
	FiQIe/g8VB8ov731l9TKhKY3Ojcc3xB0tD23+rnxBxq9JR9zRRSRS7Y=
X-Google-Smtp-Source: AGHT+IH/ik3Ur8iKEEYDe9Hd4WVhXmYUsHE6OOkf8RhOk/pD00c5WvEJC3c0LK+040dao0sK2cXHKQ==
X-Received: by 2002:a05:6a20:c6c6:b0:1db:dfc0:d342 with SMTP id adf61e73a8af0-1ee03a247admr16710991637.7.1739074659234;
        Sat, 08 Feb 2025 20:17:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 03/11] irqchip/riscv-imsic: Move to common MSI lib
Date: Sun,  9 Feb 2025 09:46:47 +0530
Message-ID: <20250209041655.331470-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201740_517024_71F40DD2 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Simplify the leaf MSI domain handling in the RISC-V IMSIC driver by
using msi_lib_init_dev_msi_info() and msi_lib_irq_domain_select()
provided by common MSI lib.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 114 +--------------------
 2 files changed, 6 insertions(+), 116 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index be063bfb50c4..bc3f12af2dc7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -589,13 +589,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
-
-config RISCV_IMSIC_PCI
-	bool
-	depends on RISCV_IMSIC
-	depends on PCI
-	depends on PCI_MSI
-	default RISCV_IMSIC
+	select IRQ_MSI_LIB
 
 config SIFIVE_PLIC
 	bool
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 5d7c30ad8855..9a5e7b4541f6 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "irq-msi-lib.h"
 #include "irq-riscv-imsic-state.h"
 
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
@@ -174,22 +175,6 @@ static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 
-static int imsic_irq_domain_select(struct irq_domain *domain, struct irq_fwspec *fwspec,
-				   enum irq_domain_bus_token bus_token)
-{
-	const struct msi_parent_ops *ops = domain->msi_parent_ops;
-	u32 busmask = BIT(bus_token);
-
-	if (fwspec->fwnode != domain->fwnode || fwspec->param_count != 0)
-		return 0;
-
-	/* Handle pure domain searches */
-	if (bus_token == ops->bus_select_token)
-		return 1;
-
-	return !!(ops->bus_select_mask & busmask);
-}
-
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 				 struct irq_data *irqd, int ind)
@@ -206,110 +191,21 @@ static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 static const struct irq_domain_ops imsic_base_domain_ops = {
 	.alloc		= imsic_irq_domain_alloc,
 	.free		= imsic_irq_domain_free,
-	.select		= imsic_irq_domain_select,
+	.select		= msi_lib_irq_domain_select,
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	.debug_show	= imsic_irq_debug_show,
 #endif
 };
 
-#ifdef CONFIG_RISCV_IMSIC_PCI
-
-static void imsic_pci_mask_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void imsic_pci_unmask_irq(struct irq_data *d)
-{
-	irq_chip_unmask_parent(d);
-	pci_msi_unmask_irq(d);
-}
-
-#define MATCH_PCI_MSI		BIT(DOMAIN_BUS_PCI_MSI)
-
-#else
-
-#define MATCH_PCI_MSI		0
-
-#endif
-
-static bool imsic_init_dev_msi_info(struct device *dev,
-				    struct irq_domain *domain,
-				    struct irq_domain *real_parent,
-				    struct msi_domain_info *info)
-{
-	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
-
-	/* MSI parent domain specific settings */
-	switch (real_parent->bus_token) {
-	case DOMAIN_BUS_NEXUS:
-		if (WARN_ON_ONCE(domain != real_parent))
-			return false;
-#ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
-#endif
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Is the target supported? */
-	switch (info->bus_token) {
-#ifdef CONFIG_RISCV_IMSIC_PCI
-	case DOMAIN_BUS_PCI_DEVICE_MSI:
-	case DOMAIN_BUS_PCI_DEVICE_MSIX:
-		info->chip->irq_mask = imsic_pci_mask_irq;
-		info->chip->irq_unmask = imsic_pci_unmask_irq;
-		break;
-#endif
-	case DOMAIN_BUS_DEVICE_MSI:
-		/*
-		 * Per-device MSI should never have any MSI feature bits
-		 * set. It's sole purpose is to create a dumb interrupt
-		 * chip which has a device specific irq_write_msi_msg()
-		 * callback.
-		 */
-		if (WARN_ON_ONCE(info->flags))
-			return false;
-
-		/* Core managed MSI descriptors */
-		info->flags |= MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS |
-			       MSI_FLAG_FREE_MSI_DESCS;
-		break;
-	case DOMAIN_BUS_WIRED_TO_MSI:
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Use hierarchial chip operations re-trigger */
-	info->chip->irq_retrigger = irq_chip_retrigger_hierarchy;
-
-	/*
-	 * Mask out the domain specific MSI feature flags which are not
-	 * supported by the real parent.
-	 */
-	info->flags &= pops->supported_flags;
-
-	/* Enforce the required flags */
-	info->flags |= pops->required_flags;
-
-	return true;
-}
-
-#define MATCH_PLATFORM_MSI		BIT(DOMAIN_BUS_PLATFORM_MSI)
-
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
-				  MSI_FLAG_USE_DEF_CHIP_OPS,
+				  MSI_FLAG_USE_DEF_CHIP_OPS |
+				  MSI_FLAG_PCI_MSI_MASK_PARENT,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= imsic_init_dev_msi_info,
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
