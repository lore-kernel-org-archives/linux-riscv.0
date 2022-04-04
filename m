Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E04BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81ATaaVQLXAdFZgL4+JZM8WC1QXy+6bflgQ2GhQTsBA=; b=KRSrA+7Krb0wjnv285dSVjII7I
	Dnk6ZTmzQL4+Eiho+/kXFKCRUywVV8x1LyEKyCRgvZZc22zWxLMn+pw6+MAoHler7jvYflRE10w2W
	/mhQ0AoMTRO6UfQPdnbg7NiCGAcrj9rDi4ZWia+8SwlXZwMrJgHLvO5mhbKDlaq6r+qO1cnqfQwWx
	evLi6d4s9AuBEXIesr/QQAlYaPTzEt4ZdaTLY9SKqRugbIisGOPqL87bJct62StQuj7+0O/PeryV3
	pQoZ776KiCOJOu5bl0UuCm9OmMB29EqNoCVY06rhkWRNW95CJK4S8IQLrkQ2Ym8b2R1Dy93g4jpF5
	UoCF9Khw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbQt0-00G3nA-VT; Mon, 04 Apr 2022 17:53:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbQsx-00G3l7-Cr
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 17:53:05 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1nbQsp-00040x-Io; Mon, 04 Apr 2022 19:52:55 +0200
Received: from pengutronix.de
 (2a03-f580-87bc-d400-3524-91ca-8473-ba45.ip6.dokom21.de
 [IPv6:2a03:f580:87bc:d400:3524:91ca:8473:ba45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 2B2945A36D;
 Mon,  4 Apr 2022 17:52:54 +0000 (UTC)
Date: Mon, 4 Apr 2022 19:52:53 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 0/6] RISC-V -march handling improvements
Message-ID: <20220404175253.dgwhy5ibodrn2lyz@pengutronix.de>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_105303_478505_F1CCD4D5 
X-CRM114-Status: GOOD (  33.17  )
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
Content-Type: multipart/mixed; boundary="===============0046639042082002599=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0046639042082002599==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uhvf2hc27jz5qxsc"
Content-Disposition: inline


--uhvf2hc27jz5qxsc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01.04.2022 22:00:35, Palmer Dabbelt wrote:
> As pointed out recently [1], sparse is parsing -march on RISC-V in order
> to obtain the default set of preprocessor macros to use.  Back when this
> was written ISA string was a simple affair, but these days it's a lot
> more complicated.  It's going to be a big chunk of work to get a proper
> ISA string parser into sparse, but we can at least fix the breakages for
> the subset of legal ISA strings that Linux currently uses (and are
> breaking users).
>=20
> This patch set does three things:
>=20
> * Stops die()ing on unknown ISA strings, unless the user has passed
>   -Wsparse-error.  This prints a warning and guesses at the macros to
>   use, which is probably fine for Linux.
> * Cleans up some of the differences between GCC's -march parsing and
>   sparse's.  None of this should really matter for Linux, as GCC will
>   blow up on bad ISA strings, but it just seemed worth doing when I was
>   in there.
> * Adds support for the Zicsr and Zifencei extensions, which were
>   recently enabled.  With these the unknown ISA string warning goes away
>   for Linux builds.
>=20
> They're all sort of independent (and happen in this order), but they're
> all touching the same code so I'm just sending it as a series.  It's my
> first time touching sparse.
>=20
> I've poked around with the first patch on its own and it seems to
> largely work as expected: I'm still getting a bunch of sparse-related
> warnings when I turn on sparse in my builds, but at least I don't get an
> error (after updating to a binutils that supports the new arguments, so
> Linux detects them).  I tried CF=3D"-Wsparse-error", which also behaves as
> expected (that trinary boolean tripped me up for a bit).
>=20
> The first patch alone should be a sufficient band-aid for systems that
> are actively broken right now, the rest are cleanups -- these may be
> necessary to get the RISC-V port sparse-clean, but that's a WIP so there
> might be more.  I'm going to play around with that, but just looking at
> the volume of spew it's probably going to take a while.  I gave these
> patches a bit of testing one-by-one, but not nearly as much as the
> first.
>=20
> I just spun up a sparse repo [2] at kernel.org, these are on the riscv
> branch if that helps for anyone.  I've also started messing around with
> parsing a few more of the multi-letter extensions, but there's so much
> coupling I got fed up -- it's on riscv-wip, but I definitely don't like
> that last patch.  I figured it's better to send out these bits, as they
> look solid to me and builds are broken.  The new stuff (B, K, and V) are
> all in GCC-12 anyway, so we have a bit of time before they're useful.
>=20
> [1]: https://lore.kernel.org/linux-sparse/mhng-c280d48c-477d-4589-baee-25=
5c774b5a51@palmer-mbp2014/T/#maef705f448e4a1f12d853c0d8bc756f037ce1ce0
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/palmer/sparse.git

Works without warnings on Debian testing, with gcc-riscv64-linux-gnu
4:11.2.0--1.

Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--uhvf2hc27jz5qxsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJLMHIACgkQrX5LkNig
013LiAgAlQvlYUkzHjVw5s32PRnPkbsxooJOXYzr28LqRfmAxMp5oRg3LlhkMexP
btK0AZccaa5tHAIExbaJazLRf7YAW/bjL281OnFWubgmt9oI2rEwmEPJmC8kk5tE
9u7s++ys0cOH17JtbGDZ+NNxyiBRti3yN7T0KnXTHDo7AOHL74sA0XHhdYXo4g8d
z/zVVjxzFGbYdsysb8W2JVe06ppgxVGk1BE3ZUAxzBDASL0B2yCsgV3iK2hShKZ3
1scNLdWFHXsiwT0HZEnEvWIJoh7X9XNORlUtI/t9WiyR7kKGWljsooT1cxXaVbI2
pE00Si8mP2OEqScXZ7dkgvcugqz+Ig==
=/UZg
-----END PGP SIGNATURE-----

--uhvf2hc27jz5qxsc--


--===============0046639042082002599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0046639042082002599==--

