Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA2C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 22:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCawpvK+0gblP8v4nIReyUenWVnho+H1iUf+pqdHdaw=; b=073DpyopDRzCrFmMFLRDXLE138
	7gkNaumTIUatHM5zk6Kn4RMn/xlMJAT5YSZl9tuMpVNm7w/Fysdx5PGq752jYsM28QiHmx/Nb9Lzq
	4YdVmLZfQvFO7vUajaLjcGuD37ywZEgdCtEmFvQYToEuMbfWD1O8GRPFAcXwtTy7yviCsxsISSsO/
	Bt10dyQAUSoHLHGgr4fkMpWFUHsxmgM+WLaEucxvVC6oxepYWRSr/FhJCPe3gMtEa4PZTJTxWjlKF
	tVKsMg8YH0NagRcuUH3SpM+uyqzoiC3nU6ishYJHbVo9T9aM2HHsl13FWsHFHDTcTwb6XvpZyIJ3U
	1BGzWhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4URg-001KnB-34;
	Wed, 31 May 2023 22:37:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4URe-001Km6-0k
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 22:37:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB86C634F9;
	Wed, 31 May 2023 22:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BCAC433D2;
	Wed, 31 May 2023 22:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685572646;
	bh=EjcnHeLPSFskAfrECWzs0sBFgzC+oBoE4wsOMlpomy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edK7cDRjdx4uas4edYdeXU/b0jIuH8g7/WAZNO5DSDCcS0YaLilbgVUxIipuqn5Sp
	 lCrLS+s9ffLTuvceyREmandUiBzww2Vm0FYVd7oH4zVCgA7VgWyC4/aQm8/ZjNTSUf
	 b8dbYVPA/tpNUEHbYxINyxen0NE2uVgFjLwJopgxn2aGeJWfo+BwbqMuk5GklRaie4
	 BgZ3XO7jaS1yOCF3xtfHmqCN16wqOGz3/Y6/nx8TG/JM4IQehwiYUwDsrRH1KQ19w1
	 kYhSF0XubTIbUD/FtSIs0J51Ts29QRj156kFbUdfPrTl9s1jRsrnK2pZBGThy4VlGW
	 BHubXoEh2en9g==
Date: Wed, 31 May 2023 23:37:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Joan Bruguera =?iso-8859-1?Q?Mic=F3?= <joanbrugueram@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alyssa Ross <hi@alyssa.is>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv/purgatory: Do not use fortified string functions
Message-ID: <20230531-abruptly-settling-f9852f408dcd@spud>
References: <20230531003404.never.167-kees@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230531003404.never.167-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_153730_374599_399E3221 
X-CRM114-Status: GOOD (  22.48  )
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
Content-Type: multipart/mixed; boundary="===============5638362541332931329=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5638362541332931329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZFT5h/br0IBkD5vu"
Content-Disposition: inline


--ZFT5h/br0IBkD5vu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Kees,

On Tue, May 30, 2023 at 05:34:04PM -0700, Kees Cook wrote:
> With the addition of -fstrict-flex-arrays=3D3, struct sha256_state's
> trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
>=20
> struct sha256_state {
>         u32 state[SHA256_DIGEST_SIZE / 4];
>         u64 count;
>         u8 buf[SHA256_BLOCK_SIZE];
> };
>=20
> This means that the memcpy() calls with "buf" as a destination in
> sha256.c's code will attempt to perform run-time bounds checking, which
> could lead to calling missing functions, specifically a potential
> WARN_ONCE, which isn't callable from purgatory.
>=20
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/lkml/175578ec-9dec-7a9c-8d3a-43f24ff86b92=
@leemhuis.info/
> Bisected-by: "Joan Bruguera Mic=F3" <joanbrugueram@gmail.com>
> Fixes: df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3D3")
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Alyssa Ross <hi@alyssa.is>
> Cc: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Perhaps this is indicative of other issues in RISC-V land, but
allmodconfig complains about this patch:

=2E./lib/string.c:17: warning: "__NO_FORTIFY" redefined
=2E./lib/string.c:17:9: warning: preprocessor token __NO_FORTIFY redefined

> ---
>  arch/riscv/purgatory/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index 5730797a6b40..11f4c275f141 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -31,9 +31,9 @@ $(obj)/strncmp.o: $(srctree)/arch/riscv/lib/strncmp.S F=
ORCE
>  $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
>  	$(call if_changed_rule,cc_o_c)
> =20
> -CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
> -CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
> -CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
> +CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIFY
> +CFLAGS_string.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIFY
> +CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIFY
> =20
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved sy=
mbols.
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ZFT5h/br0IBkD5vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHfMIAAKCRB4tDGHoIJi
0skGAP0RP0L15KqUDxAa/Z7n2whLtyvwOJmOwsbDDBUC+eTiWAD/cULCWm/j6GXO
GcD+DaRrgW5urSzwpXiAq1ng8PzMFwg=
=q9r1
-----END PGP SIGNATURE-----

--ZFT5h/br0IBkD5vu--


--===============5638362541332931329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5638362541332931329==--

