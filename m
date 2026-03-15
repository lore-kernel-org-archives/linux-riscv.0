Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47F6D58B17
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4+8gjbNNlrK4JoVgtrefsgqH2I0Mr4/FS4Sqp4UVDw=; b=Qtk8dApBDJQw5cUAJlwG/kTmye
	ttxE2c6pO0uLNULCMhdlSIGAo+25fxEHgB+YqZma6lSQlp3+E7fpTCUGVM643e7EC2P8K3acXiJGS
	lZvDxv5DKju1327CHEvBbNZTj3S2ZtagSCtRXkjSw8fXuFR2rpAg8zme+mc6jinn/vAH7a1QP4cb0
	7sHwM+14+nGbu4PqGgWGsDjsd94HtAzr2DPkNNXbpNHaZ/b2E22XYqgWS/w1o1u/+lOCfDSgCvJZY
	519iYlbA8hcpiXrLwbwXoxKLHI2Vam2Ng9smusT/PTjHYdJYcOCn+qTA7SsA2N5c8vhsASYUEBKFD
	zxyJsX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kKT-00000002amH-1gHM;
	Sun, 15 Mar 2026 12:12:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kKR-00000002alw-0cjK
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 12:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B68C402E2;
	Sun, 15 Mar 2026 12:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F112C4CEF7;
	Sun, 15 Mar 2026 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773576738;
	bh=6CGcM3IIxKsMzHTVUtHK9uC5NP4xomnmcR+Vtyq5J4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xye8T87sqEmhusxuk+NSjtJawsXqCHdy/Tp6LOpl1tOZb0g1oMBTy1jQyMbY1URn/
	 yUVlDlGzUiAuvvX3ywbujI7hnxLgEuhMdhI/LD3kaHVVuTHlwjdOx/Qo8DzvZ7dULi
	 Njs5ME23BdPtoQpF2xqbXxp6kLZzpX0b/P/7BtKIQOazSFo1hU6bhy+hFbCnXiKBmA
	 eHTx97n9AJhRmA77ZF8AwAl7rIZ++qHs+SoGZqqh5netbueup7dtYkL+TkiLDtMPkK
	 WnRWjmw6qis6GhaUjTPq7CLbz12qcjAtq9IFdLsIOULpkVc+Ngf+bsLWBgU5aZ4KxI
	 nGfhnCXdrTkbA==
Date: Sun, 15 Mar 2026 12:12:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260315-cogwheel-dislodge-a3efe31728d1@spud>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
MIME-Version: 1.0
In-Reply-To: <abWTO7QBFIcjxKn6@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_051219_248768_1D2165BF 
X-CRM114-Status: GOOD (  21.06  )
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
Content-Type: multipart/mixed; boundary="===============6663096075420497168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6663096075420497168==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K2OPznGYZkKn+vwY"
Content-Disposition: inline


--K2OPznGYZkKn+vwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > them A and C coefficients and calls H coefficient in the binding as B)
> > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > respectively), however the binding currently only allows coefficients as
> > precise as 100 milli-Celsius (1/10 degree Celsius).
> >=20
> > Change the multipleOf value of these two coefficients to 10 (in the unit
> > of milli-Celsius) to satisfy the need of TH1520.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > ---
> > Changes in v3:
> > - Added Drew's R-b.
> > - Fixed some typos in the commit message and slightly reworded the
> >   precision sentence.
> >=20
> >  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.ya=
ml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > index 56db2292f062d..7d57c2934a8a1 100644
> > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > @@ -105,7 +105,7 @@ properties:
> >        G coefficient for temperature equation.
> >        Default for series 5 =3D 60000
> >        Default for series 6 =3D 57400
> > -    multipleOf: 100
> > +    multipleOf: 10
> >      minimum: 1000
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > =20
> > @@ -131,7 +131,7 @@ properties:
> >        J coefficient for temperature equation.
> >        Default for series 5 =3D -100
> >        Default for series 6 =3D 0
> > -    multipleOf: 100
> > +    multipleOf: 10
> >      maximum: 0
> >      $ref: /schemas/types.yaml#/definitions/int32
> > =20
> > --=20
> > 2.52.0
> >=20
>=20
> I have applied this to thead-dt-for-next.

That's odd, why is a hwmon binding in your branch?

> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/=
?h=3Dthead-dt-for-next&id=3Deb4fd43ff6793681f0a0a8e8ac861142caba2b19

I don't see an ack on it from the relevant maintainer either?

--K2OPznGYZkKn+vwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabaiHQAKCRB4tDGHoIJi
0sHpAQCQjzi+cNolm2xVUQPM/xhXGlaZd27ksgr515avB8wazwEA23VtiIN0eo3j
ca7CEQM0KubAhupaXlPmwyZWu6IPNwY=
=4gr8
-----END PGP SIGNATURE-----

--K2OPznGYZkKn+vwY--


--===============6663096075420497168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6663096075420497168==--

