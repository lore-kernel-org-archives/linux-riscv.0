Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CDACED628
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 22:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+j9gAWYyP2epMFItX9vkPp1VL27TI18qi7f6CDJ4GI=; b=ppMbxVtYA92T3G
	zRjLRLbLFlxL6rEszAAtmF/7mxpjjCTsxTg7cHxZ4EUZW5iC1XutlAGXtR1SZnlyx+7aJQsLi8E/D
	Iiy0tw+3/eWsSDtN6GDI3jqrugVsDPkX+aa74AfMH0N6AAdX4s3GwPSUjuV116LQ37ToH1lUfBkZv
	xLX4mD5haaTr580e19ZR2aVkNbtCjoaUWU8v1EhmYqI2wIwvIxl7d7Dot2pVUhK56/spLLmBYTXx6
	JvBrMd/QN5w55ZPFNYnYXI5YfSqDHRTGAcSj8WwENW5jGkWc37ll/CuikhYlX6eFylwJDfsjWG+jt
	tOLc7XRqUNDCeGWHDlIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syfSA-0000000AxvQ-1WLi;
	Wed, 09 Oct 2024 22:46:46 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syfQ8-0000000AxJ4-42Gq
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 22:44:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e038f3835so328131b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 15:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728513880; x=1729118680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQiYNef7ArPYQlhe07XyLMGs/XiAOe7Z31NtUB9uYxQ=;
        b=OOhPsNoCYeKzyjVdC4we2pTzggMHQslH0f+DwgF49rt8aTFASVIbmp2eLn8YJuMTHK
         qw8VK1aAOrxXDX4+Vux2/IiXrm0GgSDQ3h85f/Y2esVy9au3uMmKCQdhyARGfdnec0d6
         kjWL3ckGXGIo8jSDFhZ/iiqXo49hVFJoGVkvbRjfZSTkQoA6aWrzFCNWSzQDPoIkxiOR
         VnA6iRSApH17cP5nSLY/WEoQDE9lKlWwqy427FzrVhMuGzxFkjVq3msAapBN/SBxWrcs
         DSuuceGQsJz2hx9gyVkp+Z0wUK42E4p7Y5xp7faeUCk+AIEWXLlfc0VheZLF6HGzj8za
         Vxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728513880; x=1729118680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQiYNef7ArPYQlhe07XyLMGs/XiAOe7Z31NtUB9uYxQ=;
        b=V0sc7mxXXJM1w/54xL/Wehz27aY1+zjprPKYPAEAfT9tiKYvQMZZK/YiaVqAEpcjiv
         j9dj+lUvH3q41G23D3bjYY8dq/mwc/mVKnRlV6+z8gTz8Nv7spV1PBlWnxf9LmZiM4/d
         T+fXPemvsKMK1FO4Bdx6s4P1RJFapOb1L1gfNhwvbIRl12541q72d3TLGA32LpGkTyAe
         cxTvi67arPgDnXGqxAw1yk2joah1MajmEWuth+WQrBOeJSQuIwmIIhhG1rTB/b5vkpr/
         XFAV8GsxIgq9fodLQXWwx/lXbooop/WIoNGXbItf4GuMQ5QE55CbN5NK1QRt681/q/JQ
         zk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQudxyxluL4Pr/b0UKDAJxXnmoVk8ij0bYveEA8dk/18Pnhk6CMxDP1LsBJepDWNS1/4ZNsvZ4yzBGuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPEitHQsiZCz+RQX7Bi5BfmqvdVEA0KccRLObMldywZ2N1Z8gn
	OMzqFWQQrxQAlbPWmTn+y48iJijckNvP1ZX/lILjioROOsGOE7b5
X-Google-Smtp-Source: AGHT+IFxTbeLG1Jh9xQz1Jop82g/peuBRGEbOM2+MGKlD7JAInvly69FNZ6RedmRdxOnx1QAzgGC5A==
X-Received: by 2002:a05:6a21:1706:b0:1d8:ae07:c02 with SMTP id adf61e73a8af0-1d8ae070e7cmr1797936637.47.1728513879652;
        Wed, 09 Oct 2024 15:44:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f680a681sm8792461a12.14.2024.10.09.15.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 15:44:39 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
Date: Thu, 10 Oct 2024 06:44:08 +0800
Message-ID: <20241009224410.53188-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241009224410.53188-1-inochiama@gmail.com>
References: <20241009224410.53188-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_154441_036255_9612B495 
X-CRM114-Status: GOOD (  22.88  )
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
 drivers/irqchip/irq-thead-c900-aclint-sswi.c | 166 +++++++++++++++++++
 include/linux/cpuhotplug.h                   |   1 +
 4 files changed, 178 insertions(+)
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
index 000000000000..b96d3b81dc14
--- /dev/null
+++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
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
+#include <linux/string_choices.h>
+
+#define ACLINT_xSWI_REGISTER_SIZE	4
+
+static int sswi_ipi_virq __ro_after_init;
+static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
+
+static void thead_aclint_sswi_ipi_send(unsigned int cpu)
+{
+	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
+}
+
+static void thead_aclint_sswi_ipi_clear(void)
+{
+	writel_relaxed(0x0, this_cpu_read(sswi_cpu_regs));
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
+static int thead_aclint_sswi_starting_cpu(unsigned int cpu)
+{
+	enable_percpu_irq(sswi_ipi_virq, irq_get_trigger_type(sswi_ipi_virq));
+
+	return 0;
+}
+
+static int thead_aclint_sswi_dying_cpu(unsigned int cpu)
+{
+	thead_aclint_sswi_ipi_clear();
+
+	disable_percpu_irq(sswi_ipi_virq);
+
+	return 0;
+}
+
+static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
+					void __iomem *reg)
+{
+	struct of_phandle_args parent;
+	unsigned long hartid;
+	u32 contexts, i;
+	int rc, cpu;
+
+	contexts = of_irq_count(to_of_node(fwnode));
+	if (!(contexts)) {
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
+
+		per_cpu(sswi_cpu_regs, cpu) = reg + i * ACLINT_xSWI_REGISTER_SIZE;
+	}
+
+	pr_info("%pfwP: register %u CPU%s\n", fwnode, contexts, str_plural(contexts));
+
+	return 0;
+}
+
+static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
+{
+	struct irq_domain *domain;
+	void __iomem *reg;
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
+	/* Find riscv intc domain and create IPI irq mapping */
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
+			  thead_aclint_sswi_starting_cpu,
+			  thead_aclint_sswi_dying_cpu);
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
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
