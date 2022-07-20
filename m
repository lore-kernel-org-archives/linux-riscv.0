Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E30C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dA5r/KnqcD3NF/Lv2Vx/CRLd+oNTEROuyy5+1Ra6Lv4=; b=dpkVT3J1IeYO9F
	ny0E6qhcTHW3Q/ZTEuMIYDnUUVG7XOeNxWl6gwcjpxdal3YX5j+8JV6R/8QzwnbAtihuHLZXTRMfL
	UME8XoHBSmbcmTSIAoK6ytrWT8Dpv5XBudYeLY8LMkTrYo/B6llA3qHIyP7ZJWaVbB1mhcr93tJzl
	ycrY1ZRC/T2d5RuR0HqvF4UVpbmCiQdiyYOusQgoUGi5pmCQyFSNy4HkFwFyCTQPD2qjEk3GOOK8u
	9gnQBu2AtjFykOWBTKhptu2BBLtt4PzUXRReG3jzwDjqhSKyUfy/4t3Ulu0bUUxrvdsxSEKbIYw9B
	hKLqqwJw1okzcSYTllZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBZ2-007WT4-Ga; Wed, 20 Jul 2022 15:24:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBYz-007WLy-NV
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 15:24:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id w7so2800510plp.5
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R2dmd0+sOEXN52axONVFBCKgEAJOuF0Fy/MDbCe1fGs=;
        b=FXj0Zj8C2kZAhv29FSF+ZOVPtKtR6Kq2J9ua+i6MRLRv2GZTNMFVAADK5j/0Mvgfmu
         rb6fIyxBsk3P+6eJmXQrpysNIGz7HruPy13ITcWM7cjUtC9lkMqM+ocYFHSbASkXnY3M
         uAugjd6S4RKCCVAKlW+VcXXQnNbf5zhYYt2d8jM8CUIwcW23YgeQrfx4nsfHHsCtl3lk
         dlWBeQT0Gg8MNltaat8CsgILBkqxZSJraEW8UfQUvzLzVn0l6v4kipQ8ftLr5Bk5F2oX
         0NWNE2D1K+BK7axHd5E/DZWLlEWZ9QsXsz6mjVjoLlu3XDZSO68u8poJO3DadTkKtKQM
         JavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R2dmd0+sOEXN52axONVFBCKgEAJOuF0Fy/MDbCe1fGs=;
        b=X1Yzpmi9Tvg0EtYI41U+KeP2WFXERuyGy2CwZ7t+hRCGn/yowUrs9v/GNFZceO2/bt
         rUqPQ9/LsImbRMc1Okch0nzP6VPeY6nQAc3nMPb5i6mNTUxTSF675IEg2DUwEmr0fUda
         CcCc/zQt1zuJvA6uFcdJhB3pkUlvDUuirtelZdqcE0NF6KLBSRjUFM4CHlZTwQPCsST8
         MnsLad/BJrfYDEZA+yDm08PkKIfQ4zZSpHncajhN27rYi7HlV+oB5ru8KldWU/yD28Q2
         5cjL1ajXKMt/xF6u5wtsMhFa7yiW35KN/snPRCIimLs0YgyELQA/UpkQpeSjdBStKwn8
         Ze4Q==
X-Gm-Message-State: AJIora+GZk86CWJdZ2FE6MJbdF56w3VohdYSgQ/LVJVq/XMX4GdQ7tNd
	HIS+c/J+QQ1gLhi4IwIp49fAFw==
X-Google-Smtp-Source: AGRyM1se5j1VZpxILNjwBTqBrVV+vShL7oQAYc0UZ1mEkz0m61EhZNmS6Cmum92GjFYZZtIS41tgnw==
X-Received: by 2002:a17:902:7082:b0:16d:869:1a3e with SMTP id z2-20020a170902708200b0016d08691a3emr9927362plk.32.1658330674665;
        Wed, 20 Jul 2022 08:24:34 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.179.42.230])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b0016cf8f0bdd5sm6013031plk.108.2022.07.20.08.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:24:34 -0700 (PDT)
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
Subject: [PATCH v7 3/7] genirq: Add mechanism to multiplex a single HW IPI
Date: Wed, 20 Jul 2022 20:53:44 +0530
Message-Id: <20220720152348.2889109-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220720152348.2889109-1-apatel@ventanamicro.com>
References: <20220720152348.2889109-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_082437_793730_6994DEAA 
X-CRM114-Status: GOOD (  25.05  )
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
HW IPI. This generic IPI multiplexing is shared among various RISC-V
irqchip drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h  |  16 ++++
 kernel/irq/Kconfig   |   4 +
 kernel/irq/Makefile  |   1 +
 kernel/irq/ipi-mux.c | 199 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 220 insertions(+)
 create mode 100644 kernel/irq/ipi-mux.c

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 505308253d23..a97bf13a8965 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1249,6 +1249,22 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
 int ipi_send_single(unsigned int virq, unsigned int cpu);
 int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
 
+/**
+ * struct ipi_mux_ops - IPI multiplex operations
+ *
+ * @ipi_mux_clear:	Optional function to clear parent IPI
+ * @ipi_mux_send:	Trigger parent IPI on target CPUs
+ */
+struct ipi_mux_ops {
+	void (*ipi_mux_clear)(unsigned int parent_virq);
+	void (*ipi_mux_send)(unsigned int parent_virq,
+			     const struct cpumask *mask);
+};
+
+void ipi_mux_process(void);
+int ipi_mux_create(unsigned int parent_virq, unsigned int nr_ipi,
+		   const struct ipi_mux_ops *ops);
+
 #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
 /*
  * Registers a generic IRQ handling function as the top-level IRQ handler in
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 10929eda9825..2388e7d40ed3 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -84,6 +84,10 @@ config GENERIC_IRQ_IPI
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 
+# Generic IRQ IPI Mux support
+config GENERIC_IRQ_IPI_MUX
+	bool
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
index 000000000000..bd6b31ca588b
--- /dev/null
+++ b/kernel/irq/ipi-mux.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Multiplex several virtual IPIs over a single HW IPI.
+ *
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
+#include <linux/smp.h>
+
+static unsigned int ipi_mux_nr;
+static unsigned int ipi_mux_parent_virq;
+static struct irq_domain *ipi_mux_domain;
+static const struct  ipi_mux_ops *ipi_mux_ops;
+static DEFINE_PER_CPU(unsigned long, ipi_mux_bits);
+
+static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
+{
+	int cpu;
+
+	/* Barrier before doing atomic bit update to IPI bits */
+	smp_mb__before_atomic();
+
+	for_each_cpu(cpu, mask)
+		set_bit(d->hwirq, per_cpu_ptr(&ipi_mux_bits, cpu));
+
+	/* Barrier after doing atomic bit update to IPI bits */
+	smp_mb__after_atomic();
+
+	/* Trigger the parent IPI */
+	ipi_mux_ops->ipi_mux_send(ipi_mux_parent_virq, mask);
+}
+
+static const struct irq_chip ipi_mux_chip = {
+	.name		= "IPI Mux",
+	.ipi_send_mask	= ipi_mux_send_mask,
+};
+
+static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
+				unsigned int nr_irqs, void *arg)
+{
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int i, ret;
+
+	ret = irq_domain_translate_onecell(d, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_set_percpu_devid(virq + i);
+		irq_domain_set_info(d, virq + i, hwirq + i,
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
+	unsigned long irqs, *bits = this_cpu_ptr(&ipi_mux_bits);
+	irq_hw_number_t hwirq;
+	int err;
+
+	/* Clear the parent IPI */
+	if (ipi_mux_ops->ipi_mux_clear)
+		ipi_mux_ops->ipi_mux_clear(ipi_mux_parent_virq);
+
+	/*
+	 * Barrier for IPI bits paired with smp_mb__before_atomic()
+	 * and smp_mb__after_atomic() used in ipi_mux_send_mask().
+	 */
+	smp_mb();
+
+	irqs = xchg(bits, 0);
+	if (!irqs)
+		return;
+
+	for_each_set_bit(hwirq, &irqs, ipi_mux_nr) {
+		err = generic_handle_domain_irq(ipi_mux_domain,
+						hwirq);
+		if (unlikely(err))
+			pr_warn_ratelimited(
+				"can't find mapping for hwirq %lu\n",
+				hwirq);
+	}
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
+static int ipi_mux_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(ipi_mux_parent_virq);
+	return 0;
+}
+
+static int ipi_mux_starting_cpu(unsigned int cpu)
+{
+	enable_percpu_irq(ipi_mux_parent_virq,
+			  irq_get_trigger_type(ipi_mux_parent_virq));
+	return 0;
+}
+
+/**
+ * ipi_mux_create - Create virtual IPIs multiplexed on top of a single
+ * parent IPI.
+ * @parent_virq:	virq of the parent per-CPU IRQ
+ * @nr_ipi:		number of virtual IPIs to create. This should
+ * 			be <= BITS_PER_LONG
+ * @ops:		multiplexing operations for the parent IPI
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
+		   const struct ipi_mux_ops *ops)
+{
+	struct fwnode_handle *fwnode;
+	struct irq_domain *domain;
+	struct irq_fwspec ipi;
+	int virq;
+
+	if (ipi_mux_domain || BITS_PER_LONG < nr_ipi ||
+	    !ops || !ops->ipi_mux_send)
+		return -EINVAL;
+
+	if (parent_virq &&
+	    !irqd_is_per_cpu(irq_desc_get_irq_data(irq_to_desc(parent_virq))))
+		return -EINVAL;
+
+	fwnode = irq_domain_alloc_named_fwnode("IPI-Mux");
+	if (!fwnode) {
+		pr_err("unable to create IPI Mux fwnode\n");
+		return -ENOMEM;
+	}
+
+	domain = irq_domain_create_simple(fwnode, nr_ipi, 0,
+					  &ipi_mux_domain_ops, NULL);
+	if (!domain) {
+		pr_err("unable to add IPI Mux domain\n");
+		irq_domain_free_fwnode(fwnode);
+		return -ENOMEM;
+	}
+
+	ipi.fwnode = domain->fwnode;
+	ipi.param_count = 1;
+	ipi.param[0] = 0;
+	virq = __irq_domain_alloc_irqs(domain, -1, nr_ipi,
+				       NUMA_NO_NODE, &ipi, false, NULL);
+	if (virq <= 0) {
+		pr_err("unable to alloc IRQs from IPI Mux domain\n");
+		irq_domain_remove(domain);
+		irq_domain_free_fwnode(fwnode);
+		return virq;
+	}
+
+	ipi_mux_domain = domain;
+	ipi_mux_nr = nr_ipi;
+	ipi_mux_parent_virq = parent_virq;
+	ipi_mux_ops = ops;
+
+	if (parent_virq > 0) {
+		irq_set_chained_handler(parent_virq, ipi_mux_handler);
+		cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				  "irqchip/ipi-mux:starting",
+				  ipi_mux_starting_cpu, ipi_mux_dying_cpu);
+	}
+
+	return virq;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
