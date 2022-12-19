Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F70C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 21:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iviHmlvvZkq3ue93rpQTd6q2QhraQcjjGZJ2Zq1ePk4=; b=jE200PdCfGiwvGg7TJUQX++upi
	oj9gGI4LbGAkHjeiD0wo1nqdzDasg7Qf2cA6C3Hfx3QZe0dVtM29TKrXsEBHFfeT/HV5Ez9GcoBq4
	gMaUDERF2MczdvrQd0TRvOASKzxk8/4yk9dQOWfU8HsSDxoaWXstyDkdPlYXSF7TVy1O9w/22OkhO
	pU2SDMV5E6DvEWx0lpCzOzyxRCoD3drgsxqr0qu0XUkcSK2WsvEkKKeL9bEDx84CTFGYxFDq6ff3P
	6i87Swq4+Uxi5sBiLSLLO+xXMrJpEzy/cGgSujlc998+mQN1lCPIBmk8RkjrMPhkbcSeq6HKxVWXr
	ZiVessIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7O2t-0047pS-Q8; Mon, 19 Dec 2022 21:51:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7O2p-0047lg-EU
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 21:51:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C97660FE8;
	Mon, 19 Dec 2022 21:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDEDC433EF;
	Mon, 19 Dec 2022 21:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671486693;
	bh=r6vexP9cBEubqaTFASLG5qYMxUE+e981iUzIc1jSx9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdlsHg7RCF4xEXuPlMXNwDoSioyPLmy8cZ4f4Cq81gnRIYshSCSq1HEKnAMsg0cTU
	 /4W9ICEPiT0prdbX+gic/+i8gfIpkGqfvmx/guaGAd4oAYsNS5jzvhA6AQraMEUgV6
	 OWL4GOHt+RxujlFGLSs28RtIQkQiJxBTpDBFKvggAyUaIcT7syur0nzj2d7KcAQM5c
	 p4z+LbWWuv2rOdu3CL3tjl80nB6ABDU1NJhxGqwscaTNOBD1o5Qs0/7GzqXuHIx+lD
	 jS8VVh7aEAK2+Pljx9uDP5WPzH/CzE84v/S6SvMnz6OVlx/dejyeeayq9A16W0BJdf
	 DtdWD7+ZKM42w==
Date: Mon, 19 Dec 2022 21:51:29 +0000
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, ajones@ventanamicro.com
Subject: Re: [PATCH v11 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <Y6Dc4XNQmKtTsXom@spud>
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
 <20221216062109.865573-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20221216062109.865573-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_135135_611983_6DA06987 
X-CRM114-Status: GOOD (  35.64  )
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
Content-Type: multipart/mixed; boundary="===============4646148596845335475=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4646148596845335475==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TmqVLg+blMOTBN9P"
Content-Disposition: inline


--TmqVLg+blMOTBN9P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 02:21:07PM +0800, panqinglin2020@iscas.ac.cn wrote:
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
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e1a9fa47f012..25c230e3bf61 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -397,6 +397,25 @@ config RISCV_ISA_C
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_SVNAPOT
> +	bool "SVNAPOT extension support"
> +	depends on 64BIT && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
> +	  time and enable its usage.
> +
> +	  The SVNAPOT extension is used to mark contiguous PTEs as a range
> +	  of contiguous virtual-to-physical translations for a naturally
> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> +	  size. When HUGETLBFS is also selected this option unconditionally
> +	  allocates some memory for each NAPOT page size supported by the kerne=
l.
> +	  When optimizing for low memory consumption and for platforms without

nit: Does this make more sense as "When optimising for low memory
consumption on platforms without the SVNAPOT extension"...?
Or does disabling Svnapot save memory on Svnapot capable systems too?

Thanks,
Conor.

> +	  the SVNAPOT extension, it may be better to say N here.
> +
> +	  If you don't know what to do here, say Y.
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
> index 86328e3acb02..a8f1a390b1a4 100644
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
> @@ -88,7 +89,6 @@ static __always_inline int riscv_isa_ext2key(int num)
>  {
>  	switch (num) {
>  	case RISCV_ISA_EXT_f:
> -		return RISCV_ISA_EXT_KEY_FPU;
>  	case RISCV_ISA_EXT_d:
>  		return RISCV_ISA_EXT_KEY_FPU;
>  	case RISCV_ISA_EXT_ZIHINTPAUSE:
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 9f432c1b5289..24a3dd265183 100644
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
> index 42a042c0e13e..7a5097202e15 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -78,6 +78,40 @@ typedef struct {
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
> +
>  /*
>   * [62:61] Svpbmt Memory Type definitions:
>   *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 2359f1f9bda9..07213236b976 100644
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
> index 93e45560af30..60ebe2f22112 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -228,6 +228,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> @@ -275,6 +276,17 @@ void __init riscv_fill_hwcap(void)
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
> @@ -312,6 +324,9 @@ static u32 __init_or_module cpufeature_probe(unsigned=
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
> --=20
> 2.37.4
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--TmqVLg+blMOTBN9P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6Dc4QAKCRB4tDGHoIJi
0mnpAP90jZ6ZgC2ZBoPDPLXxFChrf816s9ellvvzUT4nAmHRnwD+N8eQ8Qhh/J2g
bOA9siGRajY7fVF+tYhRTR4Vb5H21g4=
=k9Pz
-----END PGP SIGNATURE-----

--TmqVLg+blMOTBN9P--


--===============4646148596845335475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4646148596845335475==--

