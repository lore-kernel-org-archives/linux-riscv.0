Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22BFC3ABAC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saU01Aviu7XbNDYYNjr4KdymCj9aUunA0yuHQH2/lpU=; b=t2KZu10HcA5szXiCu4Tvgb3YN8
	suSAx4TXoI8zauGnogIuoq4FfZ+8AcX1cjoh7n0BZaI9hzdWOkOG0csOGU3rAaZGDYQsws5tX07gm
	LMGG7e5e/enoRKRxIs4TC29ZzEtg+mGB9C58+JlhKzgjqWmPjDGDLrbjtpborscaL79uyrYawi5xm
	6+kYLZAPgE4zsS4Qdo/UWbRsAQUcsPhJlig8h9X+oPAwXEvrjdzAu8byNGMRyKJvtANIWLl7ZTYYk
	zbv0Plrbdy/4Nol8zjF6AKmzd9KVngJfhZoetgrrimRhXKyN2HWtUy5nuc6s9MBTEOsENaRRO2+Q2
	92rISunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9uc-0000000DMY4-0akS;
	Wed, 30 Apr 2025 16:03:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9Uj-0000000DJ39-09MT
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 15:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5063E6845C;
	Wed, 30 Apr 2025 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E293C4CEEC;
	Wed, 30 Apr 2025 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027428;
	bh=szeQj+bnY9ogQvY4OUwIgus6AzzTlktdYaxtxFfhJIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ml/JC1N9U9Q1EOkGUdxqyDMwN5oXs6mnxag8VzQw28/OoNJArBckIP3pLeFBKW9ro
	 RcXLw49kpTtAm06RDPMIH5NhkjsFyd4Nsq4ctPWZxJU2LrubnQBNDydTpc6DBmM+cb
	 XrgYWVDRD6Yh5JwUV1EFh3fC9cHTMU0EA6Z8+2RHxIGE+2NJi80TuU9xfHB7oNifh5
	 29tn5y7HKs8eipTx1V5yp5ZMg9ceCwbygZEkpFi8a9yOuuF0FrM28zhQqaS82ochkk
	 W7UpDWv/FulscnvtCe2XDBqpgCHqfa26xMaDCQRWpJOJQC5aqI//7WdUTFzdKEv43e
	 CD0pN63FTVk4w==
Date: Wed, 30 Apr 2025 16:37:01 +0100
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
Message-ID: <20250430-snort-raider-dbf10d14993f@spud>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
MIME-Version: 1.0
In-Reply-To: <20250430-radiance-rebuilt-2caa906d5e6f@spud>
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
Content-Type: multipart/mixed; boundary="===============0846741407697849804=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0846741407697849804==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="87W6SvIbW2ImtIsk"
Content-Disposition: inline


--87W6SvIbW2ImtIsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> >=20
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-c=
v1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_devi=
ce *pdev)
> > =20
> >  static const struct of_device_id cv1800_clk_ids[] =3D {
> >  	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> > +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
>=20
> Given the same data is used here, should there not be fallbacks in the
> dt for some of these? For example, 1812 to 1800? Or is that not okay,
> because 1800 is not a real device id?
>=20
> >  	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> > +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
> >  	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> > +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },

Actually, this one is a better example. sg2000 is not marked deprecated.
sg2002 uses the same match data. Why is no fallback to sg2000 used for
the sg2002 case?

--87W6SvIbW2ImtIsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJDnQAKCRB4tDGHoIJi
0lfMAP45MQndFPi3Xx3SJU+Ys3AnOJrH+Tuj9GmF7L47GJab3QD8Dhn3UBrka0Uc
I2WbsNSSF8pSxW1RW9HI8WsMjkO3WA4=
=WPBL
-----END PGP SIGNATURE-----

--87W6SvIbW2ImtIsk--


--===============0846741407697849804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0846741407697849804==--

