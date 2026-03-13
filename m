Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EAB105F7A6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPSq8JZD/RXQw6YR4/HP2yTMnQGbYeuV89A4CQn1bho=; b=ChaHjpQ8fkGpGXaAUQiiRDTK6p
	+K5KCmuKIOJSmyuf7FbToBNjiK3pqFjbqamYNp3rvBLwh8PDLrPjFbrJM+fTPovym7PvjxZpDBicu
	QynKBUiopSR9Wyf3OAPZ4MAsINPAGaDR3jl5Jw/ywNBnjhf2wjUjBvF7K6hnPC6lBUEvjX5SmCBHL
	sMbkGVJTcf+eL5jOCDm3FiHFW4bpgmsTzIW9AZSE6qWctiiQdPK+7oy98BsCB3n+dfmvnhEWh6waJ
	VRJrilpWVbhqBwFOdUKP7wJzOZvj+HxV3g7inSDnCeYLFFpCG0tmstLJE/Pacgj9pi0pBlfE31yP/
	W1+qm8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Uw-00000000Dmv-0JdG;
	Fri, 13 Mar 2026 13:24:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Ut-00000000DmO-0QuV
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF4FF4189E;
	Fri, 13 Mar 2026 13:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6FEC2BCB1;
	Fri, 13 Mar 2026 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408249;
	bh=lNKkA2IKM/YFts+spUswfNDsSFiQO6FSzxl2rWD4PJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBLxQkoZ6wTZZdVFTQsglpZ4lFPXMi5abtj8Ay4jfolQbp0VG/jG2DxeAU5wwjC/H
	 Jm+WD57+R+NBxwNzQWGOGiU1yEToQnOVnSk3ANUDM/dI22QuvEcJFf4n2lGwHGSF4T
	 9y0uYj0y34WgJ8PuU8fAt+JhjO8j63PUdHDPGoDA5wrwBXFDyxsQJ3UbHcju1/n8UV
	 PMPDl7r6PsVhFdeSKg1F2QPgZpikUOxaM5VxUXyG8lPSSaEutCL+odIgTaWdzwspRQ
	 pfFlzHQpFam0Ph7F+1iY3LiDIL0fJzPFRf+Um0IbdWbYRDUkBqiF9BkRHRZfSFtddJ
	 K0FjRAuLR5O+A==
Date: Fri, 13 Mar 2026 13:24:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of
 Svpbmt "XPbmtUC"
Message-ID: <20260313-visitor-majestic-1a6888dc57b2@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260313084407.29669-2-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062411_212035_C4E2AEB7 
X-CRM114-Status: GOOD (  42.49  )
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
Content-Type: multipart/mixed; boundary="===============8883485368252824530=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8883485368252824530==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VanPv3+K5gjvwz1N"
Content-Disposition: inline


--VanPv3+K5gjvwz1N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Gonna offer some feedback on the detail of what's been done in this
series, without providing any commentary on whether this is the correct
approach to take.

On Fri, Mar 13, 2026 at 01:44:02AM -0700, Bo Gan wrote:
> On platforms that doesn't support Svpbmt or XTheadMae, SoC vendors
> sometimes map the system memory twice in physical address space, one
> as cached, and the other as uncached. Through the uncached window,
> device drivers will be able to map DMA buffer for noncoherent devices.
> Such setup is usually found in SoC with pre-Svpbmt Sifive cores.
> Make use of such feature by modeling it as "XPbmtUC", a customized
> version of Svpbmt, where a single bit in PTE is used for UC control.
> There's no IO bit with such scheme, as it's assumed that the PMA
> (usually hard-wired on these SoCs) will properly convey the strongly-
> ordered, non-idempotent attribute of the MMIO region.
>=20
> The enablement of such position of "XPbmtUC" is controlled by the
> device-tree property "riscv,xpbmt-uncache-bit".

Firstly, the naming generally I take some exception to. If this is some
fake vendor extension for linux purposes, it needs to have "xlinux" in
it, like our xlinuxenvcfg does. It should also be consistent, don't use
"xpmbtuc" and "xpbmt-uncache-bit", pick one and stick to it.

Athough, I think I disagree fundamentally with this property, as it seems
to me like "software configuration" that shouldn't be permitted in
devicetree. Maybe I am misunderstanding, but the numbers you chose are
convenient, not set in stone by the specific hardware, right?

I'd be much more comfortable with adding xlinuxwhatever to
riscv,isa-extensions, to signal that a soc supports this stuff than with
a property for the bit itself. I suppose that bit information could then
come from a LUT in the vendor extensions, that a validate callback could
check (via root compatible) before enabling. There's not a super neat
way to do that at the moment though I don't think, code currently
expects that vendor extensions are in a different "namespace" to
standard ones, and this would blur the lines because it's not from a
specific vendor, nor is it a standard extension.
I guess, it could be done by keeping it as a standard number, but then
it's a bit trickier to neatly access the LUT while keeping it split
apart.
I know this means having to modify the kernel if there's a new device,
but I'm inclined to say "deal with it" because they could've done
something standard and opted not to.

Could also argue that this should be shoved into a sifive specific
thing, but I don't expect that they're the only ones with devices like
this that could benefit.

>=20
> Example:
>=20
> Starfive JH7110 (Sifive U74):
>            [0x0,   0x40000000) Low MMIO
>     [0x40000000, 0x2_40000000) Cached Mem
>   [0x4_40000000, 0x6_40000000) Uncached Mem UC+
>   [0x9_00000000, 0x9_d0000000) High MMIO
>=20
> Device-tree:
>   riscv,xpbmt-uncache-bit =3D <32>;
>=20
> Use PTE bit 32 (PPN bit 34) as UC (uncache) control to perfectly
> match the memory map of the SoC.
>=20
> ESWIN EIC770X (Sifive U84/P550):
>            [0x0,    0x20000000) Core Internal
>     [0x20000000,    0x40000000) Core Internal (Die 1)
>     [0x40000000,    0x60000000) Low MMIO
>     [0x60000000,    0x80000000) Low MMIO (Die 1)
>     [0x80000000, 0x10_80000000) Cached Mem
>  [0x20_00000000, 0x30_00000000) Cached Mem (Die 1)
>  [0x80_00000000, 0xa0_00000000) High MMIO
>  [0xa0_00000000, 0xc0_00000000) High MMIO (Die 1)
>  [0xc0_00000000, 0xd0_00000000) Uncached Mem
>  [0xe0_00000000, 0xf0_00000000) Uncached Mem (Die 1)
>=20
> EIC770X is not directly compatible to this model, as the uncached
> regions are offsetted, and the offset is different among the Dies
> in the dual-die version (EIC7702). so we expect the firmware to
> provide a thin layer of hypervisor to transparently re-map:
>=20
>     [0x80000000,  0x10_80000000) Cached Mem
>  [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
>  [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
>  [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
> [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
> [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'
>=20
> With that, the firmware/bootloader can set the following at boot:
>   riscv,xpbmt-uncache-bit =3D <38>;
>=20
> Signed-off-by: Bo Gan <ganboing@gmail.com>
> ---
>  arch/riscv/Kconfig                  | 12 ++++++++++++
>  arch/riscv/include/asm/hwcap.h      |  1 +
>  arch/riscv/include/asm/pgtable-64.h |  8 ++++++++
>  arch/riscv/kernel/cpufeature.c      |  8 ++++++++
>  arch/riscv/mm/pgtable.c             |  7 +++++++
>  5 files changed, 36 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6b39f37f769a2..f2b4da6a3deb1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -893,6 +893,18 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
>  	  versions of clang and GCC to be passed to GAS, which has the same res=
ult
>  	  as passing zicsr and zifencei to -march.
> =20
> +config RISCV_ISA_XPBMTUC
> +	bool "Support XPbmtUC (customized pbmt uncache bit)"
> +	depends on 64BIT && MMU
> +	depends on RISCV_ALTERNATIVE
> +	default n
> +	select DMA_DIRECT_REMAP
> +	help
> +	  Add support for "riscv,xpbmt-uncache-bit" device-tree property.
> +	  The bit denotes the bit in PTE that marks the page as uncached.
> +
> +	  If you don't know what to do here, say N.
> +
>  config FPU
>  	bool "FPU support"
>  	default y
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 4369a23385413..6baa6566cf4cc 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -111,6 +111,7 @@
>  #define RISCV_ISA_EXT_ZILSD		102
>  #define RISCV_ISA_EXT_ZCLSD		103
> =20
> +#define RISCV_ISA_EXT_XPBMTUC		126
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
>  #define RISCV_ISA_EXT_MAX		128
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm=
/pgtable-64.h
> index 6e789fa58514c..1a6d04884111d 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -140,6 +140,14 @@ enum napot_cont_order {
>  #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
>  #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 5=
9))
> =20
> +#ifdef CONFIG_RISCV_ISA_XPBMTUC
> +extern int riscv_xpbmtuc_bit;
> +extern u64 riscv_xpbmtuc_mask;
> +#endif
> +
> +#define XPBMTUC_HAS_PAGE_NOCACHE CONFIG_RISCV_ISA_XPBMTUC
> +#define XPBMTUC_HAS_PAGE_MTMASK  CONFIG_RISCV_ISA_XPBMTUC
> +
>  static inline u64 riscv_page_mtmask(void)
>  {
>  	u64 val;
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index fa591aff9d335..faec169004b4a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -1118,6 +1118,14 @@ void __init riscv_fill_hwcap(void)
>  		riscv_v_setup_vsize();
>  	}
> =20
> +#ifdef CONFIG_RISCV_ISA_XPBMTUC

Code like this needs to be unconditionally compiled.

> +	if (!of_property_read_u32(of_root, "riscv,xpbmt-uncache-bit",
> +				  &riscv_xpbmtuc_bit)) {
> +		riscv_xpbmtuc_mask =3D 1UL << riscv_xpbmtuc_bit;
> +		set_bit(RISCV_ISA_EXT_XPBMTUC, riscv_isa);
> +		pr_info("Using XPbmtUC bit=3D%d\n", riscv_xpbmtuc_bit);
> +	}
> +#endif
>  	memset(print_str, 0, sizeof(print_str));
>  	for (i =3D 0, j =3D 0; i < NUM_ALPHA_EXTS; i++)
>  		if (riscv_isa[0] & BIT_MASK(i))
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> index 807c0a0de1827..4ca442bc8595d 100644
> --- a/arch/riscv/mm/pgtable.c
> +++ b/arch/riscv/mm/pgtable.c
> @@ -5,6 +5,13 @@
>  #include <linux/kernel.h>
>  #include <linux/pgtable.h>
> =20
> +#ifdef CONFIG_RISCV_ISA_XPBMTUC
> +int riscv_xpbmtuc_bit;
> +
> +u64 riscv_xpbmtuc_mask;
> +EXPORT_SYMBOL(riscv_xpbmtuc_mask);
> +#endif
> +
>  int ptep_set_access_flags(struct vm_area_struct *vma,
>  			  unsigned long address, pte_t *ptep,
>  			  pte_t entry, int dirty)
> --=20
> 2.34.1
>=20

--VanPv3+K5gjvwz1N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQP9AAKCRB4tDGHoIJi
0vB+AQDGHQys/cD41N40x9XoDUOvC0CUkoia1aGMBiGUAVkRogEAy1WoJGR6ePHr
ET62pB957qO81+1RNUs9j9QSS4MM3QQ=
=tjV9
-----END PGP SIGNATURE-----

--VanPv3+K5gjvwz1N--


--===============8883485368252824530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8883485368252824530==--

