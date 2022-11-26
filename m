Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9D7C4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6Wqw+uX/LDJSzCuIHBa+VdgCAM4ZfwT86mmTLQj+qA=; b=sAI26OOw1cYQN+
	ldpVnRynacy0iVI9tROfm3ywqLsKP7cFUrhqN5j3vlmB2uvYBNsJ6ZlgBRMkoMX39RLHlMwoSydZP
	78+fmcyl+/2VY1jCes1MPKxl8oaXV5fE5HWi4sdPPLmR5cLZqyKdwzHYj1AuQ8vNWWrW7I4JIfOYM
	zCFh66QXHQzOv23SmzGTbIARX2IcP8hKS8b0RD4yUFq8t7QlNcdwqC5WdhrJ0msEem1lIY8DG3t+h
	LnWu7yMJyS3Tp4oyvRISP/Gu7lA7FDRbJ5d+5ojMwDzWmc4JMU56ezMQIH8Eu24t/7cpwZZpvl8W3
	8ZVgXd2hUDur+oqXd6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz5H-007UZV-4w; Sat, 26 Nov 2022 17:35:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz5D-007UXJ-TM
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 17:35:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so9625426pjt.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 09:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ql6/OJIMI5ujjwb6XHp/s+7heoyHNOYHEick/DYdoY=;
        b=S4AVapnPrQ5WR6LREUmCBXDxK+e9s9nImUyuWk51tak6Mn6TE2VGRC/ZSBeLRfjOtf
         SARKnd8jwgsSze7HMpPkfpLrcMR0f+sVJb+BwSCZ+HbyyQQA8T/G5gcwy97NpE8Ez3Dn
         ZhFlnctRbS54SUhxejz4YaeVgVULkk13KORfmZSgZ1+mxNtvFzVlmZAA24j+y/HqegYw
         gFW+Bwl9JWwB7Vkm/Y2p91tKft3jE1I+7VqwCOrjJKk+Cls0ljXvamBB5SV6mNzgHSrs
         eSKJ3y+wLY0R65++apk5K5xKPApCssQlMDpprmSGLeBsv+2dY4/DA2XjXgsscj7S6CCv
         lJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ql6/OJIMI5ujjwb6XHp/s+7heoyHNOYHEick/DYdoY=;
        b=6QWWulX6Ut/BD8oOLGxmuDSmgTIy00Sg4BGrTHXUbSP9HW7/esCsiIxVeXh41dgNry
         EA7WJV2EV9eNonBsp3hQ1dhSwsoXaN9F0oCDSvU+niBE/F7G/HKz1oPWi4CwEE5ssFe7
         HHifnlAiX5wROWOK9iahtPX2LKl5t1FlZ6NswJAKZqf8GMLs6uqB3bA68Psz+OSZ74qT
         5xVXpKDNEKKY9P2jLBWkp/vEJe3kvQn5eCGpb0Wwr3WQUUrtXovICZJCfwAFI+V8CpcJ
         UC6qyiLMp2pQjxRe5bk6l2NxS2cYWF9bR0CPNi6QM1D1GoqxW2YUB8NEbA4KDE2J2yuJ
         Sgxg==
X-Gm-Message-State: ANoB5pnC6n22NVzrjpzwtAAr681vuu6PumuOvPvnpL2aFOuu711EE+qT
	6CuUPB/+9GUDglCY4NE3Dks9hQ==
X-Google-Smtp-Source: AA0mqf5nGgQK/+t2PQUoMPgkmEZONvte6YGssGl/At3lHigbd4Bxigdhlvr0NEUR1V3+9NZN356mdA==
X-Received: by 2002:a17:90b:91:b0:219:2033:64e8 with SMTP id bb17-20020a17090b009100b00219203364e8mr2643784pjb.147.1669484118364;
        Sat, 26 Nov 2022 09:35:18 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0017f7c4e260fsm5639813pls.150.2022.11.26.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 09:35:18 -0800 (PST)
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
Subject: [PATCH v12 3/7] genirq: Add mechanism to multiplex a single HW IPI
Date: Sat, 26 Nov 2022 23:04:49 +0530
Message-Id: <20221126173453.306088-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126173453.306088-1-apatel@ventanamicro.com>
References: <20221126173453.306088-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_093519_980366_D018D77B 
X-CRM114-Status: GOOD (  26.04  )
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
 include/linux/irq.h  |   4 +
 kernel/irq/Kconfig   |   5 ++
 kernel/irq/Makefile  |   1 +
 kernel/irq/ipi-mux.c | 210 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 220 insertions(+)
 create mode 100644 kernel/irq/ipi-mux.c

diff --git a/include/linux/irq.h b/include/linux/irq.h
index c3eb89606c2b..6024e1ee1257 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1266,6 +1266,10 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
 int ipi_send_single(unsigned int virq, unsigned int cpu);
 int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
 
+void ipi_mux_process(void);
+int ipi_mux_create(unsigned int nr_ipi,
+		   void (*mux_send)(const struct cpumask *));
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
index 000000000000..366d8cd5320b
--- /dev/null
+++ b/kernel/irq/ipi-mux.c
@@ -0,0 +1,210 @@
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
+static struct ipi_mux_cpu __percpu *ipi_mux_pcpu;
+static struct irq_domain *ipi_mux_domain;
+static void (*ipi_mux_send)(const struct cpumask *mask);
+
+static void ipi_mux_mask(struct irq_data *d)
+{
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
+
+	atomic_andnot(BIT(irqd_to_hwirq(d)), &icpu->enable);
+}
+
+static void ipi_mux_unmask(struct irq_data *d)
+{
+	u32 ibit = BIT(irqd_to_hwirq(d));
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
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
+		ipi_mux_send(cpumask_of(smp_processor_id()));
+}
+
+static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
+{
+	u32 ibit = BIT(irqd_to_hwirq(d));
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
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
+		icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
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
+	ipi_mux_send(send_mask);
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
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
+	irq_hw_number_t hwirq;
+	unsigned long ipis;
+	unsigned int en;
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
+	for_each_set_bit(hwirq, &ipis, BITS_PER_LONG)
+		generic_handle_domain_irq(ipi_mux_domain, hwirq);
+}
+
+/**
+ * ipi_mux_create - Create virtual IPIs multiplexed on top of a single
+ * parent IPI.
+ * @nr_ipi:		number of virtual IPIs to create. This should
+ *			be <= BITS_PER_TYPE(int)
+ * @mux_send:		callback to trigger parent IPI
+ *
+ * Returns first virq of the newly created virtual IPIs upon success
+ * or <=0 upon failure
+ */
+int ipi_mux_create(unsigned int nr_ipi,
+		   void (*mux_send)(const struct cpumask *))
+{
+	struct fwnode_handle *fwnode;
+	struct irq_domain *domain;
+	int rc;
+
+	if (ipi_mux_domain)
+		return -EEXIST;
+
+	if (BITS_PER_TYPE(int) < nr_ipi || !mux_send)
+		return -EINVAL;
+
+	ipi_mux_pcpu = alloc_percpu(typeof(*ipi_mux_pcpu));
+	if (!ipi_mux_pcpu)
+		return -ENOMEM;
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
+	ipi_mux_domain = domain;
+	ipi_mux_send = mux_send;
+
+	return rc;
+
+fail_free_domain:
+	irq_domain_remove(domain);
+fail_free_fwnode:
+	irq_domain_free_fwnode(fwnode);
+fail_free_cpu:
+	free_percpu(ipi_mux_pcpu);
+	return rc;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
