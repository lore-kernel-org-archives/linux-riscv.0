Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7304CC27C54
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTF4ir5zRPg8wLSRgDQr9IsiJDt3upxl++lPgI5nZ4A=; b=bf3xE56x3OSoUIjY2k49MgMY0v
	6yUbO/GOKM+e5hHzBsLRnpBAzAzUraMQ6ymvxwEswz2fz6M90lOXy3q77zzWIN5dco6Rfcmh+YCcJ
	RUF4DqcVn8o7UOrhzQf6JLLSUZpPigW/+Uu+CaLDjr1ipaLKZtK9T6PXRKR4zAJvDCzb8fXNdxX4v
	KBiCKOeiSUJMbatcZbRc0Ky5MrKwshsHjwhHOxsBVPkC2QItsWpWDeq+N6kOdEGFs6NJKo26fpTac
	hX+BPGI04PS7wDCk6Dq5wZjtY9a1ZbE8ot+GSR8lObsw6/GyeJrsP/Tw7UJjXM10EfXnef5cXO5+3
	jQhE2Hpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGYW-0000000AdOS-3WAd;
	Thu, 06 Jun 2024 17:05:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGYU-0000000AdNw-0BG0
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 17:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FC2561D13;
	Thu,  6 Jun 2024 17:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0329C32782;
	Thu,  6 Jun 2024 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717693536;
	bh=12E14gZ2QAVnMNIwYrxVZwM9VywDI+b+6wOtVi7+4Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psnUEsSea+eKkkjw5n7TpdK5/LBJ1+DobMAK6WYLPPxBBfQ+EBq0vBV2RZiU4D7I0
	 fcoIzRVXWRhVpXPqbryYVLeyDUuVhgBNuKNLES386QFENIiVFrER26zRLtKVolmLuQ
	 rw5B4f3jLDzwsQhNE570Q+IUuDKD1m61O3LRD0Q5TwQrqyPgxtY63n6FsQhCnmD2yS
	 MwvQ5RxGe6jq5oEdp/RGBRodueLukB2iS2YIDY8XzkjlPOFzj1OJLETDI6g2ZTIeIY
	 hAepgIuESGPbYrZOe7w4pI8H+InLbYomIEWsrIAYdLdxOKpVElqruG0/RY5P5iV9Yr
	 3DXThSnx6yBMg==
Date: Thu, 6 Jun 2024 18:05:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: sophgo,cv180x-thermal: Add
 Sophgo CV180x thermal
Message-ID: <20240606-reaction-thirsting-8c22d1b5ab72@spud>
References: <SG2PR01MB4218013241B3EED779D3BAE8D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
 <SG2PR01MB42189977B4172405F5704CC4D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
 <IA1PR20MB49531F55C8D7DC5D0050CAF9BBF92@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240605-tightwad-janitor-82cfceb1469d@spud>
 <SEYPR01MB4221F0E46F600E013974F21BD7FA2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
In-Reply-To: <SEYPR01MB4221F0E46F600E013974F21BD7FA2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_100538_187590_AB48AF19 
X-CRM114-Status: GOOD (  23.52  )
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
Content-Type: multipart/mixed; boundary="===============8363569519209904483=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8363569519209904483==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xNgNBLWP/RMLxW5/"
Content-Disposition: inline


--xNgNBLWP/RMLxW5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 01:32:46PM +0000, Haylen Chu wrote:
> On Wed, Jun 05, 2024 at 06:54:17PM +0100, Conor Dooley wrote:
> > > > +  accumulation-period:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: Accumulation period for a sample
> > > > +    oneOf:
> > > > +      - const: 0
> > > > +        description: 512 ticks
> > > > +      - const: 1
> > > > +        description: 1024 ticks
> > > > +      - const: 2
> > > > +        description: 2048 ticks
> > > > +      - const: 3
> > > > +        description: 4096 ticks
> > > > +    default: 2
> > > > +
> > > > +  chop-period:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: ADC chop period
> >=20
> > What's a "chop" and why is either this or the accumulation-period a
> > fixed property of the hardware? Shouldn't this choice really be up to
> > the user?
>=20
> The chop-period is an ADC parameter.
>=20
> Both accumulation-period and chop-period specify how the sensor
> measures temperature. Making these parameters up to end users brings
> extra unnecessary code complexity. Being configurable for each board
> should be enough and other thermal drivers have been doing things in
> this way.

Other systems may well have properties for this, but something being
done in the past doesn't mean it might be the right thing to do now.
I don't really buy that this is something you set to a fixed value per
board, but rather the use case of a particular board would factor into
whether or not you would want to use a shorter or longer accumulation
period.

> > > > +    oneOf:
> > > > +      - const: 0
> > > > +        description: 128 ticks
> > > > +      - const: 1
> > > > +        description: 256 ticks
> > > > +      - const: 2
> > > > +        description: 512 ticks
> > > > +      - const: 3
> > > > +        description: 1024 ticks
> >=20
> > Can we just make the number of ticks the unit here, and above?
> > Also, a "oneOf: - const" structure is just an enum.
>=20
> I do not catch your idea. These values directly map to raw register
> configuration, which simplify the implementation a lot.

It should be trivial to convert them to register values in your driver.

> > > > +    default: 3
> > > > +
> > > > +  sample-cycle-us:
> > > > +    description: Period between samples
> > > > +    default: 1000000
> > No constraints?
>=20
> Sample cycle is more flexible because of hardware designing.

It quite likely has constraints, flexible or not. Is the hardware
capable of both 1 us and uint32_max us?

Thanks,
Conor.

--xNgNBLWP/RMLxW5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmHsWgAKCRB4tDGHoIJi
0vG7AP48IalU1RGZ/KbtaGu/vPghK4eP4Nk9f7t4VJwKdTosBwD9F3Yrkl2G2Ylr
82IeEwZmoQQrxmHthTZEV+dAIf6BJQk=
=4835
-----END PGP SIGNATURE-----

--xNgNBLWP/RMLxW5/--


--===============8363569519209904483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8363569519209904483==--

