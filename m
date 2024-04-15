Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588DBC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtbW6viHc5MQttZM1fvUbhUbppbE1yi0sUu0RV5F7Sg=; b=omXiYsItplLmOx
	3u8QSqTNRBARZErj02yFUQ6Od49LALohO8xwyp7zcpRRMgPO2PFWAugsCHP1sC6lCM75wxoDehQjv
	Q1FeX0XjGMvEOZhrFYAktjstvc10bBdQYcN4P+B4uXHkxN2ceRIdjB26yPiwbV9YPzJJEvmUB1i66
	Alist+NFWTMvrjQEOebdx3BAmYcXAzjC8bM3klFZ0gkl7KS6AdQL0VF85tUcXwbTjWaL3LKYbl2tq
	ZztSxb+KsbM7yAx/2bEGEWUgd3dSgrN9wrTyIsDZrBiCQLem+Wd09H1FD2U+UeYlm+O82WdbYOIT+
	EPexNmPTD1EekTetdChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPlN-00000009Doe-3b8H;
	Mon, 15 Apr 2024 17:05:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjV-00000009CH4-2SOr
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:03:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so2273555b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200585; x=1713805385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8smg3owWHWW9PU5G6t7mt+Tcv3LUpwWLhoyg8/upQCQ=;
        b=mDYsDYvF/8DODQObKXvXLBtsYIVm0gzGNWmGbCTeq5evlBNAveKlt1cx9MwTXSr8Su
         3KvoCUd7SNvvN+iA8k4eutVh05aZkAXpv7QUq9RAECfPWYgNDF6eaQF53VXM1snBOz88
         7PfwEcKeTlFVP1nlL/qg7ClPf96oj0K0fc+05zTo3Il/pR8Bq7pLi6ElmzwAASrgOvGD
         6yaceco+73/uWLqrDIv1x9ZXx8VXRem7QkIFBYhUhgozBQQYPolXYfhYjFcgaotIAS/L
         1U8gjoXL2DMNTcazBt6o5CSsVtSakrtodZFmO6q9PtBL2EvUKpnOp8CnZJ1CLZGpC7kw
         vytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200585; x=1713805385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8smg3owWHWW9PU5G6t7mt+Tcv3LUpwWLhoyg8/upQCQ=;
        b=cebLSCnKgegglPaAfiT07xdUeOY3EN58RBFdZ7AvVOx1wer/0dQcc7akT81Ga8P8t1
         +nrZRgdMv/YHSeovhNU2PFvuuUsbg/HAQ+cp+lkrRomcO58v/wisjWG6SQsiCZnUuke4
         FOVpHVi+IsrrGdRE4LlCkhrSgWfJOJLzR6VW2KLSmyiIlT8/vnyz9AySbtEf4p0ITru0
         fjK4R5195psAjWMKWsGXrBorceg6TQDcoQhcC1+09JPrGlsq+kYIHpbl0MhSECkETzuH
         Nz97RlXCX9qAMztAbt4t7ye9wgK2Kspetu+7Olj8oV9RaMi1+07a8kqhEAZ0et4/VwF5
         ND+w==
X-Forwarded-Encrypted: i=1; AJvYcCXmQ87ZOjCz4LE+d0zCBgKsaf3JoBQ9QfYdWY4AEE8Mqg9uTT+Ftpg2KKcYQKg6Gf+o4VXs2Q/FoDdfILlltACoBPR2p1QP8xZpTbfbrHBk
X-Gm-Message-State: AOJu0YygOnWSsxRCswhRaOl3rLRn3IkFFvEhOxjftKvXKoPbN2I8cKFu
	7zXLKCwQTThSrDlRkWgxJ39t85xt3Aan4GvahUEZxW8FOjGJ88Km48we9ni1Owc=
X-Google-Smtp-Source: AGHT+IGV77t74zXqumvBBSYJpdOPZfRZjrz4nC5DPyoQfvVW026my7l2yC+lQVQ7WYkkThW6carIhA==
X-Received: by 2002:a05:6a00:3a19:b0:6e7:48e3:7895 with SMTP id fj25-20020a056a003a1900b006e748e37895mr308776pfb.2.1713200584491;
        Mon, 15 Apr 2024 10:03:04 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:03:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 15/20] irqchip: riscv-imsic: Add ACPI support
Date: Mon, 15 Apr 2024 22:31:08 +0530
Message-Id: <20240415170113.662318-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100306_035591_FCC482AA 
X-CRM114-Status: GOOD (  25.01  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V IMSIC interrupt controller provides IPI and MSI support.
Currently, DT based drivers setup the IPI feature early during boot but
defer setting up the MSI functionality. However, in ACPI systems, PCI
scan happens early during boot and PCI subsystem expects MSI controller
is already setup. Hence, in case of ACPI, both IPI and MSI features
are initialized early itself.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  52 +++++++++-
 drivers/irqchip/irq-riscv-imsic-platform.c |  32 ++++--
 drivers/irqchip/irq-riscv-imsic-state.c    | 115 ++++++++++-----------
 drivers/irqchip/irq-riscv-imsic-state.h    |   2 +-
 include/linux/irqchip/riscv-imsic.h        |  10 ++
 5 files changed, 144 insertions(+), 67 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 886418ec06cb..d8161243791d 100644
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
@@ -199,3 +202,50 @@ static int __init imsic_early_dt_init(struct device_node *node, struct device_no
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
+
+#ifdef CONFIG_PCI
+	if (!rc)
+		pci_msi_register_fwnode_provider(&imsic_acpi_get_fwnode);
+#endif
+
+	return rc;
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
index 5479f872e62b..608b87dd0784 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -5,6 +5,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-imsic: " fmt
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/bitmap.h>
 #include <linux/interrupt.h>
@@ -516,12 +517,8 @@ static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
 	struct of_phandle_args parent;
 	int rc;
 
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
 	if (!is_of_node(fwnode))
-		return -EINVAL;
+		return acpi_get_intc_index_hartid(index, hartid);
 
 	rc = of_irq_parse_one(to_of_node(fwnode), index, &parent);
 	if (rc)
@@ -540,12 +537,8 @@ static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
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
@@ -553,20 +546,15 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
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
 
@@ -578,51 +566,60 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	/* Find number of guest index bits in MSI address */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,guest-index-bits",
-				  &global->guest_index_bits);
-	if (rc)
-		global->guest_index_bits = 0;
+	if (is_of_node(fwnode)) {
+		/* Find number of guest index bits in MSI address */
+		rc = of_property_read_u32(to_of_node(fwnode), "riscv,guest-index-bits",
+					  &global->guest_index_bits);
+		if (rc)
+			global->guest_index_bits = 0;
 
-	/* Find number of HART index bits */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,hart-index-bits",
-				  &global->hart_index_bits);
-	if (rc) {
-		/* Assume default value */
-		global->hart_index_bits = __fls(*nr_parent_irqs);
-		if (BIT(global->hart_index_bits) < *nr_parent_irqs)
-			global->hart_index_bits++;
-	}
+		/* Find number of HART index bits */
+		rc = of_property_read_u32(to_of_node(fwnode), "riscv,hart-index-bits",
+					  &global->hart_index_bits);
+		if (rc) {
+			/* Assume default value */
+			global->hart_index_bits = __fls(*nr_parent_irqs);
+			if (BIT(global->hart_index_bits) < *nr_parent_irqs)
+				global->hart_index_bits++;
+		}
 
-	/* Find number of group index bits */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-bits",
-				  &global->group_index_bits);
-	if (rc)
-		global->group_index_bits = 0;
+		/* Find number of group index bits */
+		rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-bits",
+					  &global->group_index_bits);
+		if (rc)
+			global->group_index_bits = 0;
 
-	/*
-	 * Find first bit position of group index.
-	 * If not specified assumed the default APLIC-IMSIC configuration.
-	 */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-shift",
-				  &global->group_index_shift);
-	if (rc)
-		global->group_index_shift = IMSIC_MMIO_PAGE_SHIFT * 2;
+		/*
+		 * Find first bit position of group index.
+		 * If not specified assumed the default APLIC-IMSIC configuration.
+		 */
+		rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-shift",
+					  &global->group_index_shift);
+		if (rc)
+			global->group_index_shift = IMSIC_MMIO_PAGE_SHIFT * 2;
+
+		/* Find number of interrupt identities */
+		rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-ids",
+					  &global->nr_ids);
+		if (rc) {
+			pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
+			return rc;
+		}
 
-	/* Find number of interrupt identities */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-ids",
-				  &global->nr_ids);
-	if (rc) {
-		pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
-		return rc;
+		/* Find number of guest interrupt identities */
+		rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-guest-ids",
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
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-guest-ids",
-				  &global->nr_guest_ids);
-	if (rc)
-		global->nr_guest_ids = global->nr_ids;
-
 	/* Sanity check guest index bits */
 	i = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
 	if (i < global->guest_index_bits) {
@@ -688,7 +685,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 	return 0;
 }
 
-int __init imsic_setup_state(struct fwnode_handle *fwnode)
+int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
 	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
 	struct imsic_global_config *global;
@@ -729,7 +726,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode)
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
index faf0b800b1b0..e08680b1932b 100644
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
