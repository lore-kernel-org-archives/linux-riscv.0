Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC78E784BF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwXB2qQXFem4dKKFQYrxZrCXOr5Lf0vD/I3Qssfjv08=; b=VhyM3ROkxMVS2dE41aFmgbPzn4
	rd7k/E5QQXKKKW4n4BM1XIt68hVY0d1j8FDkD46oXLQvUuDNN9PoS1MR6eolAhsYSyAGU3P/HUyGr
	Y51LsEKGc+sAQkT4Z3l16Q3GN2GDB+bHo1aY1Nya96dVt9y5VXqn3NL9quisa8w3Zb+NzAGDnmdeD
	TYbkR5wUN6iuC06Ezdu1sMr3t1OnX01rGduKdxqpJTXVZroop+euS0sL+N1MHKJ6zlpN3NqgndYyo
	mXSgAToMXBttPaCAh4TWghMPpzBD1rCWAN2AWMms4SKiwiSP885vTRotmTvdDnbHIXEDpAXyV8Ty0
	zWfd5dCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLEV-00D1Rf-2A;
	Mon, 02 Oct 2023 15:53:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLER-00D1Qk-1I
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6F6160F6F;
	Mon,  2 Oct 2023 15:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB5AC433CA;
	Mon,  2 Oct 2023 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696261994;
	bh=d7kdXeS2XgWDqTgJUWuMbIoo6AzaLC2wc3/Kdd1R24U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKuKC7ToslGewIB1E4B6Zp55A4P9lDO3N2oH4ZgjzLFX1qF7Pqq/rmA52UZGU/hxw
	 wgteGokL7ljquUyoO23Ka0P/hLOFqrhS5DKWcbnUI3O4j3x5+w0MRc7YS0vC96qp/K
	 JJcQgpbpD0n1BivlR1Xpja70KHN36qN4cLAHysxRplKXJiIYjyof7WUfF64RMDosVS
	 QBGbgwcnFKehcxRaisPxUSqXlltOcdW/Yy948Sue6qzikSosZxgc0TdiuLuJLxDNQe
	 fJUeZl46sWHcBGdUHsSKicJrQ5jxF9azvtsvZBObAJTLcd5PhjF6ZDU7V21lkjdY+W
	 UmK2mqRG6b8Eg==
Date: Mon, 2 Oct 2023 16:53:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 -next 1/4] RISC-V: ACPI: Enhance acpi_os_ioremap with
 MMIO remapping
Message-ID: <20231002-thicket-roundup-4c4bab71ea94@spud>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230927170015.295232-2-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_085315_520188_49B139FC 
X-CRM114-Status: GOOD (  30.16  )
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
Content-Type: multipart/mixed; boundary="===============8682708186324570146=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8682708186324570146==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SYLSRPBlP6/+v9ud"
Content-Disposition: inline


--SYLSRPBlP6/+v9ud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 10:30:12PM +0530, Sunil V L wrote:
> Enhance the acpi_os_ioremap() to support opregions in MMIO space. Also,
> have strict checks using EFI memory map to allow remapping the RAM similar
> to arm64.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks for resending this. If you respin, I think it would be worth
mentioning here that you are aligning things with arm64.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheer,
Conor.

> ---
>  arch/riscv/Kconfig       |  1 +
>  arch/riscv/kernel/acpi.c | 87 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 86 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d607ab0f7c6d..ac039cf8af7a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -39,6 +39,7 @@ config RISCV
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_VDSO_DATA
> +	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_STACKWALK
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 56cb2c986c48..e619edc8b0cc 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -14,9 +14,10 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/efi.h>
>  #include <linux/io.h>
> +#include <linux/memblock.h>
>  #include <linux/pci.h>
> -#include <linux/efi.h>
> =20
>  int acpi_noirq =3D 1;		/* skip ACPI IRQ initialization */
>  int acpi_disabled =3D 1;
> @@ -217,7 +218,89 @@ void __init __acpi_unmap_table(void __iomem *map, un=
signed long size)
> =20
>  void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  {
> -	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
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
> +				pr_warn(FW_BUG "requested region covers kernel memory\n");
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
> +				 (region->attribute & EFI_MEMORY_WT))
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

--SYLSRPBlP6/+v9ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRrnZAAKCRB4tDGHoIJi
0rnYAQD9/jYl/+fphuw2h0kiG9Z1LspiEKosmOGizXnCtmN9WgEA9fDieegSDRMf
Ar9Gc2GJDI6iGkOl3hmvkGnqUCm6NQM=
=rHWi
-----END PGP SIGNATURE-----

--SYLSRPBlP6/+v9ud--


--===============8682708186324570146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8682708186324570146==--

