Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74032C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PnT/F4z0GG5uRzCIennFe2KXwjv12d6ImyI/qAyVac=; b=F4ZIyhcP1f9dmYbl8mFk/+xskq
	fPBNy/bPmltZ7Ew02IgzhI6mbTPQ5NUsJeTZV97IgVYJcbWfn9u4C4Yy//zxkR7/GKA2RuPutxH6W
	FmtqzI+zn1pH7PRt/+xkyJxA4wJ9RyFnZyCGSwvr6S5nMvi1iwFsNFOyhsBsJ87XDIRQjqXhIPE6P
	DdIMHWEEJlHhK9VtcpX0A2oyAVQszJZpTNTQ2s8re2jxJwR14cU2cyhwTYSgCCVeL81aO1emniHD4
	qZxUjSXqMAmiI9U+pNRr6aCoW/yKp2SrePE3h6BwSC2TTb0sJkP7GZW8PFxBQx8ntDNePuluaq+7L
	m5B/cRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ogF-00000003VWq-3rib;
	Wed, 22 May 2024 16:19:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ogC-00000003VVt-1LM1
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1C4DCE12C3;
	Wed, 22 May 2024 16:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90569C2BD11;
	Wed, 22 May 2024 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716394739;
	bh=FTTUmVBujcIjuBX9O9Z4Gfs4mxUrGuEVwLRPaL8l0BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8E2te2n7/1lDHTo6LUKfBMqzSxeAQEXJbRNqTCYCHHsszaUFhKSz08eSXqmTr3Ue
	 OimAR6n5dAUeH4vrKMLOfcSGs7eBWO5U/zyJnYm+4odyS9tnMQrINQoBelF/ZiOwiA
	 5s5txba3Aglyjb5CSttKXG4Mw1PJItz4HPwt0mIdKX86WevQzXZu4LUNsoecjdoT+0
	 XnDESX7tQ7LAIh6xqul6EcLn+9ko6tANZuerVcDIxuAkd2dftNlhcmfPlfvV9cYxWU
	 VWfvabATTDU3rTnuYOpcdINh8s+I6DP3FZRwzax9TDJ86BTRcQwIk3fue9u4iWrEGm
	 13apFdU6mAJVQ==
Date: Wed, 22 May 2024 17:18:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
Message-ID: <20240522-confused-epic-03a59031e645@spud>
References: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_091904_850751_3C2480A9 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Type: multipart/mixed; boundary="===============6028015607574486966=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6028015607574486966==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9mh636u/PTV1OGEX"
Content-Disposition: inline


--9mh636u/PTV1OGEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 09:13:28AM -0700, Palmer Dabbelt wrote:
> This first one isn't showing up in a in-flight merge `git diff`, but it l=
ooks
> pretty straight-forward
>=20
>     diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust=
/arch-support.rst
>     index c9137710633a..4d1495ded2aa 100644
>     --- a/Documentation/rust/arch-support.rst
>     +++ b/Documentation/rust/arch-support.rst
>     @@ -16,7 +16,8 @@ support corresponds to ``S`` values in the ``MAINTA=
INERS`` file.
>      Architecture   Level of support  Constraints
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>      ``arm64``      Maintained        Little Endian only.
>     -``loongarch``  Maintained        \-
>     +``loongarch``  Maintained        -

I think this is actually the wrong resolution, and the \ should be kept
as it was added as a fix in commit 01848eee20c6 ("docs: rust: fix improper
rendering in Arch Support page").

Cheers,
Conor.

>     +``riscv``      Maintained        ``riscv64`` only.
>      ``um``         Maintained        ``x86_64`` only.
>      ``x86``        Maintained        ``x86_64`` only.
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

--9mh636u/PTV1OGEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk4a8AAKCRB4tDGHoIJi
0mK1AP9Pxgv9bhp8dbNKAXiD5cCYopI1w29Rdtl2b0fCUCdXkwEAv41/xxjdQZEp
R78M3mmahMKQdBka2ZfnttLHkVKA3wA=
=Basl
-----END PGP SIGNATURE-----

--9mh636u/PTV1OGEX--


--===============6028015607574486966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6028015607574486966==--

