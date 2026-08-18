Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397ADC5DF81
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjp8NY2ZVDARuJPVt/sej2WhR5mS8RXKwztMW+Pxau4=; b=38Vhtsv51LQRJgVMrqJadzSGGv
	UkwFq8fIysdzfcJUWIMiNpVJcoGKT+GUgimRadiiWZyVcOSHYKC52MQBlWeoLoKQEI47gWbwi+1Xp
	HFMhFs45pihO3rjnR+8xlmj8VsSis0AYh4Pqfj3ro5x7tbfvWvjcgVFgjShQoYbXm17gZO8JZl+0M
	XgWYnFJeBEDP8WSqKEtQI/wO+FVOGSV9eqrELOd4B1unWRnKmBvnPSXWYKkmUXSQ5h7827RWJoyDa
	hkpF4en9EuygE3a9MBrCrj9lSGiUnd5Z+I23KZ6pSkboOqqgtC2wf1ufPj1eNUmiNb4uinhA2wOmo
	7jSqqI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwN6K-00000008OEm-28dn;
	Tue, 18 Aug 2026 16:55:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwN6I-00000008OEg-2YgQ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 16:55:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9535C601DE;
	Tue, 18 Aug 2026 16:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455E71F000E9;
	Tue, 18 Aug 2026 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072145;
	bh=mbannRAkdN1p03r8biMHhQzdxtdlRnNoGSybtXi73Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g5MZn43osZ1EQML0Np29vJraekXMi3vuSrYiQ9DxKMBwPSyHbPNkwoqMOygXI/ITu
	 +t9/tSfmizYcm4Puf8PpKFSMMPDgNqMO2icV2jEUmsA8RjzyqDwb5vqUUOXVsQ+mJu
	 Bztfc+j/ZXw96cJg+lqdmUvpPT+GwljBll5EnJtwRW43bqg5qv9MI7l2+jGst4aYoi
	 yp7SyLN9SWe8RbriJA8byuTKBsYSZkkUrr0kwVvxX7KlMGOi4nelIo6gtgKnAWBzmP
	 E6ivx4rm+zwySTrXlQom5/zwSfxfaq1A0GIQ8FN5lSwc6Gz9a56AXNUZ6Z4gtqoe7U
	 s8xutEewfAUzA==
Date: Tue, 18 Aug 2026 17:55:39 +0100
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
Message-ID: <20260818-recall-onion-3279fe070ccd@spud>
References: <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260813-presoak-scarily-b6cdecfcb7cc@spud>
 <ZQ4PR01MB1202CD24FCDA9039EDF2C7A0F2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-reverb-mourner-283116bcc014@spud>
 <ZQ4PR01MB1202BE1034795F1FBCF18076F2A72@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202BE1034795F1FBCF18076F2A72@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============4771033483540683019=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4771033483540683019==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idcukJczKVSVGVjs"
Content-Disposition: inline

--idcukJczKVSVGVjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 01:27:08AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Fri, Aug 14, 2026 at 01:13:38AM +0000, Changhuang Liang wrote:
> > > Hi,Conor
> > >
> > > Thanks for the review.
> > >
> > > > On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang wrote:
> > > > > Hi ,Conor
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang
> > wrote:
> > > > > > > Hi, Conor
> > > > > > >
> > > > > > > Thanks for the review.
> > > > > > >
> > > > > > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang
> > wrote:
> > > > > > > >
> > > > > > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang
> > > > > > > > > > Liang
> > > > wrote:
> > > > > > > >
> > > > > > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > > > > > +	struct soc_device *soc_dev;
> > > > > > > > > > > +	const char *machine =3D NULL;
> > > > > > > > > > > +	struct device_node *np;
> > > > > > > > > > > +	struct regmap *regmap;
> > > > > > > > > > > +	char rev_char;
> > > > > > > > > > > +	u32 rev_id;
> > > > > > > > > > > +	int ret;
> > > > > > > > > > > +
> > > > > > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > > > > > >
> > > > > > > > > > Remind me again why this is not just probed as an mfd
> > > > > > > > > > cell from the syscon driver?
> > > > > > > > > >
> > > > > > > > > > (Hint: please put this info in the commit message).
> > > > > > > > >
> > > > > > > > > The discussion result with Krzysztof at that time is reco=
rded here:
> > > > > > > > > https://lore.kernel.org/all/20260405-strong-watchful-marmo
> > > > > > > > > t-fd
> > > > > > > > > fad6
> > > > > > > > > @quo
> > > > > > > > > ll/
> > > > > > > > >
> > > > > > > > > One register should not be treated as a separate device n=
ode.
> > > > > > > >
> > > > > > > > That's a different question. In the case of an mfd cell
> > > > > > > > probed from the syscon driver there would be no devicetree
> > > > > > > > modifications required compared to what you have now. e.g.
> > > > > > > > sg2044-topsys.c
> > > > > > >
> > > > > > > This seems feasible, and I can introduce this modification in
> > > > > > > the next
> > > > > > version.
> > > > > >
> > > > > >
> > > > > > In fact, you don't even need the mfd cell, because your driver
> > > > > > is going to be in drivers/soc/starfive anyway? You can just bind
> > > > > > directly to the
> > > > > > sys0 syscon I think.
> > > > >
> > > > > I suddenly realized that I missed one issue:
> > > > > starfive,jhb100-sys0-syscon is already bound to the PLL driver by
> > > > > default, I
> > > > can't use it to bind another device anymore.
> > > > >
> > > > > which is why I used
> > > > >
> > > > > np =3D of_find_compatible_node(NULL, NULL,
> > > > > "starfive,jhb100-sys0-syscon");
> > > > >
> > > > > in jhb100-socinfo.c.
> > > > >
> > > > > So it seems the MFD cell approach isn't really feasible either?
> > > >
> > > > You could, in that case, probe the clock driver using the mfd_cell
> > > > like sg2044-topsys. What else other than the pll controls and the
> > > > soc info register is in this register region?
> > >
> > > We don't have any other drivers right now in this register region.
> >=20
> > I'm not asking about what's got a driver right now though, I am wonderi=
ng
> > what else the registers in this region are for.
>=20
> Here are some registers related to debug functionality.

So probably nothing else that linux will ever need?

> > > So does that mean I can revise it to the format below:
> > >
> > > static const struct mfd_cell jhb100_sys0_subdev[] =3D {
> > > 	{
> > > 		.name =3D "jhb100-sys0-pll",
> > > 	},
> >=20
> > > 	{
> > > 		.name =3D "jhb100-socinfo",
> >=20
> > Why would this be needed? The driver with the mfd_cell would be the same
> > one that provides the soc info, no?
>=20
> My understanding is that one driver can only bind to one device, so the P=
LL driver=20
> and the socinfo driver need these two devices respectively, and thus cann=
ot share
> one?

Correct, but I am talking about the socinfo driver being the one that
calls devm_mfd_add_devices() to create a device for the pll so that in
the end there are a total of two drivers, rather than create something
identical to sg2044-topsys.c that does nothing other than initialise two
mfd cells.
May as well consolidate the mfd_cell definition and call to
devm_mfd_add_devices() in one file, since it would be in the same
directory as the socinfo driver anyway.

>=20
> >=20
> > > 	},
> > > };
> > >
> > > static const struct mfd_cell jhb100_per0_subdev[] =3D {
> > > 	{
> > > 		.name =3D "jhb100-per0-pll",
> >=20
> > Why do these other ones need to be modified?
>=20
> I was thinking, since sys0-pll has been adjusted, would it be better to a=
lso adjust per0-pll and per1-pll together in a unified way?

I wouldn't complicate them with things that they don't need, so it
depends on if these other syscon regions contain more than just PLLs
and if there'll ever be drivers for the other stuff in those regions.

>=20
> >=20
> > > 	},
> > > };
> > >
> > > static const struct mfd_cell jhb100_per1_subdev[] =3D {
> > > 	{
> > > 		.name =3D "jhb100-per1-pll",
> > > 	},
> > > };
> > >
> > > static const struct mfd_cell jhb100_ pcierp _subdev[] =3D {
> > > 	{
> > > 		.name =3D "jhb100-pcierp-reset",
> > > 	},
> > > };
>=20
> Best Regards,
> Changhuang
>=20

--idcukJczKVSVGVjs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoSOhwAKCRB4tDGHoIJi
0grZAQDaoZbJ5vI20RP1E84JX+AlFbV6zbVtAJDFnBgJVwX0mwEAjFbmbKuMouEe
CEd9tCDl1hSU50+qcFRFUi6ra6yqpQ8=
=IdIB
-----END PGP SIGNATURE-----

--idcukJczKVSVGVjs--


--===============4771033483540683019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4771033483540683019==--

