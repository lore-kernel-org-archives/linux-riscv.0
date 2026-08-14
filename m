Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A937C5B572
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22OoR3PyZk1znxM/HyQICSJXV/T44uD1jl+2wSNbEx4=; b=p1GqBcuEXpb4AdN1f8eppx1Jmn
	I1XkfK3QsV7O1ZdlLl1zaxBi2kPciT+DPkyFr1C4vH0NxmsC9BEoI2uumogAmudexhQ7n2CYUW6DT
	2c6nIIRM/kqtQxC3FjxvXatKjwLqcSDEd/2i3ZjmsDTd27Ev21aYNkVIbRPW1B3Xw+imTp9oZrIy9
	IFOMQmb8NG2U9DB/7SXnBfMRBgGZ8ydXyIHSY0/X4ggMEQ7ZH55m5PitmdepM6y93Hg7/thcIGE9v
	1MblpQ3BItvEH/ABWoiOaF6jFMdnyWtdWRZcmbKJwCAdzkSU3zqq8uTNJsRKZWGcWBEYROUAK4XC4
	pc7m99uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus6t-00000002jMn-3yJu;
	Fri, 14 Aug 2026 13:38:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus6t-00000002jMh-186r
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 13:38:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F54E44EFD;
	Fri, 14 Aug 2026 13:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707161F00A3A;
	Fri, 14 Aug 2026 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786714690;
	bh=dUqihhCTp+fPeUQLTUG0twiBw++x8qelMHcg/V6RTE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnCwHyga2LHGMJvu1/BL2xhhMRzw6aJZoH+iGvFUBPKCOAzYFTsJ+7IvvKrUFubxt
	 Ede9+wPexYfc5BHXC19+z8+tbNNDIR6pzTxQM5TcoUBOpQvDU2qmVrXSf46fBpB2dl
	 63pt6JNQgXu5M9rwsjp5pZM6gSs6SQoZiLkXAtcTw5YKFFsZJkW3S6q4IeNRf0FXxI
	 VYb80ixX5KpSJpgh1Q8uohFlOZcIxfFhscKPoqYM1ifat8x4YRVv9pNCJGSOBfDDZA
	 nmPIR/LZguoQlEFEnTZzyyxaUqRRIxJTeiUDzdvoJX7HR/xI5WOmFLr66UN/k7FEur
	 0jGTM9FGUmL9g==
Date: Fri, 14 Aug 2026 14:38:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260814-reverb-mourner-283116bcc014@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260813-presoak-scarily-b6cdecfcb7cc@spud>
 <ZQ4PR01MB1202CD24FCDA9039EDF2C7A0F2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202CD24FCDA9039EDF2C7A0F2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============2275721100043740683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2275721100043740683==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q4nI28h3rGiaFoks"
Content-Disposition: inline

--q4nI28h3rGiaFoks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 01:13:38AM +0000, Changhuang Liang wrote:
> Hi,Conor
>=20
> Thanks for the review.
>=20
> > On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang wrote:
> > > Hi ,Conor
> > >
> > > Thanks for the review.
> > >
> > > > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang wrote:
> > > > > Hi, Conor
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrot=
e:
> > > > > >
> > > > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang
> > wrote:
> > > > > >
> > > > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > > > +	struct soc_device *soc_dev;
> > > > > > > > > +	const char *machine =3D NULL;
> > > > > > > > > +	struct device_node *np;
> > > > > > > > > +	struct regmap *regmap;
> > > > > > > > > +	char rev_char;
> > > > > > > > > +	u32 rev_id;
> > > > > > > > > +	int ret;
> > > > > > > > > +
> > > > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > > > >
> > > > > > > > Remind me again why this is not just probed as an mfd cell
> > > > > > > > from the syscon driver?
> > > > > > > >
> > > > > > > > (Hint: please put this info in the commit message).
> > > > > > >
> > > > > > > The discussion result with Krzysztof at that time is recorded=
 here:
> > > > > > > https://lore.kernel.org/all/20260405-strong-watchful-marmot-fd
> > > > > > > fad6
> > > > > > > @quo
> > > > > > > ll/
> > > > > > >
> > > > > > > One register should not be treated as a separate device node.
> > > > > >
> > > > > > That's a different question. In the case of an mfd cell probed
> > > > > > from the syscon driver there would be no devicetree
> > > > > > modifications required compared to what you have now. e.g.
> > > > > > sg2044-topsys.c
> > > > >
> > > > > This seems feasible, and I can introduce this modification in the
> > > > > next
> > > > version.
> > > >
> > > >
> > > > In fact, you don't even need the mfd cell, because your driver is
> > > > going to be in drivers/soc/starfive anyway? You can just bind
> > > > directly to the
> > > > sys0 syscon I think.
> > >
> > > I suddenly realized that I missed one issue:
> > > starfive,jhb100-sys0-syscon is already bound to the PLL driver by def=
ault, I
> > can't use it to bind another device anymore.
> > >
> > > which is why I used
> > >
> > > np =3D of_find_compatible_node(NULL, NULL,
> > > "starfive,jhb100-sys0-syscon");
> > >
> > > in jhb100-socinfo.c.
> > >
> > > So it seems the MFD cell approach isn't really feasible either?
> >=20
> > You could, in that case, probe the clock driver using the mfd_cell like
> > sg2044-topsys. What else other than the pll controls and the soc info r=
egister
> > is in this register region?
>=20
> We don't have any other drivers right now in this register region.

I'm not asking about what's got a driver right now though, I am wondering
what else the registers in this region are for.

>=20
> So does that mean I can revise it to the format below:
>=20
> static const struct mfd_cell jhb100_sys0_subdev[] =3D {
> 	{
> 		.name =3D "jhb100-sys0-pll",
> 	},

> 	{
> 		.name =3D "jhb100-socinfo",

Why would this be needed? The driver with the mfd_cell would be the same
one that provides the soc info, no?

> 	},
> };
>=20
> static const struct mfd_cell jhb100_per0_subdev[] =3D {
> 	{
> 		.name =3D "jhb100-per0-pll",

Why do these other ones need to be modified?

> 	},
> };
>=20
> static const struct mfd_cell jhb100_per1_subdev[] =3D {
> 	{
> 		.name =3D "jhb100-per1-pll",
> 	},
> };
>=20
> static const struct mfd_cell jhb100_ pcierp _subdev[] =3D {
> 	{
> 		.name =3D "jhb100-pcierp-reset",
> 	},
> };
>=20
> Best Regards,
> Changhuang
>=20

--q4nI28h3rGiaFoks
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan8aPAAKCRB4tDGHoIJi
0kOqAPsGeCAPpE7N46vGdjXobBZre+Ywd6lVU7KwdBnv/LbmawD/Z4/VHI6b3P3F
pX/Hl1QaTgbFV37yLa8ntnUyfqr3NAs=
=Plw4
-----END PGP SIGNATURE-----

--q4nI28h3rGiaFoks--


--===============2275721100043740683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2275721100043740683==--

