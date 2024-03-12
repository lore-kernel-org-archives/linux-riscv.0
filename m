Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15574C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 13:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOTGW39VZb5/SpFYZEzs5QkYrNiiWqSGdH4lLriGt6Q=; b=jwD+q/kWcmm9yptD8xIHSyvIV9
	DzaCfAe5epUve7Xu4kPhHJ9m768TQ7HDQ2YnLk+7i57W5F3rICnYAVP1G1qLt31A1lIYXSLYJW6TW
	yFprtBjLwGB+y5trzaKlKsEFihpgNZGFfwKcdcrh65T8FjoGt3EeOqQcHSD4x2Wo0h1znHgaVwvMd
	PW8rdviW5BDEzWxa4gRiaV8NBLLWnLrAliVM2Sn/MgsGYPC4wdj4K6tfxAuW1BTge1ysJ9UjIpgKT
	G97d2xNAi6pS92L+xDqFvuG8CY3PkhGFSEvdyZ9j0BegK+t5ZHutdaKAXbwdGBrpu6fIcXMb2Eycv
	doTK1WCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1p8-00000005rjr-37X9;
	Tue, 12 Mar 2024 13:05:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1p5-00000005riz-1mg6
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 13:05:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE398611C3;
	Tue, 12 Mar 2024 13:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59303C433F1;
	Tue, 12 Mar 2024 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710248738;
	bh=jDTEOEbotwaE29eS1S2nXPMI51EfrNKfcXEXasvEcmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGfhbJWC7bciW4Q9cjAU0wC5UpEDJQ8djU44LT/bopdivtyEe87Dfau3eXkj+VHZ6
	 NfRyL5Y8J4cQ6OulMvj1zwpvwRlVuegefgiKJw6yGUjhW8zKf6tbe9L7+MmN/CC1zX
	 G1+hkJQCdxjMR83gHeJQv5esevKVfYcm5JcFu/VS1WYOJuY0moWoMyI46393vbQwtH
	 Nor35iq1tO5/RudmEnmDW08vQ4yAIIg2yXeGGEQ2zYwJN3nlo/G9AefIHByiJ88erD
	 uWIGVMyVnVuBLfwn9KsKUo+U0XeEtgPzjASgTW7KhiYTxCBPNMK1BDv3DIGLPmxmEl
	 Md5QxfXKpk5hQ==
Date: Tue, 12 Mar 2024 13:05:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [v1, 4/6] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
Message-ID: <20240312-follow-catnap-7fdfa9cb9531@spud>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <20240312123627.9285-5-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240312123627.9285-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_060539_591040_757A4749 
X-CRM114-Status: GOOD (  20.55  )
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
Content-Type: multipart/mixed; boundary="===============7849566259232563638=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7849566259232563638==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TPQy5gR0HFHqJOYc"
Content-Disposition: inline


--TPQy5gR0HFHqJOYc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 08:36:25PM +0800, Andy Chiu wrote:
> Multiple Vector subextensions are added. Also, the patch takes care of
> the dependencies of Vector subextensions by macro expansions. So, if
> some "embedded" platform only reports "zve64f" on the ISA string, the
> parser is able to expand it to zve32x zve32f zve64x and zve64f.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

These new extensions need to be added to the dt-bindings.

> ---
>  arch/riscv/include/asm/hwcap.h |  5 +++++
>  arch/riscv/kernel/cpufeature.c | 41 +++++++++++++++++++++++++++++++++-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 5340f818746b..24efea44f1ab 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,6 +80,11 @@
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
> +#define RISCV_ISA_EXT_ZVE32X		74
> +#define RISCV_ISA_EXT_ZVE32F		75
> +#define RISCV_ISA_EXT_ZVE64X		76
> +#define RISCV_ISA_EXT_ZVE64F		77
> +#define RISCV_ISA_EXT_ZVE64D		78
> =20
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 8986ceb58188..3aa0df3f3b41 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -201,6 +201,40 @@ static const unsigned int riscv_zvbb_exts[] =3D {
>  	RISCV_ISA_EXT_ZVKB
>  };
> =20
> +#define RISCV_ISA_EXT_ZVE32F_IMPLY_LIST	\
> +	RISCV_ISA_EXT_ZVE32F,		\
> +	RISCV_ISA_EXT_ZVE32X,
> +
> +#define RISCV_ISA_EXT_ZVE64F_IMPLY_LIST	\
> +	RISCV_ISA_EXT_ZVE64F,		\
> +	RISCV_ISA_EXT_ZVE64X,		\
> +	RISCV_ISA_EXT_ZVE32F_IMPLY_LIST
> +
> +#define RISCV_ISA_EXT_ZVE64D_IMPLY_LIST	\
> +	RISCV_ISA_EXT_ZVE64D,		\
> +	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
> +
> +static const unsigned int riscv_zve32f_exts[] =3D {
> +	RISCV_ISA_EXT_ZVE32F_IMPLY_LIST
> +};
> +
> +static const unsigned int riscv_zve64f_exts[] =3D {
> +	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
> +};
> +
> +static const unsigned int riscv_zve64d_exts[] =3D {
> +	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
> +};
> +
> +static const unsigned int riscv_zve64x_exts[] =3D {
> +	RISCV_ISA_EXT_ZVE32X,
> +	RISCV_ISA_EXT_ZVE64X
> +};
> +
> +static const unsigned int riscv_v_exts[] =3D {
> +	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defin=
ed in
>   * chapter 27 of the unprivileged specification.
> @@ -248,7 +282,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
> -	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
> +	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> @@ -283,6 +317,11 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
>  	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
>  	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> +	__RISCV_ISA_EXT_SUPERSET(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_ext=
s),
> +	__RISCV_ISA_EXT_DATA(zve32x, RISCV_ISA_EXT_ZVE32X),
> +	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_ext=
s),
> +	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_ext=
s),
> +	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_ext=
s),
>  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
>  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
>  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--TPQy5gR0HFHqJOYc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfBTHAAKCRB4tDGHoIJi
0txbAP99O+AgJOnFzzXfBLiAK4n8wfle+mc9iIZadOzp5z7CUAEA5gq+fdrw0Mou
+RpGErJdm7ZCldRnPEO/nfgtqtEOHQk=
=SDHJ
-----END PGP SIGNATURE-----

--TPQy5gR0HFHqJOYc--


--===============7849566259232563638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7849566259232563638==--

