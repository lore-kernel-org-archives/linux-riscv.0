Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9429C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 18:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/c27BOd7J/QfqFDMW/1th1W4lMVZrLELVTBbHyDdrE=; b=1A30YCdeNFgZWnBtYcIlQeNDIp
	VgPkF0PyVD4bJdESyE4HMWcK01K2C/k0nsCK9TzOz/OpJDmWPJ0R+eHOLZJKUUnrG4KZzxBjHVkkh
	6CPaauSAotZIpBNlogfFYF/VxK4FXn6Qm+z3aSeRwkQYUqL7r/OeNj6P2/5r2lplmheoOVx/FlMQ7
	GaiS1wuMWArg9TG1ThhIspPqHmEodVogpD1Xie93b/TM4AUOs6DyKahh/XU7+9bCSrc0+xImT14wr
	GuB8qLZFcRC+r9RpwQYiVnvdmxnjI3rjarNSwPqpxL3Eq2UP8ENmbXaECbCxE5NsnLnQM6lhu4S74
	jhJM4Q1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XmX-00000007jgT-2TWC;
	Tue, 15 Sep 2026 18:21:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XmW-00000007jgE-0Mo0
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 18:21:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B509B43E37;
	Tue, 15 Sep 2026 18:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6731F00898;
	Tue, 15 Sep 2026 18:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496483;
	bh=5il9R4JOsn7FaDJyBMY4GcTMOrQeZX8j32v8URz75co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YRUM0upyVeTDLrIxIfb+zSspTsacf7tMtXta7MXM71z1Lz5coPIx3hHLwYmKRiGpO
	 tFgBQTS9tRulkQCqpbGRdOiYWdeqQOP9neuzDc4QvzBlR0tFptm5wZf3pTTyvr1toL
	 6ayUdRR4fS52WCfPv5J0iq5jdOmsRozAg91/kqT/hZTiMTrfNWXcPV9BSItlbwJfI8
	 wQFrJ3LZfq76w7x8S4UsI6KQrEGMuc3PhGEo4J4xeNoVPk2aQxEtoVu4kSYQhacb6M
	 M76+EaVlYwqNajlxQ6NUTX3Fj2+PR7QAoiXhgUaPou+WjG2xmhhryvGrkUX5elgLvn
	 tXw9/h8rqfeQQ==
Date: Tue, 15 Sep 2026 19:21:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: tidy up error handling in probe()
Message-ID: <20260915-grouped-raffle-16b1fea4ad5f@spud>
References: <20260915-mpfs-1-v1-1-a12c2fd7e0d9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260915-mpfs-1-v1-1-a12c2fd7e0d9@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0943994539760011680=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0943994539760011680==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eq25msHQ+7NivrH0"
Content-Disposition: inline

--eq25msHQ+7NivrH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 01:14:08AM +0800, Felix Gu wrote:
> Restructure the probe error labels so each failure only tears down
> what was already acquired, and stop calling
> usb_phy_generic_unregister() with NULL or an ERR_PTR() on paths
> where the phy was never registered.
>=20
> The old error paths only worked because platform_device_del() and
> platform_device_put() ignore NULL and ERR_PTR() arguments.
>=20
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/usb/musb/mpfs.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index 587127abd30a..59625ed95656 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -276,13 +276,13 @@ static int mpfs_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk)) {
>  		dev_err(&pdev->dev, "failed to get clock\n");

Could go a step further if you want, and use devm_clk_get_enabled().

This is clearly the wrong order, so this patch is fine as-is.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  		ret =3D PTR_ERR(clk);
> -		goto err_phy_release;
> +		goto err_pdev_put;
>  	}
> =20
>  	ret =3D clk_prepare_enable(clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to enable clock\n");
> -		goto err_phy_release;
> +		goto err_pdev_put;
>  	}
> =20
>  	musb_pdev->dev.parent =3D dev;
> @@ -324,29 +324,29 @@ static int mpfs_probe(struct platform_device *pdev)
>  	ret =3D platform_device_add_resources(musb_pdev, pdev->resource, pdev->=
num_resources);
>  	if (ret) {
>  		dev_err(dev, "failed to add resources\n");
> -		goto err_clk_disable;
> +		goto err_phy_release;
>  	}
> =20
>  	ret =3D platform_device_add_data(musb_pdev, pdata, sizeof(*pdata));
>  	if (ret) {
>  		dev_err(dev, "failed to add platform_data\n");
> -		goto err_clk_disable;
> +		goto err_phy_release;
>  	}
> =20
>  	ret =3D platform_device_add(musb_pdev);
>  	if (ret) {
>  		dev_err(dev, "failed to register musb device\n");
> -		goto err_clk_disable;
> +		goto err_phy_release;
>  	}
> =20
>  	dev_info(&pdev->dev, "Registered MPFS MUSB driver\n");
>  	return 0;
> =20
> -err_clk_disable:
> -	clk_disable_unprepare(clk);
> -
>  err_phy_release:
>  	usb_phy_generic_unregister(glue->phy);
> +err_clk_disable:
> +	clk_disable_unprepare(clk);
> +err_pdev_put:
>  	platform_device_put(musb_pdev);
>  	return ret;
>  }
>=20
> ---
> base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
> change-id: 20260914-mpfs-1-2e062f29128e
>=20
> Best regards,
> -- =20
> Felix Gu <ustc.gu@gmail.com>
>=20

--eq25msHQ+7NivrH0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmMnwAKCRB4tDGHoIJi
0hFLAQDsHxRSrMWqsLKY7Yw4lxGvSpGV0B6wTWolwZ0oSNcc+gEApRCuuj3hbymQ
p3OwJNqvrDupTGRG2Z6eG1EPVuKq6A0=
=lte0
-----END PGP SIGNATURE-----

--eq25msHQ+7NivrH0--


--===============0943994539760011680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0943994539760011680==--

