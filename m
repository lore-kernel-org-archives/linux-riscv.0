Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2140C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zl1d74RZHugDe/SPbuofHyOSVYT4NQSA9H2i2cxe+54=; b=PBvM/S1jQrlgum
	qwlEEMPVbSaJUQbS54fY7XeQv2l7r/Zjai8cIYmJrTlAFrm5dGHqLW1vURpI1QyUncGNsqfjXENn+
	LixDoUf+rj5ZHBnKFoBhpERmmbbMy5qSBl4q62I+gB58zsWKy9suKB1QeIkmR1rkqf9Pl0/SCiBuo
	6f3y3c4ur+ieI12gwvGX4K191V/sXzoRBtMKeZFql587iindYOSPQiNpgiMCYtXbBwrqAdXJ23jrT
	JoBXGb0VyeXhkEGkAlCndzXNBpBSdnIpcBhjWMEqCWbAa9/db74fi2y6gQjYrC6+lQHJ4H3BzX2ul
	RFZLtxLh1thhKEbvSGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVwV-00HEgl-Gx; Mon, 14 Nov 2022 09:39:51 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVwS-00HEef-Gs
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:39:50 +0000
Received: by mail-oi1-x231.google.com with SMTP id n205so10861908oib.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyR5SzCa2XgzFku7z7smGvot1vjVKCAAMkMCMMFre8k=;
        b=PusBjvOEpWHKd4s8oYTlNcEM+nRxt/ImIJfjge5KkCm+phNlxlM9HYew4kauLT/fqL
         qW9k6iEs0dpocQQmUq7694ilC/yMUAAp4K9gJqHEKUdUvidksp+xfTlQqAoV7n/fZvsh
         uleiUwCStwu1lm0TJvXNSyOvBKeVoMP60/Ua/YEzxnVZdOK12/jqNyk/EEon+sFKBlR8
         zpcZvqCv0sU0IstXFYZ2hJew7lv9inw1nZM/fXvjQ/uP1bBQuNXAG1Uvk/523Uxm/zbB
         ATdwcutK7svu+0S2kz9DEojurx2WJQ2qvsV/BVNv9H9KtNTC0xETu5wAJ2sdjNiix+it
         V9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyR5SzCa2XgzFku7z7smGvot1vjVKCAAMkMCMMFre8k=;
        b=Dkkjho1Qi9HaDmybU0BhtyzxQDxRJ3nyu24mz4ZPSp5k9A0yNBY7JNFsxg0Fx6HFbz
         XAJ3gW8dNq1VP5/lLK8EYQC5XK6ObEnljxqW+OCA+N04dOb/vEvam7J6FFsjMAuHGPf6
         l9alh5iN6ypihE4yOUwqVHvpaWfJf1i906XQNmt1BXWZbal88EmVVk0T5UCoJvnN6CWm
         AgRgpI8qppK/snOI46rg7kg1AlUf8+bfOCixncyvrep1hiBVTSy9x5Qsj/W7nyzylfty
         19b4mgHRzxQH3OYAwrNDr0trw1SQnj0IZ4jsj7uiF3jC4dFMdt4jFkHzYwTAwHUa78u/
         UPLw==
X-Gm-Message-State: ANoB5pmPKLz4s0g3bOxSCyUC0Sm2/MRkdlchwW77f5kML+X75oFKC9Ir
	xTmVwIZ0Gpre1JuLsXzDHgEOsQ==
X-Google-Smtp-Source: AA0mqf6MHlZqvTiJDRrecWw2K0o5nZFwTsSvlpZJLSBvzXuAG8UooV4YmpPYjKr/BkeIWmm4Rrtdjg==
X-Received: by 2002:aca:2305:0:b0:35a:7760:43f3 with SMTP id e5-20020aca2305000000b0035a776043f3mr5358936oie.19.1668418787823;
        Mon, 14 Nov 2022 01:39:47 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id l12-20020a4ae38c000000b0049f3bdd791esm3222677oov.26.2022.11.14.01.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:39:47 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v11 3/7] genirq: Add mechanism to multiplex a single HW IPI
Date: Mon, 14 Nov 2022 15:09:00 +0530
Message-Id: <20221114093904.1669461-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114093904.1669461-1-apatel@ventanamicro.com>
References: <20221114093904.1669461-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_013948_615323_B9DA6B67 
X-CRM114-Status: GOOD (  28.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

All RISC-V platforms have a single HW IPI provided by the INTC local
interrupt controller. The HW method to trigger INTC IPI can be through
external irqchip (e.g. RISC-V AIA), through platform specific device
(e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).

To support multiple IPIs on RISC-V, we add a generic IPI multiplexing
mechanism which help us create multiple virtual IPIs using a single
HW IPI. This generic IPI multiplexing is inspired from the Apple AIC
irqchip driver and it is shared by various RISC-V irqchip drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h  |  18 +++
 kernel/irq/Kconfig   |   5 +
 kernel/irq/Makefile  |   1 +
 kernel/irq/ipi-mux.c | 268 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 292 insertions(+)
 create mode 100644 kernel/irq/ipi-mux.c

diff --git a/include/linux/irq.h b/include/linux/irq.h
index c3eb89606c2b..5ab702cb0a5b 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1266,6 +1266,24 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
 int ipi_send_single(unsigned int virq, unsigned int cpu);
 int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
 
+/**
+ * struct ipi_mux_ops - IPI multiplex operations
+ *
+ * @ipi_mux_pre_handle:	Optional function called before handling parent IPI
+ * @ipi_mux_post_handle:Optional function called after handling parent IPI
+ * @ipi_mux_send:	Trigger parent IPI on target CPUs
+ */
+struct ipi_mux_ops {
+	void (*ipi_mux_pre_handle)(unsigned int parent_virq, void *data);
+	void (*ipi_mux_post_handle)(unsigned int parent_virq, void *data);
+	void (*ipi_mux_send)(unsigned int parent_virq, void *data,
+			     const struct cpumask *mask);
+};
+
+void ipi_mux_process(void);
+int ipi_mux_create(unsigned int parent_virq, unsigned int nr_ipi,
+		   const struct ipi_mux_ops *ops, void *data);
+
 #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
 /*
  * Registers a generic IRQ handling function as the top-level IRQ handler in
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index db3d174c53d4..df17dbc54b02 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -86,6 +86,11 @@ config GENERIC_IRQ_IPI
 	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 
+# Generic IRQ IPI Mux support
+config GENERIC_IRQ_IPI_MUX
+	bool
+	depends on SMP
+
 # Generic MSI interrupt support
 config GENERIC_MSI_IRQ
 	bool
diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index b4f53717d143..f19d3080bf11 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_GENERIC_IRQ_MIGRATION) += cpuhotplug.o
 obj-$(CONFIG_PM_SLEEP) += pm.o
 obj-$(CONFIG_GENERIC_MSI_IRQ) += msi.o
 obj-$(CONFIG_GENERIC_IRQ_IPI) += ipi.o
+obj-$(CONFIG_GENERIC_IRQ_IPI_MUX) += ipi-mux.o
 obj-$(CONFIG_SMP) += affinity.o
 obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
 obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
diff --git a/kernel/irq/ipi-mux.c b/kernel/irq/ipi-mux.c
new file mode 100644
index 000000000000..259e00366dd7
--- /dev/null
+++ b/kernel/irq/ipi-mux.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Multiplex several virtual IPIs over a single HW IPI.
+ *
+ * Copyright The Asahi Linux Contributors
+ * Copyright (c) 2022 Ventana Micro Systems Inc.
+ */
+
+#define pr_fmt(fmt) "ipi-mux: " fmt
+#include <linux/cpu.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/jump_label.h>
+#include <linux/percpu.h>
+#include <linux/smp.h>
+
+struct ipi_mux_cpu {
+	atomic_t			enable;
+	atomic_t			bits;
+	struct cpumask			send_mask;
+};
+
+struct ipi_mux_control {
+	void				*data;
+	unsigned int			nr;
+	unsigned int			parent_virq;
+	struct irq_domain		*domain;
+	const struct ipi_mux_ops	*ops;
+	struct ipi_mux_cpu __percpu	*cpu;
+};
+
+static struct ipi_mux_control *imux;
+static DEFINE_STATIC_KEY_FALSE(imux_pre_handle);
+static DEFINE_STATIC_KEY_FALSE(imux_post_handle);
+
+static void ipi_mux_mask(struct irq_data *d)
+{
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(imux->cpu);
+
+	atomic_andnot(BIT(irqd_to_hwirq(d)), &icpu->enable);
+}
+
+static void ipi_mux_unmask(struct irq_data *d)
+{
+	u32 ibit = BIT(irqd_to_hwirq(d));
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(imux->cpu);
+
+	atomic_or(ibit, &icpu->enable);
+
+	/*
+	 * The atomic_or() above must complete before the atomic_read()
+	 * below to avoid racing ipi_mux_send_mask().
+	 */
+	smp_mb__after_atomic();
+
+	/* If a pending IPI was unmasked, raise a parent IPI immediately. */
+	if (atomic_read(&icpu->bits) & ibit)
+		imux->ops->ipi_mux_send(imux->parent_virq, imux->data,
+					cpumask_of(smp_processor_id()));
+}
+
+static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
+{
+	u32 ibit = BIT(irqd_to_hwirq(d));
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(imux->cpu);
+	struct cpumask *send_mask = &icpu->send_mask;
+	unsigned long flags;
+	int cpu;
+
+	/*
+	 * We use send_mask as a per-CPU variable so disable local
+	 * interrupts to avoid being preempted.
+	 */
+	local_irq_save(flags);
+
+	cpumask_clear(send_mask);
+
+	for_each_cpu(cpu, mask) {
+		icpu = per_cpu_ptr(imux->cpu, cpu);
+		atomic_or(ibit, &icpu->bits);
+
+		/*
+		 * The atomic_or() above must complete before
+		 * the atomic_read() below to avoid racing with
+		 * ipi_mux_unmask().
+		 */
+		smp_mb__after_atomic();
+
+		if (atomic_read(&icpu->enable) & ibit)
+			cpumask_set_cpu(cpu, send_mask);
+	}
+
+	/* Trigger the parent IPI */
+	imux->ops->ipi_mux_send(imux->parent_virq, imux->data, send_mask);
+
+	local_irq_restore(flags);
+}
+
+static const struct irq_chip ipi_mux_chip = {
+	.name		= "IPI Mux",
+	.irq_mask	= ipi_mux_mask,
+	.irq_unmask	= ipi_mux_unmask,
+	.ipi_send_mask	= ipi_mux_send_mask,
+};
+
+static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
+				unsigned int nr_irqs, void *arg)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_set_percpu_devid(virq + i);
+		irq_domain_set_info(d, virq + i, i,
+				    &ipi_mux_chip, d->host_data,
+				    handle_percpu_devid_irq, NULL, NULL);
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops ipi_mux_domain_ops = {
+	.alloc		= ipi_mux_domain_alloc,
+	.free		= irq_domain_free_irqs_top,
+};
+
+/**
+ * ipi_mux_process - Process multiplexed virtual IPIs
+ */
+void ipi_mux_process(void)
+{
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(imux->cpu);
+	irq_hw_number_t hwirq;
+	unsigned long ipis;
+	int en;
+
+	if (static_branch_unlikely(&imux_pre_handle))
+		imux->ops->ipi_mux_pre_handle(imux->parent_virq, imux->data);
+
+	/*
+	 * Reading enable mask does not need to be ordered as long as
+	 * this function called from interrupt handler because only
+	 * the CPU itself can change it's own enable mask.
+	 */
+	en = atomic_read(&icpu->enable);
+
+	/*
+	 * Clear the IPIs we are about to handle. This pairs with the
+	 * atomic_fetch_or_release() in ipi_mux_send_mask().
+	 */
+	ipis = atomic_fetch_andnot(en, &icpu->bits) & en;
+
+	for_each_set_bit(hwirq, &ipis, imux->nr)
+		generic_handle_domain_irq(imux->domain, hwirq);
+
+	if (static_branch_unlikely(&imux_post_handle))
+		imux->ops->ipi_mux_post_handle(imux->parent_virq, imux->data);
+}
+
+static void ipi_mux_handler(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(chip, desc);
+	ipi_mux_process();
+	chained_irq_exit(chip, desc);
+}
+
+/**
+ * ipi_mux_create - Create virtual IPIs multiplexed on top of a single
+ * parent IPI.
+ * @parent_virq:	virq of the parent per-CPU IRQ
+ * @nr_ipi:		number of virtual IPIs to create. This should
+ *			be <= BITS_PER_TYPE(int)
+ * @ops:		multiplexing operations for the parent IPI
+ * @data:		opaque data used by the multiplexing operations
+ *
+ * If the parent IPI > 0 then ipi_mux_process() will be automatically
+ * called via chained handler.
+ *
+ * If the parent IPI <= 0 then it is responsibility of irqchip drivers
+ * to explicitly call ipi_mux_process() for processing muxed IPIs.
+ *
+ * Returns first virq of the newly created virtual IPIs upon success
+ * or <=0 upon failure
+ */
+int ipi_mux_create(unsigned int parent_virq, unsigned int nr_ipi,
+		   const struct ipi_mux_ops *ops, void *data)
+{
+	struct fwnode_handle *fwnode;
+	struct irq_domain *domain;
+	int rc;
+
+	if (imux)
+		return -EEXIST;
+
+	if (BITS_PER_TYPE(int) < nr_ipi || !ops || !ops->ipi_mux_send)
+		return -EINVAL;
+
+	if (parent_virq &&
+	    !irqd_is_per_cpu(irq_desc_get_irq_data(irq_to_desc(parent_virq))))
+		return -EINVAL;
+
+	imux = kzalloc(sizeof(*imux), GFP_KERNEL);
+	if (!imux)
+		return -ENOMEM;
+
+	imux->cpu = alloc_percpu(typeof(*imux->cpu));
+	if (!imux->cpu) {
+		rc = -ENOMEM;
+		goto fail_free_mux;
+	}
+
+	fwnode = irq_domain_alloc_named_fwnode("IPI-Mux");
+	if (!fwnode) {
+		pr_err("unable to create IPI Mux fwnode\n");
+		rc = -ENOMEM;
+		goto fail_free_cpu;
+	}
+
+	domain = irq_domain_create_simple(fwnode, nr_ipi, 0,
+					  &ipi_mux_domain_ops, NULL);
+	if (!domain) {
+		pr_err("unable to add IPI Mux domain\n");
+		rc = -ENOMEM;
+		goto fail_free_fwnode;
+	}
+
+	domain->flags |= IRQ_DOMAIN_FLAG_IPI_SINGLE;
+	irq_domain_update_bus_token(domain, DOMAIN_BUS_IPI);
+
+	rc = __irq_domain_alloc_irqs(domain, -1, nr_ipi,
+				     NUMA_NO_NODE, NULL, false, NULL);
+	if (rc <= 0) {
+		pr_err("unable to alloc IRQs from IPI Mux domain\n");
+		goto fail_free_domain;
+	}
+
+	imux->domain = domain;
+	imux->data = data;
+	imux->nr = nr_ipi;
+	imux->parent_virq = parent_virq;
+	imux->ops = ops;
+
+	if (imux->ops->ipi_mux_pre_handle)
+		static_branch_enable(&imux_pre_handle);
+
+	if (imux->ops->ipi_mux_post_handle)
+		static_branch_enable(&imux_post_handle);
+
+	if (parent_virq > 0)
+		irq_set_chained_handler(parent_virq, ipi_mux_handler);
+
+	return rc;
+
+fail_free_domain:
+	irq_domain_remove(domain);
+fail_free_fwnode:
+	irq_domain_free_fwnode(fwnode);
+fail_free_cpu:
+	free_percpu(imux->cpu);
+fail_free_mux:
+	kfree(imux);
+	imux = NULL;
+	return rc;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
