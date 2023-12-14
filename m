Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8C8C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e64h2ZvkLWJEf4ipW2FxuOSLlafAY28vpHinPxbYMq0=; b=CpqobcNzGcGrrcgbpF/y3nzCuP
	MurnQa7vpGJK/0TYgEHL2c9irg1TmQGaIAHTK6EVaEKxX8Ua6ow9ZSt//BD7JcV759Zwgsk7aBkV6
	MtRbX/mc+oEB9sk4aB2IG3k+GGTCBn1aojEN4WnwBlQLKXe8QdOXtolMP2Gf2RPC8nr2Y/NfVyHwK
	cuZuP+0Ilz2PCejAQRrS/Y6OoQ5Jvfns+S97wqyvT3ZfNbkA6ARsfBukCPenOKSvjqV51+nqrYdI/
	KnxBCgfRIPqsWas/6ge+TGdY5i77+BrKxzJ26hzACmmNRq1dv9jlpGJnKJ0i46RVJaubCJ9qd7KHG
	IDgQ2/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmUG-000WDi-30;
	Thu, 14 Dec 2023 14:14:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmUD-000WCm-2W
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 14:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4ECECE171C;
	Thu, 14 Dec 2023 14:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A585C433C8;
	Thu, 14 Dec 2023 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702563286;
	bh=wkD8ZyahJypOO+5Crrc5pRGXWHc7YtwbESGjV16riik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fS8GBBui8fZG3+8f96qcY5IMX4PbMPLMqMTEUT0/VtNCuTGZirBDWHhvfaObxmfmf
	 uXTfnJlGSsnXI46ykxNASlGPQsIbKbbbzI3t7JUcbzUBOGtz4qNeJBBjf8xQpHQlOe
	 ASWuCCq4XDCftqZJpSYHukyrQdTSr07b/N+gdGGm06BsREXW4HNJc7Derg9wy4y0Z2
	 Hq0apk2UQkbluBLX7a2qig7SXJsf4RTYCPQ6Fm9iOzf1uydqGQ8hmf1cv/Lv/P5GNO
	 JlkliiUv3RV9P3/iiJdko72B3V2ndILpT+BJtCcVEgpYLXan57PZWg8NXn/XXqzHY+
	 ZdWkWYrNU5/FQ==
Date: Thu, 14 Dec 2023 14:14:41 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: Re: [PATCH 4/9] riscv: add ISA extension parsing for Zam
Message-ID: <20231214-acts-udder-37d0162e4f61@spud>
References: <20231213113308.133176-1-cleger@rivosinc.com>
 <20231213113308.133176-5-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231213113308.133176-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_061450_007019_CAB8E050 
X-CRM114-Status: GOOD (  16.06  )
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
Content-Type: multipart/mixed; boundary="===============4768033785395460122=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4768033785395460122==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WZWs6NLSd1UVh/cf"
Content-Disposition: inline


--WZWs6NLSd1UVh/cf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:33:00PM +0100, Cl=E9ment L=E9ger wrote:
> Add parsing for Zam ISA extension which is part of the riscv-isa manual
> but was not added to ISA parsing up to now.

This does not appear to be frozen or ratified, NAK.

Cheers,
Conor.

>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 3b31efe2f716..016faa08c8ba 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -85,6 +85,7 @@
>  #define RISCV_ISA_EXT_ZVFHMIN		70
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
> +#define RISCV_ISA_EXT_ZAM		73
> =20
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3eb48a0eecb3..e999320398b7 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -259,6 +259,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +	__RISCV_ISA_EXT_DATA(zam, RISCV_ISA_EXT_ZAM),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> --=20
> 2.43.0
>=20

--WZWs6NLSd1UVh/cf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsN0QAKCRB4tDGHoIJi
0mOAAP9FBVgammIN1Czcclk1+2JsV7aZsiieQoCdaP7DVN3IHAD/bOx6eMuPj4pR
So4KVt0UR5nj9k0dkJyitxbhYc2V9w0=
=CPjK
-----END PGP SIGNATURE-----

--WZWs6NLSd1UVh/cf--


--===============4768033785395460122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4768033785395460122==--

