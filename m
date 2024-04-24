Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035E0C10F15
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkKVeYq6oMmUe5uyJOeSNLWziH3g1nozjdPQgQ5d7wA=; b=RL5Dn6F0FWoZMk4iCppZBtIiVM
	NtVQoRj748l9nukEoUpz7XxyCkDWvqWcl/6RRm05L8zwb70DwCMtA7dY0vtGg/dPUduAuJJSmZHGN
	fEmDrSxR2ksaGIbn0tF1qaXV+EYsTjBUzLTTxFn38vQKG4tpuho5pnDevyPScX/uW/1aZwwOQAinH
	J2Dmjq2s+hPCgqKfGKRqaNTTzbHfnboYKOhjU4xaOsWUECvulShlrvTpJlpmRXlsqy7LqkeiCQydC
	VmzBCdv3sZBEEu6oI8RDsx8FuO+XG08cYa9cc9y/6dszmnag1UhCtnBTr+0Wd50ld0HN3rMyy9K3a
	60iIcheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzj5H-00000005snE-40gD;
	Wed, 24 Apr 2024 20:19:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzj5E-00000005slh-0dcd
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34705CE17D7;
	Wed, 24 Apr 2024 20:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CDFC113CD;
	Wed, 24 Apr 2024 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713989948;
	bh=63hZPOmkSg+IK89rduMeX1CZgesVdUrWtwIPoEX0wx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FdW7u1jzxAWuLqFr++Z5rwBUKGJKPRkGswnMGsR/iCqFctDOhNzWCIc/6iJw0CCBS
	 n/+rOibvY434+ZwL5uW15xDCcyFNfsmIBog8CnRpPnVPILZVhgxNehzvN6bBFu0aur
	 a3vJGoJhdyE42nR7hYu2kwKfMUIKdvMKprt5Cwm3mmIobl9kiDYzI1we4eY677dv4G
	 pZ4aes1aAviH4dpvMkL03Zwryw8/xQy52vOvJASrQBH4akfZrG5DrJRZCDinG+efHp
	 j7W5tt9JHJJEM7czNa0I3PK2cSQa48OBFPNnehePSbI6wDoOWc6pKVlp7oR+UzquKD
	 CcV3JBDWDME4Q==
Date: Wed, 24 Apr 2024 21:19:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to
 the reset subsystem
Message-ID: <20240424-glazing-handsaw-4c303fef4f7e@spud>
References: <20240424-strangle-sharpener-34755c5e6e3e@spud>
 <722f31da34e5e1cfef05fb966f6c8c96.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <722f31da34e5e1cfef05fb966f6c8c96.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_131912_467264_424430F6 
X-CRM114-Status: GOOD (  18.30  )
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
Content-Type: multipart/mixed; boundary="===============0475444156481217372=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0475444156481217372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rh9OexgCGdhps0bi"
Content-Disposition: inline


--rh9OexgCGdhps0bi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 11:33:32AM -0700, Stephen Boyd wrote:
> Quoting Conor Dooley (2024-04-24 01:42:08)
> > diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> > index 7f3fb2d472f4..710f9c1676f9 100644
> > --- a/drivers/reset/reset-mpfs.c
> > +++ b/drivers/reset/reset-mpfs.c
> > @@ -121,11 +135,15 @@ static int mpfs_reset_probe(struct auxiliary_devi=
ce *adev,
> >  {
> >         struct device *dev =3D &adev->dev;
> >         struct reset_controller_dev *rcdev;
> > +       struct mpfs_reset *rst;
> > =20
> > -       rcdev =3D devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
> > -       if (!rcdev)
> > +       rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> > +       if (!rst)
> >                 return -ENOMEM;
> > =20
> > +       rst->base =3D (void __iomem *)adev->dev.platform_data;
>=20
> Can use dev_get_platdata() here?
>=20
> 	rst->base =3D (void __iomem *)dev_get_platdata(dev);
>=20
> That's sad that a cast is necessary. Does it need __force as well? An
> alternative would be to make a container struct for auxiliary_device and
> put the pointer there.


Ye, I dunno if it was sparse that yelled at me, but either it or the
compiler didn't approve. I don't really like the casting in and out, but
the alternative I don't find elegant either, so I picked the one I deemed
simpler. I'm happy to go with whichever you prefer.

And re: __force, AFAIU that's only required while discarding the
__iomem, so the cast into the platform_data has one:
	adev->dev.platform_data =3D (__force void *)base;


--rh9OexgCGdhps0bi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZilpOAAKCRB4tDGHoIJi
0vP+AP9lEnMw5y7fvCuYaADjE2y57zzff3jp+ioyFjTJxoliCgEAyxCg4Pv3Ek/D
Z4HW5TKPA2SEiWITrZbN9BnGFAfHOwg=
=uuLw
-----END PGP SIGNATURE-----

--rh9OexgCGdhps0bi--


--===============0475444156481217372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0475444156481217372==--

