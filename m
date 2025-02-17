Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130A1C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LY77jufTzcwjKVu9w91sgElVzTjJPJCSSYE5wMgkjQ=; b=1JlRHYdXy6IAo5
	EyuHoUV8r8BtX/fbXZ51FM8pp8k1mEISQEfTbhx4cAQybk4xVMKt7o+ZmM1A3E5u3zJqiOgFgT66Z
	JkwT9yQAbylEwh6l3R+QsBVIXEPk9MiDrV1uuU9SvTYkZ14dpO8PnR4ROIay21/LwNRkMV7Wys8HG
	BloWhYzKvDGP+bwyyltoJkHi/XS3A67EmRDXVn2Y+KT/AHhj9AdoZC+IAHC+dr32Cjy8+tE6Pa2G1
	W7mQuyZlyCl397vFaJR/V5Wtkm2qNQzduFnnn1uCu+77XeHmZYxvIW7Ff3QlLgWJTwRmrzu2IvHVF
	gmQKv1SQB9FLOjIIKmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx2j-00000003r7g-2dzO;
	Mon, 17 Feb 2025 09:03:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxH-00000003pf0-0DY1
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Feb 2025 08:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Oop51W2xPzPgS///BRY5kVWjIpIgQEDQeLtCvsidU3M=; b=qUuwIuD4xwyW48B8HHRELiIiBs
	L2afIojBB7VIDHbZ+km/Rx9fuIKlSloswkqyF1KlPhiI5k8jcPs9mTv2b1LuqlSnneOkBjLlbYxh4
	HU1WkFLHHIdCa32C3gcyvzc63+QhTuVF0dA/q31/0t5L6mpvcCxv2qgYhr9pjv1ikOnQiQNo2wPzV
	ddqt8LjcyWyqM9SBC1+Bka/spceK270DXuXrd6TffwpLoE5Fy5r1A0Zed3I+4Q6XgyrcOEzB+EEZL
	tugm35ShGfEEUB1iybu/6iFlTTpoe51mjFIPUVx9NQ5YCRoznCuSlG/EWF5RXpbgKyO6Fh2iQ156u
	P4BrxfCw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxE-00000001jn1-0r9z
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:17 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-221057b6ac4so25032485ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782694; x=1740387494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oop51W2xPzPgS///BRY5kVWjIpIgQEDQeLtCvsidU3M=;
        b=npnesor5BHF2wPdb4o3wIuHS/my8BJ8XEx6JM2Nv69cdaTo85XYAIdp6i6PqOOM1Dx
         EITI7UjLo2D+Bd5pDlIKFjm7doDjTbcNiXpep8MPMAfXTZ9KjMM1WQbMFOpW9gWsFGx6
         fj4V/yhGGdB3iHoxayP193kcKVrH6v8qQpTbpManb5Pt3sU1n+bGIPjRlzTfF33c6C7q
         n7BqVS94AGRS7viWneGw7SqCP0MasleM6/QYgSOggkbqPBsMXS5UzMt2BnwyORFM1Ady
         g39hMqUwNIpUKADdRT/gtUHRYY6FF4q8MzxD/FTLe0+lC4PGY8ms2oddk3PwIn6sZveB
         IBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782694; x=1740387494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oop51W2xPzPgS///BRY5kVWjIpIgQEDQeLtCvsidU3M=;
        b=NHg98NrK2ORZw7I+cYpugZQFtdlpZlY/7o8oKp1shEcS8yOHeA1naIwbN+tjalhiYj
         75BSX6wTrxTInuzHGIVtpoQYpySP6lLed8ZiDWdmYcDDQ9lmEcm72TFd7hgLGf08OADo
         LnT1Q0cvHc2317rvLLiyptWExHdkDucyXXrIdu4WJAxrbAyl7n9cfLNIEBH1UyS2xIVW
         md1EROiFrbzPHmaYp3qaD1RzKgKccOQ2szRmJgVDzVejFr17NPXiu2lFN967t05DCCml
         ocUS2EuB+VV0C9KAplrKRUgmCcHMaI+Rfd/F2tt40NDsNZwSIFCAU6hB+q71aKdizNXw
         MBvw==
X-Forwarded-Encrypted: i=1; AJvYcCXfB5BfP0efXuyOGxI2Jj3xLX3icTlXvjKGy1l2cYeZwLGmKqnZxitcvlml1gK0X/6jXKV1567qN8GyuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYK2wYwoWzotp37NFQcSfT/rvYo0McA6bOebOta0V/Cn5U212
	3WSMCsLLIXpUALa95u1S7cIf10FvGhYY2Xu5oRVIdci8n20uWdvXbSp4rnATEQ8=
X-Gm-Gg: ASbGncstC7rCm1MvcQC85olN+4Vq42/khvtCVB1HiqdodOuVA4gNBTdqyBJYB6lqY1/
	amrn0ODNrBaTy8cjbzmY1of+5rSq4ojtLwOGzCzGyYsAtL8bNnINzXw+wpYdrk+NCJfO0NaeWp4
	YDPT7sRpVRXC7Msty8Yp/aZvYnQERXuA6JPUQdaBqFzIMFNB+6me/Qv6t8TUv2cD1ZUJYA05Z8H
	mIEsGp3XV8875Gk9JdTdQiwFMaeEoG0sI30keciYnDA4i0vS8piwjjk9QzLI5/t6AOJ8ZyOmNVm
	xnzMbdZBhf5+YZWMCjk0b5N3Ck0BYz/Q+j6AUQ/XwMMKrKliKmCyTcU=
X-Google-Smtp-Source: AGHT+IHKsFX8G1xeFdGN0LrWZ8KF20LhqcM9UDqb+rrZ1azyG6dWW4gYdjdpQdbPPAsWI3TzMShx/g==
X-Received: by 2002:a05:6a21:7886:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1ee8cb3e424mr12892785637.21.1739782693650;
        Mon, 17 Feb 2025 00:58:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:13 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v6 03/10] irqchip/riscv-imsic: Move to common MSI lib
Date: Mon, 17 Feb 2025 14:26:49 +0530
Message-ID: <20250217085657.789309-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_085816_402081_3CEAEBD6 
X-CRM114-Status: GOOD (  16.42  )
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
index c11b9965c4ad..fe95ef723bb3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -590,13 +590,7 @@ config RISCV_IMSIC
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
