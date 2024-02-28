Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFEAC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiyEbJl4x7NgZnbulB6+V0Bsu0CCy4fEyJSk5Wy2gOw=; b=33x7uWacJCQnliA/cFt/qFRafV
	RLbdKOx4TSjgwQwWvadyQytNmPgqj3wzAxrjj636uFpLoZLY3qSuebvrN0gHfZDehcSjiVDLEJ5BV
	0mFvhswQwMwBIQX+hstLzJVU9Iy94pXjEqsa4v5+3yqPGg7hd7SmaDgCTkCPpWwxYmtmm1Azh6ejs
	KXLiV2K1NXYaIm4MQ5eyHVSC5XVGaEFkd4BZjwpAXAxQsCxByh45Nnp3jwQDBNZA1E0dNVvB8lkhG
	Ll1yI2nCDyySaJADwD9XzS8SI4fgRq7ARE3Ht5ZVya2e0DoXrtm/pIrm7Zri9WMifgTGKVVcc//h/
	OYY2w/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLkc-00000009sDu-3FK8;
	Wed, 28 Feb 2024 15:21:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLka-00000009sDE-2xT1
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 15:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2043B6187A;
	Wed, 28 Feb 2024 15:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFB2C433F1;
	Wed, 28 Feb 2024 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709133699;
	bh=Y2o0FRacDS3mFULfR5wkJ8AGuzyyqfzfYbMEDh5ISvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5+3am7dFzyNH3svpjQNbZ18bBVtGFxJN9sYU/AQsZYlh3HKOvEJYXZ/RP46/wB9e
	 9u3I88AkDbLXdc3tiysjSX8/xSjhNJrflJLTTrNcKBJQlYqAPSiP3h6CxsgaEE+93F
	 iQQQqm8aoy1QBv2qJSH18Sxg1aBveIEx5HvgfXiuK1qeYjQjZ8rAZSZ1EM+KiaTaS4
	 F5+O1tTzYS4lkpYK3g0htvY34Q90IBR8LO7nwTXxM2H7cX3oek7Ykm7dnKsvbfH/d1
	 yX5CDPTLtye3G6wpj4bStDej7Sv6ci9x1lPa2OLitkURzHJbYN+WB5Mgt3YprRcLsJ
	 AhmpXBWJ+Aclw==
Date: Wed, 28 Feb 2024 15:21:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: Allow NOMMU kernels to run in S-mode
Message-ID: <20240228-reverence-vaseline-590175d7901e@spud>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-5-samuel.holland@sifive.com>
 <20240227-seventh-overgrown-2fa453e8a775@wendy>
 <21e03db9-efb7-4e26-9b0d-4931afd62194@sifive.com>
MIME-Version: 1.0
In-Reply-To: <21e03db9-efb7-4e26-9b0d-4931afd62194@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_072140_914862_DE351219 
X-CRM114-Status: GOOD (  22.44  )
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
Content-Type: multipart/mixed; boundary="===============6163314405042442908=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6163314405042442908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mJowefI5gHiXMm/u"
Content-Disposition: inline


--mJowefI5gHiXMm/u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 01:02:11PM -0600, Samuel Holland wrote:
> Hi Conor,
>=20
> On 2024-02-27 6:24 AM, Conor Dooley wrote:
> > On Mon, Feb 26, 2024 at 04:34:49PM -0800, Samuel Holland wrote:
> >> For ease of testing, it is convenient to run NOMMU kernels in supervis=
or
> >> mode. The only required change is to offset the kernel load address,
> >> since the beginning of RAM is usually reserved for M-mode firmware.
> >>
> >> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >> ---
> >>
> >>  arch/riscv/Kconfig | 15 ++++++++++-----
> >>  1 file changed, 10 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index ef53c00470d6..0dc09b2ac2f6 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -64,7 +64,7 @@ config RISCV
> >>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
> >>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> >>  	select BUILDTIME_TABLE_SORT if MMU
> >> -	select CLINT_TIMER if !MMU
> >> +	select CLINT_TIMER if RISCV_M_MODE
> >>  	select CLONE_BACKWARDS
> >>  	select COMMON_CLK
> >>  	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
> >> @@ -220,8 +220,12 @@ config ARCH_MMAP_RND_COMPAT_BITS_MAX
> >> =20
> >>  # set if we run in machine mode, cleared if we run in supervisor mode
> >>  config RISCV_M_MODE
> >> -	bool
> >> -	default !MMU
> >> +	bool "Build a kernel that runs in machine mode"
> >> +	depends on !MMU
> >> +	default y
> >> +	help
> >> +	  Select this option if you want to run the kernel in M-mode,
> >> +	  without the assistance of any other firmware.
> >> =20
> >>  # set if we are running in S-mode and can use SBI calls
> >>  config RISCV_SBI
> >> @@ -238,8 +242,9 @@ config MMU
> >> =20
> >>  config PAGE_OFFSET
> >>  	hex
> >> -	default 0xC0000000 if 32BIT && MMU
> >> -	default 0x80000000 if !MMU
> >> +	default 0x80000000 if !MMU && RISCV_M_MODE
> >> +	default 0x80200000 if !MMU
> >> +	default 0xc0000000 if 32BIT
> >>  	default 0xff60000000000000 if 64BIT
> >=20
> > The first default seen with a passing condition is the default chosen,
> > right?
>=20
> Yes, exactly. It's not required for the conditions to all be disjoint.

I had actually gone and checked was doing the right thing, but I didn't
manage to convince myself that this was intended behaviour rather than
an implementation detail. What I saw in the docs for default was:
"If multiple default values are visible, only the first defined one is acti=
ve"
and I suppose "visible" is what is used to cover the if part.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--mJowefI5gHiXMm/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd9PgAAKCRB4tDGHoIJi
0p9fAP4oVyq079FR8VVeHLxfQpN1jV17v4VmsjHPNWksXn+mNQD/Rv7JMAR+mJbV
LAy3Zpg/8TRlPfdbhnqwRAmKtOvdoQ0=
=hrDd
-----END PGP SIGNATURE-----

--mJowefI5gHiXMm/u--


--===============6163314405042442908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6163314405042442908==--

