Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22E7C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1vLnSC+Tm7zAdPQ84WI/MK/GJ9yi9XpFWFhWgr9lQA=; b=t+K+kylyPeTJKppojpiN1/sztk
	x+PsAZkfU5DSPzaFPLvXf62BezbDElkwVc2f/GskOdVUzOOe7BX7TG6ZLwoMu/3gwGCLROVyDrY8K
	QXvih3snHn3I/bae7JSw6A1NmsO+ZvJAk9BRzinIcIVJaGq6OM+QrJ8BMeNHvYZo0RXwZemoSTPOu
	x3vKMzFjiiUw6NhOstXbnwRL8kQ5G7gw3qraZ+4Bq9VrVxS89xcgfbilYEGpE0wIsVqCHva12b47L
	TEMEoCq2xGzlI6j6quDK1P/HWgeYy3Uc4yUJM6ZGRCWFsE3o1EwjEyxgEuJmEAifOTGoxQZocVz1J
	QPafynnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3I-00000009TQQ-1blo;
	Wed, 25 Jun 2025 17:36:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPjS-00000008ikV-3te8
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 13:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1593060053;
	Wed, 25 Jun 2025 13:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213F3C4CEEA;
	Wed, 25 Jun 2025 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750856405;
	bh=vHZOLOxUOXqLChOAWe78z0H43RWaYWuJUBxuOWinPSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+FSU+Q1GU523W8SJnwaLVuoYap1xOesCc60d/mSus1f7T2WoJ2Nxt2Yo7Vw+4Xv/
	 /4Cjban+Zw1RtQQr7WECEv5IDDV3PYhmuxJQpdRztu0IjQNU/a3wtUvA4uRjYEvzJ3
	 XdpQJOp2qYgRU9i2s1FWZJbWuAuz1zII7KWihOOQg0pOlQ2YbZrLI8xi5K6Sz8toi4
	 +0ub2tsoSmoC7udguAeOgJCZiuScSxzBCmZOZ9V8QeIX8BmymloZyLIccCky1DPx35
	 3N4bt/x9VxRkB0ksQZxqzQ4QvQsYuI5ZbxPOzidXMLXl91Wg9lFOEoMp6xmYW0l3Ia
	 +ANCgGeuxNNvQ==
Date: Wed, 25 Jun 2025 14:00:01 +0100
From: Conor Dooley <conor@kernel.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [External] : Re: [PATCH] clk: microchip: mpfs: Fix incorrect
 MSSPLL ID in error message
Message-ID: <20250625-reconvene-lyricist-8bfbf0c6ee36@spud>
References: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
 <20250624-monotype-disorder-aedee5ef7cfa@spud>
 <cf197270-bdca-4624-a2ad-9bb56429b5b7@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cf197270-bdca-4624-a2ad-9bb56429b5b7@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============1438884466547694611=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1438884466547694611==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lSQe9zTW71F2Yj1B"
Content-Disposition: inline


--lSQe9zTW71F2Yj1B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 10:39:16PM +0530, ALOK TIWARI wrote:
>=20
>=20
> On 6/24/2025 9:29 PM, Conor Dooley wrote:
> > On Sun, Jun 22, 2025 at 11:03:49AM -0700, Alok Tiwari wrote:
> > > The error message in mpfs_clk_register_mssplls() incorrectly
> > > printed a constant CLK_MSSPLL_INTERNAL instead of the actual
> > > PLL ID that failed to register.
> > Huh, that's weird. Did you actually encounter this happening, or is this
> > some sort of patch based on the output from a tool?
> > I ask because I don't see how this could ever actually report a
> > constant, when the array it loops over only has a single element.
> > Feels like we should just do something like the following (if we do
> > anything at all)
> >=20
> > Cheers,
> > Conor.
> >=20
> > diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/c=
lk-mpfs.c
> > index c22632a7439c5..ed6d5e6ff98ec 100644
> > --- a/drivers/clk/microchip/clk-mpfs.c
> > +++ b/drivers/clk/microchip/clk-mpfs.c
> > @@ -148,22 +148,18 @@ static struct mpfs_msspll_hw_clock mpfs_msspll_cl=
ks[] =3D {
> >   };
> >   static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_=
msspll_hw_clock *msspll_hws,
> > -				     unsigned int num_clks, struct mpfs_clock_data *data)
> > +				     struct mpfs_clock_data *data)
> >   {
> > -	unsigned int i;
> > +	struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[0];
> >   	int ret;
> > -	for (i =3D 0; i < num_clks; i++) {
> > -		struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[i];
> > +	msspll_hw->base =3D data->msspll_base;
> > +	ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> > +				     CLK_MSSPLL_INTERNAL);
> > -		msspll_hw->base =3D data->msspll_base;
> > -		ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
> > -		if (ret)
> > -			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> > -					     CLK_MSSPLL_INTERNAL);
> > -
> > -		data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
> > -	}
> > +	data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
> >   	return 0;
> >   }
> > @@ -386,8 +382,7 @@ static int mpfs_clk_probe(struct platform_device *p=
dev)
> >   	clk_data->dev =3D dev;
> >   	dev_set_drvdata(dev, clk_data);
> > -	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(m=
pfs_msspll_clks),
> > -					clk_data);
> > +	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, clk_data);
> >   	if (ret)
> >   		return ret;
>=20
>=20
> Thanks Conor. This patch based on static tool.
>=20
> You are right, there is only a single MSSPLL internal clock, so the loop
> isn't strictly necessary.
> We could either remove the loop entirely (as you suggested),
> or alternatively, just tweak the error message to something like:
> "failed to register MSSPLL internal id: %d\n"

The loop doesn't do anything, so it should probably be removed.

> This would help distinguish it from the error messages used for the MSSPLL
> output and cfg clocks.
>=20
> I also noticed that similar generic messages are used elsewhere, like:
> "failed to register clock id: %d\n" in mpfs_clk_register_cfgs()
> "failed to register clock id: %d\n" in mpfs_clk_register_periphs()
>=20
> Would it make sense to update those as well for clarity, or do you think
> it's better to keep the patch minimal and leave them as is?

I dunno, I don't think there's anything particularly wrong with those,
the IDs are unique across the whole driver. You need to look up the IDs
anyway to understand the error message, so changing those prints
provides no extra info IMO.

--lSQe9zTW71F2Yj1B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFvy0QAKCRB4tDGHoIJi
0pmvAQCVowLYQ+nseeBVvAj1iEHXJVREPX47v1J5Bfg4zIr95AEA6sXHshThgwct
aE6P6LFHjkPucomg+AlA48SgVrTcpwU=
=nvzq
-----END PGP SIGNATURE-----

--lSQe9zTW71F2Yj1B--


--===============1438884466547694611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1438884466547694611==--

