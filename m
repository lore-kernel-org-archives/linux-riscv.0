Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69FCC05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48KXpQvzcEpmPfxUNU+u21UbbJXWgsdfVjRIWW+FNbs=; b=alJl+xb61ZtvSSjNNrcKzy7jB8
	aq83tY8HX2v4as5wKWqG9hocVhNRJnuiEvQ4BlxFcGK/shV5sXOu0h1TF8Q5v2VfkX+f5YFE/kTDj
	GfEfyQ4u/FopvLSDnaaXq7Gfj8zi3h6Vwcn9jMxbGjTEIzpgEh1r16HoGUf4eUonJarCWsUi0C+10
	GXvzej8zeA+SMVP7l6VXYq+iXtnyGGlaTt3AfSKg/0MgzRGuMQ+Qg3IYKexgohMCkZpYPfAfcNHe+
	XFXBz+jNnwxTZ1r7d6OKT5+nhFNe+odZePJKQjvvytCj/pjHBdnnh7RqqxKGBXEsNJTPMMv2RrO1N
	8h9Qs3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRE9m-00BfHK-Tr; Sun, 12 Feb 2023 15:20:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRE9k-00BfGv-86
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 15:20:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9435CB80956;
	Sun, 12 Feb 2023 15:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D226FC433D2;
	Sun, 12 Feb 2023 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676215241;
	bh=Q6PfIxygpEI1xYX10zbPzF5LkiAr6uoFoBrtPWMcTBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKgnh11vHYQoUazFUZpNdidBVWeSBiab5pXF+J49+vPZ91ExvB6X4ik6A+F+uGom4
	 2SApBSGigp00vFR79lYzhOzE2L30Qwlu+KwE1rdo5cUT4JFn4WAWs1CyGmGtxSpCgP
	 hf51r7qckBrCtKXt4mscr7k61lJX+YEEUHsRFrPw4FfbWnfD4Jo3nNBiLzjhHT9cKI
	 2MDvP/DE511/J5eA6sa+CEjhymIn6JU48Ogp3iXAfOeFKzOVqApmeU7gFOnFYrO9b8
	 B1b1PTIZIeLrChyS7v35W1g/RJF86K5TwHPIOvLmB88bhG4mGgCOvm3pIRisKaZc+F
	 XG1lMsOLxsLqg==
Date: Sun, 12 Feb 2023 15:20:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Fix Zbb alternative IDs
Message-ID: <Y+kDxJTe161pQns8@spud>
References: <20230212021534.59121-1-samuel@sholland.org>
 <20230212021534.59121-3-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20230212021534.59121-3-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_072044_618982_54B2F047 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: multipart/mixed; boundary="===============1089337961736611944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1089337961736611944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4XRBP165aId13kTT"
Content-Disposition: inline


--4XRBP165aId13kTT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2023 at 08:15:33PM -0600, Samuel Holland wrote:
> Commit 4bf8860760d9 ("riscv: cpufeature: extend
> riscv_cpufeature_patch_func to all ISA extensions") switched ISA
> extension alternatives to use the RISCV_ISA_EXT_* macros instead of
> CPUFEATURE_*. This was mismerged when applied on top of the Zbb series,
> so the Zbb alternatives referenced the wrong errata ID values.
>=20
> Fixes: 9daca9a5b9ac ("Merge patch series "riscv: improve boot time isa ex=
tensions handling"")

Re: your question on irc, I think you did the right thing here as
Jisheng did remove them in his series:
https://lore.kernel.org/linux-riscv/20230128172856.3814-5-jszhang@kernel.or=
g/
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  arch/riscv/include/asm/errata_list.h | 5 -----
>  arch/riscv/lib/strcmp.S              | 2 +-
>  arch/riscv/lib/strlen.S              | 2 +-
>  arch/riscv/lib/strncmp.S             | 2 +-
>  4 files changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index e158439029ce..274c6f889602 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -23,11 +23,6 @@
>  #define	ERRATA_THEAD_NUMBER 3
>  #endif
> =20
> -#define	CPUFEATURE_SVPBMT 0
> -#define	CPUFEATURE_ZICBOM 1
> -#define	CPUFEATURE_ZBB 2
> -#define	CPUFEATURE_NUMBER 3
> -
>  #ifdef __ASSEMBLY__
> =20
>  #define ALT_INSN_FAULT(x)						\
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 8148b6418f61..986ab23fe787 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -9,7 +9,7 @@
>  /* int strcmp(const char *cs, const char *ct) */
>  SYM_FUNC_START(strcmp)
> =20
> -	ALTERNATIVE("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_=
ZBB)
> +	ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_I=
SA_ZBB)
> =20
>  	/*
>  	 * Returns
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> index 0f9dbf93301a..8345ceeee3f6 100644
> --- a/arch/riscv/lib/strlen.S
> +++ b/arch/riscv/lib/strlen.S
> @@ -9,7 +9,7 @@
>  /* int strlen(const char *s) */
>  SYM_FUNC_START(strlen)
> =20
> -	ALTERNATIVE("nop", "j strlen_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_=
ZBB)
> +	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_I=
SA_ZBB)
> =20
>  	/*
>  	 * Returns
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index 7940ddab2d48..ee49595075be 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -9,7 +9,7 @@
>  /* int strncmp(const char *cs, const char *ct, size_t count) */
>  SYM_FUNC_START(strncmp)
> =20
> -	ALTERNATIVE("nop", "j strncmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA=
_ZBB)
> +	ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_=
ISA_ZBB)
> =20
>  	/*
>  	 * Returns
> --=20
> 2.37.4
>=20

--4XRBP165aId13kTT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+kDxAAKCRB4tDGHoIJi
0ny1AP0Yt08c7udSKlM5PWcWZxBQFD3ylYVIrGMDejmq57eXpgEA1wmER8+7QeqZ
6c9gTh4d/jJH88lUVSMpNfSw0J4QJwU=
=ANME
-----END PGP SIGNATURE-----

--4XRBP165aId13kTT--


--===============1089337961736611944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1089337961736611944==--

