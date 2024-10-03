Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE7DCF857D
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayVaP4jrf5UdTCinlTQ2IAnYT1dw3xED36zYHjwfN38=; b=Cu7De2EAHeYsZFtF9kgpmLG694
	CKMRR0+Khll4sfdPFge59GoFylxCO9MK1dm7U3GIBlcIOkTfYOImefxZ5v/MBAU4ceAeJiSLG0PX5
	5NhtSaCP2MHM87UQjU+EPQzeIy4KcXjGuLwfQJua+49lmxlKkMsCnUXHs3tsRbPN+mA49r8kSMSOq
	tRQL0HmhexeVghCP1acuZaq8BsnabLT1/bcZDmZRrYvGmad3PVCd8Jw6koCaf5hJJBHEykgdhUKTI
	B2v+nOA40UNXw190Q+CB2jpwENx/WhG5HuyKL5xyifqpSazAH/6M1AQXZBmyC+sRyKA3JBOyd1hKy
	EStI4LpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swJeO-00000008rMm-0Ou6;
	Thu, 03 Oct 2024 11:05:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swJeJ-00000008rL5-1YeL
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 11:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B72A75C5BED;
	Thu,  3 Oct 2024 11:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85564C4CEC5;
	Thu,  3 Oct 2024 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727953534;
	bh=IRPu9PkUbz+dFzJ4rkLXyM9DGV9j0tNNK6BigQdP7XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qn8FIOvZ/VuTBe462XN7OHux1pUzHPFrIp1skj0zosXIeARv8hAj3E/ySCKtzxjxp
	 09JkmE7ONJxgKMWEVhorjFc37C6cU+y9gN2o5LY5zBBw8Mc/LBdWwR46kfL2JMmIVi
	 KE63zbkEwAsQmESM1I2BSaIKprnLlUlkpbHh2WxZi8YLdzT4MYSORfqhdShEOwY7bC
	 o4mYZ4MUuymqwFJWEYs4ymOMSSFksDWk+tR5pX68/fMznfefLZlgdEMB2wDrSd6U4h
	 tAMJT2KgB+dsipVTq7tiJ4EMXgYkodmosq/KheaGTa/BRq0O+rjNehlJfUWcZytdjj
	 PKRjfVrmumBkw==
Date: Thu, 3 Oct 2024 12:05:30 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v1 5/5] dt-bindings: riscv: document vector crypto
 requirements
Message-ID: <20241003-variable-quirk-9a13fe040e4a@spud>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-sincerity-urgent-acdb0e8d8a66@spud>
 <0fa7461f-5c7c-4f18-ac02-66d37e2c559c@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <0fa7461f-5c7c-4f18-ac02-66d37e2c559c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_040535_517558_F8352B17 
X-CRM114-Status: GOOD (  19.86  )
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
Content-Type: multipart/mixed; boundary="===============7772404750007038820=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7772404750007038820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HroZ+uV00yIqexpw"
Content-Disposition: inline


--HroZ+uV00yIqexpw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2024 at 09:59:38AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 02/10/2024 18:10, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Section 35.2. Extensions Overview of [1] says:
> > | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the co=
mposite extensions Zvkn and
> > | Zvks-- (sic) require a Zve64x base, or application ("V") base Vector =
Extension.
> > | All of the other Vector Crypto Extensions can be built on any embedde=
d (Zve*) or application ("V") base
> > | Vector Extension
> >=20
> > Apply these rules in the binding, so that invalid combinations can be
> > avoided.
> >=20
> > Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-=
release-698e64a-2024-09-09 [1]
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index abf2579171c5b..02b822bbf341d 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -651,6 +651,38 @@ properties:
> >              - contains:
> >                  const: zve64f
> > =20
> > +      - if:
> > +          contains:
> > +            anyOf:
> > +              - const: zvbc
> > +              - const: zvkn
> > +              - const: zvknhb
> > +              - const: zvks
>=20
> Shouldn't zvksed and zvksh be part odf this list ? My understanding of
> the spec might be wrong but "Zvks--" seems like a poor-man's wildcard
> for Zvks* extensions ?

I don't think so, there's a corresponding -- on the first line of the
quote. I think it is some really odd styling that should be replaced by
commas.


--HroZ+uV00yIqexpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZv56egAKCRB4tDGHoIJi
0q+XAP4ja16VtZOTGXq9vok9Co1HNrwbljm0CPOR0Z0+0jPpEgD/TH4OjHN89AB3
JmxtsmtuTZlulCNrokTF5ObEBZ8MSAw=
=nnno
-----END PGP SIGNATURE-----

--HroZ+uV00yIqexpw--


--===============7772404750007038820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7772404750007038820==--

