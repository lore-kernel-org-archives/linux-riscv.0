Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B332CA600B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZZOkJ5PUq5RNxy9P0qa0LamrUrFWrZuJS3WUAskXoo=; b=tQCRW7DALiZxmLY1R7d8MVCeEH
	vOOHxwV1PMWOvi87q4S4h7ZxdHV+YOwE5zYFhLpwo0lTCVEtz3ZCitfHX/zPYesr4eGt8JSSS7J9l
	FmyEaYUlwAKnRSwSTMEAhWttfan3LUdCr3SKRpccu9RLXoPM4s6g8vxcru3LyyhlgCUf2vL+hpQnJ
	giSv0GJUm6HdA48yK/a4qz8C9akd2eNQ91qQ/t8wgdnGs2aniW0RueYBaP/MLJOHR+R6KQ1oWHewP
	JnBeL1m2cYN1nVZuYMI8Z0DNMzziEUm7o8Z/VhQlSebORYWHT+O0GDuCD+jU3kmUMyVhgwZvj/aKw
	El5DeicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo0n-00000004REf-2G4I;
	Thu, 08 Oct 2026 13:18:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo0n-00000004REO-0Gji
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 13:18:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A0D7601EF;
	Thu,  8 Oct 2026 13:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2181F000FF;
	Thu,  8 Oct 2026 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465496;
	bh=7rOEJqgCu8u8q1ufoOX3kQr2YjUA2Jk9T5x48X5tx5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IlvErLBYtYGGYw2u19/JNhB8BzU61Q4Dh+++d6+4oJwhlh4mbaHWd84od8LrsUlrE
	 rDYs9z9If5hgLP0OOV/wIHBJdkVEKE0yMkKrPjAvi1dOBEt2JufKmkOOv733mOHsKb
	 Dz65F22hjdo5fH3joB7Jim9i+di8k/7MCIKk+8v+7Flk4qpLvKhwN6d5nChv+6uIHP
	 2YtSTWdNHCOpTmHBrvkxAYr5bia4MFCAdWzorBJyj//8trmnTac2k7hLKhDS4z3Cdv
	 wL8AfR3aezMwJAcxNiU9upLVtHBAMhzWBwya/vvZ7RGWS4Ev+5wz5vKInIBf3M0El1
	 ziK9Kx7Tkk+3g==
Date: Thu, 8 Oct 2026 14:18:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: microchip: mpfs: Fix flash leak in
 mpfs_sys_controller_probe()
Message-ID: <20261008-47741881fb032091ea3d7f0c@squawk>
References: <20260917153550.2160672-1-vulab@iscas.ac.cn>
 <20261002-garnish-president-6e8abfdacf4c@spud>
MIME-Version: 1.0
In-Reply-To: <20261002-garnish-president-6e8abfdacf4c@spud>
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
Content-Type: multipart/mixed; boundary="===============8839994993949151231=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8839994993949151231==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oQXGhQV6zRD3QwyE"
Content-Disposition: inline

--oQXGhQV6zRD3QwyE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 06:48:28PM +0100, Conor Dooley wrote:
> On Thu, Sep 17, 2026 at 03:35:50PM +0000, Wentao Liang wrote:
> > of_get_mtd_device_by_node() returns an MTD device reference that the
> > caller has to drop with put_mtd_device().  The probe error paths return
> > without releasing it, and the reference stored in sys_controller->flash
> > is never dropped when the controller is destroyed either.
> >=20
> > Release the flash on the probe error paths and in
> > mpfs_sys_controller_delete(), so the reference is always put.
>=20
> Is this diff sufficient?
> If probe passes, shouldn't the driver also call this during removal?
>=20
> Removal here just decrements the refcount, so the delete function is
> where the call would have to go. Another patch for this driver pointed
> out that the teardown code should actually call mpfs_sys_controller_put()
> https://patchwork.kernel.org/project/lei-conor/patch/20260924110054.15538=
80-1-lgs201920130244@gmail.com/
> so the right thing to do here is probably a mix of what you've got here
> and what was done in that patch?
>=20
> I note that the other user of this function, u-boot-env.c, doesn't call
> this either.

I've applied a v2 of that patch I mentioned, so I'll expect a new
iteration here on top of that:
https://patchwork.kernel.org/project/lei-conor/patch/20261007121743.192486-=
1-lgs201920130244@gmail.com/

Cheers,
Conor.

>=20
> Cheers,
> Conor.
>=20
> >=20
> > Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system=
 controller's flash")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> > ---
> >  drivers/soc/microchip/mpfs-sys-controller.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/=
microchip/mpfs-sys-controller.c
> > index 92d1142a59e6..ad57b09e5807 100644
> > --- a/drivers/soc/microchip/mpfs-sys-controller.c
> > +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> > @@ -98,6 +98,8 @@ static void mpfs_sys_controller_delete(struct kref *k=
ref)
> >  	struct mpfs_sys_controller *sys_controller =3D
> >  		container_of(kref, struct mpfs_sys_controller, consumers);
> > =20
> > +	if (sys_controller->flash)
> > +		put_mtd_device(sys_controller->flash);
> >  	mbox_free_channel(sys_controller->chan);
> >  	kfree(sys_controller);
> >  }
> > @@ -159,7 +161,8 @@ static int mpfs_sys_controller_probe(struct platfor=
m_device *pdev)
> >  	of_data =3D (struct mpfs_syscon_config *) device_get_match_data(dev);
> >  	if (!of_data) {
> >  		dev_err(dev, "Error getting match data\n");
> > -		return -EINVAL;
> > +		ret =3D -EINVAL;
> > +		goto out_free;
> >  	}
> > =20
> >  	for (i =3D 0; i < of_data->nb_subdevs; i++) {
> > @@ -174,6 +177,10 @@ static int mpfs_sys_controller_probe(struct platfo=
rm_device *pdev)
> >  	return 0;
> > =20
> >  out_free:
> > +	if (!IS_ERR_OR_NULL(sys_controller->flash))
> > +		put_mtd_device(sys_controller->flash);
> > +	if (!IS_ERR_OR_NULL(sys_controller->chan))
> > +		mbox_free_channel(sys_controller->chan);
> >  	kfree(sys_controller);
> >  	return ret;
> >  }
> > --=20
> > 2.34.1
> >=20



--oQXGhQV6zRD3QwyE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaseYEwAKCRB4tDGHoIJi
0ugrAP9s4Q3zWtLB9vcNttN8dZHPoPY88tZbWAPqWixtfPdzagEAz/wjphA9q6nd
0QknAKH3kmmCouLDrH1D9NJ/NpE6aAM=
=uLus
-----END PGP SIGNATURE-----

--oQXGhQV6zRD3QwyE--


--===============8839994993949151231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8839994993949151231==--

