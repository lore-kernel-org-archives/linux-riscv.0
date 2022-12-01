Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81589C47088
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4ByKc+Ndl9XiZpSvUUuxLxCB0Jp6tjD3xr9phu/ako=; b=dw5X0h0GbyuI5f
	HbUUAuI1SnWbpNybeD5oTRWN8kP9pfbHveXWRY+cqQ6egfGYOY3EsTKzVuiKw6465GZjL6wFpDQR5
	63rSgxfKOWKUov1/juTE7gACzzaj470UZykKy/T8SR0Rf35yYS9OSirD1heD0EAwnkDs4Z+wm94Gg
	nvXfzAJtPqJD2/XBvH/xuhFJjMD4BGqnD4pSYegk2mSmURSiaEdxOWipeaKIimVERVefrvdYIrsU8
	SY9R4CRV/4teE89v4WJj/ADI0jkZdUzPLhTnhV6ym7QlejrEz7XWpUgEUhkhFkUfMMs/sbE23xibi
	2DFb2GDTCppju9ZIe9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jHp-007aFN-N2; Thu, 01 Dec 2022 13:07:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jCT-007Sme-Qz
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:02:03 +0000
Received: by mail-pf1-x434.google.com with SMTP id w2so259036pfq.12
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/HSAfRl6AKxOrRE0JEbET+E+vFKUld6EeEf9bI00fs=;
        b=M7PuHzfiXSfdhv0tm5LFBjVrBaVMI6DaaQ7Pc1uxzJVMLBAyABGYiO5pQqYxxsmJ2n
         XNUAH13NrjW9a+kf3t4YDoPX3/rFi/kXQe7L0okkTG8+czurk83pgzP49XJWCKscppDf
         HovR99A/JULd09rk4CnMEUIJOxaGhDt+hhRSlizgrGZnXfI3V9wQYL6sCBTG0KAEKXh4
         mnUGjsJmtPdmLh6G3OFyP2Z3xvXGFS6spLq4+3laUTbxkcA7KFFj/pSZPNelgA285wYr
         WJg9yp9GPUTVl8jjSJE9Gr+t8KD8IwqEV91z7TIigC997aLDoMSnVY3gafQFmY7o5II5
         GUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/HSAfRl6AKxOrRE0JEbET+E+vFKUld6EeEf9bI00fs=;
        b=GMR7PqRBaPttnNxz2uug2vbwykoL6GroFsNDjQDZ5KUP1tpjJh+Z764aClU48P4Job
         7TZzBlhMlw9SyzNsETVNZEr/9is3HpQjut65D0QVyIrUGXNA5OQt31yRlPjVQCkujUin
         Et+rBBn1CWb6roCFKJ1d1aoBpIGn98UNNj30dOZVinQ/vBWScXYuitloBdS/7p0vgpkJ
         14lRunZSfv0iR3wrphACUw31pELrXpN14MlD+NrcZDAQQETJKzWTabgVzN2OwvWpb9DK
         PmC/MzgHjP1JEIhvD+nRnZUgh6GIMIdUVj/9bfA1eElttvlHa/m1tJ8EUzMcX+CorQvb
         sXhA==
X-Gm-Message-State: ANoB5plJWc9fxM/wgioVC0xjNPFjltBMeE58P1rUE/6ApNbhKOYXE6IR
	MCoZlq+TTggtDMiub67co6mkWA==
X-Google-Smtp-Source: AA0mqf5D3j9ipSlTSkY/Z59EA1lVTCN3KjTMIgNrwJggjGP6V2hfzJ4Y8nrjZYOEfOtw1ApWaJN7og==
X-Received: by 2002:a63:dc04:0:b0:46f:1262:8df7 with SMTP id s4-20020a63dc04000000b0046f12628df7mr51214679pgg.39.1669899719123;
        Thu, 01 Dec 2022 05:01:59 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm4855856pjf.17.2022.12.01.05.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:01:58 -0800 (PST)
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
Subject: [PATCH v14 3/8] genirq: Add mechanism to multiplex a single HW IPI
Date: Thu,  1 Dec 2022 18:31:30 +0530
Message-Id: <20221201130135.1115380-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201130135.1115380-1-apatel@ventanamicro.com>
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_050201_916418_72D8E931 
X-CRM114-Status: GOOD (  26.30  )
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
 include/linux/irq.h  |   3 +
 kernel/irq/Kconfig   |   5 ++
 kernel/irq/Makefile  |   1 +
 kernel/irq/ipi-mux.c | 199 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 208 insertions(+)
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
index 000000000000..1a6ba19b736c
--- /dev/null
+++ b/kernel/irq/ipi-mux.c
@@ -0,0 +1,199 @@
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
+		ipi_mux_send(smp_processor_id());
+}
+
+static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
+{
+	u32 ibit = BIT(irqd_to_hwirq(d));
+	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
+	unsigned long pending;
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
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
