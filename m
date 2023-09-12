Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B908CA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RugJIWDIOj4MGU3pHAy4pqJuDPW/TOZ2WUdVCURRZY=; b=hDT7u/ofysDlb156i5Mwqxs8ZY
	JB8SgovrGAw81ZUrEdx1+QMFyku6TKvHd5wMLGOLdz7h090SiJicufLJoVwiZAtjl9V83U24nXgYF
	Doon6ldxQ56BzTiS7uT+CUHscdCLJQFxLsX2vo92+ZCftGaSABucVC5dBqt55UXpG0o8k98v90VfU
	0EzMhFnEsrkOSeLxQfhpKgEyF0KuGisb4ENas7m2BvnIYdeE8VA2VkFHHsBGy/BeUJbw/5o/MKBc7
	4yilML2SOR7ueudVp9gE0INZN8QhHs8LSzyiKwDPZTKj+elNLvPYX4Rrk2fALd+o0S6z04jFbr5Yp
	sAco2ZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzEg-002e8V-29;
	Tue, 12 Sep 2023 08:59:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzEc-002e7T-1r
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 08:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694509142; x=1726045142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gZ+/RG3VQdIs7cWLmkyArGjG2nnII+xLnmx0oBz0Zfs=;
  b=E/u5K8XYiMiBo3+xx1dbujrI2tpSnayfuu4oVDNah0Lw/cG49GO+oAdZ
   H/Ntxt5SgDO2os6vfSORl0e0jhHMOqF9iRkUt2C12Hka7hYu6l5o3yv2a
   T79MPnAl56ITL7kAtFmEcjvnW6vMghCMJ/dMdV7hJ9DJy4kALbZSR+cjz
   ETD5tyIO1J2adoundpfL8NNtmg7gjQKoEolzoG0C/9OKIOaZL8p9Qj8rL
   zB6ZAbgdvwcCKAqiT1bjTHvspgoQV9baGtwlinCeTJq0pnTt8ADlh71AA
   iMGH40t8DWX/+QbOYXA2D9xg9RG2O/Egg+38YobKx3J4N3BfuAqj+q4SS
   A==;
X-CSE-ConnectionGUID: QpXiBCyFTuWcMsCHqIZZFg==
X-CSE-MsgGUID: sk8Qcr0lTPiGg6142dw8Xw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="asc'?scan'208";a="4339195"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2023 01:58:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 12 Sep 2023 01:58:58 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 12 Sep 2023 01:58:56 -0700
Date: Tue, 12 Sep 2023 09:58:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
Message-ID: <20230912-stitch-stellar-1d104840cdb8@wendy>
References: <20230912072740.2544-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230912072740.2544-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_015902_772853_DBCF7665 
X-CRM114-Status: GOOD (  28.77  )
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
Content-Type: multipart/mixed; boundary="===============7649306732897132993=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7649306732897132993==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="06XALobn8MFkJugE"
Content-Disposition: inline

--06XALobn8MFkJugE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Tue, Sep 12, 2023 at 03:27:40PM +0800, Jisheng Zhang wrote:
> Previously, we use alternative mechanism to dynamically patch
> the CMO operations for THEAD C906/C910 during boot for performance
> reason. But as pointed out by Arnd, "there is already a significant
> cost in accessing the invalidated cache lines afterwards, which is
> likely going to be much higher than the cost of an indirect branch".
> And indeed, there's no performance difference with GMAC and EMMC per
> my test on Sipeed Lichee Pi 4A board.

Cool, thanks for working on this.

> Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> the alternative code, and to acchieve Arnd's goal -- "I think
> moving the THEAD ops at the same level as all nonstandard operations
> makes sense, but I'd still leave CMO as an explicit fast path that
> avoids the indirect branch. This seems like the right thing to do both
> for readability and for platforms on which the indirect branch has a
> noticeable overhead."
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig.errata            |  1 +
>  arch/riscv/errata/thead/errata.c     | 76 +++++++++++++++++++++++++++-
>  arch/riscv/include/asm/errata_list.h | 50 +++---------------
>  3 files changed, 81 insertions(+), 46 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 566bcefeab50..d7972914f9de 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -78,6 +78,7 @@ config ERRATA_THEAD_CMO
>  	bool "Apply T-Head cache management errata"
>  	depends on ERRATA_THEAD && MMU
>  	select RISCV_DMA_NONCOHERENT
> +	select RISCV_NONSTANDARD_CACHE_OPS
>  	default y
>  	help
>  	  This will apply the cache management errata to handle the
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index 0554ed4bf087..1c320abfe446 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -12,8 +12,10 @@
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
> +#include <asm/dma-noncoherent.h>
>  #include <asm/errata_list.h>
>  #include <asm/hwprobe.h>
> +#include <asm/io.h>
>  #include <asm/patch.h>
>  #include <asm/vendorid_list.h>
> =20
> @@ -33,6 +35,75 @@ static bool errata_probe_pbmt(unsigned int stage,
>  	return false;
>  }
> =20
> +/*
> + * dcache.ipa rs1 (invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01010      rs1       000      00000  0001011
> + * dache.iva rs1 (invalida, virtual address)
> + *   0000001    00110      rs1       000      00000  0001011
> + *
> + * dcache.cpa rs1 (clean, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01001      rs1       000      00000  0001011
> + * dcache.cva rs1 (clean, virtual address)
> + *   0000001    00101      rs1       000      00000  0001011
> + *
> + * dcache.cipa rs1 (clean then invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01011      rs1       000      00000  0001011
> + * dcache.civa rs1 (... virtual address)
> + *   0000001    00111      rs1       000      00000  0001011
> + *
> + * sync.s (make sure all cache operations finished)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000000    11001     00000      000      00000  0001011
> + */
> +#define THEAD_inval_A0	".long 0x0265000b"
> +#define THEAD_clean_A0	".long 0x0255000b"
> +#define THEAD_flush_A0	".long 0x0275000b"
> +#define THEAD_SYNC_S	".long 0x0190000b"
> +
> +#define THEAD_CMO_OP(_op, _start, _size, _cachesize)			\
> +asm volatile("mv a0, %1\n\t"						\
> +	     "j 2f\n\t"							\
> +	     "3:\n\t"							\
> +	     THEAD_##_op##_A0 "\n\t"					\
> +	     "add a0, a0, %0\n\t"					\
> +	     "2:\n\t"							\
> +	     "bltu a0, %2, 3b\n\t"					\
> +	     THEAD_SYNC_S						\
> +	     : : "r"(_cachesize),					\
> +		 "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
> +		 "r"((unsigned long)(_start) + (_size))			\
> +	     : "a0")
> +
> +static void thead_errata_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr =3D phys_to_virt(paddr);
> +
> +	THEAD_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static void thead_errata_cache_wback(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr =3D phys_to_virt(paddr);
> +
> +	THEAD_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static void thead_errata_cache_wback_inv(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr =3D phys_to_virt(paddr);
> +
> +	THEAD_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static const struct riscv_nonstd_cache_ops thead_errata_cmo_ops =3D {
> +	.wback =3D &thead_errata_cache_wback,
> +	.inv =3D &thead_errata_cache_inv,
> +	.wback_inv =3D &thead_errata_cache_wback_inv,
> +};
> +
>  static bool errata_probe_cmo(unsigned int stage,
>  			     unsigned long arch_id, unsigned long impid)
>  {
> @@ -48,6 +119,8 @@ static bool errata_probe_cmo(unsigned int stage,
>  	if (stage =3D=3D RISCV_ALTERNATIVES_BOOT) {
>  		riscv_cbom_block_size =3D L1_CACHE_BYTES;
>  		riscv_noncoherent_supported();
> +		if (IS_ENABLED(CONFIG_RISCV_NONSTANDARD_CACHE_OPS))

This `if (IS_ENABLED())` seems unneeded - the function starts with:
	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
		return false;
so if we get to this point, the newly added if will always evaluate to
true AFAICT. Otherwise this looks good to me.

Thanks,
Conor.


> +			riscv_noncoherent_register_cache_ops(&thead_errata_cmo_ops);
>  	}
> =20
>  	return true;
> @@ -77,8 +150,7 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_pbmt(stage, archid, impid))
>  		cpu_req_errata |=3D BIT(ERRATA_THEAD_PBMT);
> =20
> -	if (errata_probe_cmo(stage, archid, impid))
> -		cpu_req_errata |=3D BIT(ERRATA_THEAD_CMO);
> +	errata_probe_cmo(stage, archid, impid);
> =20
>  	if (errata_probe_pmu(stage, archid, impid))
>  		cpu_req_errata |=3D BIT(ERRATA_THEAD_PMU);
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index b55b434f0059..ea33288f8a25 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -24,9 +24,8 @@
> =20
>  #ifdef CONFIG_ERRATA_THEAD
>  #define	ERRATA_THEAD_PBMT 0
> -#define	ERRATA_THEAD_CMO 1
> -#define	ERRATA_THEAD_PMU 2
> -#define	ERRATA_THEAD_NUMBER 3
> +#define	ERRATA_THEAD_PMU 1
> +#define	ERRATA_THEAD_NUMBER 2
>  #endif
> =20
>  #ifdef __ASSEMBLY__
> @@ -94,54 +93,17 @@ asm volatile(ALTERNATIVE(						\
>  #define ALT_THEAD_PMA(_val)
>  #endif
> =20
> -/*
> - * dcache.ipa rs1 (invalidate, physical address)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000001    01010      rs1       000      00000  0001011
> - * dache.iva rs1 (invalida, virtual address)
> - *   0000001    00110      rs1       000      00000  0001011
> - *
> - * dcache.cpa rs1 (clean, physical address)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000001    01001      rs1       000      00000  0001011
> - * dcache.cva rs1 (clean, virtual address)
> - *   0000001    00101      rs1       000      00000  0001011
> - *
> - * dcache.cipa rs1 (clean then invalidate, physical address)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000001    01011      rs1       000      00000  0001011
> - * dcache.civa rs1 (... virtual address)
> - *   0000001    00111      rs1       000      00000  0001011
> - *
> - * sync.s (make sure all cache operations finished)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000000    11001     00000      000      00000  0001011
> - */
> -#define THEAD_inval_A0	".long 0x0265000b"
> -#define THEAD_clean_A0	".long 0x0255000b"
> -#define THEAD_flush_A0	".long 0x0275000b"
> -#define THEAD_SYNC_S	".long 0x0190000b"
> -
>  #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
> -asm volatile(ALTERNATIVE_2(						\
> -	__nops(6),							\
> +asm volatile(ALTERNATIVE(						\
> +	__nops(5),							\
>  	"mv a0, %1\n\t"							\
>  	"j 2f\n\t"							\
>  	"3:\n\t"							\
>  	CBO_##_op(a0)							\
>  	"add a0, a0, %0\n\t"						\
>  	"2:\n\t"							\
> -	"bltu a0, %2, 3b\n\t"						\
> -	"nop", 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
> -	"mv a0, %1\n\t"							\
> -	"j 2f\n\t"							\
> -	"3:\n\t"							\
> -	THEAD_##_op##_A0 "\n\t"						\
> -	"add a0, a0, %0\n\t"						\
> -	"2:\n\t"							\
> -	"bltu a0, %2, 3b\n\t"						\
> -	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
> -			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
> +	"bltu a0, %2, 3b\n\t",						\
> +	0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM)		\
>  	: : "r"(_cachesize),						\
>  	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
>  	    "r"((unsigned long)(_start) + (_size))			\
> --=20
> 2.40.1
>=20

--06XALobn8MFkJugE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQAoQAAKCRB4tDGHoIJi
0kkuAQCmgIs2Sekfo3CDFkFfajbr0GCKCpnLwIZyIvEmYSFqqgD/RjrNdxQ4qjMF
p+Nzoz+EPDszyBOpnyLKUB+HQdZxcgQ=
=rLET
-----END PGP SIGNATURE-----

--06XALobn8MFkJugE--


--===============7649306732897132993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7649306732897132993==--

