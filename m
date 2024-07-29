Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E47C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnoKWTAjvAAOwWsplnNiaheAqV7JJuoV0NghyLXycVc=; b=cBwOihx+xnFltI
	nh5ccVYgzI1rs4JXL7fRTs3TsLG+kacVsyGxwEL7+WNQtJbGgVf6kGB0bStN3TH8cNcBt6p7brEZ7
	xfkXtMQNyKFZzvmktp5D16FDjFYsQqVPkrej1N6lY9vY8dr5Jp3yBDVgbVlHWiFyY4uc9pAU+d3lj
	EYxOfMMrH87l8Y0ogYzUOGhtjgKpGpL9CjCycxmIqxyN2Pf29lEZ8IY5gyvXwLaRHOQCA0ILoR2tJ
	A+KE0ohUpEqpYIB4x32T6kLQX7zEeAxL4eQBcGvXcKq5cmxpTA0m5cfKBhAP2eulY0kU9wIyoS47C
	/Kuyr06zP5qLJ2lC1bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRYx-0000000BgfW-09zc;
	Mon, 29 Jul 2024 14:41:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRIS-0000000BZ9r-3kRl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:24:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fd69e44596so20650295ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263060; x=1722867860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEavi2oCbfZUL041rDq3pUhsFVNcsCR7JV/lSvs1zjE=;
        b=JZX5psNxQQ2l/am67ZcAT7yNFjsSYll5aXuUFvdSJ0GfJEs85pl6au/1OVaZRiVJgn
         dteuj1FoYp4RhtzGcczce5oOZQEy11Pl2m0dYiMdIZdzXyah2XNd2wr7AdMHm8i9Rjnh
         BppBPdvFHzgJreLY3vgVL6q2pm7vAlMr5tC5gOXuVRMCYfGO3HUCYmt9zpPd4WAVFZ9h
         /tJy25kgxB2GgQ3Rn6qVnQqXRwsQCDH1S7937MTNuOzIuO6UQQjLw9/qX1zKaGKC4aeL
         ol8DX8ZhEIqcfsY+ouKIQap+aiUemHiVzB3oRjmw7Mo2iXeMUrkegAUGCWjaP7LUz8hY
         UObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263060; x=1722867860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEavi2oCbfZUL041rDq3pUhsFVNcsCR7JV/lSvs1zjE=;
        b=RMhLCYjgUDGo7Uh+lKOfys/m9/GkIYIY1PR1EPIczIDwg7AYuYZjXKaxHK0mMGrIsp
         6y8UKGZFeMcTRKwuMe3Ew9yj03s8hHUG2sRDfHQ7otL1KmqL6TWy5Lu9cfrDCMBqHK9R
         Wf69p4HXhkygADiAQbqhRYrNofdNXMzDzWbNNH+lXenlHCclhhGq/ptZFjR4CQGBCQNL
         pmIQ2qVYDk8d2gczZxt20qQ23hDwiXJtJxkUx01QlNhYmmTr5dmEFgy1docVjuWGR+L4
         U8zbJvmk3Q+YH2KUHG3t4aIZAYzX2kRIm3H8iF/41w34Vddn/QbLTBH6JyZV8b/qkd7Y
         xMYA==
X-Forwarded-Encrypted: i=1; AJvYcCVwDN+sCgQ1d93MFOrKjqtnbOLNpySP1UlXE9Q8irhC6oeyOWnlHxUvJ0ZN4cbogZVu4WTKpGjpgwwI014IZwuDE6nc4AyeJWmOsxSZTVxg
X-Gm-Message-State: AOJu0YzDO7FatooeacCFEdWUTDA1tqqLEjSDx5HvXhp1Z33iZAuBQOqX
	yw3oWnIu2sBpfo0/rwylYNDKHrWQkk8o/oqqWvkRzU6BjEhjihQ1mibM+ao8u3s=
X-Google-Smtp-Source: AGHT+IHpL4tMIkOEacG2+8mAK1PfaiVTS/v+kCY6IpxY2HmFK244CWhCYJb8BR2pVzEQrYXct8BHbA==
X-Received: by 2002:a17:903:22cd:b0:1fb:5f9c:a86c with SMTP id d9443c01a7336-1ff04a23828mr133458135ad.3.1722263060022;
        Mon, 29 Jul 2024 07:24:20 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:24:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 15/17] irqchip/riscv-imsic: Add ACPI support
Date: Mon, 29 Jul 2024 19:52:37 +0530
Message-ID: <20240729142241.733357-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072420_996259_6D09A1BC 
X-CRM114-Status: GOOD (  25.40  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Anup Patel <anup@brainfault.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V IMSIC interrupt controller provides IPI and MSI support.
Currently, DT based drivers setup the IPI feature early during boot but
defer setting up the MSI functionality. However, in ACPI systems, PCI
subsystem is probed early and assume MSI controller is already setup.
Hence, both IPI and MSI features need to be initialized early itself.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    | 64 +++++++++++++++++++++-
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 +++++++++--
 drivers/irqchip/irq-riscv-imsic-state.c    | 57 +++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.h    |  2 +-
 include/linux/irqchip/riscv-imsic.h        |  9 +++
 5 files changed, 134 insertions(+), 30 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 4fbb37074d29..c5c2e6929a2f 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -5,13 +5,16 @@
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
 
@@ -182,7 +185,7 @@ static int __init imsic_early_dt_init(struct device_node *node, struct device_no
 	int rc;
 
 	/* Setup IMSIC state */
-	rc = imsic_setup_state(fwnode);
+	rc = imsic_setup_state(fwnode, NULL);
 	if (rc) {
 		pr_err("%pfwP: failed to setup state (error %d)\n", fwnode, rc);
 		return rc;
@@ -199,3 +202,62 @@ static int __init imsic_early_dt_init(struct device_node *node, struct device_no
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
+	rc = imsic_setup_state(imsic_acpi_fwnode, imsic);
+	if (rc) {
+		pr_err("%pfwP: failed to setup state (error %d)\n", imsic_acpi_fwnode, rc);
+		return rc;
+	}
+
+	/* Do early setup of IMSIC state and IPIs */
+	rc = imsic_early_probe(imsic_acpi_fwnode);
+	if (rc) {
+		irq_domain_free_fwnode(imsic_acpi_fwnode);
+		imsic_acpi_fwnode = NULL;
+		return rc;
+	}
+
+	rc = imsic_platform_acpi_probe(imsic_acpi_fwnode);
+
+#ifdef CONFIG_PCI
+	if (!rc)
+		pci_msi_register_fwnode_provider(&imsic_acpi_get_fwnode);
+#endif
+
+	if (rc)
+		pr_err("%pfwP: failed to register IMSIC for MSI functionality (error %d)\n",
+		       imsic_acpi_fwnode, rc);
+
+	/*
+	 * Even if imsic_platform_acpi_probe() fails, the IPI part of IMSIC can
+	 * continue to work. So, no need to return failure. This is similar to
+	 * DT where IPI works but MSI probe fails for some reason.
+	 */
+	return 0;
+}
+
+IRQCHIP_ACPI_DECLARE(riscv_imsic, ACPI_MADT_TYPE_IMSIC, NULL,
+		     1, imsic_early_acpi_init);
+#endif
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 11723a763c10..64905e6f52d7 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -5,6 +5,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-imsic: " fmt
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
@@ -348,18 +349,37 @@ int imsic_irqdomain_init(void)
 	return 0;
 }
 
-static int imsic_platform_probe(struct platform_device *pdev)
+static int imsic_platform_probe_common(struct fwnode_handle *fwnode)
 {
-	struct device *dev = &pdev->dev;
-
-	if (imsic && imsic->fwnode != dev->fwnode) {
-		dev_err(dev, "fwnode mismatch\n");
+	if (imsic && imsic->fwnode != fwnode) {
+		pr_err("%pfwP: fwnode mismatch\n", fwnode);
 		return -ENODEV;
 	}
 
 	return imsic_irqdomain_init();
 }
 
+static int imsic_platform_dt_probe(struct platform_device *pdev)
+{
+	return imsic_platform_probe_common(pdev->dev.fwnode);
+}
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
+
 static const struct of_device_id imsic_platform_match[] = {
 	{ .compatible = "riscv,imsics" },
 	{}
@@ -370,6 +390,6 @@ static struct platform_driver imsic_platform_driver = {
 		.name		= "riscv-imsic",
 		.of_match_table	= imsic_platform_match,
 	},
-	.probe = imsic_platform_probe,
+	.probe = imsic_platform_dt_probe,
 };
 builtin_platform_driver(imsic_platform_driver);
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index f9e70832863a..73faa64bffda 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -5,6 +5,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-imsic: " fmt
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/bitmap.h>
 #include <linux/interrupt.h>
@@ -564,18 +565,36 @@ static int __init imsic_populate_global_dt(struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int __init imsic_populate_global_acpi(struct fwnode_handle *fwnode,
+					     struct imsic_global_config *global,
+					     u32 *nr_parent_irqs, void *opaque)
+{
+	struct acpi_madt_imsic *imsic = (struct acpi_madt_imsic *)opaque;
+
+	global->guest_index_bits = imsic->guest_index_bits;
+	global->hart_index_bits = imsic->hart_index_bits;
+	global->group_index_bits = imsic->group_index_bits;
+	global->group_index_shift = imsic->group_index_shift;
+	global->nr_ids = imsic->num_ids;
+	global->nr_guest_ids = imsic->num_guest_ids;
+	return 0;
+}
+
 static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
 					  u32 index, unsigned long *hartid)
 {
 	struct of_phandle_args parent;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(fwnode))
-		return -EINVAL;
+	if (!is_of_node(fwnode)) {
+		if (hartid)
+			*hartid = acpi_get_intc_index_hartid(index);
+
+		if (!hartid || (*hartid == INVALID_HARTID))
+			return -EINVAL;
+
+		return 0;
+	}
 
 	rc = of_irq_parse_one(to_of_node(fwnode), index, &parent);
 	if (rc)
@@ -594,12 +613,8 @@ static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
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
@@ -607,20 +622,14 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 				     struct imsic_global_config *global,
 				     u32 *nr_parent_irqs,
-				     u32 *nr_mmios)
+				     u32 *nr_mmios,
+				     void *opaque)
 {
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
 
@@ -632,7 +641,11 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	rc = imsic_populate_global_dt(fwnode, global, nr_parent_irqs);
+	if (is_of_node(fwnode))
+		rc = imsic_populate_global_dt(fwnode, global, nr_parent_irqs);
+	else
+		rc = imsic_populate_global_acpi(fwnode, global, nr_parent_irqs, opaque);
+
 	if (rc)
 		return rc;
 
@@ -701,7 +714,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 	return 0;
 }
 
-int __init imsic_setup_state(struct fwnode_handle *fwnode)
+int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
 	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
 	struct imsic_global_config *global;
@@ -742,7 +755,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode)
 	}
 
 	/* Parse IMSIC fwnode */
-	rc = imsic_parse_fwnode(fwnode, global, &nr_parent_irqs, &nr_mmios);
+	rc = imsic_parse_fwnode(fwnode, global, &nr_parent_irqs, &nr_mmios, opaque);
 	if (rc)
 		goto out_free_local;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 5ae2f69b035b..391e44280827 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -102,7 +102,7 @@ void imsic_vector_debug_show_summary(struct seq_file *m, int ind);
 
 void imsic_state_online(void);
 void imsic_state_offline(void);
-int imsic_setup_state(struct fwnode_handle *fwnode);
+int imsic_setup_state(struct fwnode_handle *fwnode, void *opaque);
 int imsic_irqdomain_init(void);
 
 #endif
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index faf0b800b1b0..7494952c5518 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 #include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/fwnode.h>
 #include <asm/csr.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT		12
@@ -84,4 +86,11 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 
 #endif
 
+#ifdef CONFIG_ACPI
+int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
+struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
+#else
+static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev) { return NULL; }
+#endif
+
 #endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
