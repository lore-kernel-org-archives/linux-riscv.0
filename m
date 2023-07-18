Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4204DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtKe4DHEYV7eMZG5QjACdBpMrWSBtTvplnESEm4PKz4=; b=e/6CQamKrhJqp6qUEIt2gbFWwz
	iX2SrATwCeE92zyOWkcSYNqKQvjYpRqxl2ugUFS/STyj5+4eM3TAdqobH7AkIWnXTkCjw5nwdgyWW
	pqNMmgmVs2p7Zrg9o91Ww9/w3DvIGK6bqWW8CKgWnUvHOzyRIthAX7KiPERaj8Wn8M+bxuRB/I+Za
	dDSLxR1Ddlh6Fubv/dusbRKXWUO3Lu5fppGHWcEkaJ2fB0Wng4dX4dtKW12aJ0igDVy0YNFiE/2O6
	Xe29zNnyRqc8Yjfj942eRmqY+nbsAVpMv+j5B/jV/0gKvXWYWpW1cOaz8gQm5jA8ydF5U847sNbhp
	vYDNY5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11E-005vTH-33;
	Wed, 19 Jul 2023 06:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11D-005vSZ-1n
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x2J2N+yN2ugMbyfMlgUOK6+IGyOVgwVQcWC2cfYmo8c=; b=prjSDrcPzLWcUU7USLeqGGKIvI
	wPpTJXIRhYuJPfTpYZmlvotOz3MdN8ysRYV00Iy6YHrmhQ1G0m2Prng8I3blIMcjjuzSvxg+VFiwT
	Byzru+Q7sTMCTG2fKHbge5+Ce706+BsUH852HIOYJR9QLej67BIpeTSMDioT/MtZ9ymB0psJWE3+u
	EppNZqI/bupD8SnxxyWdj3RUU6zsj200/GNjLD4ObQ9PnQ9GJCC4cV9GZweXefGthx7jPecL5A5X/
	oT6ovM/puP3LR4b6BsfQ6xo3HBXMmBfNJZ1S4ldR3xk1MFi4e1wopd+TProbp21hKX8FLVtOpzpab
	FSQ6fkaQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLm7s-00BfNJ-08
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 14:56:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8FC6615AC;
	Tue, 18 Jul 2023 14:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CEFC433C7;
	Tue, 18 Jul 2023 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689692130;
	bh=fdekGA583gB2J0NLQfIQ21KSthQ1S9fIdLfU2PzPdJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=endu9Fe+8olkfUD5V+sCOj02eDLxV8bpVyVv0CYN66ZkWx/E+fB7v0H2nF+4IblBK
	 XVc1jQxhyHM+IWvwgjAvpJmW3pYAoWP+APV+U0onWFoBQV8p4HrVLWZqnJfPjpLRM8
	 Xu4DD4C3ergG80wocFy2zXdXXsythAe/UXEKR1TjmMxLseoWzWjEMrudj7/gO4U7NG
	 RDFxQVk/OZorT3S9z9JzLfrQOHRVqnRbKF6C/Njg1Mrsn3hCfyOSSdwCqMBjJJK/i/
	 uMxi5mYmw1mpR+Uq3Qq2FHbStwJ1Wphhj4ztU3rivYqDYYB2oTePUn22hQ0WES8NHE
	 YE6PMJXec4LUQ==
Date: Tue, 18 Jul 2023 15:55:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu, ebiggers@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 04/12] RISC-V: add vector crypto extension detection
Message-ID: <20230718-jittery-unwashed-cd2781c74351@spud>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-5-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230711153743.1970625-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_155632_995803_5D194719 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: multipart/mixed; boundary="===============8219614298251715972=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8219614298251715972==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N/lcl/YjF4hhSyY+"
Content-Disposition: inline


--N/lcl/YjF4hhSyY+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Heiko,

On Tue, Jul 11, 2023 at 05:37:35PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Add detection for some extensions of the vector-crypto specification:
> - Zvkb: Vector Bit-manipulation used in Cryptography
> - Zvkg: Vector GCM/GMAC
> - Zvknha and Zvknhb: NIST Algorithm Suite
> - Zvkns: AES-128, AES-256 Single Round Suite
> - Zvksed: ShangMi Algorithm Suite
> - Zvksh: ShangMi Algorithm Suite
>=20
> As their use is very specific and will likely be limited to special places
> we expect current code to just pre-encode those instructions, so right now
> we don't introduce toolchain requirements.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/hwcap.h |  9 ++++++
>  arch/riscv/kernel/cpu.c        |  8 ++++++
>  arch/riscv/kernel/cpufeature.c | 50 ++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b80ca6e77088..0f5172fa87b0 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -64,6 +64,15 @@
>  #define RISCV_ISA_EXT_ZKSED		51
>  #define RISCV_ISA_EXT_ZKSH		52
>  #define RISCV_ISA_EXT_ZKT		53
> +#define RISCV_ISA_EXT_ZVBB		54
> +#define RISCV_ISA_EXT_ZVBC		55
> +#define RISCV_ISA_EXT_ZVKG		56
> +#define RISCV_ISA_EXT_ZVKNED		57
> +#define RISCV_ISA_EXT_ZVKNHA		58
> +#define RISCV_ISA_EXT_ZVKNHB		59
> +#define RISCV_ISA_EXT_ZVKSED		60
> +#define RISCV_ISA_EXT_ZVKSH		61
> +#define RISCV_ISA_EXT_ZVKT		62
> =20
>  #define RISCV_ISA_EXT_MAX		64
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 10524322a4c0..925241e25db2 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -227,6 +227,14 @@ static struct riscv_isa_ext_data isa_ext_arr[] =3D {
>  	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>  	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
>  	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
> +	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
> +	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> +	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
> +	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
> +	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
> +	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
> +	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
> +	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 9a872a2007a5..13556fd16bf6 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -343,6 +343,56 @@ void __init riscv_fill_hwcap(void)

All of these need to be documented in dt-bindings.

At least one of these lists will go away iff Palmer merges my rework of
this stuff & hopefully we'll get one of the ways to avoid repeating the
SET_ISA_EXT_MAP stuff ad nauseam.

Cheers,
Conor.

--N/lcl/YjF4hhSyY+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLan3QAKCRB4tDGHoIJi
0nR6AQD+C1pKTvPcCyHR4byAsK4aADmAqre/etI69jkZYRvW0AD9FZrbcgUCbpyE
/zlL/+i+mICAk4upff5+MFvKZxM6QQE=
=1eeh
-----END PGP SIGNATURE-----

--N/lcl/YjF4hhSyY+--


--===============8219614298251715972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8219614298251715972==--

