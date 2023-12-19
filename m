Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F1DC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xpchxboatJNXGTPCFNQPvP1Wo3whzZMYSP3gN9mO6w=; b=qnVXHb3wWva2DH
	e6i9uNgjoZoQe1U31mkywNjqN2RNho9OyZk7OjfDCu3KwdZfN04dtt2LniAnzISEUTd3jCpdc31qh
	X5D9A+frHspe/59q/lblHfpZ/YothCacTjVtaw/jE4pyPpxXYm7D6NXufKn0/dRUnRYrcTFEUK8nz
	0Nh2KU71FaZj18TPcnxRyUX4+h+eRKAg74eZ6ciapYIId6VQ6F2gC9/JuXl7SgnkJZi5c7UrTpzhh
	E2T34JI2FAvMjqP4Vq7yyhnv9OWOy/tsTqTvAeMaK1/pv6RorSpIYVs307a+GMV5Jw+gLWjXZH/Ob
	7FuPf9gCrHg4xYD3v6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeBH-00F1SR-0Q;
	Tue, 19 Dec 2023 17:46:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAw-00F17A-0I
	for linux-riscv@bombadil.infradead.org;
	Tue, 19 Dec 2023 17:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t3fyfZ6Lr7w+r0MJIn4zdZonb9lVGi9+7cBScTQl4UI=; b=Yl178gLhClzo+1MDc+6LqpPsKc
	yPofiP3ek3oMb+65JrJkbGbbO56nfjanl76bBxT3nbq4iIsAVLn1JI/ZNGpIqLEg+74V4wJScaQp/
	bf4tTzSp8kpnKA/zYwqb9RRxFKVnEFra3pklOVkwjC7QnzZJ34LQQPwonHHI2DaBhOGNmvoOfsC81
	tCLg+ys/HDTE5HgVkqBskx4uYPAdJrL6EmVU9TqBOrELCQql1ib7yHfBi79lTHFKKAVrLP88tLVRM
	7cxfy+aoJXkRM+utGlRDHBzsnPVFv+G5MYBetRIMVb3hzhvS/rUqTfrc74FxtKTwvaz7WbOPcsoMD
	XkGAkkHQ==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAs-00DXye-0c
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d3ea5cc137so1868065ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007991; x=1703612791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3fyfZ6Lr7w+r0MJIn4zdZonb9lVGi9+7cBScTQl4UI=;
        b=m9ehLMzwLNHELpOt0SnOYhCW1HdGxH60DxTWrVnPRptSGlAjlHlc3kci+uUamKhrrG
         2HUw59quSxb687GR6tHBIuwjWYwWmJS0NxeWSZchecbDWjhx8rS6mRZahGWybJqhwP7D
         TJrubIBuQ48LR1Rv3gcvsaEPXPnC2FVBm9qPShR/iJyN89wvLcosDMddQn1YXqdVBOP6
         hxUIqzBU1hJH48VVsw2BvD8fLkewABVJjO4kRtoJ/yLK6n29Ju6BaufDwawIvwgO28zz
         MrTsBWdEzcPYx6yNnwT89bEBYjM9BkiX28UeKHMnNCoYPo3nl+AL6y5zrBWlINzK9EBq
         cu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007991; x=1703612791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3fyfZ6Lr7w+r0MJIn4zdZonb9lVGi9+7cBScTQl4UI=;
        b=dJTEobIyqD90mc9uW3w47lmjsxqGScNFzn7VuGGQoOHDy9Zu0BtVTxgtUKAY9q5VX3
         s1KeMFRG9hhusGAs1gCR2ARdqToro/gxUUuSrH6A9kGLmuviZehp6DfZeaabIltNNRer
         elpm11OHodQdoMhbbk4snY+KfrAoL2IObXmaEV3yrRCFHn+T5JQG6bccp0JeartsMdWL
         Cfnq1S9LVOkCDWew46HWRnBtjLs6peF21EX/CHUICEi+dIu3Ur6OfSY5GN6+Bmnem0ma
         RbYwGQPWCmm3Cyf8aGrLRT/SJIOnfSq660oD+uIkiVsMY5diFBRi23P1YazFZI4d0rV2
         WmwA==
X-Gm-Message-State: AOJu0Yxjh1EQ5zME+XPAmhjgsOhtzvfGfHz0kzU9/w6Dx4OZzZzq9t5x
	GTcXiWHqXVpIv4KPR6lOc6VFEg==
X-Google-Smtp-Source: AGHT+IGvMgnXEDBDSoxKrnqEIHP2nZ5eywEEWz1Kq0rK1LvLd/V7z8NaX/xR7mnE5/nWPlUXPulrtg==
X-Received: by 2002:a17:902:820b:b0:1d0:8fad:f18d with SMTP id x11-20020a170902820b00b001d08fadf18dmr18213249pln.95.1703007991260;
        Tue, 19 Dec 2023 09:46:31 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:30 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 10/17] irqchip: riscv-imsic: Add ACPI support
Date: Tue, 19 Dec 2023 23:15:19 +0530
Message-Id: <20231219174526.2235150-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_174634_351433_FE6656D5 
X-CRM114-Status: GOOD (  25.12  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
 drivers/irqchip/irq-riscv-imsic-early.c    |  52 ++++++++-
 drivers/irqchip/irq-riscv-imsic-platform.c |  51 +++++---
 drivers/irqchip/irq-riscv-imsic-state.c    | 128 ++++++++++-----------
 drivers/irqchip/irq-riscv-imsic-state.h    |   2 +-
 include/linux/irqchip/riscv-imsic.h        |  10 ++
 5 files changed, 160 insertions(+), 83 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 23f689ff5807..866e97559e4c 100644
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
 
@@ -216,7 +219,7 @@ static int __init imsic_early_dt_init(struct device_node *node,
 	struct fwnode_handle *fwnode = &node->fwnode;
 
 	/* Setup IMSIC state */
-	rc = imsic_setup_state(fwnode);
+	rc = imsic_setup_state(fwnode, NULL);
 	if (rc) {
 		pr_err("%pfwP: failed to setup state (error %d)\n",
 			fwnode, rc);
@@ -233,3 +236,50 @@ static int __init imsic_early_dt_init(struct device_node *node,
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
