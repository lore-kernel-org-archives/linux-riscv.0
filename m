Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5988C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHnoioWzblNmZNw6/HvqkAG4zbnNsXgCYDE9YQF/CMo=; b=yJMvjjS4MYH8DvKVfxKDCCTaBR
	TF0IemLZoIBNCQuUfynmE0KSSYx+yItklgiloKHqlnvNaHGKiC7P0cFP8CelMBAHfGgZTR3KyxMRC
	l9c5U1MsiOjBvPfi+vpSiUGqCJSJRGXn1sEcRk2rZxeC7wUcx3NBfPc/fOnDkgDeznEiNylnNtxtc
	tICyfpsRbcbyKThaEAhHk5AO0OjHNWlIJq0q4DU5GSLhfY4A+p7CpIjYAW9iPfAysN7dP7GHMN5ba
	4fM6+4bvw73Q8a/awV0hHcq4O6rUMFN6W5jCPmMc1/Sks4/oGcI5c21T/mwKiHufimAQOiLFJCcWI
	eedWMGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aol-00AFoN-2O;
	Mon, 29 May 2023 11:13:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aoi-00AFnT-0K
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 11:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685358816; x=1716894816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8a8bLWcWa4E6Z5SMzPm8KuTfSTZ7L4/MciWyy2gXm34=;
  b=xYXhc4Q8JZF75cPXrv9+AEivJi2cZR0TY/uVmbFSb2cgCgnhJx8gvKex
   ad0wYozzMBT4izM2KIC9dBpU2fdQZE72SpOLdJ792X+rSVh08MHId31R1
   /jY0T0wFVBtNXLv6/a159UoZGTVqFUKoxuXwqd+Apm/xLVTkqPB+hK5rH
   03d3fqEIkcJe1vpBGBT7vu+Qrw3GelhZ6U9uSuxPKASCFPBbXqY4ooHEi
   +0eohyKZ+yCo/BfzQmU2Qb9Mk5OXuSKy0ZhNQ92m2U/zqj2g2jiesb1n4
   JCFRfegDuqT/iXYAScdH52B859O9L44OzZU5S5w6W86ygGvVXOH0Axrrv
   w==;
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="asc'?scan'208";a="227432476"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 04:13:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 04:13:34 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 04:13:33 -0700
Date: Mon, 29 May 2023 12:13:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 4/6] riscv: mm: pass noncoherent or not to
 riscv_noncoherent_supported()
Message-ID: <20230529-gainfully-ribbon-48520d25ef6e@wendy>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230526165958.908-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_041336_268773_19890B4A 
X-CRM114-Status: GOOD (  25.23  )
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
Content-Type: multipart/mixed; boundary="===============2619722412041228065=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2619722412041228065==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LdIjfd9IkuqYWybD"
Content-Disposition: inline

--LdIjfd9IkuqYWybD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Sat, May 27, 2023 at 12:59:56AM +0800, Jisheng Zhang wrote:
> We will soon take different actions by checking the HW is noncoherent
> or not, I.E ZICBOM/ERRATA_THEAD_CMO or not.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/errata/thead/errata.c    | 19 +++++++++++--------
>  arch/riscv/include/asm/cacheflush.h |  4 ++--
>  arch/riscv/kernel/setup.c           |  6 +++++-
>  arch/riscv/mm/dma-noncoherent.c     | 10 ++++++----
>  4 files changed, 24 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index be84b14f0118..c192b80a5166 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -36,21 +36,24 @@ static bool errata_probe_pbmt(unsigned int stage,
>  static bool errata_probe_cmo(unsigned int stage,
>  			     unsigned long arch_id, unsigned long impid)
>  {
> -	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
> -		return false;
> -
> -	if (arch_id !=3D 0 || impid !=3D 0)
> -		return false;
> +	bool cmo;
> =20
>  	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
>  		return false;
> =20
> +	if (IS_ENABLED(CONFIG_ERRATA_THEAD_CMO) &&
> +	    (arch_id =3D=3D 0 && impid =3D=3D 0))
> +		cmo =3D true;
> +	else
> +		cmo =3D false;
> +
>  	if (stage =3D=3D RISCV_ALTERNATIVES_BOOT) {
> -		riscv_cbom_block_size =3D L1_CACHE_BYTES;
> -		riscv_noncoherent_supported();
> +		if (cmo)
> +			riscv_cbom_block_size =3D L1_CACHE_BYTES;
> +		riscv_noncoherent_supported(cmo);
>  	}
> =20
> -	return true;
> +	return cmo;

I don't really understand the changes that you are making to this
function, so that is tries really hard to call
riscv_noncoherent_supported(). Why do we need to always call the function
in the erratum's probe function, if the erratum is not detected, given
that riscv_noncoherent_supported() is called immediately after
apply_boot_alternatives() in setup_arch()?

>  }
> =20
>  static bool errata_probe_pmu(unsigned int stage,
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index 8091b8bf4883..9d056c9b625a 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -54,9 +54,9 @@ extern unsigned int riscv_cboz_block_size;
>  void riscv_init_cbo_blocksizes(void);
> =20
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> -void riscv_noncoherent_supported(void);
> +void riscv_noncoherent_supported(bool cmo);

I think it would "read better" if you renamed this variable to
"have_cmo".

>  #else
> -static inline void riscv_noncoherent_supported(void) {}
> +static inline void riscv_noncoherent_supported(bool cmo) {}
>  #endif
> =20
>  /*
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 36b026057503..565f3e20169b 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -264,6 +264,7 @@ static void __init parse_dtb(void)
> =20
>  void __init setup_arch(char **cmdline_p)
>  {
> +	bool cmo;
>  	parse_dtb();
>  	setup_initial_init_mm(_stext, _etext, _edata, _end);
> =20
> @@ -298,7 +299,10 @@ void __init setup_arch(char **cmdline_p)
>  	apply_boot_alternatives();
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>  	    riscv_isa_extension_available(NULL, ZICBOM))
> -		riscv_noncoherent_supported();
> +		cmo =3D true;
> +	else
> +		cmo =3D false;
> +	riscv_noncoherent_supported(cmo);

As a nit, could you put a newline before the call to
riscv_noncoherent_supported()?

>  }
> =20
>  static int __init topology_init(void)
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d51a75864e53..0e172e2b4751 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -72,9 +72,11 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_ba=
se, u64 size,
>  	dev->dma_coherent =3D coherent;
>  }
> =20
> -void riscv_noncoherent_supported(void)
> +void riscv_noncoherent_supported(bool cmo)
>  {
> -	WARN(!riscv_cbom_block_size,
> -	     "Non-coherent DMA support enabled without a block size\n");
> -	noncoherent_supported =3D true;
> +	if (cmo) {
> +		WARN(!riscv_cbom_block_size,
> +		     "Non-coherent DMA support enabled without a block size\n");
> +		noncoherent_supported =3D true;
> +	}

The other places that we do a WARN() because of screwed up devicetrees
for CMO things, we do a WARN_TAINT(CPU_OUT_OF_SPEC). Should we do the
same here too?

Cheers,
Conor.

--LdIjfd9IkuqYWybD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHSIxgAKCRB4tDGHoIJi
0r2zAP4/o/UdOXXE7NUjsPH3algfaH5WPaPWMlf34Kf0XaUz6gEAiUjI+hLqacnX
ZCETuX7h2+mM54YLt6LmbMmincPwBgA=
=jVix
-----END PGP SIGNATURE-----

--LdIjfd9IkuqYWybD--


--===============2619722412041228065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2619722412041228065==--

