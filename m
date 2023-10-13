Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782D2CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA/zyfgz24bel48gxLJ27l+BJnd7SSuD3cyfmcdJ0Rc=; b=qMwZoqH1PCKa1YljrUVnoU7VhJ
	vcL1b2pBXVo+TPEg+MQo3Sf9MFOKtXhAi76NehWJ0HV7SjoytfPvwMe28/TJO6wCCIhR2YhKElK0Y
	1DXNuU6lZnRAsExpoJoxQpjqXxbfCWGkhSUq8FpiT2NjKBd/71eVSXwE8pkwgWIor4IYjJ9AOvO/H
	6qVGHNKeBQWxuwdTY+oQZpXVEY1gHRzU+f7mDjvrQTAQlzOD++dTvDwJLy81oip15wW2qp6Rqm/Gv
	6fJXr/TH24seOLG7u8uepsZGCbq4vQr1sGLI23jgtprJ6D25KlaI+hKqUZZHmYyBjluGPOElJkeM9
	7AqxGHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrClg-002jMz-18;
	Fri, 13 Oct 2023 07:39:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrClc-002jMD-2K
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 07:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DBD44B81CCA;
	Fri, 13 Oct 2023 07:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAD2C433C8;
	Fri, 13 Oct 2023 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697182766;
	bh=eo8KIczWPwY9bWx+lQaeCj5H0pdQFdK37cTFQzw7hN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ibn4DhOsoo8sWYdMik3Mo+y6VmbGJWv6J7g749P50rbCnD3w/Qaz9AvuJpXRaO4fS
	 c4MzLOi0UD914mHuSxWkmXDNVABiDgvQHz1VIqcgDc0iFRI3YqR3v3TWzmSSoL1GKO
	 5fF+qWW+ad0NWWwch1awp1y84/4Snt4AcgniDjxQ5hFpnF9j35CQUDuEaan6x6opkp
	 ttqE02hZxdXGOOO9cyhBeWIM4UhtVKS8Elr2kBsLofATWHfERHebW+SzguyslOr0M1
	 bPhLLI94QWTsdFXNNM9Q78zd28C1rbmV3pAwZA634P3PFrTQmDzV4zDIWOKXYaW1uo
	 oAz8CYmJuXCCw==
Date: Fri, 13 Oct 2023 08:39:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 2/6] RISC-V: Move the hwprobe syscall to its own file
Message-ID: <20231013-reattach-acre-0f878a04b80f@spud>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-10-ajones@ventanamicro.com>
 <20231012-geologist-ramp-71c76a4305c7@spud>
 <20231012-3dc2e811d6a57ffe90719d2a@orel>
 <CALs-HssbhmFhH6BRUs+B7rwab5KGGaZRC67jOTJL5XJ9EsFa8g@mail.gmail.com>
 <20231012-unflawed-unison-cdb6921776c6@spud>
 <20231013-2f7672ff84aafb4b32143314@orel>
MIME-Version: 1.0
In-Reply-To: <20231013-2f7672ff84aafb4b32143314@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_003929_080281_CE531704 
X-CRM114-Status: GOOD (  33.68  )
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
Content-Type: multipart/mixed; boundary="===============3372983718307285456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3372983718307285456==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8E2hH1efuQxNg5Et"
Content-Disposition: inline


--8E2hH1efuQxNg5Et
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 08:45:39AM +0200, Andrew Jones wrote:
> On Thu, Oct 12, 2023 at 06:02:38PM +0100, Conor Dooley wrote:
> > On Thu, Oct 12, 2023 at 09:42:39AM -0700, Evan Green wrote:
> > > On Thu, Oct 12, 2023 at 9:11=E2=80=AFAM Andrew Jones <ajones@ventanam=
icro.com> wrote:
> > > >
> > > > On Thu, Oct 12, 2023 at 02:45:14PM +0100, Conor Dooley wrote:
> > > > > On Wed, Oct 11, 2023 at 03:56:13PM +0200, Andrew Jones wrote:
> > > > >
> > > > > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > > > > @@ -0,0 +1,276 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * The hwprobe interface, for allowing userspace to probe to s=
ee which features
> > > > > > + * are supported by the hardware.  See Documentation/riscv/hwp=
robe.rst for more
> > > > > > + * details.
> > > > > > + *
> > > > > > + * Copyright (C) 2012 Regents of the University of California
> > > > > > + * Copyright (C) 2014 Darius Rad <darius@bluespec.com>
> > > > > > + * Copyright (C) 2017 SiFive
> > > > >
> > > > > So uh, this is all new(ish) code, originally written last Septemb=
er,
> > > > > that is being moved, right?
> > > >
> > > > Yeah, I just pulled the Copyrights over by standard practice of code
> > > > movement, but I agree they don't make much sense for the code I mov=
ed.
> > > > I suck at copyright management and would be happy for suggestions h=
ere.
> > > > If Rivos would like to put one here for the work Evan did, then I'l=
l be
> > > > happy to add it. Or, if people prefer, I could add a Ventana copyri=
ght.
> > >=20
> > > I probably would have stuck a Rivos banner on it if I had written it
> > > as a new file myself, as I think they "own" the work I do. But it all=
 feels
> > > a bit like vanity license plates given it's GPL, so I imagine whatever
> > > you do will get no real complaints.
> >=20
> > Aye, that's how I see it too. I've not bothered adding that stuff where
> > I could help it. The git history shows who made copyrightable changes to
> > the file anyway, but obv. I am no lawyer.
> > Just in this case, since as far as I could tell this code was written
> > from LPC onwards, it made little sense to copy over some 2012 era
> > copyright information.
> >
>=20
> So what's the final plan? I feel a bit strange adding a Rivos copyright
> while copying the Rivos code over since I don't consider myself
> "authorized" to do so.

They didn't add one when they made the changes, so I wouldn't.

> I also don't want to add a Ventana one for just
> code movement. Do we need a copyright on this file at all? Should I move
> it without anything and then add a Ventana copyright when adding the
> which-cpus stuff?

I would move it without anything.
Apologies for derailing things with copyright notice crap :/

--8E2hH1efuQxNg5Et
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSj0KgAKCRB4tDGHoIJi
0viAAP97f4wewRRDsjEdPA3rFrH0fZfGK/eOgGKxS/Y6cA0MCwD/dJ9lN7GZknsE
onuHmYk+3tq2XrXntHiuWTSaWi00BQY=
=bhU8
-----END PGP SIGNATURE-----

--8E2hH1efuQxNg5Et--


--===============3372983718307285456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3372983718307285456==--

