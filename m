Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60879C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OYQQd2izQxwpI+ZdQFtVSBqAcAPTjH3etKfHWvdoxA=; b=sJ7pGHV+lO8gmI
	ZoRVCprA4DvuA6sIwuMPk/iN3Wa6CE7oehkLH/SpN7ABnZ8axf3xmez2CAjOYm8dniCjJJiDHbu9P
	4Oz910y5s1F9gMPl9pCIpLVDDDWfaO7s0Bpw5IDHHkAV8pSFbV2dlwce6w6qowR8l+HsuP3uCd1VV
	3GkcOqUz+kVqFt8hMgLi4KZoQy69ZVcV6wxFmFNBkI6jOVyVb37adGA/OFQj9RlFa6+xqJt8QqmTH
	J/FE7l+XAtJRs03QodtPQdodMP70R2r11Cq53CSukE19502mf9wvwXQSeazxWGaAbngkA+ulTq4/a
	gh4p/WrIXv9kCBh73TEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRafq-00FBMS-GY; Mon, 13 Feb 2023 15:23:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRafk-00FBKX-6Z
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 15:23:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id e17so4975809plg.12
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 07:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9obGSHJL1jP8Gz5Kbja6klYurFoCmsJVYRk2S1vme9o=;
        b=eie3aBv1kf9buidJAGpA6sjCUIspKM3onHNjyA3f+XMBsaiyyUh+ez6iOqtEj/wtIZ
         9HNAuexGDa8/GC28zBv4NlEjiFFtGteGZuCGW32sdX4szU1e3cY32JiCqZA+vM7+hlmM
         soLyT5ta/pCQQUgNsQ0M0EGpqUCixLpzwfEEwgTlgWMesYaHmEf1p7vCRecs+gmeTLaX
         CwVQ3ZiJHuNOKsHsP5KqD4kmRIMfJVKYyz+tBw771oSDw9ROyggzKXLGY8C1r/J8LWNs
         MB8hhp6nwjqcDdRr6iA8kvd5MGao6qygP2exDTg6IgKDEVukRKQN0AgTuIyhGE5fAEfF
         WObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9obGSHJL1jP8Gz5Kbja6klYurFoCmsJVYRk2S1vme9o=;
        b=j1w96M6Erki/fh5dHlNxN9kAr3vbzWWANp4lucF3g9qk4dCkvTm0Ic30biF2768/MA
         rDCAnMIenqxPXC/Z5T71ejqzXLlZLTk1N86ElEt/6Rh/3UgpOX5ij4b8wH9elRjLZkuu
         SU/Y6f9a4bogjVGMx/hFv2laFV+1K6RMyEAA2YBSR1R/94wfNx54Oae+vlS2D4i84d5J
         et9vECM229Hr1jk0UMnWFt2WOscpqlAGUlr0I+NagdCe6q/7UFQo6Raswyce1olEf5C6
         0jUwB1RNdTVInx+V+YagR+HlEy9GecRJrwqS+tbkvsSS7zTHnut3E9lQ72/FRdncvws/
         hAhQ==
X-Gm-Message-State: AO0yUKX5li3b8V7xtLwZC01xq5lGQ8q1xzwYPy1iAdrVQ504pkiFrqFR
	u/9ymYDznCbjpeya2Js8Wa2NfA==
X-Google-Smtp-Source: AK7set8Rza+nET49jhPHmTTBGt8AkRlUlcToHz5dQzC5MrTSlKyoWJUrwmupMo9PQo0vP9FvMR9CNA==
X-Received: by 2002:a17:902:ce88:b0:19a:8304:21f1 with SMTP id f8-20020a170902ce8800b0019a830421f1mr9743420plg.69.1676301791021;
        Mon, 13 Feb 2023 07:23:11 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b0018963b8e131sm8318234plb.290.2023.02.13.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:23:10 -0800 (PST)
Date: Mon, 13 Feb 2023 20:53:01 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 06/24] RISC-V: ACPI: Add PCI functions to build ACPI core
Message-ID: <Y+pV1aafHUNP6QfU@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-7-sunilvl@ventanamicro.com>
 <Y+QToXO2kYQ2ipdz@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+QToXO2kYQ2ipdz@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_072317_547375_29526CA6 
X-CRM114-Status: GOOD (  41.29  )
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

On Wed, Feb 08, 2023 at 09:26:57PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:07PM +0530, Sunil V L wrote:
> > When CONFIG_PCI is enabled, ACPI core expects few arch
> > functions related to PCI. Add those functions so that
> > ACPI core gets build. These are levraged from arm64.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/Makefile |   1 +
> >  arch/riscv/kernel/pci.c    | 173 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 174 insertions(+)
> >  create mode 100644 arch/riscv/kernel/pci.c
> 
> > diff --git a/arch/riscv/kernel/pci.c b/arch/riscv/kernel/pci.c
> > new file mode 100644
> > index 000000000000..3388af3a67a0
> > --- /dev/null
> > +++ b/arch/riscv/kernel/pci.c
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Code borrowed from ARM64
> > + *
> > + * Copyright (C) 2003 Anton Blanchard <anton@au.ibm.com>, IBM
> > + * Copyright (C) 2014 ARM Ltd.
> > + * Copyright (C) 2022-2023 Ventana Micro System Inc.
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mm.h>
> > +#include <linux/pci.h>
> > +#include <linux/pci-acpi.h>
> > +#include <linux/pci-ecam.h>
> > +
> > +#ifdef CONFIG_ACPI
> 
> Quickly checking against ARM64, they do not wrap the read/write
> functions in this ifdef, so why do we need to do so?
> 
I didn't find any callers other than ACPI. But let me keep them outside so
that we are consistent.

> > +/*
> > + * raw_pci_read/write - Platform-specific PCI config space access.
> > + */
> > +int raw_pci_read(unsigned int domain, unsigned int bus,
> > +		  unsigned int devfn, int reg, int len, u32 *val)
> > +{
> > +	struct pci_bus *b = pci_find_bus(domain, bus);
> > +
> > +	if (!b)
> > +		return PCIBIOS_DEVICE_NOT_FOUND;
> > +	return b->ops->read(b, devfn, reg, len, val);
> 
> A newline before the return would be appreciated by my eyes :)
> 
Okay.

> > +}
> > +
> > +int raw_pci_write(unsigned int domain, unsigned int bus,
> > +		unsigned int devfn, int reg, int len, u32 val)
> 
> Also, both read and write functions here appear to have incorrect
> alignment on the second lines.
> 
Okay.

> > +{
> > +	struct pci_bus *b = pci_find_bus(domain, bus);
> > +
> > +	if (!b)
> > +		return PCIBIOS_DEVICE_NOT_FOUND;
> > +	return b->ops->write(b, devfn, reg, len, val);
> > +}
> > +
> > +
> 
> Extra newline here too, looks to be exactly where you deleted the numa
> stuff from arm64 ;)
> 
Okay.

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
> > +static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)
> 
> Rhetorical question perhaps, but what does "ci" mean?
>
I don't know either :-). I guess since there is one more generic
ri, this is named as ci.

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
> 
> Perhaps that extra newline from above could migrate down to the line
> above the return here.
>
Okay.

> > +}
> > +
> > +/*
> > + * Lookup the bus range for the domain in MCFG, and set up config space
> > + * mapping.
> > + */
> > +static struct pci_config_window *
> > +pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
> 
> This all fits on 1 line.
> 
It actually goes beyond 80 characters, right?

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
> 
> The fact that you haven't picked a consistent comment style for this
> functions really bothers my OCD. Yes, it may be copy-paste from arm64,
> but since this is "new code" I don't think there's harm in at least
> *starting* with something that looks cohesive.
> 
Agree. Will try to fix them in the next revision.

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
> > +
> 
> Extra newline here.
>
Okay.
 
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
> 
> Anyways, this does look to be "leveraged from arm64" as you say and I
> only had minor nits to comment about...
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
