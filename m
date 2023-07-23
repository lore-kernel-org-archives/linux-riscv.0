Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC505C001DF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApTdHqiNbd6OBmcnavgrTnGuEUZnMYI+ewIXqzqju0Q=; b=kQebLW9aflqU4Z8spyULcq5pDt
	8oYdJu5L9coYTMyY3EUyBQiVCoru0xjHBaB8dpXRDWFvSgeEBintAwepwhu86SJHiEcgGNVPD/Onv
	d4Bw18xwGE++BeKmAFv0i+xPnNfAtbFxybpDw5z8XNV64EgFi8WwT7DIz1YGbl/WsMq2GOYys4CfJ
	D/lahfZ78dlR3SwX1DmeDDXP1Exg/KbAm/l0ZrCb937frT0jmR0RQxGv95z9xvLjTTMjSki1wStVJ
	TLphtRB4zvi/bYwkhLz34DzeUGjr/LkGQXBw+Q2zYWJE5X11g0V7rF4ACPAyxEgWxhAwi2jT4WFdd
	GbL8ypiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcGx-001S9d-0z;
	Sun, 23 Jul 2023 16:49:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcGt-001S9G-1u
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 16:49:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E515C60DE1;
	Sun, 23 Jul 2023 16:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B58C433C8;
	Sun, 23 Jul 2023 16:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690130966;
	bh=cHKKq3WQS++CKlFc2cYznv6wsR8eOvTSWj0Es22CaDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqFx5BMjawkGMxVuG1emkD/apJTy3XUppbjFJmRSwl5iWCeqpRn/K5FxSuV+VTL9r
	 KzI50f0+zDyVyiyTFXFgiCS94UI9u02rkc6ici9jxB2Cxflpfpllk3aphtF6C3MISv
	 pKAJjXA6B3qoeC5z8p0hDbZEOSVwgBjDMKdZ0/AL7STntlL8EZOWLz4KzBvjMBalNk
	 LrKMN0QCJljdZp6tLYyjxcYtPBJjPgFJM1mKDwd9WMfopfeAvEFvDAUkhPv5XFArvc
	 q99XOwqBeNKVnaCuTHTTMveyjqO3jmB8qbeiMNatyCPlSUewL8lkTkZcKrZRofNDRW
	 XkloyEO/g7WXQ==
Date: Sun, 23 Jul 2023 17:49:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem
 address
Message-ID: <20230723-penniless-revered-20ab702bcc8c@spud>
References: <20230723150434.1055571-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230723150434.1055571-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_094927_765151_6C551974 
X-CRM114-Status: GOOD (  33.16  )
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
Content-Type: multipart/mixed; boundary="===============9027448390894646239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9027448390894646239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZewvJzrypr7rAVlj"
Content-Disposition: inline


--ZewvJzrypr7rAVlj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

On Sun, Jul 23, 2023 at 08:34:34PM +0530, Sunil V L wrote:
> Fix the acpi_os_ioremap() to return iomem address and
> use memory attributes from EFI memory map while remapping.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@i=
ntel.com/
> Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Huh, there's quite a lot more going on here than $subject would
suggest... This really seems like it should be a pair of commits, with
a trivial one fixing the lkp reported sparse issue & a second one, with
a more detailed commit message, implementing the memory attributes
stuff. Doing it as an "afterthought" as part of the LKP fix does not seem
at all right to me.

When you split it, I figure you should CC Ard and Alex Ghiti on the
patch adding the EFI attribute stuff.

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig       |  1 +
>  arch/riscv/kernel/acpi.c | 88 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 87 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..4892418e0821 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -38,6 +38,7 @@ config RISCV
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_VDSO_DATA
> +	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_STACKWALK
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 5ee03ebab80e..ce28a530c81d 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -17,6 +17,7 @@
>  #include <linux/io.h>
>  #include <linux/pci.h>
>  #include <linux/efi.h>
> +#include <linux/memblock.h>
> =20
>  int acpi_noirq =3D 1;		/* skip ACPI IRQ initialization */
>  int acpi_disabled =3D 1;
> @@ -215,9 +216,92 @@ void __init __acpi_unmap_table(void __iomem *map, un=
signed long size)
>  	early_iounmap(map, size);
>  }
> =20
> -void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> +void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  {
> -	return memremap(phys, size, MEMREMAP_WB);
> +	efi_memory_desc_t *md, *region =3D NULL;
> +	pgprot_t prot;
> +
> +	if (WARN_ON_ONCE(!efi_enabled(EFI_MEMMAP)))
> +		return NULL;
> +
> +	for_each_efi_memory_desc(md) {
> +		u64 end =3D md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT);
> +
> +		if (phys < md->phys_addr || phys >=3D end)
> +			continue;
> +
> +		if (phys + size > end) {
> +			pr_warn(FW_BUG "requested region covers multiple EFI memory regions\n=
");
> +			return NULL;
> +		}
> +		region =3D md;
> +		break;
> +	}
> +
> +	/*
> +	 * It is fine for AML to remap regions that are not represented in the
> +	 * EFI memory map at all, as it only describes normal memory, and MMIO
> +	 * regions that require a virtual mapping to make them accessible to
> +	 * the EFI runtime services.
> +	 */
> +	prot =3D PAGE_KERNEL_IO;
> +	if (region) {
> +		switch (region->type) {
> +		case EFI_LOADER_CODE:
> +		case EFI_LOADER_DATA:
> +		case EFI_BOOT_SERVICES_CODE:
> +		case EFI_BOOT_SERVICES_DATA:
> +		case EFI_CONVENTIONAL_MEMORY:
> +		case EFI_PERSISTENT_MEMORY:
> +			if (memblock_is_map_memory(phys) ||
> +			    !memblock_is_region_memory(phys, size)) {
> +				pr_warn(FW_BUG "requested region covers kernel memory @ %p\n",
> +					&phys);
> +				return NULL;
> +			}
> +
> +			/*
> +			 * Mapping kernel memory is permitted if the region in
> +			 * question is covered by a single memblock with the
> +			 * NOMAP attribute set: this enables the use of ACPI
> +			 * table overrides passed via initramfs.
> +			 * This particular use case only requires read access.
> +			 */
> +			fallthrough;
> +
> +		case EFI_RUNTIME_SERVICES_CODE:
> +			/*
> +			 * This would be unusual, but not problematic per se,
> +			 * as long as we take care not to create a writable
> +			 * mapping for executable code.
> +			 */
> +			prot =3D PAGE_KERNEL_RO;
> +			break;
> +
> +		case EFI_ACPI_RECLAIM_MEMORY:
> +			/*
> +			 * ACPI reclaim memory is used to pass firmware tables
> +			 * and other data that is intended for consumption by
> +			 * the OS only, which may decide it wants to reclaim
> +			 * that memory and use it for something else. We never
> +			 * do that, but we usually add it to the linear map
> +			 * anyway, in which case we should use the existing
> +			 * mapping.
> +			 */
> +			if (memblock_is_map_memory(phys))
> +				return (void __iomem *)__va(phys);
> +			fallthrough;
> +
> +		default:
> +			if (region->attribute & EFI_MEMORY_WB)
> +				prot =3D PAGE_KERNEL;
> +			else if ((region->attribute & EFI_MEMORY_WC) ||
> +				(region->attribute & EFI_MEMORY_WT))
> +				prot =3D pgprot_writecombine(PAGE_KERNEL);
> +		}
> +	}
> +
> +	return ioremap_prot(phys, size, pgprot_val(prot));
>  }
> =20
>  #ifdef CONFIG_PCI
> --=20
> 2.39.2
>=20

--ZewvJzrypr7rAVlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL1Z/QAKCRB4tDGHoIJi
0vY7AQC36amhGgRsPv4luCnef5UNuqOa8HFNB21Q9n1Pm726rAD9FG2DmMCcJXKm
2x2lKWIwqbJI+qAyUWnUnwPEL/tR3AU=
=pE28
-----END PGP SIGNATURE-----

--ZewvJzrypr7rAVlj--


--===============9027448390894646239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9027448390894646239==--

