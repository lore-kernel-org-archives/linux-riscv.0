Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7DEC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukC915TEGa7NfSFZvbtugBGEbiLZlcTTRmx/jEJrNS0=; b=dXOyRyQJHlTe/K
	Uen+aPa6v2MoTkYN9/PbUGG+lBiTpUtV4sjlDhRnsbvC5GTg1BuvR9p7w7YWNNV1Rl/5bNGy79QnO
	ROvvLrAQVCY8uivkRu+AD/xCBD+nTo0JqPAkFmvDtEe5lba4hluKhgx1wnLf065yEa+S6uwgb2czu
	tRLSp8BTNCo4kjeO55eUeb9AhkHrXMMW5hzWYTJQV4NMO6UgYHuZktUL2G6zdpD+vNrzdNrvVJwhd
	cI1FnsiU/ZdCQ7GBq0Ua0EEEkhk6D2S+n81DQbcLFtZIrJaOsVAW3dDRf/PsHIlRuYIY3nd8cRAi8
	XmtULRgfHyGXYy9U0g3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpZ-0000000EHcQ-2BXd;
	Thu, 12 Jun 2025 19:43:21 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj5O-0000000DeCj-47R8
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 14:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739162; x=1781275162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IUsgoytCa960UqK9Tup9+lUYJiEi9bGrelfn5xp32LM=;
  b=TPpa8N8qoOqW7qutjt9s4DKHYD8ynzfTZ4K6CSsFEWA8pG4CbhwtBA5a
   GjaBi6KzY76U2dpn/pBPc+dOVg6m8HifRT4CmxRi4CKH79IKU89lwk5sG
   +hGlIXiLILjn7lFGyZ79WdLNa+KKAEJ4tUwqfLJV6LxDarDCLdpI5magP
   8G91xTHXIHZK8hwkg7htSyZACpgBkQOdEBvgM+hZhx61IjK3hbOi6MCL8
   +3FKkYb4r+9L/FXx3+V4Xp6cgsO9GOnFgKIf7Kz5olyDp2ah8Rum3hw10
   y8xadM5j0KtvtvYj8a2S0DNTRcmMLuBdYaEU7bHhkb17MWwUTj9fxj1BP
   A==;
X-CSE-ConnectionGUID: GREZQF6ASuWemXNIgpQ0yQ==
X-CSE-MsgGUID: 8lVX4RnWQFOadAZY59akFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:19 +0300
X-CSE-ConnectionGUID: x3X4diFySeybW0papmj+KA==
X-CSE-MsgGUID: xFE6pKGLTw+8Dm3smtkXvg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces01_data.me-corp.lan with SMTP; 12 Jun 2025 17:39:18 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:18 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v3 4/7] irqchip: MIPS P800 variant of aclint-sswi
Date: Thu, 12 Jun 2025 17:39:08 +0300
Message-ID: <20250612143911.3224046-5-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073923_294496_33559968 
X-CRM114-Status: GOOD (  21.34  )
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

Refactor Thead specific implementation of the ACLINT-SSWI irqchip.
Factor out generic code that serves both Thead and MIPS variants.
This generic part is according to the RISC-V draft spec [1].

Link: https://github.com/riscvarchive/riscv-aclint [1]

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/Kconfig                       | 15 ++-
 drivers/irqchip/Makefile                      |  2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 91 +++++++++++++------
 include/linux/cpuhotplug.h                    |  2 +-
 4 files changed, 75 insertions(+), 35 deletions(-)
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (68%)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0d196e447142..39f6f421fc75 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -634,18 +634,25 @@ config STARFIVE_JH8100_INTC
 
 	  If you don't know what to do here, say Y.
 
-config THEAD_C900_ACLINT_SSWI
-	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
+config ACLINT_SSWI
+	bool "RISC-V ACLINT S-mode IPI Interrupt Controller"
 	depends on RISCV
 	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_IPI_MUX
 	help
-	  This enables support for T-HEAD specific ACLINT SSWI device
-	  support.
+	  This enables support for variants of the RISC-V ACLINT-SSWI device.
+	  Supported variants are:
+	  - T-HEAD, with compatible "thead,c900-aclint-sswi"
+	  - MIPS P8700, with compatible "mips,p8700-aclint-sswi"
 
 	  If you don't know what to do here, say Y.
 
+# Backwards compatibility so oldconfig does not drop it.
+config THEAD_C900_ACLINT_SSWI
+	bool
+	select ACLINT_SSWI
+
 config EXYNOS_IRQ_COMBINER
 	bool "Samsung Exynos IRQ combiner support" if COMPILE_TEST
 	depends on (ARCH_EXYNOS && ARM) || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 23ca4959e6ce..0458d6c5d161 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -105,7 +105,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
-obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
+obj-$(CONFIG_ACLINT_SSWI)		+= irq-aclint-sswi.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
 obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
similarity index 68%
rename from drivers/irqchip/irq-thead-c900-aclint-sswi.c
rename to drivers/irqchip/irq-aclint-sswi.c
index 8ff6e7a1363b..5e133cf29737 100644
--- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -3,7 +3,8 @@
  * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
  */
 
-#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -21,56 +22,51 @@
 #include <asm/sbi.h>
 #include <asm/vendorid_list.h>
 
-#define THEAD_ACLINT_xSWI_REGISTER_SIZE		4
-
-#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
-#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
-
 static int sswi_ipi_virq __ro_after_init;
 static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
 
-static void thead_aclint_sswi_ipi_send(unsigned int cpu)
+static void aclint_sswi_ipi_send(unsigned int cpu)
 {
 	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
 }
 
-static void thead_aclint_sswi_ipi_clear(void)
+static void aclint_sswi_ipi_clear(void)
 {
 	writel_relaxed(0x0, this_cpu_read(sswi_cpu_regs));
 }
 
-static void thead_aclint_sswi_ipi_handle(struct irq_desc *desc)
+static void aclint_sswi_ipi_handle(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
 	csr_clear(CSR_IP, IE_SIE);
-	thead_aclint_sswi_ipi_clear();
+	aclint_sswi_ipi_clear();
 
 	ipi_mux_process();
 
 	chained_irq_exit(chip, desc);
 }
 
-static int thead_aclint_sswi_starting_cpu(unsigned int cpu)
+static int aclint_sswi_starting_cpu(unsigned int cpu)
 {
 	enable_percpu_irq(sswi_ipi_virq, irq_get_trigger_type(sswi_ipi_virq));
 
 	return 0;
 }
 
-static int thead_aclint_sswi_dying_cpu(unsigned int cpu)
+static int aclint_sswi_dying_cpu(unsigned int cpu)
 {
-	thead_aclint_sswi_ipi_clear();
+	aclint_sswi_ipi_clear();
 
 	disable_percpu_irq(sswi_ipi_virq);
 
 	return 0;
 }
 
-static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
-					      void __iomem *reg)
+static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
+					void __iomem *reg)
 {
 	struct of_phandle_args parent;
 	unsigned long hartid;
@@ -97,7 +93,7 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 
-		per_cpu(sswi_cpu_regs, cpu) = reg + i * THEAD_ACLINT_xSWI_REGISTER_SIZE;
+		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
 	}
 
 	pr_info("%pfwP: register %u CPU%s\n", fwnode, contexts, str_plural(contexts));
@@ -105,17 +101,12 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 	return 0;
 }
 
-static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
+static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 {
 	struct irq_domain *domain;
 	void __iomem *reg;
 	int virq, rc;
 
-	/* If it is T-HEAD CPU, check whether SSWI is enabled */
-	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
-	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
-		return -ENOTSUPP;
-
 	if (!is_of_node(fwnode))
 		return -EINVAL;
 
@@ -124,7 +115,7 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
 		return -ENOMEM;
 
 	/* Parse SSWI setting */
-	rc = thead_aclint_sswi_parse_irq(fwnode, reg);
+	rc = aclint_sswi_parse_irq(fwnode, reg);
 	if (rc < 0)
 		return rc;
 
@@ -146,22 +137,64 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
 	}
 
 	/* Register SSWI irq and handler */
-	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
+	virq = ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sswi_ipi_virq);
 		return virq < 0 ? virq : -ENOMEM;
 	}
 
-	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
+	irq_set_chained_handler(sswi_ipi_virq, aclint_sswi_ipi_handle);
 
-	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
-			  "irqchip/thead-aclint-sswi:starting",
-			  thead_aclint_sswi_starting_cpu,
-			  thead_aclint_sswi_dying_cpu);
+	cpuhp_setup_state(CPUHP_AP_IRQ_ACLINT_SSWI_STARTING,
+			  "irqchip/aclint-sswi:starting",
+			  aclint_sswi_starting_cpu,
+			  aclint_sswi_dying_cpu);
 
 	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
 
+	return 0;
+}
+
+/* generic/MIPS variant */
+static int __init generic_aclint_sswi_probe(struct fwnode_handle *fwnode)
+{
+	int rc;
+
+	rc = aclint_sswi_probe(fwnode);
+	if (rc)
+		return rc;
+
+	/* Announce that SSWI is providing IPIs */
+	pr_info("providing IPIs using ACLINT SSWI\n");
+
+	return 0;
+}
+
+static int __init generic_aclint_sswi_early_probe(struct device_node *node,
+						  struct device_node *parent)
+{
+	return generic_aclint_sswi_probe(&node->fwnode);
+}
+IRQCHIP_DECLARE(generic_aclint_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
+
+/* THEAD variant */
+#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
+#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
+
+static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
+{
+	int rc;
+
+	/* If it is T-HEAD CPU, check whether SSWI is enabled */
+	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
+	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
+		return -ENOTSUPP;
+
+	rc = aclint_sswi_probe(fwnode);
+	if (rc)
+		return rc;
+
 	/* Announce that SSWI is providing IPIs */
 	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index df366ee15456..d381420bbd5f 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -145,7 +145,7 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_EIOINTC_STARTING,
 	CPUHP_AP_IRQ_AVECINTC_STARTING,
 	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
-	CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
+	CPUHP_AP_IRQ_ACLINT_SSWI_STARTING,
 	CPUHP_AP_IRQ_RISCV_IMSIC_STARTING,
 	CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING,
 	CPUHP_AP_ARM_MVEBU_COHERENCY,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
