Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A660C5B567
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 18:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5bGdcA3R251kGP7U4D4Gb3duoXslcChIxhayhRHzW8=; b=Nht05A3pjkuGdjidD3HRYyI6/g
	CqBWKlnmh0DWKIowFnpwpC89rvMNOmerdPSO0J+4ClIp/AqMnnbAM0mw5/9B/aj85j3i9nMFa4OAs
	iV6u1fECz6IJpMAAQ/LdtWpO0P7iWBuZge9p1fQabpAxGO8e0HU1519+Ri4lBd/xwhu+U19M16ja3
	TqpOYMJ3OOeWnsre6n4A/m3JLADG2B/toq5jsby2iz4HQyhfpCyqZhQsUsVHEYZnJ5N61Rhjs3996
	m6Qh5WKP3h0xcWyAaZ3jjNounQekLiaFQoZay9pXmvy5zZYSPfLBK7TzqhEotbr2vOgwKdBYRrtkc
	wkPaKCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV7m-0000000Cg5h-3ts2;
	Mon, 10 Aug 2026 18:53:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV7l-0000000Cg5R-0KDj
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 18:53:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D100143236;
	Mon, 10 Aug 2026 18:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB11F00A3A;
	Mon, 10 Aug 2026 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786388004;
	bh=7GxOeUlyUG4ybPakrovY5NUScmEL7zfuaPQdQwyYtls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RWjLKg86a+vF/t3JvMmoJRDxR/r4/bPOgDNXgClGwqmiYg2MW03M0vnbsfqd7TAB2
	 syTzqmxaFR0BJWqlOPeFQquyQk7qkAgzlg5ldO9Wt5+J6p1sqZezMuDnvZRXmx6Ha/
	 bhX7lY1FLMWSDaZSyckUstxv7WBQmu5ykFOhKhIvL+WnTuP5ckCBBdE28p9Op6bdq+
	 dUV+zGeR1Qbbh/Hyqlzfoid4vIeHWOCQAyg3/pM4Cgatc38Q4glJj1xCbmoDVnMQ7o
	 xOer2Vsgt2MLy0uwklZ0h2Nv+GJNNT+tX9Za2MYeUSt/VacsHLE9zY2M1b3pvX5/Sk
	 enjGvEi5K/gFg==
Date: Mon, 10 Aug 2026 19:53:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chao-ying Fu <cfu@mips.com>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: Re: [PATCH v4] riscv: Use Zalrsc extension to implement atomic
 functions
Message-ID: <20260810-credit-gratified-114ac01c48f1@spud>
References: <20260723-p8700-zalrsc-v4-1-59c21b252e29@htecgroup.com>
 <20260810-preoccupy-earwig-c8d98044c1da@spud>
MIME-Version: 1.0
In-Reply-To: <20260810-preoccupy-earwig-c8d98044c1da@spud>
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
Content-Type: multipart/mixed; boundary="===============4783980130595873416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4783980130595873416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpQbjJK0ANyZyyUF"
Content-Disposition: inline

--xpQbjJK0ANyZyyUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 04:57:00PM +0100, Conor Dooley wrote:
> >=20
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index 3c945d086c7d0266b685f9506d58b0662af071c4..cd5bd5e8eb395418c3ad103=
dbd836c775b7fd901 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -44,6 +44,17 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
> > =20
> >  	   If you are not using the P8700 processor, say n.
> > =20
> > +config ERRATA_MIPS_P8700_AMO_ZALRSC
> > +	bool "Replace AMO instructions with LR/SC on MIPS P8700"
> > +	depends on ERRATA_MIPS && 64BIT
> > +	default n
>=20
> Why is this default n if your platform does not work without it?

Disregard this, I said it before I noticed that there was emulation

--xpQbjJK0ANyZyyUF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanoeHgAKCRB4tDGHoIJi
0o5NAQCVFZOOimIWisUURKaYxHeNXm4bfaGqIDrpJ+rfYFWbrAEAkWatHmE/Zy4N
Oc1wDEv62ySUmt8nWX642Clb6IlS9wc=
=6/Qx
-----END PGP SIGNATURE-----

--xpQbjJK0ANyZyyUF--


--===============4783980130595873416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4783980130595873416==--

