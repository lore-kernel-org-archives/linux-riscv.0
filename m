Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064DDEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFK1UQq2c8bTbm4GTfqIkBsGzxkryYaxo6fcrs0gtog=; b=J5RnM3V9ZHRsKo
	O9gjiKKEw26irhfmW16JRgV5EdoN6qHLeEO4NFAgdarb8X0m9yNeu93zHuKoV1X6c8zm9XsyY0eMK
	/fvHreWHNY6ogrhEU5kPJKngXZpwcurUoOG7KSCpQOqWLg3Sz58jVfHYvgLSW9TeOBvKndtyQPLJX
	ugXBk/zSdqU5/bM+sOzEFxXDRZ/K0dz3Qy0K87rfJ4ypwGoSgCUIP41/eXVmmHtceuuNq9F8TbY0T
	Ji1zIMpgOz4W8D44or6S/ZV1SZm6gTmBFQnjNKDa5BCFkDVv9+Vj+D8VrKASetX/8sHN5WZVhpKQX
	kyYNNZXHiyAFv+4Wf8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5U3-007GC2-1X;
	Wed, 19 Jul 2023 11:36:43 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5Ty-007G8z-10
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:36:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-668704a5b5bso6774006b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766598; x=1690371398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmhrC0bwxM+FgEIaLxjftU83GlCxoN1AibJYYkq1R/U=;
        b=lp2DZv5IgjB3gdal4giL1P9E0hSEwJaOZu3pdCE4vHillC5p9QPCUJEAXfPNlBeCuF
         HPAUkexFRLL/IHBiaWqQ3JwdZ2kJDHMpoE9fe0/s+d6tiGzmIQGO1aky4dvENamr9sHt
         DzMPTfF3fI//gdFiOYQpCLdQT+XEJ9LibfP9Xu8afbIpEMKaxCpOP2KYyiRAN3vQgqVo
         yBLyzI6Y+mGxhc19a0iQbjKlaB6Fe7mSZPNyk1PFdkCG1y1AhsAl7K/GBrbDl9r3ICS5
         AMb9StivjA1m7kDkexQgA6Wn2EUDAePd1sNeYB7TSugUco4EEl3BPyG1O9WcRMtLhZDY
         sXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766598; x=1690371398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmhrC0bwxM+FgEIaLxjftU83GlCxoN1AibJYYkq1R/U=;
        b=OtpIZeItZ7VJRVWbcM9NVdesGTsi7Z4Z3QjHWu/GusECcqKgMd9lQZLcA+v758EXoi
         mtPRIUaz3eYf91e3n4vsr9rAhJjnHkPmSEwQjq1TuYm7EyDXbuPQvzGg607lFGJdbWAT
         OjwkEPVWXiAwA2+A1hGvYWGvEe4IwvM1WTefUCeQzWCz+iyBSTFyTWgnEUENxMIFVhcu
         /9TWO7YkcEta94ClUybllvBp84EOF/QR2pIXjLiqfhzMtqXx4PL7xIP4UHJycycgoTHf
         XU5DrUQk6MbC0VAtddLPgEuZCmhXic3QEfhHhDHxEE/JwKxkH5fh5tqsoihgrlXbL7XM
         fKQQ==
X-Gm-Message-State: ABy/qLbobQZkqqj1JXJEEO6Xaf/sBhOP4KsLbxnpdDELuJCmpgG0BLsj
	ugJLfAA7LodIfs7KiN1Te9TuFA==
X-Google-Smtp-Source: APBJJlGvpSFmoDtt4AekGZiAmwsfK05xLAsO9n1vYhmfozZlBCZoZsjyw9FqGOyglUcx+lO0ZkkWUw==
X-Received: by 2002:a05:6a00:997:b0:66c:a45:f00b with SMTP id u23-20020a056a00099700b0066c0a45f00bmr24803863pfg.23.1689766597626;
        Wed, 19 Jul 2023 04:36:37 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:36:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 08/14] irqchip/riscv-imsic: Add support for platform MSI irqdomain
Date: Wed, 19 Jul 2023 17:05:36 +0530
Message-Id: <20230719113542.2293295-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043638_417835_DE99A43A 
X-CRM114-Status: GOOD (  27.75  )
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

The Linux platform MSI support requires a platform MSI irqdomain so
let us add a platform irqchip driver for RISC-V IMSIC which provides
a base IRQ domain and platform MSI domain. This driver assumes that
the IMSIC state is already initialized by the IMSIC early driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Makefile                   |   2 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 280 +++++++++++++++++++++
 2 files changed, 281 insertions(+), 1 deletion(-)
 create mode 100644 drivers/irqchip/irq-riscv-imsic-platform.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index d714724387ce..abca445a3229 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -95,7 +95,7 @@ obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
-obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o
+obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
new file mode 100644
index 000000000000..db896b6e51ff
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/cpu.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/smp.h>
+
+#include "irq-riscv-imsic-state.h"
+
+static int imsic_cpu_page_phys(unsigned int cpu,
+			       unsigned int guest_index,
+			       phys_addr_t *out_msi_pa)
+{
+	struct imsic_global_config *global;
+	struct imsic_local_config *local;
+
+	global = &imsic->global;
+	local = per_cpu_ptr(global->local, cpu);
+
+	if (BIT(global->guest_index_bits) <= guest_index)
+		return -EINVAL;
+
+	if (out_msi_pa)
+		*out_msi_pa = local->msi_pa +
+			      (guest_index * IMSIC_MMIO_PAGE_SZ);
+
+	return 0;
+}
+
+static int imsic_get_cpu(const struct cpumask *mask_val, bool force,
+			 unsigned int *out_target_cpu)
+{
+	unsigned int cpu;
+
+	if (force)
+		cpu = cpumask_first(mask_val);
+	else
+		cpu = cpumask_any_and(mask_val, cpu_online_mask);
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	if (out_target_cpu)
+		*out_target_cpu = cpu;
+
+	return 0;
+}
+
+static void imsic_irq_mask(struct irq_data *d)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&imsic->ids_lock, flags);
+	bitmap_clear(imsic->ids_enabled_bimap, d->hwirq, 1);
+	__imsic_id_disable(d->hwirq);
+	raw_spin_unlock_irqrestore(&imsic->ids_lock, flags);
+
+	imsic_ids_remote_sync();
+}
+
+static void imsic_irq_unmask(struct irq_data *d)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&imsic->ids_lock, flags);
+	bitmap_set(imsic->ids_enabled_bimap, d->hwirq, 1);
+	__imsic_id_enable(d->hwirq);
+	raw_spin_unlock_irqrestore(&imsic->ids_lock, flags);
+
+	imsic_ids_remote_sync();
+}
+
+static void imsic_irq_compose_msi_msg(struct irq_data *d,
+				      struct msi_msg *msg)
+{
+	phys_addr_t msi_addr;
+	unsigned int cpu;
+	int err;
+
+	cpu = imsic_id_get_target(d->hwirq);
+	if (WARN_ON(cpu == UINT_MAX))
+		return;
+
+	err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
+	if (WARN_ON(err))
+		return;
+
+	msg->address_hi = upper_32_bits(msi_addr);
+	msg->address_lo = lower_32_bits(msi_addr);
+	msg->data = d->hwirq;
+}
+
+#ifdef CONFIG_SMP
+static int imsic_irq_set_affinity(struct irq_data *d,
+				  const struct cpumask *mask_val,
+				  bool force)
+{
+	unsigned int target_cpu;
+	int rc;
+
+	rc = imsic_get_cpu(mask_val, force, &target_cpu);
+	if (rc)
+		return rc;
+
+	imsic_id_set_target(d->hwirq, target_cpu);
+	irq_data_update_effective_affinity(d, cpumask_of(target_cpu));
+
+	return IRQ_SET_MASK_OK;
+}
+#endif
+
+static struct irq_chip imsic_irq_base_chip = {
+	.name			= "IMSIC-BASE",
+	.irq_mask		= imsic_irq_mask,
+	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
+	.irq_compose_msi_msg	= imsic_irq_compose_msi_msg,
+	.flags			= IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static int imsic_irq_domain_alloc(struct irq_domain *domain,
+				  unsigned int virq,
+				  unsigned int nr_irqs,
+				  void *args)
+{
+	int i, hwirq, err = 0;
+	unsigned int cpu;
+
+	err = imsic_get_cpu(cpu_online_mask, false, &cpu);
+	if (err)
+		return err;
+
+	hwirq = imsic_ids_alloc(get_count_order(nr_irqs));
+	if (hwirq < 0)
+		return hwirq;
+
+	for (i = 0; i < nr_irqs; i++) {
+		imsic_id_set_target(hwirq + i, cpu);
+		irq_domain_set_info(domain, virq + i, hwirq + i,
+				    &imsic_irq_base_chip, imsic,
+				    handle_simple_irq, NULL, NULL);
+		irq_set_noprobe(virq + i);
+		irq_set_affinity(virq + i, cpu_online_mask);
+		/*
+		 * IMSIC does not implement irq_disable() so Linux interrupt
+		 * subsystem will take a lazy approach for disabling an IMSIC
+		 * interrupt. This means IMSIC interrupts are left unmasked
+		 * upon system suspend and interrupts are not processed
+		 * immediately upon system wake up. To tackle this, we disable
+		 * the lazy approach for all IMSIC interrupts.
+		 */
+		irq_set_status_flags(virq + i, IRQ_DISABLE_UNLAZY);
+	}
+
+	return 0;
+}
+
+static void imsic_irq_domain_free(struct irq_domain *domain,
+				  unsigned int virq,
+				  unsigned int nr_irqs)
+{
+	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
+
+	imsic_ids_free(d->hwirq, get_count_order(nr_irqs));
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops imsic_base_domain_ops = {
+	.alloc		= imsic_irq_domain_alloc,
+	.free		= imsic_irq_domain_free,
+};
+
+static struct irq_chip imsic_plat_irq_chip = {
+	.name			= "IMSIC-PLAT",
+};
+
+static struct msi_domain_ops imsic_plat_domain_ops = {
+};
+
+static struct msi_domain_info imsic_plat_domain_info = {
+	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
+	.ops	= &imsic_plat_domain_ops,
+	.chip	= &imsic_plat_irq_chip,
+};
+
+static int __init imsic_irq_domains_init(struct device *dev)
+{
+	/* Create Base IRQ domain */
+	imsic->base_domain = irq_domain_create_tree(dev->fwnode,
+					&imsic_base_domain_ops, imsic);
+	if (!imsic->base_domain) {
+		dev_err(dev, "failed to create IMSIC base domain\n");
+		return -ENOMEM;
+	}
+	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
+
+	/* Create Platform MSI domain */
+	imsic->plat_domain = platform_msi_create_irq_domain(dev->fwnode,
+						&imsic_plat_domain_info,
+						imsic->base_domain);
+	if (!imsic->plat_domain) {
+		dev_err(dev, "failed to create IMSIC platform domain\n");
+		irq_domain_remove(imsic->base_domain);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int imsic_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imsic_global_config *global;
+	int rc;
+
+	if (!imsic) {
+		dev_err(dev, "early driver not probed\n");
+		return -ENODEV;
+	}
+
+	if (imsic->base_domain) {
+		dev_err(dev, "irq domain already created\n");
+		return -ENODEV;
+	}
+
+	global = &imsic->global;
+
+	/* Initialize IRQ and MSI domains */
+	rc = imsic_irq_domains_init(dev);
+	if (rc) {
+		dev_err(dev, "failed to initialize IRQ and MSI domains\n");
+		return rc;
+	}
+
+	dev_info(dev, "  hart-index-bits: %d,  guest-index-bits: %d\n",
+		 global->hart_index_bits, global->guest_index_bits);
+	dev_info(dev, " group-index-bits: %d, group-index-shift: %d\n",
+		 global->group_index_bits, global->group_index_shift);
+	dev_info(dev, " mapped %d interrupts at base PPN %pa\n",
+		 global->nr_ids, &global->base_addr);
+
+	return 0;
+}
+
+static const struct of_device_id imsic_platform_match[] = {
+	{ .compatible = "riscv,imsics" },
+	{}
+};
+
+static struct platform_driver imsic_platform_driver = {
+	.driver = {
+		.name		= "riscv-imsic",
+		.of_match_table	= imsic_platform_match,
+	},
+	.probe = imsic_platform_probe,
+};
+
+static int __init imsic_platform_init(void)
+{
+	/*
+	 * Register IMSIC driver as early as possible so that IMSIC
+	 * platform device is probed as soon as it is created.
+	 */
+	return platform_driver_register(&imsic_platform_driver);
+}
+core_initcall(imsic_platform_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
