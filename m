Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C420C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtPuEhiX2eXdpa8+Sy2KWFwMEDW7Lgxzp80s+beyMGU=; b=AyWrjEb2ftcFF5+1gDiWFrvnIF
	u3Y0VlrGKgyoPC5Xw+TUUWn5pTv7ym0xoQN7Lbv0KKB5786Ci99NS0/7nhJdFDcD3H3uGKToOJ2LM
	Q4KWsgjbp9gcdbEybCX/J2zVDmF5xfBUpQ2SYm6E5dzW/yMiU2i/GLd6pCV7Pz1psrSX5Rw1QZr93
	kFQTjY55H2m8JLthcsj/H16FSeyIKVwMBfd1ARKugcfL4p+v3DrGxz1OxFDD5cW/yo4cslSeB3iaT
	kz8+3Io/RU8On01QNSl+2HJYUlELj1IEEba32q3Wn17P7yhVH0dtRdrajKltWGxxP63QoBgstmPJa
	DFWx5bwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUnx-0000000FxDo-3uS9;
	Thu, 01 May 2025 14:22:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUnw-0000000FxDh-24dX
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 14:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0996068443;
	Thu,  1 May 2025 14:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D431C4CEE3;
	Thu,  1 May 2025 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746109343;
	bh=rBzRwoJgC9nPVv1XokQKUJ4a0+Ap+oQYmBNV9icBp+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2c/wNcstc22sKguf3GzhxY8FNPZ0zc9gh4t30uC7yQTWApP0Cf15w/toqAhva0sa
	 5aLKUPskmITnWqkpx4ue8WGDDlovvDtKVIFZCXa7T6OwIrK2iGHnLuDw8FrubLL9Ox
	 L5ZHMnwzab69aspDqWJSvyRO6JIs1dZLBXp7lIR33Y49tLppdT1pcBIVPljucpMeKW
	 JH0AWCTsyDNpyK13+mqr3G4ESNr24TDf5skxL6CoH9+TwfQ6AHtc4z+HxiovWQc5SV
	 rKwsslg4uUjRirfVT9W9BXmU0u4UYIyXmlat76v3tOhn9x81oGH1TwRooGEIay62kR
	 9RXI8ptCuftXQ==
Date: Thu, 1 May 2025 15:22:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <20250501-shrubs-unmixable-a2a8a9bedd01@spud>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
 <20250430-snort-raider-dbf10d14993f@spud>
 <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
MIME-Version: 1.0
In-Reply-To: <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
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
Content-Type: multipart/mixed; boundary="===============4780995338081921975=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4780995338081921975==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XVRDKcPyTtvEDhL7"
Content-Disposition: inline


--XVRDKcPyTtvEDhL7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2025 at 06:43:07AM +0800, Inochi Amaoto wrote:
> On Wed, Apr 30, 2025 at 04:37:01PM +0100, Conor Dooley wrote:
> > On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> > > On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > > > Add of device id definition for newly added precise compatible.
> > > >=20
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/c=
lk-cv1800.c
> > > > index e0c4dc347579..e10221df6385 100644
> > > > --- a/drivers/clk/sophgo/clk-cv1800.c
> > > > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > > > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_=
device *pdev)
> > > > =20
> > > >  static const struct of_device_id cv1800_clk_ids[] =3D {
> > > >  	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> > > > +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
> > >=20
> > > Given the same data is used here, should there not be fallbacks in the
> > > dt for some of these? For example, 1812 to 1800? Or is that not okay,
> > > because 1800 is not a real device id?
> > >=20
> > > >  	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> > > > +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
> > > >  	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> > > > +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },
> >=20
> > Actually, this one is a better example. sg2000 is not marked deprecated.
> > sg2002 uses the same match data. Why is no fallback to sg2000 used for
> > the sg2002 case?
>=20
> Yeah, It is a good idea. I will take it, thanks,

Can you point out the difference in the dt-binding patch when you do,
between the sg2000 being a real device and the others not?

--XVRDKcPyTtvEDhL7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBODmQAKCRB4tDGHoIJi
0pqUAPwI/zQNgP9x1HvcIE0paiqb55dihwJ5KU9E0DUZ/tC4egEAigTEf+A6r4+2
rxWOVtgQTrgGBiBhzOKRtofcr/OrIw0=
=6kou
-----END PGP SIGNATURE-----

--XVRDKcPyTtvEDhL7--


--===============4780995338081921975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4780995338081921975==--

