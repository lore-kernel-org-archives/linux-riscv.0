Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E788C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZnnPlQ3X/NWO3SMcCevOoV1Sl+kZOvMWUrCs1XurSo=; b=1m5DqDBW+VAZ9E
	RtY3l8czo1vahbHefrdvbfpSRjQr+qqWgsX51tEN18pIrXvH2nADMPM1BoicLs2CZupe6SMDL/YhD
	xmAukAQrZ9AkuDl0NvqxQt3CB4CVppkaMR2RBT+hD0W2lQmhcaWeuFz13I4Dps/FyTFjMGM4XI7MO
	9sNmWHdyaZfYclYMGBl791PkiRz1yVpiiCCdpgdgiMtpCnP1JaPpKmddjZ0zcVT+p2EY40B9pjUPp
	bB09YJ5147r9gEpmQ6GIuKaCrIK+y0ssePQXmYiDvBKsTJHXwy0y6TemOFmopxuD8YQa6p0havpyq
	xgx1BQ9CZaiqQKAHuIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPi4-00000009BLu-0MP4;
	Mon, 15 Apr 2024 17:01:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPhy-00000009BKL-2UXw
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:01:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso2822589b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200490; x=1713805290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBFCNaiZG8SDhd9Avy2NjVgbIzDcy1byPrgimW8Jnrg=;
        b=Wv6ifgB0ZwZa/Swhsm2+3ktLVnkp4SgXM8/YeGRHcrQT0X+F+rgMdGcL4mOS7VXDjA
         gUoX24ZT/OmE4YoDT2Qhov3jTNNq/EchkOtH0YSTcCTtWpnDVgZOGP/YrFBgGJvDefGm
         2qjlGvR4IwjRQgs02UKz0ke/sxdBSg3zVpGoibzzP8+Cr96eoiLp6fKXMjc4faQuxhXm
         JEfMyN57nH0MfIz1W8m6pt9xovQY/6EhpY11Bp4ni3pOdF1pAVypBMIb42Ze3wDs0oJj
         KAArA3LTXcfhjgmjHHadPn3iXxIZhEt2MkQ4BVM69pp9F1QT07NDrpCbuR0cULhzhfzf
         SjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200490; x=1713805290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBFCNaiZG8SDhd9Avy2NjVgbIzDcy1byPrgimW8Jnrg=;
        b=V5HZ6ylPkqEGl9CWEeYFhZP39Jf/onGU7QUqofIIbEI+J53fvA3VIsT8RVlqhn8Hu5
         L9Bd17fox15oKsL1aUJTD2dhJyfJz/sJtEumnA/S2SF1lM7FJTo/SuYQCIe7P7CIaiPI
         2utq0RcfSqH52Ie7z/23o51ZNhDyLnGrKaSVRfgt+6qfANWD1aPwufnZbQeq/6B5myTR
         LLuQ5MOzW+oo/GXkdWjq3H9/JeEZdAKQEs8ivH4T2yJnYAFNwPztExWOKG0SZ/J3vSa/
         pyn081TQhfz6PFiXePMIlGyZS8dB+hnWw0m5KuCNESe5A5Nw+u1BERR9oR37HdlMTJ9b
         EXbw==
X-Forwarded-Encrypted: i=1; AJvYcCWoOeY5vNtf4pSIHdR2MNXjCLIS3TfDzNrR0/WBqOYXYmJvoQ0aILwi4OzDpil2Ligt1rk19i9bmd5FOgnmdTC/u9isw85/k5FNSeAOZH8T
X-Gm-Message-State: AOJu0Yws2tkEylgpLwaRtriyKhdhnYV3GfBIbkP+DKPLcg7fKU9BGoTj
	8pQEHmy+sMg9Y8x3M3RZWSM0YqNw8zmqLYLYO0k7GzhUkUnef5kmdZiU6zhuxqk=
X-Google-Smtp-Source: AGHT+IEzt8khZRTAtvH8V3F5ny5WPuVjUU5oxNy7bzJAesNzMJQ033mielfe1XpkBmNZ7d1UwBv2dw==
X-Received: by 2002:a05:6a00:1798:b0:6ea:bdbc:6a4 with SMTP id s24-20020a056a00179800b006eabdbc06a4mr9926776pfg.13.1713200489901;
        Mon, 15 Apr 2024 10:01:29 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:01:29 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 01/20] arm64: PCI: Migrate ACPI related functions to pci-acpi.c
Date: Mon, 15 Apr 2024 22:30:54 +0530
Message-Id: <20240415170113.662318-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100130_750376_55F6ED7D 
X-CRM114-Status: GOOD (  21.48  )
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

The functions defined in arm64 for ACPI support are required
for RISC-V also. To avoid duplication, move these functions
to common location.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/arm64/kernel/pci.c | 191 ----------------------------------------
 drivers/pci/pci-acpi.c  | 182 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+), 191 deletions(-)

diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
index f872c57e9909..fd9a7bed83ce 100644
--- a/arch/arm64/kernel/pci.c
+++ b/arch/arm64/kernel/pci.c
@@ -6,28 +6,7 @@
  * Copyright (C) 2014 ARM Ltd.
  */
 
-#include <linux/acpi.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
 #include <linux/pci.h>
-#include <linux/pci-acpi.h>
-#include <linux/pci-ecam.h>
-#include <linux/slab.h>
-
-#ifdef CONFIG_ACPI
-/*
- * Try to assign the IRQ number when probing a new device
- */
-int pcibios_alloc_irq(struct pci_dev *dev)
-{
-	if (!acpi_disabled)
-		acpi_pci_irq_enable(dev);
-
-	return 0;
-}
-#endif
 
 /*
  * raw_pci_read/write - Platform-specific PCI config space access.
@@ -61,173 +40,3 @@ int pcibus_to_node(struct pci_bus *bus)
 EXPORT_SYMBOL(pcibus_to_node);
 
 #endif
-
-#ifdef CONFIG_ACPI
-
-struct acpi_pci_generic_root_info {
-	struct acpi_pci_root_info	common;
-	struct pci_config_window	*cfg;	/* config space mapping */
-};
-
-int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
-{
-	struct pci_config_window *cfg = bus->sysdata;
-	struct acpi_device *adev = to_acpi_device(cfg->parent);
-	struct acpi_pci_root *root = acpi_driver_data(adev);
-
-	return root->segment;
-}
-
-int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
-{
-	struct pci_config_window *cfg;
-	struct acpi_device *adev;
-	struct device *bus_dev;
-
-	if (acpi_disabled)
-		return 0;
-
-	cfg = bridge->bus->sysdata;
-
-	/*
-	 * On Hyper-V there is no corresponding ACPI device for a root bridge,
-	 * therefore ->parent is set as NULL by the driver. And set 'adev' as
-	 * NULL in this case because there is no proper ACPI device.
-	 */
-	if (!cfg->parent)
-		adev = NULL;
-	else
-		adev = to_acpi_device(cfg->parent);
-
-	bus_dev = &bridge->bus->dev;
-
-	ACPI_COMPANION_SET(&bridge->dev, adev);
-	set_dev_node(bus_dev, acpi_get_node(acpi_device_handle(adev)));
-
-	return 0;
-}
-
-static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)
-{
-	struct resource_entry *entry, *tmp;
-	int status;
-
-	status = acpi_pci_probe_root_resources(ci);
-	resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
-		if (!(entry->res->flags & IORESOURCE_WINDOW))
-			resource_list_destroy_entry(entry);
-	}
-	return status;
-}
-
-/*
- * Lookup the bus range for the domain in MCFG, and set up config space
- * mapping.
- */
-static struct pci_config_window *
-pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
-{
-	struct device *dev = &root->device->dev;
-	struct resource *bus_res = &root->secondary;
-	u16 seg = root->segment;
-	const struct pci_ecam_ops *ecam_ops;
-	struct resource cfgres;
-	struct acpi_device *adev;
-	struct pci_config_window *cfg;
-	int ret;
-
-	ret = pci_mcfg_lookup(root, &cfgres, &ecam_ops);
-	if (ret) {
-		dev_err(dev, "%04x:%pR ECAM region not found\n", seg, bus_res);
-		return NULL;
-	}
-
-	adev = acpi_resource_consumer(&cfgres);
-	if (adev)
-		dev_info(dev, "ECAM area %pR reserved by %s\n", &cfgres,
-			 dev_name(&adev->dev));
-	else
-		dev_warn(dev, FW_BUG "ECAM area %pR not reserved in ACPI namespace\n",
-			 &cfgres);
-
-	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
-	if (IS_ERR(cfg)) {
-		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
-			PTR_ERR(cfg));
-		return NULL;
-	}
-
-	return cfg;
-}
-
-/* release_info: free resources allocated by init_info */
-static void pci_acpi_generic_release_info(struct acpi_pci_root_info *ci)
-{
-	struct acpi_pci_generic_root_info *ri;
-
-	ri = container_of(ci, struct acpi_pci_generic_root_info, common);
-	pci_ecam_free(ri->cfg);
-	kfree(ci->ops);
-	kfree(ri);
-}
-
-/* Interface called from ACPI code to setup PCI host controller */
-struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
-{
-	struct acpi_pci_generic_root_info *ri;
-	struct pci_bus *bus, *child;
-	struct acpi_pci_root_ops *root_ops;
-	struct pci_host_bridge *host;
-
-	ri = kzalloc(sizeof(*ri), GFP_KERNEL);
-	if (!ri)
-		return NULL;
-
-	root_ops = kzalloc(sizeof(*root_ops), GFP_KERNEL);
-	if (!root_ops) {
-		kfree(ri);
-		return NULL;
-	}
-
-	ri->cfg = pci_acpi_setup_ecam_mapping(root);
-	if (!ri->cfg) {
-		kfree(ri);
-		kfree(root_ops);
-		return NULL;
-	}
-
-	root_ops->release_info = pci_acpi_generic_release_info;
-	root_ops->prepare_resources = pci_acpi_root_prepare_resources;
-	root_ops->pci_ops = (struct pci_ops *)&ri->cfg->ops->pci_ops;
-	bus = acpi_pci_root_create(root, root_ops, &ri->common, ri->cfg);
-	if (!bus)
-		return NULL;
-
-	/* If we must preserve the resource configuration, claim now */
-	host = pci_find_host_bridge(bus);
-	if (host->preserve_config)
-		pci_bus_claim_resources(bus);
-
-	/*
-	 * Assign whatever was left unassigned. If we didn't claim above,
-	 * this will reassign everything.
-	 */
-	pci_assign_unassigned_root_bus_resources(bus);
-
-	list_for_each_entry(child, &bus->children, node)
-		pcie_bus_configure_settings(child);
-
-	return bus;
-}
-
-void pcibios_add_bus(struct pci_bus *bus)
-{
-	acpi_pci_add_bus(bus);
-}
-
-void pcibios_remove_bus(struct pci_bus *bus)
-{
-	acpi_pci_remove_bus(bus);
-}
-
-#endif
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 004575091596..e8d84fa435da 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -15,6 +15,7 @@
 #include <linux/pci_hotplug.h>
 #include <linux/module.h>
 #include <linux/pci-acpi.h>
+#include <linux/pci-ecam.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_qos.h>
 #include <linux/rwsem.h>
@@ -1519,3 +1520,184 @@ static int __init acpi_pci_init(void)
 	return 0;
 }
 arch_initcall(acpi_pci_init);
+
+#if defined(CONFIG_ARM64)
+
+/*
+ * Try to assign the IRQ number when probing a new device
+ */
+int pcibios_alloc_irq(struct pci_dev *dev)
+{
+	if (!acpi_disabled)
+		acpi_pci_irq_enable(dev);
+
+	return 0;
+}
+
+struct acpi_pci_generic_root_info {
+	struct acpi_pci_root_info	common;
+	struct pci_config_window	*cfg;	/* config space mapping */
+};
+
+int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
+{
+	struct pci_config_window *cfg = bus->sysdata;
+	struct acpi_device *adev = to_acpi_device(cfg->parent);
+	struct acpi_pci_root *root = acpi_driver_data(adev);
+
+	return root->segment;
+}
+
+int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
+{
+	struct pci_config_window *cfg;
+	struct acpi_device *adev;
+	struct device *bus_dev;
+
+	if (acpi_disabled)
+		return 0;
+
+	cfg = bridge->bus->sysdata;
+
+	/*
+	 * On Hyper-V there is no corresponding ACPI device for a root bridge,
+	 * therefore ->parent is set as NULL by the driver. And set 'adev' as
+	 * NULL in this case because there is no proper ACPI device.
+	 */
+	if (!cfg->parent)
+		adev = NULL;
+	else
+		adev = to_acpi_device(cfg->parent);
+
+	bus_dev = &bridge->bus->dev;
+
+	ACPI_COMPANION_SET(&bridge->dev, adev);
+	set_dev_node(bus_dev, acpi_get_node(acpi_device_handle(adev)));
+
+	return 0;
+}
+
+static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)
+{
+	struct resource_entry *entry, *tmp;
+	int status;
+
+	status = acpi_pci_probe_root_resources(ci);
+	resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
+		if (!(entry->res->flags & IORESOURCE_WINDOW))
+			resource_list_destroy_entry(entry);
+	}
+	return status;
+}
+
+/*
+ * Lookup the bus range for the domain in MCFG, and set up config space
+ * mapping.
+ */
+static struct pci_config_window *
+pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
+{
+	struct device *dev = &root->device->dev;
+	struct resource *bus_res = &root->secondary;
+	u16 seg = root->segment;
+	const struct pci_ecam_ops *ecam_ops;
+	struct resource cfgres;
+	struct acpi_device *adev;
+	struct pci_config_window *cfg;
+	int ret;
+
+	ret = pci_mcfg_lookup(root, &cfgres, &ecam_ops);
+	if (ret) {
+		dev_err(dev, "%04x:%pR ECAM region not found\n", seg, bus_res);
+		return NULL;
+	}
+
+	adev = acpi_resource_consumer(&cfgres);
+	if (adev)
+		dev_info(dev, "ECAM area %pR reserved by %s\n", &cfgres,
+			 dev_name(&adev->dev));
+	else
+		dev_warn(dev, FW_BUG "ECAM area %pR not reserved in ACPI namespace\n",
+			 &cfgres);
+
+	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
+	if (IS_ERR(cfg)) {
+		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
+			PTR_ERR(cfg));
+		return NULL;
+	}
+
+	return cfg;
+}
+
+/* release_info: free resources allocated by init_info */
+static void pci_acpi_generic_release_info(struct acpi_pci_root_info *ci)
+{
+	struct acpi_pci_generic_root_info *ri;
+
+	ri = container_of(ci, struct acpi_pci_generic_root_info, common);
+	pci_ecam_free(ri->cfg);
+	kfree(ci->ops);
+	kfree(ri);
+}
+
+/* Interface called from ACPI code to setup PCI host controller */
+struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
+{
+	struct acpi_pci_generic_root_info *ri;
+	struct pci_bus *bus, *child;
+	struct acpi_pci_root_ops *root_ops;
+	struct pci_host_bridge *host;
+
+	ri = kzalloc(sizeof(*ri), GFP_KERNEL);
+	if (!ri)
+		return NULL;
+
+	root_ops = kzalloc(sizeof(*root_ops), GFP_KERNEL);
+	if (!root_ops) {
+		kfree(ri);
+		return NULL;
+	}
+
+	ri->cfg = pci_acpi_setup_ecam_mapping(root);
+	if (!ri->cfg) {
+		kfree(ri);
+		kfree(root_ops);
+		return NULL;
+	}
+
+	root_ops->release_info = pci_acpi_generic_release_info;
+	root_ops->prepare_resources = pci_acpi_root_prepare_resources;
+	root_ops->pci_ops = (struct pci_ops *)&ri->cfg->ops->pci_ops;
+	bus = acpi_pci_root_create(root, root_ops, &ri->common, ri->cfg);
+	if (!bus)
+		return NULL;
+
+	/* If we must preserve the resource configuration, claim now */
+	host = pci_find_host_bridge(bus);
+	if (host->preserve_config)
+		pci_bus_claim_resources(bus);
+
+	/*
+	 * Assign whatever was left unassigned. If we didn't claim above,
+	 * this will reassign everything.
+	 */
+	pci_assign_unassigned_root_bus_resources(bus);
+
+	list_for_each_entry(child, &bus->children, node)
+		pcie_bus_configure_settings(child);
+
+	return bus;
+}
+
+void pcibios_add_bus(struct pci_bus *bus)
+{
+	acpi_pci_add_bus(bus);
+}
+
+void pcibios_remove_bus(struct pci_bus *bus)
+{
+	acpi_pci_remove_bus(bus);
+}
+
+#endif
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
