Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8044C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwplDTTyLkRTxjPrY7KVCZ7OKKIw6wx69jxUCQZJ+7s=; b=2mvNjqx7XlFHei
	BgHkc4TsTsoEKg7aq1HfPlaV4RXG7lDvQ44ci7u7ve1744GQtBXOUNrfm7ZvBy2FkoQPN3mqPLBxB
	y8tbVjZWo40cGxP6LNBazFPd+bHEfM5wr4Y9nXvt42udAi78+2TY9b4OtAooKQlgvZIQ5a37oivyZ
	ou7VLwT+hU64duWlYO8J4uxYRNt5B5q/CsUeW82TgcNAt5R/4ulXnWZTSAyOM//wPzxNaVky+3gzQ
	4wblY834sol+aUi7DLN75MHZVmCjXynjpJfnEKEjEYmKp+jJPT/ob+FlnW9qFdzKe+ZxW47NXe1Wi
	Q8gFMjNBIhQBrRkv9nQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFKS-00000005Bxz-1evo;
	Thu, 07 Mar 2024 15:06:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riELj-00000004vnl-2wFV
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 14:04:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dcad814986so7592715ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709820235; x=1710425035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyhGU4oEJF0fAQXDrl2WjHKm/JYMNobybYkvRM1sFSo=;
        b=oW0KM0XoG++Ce26x4dovmhoff6TMD6pKZhxDh/XaB8K/uwyZ+CWXFDTdJZmtKQVspQ
         eS7fHSezxEjyRPjCRy5RJTkyUPBvmnZ8uLxRoCDg+94RV5M18ZFkEBUODMCkwr4ZJwSo
         OwZsfpveYP5M5o083fXyyOI7U40iZ5YuKNeWjd1g4K0/RuKEqPaXTa8YduVnGBa06LZr
         ZZNTZrjSAVVJD8BOqNjUef3EDUWZ+u2yv4bQ1amO5yV56Fzc+DRSpVAP2bFFMQpkr97g
         n0rsDXtuqjB7FH0TNbYKmIqVBBXSDYKHO+b83HiXJaPaNb3s/ZKK39jP6Uu/KudTrnFa
         Q2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820235; x=1710425035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyhGU4oEJF0fAQXDrl2WjHKm/JYMNobybYkvRM1sFSo=;
        b=RP7+GtpWUrYoG/U+Nqnk3olD0Gf+qY5P8619/IcpVsAsWhIKsf0vdgw6dwsDB2Gv9p
         5bqd/J01CrsmH5Uv3BWZLwkYLw8g1sks8/ieDhC3irwgMfWdOKdbNq87SFZtc+FyZHvX
         YpIBZDLSRJWqkJhcFud0t8yLS1ybJ8ecEaQQbi+kA4V455/97xj9e3ENaJ6koBN313g9
         XUtkI8XNmbQ2P0Yjl/aexDEgFUmTpJSDkr32wD2/7pSOyKJ+JinEO0tlyrSv0hAHlS+S
         nvfITpWEoC3BMZsQL/ogRQoIe1qp/kYm1y7tscHZFHu4f14LSQsaIG4DKnZIYl5WMtZU
         zWBA==
X-Forwarded-Encrypted: i=1; AJvYcCU7sQ9hg4aMi3VVrGkFemUdUUwhpQ/KQlTVM9iUs9ypMF2DjOBjSNhLONWNK/arl/E+vMZmtML6/9JARSDasbj34qtB0jGDeq+DbwMD0bNn
X-Gm-Message-State: AOJu0Yz8J60s7oQLU13xnnui9yII/zXLOk8YKejp/RNpR38SfSvR3mNk
	uXXysvfXVixXDZFo5n5ohkdLbp8pURbg4t5yJ2CYU+9A+9nGSEGvTvRHn3FvF/4=
X-Google-Smtp-Source: AGHT+IGeaef74EEDv+vrrYSyIewbgHWU5+mp6G4an12xXRqbcRwfOrEa3n3GpzeGdL1gcYESmvhTrg==
X-Received: by 2002:a17:902:c402:b0:1db:28bd:2949 with SMTP id k2-20020a170902c40200b001db28bd2949mr9528635plk.0.1709820234611;
        Thu, 07 Mar 2024 06:03:54 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.79])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709026f0100b001dd6174c651sm386228plk.149.2024.03.07.06.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:03:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for direct-mode
Date: Thu,  7 Mar 2024 19:33:04 +0530
Message-Id: <20240307140307.646078-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307140307.646078-1-apatel@ventanamicro.com>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_060356_664262_B7211A14 
X-CRM114-Status: GOOD (  28.47  )
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

The RISC-V advanced interrupt architecture (AIA) specification defines
advanced platform-level interrupt controller (APLIC) which has two modes
of operation: 1) Direct mode and 2) MSI mode.
(For more details, refer https://github.com/riscv/riscv-aia)

In APLIC direct-mode, wired interrupts are forwared to CPUs (or HARTs)
as a local external interrupt.

Add a platform irqchip driver for the RISC-V APLIC direct-mode to
support RISC-V platforms having only wired interrupts.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                  |   5 +
 drivers/irqchip/Makefile                 |   1 +
 drivers/irqchip/irq-riscv-aplic-direct.c | 326 +++++++++++++++++++++++
 drivers/irqchip/irq-riscv-aplic-main.c   | 211 +++++++++++++++
 drivers/irqchip/irq-riscv-aplic-main.h   |  44 +++
 include/linux/irqchip/riscv-aplic.h      | 145 ++++++++++
 6 files changed, 732 insertions(+)
 create mode 100644 drivers/irqchip/irq-riscv-aplic-direct.c
 create mode 100644 drivers/irqchip/irq-riscv-aplic-main.c
 create mode 100644 drivers/irqchip/irq-riscv-aplic-main.h
 create mode 100644 include/linux/irqchip/riscv-aplic.h

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2fc0cb32341a..dbc8811d3764 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -546,6 +546,11 @@ config SIFIVE_PLIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
+config RISCV_APLIC
+	bool
+	depends on RISCV
+	select IRQ_DOMAIN_HIERARCHY
+
 config RISCV_IMSIC
 	bool
 	depends on RISCV
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index abca445a3229..7f8289790ed8 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -95,6 +95,7 @@ obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
+obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
new file mode 100644
index 000000000000..06bace9b7497
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/riscv-aplic.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/printk.h>
+#include <linux/smp.h>
+
+#include "irq-riscv-aplic-main.h"
+
+#define APLIC_DISABLE_IDELIVERY		0
+#define APLIC_ENABLE_IDELIVERY		1
+#define APLIC_DISABLE_ITHRESHOLD	1
+#define APLIC_ENABLE_ITHRESHOLD		0
+
+struct aplic_direct {
+	struct aplic_priv	priv;
+	struct irq_domain	*irqdomain;
+	struct cpumask		lmask;
+};
+
+struct aplic_idc {
+	unsigned int		hart_index;
+	void __iomem		*regs;
+	struct aplic_direct	*direct;
+};
+
+static unsigned int aplic_direct_parent_irq;
+static DEFINE_PER_CPU(struct aplic_idc, aplic_idcs);
+
+static void aplic_direct_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * The fasteoi_handler requires irq_eoi() callback hence
+	 * provide a dummy handler.
+	 */
+}
+
+#ifdef CONFIG_SMP
+static int aplic_direct_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
+				     bool force)
+{
+	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
+	struct aplic_direct *direct = container_of(priv, struct aplic_direct, priv);
+	struct aplic_idc *idc;
+	unsigned int cpu, val;
+	struct cpumask amask;
+	void __iomem *target;
+
+	cpumask_and(&amask, &direct->lmask, mask_val);
+
+	if (force)
+		cpu = cpumask_first(&amask);
+	else
+		cpu = cpumask_any_and(&amask, cpu_online_mask);
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	idc = per_cpu_ptr(&aplic_idcs, cpu);
+	target = priv->regs + APLIC_TARGET_BASE + (d->hwirq - 1) * sizeof(u32);
+	val = FIELD_PREP(APLIC_TARGET_HART_IDX, idc->hart_index);
+	val |= FIELD_PREP(APLIC_TARGET_IPRIO, APLIC_DEFAULT_PRIORITY);
+	writel(val, target);
+
+	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+
+	return IRQ_SET_MASK_OK_DONE;
+}
+#endif
+
+static struct irq_chip aplic_direct_chip = {
+	.name		= "APLIC-DIRECT",
+	.irq_mask	= aplic_irq_mask,
+	.irq_unmask	= aplic_irq_unmask,
+	.irq_set_type	= aplic_irq_set_type,
+	.irq_eoi	= aplic_direct_irq_eoi,
+#ifdef CONFIG_SMP
+	.irq_set_affinity = aplic_direct_set_affinity,
+#endif
+	.flags		= IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_SKIP_SET_WAKE |
+			  IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static int aplic_direct_irqdomain_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
+					    unsigned long *hwirq, unsigned int *type)
+{
+	struct aplic_priv *priv = d->host_data;
+
+	return aplic_irqdomain_translate(fwspec, priv->gsi_base, hwirq, type);
+}
+
+static int aplic_direct_irqdomain_alloc(struct irq_domain *domain, unsigned int virq,
+					unsigned int nr_irqs, void *arg)
+{
+	struct aplic_priv *priv = domain->host_data;
+	struct aplic_direct *direct = container_of(priv, struct aplic_direct, priv);
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int i, ret;
+
+	ret = aplic_irqdomain_translate(fwspec, priv->gsi_base, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_set_info(domain, virq + i, hwirq + i, &aplic_direct_chip,
+				    priv, handle_fasteoi_irq, NULL, NULL);
+		irq_set_affinity(virq + i, &direct->lmask);
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops aplic_direct_irqdomain_ops = {
+	.translate	= aplic_direct_irqdomain_translate,
+	.alloc		= aplic_direct_irqdomain_alloc,
+	.free		= irq_domain_free_irqs_top,
+};
+
+/*
+ * To handle an APLIC direct interrupts, we just read the CLAIMI register
+ * which will return highest priority pending interrupt and clear the
+ * pending bit of the interrupt. This process is repeated until CLAIMI
+ * register return zero value.
+ */
+static void aplic_direct_handle_irq(struct irq_desc *desc)
+{
+	struct aplic_idc *idc = this_cpu_ptr(&aplic_idcs);
+	struct irq_domain *irqdomain = idc->direct->irqdomain;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	irq_hw_number_t hw_irq;
+	int irq;
+
+	chained_irq_enter(chip, desc);
+
+	while ((hw_irq = readl(idc->regs + APLIC_IDC_CLAIMI))) {
+		hw_irq = hw_irq >> APLIC_IDC_TOPI_ID_SHIFT;
+		irq = irq_find_mapping(irqdomain, hw_irq);
+
+		if (unlikely(irq <= 0)) {
+			dev_warn_ratelimited(idc->direct->priv.dev,
+					     "hw_irq %lu mapping not found\n", hw_irq);
+		} else {
+			generic_handle_irq(irq);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void aplic_idc_set_delivery(struct aplic_idc *idc, bool en)
+{
+	u32 de = (en) ? APLIC_ENABLE_IDELIVERY : APLIC_DISABLE_IDELIVERY;
+	u32 th = (en) ? APLIC_ENABLE_ITHRESHOLD : APLIC_DISABLE_ITHRESHOLD;
+
+	/* Priority must be less than threshold for interrupt triggering */
+	writel(th, idc->regs + APLIC_IDC_ITHRESHOLD);
+
+	/* Delivery must be set to 1 for interrupt triggering */
+	writel(de, idc->regs + APLIC_IDC_IDELIVERY);
+}
+
+static int aplic_direct_dying_cpu(unsigned int cpu)
+{
+	if (aplic_direct_parent_irq)
+		disable_percpu_irq(aplic_direct_parent_irq);
+
+	return 0;
+}
+
+static int aplic_direct_starting_cpu(unsigned int cpu)
+{
+	if (aplic_direct_parent_irq) {
+		enable_percpu_irq(aplic_direct_parent_irq,
+				  irq_get_trigger_type(aplic_direct_parent_irq));
+	}
+
+	return 0;
+}
+
+static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
+					   u32 *parent_hwirq, unsigned long *parent_hartid)
+{
+	struct of_phandle_args parent;
+	int rc;
+
+	/*
+	 * Currently, only OF fwnode is supported so extend this
+	 * function for ACPI support.
+	 */
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	rc = of_irq_parse_one(to_of_node(dev->fwnode), index, &parent);
+	if (rc)
+		return rc;
+
+	rc = riscv_of_parent_hartid(parent.np, parent_hartid);
+	if (rc)
+		return rc;
+
+	*parent_hwirq = parent.args[0];
+	return 0;
+}
+
+int aplic_direct_setup(struct device *dev, void __iomem *regs)
+{
+	int i, j, rc, cpu, current_cpu, setup_count = 0;
+	struct aplic_direct *direct;
+	struct irq_domain *domain;
+	struct aplic_priv *priv;
+	struct aplic_idc *idc;
+	unsigned long hartid;
+	u32 v, hwirq;
+
+	direct = devm_kzalloc(dev, sizeof(*direct), GFP_KERNEL);
+	if (!direct)
+		return -ENOMEM;
+	priv = &direct->priv;
+
+	rc = aplic_setup_priv(priv, dev, regs);
+	if (rc) {
+		dev_err(dev, "failed to create APLIC context\n");
+		return rc;
+	}
+
+	/* Setup per-CPU IDC and target CPU mask */
+	current_cpu = get_cpu();
+	for (i = 0; i < priv->nr_idcs; i++) {
+		rc = aplic_direct_parse_parent_hwirq(dev, i, &hwirq, &hartid);
+		if (rc) {
+			dev_warn(dev, "parent irq for IDC%d not found\n", i);
+			continue;
+		}
+
+		/*
+		 * Skip interrupts other than external interrupts for
+		 * current privilege level.
+		 */
+		if (hwirq != RV_IRQ_EXT)
+			continue;
+
+		cpu = riscv_hartid_to_cpuid(hartid);
+		if (cpu < 0) {
+			dev_warn(dev, "invalid cpuid for IDC%d\n", i);
+			continue;
+		}
+
+		cpumask_set_cpu(cpu, &direct->lmask);
+
+		idc = per_cpu_ptr(&aplic_idcs, cpu);
+		idc->hart_index = i;
+		idc->regs = priv->regs + APLIC_IDC_BASE + i * APLIC_IDC_SIZE;
+		idc->direct = direct;
+
+		aplic_idc_set_delivery(idc, true);
+
+		/*
+		 * Boot cpu might not have APLIC hart_index = 0 so check
+		 * and update target registers of all interrupts.
+		 */
+		if (cpu == current_cpu && idc->hart_index) {
+			v = FIELD_PREP(APLIC_TARGET_HART_IDX, idc->hart_index);
+			v |= FIELD_PREP(APLIC_TARGET_IPRIO, APLIC_DEFAULT_PRIORITY);
+			for (j = 1; j <= priv->nr_irqs; j++)
+				writel(v, priv->regs + APLIC_TARGET_BASE + (j - 1) * sizeof(u32));
+		}
+
+		setup_count++;
+	}
+	put_cpu();
+
+	/* Find parent domain and register chained handler */
+	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
+					  DOMAIN_BUS_ANY);
+	if (!aplic_direct_parent_irq && domain) {
+		aplic_direct_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
+		if (aplic_direct_parent_irq) {
+			irq_set_chained_handler(aplic_direct_parent_irq,
+						aplic_direct_handle_irq);
+
+			/*
+			 * Setup CPUHP notifier to enable parent
+			 * interrupt on all CPUs
+			 */
+			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					  "irqchip/riscv/aplic:starting",
+					  aplic_direct_starting_cpu,
+					  aplic_direct_dying_cpu);
+		}
+	}
+
+	/* Fail if we were not able to setup IDC for any CPU */
+	if (!setup_count)
+		return -ENODEV;
+
+	/* Setup global config and interrupt delivery */
+	aplic_init_hw_global(priv, false);
+
+	/* Create irq domain instance for the APLIC */
+	direct->irqdomain = irq_domain_create_linear(dev->fwnode, priv->nr_irqs + 1,
+						     &aplic_direct_irqdomain_ops, priv);
+	if (!direct->irqdomain) {
+		dev_err(dev, "failed to create direct irq domain\n");
+		return -ENOMEM;
+	}
+
+	/* Advertise the interrupt controller */
+	dev_info(dev, "%d interrupts directly connected to %d CPUs\n",
+		 priv->nr_irqs, priv->nr_idcs);
+
+	return 0;
+}
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
new file mode 100644
index 000000000000..160ff99d6979
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/irqchip/riscv-aplic.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+
+#include "irq-riscv-aplic-main.h"
+
+void aplic_irq_unmask(struct irq_data *d)
+{
+	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
+
+	writel(d->hwirq, priv->regs + APLIC_SETIENUM);
+}
+
+void aplic_irq_mask(struct irq_data *d)
+{
+	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
+
+	writel(d->hwirq, priv->regs + APLIC_CLRIENUM);
+}
+
+int aplic_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
+	void __iomem *sourcecfg;
+	u32 val = 0;
+
+	switch (type) {
+	case IRQ_TYPE_NONE:
+		val = APLIC_SOURCECFG_SM_INACTIVE;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		val = APLIC_SOURCECFG_SM_LEVEL_LOW;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		val = APLIC_SOURCECFG_SM_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		val = APLIC_SOURCECFG_SM_EDGE_FALL;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		val = APLIC_SOURCECFG_SM_EDGE_RISE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	sourcecfg = priv->regs + APLIC_SOURCECFG_BASE;
+	sourcecfg += (d->hwirq - 1) * sizeof(u32);
+	writel(val, sourcecfg);
+
+	return 0;
+}
+
+int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
+			      unsigned long *hwirq, unsigned int *type)
+{
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
+	if (WARN_ON(!fwspec->param[0]))
+		return -EINVAL;
+
+	/* For DT, gsi_base is always zero. */
+	*hwirq = fwspec->param[0] - gsi_base;
+	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+
+	WARN_ON(*type == IRQ_TYPE_NONE);
+
+	return 0;
+}
+
+void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
+{
+	u32 val;
+#ifdef CONFIG_RISCV_M_MODE
+	u32 valh;
+
+	if (msi_mode) {
+		val = lower_32_bits(priv->msicfg.base_ppn);
+		valh = FIELD_PREP(APLIC_xMSICFGADDRH_BAPPN, upper_32_bits(priv->msicfg.base_ppn));
+		valh |= FIELD_PREP(APLIC_xMSICFGADDRH_LHXW, priv->msicfg.lhxw);
+		valh |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXW, priv->msicfg.hhxw);
+		valh |= FIELD_PREP(APLIC_xMSICFGADDRH_LHXS, priv->msicfg.lhxs);
+		valh |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXS, priv->msicfg.hhxs);
+		writel(val, priv->regs + APLIC_xMSICFGADDR);
+		writel(valh, priv->regs + APLIC_xMSICFGADDRH);
+	}
+#endif
+
+	/* Setup APLIC domaincfg register */
+	val = readl(priv->regs + APLIC_DOMAINCFG);
+	val |= APLIC_DOMAINCFG_IE;
+	if (msi_mode)
+		val |= APLIC_DOMAINCFG_DM;
+	writel(val, priv->regs + APLIC_DOMAINCFG);
+	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
+		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
+}
+
+static void aplic_init_hw_irqs(struct aplic_priv *priv)
+{
+	int i;
+
+	/* Disable all interrupts */
+	for (i = 0; i <= priv->nr_irqs; i += 32)
+		writel(-1U, priv->regs + APLIC_CLRIE_BASE + (i / 32) * sizeof(u32));
+
+	/* Set interrupt type and default priority for all interrupts */
+	for (i = 1; i <= priv->nr_irqs; i++) {
+		writel(0, priv->regs + APLIC_SOURCECFG_BASE + (i - 1) * sizeof(u32));
+		writel(APLIC_DEFAULT_PRIORITY,
+		       priv->regs + APLIC_TARGET_BASE + (i - 1) * sizeof(u32));
+	}
+
+	/* Clear APLIC domaincfg */
+	writel(0, priv->regs + APLIC_DOMAINCFG);
+}
+
+int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs)
+{
+	struct of_phandle_args parent;
+	int rc;
+
+	/*
+	 * Currently, only OF fwnode is supported so extend this
+	 * function for ACPI support.
+	 */
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	/* Save device pointer and register base */
+	priv->dev = dev;
+	priv->regs = regs;
+
+	/* Find out number of interrupt sources */
+	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,num-sources",
+				  &priv->nr_irqs);
+	if (rc) {
+		dev_err(dev, "failed to get number of interrupt sources\n");
+		return rc;
+	}
+
+	/*
+	 * Find out number of IDCs based on parent interrupts
+	 *
+	 * If "msi-parent" property is present then we ignore the
+	 * APLIC IDCs which forces the APLIC driver to use MSI mode.
+	 */
+	if (!of_property_present(to_of_node(dev->fwnode), "msi-parent")) {
+		while (!of_irq_parse_one(to_of_node(dev->fwnode), priv->nr_idcs, &parent))
+			priv->nr_idcs++;
+	}
+
+	/* Setup initial state APLIC interrupts */
+	aplic_init_hw_irqs(priv);
+
+	return 0;
+}
+
+static int aplic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	bool msi_mode = false;
+	void __iomem *regs;
+	int rc;
+
+	/* Map the MMIO registers */
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (!regs) {
+		dev_err(dev, "failed map MMIO registers\n");
+		return -ENOMEM;
+	}
+
+	/*
+	 * If msi-parent property is present then setup APLIC MSI
+	 * mode otherwise setup APLIC direct mode.
+	 */
+	if (is_of_node(dev->fwnode))
+		msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
+	if (msi_mode)
+		rc = -ENODEV;
+	else
+		rc = aplic_direct_setup(dev, regs);
+	if (rc)
+		dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
+
+	return rc;
+}
+
+static const struct of_device_id aplic_match[] = {
+	{ .compatible = "riscv,aplic" },
+	{}
+};
+
+static struct platform_driver aplic_driver = {
+	.driver = {
+		.name		= "riscv-aplic",
+		.of_match_table	= aplic_match,
+	},
+	.probe = aplic_probe,
+};
+builtin_platform_driver(aplic_driver);
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
new file mode 100644
index 000000000000..4cfbadf37ddc
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+
+#ifndef _IRQ_RISCV_APLIC_MAIN_H
+#define _IRQ_RISCV_APLIC_MAIN_H
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/fwnode.h>
+
+#define APLIC_DEFAULT_PRIORITY		1
+
+struct aplic_msicfg {
+	phys_addr_t		base_ppn;
+	u32			hhxs;
+	u32			hhxw;
+	u32			lhxs;
+	u32			lhxw;
+};
+
+struct aplic_priv {
+	struct device		*dev;
+	u32			gsi_base;
+	u32			nr_irqs;
+	u32			nr_idcs;
+	void __iomem		*regs;
+	struct aplic_msicfg	msicfg;
+};
+
+void aplic_irq_unmask(struct irq_data *d);
+void aplic_irq_mask(struct irq_data *d);
+int aplic_irq_set_type(struct irq_data *d, unsigned int type);
+int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
+			      unsigned long *hwirq, unsigned int *type);
+void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode);
+int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs);
+int aplic_direct_setup(struct device *dev, void __iomem *regs);
+
+#endif
diff --git a/include/linux/irqchip/riscv-aplic.h b/include/linux/irqchip/riscv-aplic.h
new file mode 100644
index 000000000000..ec8f7df50583
--- /dev/null
+++ b/include/linux/irqchip/riscv-aplic.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+#ifndef __LINUX_IRQCHIP_RISCV_APLIC_H
+#define __LINUX_IRQCHIP_RISCV_APLIC_H
+
+#include <linux/bitops.h>
+
+#define APLIC_MAX_IDC			BIT(14)
+#define APLIC_MAX_SOURCE		1024
+
+#define APLIC_DOMAINCFG			0x0000
+#define APLIC_DOMAINCFG_RDONLY		0x80000000
+#define APLIC_DOMAINCFG_IE		BIT(8)
+#define APLIC_DOMAINCFG_DM		BIT(2)
+#define APLIC_DOMAINCFG_BE		BIT(0)
+
+#define APLIC_SOURCECFG_BASE		0x0004
+#define APLIC_SOURCECFG_D		BIT(10)
+#define APLIC_SOURCECFG_CHILDIDX_MASK	0x000003ff
+#define APLIC_SOURCECFG_SM_MASK	0x00000007
+#define APLIC_SOURCECFG_SM_INACTIVE	0x0
+#define APLIC_SOURCECFG_SM_DETACH	0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE	0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL	0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH	0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW	0x7
+
+#define APLIC_MMSICFGADDR		0x1bc0
+#define APLIC_MMSICFGADDRH		0x1bc4
+#define APLIC_SMSICFGADDR		0x1bc8
+#define APLIC_SMSICFGADDRH		0x1bcc
+
+#ifdef CONFIG_RISCV_M_MODE
+#define APLIC_xMSICFGADDR		APLIC_MMSICFGADDR
+#define APLIC_xMSICFGADDRH		APLIC_MMSICFGADDRH
+#else
+#define APLIC_xMSICFGADDR		APLIC_SMSICFGADDR
+#define APLIC_xMSICFGADDRH		APLIC_SMSICFGADDRH
+#endif
+
+#define APLIC_xMSICFGADDRH_L		BIT(31)
+#define APLIC_xMSICFGADDRH_HHXS_MASK	0x1f
+#define APLIC_xMSICFGADDRH_HHXS_SHIFT	24
+#define APLIC_xMSICFGADDRH_HHXS		(APLIC_xMSICFGADDRH_HHXS_MASK << \
+					 APLIC_xMSICFGADDRH_HHXS_SHIFT)
+#define APLIC_xMSICFGADDRH_LHXS_MASK	0x7
+#define APLIC_xMSICFGADDRH_LHXS_SHIFT	20
+#define APLIC_xMSICFGADDRH_LHXS		(APLIC_xMSICFGADDRH_LHXS_MASK << \
+					 APLIC_xMSICFGADDRH_LHXS_SHIFT)
+#define APLIC_xMSICFGADDRH_HHXW_MASK	0x7
+#define APLIC_xMSICFGADDRH_HHXW_SHIFT	16
+#define APLIC_xMSICFGADDRH_HHXW		(APLIC_xMSICFGADDRH_HHXW_MASK << \
+					 APLIC_xMSICFGADDRH_HHXW_SHIFT)
+#define APLIC_xMSICFGADDRH_LHXW_MASK	0xf
+#define APLIC_xMSICFGADDRH_LHXW_SHIFT	12
+#define APLIC_xMSICFGADDRH_LHXW		(APLIC_xMSICFGADDRH_LHXW_MASK << \
+					 APLIC_xMSICFGADDRH_LHXW_SHIFT)
+#define APLIC_xMSICFGADDRH_BAPPN_MASK	0xfff
+#define APLIC_xMSICFGADDRH_BAPPN_SHIFT	0
+#define APLIC_xMSICFGADDRH_BAPPN	(APLIC_xMSICFGADDRH_BAPPN_MASK << \
+					 APLIC_xMSICFGADDRH_BAPPN_SHIFT)
+
+#define APLIC_xMSICFGADDR_PPN_SHIFT	12
+
+#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
+	(BIT(__lhxs) - 1)
+
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
+	(BIT(__lhxw) - 1)
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
+	((__lhxs))
+#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
+	(APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
+	 APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
+	(BIT(__hhxw) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
+	((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
+#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
+	(APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
+	 APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
+
+#define APLIC_IRQBITS_PER_REG		32
+
+#define APLIC_SETIP_BASE		0x1c00
+#define APLIC_SETIPNUM			0x1cdc
+
+#define APLIC_CLRIP_BASE		0x1d00
+#define APLIC_CLRIPNUM			0x1ddc
+
+#define APLIC_SETIE_BASE		0x1e00
+#define APLIC_SETIENUM			0x1edc
+
+#define APLIC_CLRIE_BASE		0x1f00
+#define APLIC_CLRIENUM			0x1fdc
+
+#define APLIC_SETIPNUM_LE		0x2000
+#define APLIC_SETIPNUM_BE		0x2004
+
+#define APLIC_GENMSI			0x3000
+
+#define APLIC_TARGET_BASE		0x3004
+#define APLIC_TARGET_HART_IDX_SHIFT	18
+#define APLIC_TARGET_HART_IDX_MASK	0x3fff
+#define APLIC_TARGET_HART_IDX		(APLIC_TARGET_HART_IDX_MASK << \
+					 APLIC_TARGET_HART_IDX_SHIFT)
+#define APLIC_TARGET_GUEST_IDX_SHIFT	12
+#define APLIC_TARGET_GUEST_IDX_MASK	0x3f
+#define APLIC_TARGET_GUEST_IDX		(APLIC_TARGET_GUEST_IDX_MASK << \
+					 APLIC_TARGET_GUEST_IDX_SHIFT)
+#define APLIC_TARGET_IPRIO_SHIFT	0
+#define APLIC_TARGET_IPRIO_MASK		0xff
+#define APLIC_TARGET_IPRIO		(APLIC_TARGET_IPRIO_MASK << \
+					 APLIC_TARGET_IPRIO_SHIFT)
+#define APLIC_TARGET_EIID_SHIFT		0
+#define APLIC_TARGET_EIID_MASK		0x7ff
+#define APLIC_TARGET_EIID		(APLIC_TARGET_EIID_MASK << \
+					 APLIC_TARGET_EIID_SHIFT)
+
+#define APLIC_IDC_BASE			0x4000
+#define APLIC_IDC_SIZE			32
+
+#define APLIC_IDC_IDELIVERY		0x00
+
+#define APLIC_IDC_IFORCE		0x04
+
+#define APLIC_IDC_ITHRESHOLD		0x08
+
+#define APLIC_IDC_TOPI			0x18
+#define APLIC_IDC_TOPI_ID_SHIFT		16
+#define APLIC_IDC_TOPI_ID_MASK		0x3ff
+#define APLIC_IDC_TOPI_ID		(APLIC_IDC_TOPI_ID_MASK << \
+					 APLIC_IDC_TOPI_ID_SHIFT)
+#define APLIC_IDC_TOPI_PRIO_SHIFT	0
+#define APLIC_IDC_TOPI_PRIO_MASK	0xff
+#define APLIC_IDC_TOPI_PRIO		(APLIC_IDC_TOPI_PRIO_MASK << \
+					 APLIC_IDC_TOPI_PRIO_SHIFT)
+
+#define APLIC_IDC_CLAIMI		0x1c
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
