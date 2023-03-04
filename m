Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCC9C678DB
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 13:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/ORmpGfhhJUQLKX5OrhQ/zmF4t2OR1fIonsI1k+E6s=; b=x65b3E9xJy0Zq84j/ebF0d4Pxp
	WYH5CddkQ3oQsl3dOHaob+CkZxKl5E/YNXbPFtdemi3FORg0qNnlAdutWnhwE1Nd76WeDTO5+d8j4
	rIXIOGZiynHfGngFxL1fJsqOa0TuvK1oWZA7sWJLuxzOOEarsbESEJBbVzyw5nh2VeWq4WHtzY4Rd
	8DEgIklVONOCsTa7E36kX8KQ2oZklN6X/uR5dGZ8VVOhesBR+FqMMfUrg7ScKmMXwOSL8UpeGvME1
	bMpf03jDpY4uWh32W2ERZl93bOdP2DcXl50gVp3PcW2WpZ39k7CfldOemcOxXtS5qJ+pyp6h2X728
	W6OraHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYSES-0095Ql-CR; Sat, 04 Mar 2023 13:47:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYSEP-0095Py-Ft
	for linux-riscv@lists.infradead.org; Sat, 04 Mar 2023 13:47:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CE99EB80123;
	Sat,  4 Mar 2023 13:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB860C433D2;
	Sat,  4 Mar 2023 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677937641;
	bh=hWHUSaDzmJkG4Kw01uA2fHvq4b5Dkeyw+ai0+31vN7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJyocZw9zevswKyeH5CvQ6wQ3A3njdTvsBYTGfecp+dp8S6EWywj3q5yKLE2YLAzX
	 M6mFHH8rNtuwreCsuJjOaZWWc8o7SsbfXEUdaPLOfNmKuCJAKvIuEVkOwpqHxn8grR
	 +zU5glM8J7aRySbYmXtSCejP+KT4Ni6lAj9rsOcthK4J9m12It/QwY1L6o/466+4GE
	 1I543usQKt0JMe/NIkn3q2Fz/SBytMuINC7rreNAoR3VpE9naWd4R1ElryKE37OQpq
	 T/+vx0va7V14kasMHJntw+uBQPyc63Ab/o4W4yMv0vbUi6pWRpgFPKbnbPaynPFuza
	 NAzcnG4Jb3r9A==
Date: Sat, 4 Mar 2023 13:47:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 18/41] rtc: mpfs: Convert to platform remove callback
 returning void
Message-ID: <6c93ded7-f9ed-4f01-94ef-503900d5120a@spud>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-19-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230304133028.2135435-19-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_054725_855247_DADB929D 
X-CRM114-Status: GOOD (  25.46  )
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
Content-Type: multipart/mixed; boundary="===============8857192234260751339=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8857192234260751339==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RoEFS/lyAZPH8xif"
Content-Disposition: inline


--RoEFS/lyAZPH8xif
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 04, 2023 at 02:30:05PM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  drivers/rtc/rtc-mpfs.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 2a479d44f198..5b96a6d39210 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -274,11 +274,9 @@ static int mpfs_rtc_probe(struct platform_device *pd=
ev)
>  	return devm_rtc_register_device(rtcdev->rtc);
>  }
> =20
> -static int mpfs_rtc_remove(struct platform_device *pdev)
> +static void mpfs_rtc_remove(struct platform_device *pdev)
>  {
>  	dev_pm_clear_wake_irq(&pdev->dev);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id mpfs_rtc_of_match[] =3D {
> @@ -290,7 +288,7 @@ MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
> =20
>  static struct platform_driver mpfs_rtc_driver =3D {
>  	.probe =3D mpfs_rtc_probe,
> -	.remove =3D mpfs_rtc_remove,
> +	.remove_new =3D mpfs_rtc_remove,
>  	.driver	=3D {
>  		.name =3D "mpfs_rtc",
>  		.of_match_table =3D mpfs_rtc_of_match,
> --=20
> 2.39.1
>=20

--RoEFS/lyAZPH8xif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZANL0wAKCRB4tDGHoIJi
0qHdAP9DvnqB21+PjqzdhHhJ5rh1fatkOprrWT06kKNyRI/GwAEAp0UG7za0+Re1
PDSwYAGYFNRzfiMA0QWNa7rYIhSFtw0=
=Syln
-----END PGP SIGNATURE-----

--RoEFS/lyAZPH8xif--


--===============8857192234260751339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8857192234260751339==--

