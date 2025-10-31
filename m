Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25F7CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 11:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qg2MTAvL/iuCV2LuhLEc5coEUqYabkV743gkJ3bmehE=; b=PQV3v2XUPJqqicc1Mkci4ISdp0
	Dd9Mgd4UwK2vv2BHR52/E59ZegWza495+FRfpsu9BKo1xu9xwNBFkF9HwJpm6yPulBxKMPt8jr7aW
	IR5WdmeEGxeIk61tgXbMeBBrBUYLgRQml4kELWi9w4jO3/XA9ZiX7Oi3xWqPNweesEDBiwlP3ysw5
	FfWRqUw3c9qAD9vtU8iXA5lzonlbhBr+D7Im98Qzsdm0jpSJHOd0+oZ4+fNFyToAUwxkUtuWERbW4
	j2SBDgD+x9GvuT5FPbroD6xVGeHuhoDKwb4xlkJdP8sK5F+D56srKmbYCgtvNfXezjA4rD0bKh2Vc
	9zMx0iWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnjU-000000062q2-1j0L;
	Fri, 31 Oct 2025 11:55:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnjT-000000062pv-0mfU
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 11:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1694361F63;
	Fri, 31 Oct 2025 11:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBE8C4CEFB;
	Fri, 31 Oct 2025 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761911749;
	bh=fIa0j/GtzmZQoXo7Ot/AE5uFcIg/11da1EjbWi+1FyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpJakExDBsWMDyNT5cd0cPM42pmALGG2HG3KDlSC3d8/dEsp+7uftN1mBP9pSq2kC
	 SfzBHxziQDTrKJ01VLakWP/ATUknVzGs6NrPObaM+mqD7wncIu23SKVPxLczhm7VBp
	 5cwB36DRphXuiOt4h+PDSgirRDnzM4b9xQ1wHnNYf8Vov6UXW5xjf7UidadrsHiT1S
	 jd9AFjcrKoHNubKtEHzOyUSs0QlNtYQ7ZmYJaDX8FM3QqQUU1PEIzIk7VTCiAwOH/i
	 MgaRyAP/A0P+FRa4+2EC5Tw7LzIsFYLaQk+F5WSWrXNYtOZCQVQlBkZRYaiqMOs31A
	 lQIrDRXvqRt4Q==
Date: Fri, 31 Oct 2025 11:55:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: claudiu.beznea@tuxon.dev, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] reset: mpfs: add non-auxiliary bus probing
Message-ID: <20251031-rewrap-single-e13bbfd9f1bb@spud>
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
 <20251029-macarena-neglector-318431fec367@spud>
 <4e3c3c3d6c1a0d2905a90e5f1c0b2cb8f67bc43b.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <4e3c3c3d6c1a0d2905a90e5f1c0b2cb8f67bc43b.camel@pengutronix.de>
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
Content-Type: multipart/mixed; boundary="===============5685867473925204329=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5685867473925204329==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ertujbkv4Kiy4c2"
Content-Disposition: inline


--3ertujbkv4Kiy4c2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 02:40:30PM +0100, Philipp Zabel wrote:
> On Mi, 2025-10-29 at 16:11 +0000, Conor Dooley wrote:
> > @@ -46,41 +52,46 @@ static inline struct mpfs_reset *to_mpfs_reset(stru=
ct reset_controller_dev *rcde
> >  static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned lo=
ng id)
> >  {
> >  	struct mpfs_reset *rst =3D to_mpfs_reset(rcdev);
> > -	unsigned long flags;
> >  	u32 reg;
> > =20
> > -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> > +	if (rst->regmap)
> > +		return regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id),=
 BIT(id));
>=20
> This could use regmap_set_bits().
>=20
> > +
> > +	guard(spinlock_irqsave)(&mpfs_reset_lock);
> > =20
> >  	reg =3D readl(rst->base);
> >  	reg |=3D BIT(id);
> >  	writel(reg, rst->base);
>=20
> Since I've just seen this in the i.MX8ULP series [1], it would be
> cleaner to convert the aux driver to regmap as well. The readl/writel()
> code paths could be dropped then.
>=20
> [1] https://lore.kernel.org/lkml/20251029135229.890-1-laurentiumihalcea11=
1@gmail.com/

Yeah, it's definitely a lot neater this way. I'll do that. Patch ends up
touching the clock driver in the process, but I don't think that's a big
deal, since it's just the auxdev bits relating to the iomem pointer
becoming a regmap pointer instead.

--3ertujbkv4Kiy4c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQSjwAAKCRB4tDGHoIJi
0vFhAQDkkuWAVOeVDtGSxjnEuSHfZc3mS1vaWbu8o2swToIRfQD/arEA8nv6Wdrl
4zip7L/VCNOznI8CuShbdOQVEj1BuAM=
=py6j
-----END PGP SIGNATURE-----

--3ertujbkv4Kiy4c2--


--===============5685867473925204329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5685867473925204329==--

