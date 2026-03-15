Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259E5F3026E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6yD0kFMvMCo6iguFUhT0v6CTOKUiyyrEq2gKXqNptU=; b=xReAGGy4AhBo2Xou6603NSjcV7
	IfavVXzm+QTXB3wzL5zI1F92gMLvRGWv85tldGuB5SMg8l76yo/28kr8wFx1+kvJFuwFhxksUAolT
	LAFnpB7Xw8fbAzl7ZqQyfRMMaxryhcoM9iGAb842TQ+TanQqpv7K0Q9MbXEpS1K/vBIkiqQq9HDxz
	mUIbCG4+tfUWeB6kE7MrDODG6jWuq2p8sDunEmJ1ak6+DZKl5Omrn85iYdY2PNfRIOn3BP7DgvkrO
	+IquWNtgEcXBa6ESo5qeGnJdRiZ671FaIYa34VvkxYgl1o2iJLUpBU5foKRjaeWIcdOzcNmowV687
	sCWxBXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ndT-00000002hRx-0u7u;
	Sun, 15 Mar 2026 15:44:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ndP-00000002hRa-0O9s
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 15:44:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F19124397E;
	Sun, 15 Mar 2026 15:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C0FC4CEF7;
	Sun, 15 Mar 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773589443;
	bh=T2WiSdPf90DBlRhXs8K5bj+h+XrpfiKq077HjRLBytM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fq6T5vXp4HTEDulwoRGzNwgc+NvCL4su0DtGKkqkA5XHuCNlauZSpHNVnMTuy0iql
	 x8o3NxdQYpaCHHxpNixLRfNrRvIhMdPyB+BZRfzBCE/UwQ7vnQxm9BsqkfwiGCNjNc
	 T3JkwFy8thKTHjfEAfhUlgBw+wT8RxX6nifo/4qAJHeqf+q4gFx0/4ox6YHVUgrxWc
	 uPyYHq6lVpJyYhYuMreubfrfLEW7lwkVvTq6Z3Q3KtnWc0W/9aeejV5c6kToQWGsNy
	 kcno2KIIME1Yw4s8a7z+vUB6Y7wLb/nxHxyIfxtaeniqUHGqjGkripH1Xg5QG1dc4P
	 aJ496NPPnzupg==
Date: Sun, 15 Mar 2026 08:44:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <abbTwrAALGy3QbxN@gen8>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud>
MIME-Version: 1.0
In-Reply-To: <20260315-cogwheel-dislodge-a3efe31728d1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_084408_678262_F6970618 
X-CRM114-Status: GOOD (  25.10  )
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
Content-Type: multipart/mixed; boundary="===============3851886904077487257=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3851886904077487257==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+F+4oLCDbQt9O7DS"
Content-Disposition: inline


--+F+4oLCDbQt9O7DS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 12:12:13PM +0000, Conor Dooley wrote:
> On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> > On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > > them A and C coefficients and calls H coefficient in the binding as B)
> > > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > > respectively), however the binding currently only allows coefficients=
 as
> > > precise as 100 milli-Celsius (1/10 degree Celsius).
> > >=20
> > > Change the multipleOf value of these two coefficients to 10 (in the u=
nit
> > > of milli-Celsius) to satisfy the need of TH1520.
> > >=20
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > > Changes in v3:
> > > - Added Drew's R-b.
> > > - Fixed some typos in the commit message and slightly reworded the
> > >   precision sentence.
> > >=20
> > >  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.=
yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > index 56db2292f062d..7d57c2934a8a1 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > @@ -105,7 +105,7 @@ properties:
> > >        G coefficient for temperature equation.
> > >        Default for series 5 =3D 60000
> > >        Default for series 6 =3D 57400
> > > -    multipleOf: 100
> > > +    multipleOf: 10
> > >      minimum: 1000
> > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > =20
> > > @@ -131,7 +131,7 @@ properties:
> > >        J coefficient for temperature equation.
> > >        Default for series 5 =3D -100
> > >        Default for series 6 =3D 0
> > > -    multipleOf: 100
> > > +    multipleOf: 10
> > >      maximum: 0
> > >      $ref: /schemas/types.yaml#/definitions/int32
> > > =20
> > > --=20
> > > 2.52.0
> > >=20
> >=20
> > I have applied this to thead-dt-for-next.
>=20
> That's odd, why is a hwmon binding in your branch?
>=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commi=
t/?h=3Dthead-dt-for-next&id=3Deb4fd43ff6793681f0a0a8e8ac861142caba2b19
>=20
> I don't see an ack on it from the relevant maintainer either?

Sorry, my mistake, I should not have applied the binding. And you are
right to point out that there was no ack from Guenter or Rahul Tanwar.
I will drop both patches from thead-dt-for-next and wait for agreement
on the binding.

Thanks,
Drew

--+F+4oLCDbQt9O7DS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCabbTuAAKCRDb7CzD2Six
DAWrAP4xDvkXL4ryz5mqHC42vAKQLprtWK3yOVHg0qHRPUP0LQEAzWZ82751xGky
SDgVYjNgQpHEejY52ScPCJjQS9yh2g4=
=EKB3
-----END PGP SIGNATURE-----

--+F+4oLCDbQt9O7DS--


--===============3851886904077487257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3851886904077487257==--

