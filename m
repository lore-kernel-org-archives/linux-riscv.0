Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BDCCFA751
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vr3hR9eEiQV8NuDfOtM+W3HVf3bJ45VvEkbHcbC3OY=; b=q7fL03ezdOLHSD
	OaxftICdZZTqxhtWGfnUrB0YZ63nIUR+Bgj5jlfDxA6rOATIJ0C81CZITU+P1uxhGcvFrwKHFU9yc
	4N5RJY7S/pj3+aF8OdBA+zVyDes+XnCLuJyApFa46hBWtDisPVvR0EyHc0v/hvOrjvq5AUL83aOYP
	O0irKUY2qqkQqeN3zdhA73UfpbNQFZgbnVhxiC+vHr5abA48vbAyg2u2SlbnSULiNrxS0pbmL9iZV
	zINJfXU5t6JYFujp34zXFIg7kKKubpLg5X4ST+DDX/K9ii/MCCxuBgMLjBGdln0YNq/ZdGGCrCHR9
	ssufY0CJfG7JHT7zutcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdSJ-0000000BMXg-2ML8;
	Fri, 04 Oct 2024 08:14:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdKe-0000000BKf3-2ucv
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 08:06:38 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7db908c9c83so1099990a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728029196; x=1728633996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOeki1FFkiSfFu4/uP0XEVkPckonCqIa/H1tZhw+oW8=;
        b=mtAS/HdN8RSksHgemkGRUWv0pmSh6yIZ/e/HMwxW4e1PfkMfCeg8wn7f6AP5t4kU6V
         ySlZIvcW9/R5l19lC09RM1M9uWib7lWaqikNZZA7MtIAwVJm0O4C/U4pwDPj7qBInTG8
         ytQuqOo+68K+5OlPgi3D8B9mG2rEBdhkwe3fJVodemSLcdQ46mARrlzgR4/vceOYK34h
         oZvfoI/47Wt+xLeGMMavk0lPVMTcKES/byMJHn6BE1+YVz15p1Ug1i9Wy6A60pFoZNQv
         P1gypeLNLMFL4bMYHbq2CD2ttSMiPKIm/zZ7f6Go3uF8fnWhvB53oWnXoCYddA9dN4xz
         YJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029196; x=1728633996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOeki1FFkiSfFu4/uP0XEVkPckonCqIa/H1tZhw+oW8=;
        b=sdjpiqGEjHkix/pHk2uCU9zvzo7RqPXnX2PvVcvf3Fg4RXxGE2+/W5EIaXWsjZbo5G
         Vr6gubKB5v2HfxJUzQbR5ftZsreJ9G/rPbBfcvPUtQfg8v0arhSisTvmKZwcHpMUcE3V
         c6hN6gR1SdfopMG2MV6yr7yvfqn8tKabyKY6VrwyhQfg0Xb3399tKXIszdyRJg+1QfMn
         57KwnW6FXUar3loCevpWHlSG0004o096n9Yey0tV96xymA2Eh0UQPv4oSfXZmz2rF/wl
         rhzKGJnm4GWLTWtJ/snHFylQ2T4YZxyHgRmgs1RXQyVtQrhcD/rzgd9MspAMSJqeKADk
         9kPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWT3bd7epY77ZoGlhNsZgfWvVayqsdG9cmPA2FcdlpQ1exDli9I6K4aN+Hy1iumLi1eLXr3W+zbl74Hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaMvsv0xizpTcJHYUbMWLJ3dHkirzW4TQOj74yiCVuJOXNdrlG
	DQ/lQt/HZ03mJ7HWb0JtY42SeNv98DI0guZiXLiUHCkge60DsI8749wUWw==
X-Google-Smtp-Source: AGHT+IELUKe6yfSED3d2riw0GkuDfFvQjLbY9zF5jW+IyaNrLOoL3ohm/AHnRCoVb/dkQ4mGPps5uw==
X-Received: by 2002:a05:6a20:c997:b0:1d1:1795:4b43 with SMTP id adf61e73a8af0-1d6dfa476cemr3067956637.26.1728029195546;
        Fri, 04 Oct 2024 01:06:35 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71de9473894sm601482b3a.211.2024.10.04.01.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:06:35 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
Date: Fri,  4 Oct 2024 16:05:56 +0800
Message-ID: <20241004080557.2262872-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004080557.2262872-1-inochiama@gmail.com>
References: <20241004080557.2262872-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_010636_853223_FC4CD2F0 
X-CRM114-Status: GOOD (  22.93  )
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

Add a driver for the T-HEAD C900 ACLINT SSWI device, which is an
enhanced implementation of the RISC-V ACLINT SSWI specification.
This device allows the system to send ipi via fast device interface.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/irqchip/Kconfig                      |  10 ++
 drivers/irqchip/Makefile                     |   1 +
 drivers/irqchip/irq-thead-c900-aclint-sswi.c | 169 +++++++++++++++++++
 include/linux/cpuhotplug.h                   |   1 +
 4 files changed, 181 insertions(+)
 create mode 100644 drivers/irqchip/irq-thead-c900-aclint-sswi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 341cd9ca5a05..32671385cbb7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -611,6 +611,16 @@ config STARFIVE_JH8100_INTC

 	  If you don't know what to do here, say Y.

+config THEAD_C900_ACLINT_SSWI
+	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
+	depends on RISCV
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  This enables support for T-HEAD specific ACLINT SSWI device
+	  support.
+
+	  If you don't know what to do here, say Y.
+
 config EXYNOS_IRQ_COMBINER
 	bool "Samsung Exynos IRQ combiner support" if COMPILE_TEST
 	depends on (ARCH_EXYNOS && ARM) || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index e3679ec2b9f7..583418261253 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
+obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
 obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
new file mode 100644
index 000000000000..7bd06369b409
--- /dev/null
+++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
+#include <linux/acpi.h>
+#include <linux/cpu.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/pci.h>
+#include <linux/spinlock.h>
+#include <linux/smp.h>
+
+#define ACLINT_xSWI_REGISTER_SIZE	4
+
+struct aclint_sswi_cpu_config {
+	void __iomem	*reg;
+	u32		offset;
+};
+
+static int sswi_ipi_virq __ro_after_init;
+static DEFINE_PER_CPU(struct aclint_sswi_cpu_config, sswi_cpus);
+
+static void thead_aclint_sswi_ipi_send(unsigned int cpu)
+{
+	struct aclint_sswi_cpu_config *config = per_cpu_ptr(&sswi_cpus, cpu);
+
+	writel_relaxed(0x1, config->reg + config->offset);
+}
+
+static void thead_aclint_sswi_ipi_clear(void)
+{
+	unsigned int cpu = smp_processor_id();
+	struct aclint_sswi_cpu_config *config = per_cpu_ptr(&sswi_cpus, cpu);
+
+	writel_relaxed(0x0, config->reg + config->offset);
+}
+
+static void thead_aclint_sswi_ipi_handle(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(chip, desc);
+
+	csr_clear(CSR_IP, IE_SIE);
+	thead_aclint_sswi_ipi_clear();
+
+	ipi_mux_process();
+
+	chained_irq_exit(chip, desc);
+}
+
+static int aclint_sswi_ipi_starting_cpu(unsigned int cpu)
+{
+	enable_percpu_irq(sswi_ipi_virq, irq_get_trigger_type(sswi_ipi_virq));
+	return 0;
+}
+
+static int aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
+				 void __iomem *reg)
+{
+	struct of_phandle_args parent;
+	unsigned long hartid;
+	u32 contexts, i;
+	int rc, cpu;
+	struct aclint_sswi_cpu_config *config;
+
+	contexts = of_irq_count(to_of_node(fwnode));
+	if (WARN_ON(!(contexts))) {
+		pr_err("%pfwP: no ACLINT SSWI context available\n", fwnode);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < contexts; i++) {
+		rc = of_irq_parse_one(to_of_node(fwnode), i, &parent);
+		if (rc)
+			return rc;
+
+		rc = riscv_of_parent_hartid(parent.np, &hartid);
+		if (rc)
+			return rc;
+
+		if (parent.args[0] != RV_IRQ_SOFT)
+			return -ENOTSUPP;
+
+		cpu = riscv_hartid_to_cpuid(hartid);
+		config = per_cpu_ptr(&sswi_cpus, cpu);
+
+		config->offset = i * ACLINT_xSWI_REGISTER_SIZE;
+		config->reg = reg;
+	}
+
+	pr_info("%pfwP: register %u CPU\n", fwnode, contexts);
+
+	return 0;
+}
+
+static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
+{
+	void __iomem *reg;
+	struct irq_domain *domain;
+	int virq, rc;
+
+	if (!is_of_node(fwnode))
+		return -EINVAL;
+
+	reg = of_iomap(to_of_node(fwnode), 0);
+	if (!reg)
+		return -ENOMEM;
+
+	/* Parse SSWI setting */
+	rc = aclint_sswi_parse_irq(fwnode, reg);
+	if (rc < 0)
+		return rc;
+
+	/* If mulitple SSWI devices are present, do not register irq again */
+	if (sswi_ipi_virq)
+		return 0;
+
+	/* Find and create irq domain */
+	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
+	if (!domain) {
+		pr_err("%pfwP: Failed to find INTC domain\n", fwnode);
+		return -ENOENT;
+	}
+
+	sswi_ipi_virq = irq_create_mapping(domain, RV_IRQ_SOFT);
+	if (!sswi_ipi_virq) {
+		pr_err("unable to create ACLINT SSWI IRQ mapping\n");
+		return -ENOMEM;
+	}
+
+	/* Register SSWI irq and handler */
+	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
+	if (virq <= 0) {
+		pr_err("unable to create muxed IPIs\n");
+		irq_dispose_mapping(sswi_ipi_virq);
+		return virq < 0 ? virq : -ENOMEM;
+	}
+
+	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
+
+	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
+			  "irqchip/thead-aclint-sswi:starting",
+			  aclint_sswi_ipi_starting_cpu, NULL);
+
+	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+
+	/* Announce that SSWI is providing IPIs */
+	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
+
+	return 0;
+}
+
+static int __init aclint_sswi_early_probe(struct device_node *node,
+					  struct device_node *parent)
+{
+	return aclint_sswi_probe(&node->fwnode);
+}
+
+IRQCHIP_DECLARE(thead_aclint_sswi, "thead,c900-aclint-sswi", aclint_sswi_early_probe);
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 2361ed4d2b15..799052249c7b 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -147,6 +147,7 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_EIOINTC_STARTING,
 	CPUHP_AP_IRQ_AVECINTC_STARTING,
 	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
+	CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
 	CPUHP_AP_IRQ_RISCV_IMSIC_STARTING,
 	CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING,
 	CPUHP_AP_ARM_MVEBU_COHERENCY,
--
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
