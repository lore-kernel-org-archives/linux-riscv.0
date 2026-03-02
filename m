Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA31EB362B
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrmEnd5R5ImEMXbv69FtK1PieSyZDg9VwIUO4tXqnis=; b=ZgyWq3yCTRtSuVUvQNQlaPHlwA
	hJNrwkijGAHqqo4dV1sRb3gQUk1cHzEKzWLVnVk6ogk+/Uruf/TihvEjyYZnj4oRUQatSvf13BLiR
	tXrAz4rSj/y2HTBhtful7CamlfZl6Hfv5ztN6svakEssOQsHY2IdvduC9ikDpxQI5grh8PqM4eQUL
	xmifBw/fmIrgVk30dPcsOvhiLF9QeZMU8Nn2GQrLExJAuI0byo8r+YSdylnZgmQPRj8yEU20X5cO/
	AFH8JXOPDqNl+EjEx9Lq2NIiy4etY70f2WK5d6g2j5NVg7T0D3FQViifWaO4dn8FgDlU67Fvv0a/i
	3nsiFuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7jZ-0000000Df3t-1EnD;
	Mon, 02 Mar 2026 18:11:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7jX-0000000Df3X-05AM
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 18:11:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CED260097;
	Mon,  2 Mar 2026 18:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB33C2BCAF;
	Mon,  2 Mar 2026 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772475065;
	bh=9vMp8oVY9ly+koARXC2CDFt7G+bOzmkjyESC8o/h6PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCThIaT+vkO8MNEptzSfjE8GU7VO97Um4ozCagAenO6aTvoowkOptMN5DJflr8Iw4
	 1Fziczj1/mxZoJTXL7ofEKJ5lHHYs1owsVXCRfPbs1eG3rZsYX4MZ70h1T8TPgOTVF
	 N7V876RrEG0k7Hqh0mmxAMSbgbqa8sAuFO6euRnvFxfJjHmQD8EDcCCSNjHefpAUap
	 /R7kG63cIyP1yb77zLxeLTB9onoPM5rZzwtYKrnaoPgufk/R9k04aFBSy/cu/VqnuG
	 QWEFAPY8h/iAjnlWtv7YYl7/N6yUiPNQ9KiiF6HuqaHT7UIKhFnbUe89ZfUeH2se7/
	 Yf6b9egFtYtjw==
Date: Mon, 2 Mar 2026 18:11:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, dlan@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, elder@riscstar.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Message-ID: <20260302-glamorous-undivided-08b11b794939@spud>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
 <20260302030511.30566-1-amadeus@jmu.edu.cn>
 <20260302033655-GYA288339@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20260302033655-GYA288339@gentoo.org>
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
Content-Type: multipart/mixed; boundary="===============7749818601841664632=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7749818601841664632==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Cad6xDtBs6YbbZc"
Content-Disposition: inline


--0Cad6xDtBs6YbbZc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2026 at 11:36:55AM +0800, Yixun Lan wrote:
> Hi Chukun,
>=20
> Sorry, I missed your mail due recent problem of my client..
> On 11:05 Mon 02 Mar     , Chukun Pan wrote:
> > Hi,
> >=20
> > > &pcie1_port {
> > >  	phys =3D <&pcie1_phy>;
> > > +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> > >  };
> > >=20
> > >  &pcie1 {
> > > @@ -320,6 +321,7 @@ &pcie2_phy {
> > >=20
> > >  &pcie2_port {
> > >  	phys =3D <&pcie2_phy>;
> > > +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> > >  };
> >=20
> > ```
> > &pcie1 {
> > 	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> > 	status =3D "okay";
> > };
> > ```
> >=20
> > According to DT binding, the vpcie3v3-supply of the &pciex node should
> > be moved to the &pciex_port node. This is simply a duplication of the
> > property.
> >=20
> I have confidence that pcie port need to add a regulator to provide=20
> supply for devices..
>=20
> But, I'm not sure whether it's ok to remove regulator from &pciex node,
> it's possibly a 'yes' answer, but to convince me, I'd like to see a real
> test case to prove it: e.g, power supply for pciex is actually off before=
=20
> the driver initialization, then run regular procedure as it should, if
> all works fine

I'm not really sure what this is about. Whether the supply can be off
before driver probe has nothing to do with what node the supply should
be in. If you're concerned about removing it from the pcie node causing
it to not be enabled during probe, then the driver should probably reach
into the port node, get the regulator and call enable() on it?
As I said when reporting this, either you need to change the driver and
dts, or change the binding. If the supply actually is provided to the
controller and port, then you need to change the binding to have a
supply in the controller node and change the driver to make sure that
both the controller node supply and the port node supply are enabled as
someone could opt to provide them from different regulators.

Looking at the bpif3 schematic
https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
I see nowhere where that 3v3 supply is actually provided to the k1,
which I would expect if it were the supply for the controller itself.
Instead, the m2 and minipcie slots are where I see that supply provided
in the schematic. To me, that sounds like the port is what needs the
supply, not the controller, but I'm not super familiar with pci
devicetree stuff unfortunately.

> Btw, different drivers request same regulator is ok, and is quite normal,
> can't draw a conclusion that it's a duplication, as they may be used for
> different reasons
>=20
> > But do we really need this pcie_port (PCIe bridge)?
> >=20
> > The PCIe bridge node (pcie@0) was treated as a platform device, but it
> > did not define the interrupts property, which resulted in the following
> > warning: `[    2.897980] irq: no irq domain found for pcie@0 !`
> >=20
> > Would it be better to submit a patch to remove this pcie_port?
> >=20
> > ```
> > -       ret =3D k1_pcie_parse_port(k1);
> > -       if (ret)
> > -               return dev_err_probe(dev, ret, "failed to parse root po=
rt\n");
> > +       k1->phy =3D devm_phy_get(dev, "pcie-phy");
> > +       if (IS_ERR(k1->phy))
> > +               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PH=
Y\n");
> > ```
>=20
> I've not really looked at this, and not an expert on this area, so will
> leave this to Alex or PCIe maintainers..
>=20
> > I have tested this change and it works.
> >=20
> > Thanks,
> > Chukun
> >=20
>=20
> --=20
> Yixun Lan (dlan)

--0Cad6xDtBs6YbbZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaXStAAKCRB4tDGHoIJi
0lPgAQCTClU5vis2+9tJyIZfKTjWOd7YSjjJVly2CSagyY0jSwD/QaQ7vxm86Sgy
owyfMcezZaRHlgKA8IjooEkHjVJuswc=
=MISq
-----END PGP SIGNATURE-----

--0Cad6xDtBs6YbbZc--


--===============7749818601841664632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7749818601841664632==--

