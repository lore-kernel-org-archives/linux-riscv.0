Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A068C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/N6DBmqAYI6BwrDC28+TZSIo2aEftLaSLP4u1BPsBw=; b=j0WgukUJCzN11MEDynyPQffHXX
	iyZ6RhFiUOka2VeL83OAKCi/8n958KLsyZbhYiCdm6SrkEjF3TpV0Yx0pz9y2GovXQW1ehucH8ns2
	WvD5TjGOlt976UzjyVhlZgXv2nfwVkQYaxcKAC/gYtwSLlJRhI+xj1gkSOxJ1jubHzXq8R9Osxyv1
	dtQiQl+xr4xpA+NsJQeRF6nU+gXTwEUYcZMQ2hjDk70lNbpyjZeKv974GhSpMUovb7Phg6lsoE1Td
	XBjgE7Zgp43LrWigZ7n0Teq12wMibzJVPzLY2V8NAZFF/b21+hCy085t0i7jEVD2A/khYtB//zjnM
	WPRsuV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MgF-0000000CrfJ-0qxS;
	Fri, 26 Apr 2024 14:36:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MgC-0000000CrdZ-0Qw6;
	Fri, 26 Apr 2024 14:36:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6823861FD7;
	Fri, 26 Apr 2024 14:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42C4C113CD;
	Fri, 26 Apr 2024 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714142159;
	bh=fvWCKMof3QYNLsCaCCHiN9bivg7kkxwrQ3p10OT8TKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkVPE603ro8SVcnyj5gfGayGqBckvi1U15SCiOUS2p//vLtPWOVe4qbxdd/SxRdD3
	 F0lOcZnmAURdDAddOnOSBLUrPTVdi3bXVcThWbLxddt4hIP5wlYIvn7YXZko3iet54
	 QH/EeM++arDAydol9fkd3A6Btb173CrgPYfdI5qg6Ojz3h374XKfdj1Hr6hqfYld0i
	 Hs7amcRkVntlK/wfR/CEUZDafyZUzWL+RO+ffQvOyK10410R/a9k9caOvLFUMBRjGG
	 9J6ydOQMya87VMl8k3SBZvaGwvzu13gPIH+wkXrGioDhsH8RtKCC2F/ZHk3eFZ+Hu9
	 rKOyl5d/HxeQQ==
Date: Fri, 26 Apr 2024 15:35:53 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 03/11] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240426-pusher-bartender-9a1eddd9a422@spud>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
 <20240423124326.2532796-4-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240423124326.2532796-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_073600_246962_7D890B07 
X-CRM114-Status: GOOD (  23.42  )
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
Content-Type: multipart/mixed; boundary="===============5901134812864940212=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5901134812864940212==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ROz/llGSkBkozfg7"
Content-Disposition: inline


--ROz/llGSkBkozfg7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 02:43:17PM +0200, Cl=E9ment L=E9ger wrote:
> The Zc* standard extension for code reduction introduces new extensions.
> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> are left out of this patch since they are targeting microcontrollers/
> embedded CPUs instead of application processors.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

The potential split aside, I think what's here makes sense.

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/hwcap.h |  4 +++
>  arch/riscv/kernel/cpufeature.c | 47 +++++++++++++++++++++++++++++++++-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 543e3ea2da0e..b7551bad341b 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -82,6 +82,10 @@
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
>  #define RISCV_ISA_EXT_ZIMOP		75
> +#define RISCV_ISA_EXT_ZCA		76
> +#define RISCV_ISA_EXT_ZCB		77
> +#define RISCV_ISA_EXT_ZCD		78
> +#define RISCV_ISA_EXT_ZCF		79
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 6d238c8dbccf..24bf3fbc0578 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -107,6 +107,29 @@ static bool riscv_ext_zicboz_validate(const struct r=
iscv_isa_ext_data *data,
>  	return true;
>  }
> =20
> +static bool riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
> +				   const unsigned long *isa_bitmap)
> +{
> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA);
> +}
> +static bool riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
> +				   const unsigned long *isa_bitmap)
> +{
> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
> +	       __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d);
> +}
> +
> +static bool riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
> +				   const unsigned long *isa_bitmap)
> +{
> +#ifdef CONFIG_64BIT
> +	return false;
> +#else
> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
> +	       __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f);
> +#endif
> +}
> +
>  #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size,=
 _validate) {	\
>  	.name =3D #_name,									\
>  	.property =3D #_name,								\
> @@ -118,6 +141,9 @@ static bool riscv_ext_zicboz_validate(const struct ri=
scv_isa_ext_data *data,
> =20
>  #define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id,=
 NULL, 0, NULL)
> =20
> +#define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
> +			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
> +
>  /* Used to declare pure "lasso" extension (Zk for instance) */
>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
>  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> @@ -209,6 +235,21 @@ static const unsigned int riscv_xlinuxenvcfg_exts[] =
=3D {
>  	RISCV_ISA_EXT_XLINUXENVCFG
>  };
> =20
> +/*
> + * Zc* spec states that:
> + * - C always implies Zca
> + * - C+F implies Zcf (RV32 only)
> + * - C+D implies Zcd
> + *
> + * These extensions will be enabled and then validated depending on the
> + * availability of F/D RV32.
> + */
> +static const unsigned int riscv_c_exts[] =3D {
> +	RISCV_ISA_EXT_ZCA,
> +	RISCV_ISA_EXT_ZCF,
> +	RISCV_ISA_EXT_ZCD,
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defin=
ed in
>   * chapter 27 of the unprivileged specification.
> @@ -255,7 +296,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> -	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
> +	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
>  	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_x=
linuxenvcfg_exts,
> @@ -274,6 +315,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zcb, RISCV_ISA_EXT_ZCB, riscv_ext_zca_dep=
ends),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zcd, RISCV_ISA_EXT_ZCD, riscv_ext_zcd_val=
idate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zcf, RISCV_ISA_EXT_ZCF, riscv_ext_zcf_val=
idate),
>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> --=20
> 2.43.0
>=20

--ROz/llGSkBkozfg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiu7yQAKCRB4tDGHoIJi
0gh5AP0cbGNts8eoVZeDItSxQA5RKNgG88ExrmtRhfQLSdNEUwD/b5VaqUNBUM6U
7zMWwwWvojpz7oLhHEntm9Ys+IamPwE=
=wMBZ
-----END PGP SIGNATURE-----

--ROz/llGSkBkozfg7--


--===============5901134812864940212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5901134812864940212==--

