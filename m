Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2282F47CAF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYFbheEb0Rj2hSDTQgMTjK4M6ENz26KT1qWK3Yzvx3k=; b=nQi4S5SJrc9jtSugfVJHecgiDE
	tRWJ69rMqWAJvxUTIoHe7jPPfwjEK2W2mR1CvcE6aVRuI0g9ufd/F7aodhO6RRyICAotFYFPh/i4h
	QzViU0JTZVAuib6vIx+m+ipU+ylc+LdywGLNglimbbUpAYv4BEfWed54THDbTujiE1T8K7gX3Cr95
	+IcwfPg1ppzdTHUVricg5SGHy+a0GggFwJBrNeBQ1Lu1YoC7P0/nPluZXMqUYeKngxUlV1YGNqnNx
	fy7zuvncVk93VDTr81teAcbolly9vNw2010aH9gQ7SRjFGX43SEk8oibUwTsn9stT7WYgTZVg5GAC
	Ki5JfMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDhK-00000002PP7-1TPt;
	Thu, 05 Mar 2026 18:45:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDhI-00000002POX-0C0Z
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 18:45:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 212BA43D37;
	Thu,  5 Mar 2026 18:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE9AC116C6;
	Thu,  5 Mar 2026 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772736319;
	bh=wsYjqB9J7mzSdi2vE2GDXREsczkZV08MQoRRhEFx/Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeYrGP7M0an4uOihoCpIV2Hx/7WzsK7ff/SgCGJw16K6G2oFLhZ0zvztBCNlutzcN
	 UohbRvo5wMVeeee+GkQ4Jd1DFP67pZBdQO23uYgNedDUmSzyVmAlnNcZYtNcTbMJK0
	 xSPHqCuHvOqtTcaZk+rk234gctsdffCB67Fmg1yPifvGLb6ZOdFVc0jYXjmQYckycn
	 N6jhhpz5UrN6fbqy35duwZ8hFhYuU8PNLB2YPfzMfGG03H351EK+jqNl+X0WUMNAk8
	 iKnTiaCO49k3/ZjcwTKcDvBcz+uT4MmYK1Gx2a51uVB9gbTO177rF+QU7NHLUqOqL0
	 rtGBdHC2ABY8g==
Date: Thu, 5 Mar 2026 18:45:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260305-rocklike-deplored-bb2677f5b97c@spud>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
 <aanNQSHxLh2OsbvK@x1>
 <94d742d9ace2ce58ed31525a58973b3a13257577.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <94d742d9ace2ce58ed31525a58973b3a13257577.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_104520_121372_1717153B 
X-CRM114-Status: GOOD (  27.45  )
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
Content-Type: multipart/mixed; boundary="===============8915151685124259918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8915151685124259918==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="41/65V20v5C4L0rA"
Content-Disposition: inline


--41/65V20v5C4L0rA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026 at 02:39:40AM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-03-05=E5=9B=9B=E7=9A=84 10:36 -0800=EF=BC=8CDrew Fustini=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Mar 05, 2026 at 10:40:43PM +0800, Icenowy Zheng wrote:
> > > The G and J coefficients provided by T-Head TH1520 manual (which
> > > calls
> > > them A and C coefficients and calls H coefficient in the binding as
> > > B)
> > > has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
> > > correspondingly), however the binding currently only allows
> > > cofficients
> > > as precise as 100 milli-Celsius (1/10 degree Celsius).
> > >=20
> > > Change the multipleOf value of these two cofficients to 10 (in the
> > > unit
> > > of milli-Celsius) to satisfy the need of TH1520.
> > >=20
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > > New patch in v2.
> > >=20
> > > =C2=A0Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4
> > > ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > index 56db2292f062d..7d57c2934a8a1 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > @@ -105,7 +105,7 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 G coefficient for temperature eq=
uation.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 5 =3D 60000
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 6 =3D 57400
> > > -=C2=A0=C2=A0=C2=A0 multipleOf: 100
> > > +=C2=A0=C2=A0=C2=A0 multipleOf: 10
> > > =C2=A0=C2=A0=C2=A0=C2=A0 minimum: 1000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > > =C2=A0
> > > @@ -131,7 +131,7 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 J coefficient for temperature eq=
uation.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 5 =3D -100
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 6 =3D 0
> > > -=C2=A0=C2=A0=C2=A0 multipleOf: 100
> > > +=C2=A0=C2=A0=C2=A0 multipleOf: 10
> > > =C2=A0=C2=A0=C2=A0=C2=A0 maximum: 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/int32
> > > =C2=A0
> > > --=20
> > > 2.52.0
> > >=20
> >=20
> > I am wondering if there is any backwards compatibility issue but
> > there
> > are no other users of this compatible in mainline other than th1520.
> > There is also the precendent 030d2a0ce5dc ("dt-bindings: hwmon:
> > moortec,mr75203: fix multipleOf for coefficients") having change the
> > property. I suppose it is a not a problem unless other people on the
> > list raise an objection.
>=20
> Well mathematically any number that is a multiple of 100 is a multiple
> of 10?
>=20
> So theoretically there should be no compatibility issue.

Ye I don't think this is likely worth worrying about. The restrictions
exist in these kinds of cases to tell users they're doing the wrong
thing and using a value the hardware doesn't support, the driver almost
certainly will never care and just "blindly" use the number without
doing any validation, so as long as the multipleOf matches the
capability of the hardware you're okay.

--41/65V20v5C4L0rA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaanPOgAKCRB4tDGHoIJi
0smCAP98dLDeRbRIrJ9YocU71BJXE7G4/X1hmSsR8bNPPvdI7wEAsVy+w8bkDBhX
jbjjUIx7vVJCswO7wS4wXgtVcFg4HAM=
=Sx1C
-----END PGP SIGNATURE-----

--41/65V20v5C4L0rA--


--===============8915151685124259918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8915151685124259918==--

