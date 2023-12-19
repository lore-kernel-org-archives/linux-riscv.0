Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FAEC46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7cUyeoSxwBwWYcssAQTYXEFp/rdhFe/5Gr6DuCyzS8=; b=SHgpQqxKWLzrj1ur0vXV5iao0p
	kgqoVEFedfknBGycQ/zaUkwZSIdHtqFKTHHyoMqJawgPG+IZdC7AaVRVcf0ESiRhyWLv4y6z5a7h/
	CoBUf0gr4/jSGu6Uy/4pT+YEXMhN266zgsrsdeuxKBF/86wOvlzSsZidPMHoj2YHHRrtof7rL/L8p
	BkOO7v7+loEGR0XIZ+zFtuZNXKgHsq3S9AWqrS+y0+z2/KOOism8kuXuwnWnVfSUYC0qMx+3pEWLN
	aLbuB70U7exOp16cDUTR9u84bn1yemA311uxggyudKFuccSTNZYVb3wfoW4fP95+VKjus3Ss61XJ2
	pfsTruxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdjk-00Etlt-2O;
	Tue, 19 Dec 2023 17:18:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdjh-00Etk1-1U
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16F02CE180A;
	Tue, 19 Dec 2023 17:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC7CC433C9;
	Tue, 19 Dec 2023 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703006304;
	bh=Rbbi3bdXZpPeMfvZ8EXC5cjsGqmRUe5g0GaIMT4Ia+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDhmM2wWIG/1DeafIJBUkpCGfcZshWLfuFWRfarG75sYFkd5gi9lryaZnOt3+n6nZ
	 oCDbK4lJcdC896QpbEGLJ0Jv8e3tGTvC+8XdsyBs9WWC2E1X5+MvL4APdat9/cqBOY
	 V7YuxuEZz2FfnOsAzcCaS9R9RRByJOrdzuKIVxXNGm1ah+VaazcKXmKPumTDAQtx7N
	 eem5F2ne2mPJvuXEKLngJw5xXhkxS+NFGgr2XtRMiAaT8V09AfAUDJA4IbOEgXVj3c
	 8/6UGm04sOEoZT4XxHOhNkhJqchB0X9zUFLmbgf7bhpKyVgquMb7rpukI2cDohqGeG
	 8kJtuNDK3f9ow==
Date: Tue, 19 Dec 2023 17:18:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, geert+renesas@glider.be,
	Atish Patra <atishp@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, apatel@ventanamicro.com,
	alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>,
	suagrfillet@gmail.com, jeeheng.sia@starfivetech.com,
	petrtesarik@huaweicloud.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Message-ID: <20231219-fernlike-device-4d7186aa4deb@spud>
References: <20230810-crewless-pampers-6f51aafb8cff@wendy>
 <mhng-550dee8b-a2fb-485b-ad4d-2763e94191b4@palmer-ri-x1c9>
 <20231206-precut-serotonin-2eecee4ab6af@spud>
 <CA+V-a8s3MjvpD8gAE7-mOUc6PEytbPOR6x_PHuw0J0hOLkaz-w@mail.gmail.com>
 <20231207-buffalo-varmint-de843c8a12bb@wendy>
MIME-Version: 1.0
In-Reply-To: <20231207-buffalo-varmint-de843c8a12bb@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_091829_951154_EE0E93F0 
X-CRM114-Status: GOOD (  29.22  )
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
Content-Type: multipart/mixed; boundary="===============7289604470276840820=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7289604470276840820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y0vuaG6s5+IsNzDE"
Content-Disposition: inline


--Y0vuaG6s5+IsNzDE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Dec 07, 2023 at 01:11:23PM +0000, Conor Dooley wrote:
> On Thu, Dec 07, 2023 at 01:02:00PM +0000, Lad, Prabhakar wrote:
> > On Wed, Dec 6, 2023 at 2:26=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > > On Wed, Dec 06, 2023 at 04:52:11AM -0800, Palmer Dabbelt wrote:
> > > > On Thu, 10 Aug 2023 02:07:10 PDT (-0700), Conor Dooley wrote:
>=20
> > > > > I'm perfectly happy to drop this series though, if people general=
ly are
> > > > > of the opinion that this sort of firmware workaround is ill-advis=
ed.
> > > > > We are unaffected by it, so I certainly have no pressure to have
> > > > > something working here. It's my desire not to be user-hostile that
> > > > > motivated this patch.
> > > >
> > > > IIUC you guys and Reneas are the only ones who have hardware that m=
ight be
> > > > in a spot where users aren't able to update the firmware (ie, it's =
out in
> > > > production somewhere).
> > >
> > > I dunno if we can really keep thinking like that though. In terms of
> > > people who have devicetrees in the kernel and stuff available in west=
ern
> > > catalog distribution, sure.
> > > I don't think we can assume that that covers all users though, certai=
nly
> > > the syntacore folks pop up every now and then, and I sure hope that
> > > Andes etc have larger customer bases than the in-kernel users would
> > > suggest.
> > >
> > > > So I'm adding Geert, though he probably saw this
> > > > months ago...
> > >
> > > Prabhakar might be a good call on that front. I'm not sure if the
> > > Renesas stuff works on affected versions of OpenSBI though, guess it
> > > depends on the sequencing of the support for the non-coherent stuff a=
nd
> > > when this bug was fixed.
> > >
> > ATM, I dont think there are any users who are using the upstream
> > kernel + OpenSBI (apart from me and Geert!). Currently the customers
> > are using the BSP releases.
>=20
> That doesn't really answer whether or not you (and your customers) are
> using an affected version of the vendor OpenSBI?
> The affected range for OpenSBI itself is [v0.8 to v1.3).

Did you perhaps miss this mail Prabhakar?

Cheers,
Conor.

--Y0vuaG6s5+IsNzDE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYHQWwAKCRB4tDGHoIJi
0qC/AQDhdNlr9kHILIKz2xZ2WYD3SYxAiUhSXQD5sQ628Xbt2wD+Ln3DFaA1ILE1
XDHWGjSnaEkAkeVg8Q8Dz5D/SwDYFAo=
=Fz5n
-----END PGP SIGNATURE-----

--Y0vuaG6s5+IsNzDE--


--===============7289604470276840820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7289604470276840820==--

