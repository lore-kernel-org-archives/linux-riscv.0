Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71B9C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqcP3ksJRXPWBomz5HT5S09F1K3pV0J2gTUzAq8kYSA=; b=RoHedIlrCYfi4G
	Ba6UYu0oMwgbS29XO0iaLa2+BOsdybhewEWp0HSZ8aUn8R4J4u53pLmdk+RDZh7XiB3T/8dzHgXXD
	ei4EWStEGMJOqPQNIPOf5peLN2wlSvebsPIl+Y7Ww98akC0n5bhLKuaGR4GG6RYoyUcw52Bdfd531
	6Nud7PLukHG3WOaVhS8Ld+Q2oTfL6B5WIvSNFQ6FxrTpTMMMwjvFdIArRPy/ShbiXaoteXKhqZLxc
	1LsntgPYGywsk2nj9uJvGcASyrSgc5XYFL7DU8qmn6uKgFetbHpPmtWku9mC/ZtT+SW+2xa2EYFKF
	dyGXb33ize+GHjWAHz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkhL-003D7L-3K; Tue, 03 Jan 2023 17:03:35 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi27-001ql9-C9
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:12:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 60-20020a17090a0fc200b002264ebad204so9591320pjz.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeIojzaABUKnNOf6/IOzgNVZ1YxXJw15pDsAxwDwZ7k=;
        b=jWjUf0YdK2SMD8Hh2MCAwUrCm2W91Xxt3BfSJbQiiG0+KxAPqJAL6/IR8XlkKfbu2f
         lj3ETdyHU9TGn4KNnratw7EC+UiiqAJA2/mTAGHD/D46nkvSyQpJcL0IUCZYb2AbwqYH
         SeDNg3XXMMXKi23uVKNzQys4jGETFgmDZOFcAr14JrCger9B33h1F3olA6epPMn9V+bQ
         XpgYmUYiQ/V5RtcA65upxEB0J7ehM+sY08CnaxJvwppItpNrjN90US7osagz3XFFhq83
         zJesW5bPfxSPXikF9w9ylOEfI+mk8v4NZa7NNjEZ47EpLMbj7G585FuHhlPRfqJSxI0s
         +6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeIojzaABUKnNOf6/IOzgNVZ1YxXJw15pDsAxwDwZ7k=;
        b=Zn5IRWSlQcHyJIQZAlmbuQzYNgsRfolOeU3vqBG1cqqXemReScZV7IDOdCLBU3m59D
         vSY4uiaO2yK0vgfuvRlEmEuNcZtM4FV1XJmUepA7NMCETZoDF2iNIPfLeWVzccQCaEJW
         C5FrYfrGauX21i2lPLZeEes51A4bu4EBd3fgoRU6y/eJ4wZwZvjSGkgS9ofFIh6IFzxm
         zWWQk3b9lcpzjsKrAB6wQSmHoe3BDZj1cLQDp2ajg24hwZqZblMZ9fCa4eUaNb67068/
         EGt4lBj/CZhg+RjAHOW2ylVZs1ZkNFmPus37P7YulNhN13eEFIJDTXj0ALEfJZMsGHKi
         gnsQ==
X-Gm-Message-State: AFqh2koHcvjQG6Ht+h28UWDYU+GyKJafWsKRjXiyEiGrqWMFCbhtVOH4
	RWXV13WZlUH/gXLOsapnsPgiQw==
X-Google-Smtp-Source: AMrXdXsbQVf67b73TY05kz+WINqDSvAUcG7y9AHvgmKqoJEbL6J2YbDn5N4Zb1KZgK8LsrKyiZz3Ig==
X-Received: by 2002:a17:903:3287:b0:192:e0ab:a4a2 with SMTP id jh7-20020a170903328700b00192e0aba4a2mr1227619plb.51.1672755169260;
        Tue, 03 Jan 2023 06:12:49 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:12:48 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v16 3/9] genirq: Add mechanism to multiplex a single HW IPI
Date: Tue,  3 Jan 2023 19:42:15 +0530
Message-Id: <20230103141221.772261-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141221.772261-1-apatel@ventanamicro.com>
References: <20230103141221.772261-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061251_792406_513BE1AA 
X-CRM114-Status: GOOD (  27.51  )
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

To support multiple IPIs on RISC-V, add a generic IPI multiplexing
mechanism which help us create multiple virtual IPIs using a single
HW IPI. This generic IPI multiplexing is inspired by the Apple AIC
irqchip driver and it is shared by various RISC-V irqchip drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Hector Martin <marcan@marcan.st>
Tested-by: Hector Martin <marcan@marcan.st>
---
 include/linux/irq.h  |   3 +
 kernel/irq/Kconfig   |   5 ++
 kernel/irq/Makefile  |   1 +
 kernel/irq/ipi-mux.c | 207 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 kernel/irq/ipi-mux.c

diff --git a/include/linux/irq.h b/include/linux/irq.h
index c3eb89606c2b..b1b28affb32a 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1266,6 +1266,9 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
 int ipi_send_single(unsigned int virq, unsigned int cpu);
 int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
 
+void ipi_mux_process(void);
+int ipi_mux_create(unsigned int nr_ipi, void (*mux_send)(unsigned int cpu));
+
 #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
 /*
  * Registers a generic IRQ handling function as the top-level IRQ handler in
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index b64c44ae4c25..2531f3496ab6 100644
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
 # Generic MSI hierarchical interrupt domain support
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
index 000000000000..3a403c3a785d
--- /dev/null
+++ b/kernel/irq/ipi-mux.c
@@ -0,0 +1,207 @@
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
+};
+
+static struct ipi_mux_cpu __percpu *ipi_mux_pcpu;
+static struct irq_domain *ipi_mux_domain;
+static void (*ipi_mux_send)(unsigned int cpu);
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
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
+	u32 ibit = BIT(irqd_to_hwirq(d));
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
+		ipi_mux_send(smp_processor_id());
+}
+
+static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
+{
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
+	u32 ibit = BIT(irqd_to_hwirq(d));
+	unsigned long pending;
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
+
+		/*
+		 * This sequence is the mirror of the one in ipi_mux_unmask();
+		 * see the comment there. Additionally, release semantics
+		 * ensure that the vIPI flag set is ordered after any shared
+		 * memory accesses that precede it. This therefore also pairs
+		 * with the atomic_fetch_andnot in ipi_mux_process().
+		 */
+		pending = atomic_fetch_or_release(ibit, &icpu->bits);
+
+		/*
+		 * The atomic_fetch_or_release() above must complete
+		 * before the atomic_read() below to avoid racing with
+		 * ipi_mux_unmask().
+		 */
+		smp_mb__after_atomic();
+
+		/*
+		 * The flag writes must complete before the physical IPI is
+		 * issued to another CPU. This is implied by the control
+		 * dependency on the result of atomic_read() below, which is
+		 * itself already ordered after the vIPI flag write.
+		 */
+		if (!(pending & ibit) && (atomic_read(&icpu->enable) & ibit))
+			ipi_mux_send(cpu);
+	}
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
+		irq_domain_set_info(d, virq + i, i, &ipi_mux_chip, NULL,
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
+	 * this function is called from interrupt handler because only
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
+	for_each_set_bit(hwirq, &ipis, BITS_PER_TYPE(int))
+		generic_handle_domain_irq(ipi_mux_domain, hwirq);
+}
+
+/**
+ * ipi_mux_create - Create virtual IPIs multiplexed on top of a single
+ * parent IPI.
+ * @nr_ipi:		number of virtual IPIs to create. This should
+ *			be <= BITS_PER_TYPE(int)
+ * @mux_send:		callback to trigger parent IPI for a particular CPU
+ *
+ * Returns first virq of the newly created virtual IPIs upon success
+ * or <=0 upon failure
+ */
+int ipi_mux_create(unsigned int nr_ipi, void (*mux_send)(unsigned int cpu))
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
+	domain = irq_domain_create_linear(fwnode, nr_ipi,
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
