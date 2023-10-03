Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A7E75421
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czZHxRRE177s/VsAbfNe6SE5AqEx6kX+PpF5XNOu7oo=; b=wCg2v1UZglFdQv
	FUO8NeY5TQXRCyH7dchqJhxAxtPDT8Gky7Ro0QmoY4oU2YrdZFUO69yEo407oRevU5Ot2iLroBOH3
	1MPIhKUqPIHnu3tAE48DtLJHMz3bRHcljLPKX9HyMc86Zsn+XxRyxpVOwKDYJWaomQovMHmp6Q6a9
	9jecBKDt2FvEhtbRvksOoa2XzlNyucU//oEjtJP2/aXJ17TB4TGZLo3timJFiq1956l7z6fsqt9tN
	VRR+2E25bx3h+RZ0RpjZoZEqHRmPizKgvRtzV9NfZRo031x0i3jb4kkWjQMONGw+z9VBVyHFPo1UW
	oR+JJ6LFczbGaX58qhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHk-00DoEe-1e;
	Tue, 03 Oct 2023 04:45:28 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHh-00DoAT-0H
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:45:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5827f6d60aaso284990a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308319; x=1696913119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNI4nj6VxC8ffCT3JYvSrGp65MUAMNfxdIlM9NdkkxQ=;
        b=Oyy+/Yd+KgSDfSzQ+cimWCSs79soHtQHEdSKXjZ87fBVk2+TKRurvvk7hnFDwBLEMA
         h8PyVXO+U1TC5toIweGLPAEaS+m/JZywnonSuxWqBnLWvRN1t14vXHcqUmc4mKW9Pt7q
         6ydQtC2PSj18/PFF3dg+oi7VdGnd/hIOdszll9oUx73C7KuhKz+ZvB+D1i3R7R7x3yU9
         j39xlZ5ehGySCJsn1SrnbE98uQr7qpTSnNkJuRvf4hBclDnSMSAtMywggwJUe/9klABQ
         PmRMu+0QrLTl0BCF9EWNNDroYYFsTcR8jS1ktYHUghTDt6PQgRF+GEydC+ulhHBBF5g4
         pEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308319; x=1696913119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNI4nj6VxC8ffCT3JYvSrGp65MUAMNfxdIlM9NdkkxQ=;
        b=onNQGV2gE7T9zBhrCQZoccvjlHZdkpSFtxAIESrt83xdUM7jqB9JqwZxhx3coLo4R1
         W4qfQM8u5DcsGWTz0ZLbSHWgiFmU+yIItN16nuIRSeEhtoY1AR7ZVUf6Ify021U8LslU
         LMJB/sNohBOfQKJ8AauYs8IYFW0MOgfyrODDkixC84h26INhxV5lwqDMVLjlby5VUuxU
         LP4dEb2RP658BtnMGGtnxymGO17h/fQucW6iOreDbSla/QRXNc5yNbRGvfWJT+FVxKQ7
         66Qp8YPaKy3sWhEVqhXu7FwSfwOVquzI4VWccTv+OQorcR7LA3CIlREqs1LeZy/k2Rd1
         BkqA==
X-Gm-Message-State: AOJu0Yxu1gGpuyYOmKF1JHsGffgZFP0uzgNNzlrMSfioKQ3IaJMRp6MW
	YBzlfBTvU4btkmwss+t+vk3X5A==
X-Google-Smtp-Source: AGHT+IEbCO68y8SZzUOGFND0KSpP4gYSWQJmgIR5AvcXi/a3hyPJ8DBSlgk+rTNLEI4hWiP7ueeEpQ==
X-Received: by 2002:a05:6300:8081:b0:14d:5796:bccd with SMTP id ap1-20020a056300808100b0014d5796bccdmr11164227pzc.24.1696308319041;
        Mon, 02 Oct 2023 21:45:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:45:18 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 09/15] irqchip/riscv-imsic: Add support for platform MSI irqdomain
Date: Tue,  3 Oct 2023 10:13:57 +0530
Message-Id: <20231003044403.1974628-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214525_127990_AEAA1EBC 
X-CRM114-Status: GOOD (  27.28  )
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
 drivers/irqchip/irq-riscv-imsic-platform.c | 271 +++++++++++++++++++++
 2 files changed, 272 insertions(+), 1 deletion(-)
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
index 000000000000..809e338bf9c3
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -0,0 +1,271 @@
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
+static int imsic_irq_domains_init(struct device *dev)
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
+builtin_platform_driver(imsic_platform_driver);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
