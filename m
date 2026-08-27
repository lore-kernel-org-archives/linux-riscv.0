Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E15CC61DC4
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SR0d8ZnC3SVbRGFI3N26dAPNBrVJSbn3g82wngtqCE0=; b=kP74ffKy+3erewJ96lvK3z6pKQ
	LPp9aXX1ep59Ki9BOwgbincrxhMPdmDmMjVfpqqExsJcYbVmEvpwbXlgqg/l32Qf+EOl24xMilM77
	BFLxsdL7kJqyGaxuV488X4ogDWiZ4AWCWC2TVClG4vBAx1DdtP159GkhFyUXr2qGSNlXsKbqXsmpP
	/fhUjCKGtrFkhavzHvoyqbKqkQJSYkkBSveCOiJKLQ11Ao3nwJzXG9d0dsWDdxD6lL71RGC4qB1A2
	IwNB11l1L6EF5Bv903MCOyn4Z5JGieWS8xZ7B7FfyuF7t1PIImQAvRNa/ImH6pzrWJ1ASFGYPX0ry
	B5dmIQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze28-00000004Tyn-3M6B;
	Thu, 27 Aug 2026 17:37:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze25-00000004TyC-1jGT
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 17:36:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0BBC41AB0;
	Thu, 27 Aug 2026 17:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F7A1F000E9;
	Thu, 27 Aug 2026 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787852216;
	bh=k3bwMPba/sR3oI0+gNWXKTJPdy5UtHTLwVkPv98WeiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPwdWZTSHmrzaJohefJXfWBOIGeNBqG/henF91BdpuDYvEFZHB7E+VicDtWh5BlH1
	 bxSzv3vpKZNYqmGayCWoOf24C7fkgdKB3zf1Srmw4kdpoS5JuL2QjPZptv3+2ok6i1
	 CytjBLOHtPxaY4smpE7RHoTni7q+6RC0xbh2fZVUDS/gqLy9QSlGInZfhsLByDchJl
	 atcZrBHZrddcv4ri5xcGNrlrbZc45geWW2RirpYjnsgGkiRLWPBOYTQbcpxJfrjGgR
	 lfaYxZvTU+NDAa5hlvKYMhKWto61mps6xQNP9BiBExxTZKjJlBoZElcfc9Jus6hQMZ
	 DjWEgjRy6JwCQ==
Date: Thu, 27 Aug 2026 18:36:50 +0100
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
Message-ID: <20260827-stack-aerosol-e1b1360b6ff5@spud>
References: <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260813-presoak-scarily-b6cdecfcb7cc@spud>
 <ZQ4PR01MB1202CD24FCDA9039EDF2C7A0F2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-reverb-mourner-283116bcc014@spud>
 <ZQ4PR01MB1202BE1034795F1FBCF18076F2A72@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260818-recall-onion-3279fe070ccd@spud>
 <ZQ4PR01MB12027CF8ADC7A2B39F7FB32CF2A52@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB1202AFE1B8600DFBE0DEB083F2AD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202AFE1B8600DFBE0DEB083F2AD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============6897181950884987383=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6897181950884987383==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eZkx4DJCinx3comH"
Content-Disposition: inline

--eZkx4DJCinx3comH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 06:22:20AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> > Thanks for the review.
> >=20
> > > On Mon, Aug 17, 2026 at 01:27:08AM +0000, Changhuang Liang wrote:
> > > > Hi, Conor
> > > >
> > > > Thanks for the review.
> > > >
> > > > > On Fri, Aug 14, 2026 at 01:13:38AM +0000, Changhuang Liang wrote:
> > > > > > Hi,Conor
> > > > > >
> > > > > > Thanks for the review.
> > > > > >
> > > > > > > On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang
> > wrote:
> > > > > > > > Hi ,Conor
> > > > > > > >
> > > > > > > > Thanks for the review.
> > > > > > > >
> > > > > > > > > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang
> > > > > wrote:
> > > > > > > > > > Hi, Conor
> > > > > > > > > >
> > > > > > > > > > Thanks for the review.
> > > > > > > > > >
> > > > > > > > > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang
> > > > > > > > > > > Liang
> > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700,
> > > > > > > > > > > > > Changhuang Liang
> > > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > > > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > > > > > > > > +	struct soc_device *soc_dev;
> > > > > > > > > > > > > > +	const char *machine =3D NULL;
> > > > > > > > > > > > > > +	struct device_node *np;
> > > > > > > > > > > > > > +	struct regmap *regmap;
> > > > > > > > > > > > > > +	char rev_char;
> > > > > > > > > > > > > > +	u32 rev_id;
> > > > > > > > > > > > > > +	int ret;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > > > > > > > > >
> > > > > > > > > > > > > Remind me again why this is not just probed as an
> > > > > > > > > > > > > mfd cell from the syscon driver?
> > > > > > > > > > > > >
> > > > > > > > > > > > > (Hint: please put this info in the commit message=
).
> > > > > > > > > > > >
> > > > > > > > > > > > The discussion result with Krzysztof at that time is
> > > > > > > > > > > > recorded
> > > here:
> > > > > > > > > > > > https://lore.kernel.org/all/20260405-strong-watchful
> > > > > > > > > > > > -m
> > > > > > > > > > > > armo
> > > > > > > > > > > > t-fd
> > > > > > > > > > > > fad6
> > > > > > > > > > > > @quo
> > > > > > > > > > > > ll/
> > > > > > > > > > > >
> > > > > > > > > > > > One register should not be treated as a separate de=
vice
> > node.
> > > > > > > > > > >
> > > > > > > > > > > That's a different question. In the case of an mfd
> > > > > > > > > > > cell probed from the syscon driver there would be no
> > > > > > > > > > > devicetree modifications required compared to what you
> > > > > > > > > > > have
> > > now. e.g.
> > > > > > > > > > > sg2044-topsys.c
> > > > > > > > > >
> > > > > > > > > > This seems feasible, and I can introduce this
> > > > > > > > > > modification in the next
> > > > > > > > > version.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > In fact, you don't even need the mfd cell, because your
> > > > > > > > > driver is going to be in drivers/soc/starfive anyway? You
> > > > > > > > > can just bind directly to the
> > > > > > > > > sys0 syscon I think.
> > > > > > > >
> > > > > > > > I suddenly realized that I missed one issue:
> > > > > > > > starfive,jhb100-sys0-syscon is already bound to the PLL
> > > > > > > > driver by default, I
> > > > > > > can't use it to bind another device anymore.
> > > > > > > >
> > > > > > > > which is why I used
> > > > > > > >
> > > > > > > > np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > "starfive,jhb100-sys0-syscon");
> > > > > > > >
> > > > > > > > in jhb100-socinfo.c.
> > > > > > > >
> > > > > > > > So it seems the MFD cell approach isn't really feasible eit=
her?
> > > > > > >
> > > > > > > You could, in that case, probe the clock driver using the
> > > > > > > mfd_cell like sg2044-topsys. What else other than the pll
> > > > > > > controls and the soc info register is in this register region?
> > > > > >
> > > > > > We don't have any other drivers right now in this register regi=
on.
> > > > >
> > > > > I'm not asking about what's got a driver right now though, I am
> > > > > wondering what else the registers in this region are for.
> > > >
> > > > Here are some registers related to debug functionality.
> > >
> > > So probably nothing else that linux will ever need?
> >=20
> > Yes.
> >=20
> > >
> > > > > > So does that mean I can revise it to the format below:
> > > > > >
> > > > > > static const struct mfd_cell jhb100_sys0_subdev[] =3D {
> > > > > > 	{
> > > > > > 		.name =3D "jhb100-sys0-pll",
> > > > > > 	},
> > > > >
> > > > > > 	{
> > > > > > 		.name =3D "jhb100-socinfo",
> > > > >
> > > > > Why would this be needed? The driver with the mfd_cell would be
> > > > > the same one that provides the soc info, no?
> > > >
> > > > My understanding is that one driver can only bind to one device, so
> > > > the PLL driver and the socinfo driver need these two devices
> > > > respectively, and thus cannot share one?
> > >
> > > Correct, but I am talking about the socinfo driver being the one that
> > > calls
> > > devm_mfd_add_devices() to create a device for the pll so that in the
> > > end there are a total of two drivers, rather than create something
> > > identical to sg2044-topsys.c that does nothing other than initialise =
two mfd
> > cells.
> > > May as well consolidate the mfd_cell definition and call to
> > > devm_mfd_add_devices() in one file, since it would be in the same
> > > directory as the socinfo driver anyway.
> >=20
> > Okay, I will use this method.
>=20
> During the process of attempting this modification, there will be accompa=
nying changes to the PLL driver.=20
> The main changes include the following:
>=20
> 1. Addition of platform device ID table: A new platform_device_id array i=
s introduced, enabling the driver to
> be matched by device name when no OF compatible string is available.
>=20
> 2. Dynamic device node resolution: The driver now attempts to obtain the =
device node using dev_of_node(dev).
>  If the device has no node of its own (as is the case when instantiated a=
s an MFD child cell), it falls back to=20
> using the parent device's DT node (dev_of_node(dev->parent)). This ensure=
s the syscon regmap can still be=20
> correctly retrieved.
>=20
> The current initial draft of the PLL changes is generally as follows: Do =
you have any better suggestions on
> your side?

It's not beautiful, but it is sane - or at least I think so.

>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> 	const struct jhb100_pll_match_data *match_data;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np;
>  	struct jhb100_pll_priv *priv;
>  	unsigned int idx;
>  	int ret;
> =20
> -	match_data =3D of_device_get_match_data(&pdev->dev);
> -	if (!match_data)
> -		return -EINVAL;
> +	match_data =3D of_device_get_match_data(dev);
> +	if (!match_data) {
> +		const struct platform_device_id *id =3D platform_get_device_id(pdev);
> +
> +		if (!id)
> +			return dev_err_probe(dev, -EINVAL, "no match data\n");
> +
> +		match_data =3D (const struct jhb100_pll_match_data *)id->driver_data;
> +	}
> =20
>  	priv =3D devm_kzalloc(&pdev->dev,
> 			    struct_size(priv, pll, match_data->num_pll),
>  			    GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
>  	priv->match_data =3D match_data;
> -	priv->dev =3D &pdev->dev;
> -	priv->regmap =3D syscon_node_to_regmap(priv->dev->of_node);
> -	if (IS_ERR(priv->regmap))
> -		return PTR_ERR(priv->regmap);
> +	priv->dev =3D dev;
> +
> +	/*
> +	 * When instantiated as an MFD cell of the sys0 system controller this
> +	 * device has no DT node of its own, so use the parent syscon node.
> +	 */
> +	np =3D dev_of_node(dev) ? : dev_of_node(dev->parent);

I think I'd probably check that you're on the device you think you are
(sys0) before doing the dev_of_node(dev->parent), but...

> +	priv->regmap =3D syscon_node_to_regmap(np);

=2E..this will fail if you are not on sys0 and somehow dev_of_node(dev)
returned null so it's probably fine.

Thanks,
Conor.

> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to get syscon regmap\n");
>=20
>  static const struct of_device_id jhb100_pll_match[] =3D {
> -	{
> -		.compatible =3D "starfive,jhb100-sys0-syscon",
> -		.data =3D &jhb100_sys0_pll,
> -	},
>  	{
>  		.compatible =3D "starfive,jhb100-per0-syscon",
>  		.data =3D &jhb100_per0_pll,
>  	},
>  	{
>  		.compatible =3D "starfive,jhb100-per1-syscon",
>  		.data =3D &jhb100_per1_pll,
>  	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, jhb100_pll_match);
> =20
> +static const struct platform_device_id jhb100_pll_ids[] =3D {
> +	{
> +		.name =3D "jhb100-sys0-pll",
> +		.driver_data =3D (unsigned long)&jhb100_sys0_pll,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
> +
>  static struct platform_driver jhb100_pll_driver =3D {
>  	.probe =3D jhb100_pll_probe,
> +	.id_table =3D jhb100_pll_ids,
>  	.driver =3D {
>  		.name =3D "clk-starfive-jhb100-pll",
>  		.of_match_table =3D jhb100_pll_match,
>  		.suppress_bind_attrs =3D true,
>  	},
>  };
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> > >
> > > >
> > > > >
> > > > > > 	},
> > > > > > };
> > > > > >
> > > > > > static const struct mfd_cell jhb100_per0_subdev[] =3D {
> > > > > > 	{
> > > > > > 		.name =3D "jhb100-per0-pll",
> > > > >
> > > > > Why do these other ones need to be modified?
> > > >
> > > > I was thinking, since sys0-pll has been adjusted, would it be better
> > > > to also
> > > adjust per0-pll and per1-pll together in a unified way?
> > >
> > > I wouldn't complicate them with things that they don't need, so it
> > > depends on if these other syscon regions contain more than just PLLs
> > > and if there'll ever be drivers for the other stuff in those regions.
> > >
> > > >
> > > > >
> > > > > > 	},
> > > > > > };
> > > > > >
> > > > > > static const struct mfd_cell jhb100_per1_subdev[] =3D {
> > > > > > 	{
> > > > > > 		.name =3D "jhb100-per1-pll",
> > > > > > 	},
> > > > > > };
> > > > > >
> > > > > > static const struct mfd_cell jhb100_ pcierp _subdev[] =3D {
> > > > > > 	{
> > > > > > 		.name =3D "jhb100-pcierp-reset",
> > > > > > 	},
> > > > > > };
> > > >
>=20
> Best Regards,
> Changhuang
>=20

--eZkx4DJCinx3comH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapB1sgAKCRB4tDGHoIJi
0hQHAP9b2jc04ZVINeEbE32l/s/LWGWHD4cV+YPL0C5e5JWWfQD8DCs0NPKf6XFC
47t4wKiSlS1UOsuSgDvufVQXMWr00wE=
=eQ6Y
-----END PGP SIGNATURE-----

--eZkx4DJCinx3comH--


--===============6897181950884987383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6897181950884987383==--

