Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4775FC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjSm+6Y2GT3U02ZHYK5PrgBJqMYKKdJHUyKY4AsMmaw=; b=i9/NrqkPg/Gb4M6ObdzzP2avQ9
	fzv94/YSS1p1IhuHDSoMElyf97f2v4r/VV40gA2Z1jjpRc64OxX6iFkAINzztqYSiZBT444x4sr9I
	zOiXhHCLV8njYutDOjY9d1ARTJaEZflZLOILb6hv9IZdPaUpTMaTigghb4uqSax0xoLUYtn+z2nvo
	Z+m7N5ke+rK2QXlPNi4W8n/U6pdnitnbLcbXQKkDP+OaMmipIwUWTuM4tK9NN5ZZZdFOWUA3hdco2
	G99KwlCB/pl5UarHCHt71eRhcKRvHaqnp9ybTsAc+TEGnIza4ZkJApmV1zDP/KiO+K01gSK32U4VO
	ExXIVqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naapi-008THE-N1; Sat, 02 Apr 2022 10:18:14 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naapg-008TFR-0b
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 10:18:13 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 397BC1C0B79; Sat,  2 Apr 2022 12:18:02 +0200 (CEST)
Date: Sat, 2 Apr 2022 12:18:01 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, michael@michaelkloos.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
Message-ID: <20220402101801.GA9428@amd>
References: <CAK8P3a3mzax-OiaxBcxM_RgKNsd6N8HW0odRmw38u2jKE5aYaQ@mail.gmail.com>
 <mhng-3e1f2147-7acb-4dd7-8fce-41ec72def1d7@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-3e1f2147-7acb-4dd7-8fce-41ec72def1d7@palmer-ri-x1c9>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_031812_266108_C2077F66 
X-CRM114-Status: GOOD (  20.02  )
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
Content-Type: multipart/mixed; boundary="===============0758537851977764260=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0758537851977764260==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>That'd be wonderful, but unfortunately we're trending the other way --
> >>we're at the point where "words in the specification have meaning" is
> >>controversial, so trying to talk about which flavors of the
> >>specification are standard is just meaningless.  I obviously hope that
> >>gets sorted out, as we've clearly been pointed straight off a cliff for
> >>a while now, but LMKL isn't the place to have that discussion.  We've
> >>all seen this before, nobody needs to be convinced this leads to a mess.
> >>
> >>Until we get to the point where "I wrote 'RISC-V' on that potato I found
> >>in my couch" can be conclusively determined not compliant with the spec,
> >>it's just silly to try and talk about what is.
> >
> >I would argue that codifying the required extensions through kernel sour=
ce
>=20
> The problem here isn't the required extensions, it's that vendors can cla=
im
> to implement an extension on hardware that doesn't exhibit any of the
> behavior the specification expresses that systems with those extensions m=
ust
> have.  The D1 is a very concrete example of this.

Sounds like someone interested should make a webpage listing available
CPUs that claim RISC-V compatibility but far short of advertised
claims?

I'd like to get RISC-V board to play with sometime soon, and some help
in what board to get would be welcome...

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmJIItgACgkQMOfwapXb+vIdfQCaAgXDlqG17hztlH0G92GavUtD
yZAAn13P0BpPSIS+L3ydlZhmPdM2ROWs
=9jvG
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--


--===============0758537851977764260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0758537851977764260==--

