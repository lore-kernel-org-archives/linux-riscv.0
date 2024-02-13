Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E2C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq3cpOBhcvlPIy3yA4rLWXPfbE/oQmoRjRm9Bz+Ba9Q=; b=gtUDThchEuytfzq2T5BEzrvUIE
	rlrmQzEcbPKIoZy1Oy64fL8fIruPcYCSkQjfDxSx9FkE09NSSnFSM6NRnDRQfv/xLs7xO4GuEJYLV
	qUcv2i/kqFYfuKAy54NY2HB7tOVDcqqbutd+Y5DvC2wng1Tk5Z/BUIqT1uh08yGejv212ojKK0Hns
	gj4nk+UiZltl7TzA80nYkdYxRxbcsGpmtztyDy7lB7dyBwh5cxIleYtl8gdyWeidAq5ZnMg+FKwCp
	ZG9IF6CZVY1fKE+d0zSEpwAjvxRTVxX5Lhhh5Yrn/X/JuQtiw+jgid+x8AwbRet+De5dmnvPuSlCs
	s5M1q/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxCH-0000000AGcV-2ljX;
	Tue, 13 Feb 2024 18:07:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxCF-0000000AGc4-10iV
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 18:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11E9761627;
	Tue, 13 Feb 2024 18:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D4AC433C7;
	Tue, 13 Feb 2024 18:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707847671;
	bh=HnDwSNeITfZAoSGDBaUlH072w267+77KHOXAmmBVZrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eL3O0KrvOFjYX838nsO2Hl5O82NKygqlfY7EWs5mXUPvckXPZbVDzGGR3GforFDWB
	 FRHlMW4gxjZFzQb/IGqmo+iyxqEuyrsKPHwNwlHwPJTgPXg638dvntiEtT6P+ZQ7be
	 IvyxNr/gQ8XpFod2ojl3NMsa1t1AtOdyy+JbEyCRmzZWNR+96MJuPTVl9JbRShyWk8
	 eyfV+VENV46DFDRd2sf1+FgYm7fN/Qxg/UPJMC3U8d/jvqbbt9ZSTuvCtQBlBFTgT+
	 Kl1oWReW0SdfTUpbOlig+FLSD8iq8CFI0FcD8pH3Jnqfd457bb4tgzCE+q4Qly7doc
	 bwoUcQGL60d/Q==
Date: Tue, 13 Feb 2024 18:07:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v2 3/4] riscv: Add ISA extension parsing for Sm
 and Ss
Message-ID: <20240213-dangle-taco-2742f6087a3e@spud>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-4-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240213033744.4069020-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_100755_411596_3E952A50 
X-CRM114-Status: GOOD (  32.75  )
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
Content-Type: multipart/mixed; boundary="===============1528013399296485517=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1528013399296485517==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GOvnA6XK3oSYaT7y"
Content-Disposition: inline


--GOvnA6XK3oSYaT7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 07:37:34PM -0800, Samuel Holland wrote:
> Previously, all extension version numbers were ignored. However, the
> version number is important for these two extensions. The simplest way
> to implement this is to use a separate bitmap bit for each supported
> version, with each successive version implying all of the previous ones.
> This allows alternatives and riscv_has_extension_[un]likely() to work
> naturally.
>=20
> To avoid duplicate extensions in /proc/cpuinfo, the new successor_id
> field allows hiding all but the newest implemented version of an
> extension.
>=20
> Cc: <stable@vger.kernel.org> # v6.7+
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
> Changes in v2:
>  - New patch for v2
>=20
>  arch/riscv/include/asm/cpufeature.h |  1 +
>  arch/riscv/include/asm/hwcap.h      |  8 ++++++
>  arch/riscv/kernel/cpu.c             |  5 ++++
>  arch/riscv/kernel/cpufeature.c      | 42 +++++++++++++++++++++++++----
>  4 files changed, 51 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 0bd11862b760..ac71384e7bc4 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -61,6 +61,7 @@ struct riscv_isa_ext_data {
>  	const char *property;
>  	const unsigned int *subset_ext_ids;
>  	const unsigned int subset_ext_size;
> +	const unsigned int successor_id;
>  };
> =20
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 5340f818746b..5b51aa1db15b 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,13 +80,21 @@
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
> +#define RISCV_ISA_EXT_SM1p11		74
> +#define RISCV_ISA_EXT_SM1p12		75
> +#define RISCV_ISA_EXT_SS1p11		76
> +#define RISCV_ISA_EXT_SS1p12		77
> =20
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> =20
>  #ifdef CONFIG_RISCV_M_MODE
> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SM1p11
> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SM1p12
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
>  #else
> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SS1p11
> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SS1p12
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
>  #endif
> =20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index d11d6320fb0d..2e6b90ed0d51 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -215,6 +215,11 @@ static void print_isa(struct seq_file *f, const unsi=
gned long *isa_bitmap)
>  		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
>  			continue;
> =20
> +		/* Only show the newest implemented version of an extension */
> +		if (riscv_isa_ext[i].successor_id !=3D RISCV_ISA_EXT_INVALID &&
> +		    __riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].succe=
ssor_id))
> +			continue;
> +
>  		/* Only multi-letter extensions are split by underscores */
>  		if (strnlen(riscv_isa_ext[i].name, 2) !=3D 1)
>  			seq_puts(f, "_");
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index c5b13f7dd482..8e10b50120e9 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -113,23 +113,29 @@ static bool riscv_isa_extension_check(int id)
>  	return true;
>  }
> =20
> -#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size)=
 {	\
> +#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size,=
 _successor) {	\
>  	.name =3D #_name,								\
>  	.property =3D #_name,							\
>  	.id =3D _id,								\
>  	.subset_ext_ids =3D _subset_exts,						\
> -	.subset_ext_size =3D _subset_exts_size					\
> +	.subset_ext_size =3D _subset_exts_size,					\
> +	.successor_id =3D _successor,						\
>  }
> =20
> -#define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id,=
 NULL, 0)
> +#define __RISCV_ISA_EXT_DATA(_name, _id) \
> +	_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, RISCV_ISA_EXT_INVALID)
> =20
>  /* Used to declare pure "lasso" extension (Zk for instance) */
>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
> -	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, ARRAY_=
SIZE(_bundled_exts))
> +	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, \
> +			    _bundled_exts, ARRAY_SIZE(_bundled_exts), RISCV_ISA_EXT_INVALID)
> =20
>  /* Used to declare extensions that are a superset of other extensions (Z=
vbb for instance) */
>  #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
> -	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts))
> +	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), RISCV=
_ISA_EXT_INVALID)
> +
> +#define __RISCV_ISA_EXT_VERSION(_name, _id, _preds, _preds_size, _succes=
sor) \
> +	_RISCV_ISA_EXT_DATA(_name, _id, _preds, _preds_size, _successor)
> =20
>  static const unsigned int riscv_zk_bundled_exts[] =3D {
>  	RISCV_ISA_EXT_ZBKB,
> @@ -201,6 +207,16 @@ static const unsigned int riscv_zvbb_exts[] =3D {
>  	RISCV_ISA_EXT_ZVKB
>  };
> =20
> +static const unsigned int riscv_sm_ext_versions[] =3D {
> +	RISCV_ISA_EXT_SM1p11,
> +	RISCV_ISA_EXT_SM1p12,
> +};
> +
> +static const unsigned int riscv_ss_ext_versions[] =3D {
> +	RISCV_ISA_EXT_SS1p11,
> +	RISCV_ISA_EXT_SS1p12,
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defin=
ed in
>   * chapter 27 of the unprivileged specification.
> @@ -299,8 +315,16 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
>  	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
>  	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
> +	__RISCV_ISA_EXT_VERSION(sm1p11, RISCV_ISA_EXT_SM1p11, riscv_sm_ext_vers=
ions, 0,
> +				RISCV_ISA_EXT_SM1p12),
> +	__RISCV_ISA_EXT_VERSION(sm1p12, RISCV_ISA_EXT_SM1p12, riscv_sm_ext_vers=
ions, 1,
> +				RISCV_ISA_EXT_INVALID),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> +	__RISCV_ISA_EXT_VERSION(ss1p11, RISCV_ISA_EXT_SS1p11, riscv_ss_ext_vers=
ions, 0,
> +				RISCV_ISA_EXT_SS1p12),
> +	__RISCV_ISA_EXT_VERSION(ss1p12, RISCV_ISA_EXT_SS1p12, riscv_ss_ext_vers=
ions, 1,
> +				RISCV_ISA_EXT_INVALID),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> @@ -414,6 +438,14 @@ static void __init riscv_parse_isa_string(unsigned l=
ong *this_hwcap, struct risc
>  				;
> =20
>  			++ext_end;
> +
> +			/*
> +			 * As a special case for the Sm and Ss extensions, where the version
> +			 * number is important, include it in the extension name.
> +			 */
> +			if (ext_end - ext =3D=3D 2 && tolower(ext[0]) =3D=3D 's' &&
> +			    (tolower(ext[1]) =3D=3D 'm' || tolower(ext[1]) =3D=3D 's'))
> +				ext_end =3D isa;
>  			break;
>  		default:
>  			/*


Hmm, looking at all of this (especially this hack to the "old" parser),
I feel more like these should be promoted to a property of their own.
The "old" parser was designed to handle numbers, and here when you're
interested in the values behind the numbers (which is a first iirc), you
don't make any use of that. I don't really want to see a world where
we have every single iteration of smNpM under the sun in the property,
because there's a fair bit of churn in the isa. Granted, this applies to
all the various, the difference for me is the level of churn.
Or maybe we can still with the properties you have, but instead of
treating them like any other extension, handle these separately,
focusing on the numbering, so that only having the exact version
supported by a cpu is possible.

I'm still pretty undecided, I'd like to think about this a little bit,
but I think we can do better here.

--GOvnA6XK3oSYaT7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcuv8wAKCRB4tDGHoIJi
0u1UAP46bW+atJw8FGI+FQSeWo9h/8Xpryu+Khk+y2K/oh96wAD/ekaiohckVSPQ
xv2rgXgJkf7b7QqzrLCDBY0tXO1oTgM=
=hUmi
-----END PGP SIGNATURE-----

--GOvnA6XK3oSYaT7y--


--===============1528013399296485517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1528013399296485517==--

