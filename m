Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1941BCD3445
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M543buFCqpIWLAzWYzXzFI1gaEECmOtJPQRfepYegdo=; b=EsP1KiP1UpQv9k3ZK7cFWHAJKz
	SpsxQj5GyIgON2GRFSWbgPrx/lRDyMKQw59Kz/IaP+AR89XLo049DVR7GipLnX0+AfUtuPGFaUgiB
	w4CCULjVvl65gfrx9wtpyRVMo5evjM/vh7ImEgz9tUm70/Cwph6jVS6428tNGg20G7FE8PYgjAQeF
	JXZrylOLoaepjiwihC8Z/x6kH71HtqLxBPjHQBOaIHd24I9ATWpbGaEXD6rr38vEcBItmZh9prlVA
	5JbT4loy8gHcb3kba6fsyOVt3eMQ8pidwhYfwwibhXbLhSY/2APNR2cmwsWQQVgj/QKv3X7FbsIh1
	maVWBg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiV7u-00HE5c-2K;
	Tue, 19 Sep 2023 07:26:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiV7r-00HE4E-0J;
	Tue, 19 Sep 2023 07:26:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CD98B811A3;
	Tue, 19 Sep 2023 07:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFCAC433C8;
	Tue, 19 Sep 2023 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695108384;
	bh=gLB2LWQsL+RnhIlkyrF0yKDNcGb+VOI9qal/BFZlPEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEDnQ7zouNLjQw/nlWyJKVD7wXY3F1UWETP5qKs+LT3XGfmVydv+EQNE3X24gb5Ya
	 VLEaX2YwX3IUMfMUcPsGLZT1UpemkdgDJ71q5hTRYFfv4h7rTPg+GwroVCJAZ+NdM0
	 M1w1G7jFEO2TS2o3CtwznapuY8DHDhuO3riT1QmxnA90ZF8zHLgnmpwGs/bzdOQVs1
	 W9g8nMqCkdBQq9DmHUpzshVTO8SZsF2KISxsLDEd70Xo5DrFQJWsB2QkkdTDsUyzbB
	 hRMaGixDmipxvo+esdqKJmcKT635FGG9q2bEMmDBtCI9Wa43dzb5sXWNEPv5CWNLEN
	 jNkzpKQzt9d9g==
Date: Tue, 19 Sep 2023 08:26:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
Message-ID: <20230919-bbcb3627b6d9d0238c5ba351@fedora>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230919035343.1399389-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_002627_451323_D727C26A 
X-CRM114-Status: GOOD (  20.76  )
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
Content-Type: multipart/mixed; boundary="===============4770438916101291744=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4770438916101291744==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mv1aC61H7/X3v0PV"
Content-Disposition: inline


--mv1aC61H7/X3v0PV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

On Tue, Sep 19, 2023 at 09:23:37AM +0530, Anup Patel wrote:
> The Veyron-V1 CPU supports custom conditional arithmetic and
> conditional-select/move operations referred to as XVentanaCondOps
> extension. In fact, QEMU RISC-V also has support for emulating
> XVentanaCondOps extension.
>=20
> Let us detect XVentanaCondOps extension from ISA string available
> through DT or ACPI.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  arch/riscv/include/asm/hwcap.h                          | 1 +
>  arch/riscv/kernel/cpufeature.c                          | 1 +
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 36ff6749fbba..cad8ef68eca7 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,13 @@ properties:
>              memory types as ratified in the 20191213 version of the priv=
ileged
>              ISA specification.
> =20
> +        - const: xventanacondops
> +          description: |
> +            The Ventana specific XVentanaCondOps extension for condition=
al
> +            arithmetic and conditional-select/move operations defined by=
 the
> +            Ventana custom extensions specification v1.0.1 (or higher) at
> +            https://github.com/ventanamicro/ventana-custom-extensions/re=
leases.
> +

For this and the next patch, the binding change needs to be split out
=66rom the code. checkpatch should've complained about it.

>          - const: zba
>            description: |
>              The standard Zba bit-manipulation extension for address gene=
ration
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 0f520f7d058a..b7efe9e2fa89 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,7 @@
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
> +#define RISCV_ISA_EXT_XVENTANACONDOPS	44
> =20
>  #define RISCV_ISA_EXT_MAX		64
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3755a8c2a9de..3a31d34fe709 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(xventanacondops, RISCV_ISA_EXT_XVENTANACONDOPS),

I've been banging on for a bit about people doing weird stuff to detect
their vendor extensions, so nice to see it being done properly :)


Cheers,
Conor.

>  };
> =20
>  const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
> --=20
> 2.34.1
>=20

--mv1aC61H7/X3v0PV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQlNFgAKCRB4tDGHoIJi
0iUpAP9ne9DXece3u0b+dxZu1b95uYLQpbdCMoKSL3or2S8VVgEAsKUDIbvWz1ST
t926imSxSSeZ0HhKMpZpxZLwWWHhjA8=
=gljK
-----END PGP SIGNATURE-----

--mv1aC61H7/X3v0PV--


--===============4770438916101291744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4770438916101291744==--

