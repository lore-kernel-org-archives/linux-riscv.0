Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E403CCD1A7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlV4QPDKtixwrv8In7DkECFezG3SWfOKG+Es8AIhHko=; b=ZfMCkzVim+oEs24/cUZ4EJaLli
	cNaayokkSFEnmYMTDL2IqDmxi4x8yMn6YeB6Bx2hgDKh+JvoguLICImWsP5ecSOx0WpkXOIHR9SKD
	Htlc290cW04oKUNxg/RE8ab6BEMlOEvxYNTQH0ratBVgWQqiqQi7UpSCIV6wSW9wOc/sKME34/PnC
	K2BpArykUe4vy0PVBasffYK7yNA+6LW7pTJNtRY8SlzJUWLoY/OCHzUspY6xOc3ytC/jx2gUXIxMn
	vsOGXKZdYTCWRaX0HH2I62vKp6tH4EJJb8WjTh0muausrF8GT771LRt/dljh3WA4dSCb+hcWZHPJA
	SENVsGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAunh-0000000EeKJ-29zL;
	Mon, 20 Oct 2025 18:40:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAung-0000000EeJu-0u0f
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:40:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B7AB602D0;
	Mon, 20 Oct 2025 18:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5788FC113D0;
	Mon, 20 Oct 2025 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760985593;
	bh=6ZobidfUZRr5YPSXECJ1ntZWp1zK3/rG9AFA9LwreOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctr6YqQA+4Vz9znc5SmDWjoWNoC7vIiLZeSCug4aqfz60YDh/3MgX3T5+A0/Wsk89
	 N5ck19xRI1ebu6nsXI2NkXBC3FXm8hkGiQt1AOMbbeI4BAifAlDocjsGZho39tGSJl
	 hNa9jMP1IC2xDf5EujbJf4kPUpO7IN4Iqab5+efkAOSXyapYApU4K+tC+BiZlfKD0P
	 XtOGsecGDA9unwpOsMgLeldBOnZq2WKodKTFBU+1S76PWzdpTvuxjn/4NKtbIKeOiK
	 DFserqdy/ZWzQpRn+nhSjmpVLmt+wTFcR75VX4a8IVoGurwo+piXrGO6jrdCioIyjm
	 hDEX+Wa7SEfCw==
Date: Mon, 20 Oct 2025 19:39:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, han.xu@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Message-ID: <20251020-florist-campus-a397bf94d129@spud>
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
 <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
 <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
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
Content-Type: multipart/mixed; boundary="===============4872175504525248534=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4872175504525248534==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K0j4x5+NWZnVy7rE"
Content-Disposition: inline


--K0j4x5+NWZnVy7rE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 07:26:17PM +0100, Mark Brown wrote:
> On Mon, Oct 20, 2025 at 01:06:46PM -0500, Alex Elder wrote:
> > On 10/20/25 12:39 PM, Conor Dooley wrote:
>=20
> > > > +          - spacemit,k1-qspi
>=20
> > > Are the newly added resets mandatory for the spacemit platform?
>=20
> > This is interesting.  I never even tried it without specifying them.
>=20
> > I just tried it, and at least on my system QSPI functioned without
> > defining these resets.  I will ask SpacemiT about this.  If they are
> > not needed I will omit the first patch (which added optional resets),
> > and won't use them.
>=20
> It might be safer to describe them, otherwise things are vulnerable to
> issues like the bootloader not leaving things in a predictable state.

Yeah, if a linux driver requires that a bootloader set up a clock or
de-assert a reset etc, then the binding should mark them required since,
as you say, a bootloader change might do away with that de-assertion.
Additionally, the stage doing that de-assertion etc could be U-Boot
or barebox, which import devicetrees from Linux, so making sure that
the resets are present has that benefit too.


--K0j4x5+NWZnVy7rE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPaB8AAKCRB4tDGHoIJi
0j7DAQCssl1u//5OdqF2WI3Y8/8tpB69AxoA9vxxUcT06wOMOwEA4jhf4n774nNx
AWp2GcFRl/p1el8AYLR8ebrER5zBeQ8=
=rH4o
-----END PGP SIGNATURE-----

--K0j4x5+NWZnVy7rE--


--===============4872175504525248534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4872175504525248534==--

