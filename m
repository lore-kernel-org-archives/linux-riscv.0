Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB20EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEZ391lXjDpSUQoH2NztLJyF322GfNWiqSP8wxDhsYE=; b=wEnFyOZQY48JN3
	8+NM477m0arlcT3wZ8TOE2kPxx8XyIHCxojJoyBdXN7+SC3N0EzqwcSRHA5Ev8a9QtlEN2/J0bTV1
	RsByPxTsoM7C6lb+u8t+PdXnCkW5sJn674l+Zpyj5t0s8twpHc7khBwz7/Tkac1UyiGIVDDrm7j8u
	sgxisIOTFT9l4AhaVYVmcf/wzrr049pa3wiJqw14aTgmupnZ035sCMwLs92qz+H8tyhOglvqVd3Sn
	QfSskkt2tIwQ+bnIVhqkAKftcX52od1p/p0e1Kg5SgAj9mxQrC2mqIu2qnwvVPCkIeMPzH6cUMZ6G
	+MNloHrZq85HNG3/rUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdI-00AVMu-0P;
	Thu, 03 Aug 2023 18:01:08 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdD-00AVIn-3D
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:01:07 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686f8614ce5so1118687b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085663; x=1691690463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vqi3iZnSO0pCz4r86HvzjXAIoq/LUkNm+cOCoheLdcU=;
        b=RGBk6rx5Hg20bOXt+KLaRA26VcrOyNOoG/eZ7AxmlMnjFLn1DtSewmy8B6izdUW0E9
         GsvBNf8e3jLCLs9h3DTaOaEA4Km0R9H4SNrQ9+L743IjhhgsHfGIylndzoIQZ265aQGL
         n3u5HhJfofcxpdy320nz2rQ2QoD01GiNeIZKOW51Fa3p9Z3xFqseEFfup54Xbr4HF94E
         1EWqxSsfqSg9VtpcDRRRk5I1Neux3XeF5LvtGw6Xi2P1PAQzmkcPwAZHb9qGJ5o3kBoC
         gZ6YooLlmoRGD/mmS9270tnx8asDRFY2Qh6PHJuGg7a6wwcl70gJWrfxbZ1zW3Bv9Blq
         Sc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085663; x=1691690463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vqi3iZnSO0pCz4r86HvzjXAIoq/LUkNm+cOCoheLdcU=;
        b=bQOMYJHhBs42tSO/E8sjmsK1IJUaO0E9df+ECl7l85oG4xXkLG3M/3eUtyA99W9I9X
         +sL4eKDaXc/YLkbsCuK9w79i4epGGqBEAHJd+1Qtd8ljve9bdspm33M/73S9qlR48T0F
         1pFoXhGM2xy0YB5EAA/YzP+m5chyMjWbWFXffCBLpj4qcTuOiA/CqGjhpvMP8GbxnsEY
         Z6qPitHygSvWWVna0CghxQC6wxll0n9LPLfO5UiQ90MivQSjIFnNQw5rRxt08EIIcgGj
         KKETCkKGNMdQHJUxigoovc90mRieMe3XQn26JFjyM4bImgSwx4h8SQCWNlVTieZ5Bl2K
         WiHQ==
X-Gm-Message-State: ABy/qLY1PxyKGNM+kWsPOG3S1nC1G1sM8e0VSVGwMOVqnXPwouWN+rW+
	aN9rwUdDopbj8sUfAG5cf4JK8Q==
X-Google-Smtp-Source: APBJJlFqOcYVb1YmYRN4MTpyz32muTvUlVIwXMvqlj269qOtTWbHmeKplda1rvUua7TwvFx4MZypxQ==
X-Received: by 2002:a05:6a00:2351:b0:687:5c3f:d834 with SMTP id j17-20020a056a00235100b006875c3fd834mr8861510pfj.11.1691085663545;
        Thu, 03 Aug 2023 11:01:03 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:01:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 12/21] irqchip/riscv-intc: Use swnode framework to create fwnode
Date: Thu,  3 Aug 2023 23:29:07 +0530
Message-Id: <20230803175916.3174453-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110104_834842_100B23AC 
X-CRM114-Status: GOOD (  22.99  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

By using swnode framework, all data from ACPI tables can
be populated as properties of the swnode. This simplifies
the driver code and removes the need for ACPI vs DT checks.
Use this framework for RISC-V INTC driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 Documentation/riscv/acpi.rst     | 21 +++++++++++++++
 arch/riscv/include/asm/acpi.h    |  1 +
 drivers/acpi/riscv/Makefile      |  2 +-
 drivers/acpi/riscv/irqchip.c     | 46 ++++++++++++++++++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c | 12 ++++-----
 5 files changed, 75 insertions(+), 7 deletions(-)
 create mode 100644 drivers/acpi/riscv/irqchip.c

diff --git a/Documentation/riscv/acpi.rst b/Documentation/riscv/acpi.rst
index 9870a282815b..e2406546bc16 100644
--- a/Documentation/riscv/acpi.rst
+++ b/Documentation/riscv/acpi.rst
@@ -8,3 +8,24 @@ The ISA string parsing rules for ACPI are defined by `Version ASCIIDOC
 Conversion, 12/2022 of the RISC-V specifications, as defined by tag
 "riscv-isa-release-1239329-2023-05-23" (commit 1239329
 ) <https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-1239329-2023-05-23>`_
+
+Interrupt Controller Drivers
+=======
+
+ACPI drivers for RISC-V interrupt controllers use software node framework to
+create the fwnode for the interrupt controllers. Below properties are
+additionally required for some firmware nodes apart from the properties
+defined by the device tree bindings for these interrupt controllers. The
+properties are created using the data in MADT table.
+
+1) RISC-V Interrupt Controller (INTC)
+-----------
+``hartid`` - Hart ID of the hart this interrupt controller belongs to.
+
+``riscv,imsic-addr`` - Physical base address of the Incoming MSI Controller
+(IMSIC) MMIO region of this hart.
+
+``riscv,imsic-size`` - Size in bytes of the IMSIC MMIO region of this hart.
+
+``riscv,ext-intc-id`` - The unique ID of the external interrupts connected
+to this hart.
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 0c4e8b35103e..0ac2df2dd194 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -68,6 +68,7 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
 int acpi_get_cbo_block_size(struct acpi_table_header *table, unsigned int cpu, u32 *cbom_size,
 			    u32 *cboz_size, u32 *cbop_size);
+struct fwnode_handle *acpi_rintc_create_irqchip_fwnode(struct acpi_madt_rintc *rintc);
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 8b3b126e0b94..8b664190d172 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y 	+= rhct.o
+obj-y 	+= rhct.o irqchip.o
diff --git a/drivers/acpi/riscv/irqchip.c b/drivers/acpi/riscv/irqchip.c
new file mode 100644
index 000000000000..36f066a2cad5
--- /dev/null
+++ b/drivers/acpi/riscv/irqchip.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#include <linux/acpi.h>
+#include <linux/fwnode.h>
+#include <linux/irqdomain.h>
+#include <linux/list.h>
+#include <linux/property.h>
+
+struct riscv_irqchip_list {
+	struct fwnode_handle *fwnode;
+	struct list_head list;
+};
+
+LIST_HEAD(rintc_list);
+
+struct fwnode_handle *acpi_rintc_create_irqchip_fwnode(struct acpi_madt_rintc *rintc)
+{
+	struct property_entry props[6] = {};
+	struct fwnode_handle *fwnode;
+	struct riscv_irqchip_list *rintc_element;
+
+	props[0] = PROPERTY_ENTRY_U64("hartid", rintc->hart_id);
+	props[1] = PROPERTY_ENTRY_U32("riscv,ext-intc-id", rintc->ext_intc_id);
+	props[2] = PROPERTY_ENTRY_U64("riscv,imsic-addr", rintc->imsic_addr);
+	props[3] = PROPERTY_ENTRY_U32("riscv,imsic-size", rintc->imsic_size);
+	props[4] = PROPERTY_ENTRY_U32("#interrupt-cells", 1);
+
+	fwnode = fwnode_create_software_node_early(props, NULL);
+	if (fwnode) {
+		rintc_element = kzalloc(sizeof(*rintc_element), GFP_KERNEL);
+		if (!rintc_element) {
+			fwnode_remove_software_node(fwnode);
+			return NULL;
+		}
+
+		rintc_element->fwnode = fwnode;
+		list_add_tail(&rintc_element->list, &rintc_list);
+	}
+
+	return fwnode;
+}
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 1a0fc87152c5..1ef9cada1ed3 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -203,6 +203,12 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 
 	rintc = (struct acpi_madt_rintc *)header;
 
+	fn = acpi_rintc_create_irqchip_fwnode(rintc);
+	if (!fn) {
+		pr_err("unable to create INTC FW node\n");
+		return -ENOMEM;
+	}
+
 	/*
 	 * The ACPI MADT will have one INTC for each CPU (or HART)
 	 * so riscv_intc_acpi_init() function will be called once
@@ -212,12 +218,6 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
 		return 0;
 
-	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
-	if (!fn) {
-		pr_err("unable to allocate INTC FW node\n");
-		return -ENOMEM;
-	}
-
 	return riscv_intc_init_common(fn);
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
