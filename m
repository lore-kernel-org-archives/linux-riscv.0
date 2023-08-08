Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66008C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 04:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsFzMfjWLlwv8VnebWdbRSzkIauiaWuWR6QIbFQ+Y5c=; b=2ugdlCVHPmcCr1
	xz4AzAsOPOUbiUOoGzfdANgs36Kf9LaMUGoyTKtNueVrKgdwVWBM5c03OrDxwMiBYXE+V57S9lDMy
	tTtGfgyJpsOX8fzkV9rZYy+PtKNXHoWd03HfHVWj3CNZ8fxBobpR2T04Z3EuyjabSoeBBb9shA85H
	TINyyY0LSS8ILMNi1ePZc+YzmG7IAZnoZITkTshUbzOSakGHKe+5hmwZuVEeyJoCDaULR89MfBRfN
	DwX//JwtkK1nULuu655IJ10034ErZrtPo3OeXoDVfkcpQf4dvwKVnzARjg5vYRvfTX0xwW+XWeLhJ
	ENk20lnoJfFDdYMX4eLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTEho-001jP8-2W;
	Tue, 08 Aug 2023 04:52:28 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTEhk-001jO2-0i
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 04:52:26 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a5ad21a1f9so3666587b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 21:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691470342; x=1692075142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XlmHUeaRUsL7m/s5aynviI2pipO5mYbmIClc7cRgQ0=;
        b=QXJeEDMC5GVgh5p8s1Fl8B8ZAfoUcNtl5ZSQDdvixwQLW1GnwooqJDsnTNT2tiU2w2
         KvOzF0tyhYpSWU/YDzelT6tR+loVk87Ao3bWVPC7GWSA3Q86ru8nJsurD8iEEpn9kVWg
         hAnPBEk6FNxsYw/VE9kaBZGWm9DECYy64fKpFByjAmd+vzmfRL/qbmvfMam6oa4GB77x
         hl6/dcC/Vl4OFvfCZRsAEOrKp0K9BE5snn7qCQRfK5ITj6RnVWcjY9CmcVFIUBSNQKWw
         xyGQOwItJVeG1LTYVJwcfZ9emyg5ldrTNymqZXQE7w9wJvZraATHLY0RDTisKSFty6F6
         6i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691470342; x=1692075142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XlmHUeaRUsL7m/s5aynviI2pipO5mYbmIClc7cRgQ0=;
        b=QGvVIh9p52r4VbgHL9/tt2HJKl1ldKKRUK/8E9Dvm8LMr5Ow3c2WeDi9ER+wJzGqe7
         uTUiSO8QsReDuBdFIrDdtAQ7zE3N7DqPtqSjFr0jXE+Y1djm+xXMzURY+61F2VUslpeo
         c6iaATRKUoJ4W4Qg1X6t6jBopGAnQYOOdSxznVpQcmhiXwCfDohVT5jGgjTZloFZMpuh
         da13XY4U4qGtFnnmf4IC3Z1LrXoODBE2nghHjpcriGOy3BU3tMXtTs/G4DQXCZ7LUVEN
         E1EnT+MHCz9aLkOuf4xH3sLs5plKfZ02GqeYsir+xojrPomGeCEnIXJeEe/xLXw9Zv3j
         u2Zg==
X-Gm-Message-State: AOJu0Yxk9P0EuPv6XYDMpNSzh2zsOKAAnz45YdHOyogdvMmop7TSQnwk
	4E645VVsHkYzYjIjVEV9USfZyg==
X-Google-Smtp-Source: AGHT+IHwsRXoHKFn08OcPmdycooDY1/71tq7u8t1xFSVYxYNN+UDC9Vb8Pgycj4Y5erIS/ddW/bH7A==
X-Received: by 2002:a54:4e06:0:b0:3a1:dd1e:a726 with SMTP id a6-20020a544e06000000b003a1dd1ea726mr11019944oiy.44.1691470342166;
        Mon, 07 Aug 2023 21:52:22 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id e4-20020a6558c4000000b0056433b1b996sm5042200pgu.45.2023.08.07.21.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 21:52:21 -0700 (PDT)
Date: Tue, 8 Aug 2023 10:22:10 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [RFC PATCH v1 05/21] arm64: PCI: Migrate ACPI related functions
 to pci-acpi.c
Message-ID: <ZNHJ+lO21c+0P4WN@sunil-laptop>
References: <20230803175916.3174453-6-sunilvl@ventanamicro.com>
 <20230807224152.GA274647@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807224152.GA274647@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_215224_258107_78C53090 
X-CRM114-Status: GOOD (  35.22  )
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

On Mon, Aug 07, 2023 at 05:41:52PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 03, 2023 at 11:29:00PM +0530, Sunil V L wrote:
> > The functions defined in arm64 for ACPI support are required
> > for RISC-V also. To avoid duplication, copy these functions
> > to common location.
> 
> I assume this is a "move" (not a copy) and the code being moved isn't
> being changed.
> 
Hi Bjorn,

Thank you very much for the review!. Yes, it is a move as is. Let me
update the commit message in next version.

Thanks!
Sunil
> If so,
> 
>   Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/arm64/kernel/pci.c | 193 ----------------------------------------
> >  drivers/pci/pci-acpi.c  | 182 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 182 insertions(+), 193 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > index 2276689b5411..fd9a7bed83ce 100644
> > --- a/arch/arm64/kernel/pci.c
> > +++ b/arch/arm64/kernel/pci.c
> > @@ -6,30 +6,7 @@
> >   * Copyright (C) 2014 ARM Ltd.
> >   */
> >  
> > -#include <linux/acpi.h>
> > -#include <linux/init.h>
> > -#include <linux/io.h>
> > -#include <linux/kernel.h>
> > -#include <linux/mm.h>
> > -#include <linux/of_pci.h>
> > -#include <linux/of_platform.h>
> >  #include <linux/pci.h>
> > -#include <linux/pci-acpi.h>
> > -#include <linux/pci-ecam.h>
> > -#include <linux/slab.h>
> > -
> > -#ifdef CONFIG_ACPI
> > -/*
> > - * Try to assign the IRQ number when probing a new device
> > - */
> > -int pcibios_alloc_irq(struct pci_dev *dev)
> > -{
> > -	if (!acpi_disabled)
> > -		acpi_pci_irq_enable(dev);
> > -
> > -	return 0;
> > -}
> > -#endif
> >  
> >  /*
> >   * raw_pci_read/write - Platform-specific PCI config space access.
> > @@ -63,173 +40,3 @@ int pcibus_to_node(struct pci_bus *bus)
> >  EXPORT_SYMBOL(pcibus_to_node);
> >  
> >  #endif
> > -
> > -#ifdef CONFIG_ACPI
> > -
> > -struct acpi_pci_generic_root_info {
> > -	struct acpi_pci_root_info	common;
> > -	struct pci_config_window	*cfg;	/* config space mapping */
> > -};
> > -
> > -int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
> > -{
> > -	struct pci_config_window *cfg = bus->sysdata;
> > -	struct acpi_device *adev = to_acpi_device(cfg->parent);
> > -	struct acpi_pci_root *root = acpi_driver_data(adev);
> > -
> > -	return root->segment;
> > -}
> > -
> > -int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
> > -{
> > -	struct pci_config_window *cfg;
> > -	struct acpi_device *adev;
> > -	struct device *bus_dev;
> > -
> > -	if (acpi_disabled)
> > -		return 0;
> > -
> > -	cfg = bridge->bus->sysdata;
> > -
> > -	/*
> > -	 * On Hyper-V there is no corresponding ACPI device for a root bridge,
> > -	 * therefore ->parent is set as NULL by the driver. And set 'adev' as
> > -	 * NULL in this case because there is no proper ACPI device.
> > -	 */
> > -	if (!cfg->parent)
> > -		adev = NULL;
> > -	else
> > -		adev = to_acpi_device(cfg->parent);
> > -
> > -	bus_dev = &bridge->bus->dev;
> > -
> > -	ACPI_COMPANION_SET(&bridge->dev, adev);
> > -	set_dev_node(bus_dev, acpi_get_node(acpi_device_handle(adev)));
> > -
> > -	return 0;
> > -}
> > -
> > -static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)
> > -{
> > -	struct resource_entry *entry, *tmp;
> > -	int status;
> > -
> > -	status = acpi_pci_probe_root_resources(ci);
> > -	resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
> > -		if (!(entry->res->flags & IORESOURCE_WINDOW))
> > -			resource_list_destroy_entry(entry);
> > -	}
> > -	return status;
> > -}
> > -
> > -/*
> > - * Lookup the bus range for the domain in MCFG, and set up config space
> > - * mapping.
> > - */
> > -static struct pci_config_window *
> > -pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
> > -{
> > -	struct device *dev = &root->device->dev;
> > -	struct resource *bus_res = &root->secondary;
> > -	u16 seg = root->segment;
> > -	const struct pci_ecam_ops *ecam_ops;
> > -	struct resource cfgres;
> > -	struct acpi_device *adev;
> > -	struct pci_config_window *cfg;
> > -	int ret;
> > -
> > -	ret = pci_mcfg_lookup(root, &cfgres, &ecam_ops);
> > -	if (ret) {
> > -		dev_err(dev, "%04x:%pR ECAM region not found\n", seg, bus_res);
> > -		return NULL;
> > -	}
> > -
> > -	adev = acpi_resource_consumer(&cfgres);
> > -	if (adev)
> > -		dev_info(dev, "ECAM area %pR reserved by %s\n", &cfgres,
> > -			 dev_name(&adev->dev));
> > -	else
> > -		dev_warn(dev, FW_BUG "ECAM area %pR not reserved in ACPI namespace\n",
> > -			 &cfgres);
> > -
> > -	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
> > -	if (IS_ERR(cfg)) {
> > -		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
> > -			PTR_ERR(cfg));
> > -		return NULL;
> > -	}
> > -
> > -	return cfg;
> > -}
> > -
> > -/* release_info: free resources allocated by init_info */
> > -static void pci_acpi_generic_release_info(struct acpi_pci_root_info *ci)
> > -{
> > -	struct acpi_pci_generic_root_info *ri;
> > -
> > -	ri = container_of(ci, struct acpi_pci_generic_root_info, common);
> > -	pci_ecam_free(ri->cfg);
> > -	kfree(ci->ops);
> > -	kfree(ri);
> > -}
> > -
> > -/* Interface called from ACPI code to setup PCI host controller */
> > -struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
> > -{
> > -	struct acpi_pci_generic_root_info *ri;
> > -	struct pci_bus *bus, *child;
> > -	struct acpi_pci_root_ops *root_ops;
> > -	struct pci_host_bridge *host;
> > -
> > -	ri = kzalloc(sizeof(*ri), GFP_KERNEL);
> > -	if (!ri)
> > -		return NULL;
> > -
> > -	root_ops = kzalloc(sizeof(*root_ops), GFP_KERNEL);
> > -	if (!root_ops) {
> > -		kfree(ri);
> > -		return NULL;
> > -	}
> > -
> > -	ri->cfg = pci_acpi_setup_ecam_mapping(root);
> > -	if (!ri->cfg) {
> > -		kfree(ri);
> > -		kfree(root_ops);
> > -		return NULL;
> > -	}
> > -
> > -	root_ops->release_info = pci_acpi_generic_release_info;
> > -	root_ops->prepare_resources = pci_acpi_root_prepare_resources;
> > -	root_ops->pci_ops = (struct pci_ops *)&ri->cfg->ops->pci_ops;
> > -	bus = acpi_pci_root_create(root, root_ops, &ri->common, ri->cfg);
> > -	if (!bus)
> > -		return NULL;
> > -
> > -	/* If we must preserve the resource configuration, claim now */
> > -	host = pci_find_host_bridge(bus);
> > -	if (host->preserve_config)
> > -		pci_bus_claim_resources(bus);
> > -
> > -	/*
> > -	 * Assign whatever was left unassigned. If we didn't claim above,
> > -	 * this will reassign everything.
> > -	 */
> > -	pci_assign_unassigned_root_bus_resources(bus);
> > -
> > -	list_for_each_entry(child, &bus->children, node)
> > -		pcie_bus_configure_settings(child);
> > -
> > -	return bus;
> > -}
> > -
> > -void pcibios_add_bus(struct pci_bus *bus)
> > -{
> > -	acpi_pci_add_bus(bus);
> > -}
> > -
> > -void pcibios_remove_bus(struct pci_bus *bus)
> > -{
> > -	acpi_pci_remove_bus(bus);
> > -}
> > -
> > -#endif
> > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > index a05350a4e49c..d6b2d64b8237 100644
> > --- a/drivers/pci/pci-acpi.c
> > +++ b/drivers/pci/pci-acpi.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/pci_hotplug.h>
> >  #include <linux/module.h>
> >  #include <linux/pci-acpi.h>
> > +#include <linux/pci-ecam.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/pm_qos.h>
> >  #include <linux/rwsem.h>
> > @@ -1517,4 +1518,185 @@ static int __init acpi_pci_init(void)
> >  
> >  	return 0;
> >  }
> > +
> >  arch_initcall(acpi_pci_init);
> > +
> > +#if defined(CONFIG_ARM64)
> > +/*
> > + * Try to assign the IRQ number when probing a new device
> > + */
> > +int pcibios_alloc_irq(struct pci_dev *dev)
> > +{
> > +	if (!acpi_disabled)
> > +		acpi_pci_irq_enable(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +struct acpi_pci_generic_root_info {
> > +	struct acpi_pci_root_info	common;
> > +	struct pci_config_window	*cfg;	/* config space mapping */
> > +};
> > +
> > +int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
> > +{
> > +	struct pci_config_window *cfg = bus->sysdata;
> > +	struct acpi_device *adev = to_acpi_device(cfg->parent);
> > +	struct acpi_pci_root *root = acpi_driver_data(adev);
> > +
> > +	return root->segment;
> > +}
> > +
> > +int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
> > +{
> > +	struct pci_config_window *cfg;
> > +	struct acpi_device *adev;
> > +	struct device *bus_dev;
> > +
> > +	if (acpi_disabled)
> > +		return 0;
> > +
> > +	cfg = bridge->bus->sysdata;
> > +
> > +	/*
> > +	 * On Hyper-V there is no corresponding ACPI device for a root bridge,
> > +	 * therefore ->parent is set as NULL by the driver. And set 'adev' as
> > +	 * NULL in this case because there is no proper ACPI device.
> > +	 */
> > +	if (!cfg->parent)
> > +		adev = NULL;
> > +	else
> > +		adev = to_acpi_device(cfg->parent);
> > +
> > +	bus_dev = &bridge->bus->dev;
> > +
> > +	ACPI_COMPANION_SET(&bridge->dev, adev);
> > +	set_dev_node(bus_dev, acpi_get_node(acpi_device_handle(adev)));
> > +
> > +	return 0;
> > +}
> > +
> > +static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)
> > +{
> > +	struct resource_entry *entry, *tmp;
> > +	int status;
> > +
> > +	status = acpi_pci_probe_root_resources(ci);
> > +	resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
> > +		if (!(entry->res->flags & IORESOURCE_WINDOW))
> > +			resource_list_destroy_entry(entry);
> > +	}
> > +	return status;
> > +}
> > +
> > +/*
> > + * Lookup the bus range for the domain in MCFG, and set up config space
> > + * mapping.
> > + */
> > +static struct pci_config_window *
> > +pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
> > +{
> > +	struct device *dev = &root->device->dev;
> > +	struct resource *bus_res = &root->secondary;
> > +	u16 seg = root->segment;
> > +	const struct pci_ecam_ops *ecam_ops;
> > +	struct resource cfgres;
> > +	struct acpi_device *adev;
> > +	struct pci_config_window *cfg;
> > +	int ret;
> > +
> > +	ret = pci_mcfg_lookup(root, &cfgres, &ecam_ops);
> > +	if (ret) {
> > +		dev_err(dev, "%04x:%pR ECAM region not found\n", seg, bus_res);
> > +		return NULL;
> > +	}
> > +
> > +	adev = acpi_resource_consumer(&cfgres);
> > +	if (adev)
> > +		dev_info(dev, "ECAM area %pR reserved by %s\n", &cfgres,
> > +			 dev_name(&adev->dev));
> > +	else
> > +		dev_warn(dev, FW_BUG "ECAM area %pR not reserved in ACPI namespace\n",
> > +			 &cfgres);
> > +
> > +	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
> > +	if (IS_ERR(cfg)) {
> > +		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
> > +			PTR_ERR(cfg));
> > +		return NULL;
> > +	}
> > +
> > +	return cfg;
> > +}
> > +
> > +/* release_info: free resources allocated by init_info */
> > +static void pci_acpi_generic_release_info(struct acpi_pci_root_info *ci)
> > +{
> > +	struct acpi_pci_generic_root_info *ri;
> > +
> > +	ri = container_of(ci, struct acpi_pci_generic_root_info, common);
> > +	pci_ecam_free(ri->cfg);
> > +	kfree(ci->ops);
> > +	kfree(ri);
> > +}
> > +
> > +/* Interface called from ACPI code to setup PCI host controller */
> > +struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
> > +{
> > +	struct acpi_pci_generic_root_info *ri;
> > +	struct pci_bus *bus, *child;
> > +	struct acpi_pci_root_ops *root_ops;
> > +	struct pci_host_bridge *host;
> > +
> > +	ri = kzalloc(sizeof(*ri), GFP_KERNEL);
> > +	if (!ri)
> > +		return NULL;
> > +
> > +	root_ops = kzalloc(sizeof(*root_ops), GFP_KERNEL);
> > +	if (!root_ops) {
> > +		kfree(ri);
> > +		return NULL;
> > +	}
> > +
> > +	ri->cfg = pci_acpi_setup_ecam_mapping(root);
> > +	if (!ri->cfg) {
> > +		kfree(ri);
> > +		kfree(root_ops);
> > +		return NULL;
> > +	}
> > +
> > +	root_ops->release_info = pci_acpi_generic_release_info;
> > +	root_ops->prepare_resources = pci_acpi_root_prepare_resources;
> > +	root_ops->pci_ops = (struct pci_ops *)&ri->cfg->ops->pci_ops;
> > +	bus = acpi_pci_root_create(root, root_ops, &ri->common, ri->cfg);
> > +	if (!bus)
> > +		return NULL;
> > +
> > +	/* If we must preserve the resource configuration, claim now */
> > +	host = pci_find_host_bridge(bus);
> > +	if (host->preserve_config)
> > +		pci_bus_claim_resources(bus);
> > +
> > +	/*
> > +	 * Assign whatever was left unassigned. If we didn't claim above,
> > +	 * this will reassign everything.
> > +	 */
> > +	pci_assign_unassigned_root_bus_resources(bus);
> > +
> > +	list_for_each_entry(child, &bus->children, node)
> > +		pcie_bus_configure_settings(child);
> > +
> > +	return bus;
> > +}
> > +
> > +void pcibios_add_bus(struct pci_bus *bus)
> > +{
> > +	acpi_pci_add_bus(bus);
> > +}
> > +
> > +void pcibios_remove_bus(struct pci_bus *bus)
> > +{
> > +	acpi_pci_remove_bus(bus);
> > +}
> > +
> > +#endif
> > -- 
> > 2.39.2
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
