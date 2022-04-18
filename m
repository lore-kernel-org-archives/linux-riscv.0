Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3D6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaiSP9qTHDedih9EB7iLLFmvi42elO6O0w1oAMfjQkc=; b=ZxHvXE67pCM0DJ
	X7rWI9dhymXt7JyrcfsSFKaDnzBCNXcKmMCLINUd3qvSUn9mv6RamPye7yc24PC/iGLIZf8fZ6SJT
	OgkqkWbS9Rpjo+jrMUs9qJgZNEwyLzagAj2MNLcbqcfte9G006o1L5sxfXJkZG/G6zHdApNuce6fb
	TNKqWBiKpeGV5xUrrTO7cZBs1FiiAfFSedmPdN61Wr5QMawwBLANHZBajPsvY/oyeOgN93B0IX0xk
	K/+gI0PSrrstxcC4R9ukpa2HSbMXxTJBbmYOBAT5nQuPsn8cXLF+2z2eaOIMHf8misAvwSLGWvpa2
	RzoXCLMKDrogFpoGO77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngP19-00GNSk-Iq; Mon, 18 Apr 2022 10:54:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngP16-00GNQm-Du
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 10:54:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id n8so12068654plh.1
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYq3mBdDGawHXMT5SWWslUUS5hK4Hd8Wp59zi1ahbDM=;
 b=iCXsMVhfd51rdcRl3b57Duylzu1GmgkumWHlPeTBZKXHBtRt68RdZeK++cfogcZY6j
 TqAWj0gfWcisq86nDMNWa59Vka4ZhZMIIjEkRGKhuoki0KulqsIQTLcF7goIBMYVbZxI
 kXSACMZjIb3DhDhRdHffqsjgKrHuq5KFNzVnPVsDKEnfox+pTTsx2oCdOlA3QGfjyZIs
 f9ED7+3gwcM3XyQz9lrcG3DyNNU09zjkd7WBOBJy8juTB0U49Py43MU0BAoMw0CcEXnc
 t1zN5AWmjeyyO/a8cLEt3SWLDCx0O2/dz2+bQwLLOrLg0dadpWiAPOULGAizxolQq1Vz
 U3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYq3mBdDGawHXMT5SWWslUUS5hK4Hd8Wp59zi1ahbDM=;
 b=BBLs2qyQcpCq6ZdD+ukN1MXMCSFDuHpTYQzM3E/iKZYX3Vwf3oZSa5haeitYYPydNq
 MlaFIfhmBg4asQcDQ839/2HAkKbadJarm3qtoUEHkZxzL7UbYbuVjb/NFi8hglqVb1ou
 ucOrSms+EyPKaO38FLH92NtczFWfHt7uy+aAlSaZ1fXzLlBcv0JsTBb/z52GWwG8JxtC
 Aba3n8XqASTAN9TBa+T1rvbcYIaQTGKF+2BbX4rIdrQpkg+6YyYgj96prOeyiktyzIIV
 JIc7MBraFQJNwwFdeCj+iSxNnsiAZHaVFa8xv5mXXs6TiiTC2KgqlwZC7bgPp4ZPi098
 Tf0Q==
X-Gm-Message-State: AOAM5327roZ9+WmuTMNKHWFn+4Q2zuaesD3L+z4ATED1VmViN2amK66x
 b5W1Pb6ZsvvAzTxyf/U3rGR9Mw==
X-Google-Smtp-Source: ABdhPJyWiuVi87QXzpcK6qoq7Jhkmm8t2eggIhC2fF87vumJCb0MSKo4/zNY32/9Z654u9S1DB3XOQ==
X-Received: by 2002:a17:902:a60f:b0:155:efbf:1291 with SMTP id
 u15-20020a170902a60f00b00155efbf1291mr10403061plq.152.1650279237488; 
 Mon, 18 Apr 2022 03:53:57 -0700 (PDT)
Received: from localhost.localdomain ([122.172.241.223])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm12986278pfu.202.2022.04.18.03.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:53:56 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 3/7] genirq: Add mechanism to multiplex a single HW IPI
Date: Mon, 18 Apr 2022 16:23:01 +0530
Message-Id: <20220418105305.1196665-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418105305.1196665-1-apatel@ventanamicro.com>
References: <20220418105305.1196665-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_035400_512741_D7EEBCA2 
X-CRM114-Status: GOOD (  25.06  )
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
 include/linux/irq.h  |  11 +++
 kernel/irq/Kconfig   |   4 +
 kernel/irq/Makefile  |   1 +
 kernel/irq/ipi-mux.c | 197 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 kernel/irq/ipi-mux.c

diff --git a/include/linux/irq.h b/include/linux/irq.h
index f92788ccdba2..5bb4e2db63d7 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1247,6 +1247,17 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
 int ipi_send_single(unsigned int virq, unsigned int cpu);
 int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
 
+#define IPI_MUX_NR_IRQS		BITS_PER_LONG
+
+struct ipi_mux_ops {
+	void (*ipi_mux_clear)(unsigned int parent_virq);
+	void (*ipi_mux_send)(unsigned int parent_virq,
+			     const struct cpumask *mask);
+};
+
+void ipi_mux_process(void);
+int ipi_mux_create(unsigned int parent_virq, const struct ipi_mux_ops *ops);
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
index 000000000000..1a1fcfe3ac54
--- /dev/null
+++ b/kernel/irq/ipi-mux.c
@@ -0,0 +1,197 @@
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
+static unsigned int ipi_mux_parent_virq;
+static struct irq_domain *ipi_mux_domain;
+static const struct  ipi_mux_ops *ipi_mux_ops;
+static DEFINE_PER_CPU(unsigned long, ipi_mux_bits);
+
+static void ipi_mux_dummy(struct irq_data *d)
+{
+}
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
+static struct irq_chip ipi_mux_chip = {
+	.name		= "IPI Mux",
+	.irq_mask	= ipi_mux_dummy,
+	.irq_unmask	= ipi_mux_dummy,
+	.ipi_send_mask	= ipi_mux_send_mask,
+};
+
+static int ipi_mux_domain_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	irq_set_percpu_devid(irq);
+	irq_domain_set_info(d, irq, hwirq, &ipi_mux_chip, d->host_data,
+			    handle_percpu_devid_irq, NULL, NULL);
+
+	return 0;
+}
+
+static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
+				unsigned int nr_irqs, void *arg)
+{
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	int i, ret;
+
+	ret = irq_domain_translate_onecell(d, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		ret = ipi_mux_domain_map(d, virq + i, hwirq + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops ipi_mux_domain_ops = {
+	.translate	= irq_domain_translate_onecell,
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
+	 * Barrier for IPI bits paired with smp_mb__xyz_atomic()
+	 * in ipi_mux_send_mask()
+	 */
+	smp_mb();
+
+	irqs = xchg(bits, 0);
+	if (!irqs)
+		return;
+
+	for_each_set_bit(hwirq, &irqs, IPI_MUX_NR_IRQS) {
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
+ * ipi_mux_create - Create virtual IPIs (total IPI_MUX_NR_IRQS) multiplexed
+ * on top of a single parent IPI.
+ * @parent_virq:	virq of the parent IPI
+ * @ops:		multiplexing operations for the parent IPI
+ *
+ * If the parent IPI > 0 then ipi_mux_process() will be automatically
+ * called via chained handler.
+ *
+ * If the parent IPI <= 0 then it is responsiblity of irqchip drivers
+ * to explicitly call ipi_mux_process() for processing muxed IPIs.
+ *
+ * Returns first virq of the newly created virutal IPIs upon success
+ * or <=0 upon failure
+ */
+int ipi_mux_create(unsigned int parent_virq, const struct ipi_mux_ops *ops)
+{
+	struct irq_domain *domain;
+	struct irq_fwspec ipi;
+	int virq;
+
+	if (ipi_mux_domain || !ops || !ops->ipi_mux_send)
+		return 0;
+
+	domain = irq_domain_add_linear(NULL, IPI_MUX_NR_IRQS,
+				       &ipi_mux_domain_ops, NULL);
+	if (!domain) {
+		pr_err("unable to add IPI Mux domain\n");
+		return 0;
+	}
+
+	ipi.fwnode = domain->fwnode;
+	ipi.param_count = 1;
+	ipi.param[0] = 0;
+	virq = __irq_domain_alloc_irqs(domain, -1, IPI_MUX_NR_IRQS,
+				       NUMA_NO_NODE, &ipi, false, NULL);
+	if (virq <= 0) {
+		pr_err("unable to alloc IRQs from IPI Mux domain\n");
+		irq_domain_remove(domain);
+		return virq;
+	}
+
+	ipi_mux_domain = domain;
+	ipi_mux_parent_virq = parent_virq;
+	ipi_mux_ops = ops;
+
+	if (parent_virq > 0) {
+		irq_set_chained_handler(parent_virq, ipi_mux_handler);
+
+		cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				  "irqchip/ipi-mux:starting",
+				  ipi_mux_starting_cpu, ipi_mux_dying_cpu);
+	}
+
+	return virq;
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
