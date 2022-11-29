Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D517C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqZtg9CAFVF0CFnoyd9aH6BTean9T/0HBUoACDoan7E=; b=4uorKfdVSG/ksY
	f+jD8pdm794cx9P5w/kv6Ozb7Ox5MmR5rfj89hAmaQsSRPyD/qg/Lp/T7AONIoAMMn57/ZaJyGlDM
	wcqsDwcw9vdYB7RLKEKA4xmiFJB1Q1NXTAWo4U+15HmGM4tOKZYcYspMUbly92FyT1WL6UYsfiy48
	J6f8o7o6bzheCahxdDtgAm0XoSDiTlqSLq30CCgh1jNYjQ5JOn3RwJm2T+gFfnb3gazYLqmKyb8jx
	iEeCsadfgAVxyet8IPmHi7TdfnY+0y1QJ5lDOZEcCreaiHzpM5wsVpa5UmZQne+oXjTJ1PCzw1oW8
	Ub95JgUDJglJd4Q3eLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01YA-009Dvx-8z; Tue, 29 Nov 2022 14:25:30 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Xs-009DnF-0P
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:25:14 +0000
Received: by mail-pj1-x102b.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so2618969pjp.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrIW2y5CKd+1oUTF027uNozTIj8Vreh5isz2dDkBkRM=;
        b=Fjw60jDZBLrGczONi7wzRHpEr86UANHlQ4vrYoDzTuWL4WVwJ/lz2MeuBhY6lbasha
         pPUVUh+k68hO7zQeO06/R3SVQxsZsBdSzuIQewNmM3mofwX5y2CsfmCzHDV//Dz8hh5S
         xpZWbk2hzwk7yt/CYIlyt9xB7pw0QImrtauNwq/nvc2x7Vz04dmMusUegHnR9GRaUgS7
         xnzUm338rz3gagoGW1nty/tvhMHcMJ1XWKTu5Z4crgs+EqtFQ7OglU5u2qYpax4kfnPM
         iBZ6kDmm6aLY0tpDlJK7M4SHmuNieapHeUUUCEyqPWr6Zm8tlOfD50UBMLi5UegTISfF
         Vljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrIW2y5CKd+1oUTF027uNozTIj8Vreh5isz2dDkBkRM=;
        b=mnFRVciwNmN3MIYAPkC5+u3Ny4XMdeQATZiRRz0FHVN3ndss8Wxmny3Q6ycCrJKPrU
         Z1aeDEFM7Smjp7FF+2yW9jL7RGEEauWhuqq5718pyIEounbSqjw3HoKIg/lXif7hqLM6
         EU7Rm3w+VhO37lL+eEEch5a+AfnX65qxgpVQi6HJ/uArJ08KKb/LBaLUNxp49olhlJXP
         Wk9+kaG45W3emeO31+TL4tW64w0164araTIXMPppGLQ5P1Q9AIG2sbMMTJWs0x5XjdjO
         qy7SjwOkOSdXWYfTVqhQhn9IyHCV1fzNqd4G/dCHO2k2aPNU8dR4kMuhjofj6GYs0M5Y
         4teQ==
X-Gm-Message-State: ANoB5pnBjqOacsZhmlUh835J35fDO7D7OTelSn0geLx4nXJlAD0diDoI
	glk/GZ1XFW10bfvrUloUCoUy/w==
X-Google-Smtp-Source: AA0mqf6SvippjSYD5cLbs0DULHpbN3675tNWicvJB6TklG3UmjiHiyxYuGE17oA1YapqZ9R2yWGDmQ==
X-Received: by 2002:a17:90a:460b:b0:218:8a84:aeca with SMTP id w11-20020a17090a460b00b002188a84aecamr53596216pjg.63.1669731910901;
        Tue, 29 Nov 2022 06:25:10 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b00176a2d23d1asm11039076plh.56.2022.11.29.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:25:10 -0800 (PST)
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
Subject: [PATCH v13 3/7] genirq: Add mechanism to multiplex a single HW IPI
Date: Tue, 29 Nov 2022 19:54:45 +0530
Message-Id: <20221129142449.886518-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129142449.886518-1-apatel@ventanamicro.com>
References: <20221129142449.886518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_062512_109539_6F996215 
X-CRM114-Status: GOOD (  26.07  )
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
 kernel/irq/ipi-mux.c | 193 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 202 insertions(+)
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
index 000000000000..626c564233e9
--- /dev/null
+++ b/kernel/irq/ipi-mux.c
@@ -0,0 +1,193 @@
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
