Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D20F46450
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSvPzol1NpPEJ9mkOTCaS/6QaH1ac6qJIOFJxBP8oPU=; b=vRmYQo6A3EwbfWe8O9Mu2LZo0G
	V4AYiu8hQMDpRAMFFCUah8QO4hOqD0ifQkqGkyfPr547qctEB9amnlqSt9mqWsH1Yc1EPwUrImT9e
	XaMktIvkFWBeYWcUCJEd/9+0LAbh8e5wlrARrWk8hRCStP3qvxqJIXiopNyW0drwpCdtS3oTcz6SU
	VzRBYPHrpc1/sP7zdjd659U/T1BwDBfP8v4X1udLBLElM9CeMUpvuBrFpI651/9ckqbqNqB4kW0Kk
	yk7O6x8BkZREJ2RI3Qj+Capl4qdQz1tNBwSxOSlFmQZN7zg5DTZ3dpNrjmTRZNW3Ic96VVfVA8Y4S
	8K/eFSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25pY-00000003nKW-3Qv8;
	Mon, 16 Mar 2026 11:09:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25pW-00000003nK9-49o4
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 11:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1F3D6132E;
	Mon, 16 Mar 2026 11:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC91C19421;
	Mon, 16 Mar 2026 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773659389;
	bh=HBdCmmhHtctxj1golQhPltmCQklAUr8W6M2Q6tKeyGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJoecujV0GhhUofpqraiqNvaycUK2foFtkkhWG/1mZ62T4TLwbg5moDADqE6rzYgO
	 MlEsN7lus4cw/Y4hsYyxzsr8oAH4JRhtU9XAaU4ITQuxLZhs7YyUGNTIx2woO/3Zgv
	 mwTl+MrvvVspIY4QNM3UNGMzEPROiy3GfwHNbSuVkKveOtypeoN68jWceEFa+bZn4c
	 bD5Mk3Gjh70V3CBhlL535R/4c+MzmcbAXGrtojGhXXOzA4J4YBcrFerkmi614Aogv3
	 EuEww9OPB8zOaFIEYrRKSFBcgKMRH8R/FlL2ZGHIZQ95LN+ty5fz8h1DI/rsEY8nU9
	 9fS54PdTj/ATA==
Date: Mon, 16 Mar 2026 11:09:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260316-handshake-subdivide-9de6c4410927@spud>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud>
 <abbTwrAALGy3QbxN@gen8>
MIME-Version: 1.0
In-Reply-To: <abbTwrAALGy3QbxN@gen8>
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============7044072628809952556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7044072628809952556==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZWjbRAn/4RQId7UP"
Content-Disposition: inline


--ZWjbRAn/4RQId7UP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 08:44:02AM -0700, Drew Fustini wrote:
> On Sun, Mar 15, 2026 at 12:12:13PM +0000, Conor Dooley wrote:
> > On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> > > On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > > > The G and J coefficients provided by T-Head TH1520 manual (which ca=
lls
> > > > them A and C coefficients and calls H coefficient in the binding as=
 B)
> > > > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > > > respectively), however the binding currently only allows coefficien=
ts as
> > > > precise as 100 milli-Celsius (1/10 degree Celsius).
> > > >=20
> > > > Change the multipleOf value of these two coefficients to 10 (in the=
 unit
> > > > of milli-Celsius) to satisfy the need of TH1520.
> > > >=20
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > > ---
> > > > Changes in v3:
> > > > - Added Drew's R-b.
> > > > - Fixed some typos in the commit message and slightly reworded the
> > > >   precision sentence.
> > > >=20
> > > >  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 +=
+--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr7520=
3.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > index 56db2292f062d..7d57c2934a8a1 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > @@ -105,7 +105,7 @@ properties:
> > > >        G coefficient for temperature equation.
> > > >        Default for series 5 =3D 60000
> > > >        Default for series 6 =3D 57400
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >      minimum: 1000
> > > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > > =20
> > > > @@ -131,7 +131,7 @@ properties:
> > > >        J coefficient for temperature equation.
> > > >        Default for series 5 =3D -100
> > > >        Default for series 6 =3D 0
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >      maximum: 0
> > > >      $ref: /schemas/types.yaml#/definitions/int32
> > > > =20
> > > > --=20
> > > > 2.52.0
> > > >=20
> > >=20
> > > I have applied this to thead-dt-for-next.
> >=20
> > That's odd, why is a hwmon binding in your branch?
> >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/com=
mit/?h=3Dthead-dt-for-next&id=3Deb4fd43ff6793681f0a0a8e8ac861142caba2b19
> >=20
> > I don't see an ack on it from the relevant maintainer either?
>=20
> Sorry, my mistake, I should not have applied the binding. And you are
> right to point out that there was no ack from Guenter or Rahul Tanwar.

It was Guenter I was thinking of, but there's not one from myself, Rob
or Krzysztof either.

> I will drop both patches from thead-dt-for-next and wait for agreement
> on the binding.
>=20
> Thanks,
> Drew



--ZWjbRAn/4RQId7UP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfk+AAKCRB4tDGHoIJi
0hWfAQDZ0FufgisOFhUsbTsOfB8kghldgdUrVL5N9dOE+aRvqgD+NxMI7qC0YpnD
E1yazpn740hQ65uhnVmZxGGP4eLCwQ0=
=pOwF
-----END PGP SIGNATURE-----

--ZWjbRAn/4RQId7UP--


--===============7044072628809952556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7044072628809952556==--

