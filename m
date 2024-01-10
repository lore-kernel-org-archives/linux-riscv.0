Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE8CC4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+Tu8Wuw0fPCpmB9fa6J0x4JDg4TSkJZ7ap3+8MXcq0=; b=kwIbcz5dQDL+CdxuO15aBH7fsu
	yW+Qsot6Ja/7jpLDXaucDGNs8jb21YYF3mHklat8mp+wS101aLz3VMi0qk94U2e8lPxbcrSJonfQe
	fVBYsdmuRuoerTf1M3a5O1SYMtH9BbGXzk01UnSqdm2yqvdGBMmBbRZDfuVOI5BTnkMnh5GR3HXOW
	fkXZnJVVahVw7KMO7yuFH06pgrtY0cVEaY5gE+Hb+5wRSMkpA03eqSTI4YP0jC6hJr5zp64zm1Ejh
	3Jq4eEjtbfTkThm3TX+BiZAMLIPCrm0IStEjjfpDBSySgLhqDEnYz/BpTkHuG1PjtCTOVlSilu38+
	Y7On07zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWol-00BLqW-2A;
	Wed, 10 Jan 2024 11:32:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWoi-00BLnP-2V
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 11:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5ACD7B81CD3;
	Wed, 10 Jan 2024 11:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ABBC433C7;
	Wed, 10 Jan 2024 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704886334;
	bh=X9QbxNBN6JyW1oeyEZmWRgibEZdnoLhcaRrM0O9CHk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRByQrTh7LUjUhEU7sOl3vvSeW1RpOIERkA8IwQlyQLSqQxmn3qJLcaQ+P5ZKa288
	 st8wEViJt9CzoVWOHucgOo5i+iuAk6vhSFhVUUpGOan8DcM+Gmybn/VlH9YJeS4zkP
	 lCI6bb/2npds4NSzVmDfaULwF7pMQAgBQkkIoDU2fNdt6Li8IXmf8DZLJ5tyOF10eF
	 hpb2qAGCeHQaHyyhSdCRAKJeAze3PbCB5IcLnN03LBY6f82TjZxAz/CsKvCtj0yGQ+
	 oN8xSJRdro3ixG21D0cSHQgm/SD9BlGc2GlfXjWAjs1GJ66kCqZpApZV+Jj5thSkNA
	 Da7fp4EBb42PA==
Date: Wed, 10 Jan 2024 11:32:09 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: Re: [PATCH v2 1/6] riscv: add ISA extension parsing for Ztso
Message-ID: <20240110-childish-magnetic-75dacb4fb265@spud>
References: <20231220155723.684081-1-cleger@rivosinc.com>
 <20231220155723.684081-2-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231220155723.684081-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_033216_966183_23596EF2 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Type: multipart/mixed; boundary="===============8988456073738473712=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8988456073738473712==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rEohnyKvwS23qCv0"
Content-Disposition: inline


--rEohnyKvwS23qCv0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 04:57:17PM +0100, Cl=E9ment L=E9ger wrote:
> Add support to parse the Ztso string in the riscv,isa string. The
> bindings already supports it but not the ISA parsing code.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 2438d4685da6..3b31efe2f716 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -84,6 +84,7 @@
>  #define RISCV_ISA_EXT_ZVFH		69
>  #define RISCV_ISA_EXT_ZVFHMIN		70
>  #define RISCV_ISA_EXT_ZFA		71
> +#define RISCV_ISA_EXT_ZTSO		72
> =20
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index dc0ab3e97cd2..3eb48a0eecb3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -279,6 +279,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
>  	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>  	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> +	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
>  	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
>  	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
>  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
> --=20
> 2.43.0
>=20

--rEohnyKvwS23qCv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ6AOQAKCRB4tDGHoIJi
0gi6AQDMTvHshgmIxeYYvER5QNLkJGGnk9Du0Z4e5q/5yAhdnwD7BDk5kOnuXzyq
U0LrzFyiX6cUknwFyCuN0/arBBh3zgY=
=J7XO
-----END PGP SIGNATURE-----

--rEohnyKvwS23qCv0--


--===============8988456073738473712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8988456073738473712==--

