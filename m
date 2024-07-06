Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD27C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sO0sRax9p/7ntxRZNggaGWPa/7SNWG7MCuatoC1B1fI=; b=lzxhC3u51PbsfR9PEKRDahF6F7
	AoLlLGKVyG8BxdCdpykplJ9FosGzsARJqpDp6eROId8qEM4l/bJfuHmAHMUOk/7ECndLSZ7b94WRt
	cVkOwu/4ulIzoEkEHnUhem+WOvJdHaFMS8OgRhoPDNBWJSEFM3C8R7PWaGHJdO6QhP1v2eh9fZlZW
	8i7SJkKLSj7FQ3Ly47QcQC/pjytz5zbAuIG/bMHcSN+AbvuauNn9tpmv6MERIBflEn3QoEglddrAT
	5NRnBy5owrxlyScZmwuFmcqqOarHUbiUSYItwswfuiLGGMkey6EQPmgFvsW/Cp1mgzIapbE1T9q34
	y0sDKMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ4kV-00000000DpV-0fVv;
	Sat, 06 Jul 2024 12:42:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ4kR-00000000Dp6-3NXa
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 12:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A136CE2B3D;
	Sat,  6 Jul 2024 12:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3FBC2BD10;
	Sat,  6 Jul 2024 12:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720269755;
	bh=5ENXDBMXjmBF8k+3fFYXj93fQplVf1tf/1nvD0CaQKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoLWMmPcnjpFf8esl6hgCqhPDj5PqyEsrTzO55nalHLxCPaeZFXfSVSj8yK67wH/G
	 3uODPanPgVwiAtGQEoikDTOqQji5SZij2Gqua89zyBIrKL24W0Lx0CFjy7vA6QFEeW
	 XYXW+44HhK5U2uvLj/xKpWbusoyYvc6iJaJWFaYrK+++2prj4yjkQzn3r+j5cbIZ/d
	 1dEM+qzGBLuOO7Sugn19QX/u2trEToCEYrjbE7aWXH/VJer7XCW0FZo5WznS6z/EPb
	 2cXYpb+NzaMqvz+H/j7e05o+vM2PrgJofxT0vj/ifXDQA1fklOXROxaOt/4yKBiQlr
	 rOcyUtJWVtpZQ==
Date: Sat, 6 Jul 2024 13:42:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
Message-ID: <20240706-remote-undergo-3b9dfe44d16f@spud>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
 <20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
 <20240705-unaired-pesticide-4135eaa04212@spud>
 <6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_054240_226441_27D14919 
X-CRM114-Status: GOOD (  30.52  )
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
Content-Type: multipart/mixed; boundary="===============0868649178116635030=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0868649178116635030==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aooyyyTiQwVeE6tX"
Content-Disposition: inline


--aooyyyTiQwVeE6tX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 05:24:19PM +0200, Thomas Bonnefille wrote:
>=20
>=20
> On 7/5/24 5:01 PM, Conor Dooley wrote:
> > On Fri, Jul 05, 2024 at 03:42:23PM +0200, Thomas Bonnefille wrote:
> > > The Sophgo SARADC is a Successive Approximation ADC that can be found=
 in
> > > the Sophgo SoC.
> > >=20
> > > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > > ---
> > >   .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 63 +++++++++++=
+++++++++++
> > >   1 file changed, 63 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-=
saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-sarad=
c.yaml
> > > new file mode 100644
> > > index 000000000000..31bd8ac6dfa5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.=
yaml
> > > @@ -0,0 +1,63 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title:
> > > +  Sophgo CV18XX SoC series 3 channels Successive Approximation Analo=
g to
> > > +  Digital Converters
> > > +
> > > +maintainers:
> > > +  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > > +
> > > +description:
> > > +  Datasheet at https://github.com/sophgo/sophgo-doc/releases
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - sophgo,cv1800b-saradc
> > > +          - const: sophgo,cv18xx-saradc
> >=20
> > I don't think the fallback here makes sense. If there's other devices
> > with a compatible programming model added later, we can fall back to the
> > cv1800b.
> >=20
>=20
> Ok I'll do that, I wasn't sure if it was a good practice to fallback on
> another SoC specific compatible.
>=20
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description:
> > > +      SARADC will use the presence of this clock to determine if the=
 controller
> > > +      needs to be explicitly clocked by it (Active domain) or if it =
is part of
> > > +      the No-Die Domain, along with the RTC, which does not require =
explicit
> > > +      clocking.
> >=20
> > What does "explicit clocking" mean? Is it clocked directly (or via
> > dividers) by a clock on the board or another source?
> >=20
>=20
> It means that, if a clock is provided, the driver will work in "Active
> Domain" and will use the clock generator of the SoC to get the right clock
> signal.
>=20
> However if no clock is provided, the controller will work in "No-Die" dom=
ain
> (Always On) and use the RTCSYS subsystem to get its clock signal.

So it does have a clock, but provided by a different provider. I don't
really understand why that would "excuse" it from having a clocks
property, with the RTCSYS as the provider.

>=20
> Indeed "explicitly clocked" may not be the right word to describe that,
> maybe some thing like that is better :
>=20
> "SARADC will use the presence of this clock to determine if the controller
> needs to use the clock generator to get its clock signal (Active domain) =
or
> if it is part of the No-Die Domain, along with the RTC, and does not requ=
ire
> the clock generator."



--aooyyyTiQwVeE6tX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZok7sgAKCRB4tDGHoIJi
0lbpAQDwZEbhHg3rnEogG8hOoesPmLsMyjpyNzblwX9hRpY4cAEAhWAWi099oKNO
nEQMmNkQKNvn/HlxM66JXbe1kmIIMAQ=
=RK8u
-----END PGP SIGNATURE-----

--aooyyyTiQwVeE6tX--


--===============0868649178116635030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0868649178116635030==--

