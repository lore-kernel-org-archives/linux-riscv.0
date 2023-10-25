Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95882C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SVtQQXW5ol6oQI7k3k/law7qCDPkjNKZb1L/fY2FhU=; b=pc6ay4b+i+nb67
	Xb+YJ/W3uU+hEbGYtmCzTi1V7wuQVsATush1Ad9XVANmY42SwSJnjV9bVpFAOtlwhIb0Q0uNUU2Oi
	KMraeZj9Qa36rmzIOzGJv5yiX5v+0NHJq/1CIZY7lnvthjODrXh7uuQ2FAlvz0q6OyIXoYfKW1w3u
	mF5/HfUYXXTYO4mZC2uVxBtaJGh+j8Z5lhJPTPGapo/7VVZxF3Mt4CqC2avr3A7+t0MHoYMErWRa1
	4l3vXwQ+pw7smLyBCnUhjphBfFmULIzMgCTdnKry6gDjyeQCYLuupyHaiyays5OG+GM12ZWF5ikqa
	OdHyMa8nxa59VMDK9aUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkS8-00D3rt-1a;
	Wed, 25 Oct 2023 20:26:08 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRZ-00D3KT-1k
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:36 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-578b407045bso183772a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265530; x=1698870330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59OuHyNaU3fGic7bU/ykRVEj1ISi+51hzxPyHqKgiHU=;
        b=kx2cAFC6SmcyjAc3EelibfI7Ltk0VotNbrE7FRDaVIpddyJHFsVaca+/8fKx2jeSZc
         gnKB7UWXGZ4kKc9tzfbPCf/8uGKaDBk2wMHuIXsiv299beZmDx65oc3sMFeLjIYM1zYz
         8+ragCt3GQ1Kc5teVqqbo837M5ZTXETNDxQ8ycwmDrZKw1JK4YKE5quSnpAovXtefdZg
         6b93e9cs5dH5QNQ/vi0UCjx+j97B0UjIBlYZOJ8vWad8DvxRf1pF2iuS+od/Gj84ZkbL
         8xynRrSdBpuX/dvzw2SueaaZ8wfRuIaaWvp/5BCA5/xBiPQTadKxAKSnwwc9ZGsUzEHs
         sjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265530; x=1698870330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59OuHyNaU3fGic7bU/ykRVEj1ISi+51hzxPyHqKgiHU=;
        b=VtVxZ1XKF8ZWU8gyqPiVqKeJDlDEVPTuR5m4RxnGE+jqYratSbprnVWoM0SV2G8bLV
         2BjE3XcheK3MpiOcAneSSnktbfZgoa3loWNb3ECysenKuahM5ijtKsj2f6qVK0A5mHL8
         4oRtTty5OMjErbQCyNYE09Rc5ZBjOovt4NZ4ReY72l86YjdUcXfCdmgvFlgt96QEgHdB
         4gePtyWLnf7aEB7TuRDIe0q71QZqliAykxJA0Qv/MsMzdTW2bOq3IIbjIPmcozCyb558
         CoNVFKo5r5F4fpOWa5Wp+Lkbds9p55/zHM4X+jRfsinw7lT8qToO9rIsk2uvYZYlpYND
         G8Lg==
X-Gm-Message-State: AOJu0YzXzCCjW9JLnYop9gRF2bj/1RRnc6Uj8FEf9Do8TTXZ9mIc1Uiv
	Zsd+CDQzDNWhrePo4K3UmxUqtg==
X-Google-Smtp-Source: AGHT+IHWtyasGWBG2ncOVxTr7Ff9cRNuMnmYDG5JFQmxxsN156cqaz/hByE4OSnzTGpWfiTZSkxNMg==
X-Received: by 2002:a05:6a21:3b44:b0:169:7d6f:9f22 with SMTP id zy4-20020a056a213b4400b001697d6f9f22mr6291614pzb.54.1698265530438;
        Wed, 25 Oct 2023 13:25:30 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:29 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 14/21] irqchip: riscv-imsic: Add ACPI support
Date: Thu, 26 Oct 2023 01:53:37 +0530
Message-Id: <20231025202344.581132-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132533_605248_AC1D431D 
X-CRM114-Status: GOOD (  25.85  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V IMSIC interrupt controller provides IPI and MSI support.
Currently, DT based drivers setup the IPI feature early during boot but
defer setting up the MSI functionality. However, in ACPI systems, PCI
scan happens early during boot and PCI subsystem expects MSI controller
is already setup. Hence, in case of ACPI, both IPI and MSI features are
initialized early itself.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  52 ++++++++-
 drivers/irqchip/irq-riscv-imsic-platform.c |  51 +++++---
 drivers/irqchip/irq-riscv-imsic-state.c    | 128 ++++++++++-----------
 drivers/irqchip/irq-riscv-imsic-state.h    |   2 +-
 include/linux/irqchip/riscv-imsic.h        |  10 ++
 5 files changed, 160 insertions(+), 83 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 23f689ff5807..8ce864a7e4dd 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -5,16 +5,20 @@
  */
 
 #define pr_fmt(fmt) "riscv-imsic: " fmt
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "../pci/pci.h"
 #include "irq-riscv-imsic-state.h"
 
 static int imsic_parent_irq;
@@ -216,7 +220,7 @@ static int __init imsic_early_dt_init(struct device_node *node,
 	struct fwnode_handle *fwnode = &node->fwnode;
 
 	/* Setup IMSIC state */
-	rc = imsic_setup_state(fwnode);
+	rc = imsic_setup_state(fwnode, NULL);
 	if (rc) {
 		pr_err("%pfwP: failed to setup state (error %d)\n",
 			fwnode, rc);
@@ -233,3 +237,49 @@ static int __init imsic_early_dt_init(struct device_node *node,
 	return 0;
 }
 IRQCHIP_DECLARE(riscv_imsic, "riscv,imsics", imsic_early_dt_init);
+
+#ifdef CONFIG_ACPI
+
+static struct fwnode_handle *imsic_acpi_fwnode;
+
+struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
+{
+	return imsic_acpi_fwnode;
+}
+
+static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
+					const unsigned long end)
+{
+	struct acpi_madt_imsic *imsic = (struct acpi_madt_imsic *)header;
+	int rc;
+
+	imsic_acpi_fwnode = irq_domain_alloc_named_fwnode("imsic");
+	if (!imsic_acpi_fwnode) {
+		pr_err("unable to allocate IMSIC FW node\n");
+		return -ENOMEM;
+	}
+
+	/* Setup IMSIC state */
+	rc = imsic_setup_state(imsic_acpi_fwnode, (void *)imsic);
+	if (rc) {
+		pr_err("%pfwP: failed to setup state (error %d)\n", imsic_acpi_fwnode, rc);
+		return rc;
+	}
+
+	/* Do early setup of IMSIC state and IPIs */
+	rc = imsic_early_probe(imsic_acpi_fwnode);
+	if (rc)
+		return rc;
+
+	rc = imsic_platform_acpi_probe(imsic_acpi_fwnode);
+	if (!rc) {
+		pci_msi_register_fwnode_provider(&imsic_acpi_get_fwnode);
+		pci_set_msi();
+	}
+
+	return rc;
+}
+
+IRQCHIP_ACPI_DECLARE(riscv_imsic, ACPI_MADT_TYPE_IMSIC, NULL,
+		     1, imsic_early_acpi_init);
+#endif
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index cdb659401199..f905340d24e6 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -5,6 +5,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-imsic: " fmt
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
@@ -308,43 +309,47 @@ static int imsic_irq_domains_init(struct fwnode_handle *fwnode)
 	return 0;
 }
 
-static int imsic_platform_probe(struct platform_device *pdev)
+static int imsic_platform_probe_common(struct fwnode_handle *fwnode)
 {
-	struct device *dev = &pdev->dev;
 	struct imsic_global_config *global;
 	int rc;
 
 	if (!imsic) {
-		dev_err(dev, "early driver not probed\n");
+		pr_err("%pfwP: early driver not probed\n", fwnode);
 		return -ENODEV;
 	}
 
 	if (imsic->base_domain) {
-		dev_err(dev, "irq domain already created\n");
+		pr_err("%pfwP: irq domain already created\n", fwnode);
 		return -ENODEV;
 	}
 
 	global = &imsic->global;
 
 	/* Initialize IRQ and MSI domains */
-	rc = imsic_irq_domains_init(dev->fwnode);
+	rc = imsic_irq_domains_init(fwnode);
 	if (rc) {
-		dev_err(dev, "failed to initialize IRQ and MSI domains\n");
+		pr_err("%pfwP: failed to initialize IRQ and MSI domains\n", fwnode);
 		return rc;
 	}
 
-	dev_info(dev, "  hart-index-bits: %d,  guest-index-bits: %d\n",
-		 global->hart_index_bits, global->guest_index_bits);
-	dev_info(dev, " group-index-bits: %d, group-index-shift: %d\n",
-		 global->group_index_bits, global->group_index_shift);
-	dev_info(dev, " per-CPU IDs %d at base PPN %pa\n",
-		 global->nr_ids, &global->base_addr);
-	dev_info(dev, " total %d interrupts available\n",
-		 imsic->nr_hwirqs);
+	pr_info("%pfwP: hart-index-bits: %d,  guest-index-bits: %d\n", fwnode,
+		global->hart_index_bits, global->guest_index_bits);
+	pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n", fwnode,
+		global->group_index_bits, global->group_index_shift);
+	pr_info("%pfwP: per-CPU IDs %d at base PPN %pa\n", fwnode,
+		global->nr_ids, &global->base_addr);
+	pr_info("%pfwP: total %d interrupts available\n", fwnode,
+		imsic->nr_hwirqs);
 
 	return 0;
 }
 
+static int imsic_platform_dt_probe(struct platform_device *pdev)
+{
+	return imsic_platform_probe_common(pdev->dev.fwnode);
+}
+
 static const struct of_device_id imsic_platform_match[] = {
 	{ .compatible = "riscv,imsics" },
 	{}
@@ -355,6 +360,22 @@ static struct platform_driver imsic_platform_driver = {
 		.name		= "riscv-imsic",
 		.of_match_table	= imsic_platform_match,
 	},
-	.probe = imsic_platform_probe,
+	.probe = imsic_platform_dt_probe,
 };
 builtin_platform_driver(imsic_platform_driver);
+
+#ifdef CONFIG_ACPI
+
+/*
+ *  On ACPI based systems, PCI enumeration happens early during boot in
+ *  acpi_scan_init(). PCI enumeration expects MSI domain setup before
+ *  it calls pci_set_msi_domain(). Hence, unlike in DT where
+ *  imsic-platform drive probe happens late during boot, ACPI based
+ *  systems need to setup the MSI domain early.
+ */
+int imsic_platform_acpi_probe(struct fwnode_handle *fwnode)
+{
+	return imsic_platform_probe_common(fwnode);
+}
+
+#endif
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 54465e47851c..b842c499df0a 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -5,6 +5,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-imsic: " fmt
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/bitmap.h>
 #include <linux/interrupt.h>
@@ -593,12 +594,8 @@ static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
 	int rc;
 	struct of_phandle_args parent;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
 	if (!is_of_node(fwnode))
-		return -EINVAL;
+		return acpi_get_intc_index_hartid(index, hartid);
 
 	rc = of_irq_parse_one(to_of_node(fwnode), index, &parent);
 	if (rc)
@@ -617,12 +614,8 @@ static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
 static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 					  u32 index, struct resource *res)
 {
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
 	if (!is_of_node(fwnode))
-		return -EINVAL;
+		return acpi_get_imsic_mmio_info(index, res);
 
 	return of_address_to_resource(to_of_node(fwnode), index, res);
 }
@@ -630,20 +623,15 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 				     struct imsic_global_config *global,
 				     u32 *nr_parent_irqs,
-				     u32 *nr_mmios)
+				     u32 *nr_mmios,
+				     void *opaque)
 {
+	struct acpi_madt_imsic *imsic = (struct acpi_madt_imsic *)opaque;
 	unsigned long hartid;
 	struct resource res;
 	int rc;
 	u32 i;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(fwnode))
-		return -EINVAL;
-
 	*nr_parent_irqs = 0;
 	*nr_mmios = 0;
 
@@ -656,58 +644,66 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	/* Find number of guest index bits in MSI address */
-	rc = of_property_read_u32(to_of_node(fwnode),
-				  "riscv,guest-index-bits",
-				  &global->guest_index_bits);
-	if (rc)
-		global->guest_index_bits = 0;
+	if (is_of_node(fwnode)) {
+		/* Find number of guest index bits in MSI address */
+		rc = of_property_read_u32(to_of_node(fwnode),
+					  "riscv,guest-index-bits",
+					  &global->guest_index_bits);
+		if (rc)
+			global->guest_index_bits = 0;
 
-	/* Find number of HART index bits */
-	rc = of_property_read_u32(to_of_node(fwnode),
-				  "riscv,hart-index-bits",
-				  &global->hart_index_bits);
-	if (rc) {
-		/* Assume default value */
-		global->hart_index_bits = __fls(*nr_parent_irqs);
-		if (BIT(global->hart_index_bits) < *nr_parent_irqs)
-			global->hart_index_bits++;
-	}
+		/* Find number of HART index bits */
+		rc = of_property_read_u32(to_of_node(fwnode),
+					  "riscv,hart-index-bits",
+					  &global->hart_index_bits);
+		if (rc) {
+			/* Assume default value */
+			global->hart_index_bits = __fls(*nr_parent_irqs);
+			if (BIT(global->hart_index_bits) < *nr_parent_irqs)
+				global->hart_index_bits++;
+		}
 
-	/* Find number of group index bits */
-	rc = of_property_read_u32(to_of_node(fwnode),
-				  "riscv,group-index-bits",
-				  &global->group_index_bits);
-	if (rc)
-		global->group_index_bits = 0;
+		/* Find number of group index bits */
+		rc = of_property_read_u32(to_of_node(fwnode),
+					  "riscv,group-index-bits",
+					  &global->group_index_bits);
+		if (rc)
+			global->group_index_bits = 0;
 
-	/*
-	 * Find first bit position of group index.
-	 * If not specified assumed the default APLIC-IMSIC configuration.
-	 */
-	rc = of_property_read_u32(to_of_node(fwnode),
-				  "riscv,group-index-shift",
-				  &global->group_index_shift);
-	if (rc)
-		global->group_index_shift = IMSIC_MMIO_PAGE_SHIFT * 2;
+		/*
+		 * Find first bit position of group index.
+		 * If not specified assumed the default APLIC-IMSIC configuration.
+		 */
+		rc = of_property_read_u32(to_of_node(fwnode),
+					  "riscv,group-index-shift",
+					  &global->group_index_shift);
+		if (rc)
+			global->group_index_shift = IMSIC_MMIO_PAGE_SHIFT * 2;
+
+		/* Find number of interrupt identities */
+		rc = of_property_read_u32(to_of_node(fwnode),
+					  "riscv,num-ids",
+					  &global->nr_ids);
+		if (rc) {
+			pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
+			return rc;
+		}
 
-	/* Find number of interrupt identities */
-	rc = of_property_read_u32(to_of_node(fwnode),
-				  "riscv,num-ids",
-				  &global->nr_ids);
-	if (rc) {
-		pr_err("%pfwP: number of interrupt identities not found\n",
-			fwnode);
-		return rc;
+		/* Find number of guest interrupt identities */
+		rc = of_property_read_u32(to_of_node(fwnode),
+					  "riscv,num-guest-ids",
+					  &global->nr_guest_ids);
+		if (rc)
+			global->nr_guest_ids = global->nr_ids;
+	} else {
+		global->guest_index_bits = imsic->guest_index_bits;
+		global->hart_index_bits = imsic->hart_index_bits;
+		global->group_index_bits = imsic->group_index_bits;
+		global->group_index_shift = imsic->group_index_shift;
+		global->nr_ids = imsic->num_ids;
+		global->nr_guest_ids = imsic->num_guest_ids;
 	}
 
-	/* Find number of guest interrupt identities */
-	rc = of_property_read_u32(to_of_node(fwnode),
-				  "riscv,num-guest-ids",
-				  &global->nr_guest_ids);
-	if (rc)
-		global->nr_guest_ids = global->nr_ids;
-
 	/* Sanity check guest index bits */
 	i = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
 	if (i < global->guest_index_bits) {
@@ -775,7 +771,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 	return 0;
 }
 
-int __init imsic_setup_state(struct fwnode_handle *fwnode)
+int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
 	int rc, cpu;
 	phys_addr_t base_addr;
@@ -817,7 +813,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode)
 	}
 
 	/* Parse IMSIC fwnode */
-	rc = imsic_parse_fwnode(fwnode, global, &nr_parent_irqs, &nr_mmios);
+	rc = imsic_parse_fwnode(fwnode, global, &nr_parent_irqs, &nr_mmios, opaque);
 	if (rc)
 		goto out_free_local;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 8d209e77432e..ee1f52891e89 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -105,6 +105,6 @@ void imsic_vector_debug_show_summary(struct seq_file *m, int ind);
 int imsic_hwirqs_alloc(unsigned int order);
 void imsic_hwirqs_free(unsigned int base_hwirq, unsigned int order);
 
-int imsic_setup_state(struct fwnode_handle *fwnode);
+int imsic_setup_state(struct fwnode_handle *fwnode, void *opaque);
 
 #endif
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index cbb7bcd0e4dd..c112e5559d88 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -84,4 +84,14 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 
 #endif
 
+#ifdef CONFIG_ACPI
+int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
+struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
+#else
+static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
+{
+	return NULL;
+}
+#endif
+
 #endif
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
