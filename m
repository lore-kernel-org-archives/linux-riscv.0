Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0216FC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWj3q3Fuk8gvhqQpchyU4JPgpBr2VH7ggZI0yRVdh1I=; b=geykXedlnloSB4Ho0QwxqxjrOz
	hhyQO7oBYXwu+smpkmYkYXULtl9goCG32FtumMed7C/eUef3zjNS4kwfiFPQGUp6jDKP9INyUG1l+
	SuQ3Q+ILqhx3/aSk8TbRy6mfHJHHDmvn3l8WovZWRxRsTV4BbRtego2iUmwD+P5uQWmg2nvDFQlkI
	7oVtPGYOFGrFp+oOq5Ye8KFbbCQgkremQeKl2Ate28zyee9orgxlNozhY9AjxaBqbD4d1HlKPWNk9
	HRpu4MmU7H9n4auGG0jzgSakYhd34hg2mt6dlC6PjUonyCtwHtgfE/1M78kmQmHceKP8WwKZ8CLs0
	lOy0pk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2zRj-009Sdx-DR; Wed, 07 Dec 2022 18:47:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2zRf-009SXm-SW
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 18:47:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EAF661BAC;
	Wed,  7 Dec 2022 18:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC77EC433C1;
	Wed,  7 Dec 2022 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670438822;
	bh=L4aRfX9vHhFSwfSseVsQJXYDXtD98EN7JxFVl/FBwFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t46gjwa7wOoYf/i2xPYa0uL2RES9yA8gH1VYmuKMTjCxqgSUnoewxKPA45L4N9n6n
	 5rVqDBaD4OgYgSSe/f8W8DrYz/f4HaLQO7WEYgql4LiOWLL2pPxTMPjahShBuCytpK
	 ttAHPFoFDk7uYdMA2zM9TMwJHhlNNavFIHX3/Jzom8jiYMvuCv0+vZlu4VI4uvrh34
	 hE3/1UdEoJ+Dv0I0x+wYDB9cijBMJ+aA4gkIbx4aa3qjpl0Qe/omvhjc7xBZSBfNI4
	 2v67HhkGW/EQQw1KvE0dha3OLAOFf3hCDp9P1pRoBNcvmCcjcskB6ZaD8KAaTxsDtj
	 5t0n6GCw4nkyQ==
Date: Wed, 7 Dec 2022 18:46:58 +0000
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, ajones@ventanamicro.com, alex@ghiti.fr,
	jszhang@kernel.org
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <Y5Dfog2HYhejuDX8@spud>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20221204141137.691790-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_104704_029854_E47F05C7 
X-CRM114-Status: GOOD (  35.70  )
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
Content-Type: multipart/mixed; boundary="===============6256302964484149345=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6256302964484149345==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M75zgfo051g+BeZ+"
Content-Disposition: inline


--M75zgfo051g+BeZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

Couple small remarks and questions for you.

On Sun, Dec 04, 2022 at 10:11:35PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>=20
> Add one alternative to enable/disable svnapot support, enable this static
> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> option is set. It will influence the behavior of has_svnapot. All code
> dependent on svnapot should make sure that has_svnapot return true firstl=
y.
>=20
> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> 64KB napot size is supported in spec, so some macros has only 64KB versio=
n.
>=20
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ef8d66de5f38..1d8477c0af7c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -395,6 +395,20 @@ config RISCV_ISA_C
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_SVNAPOT
> +	bool "SVNAPOT extension support"
> +	depends on 64BIT && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
> +	  and enable its usage.
> +
> +	  SVNAPOT extension helps to mark contiguous PTEs as a range
> +	  of contiguous virtual-to-physical translations, with a naturally
> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> +	  size.
> +
>  config RISCV_ISA_SVPBMT
>  	bool "SVPBMT extension support"
>  	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 4180312d2a70..beadb1126ed9 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -22,9 +22,10 @@
>  #define	ERRATA_THEAD_NUMBER 3
>  #endif
> =20
> -#define	CPUFEATURE_SVPBMT 0
> -#define	CPUFEATURE_ZICBOM 1
> -#define	CPUFEATURE_NUMBER 2
> +#define	CPUFEATURE_SVPBMT	0
> +#define	CPUFEATURE_ZICBOM	1
> +#define	CPUFEATURE_SVNAPOT	2
> +#define	CPUFEATURE_NUMBER	3
> =20
>  #ifdef __ASSEMBLY__
> =20
> @@ -156,6 +157,14 @@ asm volatile(ALTERNATIVE(						\
>  	: "=3Dr" (__ovl) :						\
>  	: "memory")
> =20
> +#define ALT_SVNAPOT(_val)						\
> +asm(ALTERNATIVE(							\
> +	"li %0, 0",							\
> +	"li %0, 1",							\
> +		0, CPUFEATURE_SVNAPOT, CONFIG_RISCV_ISA_SVNAPOT)	\
> +	: "=3Dr" (_val) :							\
> +	: "memory")
> +
>  #endif /* __ASSEMBLY__ */
> =20
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b22525290073..4cbc1f45ab26 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
>   */
>  enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
> +	RISCV_ISA_EXT_SVNAPOT,
>  	RISCV_ISA_EXT_SVPBMT,
>  	RISCV_ISA_EXT_ZICBOM,
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
> @@ -87,7 +88,6 @@ static __always_inline int riscv_isa_ext2key(int num)
>  {
>  	switch (num) {
>  	case RISCV_ISA_EXT_f:
> -		return RISCV_ISA_EXT_KEY_FPU;
>  	case RISCV_ISA_EXT_d:
>  		return RISCV_ISA_EXT_KEY_FPU;
>  	case RISCV_ISA_EXT_ZIHINTPAUSE:
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index ac70b0fd9a9a..349fad5e35de 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -16,11 +16,6 @@
>  #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK	(~(PAGE_SIZE - 1))
> =20
> -#ifdef CONFIG_64BIT
> -#define HUGE_MAX_HSTATE		2
> -#else
> -#define HUGE_MAX_HSTATE		1
> -#endif
>  #define HPAGE_SHIFT		PMD_SHIFT
>  #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
>  #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm=
/pgtable-64.h
> index dc42375c2357..9611833907ec 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -74,6 +74,40 @@ typedef struct {
>   */
>  #define _PAGE_PFN_MASK  GENMASK(53, 10)
> =20
> +/*
> + * [63] Svnapot definitions:
> + * 0 Svnapot disabled
> + * 1 Svnapot enabled
> + */
> +#define _PAGE_NAPOT_SHIFT	63
> +#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
> +/*
> + * Only 64KB (order 4) napot ptes supported.
> + */
> +#define NAPOT_CONT_ORDER_BASE 4
> +enum napot_cont_order {
> +	NAPOT_CONT64KB_ORDER =3D NAPOT_CONT_ORDER_BASE,
> +	NAPOT_ORDER_MAX,
> +};
> +
> +#define for_each_napot_order(order)						\
> +	for (order =3D NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
> +#define for_each_napot_order_rev(order)						\

Would it be terrible to do s/rev/reverse to make things more obvious?

> +	for (order =3D NAPOT_ORDER_MAX - 1;					\
> +	     order >=3D NAPOT_CONT_ORDER_BASE; order--)
> +#define napot_cont_order(val)	(__builtin_ctzl((val.pte >> _PAGE_PFN_SHIF=
T) << 1))
> +
> +#define napot_cont_shift(order)	((order) + PAGE_SHIFT)
> +#define napot_cont_size(order)	BIT(napot_cont_shift(order))
> +#define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
> +#define napot_pte_num(order)	BIT(order)
> +
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
> +#else
> +#define HUGE_MAX_HSTATE		2
> +#endif

This is coming from a place of *complete* ignorance:
If CONFIG_RISCV_ISA_SVNAPOT is enabled in the kernel but there is no
support for it on a platform is it okay to change the value of
HUGE_MAX_HSTATE? Apologies if I've missed something obvious.

> +
>  /*
>   * [62:61] Svpbmt Memory Type definitions:
>   *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index c61ae83aadee..99957b1270f2 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -6,10 +6,12 @@
>  #ifndef _ASM_RISCV_PGTABLE_H
>  #define _ASM_RISCV_PGTABLE_H
> =20
> +#include <linux/jump_label.h>
>  #include <linux/mmzone.h>
>  #include <linux/sizes.h>
> =20
>  #include <asm/pgtable-bits.h>
> +#include <asm/hwcap.h>
> =20
>  #ifndef CONFIG_MMU
>  #define KERNEL_LINK_ADDR	PAGE_OFFSET
> @@ -264,10 +266,49 @@ static inline pte_t pud_pte(pud_t pud)
>  	return __pte(pud_val(pud));
>  }
> =20
> +static __always_inline bool has_svnapot(void)
> +{
> +	unsigned int _val;
> +
> +	ALT_SVNAPOT(_val);
> +
> +	return _val;
> +}
> +
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +
> +static inline unsigned long pte_napot(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_NAPOT;
> +}
> +
> +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
> +{
> +	int pos =3D order - 1 + _PAGE_PFN_SHIFT;
> +	unsigned long napot_bit =3D BIT(pos);
> +	unsigned long napot_mask =3D ~GENMASK(pos, _PAGE_PFN_SHIFT);
> +
> +	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
> +}
> +
> +#else
> +
> +static inline unsigned long pte_napot(pte_t pte)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
> +
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> -	return __page_val_to_pfn(pte_val(pte));
> +	unsigned long res  =3D __page_val_to_pfn(pte_val(pte));

nit: extra space before the =3D

> +
> +	if (has_svnapot() && pte_napot(pte))
> +		res =3D res & (res - 1UL);
> +
> +	return res;
>  }
> =20
>  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index bf9dd6764bad..88495f5fcafd 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -165,6 +165,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] =3D {
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 694267d1fe81..eeed66c3d497 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -205,6 +205,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> @@ -252,6 +253,17 @@ void __init riscv_fill_hwcap(void)
>  }
> =20
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> +static bool __init_or_module cpufeature_probe_svnapot(unsigned int stage)
> +{
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVNAPOT))
> +		return false;
> +
> +	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return false;
> +
> +	return riscv_isa_extension_available(NULL, SVNAPOT);
> +}
> +
>  static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>  {
>  	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
> @@ -289,6 +301,9 @@ static u32 __init_or_module cpufeature_probe(unsigned=
 int stage)
>  {
>  	u32 cpu_req_feature =3D 0;
> =20
> +	if (cpufeature_probe_svnapot(stage))
> +		cpu_req_feature |=3D BIT(CPUFEATURE_SVNAPOT);
> +
>  	if (cpufeature_probe_svpbmt(stage))
>  		cpu_req_feature |=3D BIT(CPUFEATURE_SVPBMT);
> =20

There's a bunch of stuff in this patch that may go away, depending on
sequencing just FYI. See [1] for more. I wouldn't rebase on top of that,
but just so that you're aware.

1 - https://patchwork.kernel.org/project/linux-riscv/cover/20221204174632.3=
677-1-jszhang@kernel.org/

--M75zgfo051g+BeZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5DfogAKCRB4tDGHoIJi
0v0JAQCtBpI6FRb6rvDvhO67R3SGCH06ZCJDgEQVw+Ij72W5HgD+NrYYEElJ+aIT
R8bilWCpzuniBhUfCneMGANBEERF6g0=
=dBeM
-----END PGP SIGNATURE-----

--M75zgfo051g+BeZ+--


--===============6256302964484149345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6256302964484149345==--

