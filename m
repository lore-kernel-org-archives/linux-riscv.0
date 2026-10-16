Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D104CCA46C
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQ1RuKx3RJtiG5NilNWVhgkVAk7x3pWBrH7iHS4YtVk=; b=IVO7nWHiP4w3+CVMpC1ugVxx3p
	WkW9C4b0s+jCoVtrUcWOQ2zUxirPV+4wo5v3aaneYSI502uL8e8/kfgB5D7vmUUyUZhAXA8Ptj7Bi
	gt3/Ebva+IkK8iYySCZz1cqy0OQrhFZs2lFMw08jsvYCztmyBc1kWqJ3ADAVqOMtRFtNvxwIlx3mG
	RtrHXUiM5Yh9cMzlXSszCy7zwb2XPmcS2l6hUZkY1ttqcVhm+kwVokerpCeqwiICX93/CVV6FNUSP
	DlmeItEvVl6EWCGNvPZ8ojq8HGth1DKtJpa44fkVIf1mXZRi4ZP5GZbrBn7YLkq+FfJEyscQb9PRL
	oZYQsZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhT4-00000002yXV-3uhM;
	Fri, 16 Oct 2026 12:55:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhT3-00000002yXH-30uK
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 12:55:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 2A4D660008;
	Fri, 16 Oct 2026 12:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 524A81F000C4;
	Fri, 16 Oct 2026 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792155324;
	bh=x2YQasmYgNoIcWbMmM7tADEOHzZFlLvmhusTwPVBOpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bqShC6nT1pyz78bMkGYWwjI3dBBdGbTYOwNRVHfOycHplyHnMZxpw8+N22yP8j3C+
	 9lbp2DJWOWZUFIqvLHYOJbsjc4DNKtRw+ODU0vjlDmsojFUCfxB5OSIAg14rvYc34d
	 iamtkyRgPBi0N3HVBqFmb6t8izI9DpSzVVCyNHV8aUteGBYyIn3xQTPwmuI45ZnojD
	 jXFXuJgSYR0cZVwydSbmsBv6wVluj9WorPaODzN/WfK2U5scEDChGpDP3stIqBLCbK
	 JqLV0JJLhDlmsD//vOvvoSJXWPBzyLyYeWq8MFdNX2U9zhsuO3dT9l7Hz7X5WSZZI8
	 jwUylbs/ZCoxw==
Date: Fri, 16 Oct 2026 14:55:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Message-ID: <atH4DnTWVZPkaO2C@monoceros>
References: <20261014110429.52762-1-hal.feng@starfivetech.com>
 <20261014110429.52762-2-hal.feng@starfivetech.com>
 <9c0737d8-455d-4025-8482-950b64029f35@kernel.org>
 <atCos9UIaZoRs4N8@monoceros>
 <20261015-poised-modest-leech-4decf5@quoll>
MIME-Version: 1.0
In-Reply-To: <20261015-poised-modest-leech-4decf5@quoll>
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
Content-Type: multipart/mixed; boundary="===============4482794662127489477=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4482794662127489477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tlxupjokx7zu2hhw"
Content-Disposition: inline


--tlxupjokx7zu2hhw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
MIME-Version: 1.0

Hello Krzysztof,

On Thu, Oct 15, 2026 at 12:27:16PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 12:20:54PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello Krzysztof,
> >=20
> > On Thu, Oct 15, 2026 at 11:01:29AM +0200, Krzysztof Kozlowski wrote:
> > > On 14/10/2026 13:04, Hal Feng wrote:
> > > > Remove the jh8100 compatible since the JH8100 SoC has been canceled=
 and
> > > > will not be released.
> > > >=20
> > > > Change the register size in examples to 0x10, since an OpenCores PT=
C IP
> > > > has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.
> > > >=20
> > > > I will maintain this pwm module in place of William.
> > > >=20
> > > > Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> > >=20
> > > Drop, did not happen. Is it so tricky to respond to the one patch her=
e,
> > > where the tag would be applicable, instead of replying to cover lette=
r?
> >=20
> > I don't know what Maud did, but if they checked that the various dt
> > linters are still happy, that doesn't deserve a Tested-by:?
>=20
> No. Why would compilation be called testing?

I'd call the task of checking if anything breaks with the proposed
changes testing. For changes to .c files that most likely requires
complilation and running the resulting code on a machine. For dt binding
changes it means "testing" if all the existing device trees still
conform to the new binding because you cannot compile and run the
binding specifications. So in my mind this is still testing and a
Tested-by trailer is ok and welcome for me.

And from a more social side: I really appreciate if someone invests the
effort to check patches, by whatever procedure is appropriate, and
honoring that with a Tested-by: tag is the least we can do.

Best regards
Uwe


--tlxupjokx7zu2hhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrSHrIACgkQj4D7WH0S
/k6/6gf/WndYDL7DRTkXBUp7aiUnqS9zwpqTT9urNZ6PAF71xqj2PIQ/2nzKaicH
Qsbfddt0y9u/70gYd72GYVTZI4Juf9S/leijTBlQTzEGnwoE7eIJjeoGdmQwJ34v
XSDKbwPPBCLycHX2PXmnx9S7YabNcFnILSfVs1VLTkW6v7pMqUSvOFfxDqKFxggS
/nuOEEFr+Ol3znei3R3hRHG/tmwrxAXyA0ENwprAg+cea+o0KpF94Nf2eavXCKUZ
QdaiG7qAC4yPPp9EBTke6DsHJ1itFmPGU6219HzEJC2vaCFpmgmwwnLU7bdogJ0s
t6aMJnXKv/yxOXUDoe9YRIi26iq6cQ==
=EJUo
-----END PGP SIGNATURE-----

--tlxupjokx7zu2hhw--


--===============4482794662127489477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4482794662127489477==--

