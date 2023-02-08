Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2920AC636D3
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 21:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naxYjTmKdywEHZYbv7Dq/v/LoAfNzxDVjU/CIVSmXek=; b=IDTIXU4MHZeNxipCuHtXugRVnY
	BWsKPwgqxJtvZp0kI6xIoG8RqjNaxdE7KGG0uiqembchdCm3xqVD1H7m4HOqUwUvZMVnT9j1vklh/
	LSwksP6HPqnGZN0ZxkKwQV0vWtcvglEqaH/47hBj/SIuchqzJFZ3gL2/Yi+xBjFtn9LUb1MWnt2xo
	l74yPp9p7TALWD8IItY2Ajc+Cju2lwnAZuSgCZDv7VtBG7QFfkLDzsni8JrT+lGYelZqoVcfg5TPH
	8R56Sxnev1QbgbDAq9bFRgeLP9oJLPl2HyvzHQxhTa4Fzdh2/71WmrOz4sdt5yU5AKPNQvCaWxhj9
	aw6gScxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPryL-00Gz6G-GY; Wed, 08 Feb 2023 21:27:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPryH-00Gz4V-U6
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 21:27:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44402B81F45;
	Wed,  8 Feb 2023 21:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98E0C433D2;
	Wed,  8 Feb 2023 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675891622;
	bh=oI7y/FZhevEdPWTxEZ3gltCzaLhYnX3pa+zhqi7lojU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvUV+QOoPcofq6JRXv3o5N3Ym1RXQNN1T/FLKfz+9De+6hKU2UZ4BfURPanxoURAh
	 /8XMjpDLGHJyG0c5gxbYCq4iuvzcIaV20GeASVA5vIFaVvSjC+8lXNov9n2jAym2Um
	 KyE2+KGwAAwstbZdDTlLMcKdwe19eSR7BmYHRb3vILrvk6ZGu0KuzwunctXPPNeL52
	 IRhkHPJ5vkDwcyjfrCZSBQmdfn030NM4GOC6VntaI415hL7yuY3SbDar9fyzg6iWzM
	 J+0wxmO0HOc41xm69u+6BC9Y1hPDve7nu6UQ695jU2E9rYVr1zi7jX4kp5fFYdjlIN
	 W/Asq6vZDNo/g==
Date: Wed, 8 Feb 2023 21:26:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
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
Message-ID: <Y+QToXO2kYQ2ipdz@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-7-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-7-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_132718_343101_CDF6B006 
X-CRM114-Status: GOOD (  32.89  )
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
Content-Type: multipart/mixed; boundary="===============0670461043830997253=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0670461043830997253==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pAMvRf+LG3lTC78u"
Content-Disposition: inline


--pAMvRf+LG3lTC78u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:07PM +0530, Sunil V L wrote:
> When CONFIG_PCI is enabled, ACPI core expects few arch
> functions related to PCI. Add those functions so that
> ACPI core gets build. These are levraged from arm64.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/kernel/Makefile |   1 +
>  arch/riscv/kernel/pci.c    | 173 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 174 insertions(+)
>  create mode 100644 arch/riscv/kernel/pci.c

> diff --git a/arch/riscv/kernel/pci.c b/arch/riscv/kernel/pci.c
> new file mode 100644
> index 000000000000..3388af3a67a0
> --- /dev/null
> +++ b/arch/riscv/kernel/pci.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Code borrowed from ARM64
> + *
> + * Copyright (C) 2003 Anton Blanchard <anton@au.ibm.com>, IBM
> + * Copyright (C) 2014 ARM Ltd.
> + * Copyright (C) 2022-2023 Ventana Micro System Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/pci.h>
> +#include <linux/pci-acpi.h>
> +#include <linux/pci-ecam.h>
> +
> +#ifdef CONFIG_ACPI

Quickly checking against ARM64, they do not wrap the read/write
functions in this ifdef, so why do we need to do so?

> +/*
> + * raw_pci_read/write - Platform-specific PCI config space access.
> + */
> +int raw_pci_read(unsigned int domain, unsigned int bus,
> +		  unsigned int devfn, int reg, int len, u32 *val)
> +{
> +	struct pci_bus *b =3D pci_find_bus(domain, bus);
> +
> +	if (!b)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +	return b->ops->read(b, devfn, reg, len, val);

A newline before the return would be appreciated by my eyes :)

> +}
> +
> +int raw_pci_write(unsigned int domain, unsigned int bus,
> +		unsigned int devfn, int reg, int len, u32 val)

Also, both read and write functions here appear to have incorrect
alignment on the second lines.

> +{
> +	struct pci_bus *b =3D pci_find_bus(domain, bus);
> +
> +	if (!b)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +	return b->ops->write(b, devfn, reg, len, val);
> +}
> +
> +

Extra newline here too, looks to be exactly where you deleted the numa
stuff from arm64 ;)

> +struct acpi_pci_generic_root_info {
> +	struct acpi_pci_root_info	common;
> +	struct pci_config_window	*cfg;	/* config space mapping */
> +};
> +
> +int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
> +{
> +	struct pci_config_window *cfg =3D bus->sysdata;
> +	struct acpi_device *adev =3D to_acpi_device(cfg->parent);
> +	struct acpi_pci_root *root =3D acpi_driver_data(adev);
> +
> +	return root->segment;
> +}
> +
> +static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)

Rhetorical question perhaps, but what does "ci" mean?

> +{
> +	struct resource_entry *entry, *tmp;
> +	int status;
> +
> +	status =3D acpi_pci_probe_root_resources(ci);
> +	resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
> +		if (!(entry->res->flags & IORESOURCE_WINDOW))
> +			resource_list_destroy_entry(entry);
> +	}
> +	return status;

Perhaps that extra newline from above could migrate down to the line
above the return here.

> +}
> +
> +/*
> + * Lookup the bus range for the domain in MCFG, and set up config space
> + * mapping.
> + */
> +static struct pci_config_window *
> +pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)

This all fits on 1 line.

> +{
> +	struct device *dev =3D &root->device->dev;
> +	struct resource *bus_res =3D &root->secondary;
> +	u16 seg =3D root->segment;
> +	const struct pci_ecam_ops *ecam_ops;
> +	struct resource cfgres;
> +	struct acpi_device *adev;
> +	struct pci_config_window *cfg;
> +	int ret;
> +
> +	ret =3D pci_mcfg_lookup(root, &cfgres, &ecam_ops);
> +	if (ret) {
> +		dev_err(dev, "%04x:%pR ECAM region not found\n", seg, bus_res);
> +		return NULL;
> +	}
> +
> +	adev =3D acpi_resource_consumer(&cfgres);
> +	if (adev)
> +		dev_info(dev, "ECAM area %pR reserved by %s\n", &cfgres,
> +			 dev_name(&adev->dev));
> +	else
> +		dev_warn(dev, FW_BUG "ECAM area %pR not reserved in ACPI namespace\n",
> +			 &cfgres);
> +
> +	cfg =3D pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
> +	if (IS_ERR(cfg)) {
> +		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
> +			PTR_ERR(cfg));
> +		return NULL;
> +	}
> +
> +	return cfg;
> +}
> +
> +/* release_info: free resources allocated by init_info */

The fact that you haven't picked a consistent comment style for this
functions really bothers my OCD. Yes, it may be copy-paste from arm64,
but since this is "new code" I don't think there's harm in at least
*starting* with something that looks cohesive.

> +static void pci_acpi_generic_release_info(struct acpi_pci_root_info *ci)
> +{
> +	struct acpi_pci_generic_root_info *ri;
> +
> +	ri =3D container_of(ci, struct acpi_pci_generic_root_info, common);
> +	pci_ecam_free(ri->cfg);
> +	kfree(ci->ops);
> +	kfree(ri);
> +}
> +
> +

Extra newline here.

> +/* Interface called from ACPI code to setup PCI host controller */
> +struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
> +{
> +	struct acpi_pci_generic_root_info *ri;
> +	struct pci_bus *bus, *child;
> +	struct acpi_pci_root_ops *root_ops;
> +	struct pci_host_bridge *host;
> +
> +	ri =3D kzalloc(sizeof(*ri), GFP_KERNEL);
> +	if (!ri)
> +		return NULL;
> +
> +	root_ops =3D kzalloc(sizeof(*root_ops), GFP_KERNEL);
> +	if (!root_ops) {
> +		kfree(ri);
> +		return NULL;
> +	}
> +
> +	ri->cfg =3D pci_acpi_setup_ecam_mapping(root);
> +	if (!ri->cfg) {
> +		kfree(ri);
> +		kfree(root_ops);
> +		return NULL;
> +	}
> +
> +	root_ops->release_info =3D pci_acpi_generic_release_info;
> +	root_ops->prepare_resources =3D pci_acpi_root_prepare_resources;
> +	root_ops->pci_ops =3D (struct pci_ops *)&ri->cfg->ops->pci_ops;
> +	bus =3D acpi_pci_root_create(root, root_ops, &ri->common, ri->cfg);
> +	if (!bus)
> +		return NULL;
> +
> +	/* If we must preserve the resource configuration, claim now */
> +	host =3D pci_find_host_bridge(bus);
> +	if (host->preserve_config)
> +		pci_bus_claim_resources(bus);
> +
> +	/*
> +	 * Assign whatever was left unassigned. If we didn't claim above,
> +	 * this will reassign everything.
> +	 */
> +	pci_assign_unassigned_root_bus_resources(bus);
> +
> +	list_for_each_entry(child, &bus->children, node)
> +		pcie_bus_configure_settings(child);
> +
> +	return bus;
> +}

Anyways, this does look to be "leveraged from arm64" as you say and I
only had minor nits to comment about...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--pAMvRf+LG3lTC78u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+QToQAKCRB4tDGHoIJi
0olNAP9lp3WE8VCFaQckxPUKRtzrtdzfJ3ELelGbTEBAtUvOxgD+N9unferlze1j
9CtTXW5bLgdHZbiLIlkSAugaqVc7uwE=
=cnvy
-----END PGP SIGNATURE-----

--pAMvRf+LG3lTC78u--


--===============0670461043830997253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0670461043830997253==--

