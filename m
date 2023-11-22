Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622C5C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/YVYMOrRvy8TrjqyWTOOC0oJYmd4KIwkk0CAm/RzFU=; b=Jv/1jDaWhRGZ2yxGzLb84FuxMp
	ZcSj8heiSRt/bvK/+lI8kHQtH62valrsT9zmD9zMDZjwuE8kRtV3IXk0CpDqAfXNIZXOnS/c7s+Bk
	0NSzPcZB1FKOTiq6yvBTP0G4VXCJdFv8/cxENjtzpPihpqoF3SHTog6ABxpIvlf1Fb0eBVlh+bTmZ
	J/FFJpBVQGU4JBo6KUCARHajdfLyaszO/AD17hnizsX3z3gV6K+Jxob55DBR9H98f19ULzO2u/+il
	nwipT657KjKNS9KI+Pfw+2WFcreQ7MNMetcgQ1vOBgvq5zWglH+7C0onyIiU4rvoQRJdFnHmYURqM
	zNKgf6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lBd-001WR8-0A;
	Wed, 22 Nov 2023 11:14:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lBa-001WQg-06
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:14:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 531A961D28;
	Wed, 22 Nov 2023 11:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2EDC433C7;
	Wed, 22 Nov 2023 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700651665;
	bh=PNxMxyBLvFrW4CyQkjkhff3t3XWgbfP+g9tudnvbQXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xq7hj2Y6ZYz0RLuGBjo6LS5d73GFEouXFX4F6EFohh5wvyCTny4vOK8a9ouEOwNT/
	 0Dy5DANOoQwajAOOGZxkeFm/JeO0Y4AKyob7IfhW98xd7W0Z+RjK9zKqVEe2/kKWKD
	 7BP+ngTMUiZkin2zGrjxuGbk3gYmtJR/t1PkyoTy17yvUtefrMsfWpZbVOv44uqlDE
	 T3VMwvNlm31xfN06gqDEBo60y7XsQM0lVazTtsiQJmEl7WJ1STtq/XH5gtyil7NmQO
	 wEDb0m4V6fcCiF5+NU9TTJZkxeRoqSXqjDXEdYPKlki0yaeZ5mvMvwUjsmPi50w8Wx
	 9H9hxR8c7nmjg==
Date: Wed, 22 Nov 2023 11:14:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v3 070/108] pwm: microchip-core: Make use of
 devm_pwmchip_alloc() function
Message-ID: <20231122-endanger-extenuate-97ef77b117da@spud>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-71-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231121134901.208535-71-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_031426_161093_FB68E11D 
X-CRM114-Status: GOOD (  24.19  )
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
Content-Type: multipart/mixed; boundary="===============9203020918765136875=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9203020918765136875==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SXnJvv4kOgRYNGEg"
Content-Disposition: inline


--SXnJvv4kOgRYNGEg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 02:50:12PM +0100, Uwe Kleine-K=F6nig wrote:
> This prepares the pwm-microchip-core driver to further changes of the pwm=
 core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pwm/pwm-microchip-core.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-microchip-core.c b/drivers/pwm/pwm-microchip=
-core.c
> index c0c53968f3e9..6e0c2cbfc120 100644
> --- a/drivers/pwm/pwm-microchip-core.c
> +++ b/drivers/pwm/pwm-microchip-core.c
> @@ -54,7 +54,6 @@
>  #define MCHPCOREPWM_TIMEOUT_MS	100u
> =20
>  struct mchp_core_pwm_chip {
> -	struct pwm_chip chip;
>  	struct clk *clk;
>  	void __iomem *base;
>  	struct mutex lock; /* protects the shared period */
> @@ -65,7 +64,7 @@ struct mchp_core_pwm_chip {
> =20
>  static inline struct mchp_core_pwm_chip *to_mchp_core_pwm(struct pwm_chi=
p *chip)
>  {
> -	return container_of(chip, struct mchp_core_pwm_chip, chip);
> +	return pwmchip_priv(chip);
>  }

I know this is likely a coccinelle job, but can we now delete things
like to_mchp_core_pwm() if there's a standard helper for this now?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>  static void mchp_core_pwm_enable(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> @@ -447,13 +446,15 @@ MODULE_DEVICE_TABLE(of, mchp_core_of_match);
> =20
>  static int mchp_core_pwm_probe(struct platform_device *pdev)
>  {
> +	struct pwm_chip *chip;
>  	struct mchp_core_pwm_chip *mchp_core_pwm;
>  	struct resource *regs;
>  	int ret;
> =20
> -	mchp_core_pwm =3D devm_kzalloc(&pdev->dev, sizeof(*mchp_core_pwm), GFP_=
KERNEL);
> -	if (!mchp_core_pwm)
> -		return -ENOMEM;
> +	chip =3D devm_pwmchip_alloc(&pdev->dev, 16, sizeof(*mchp_core_pwm));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +	mchp_core_pwm =3D to_mchp_core_pwm(chip);
> =20
>  	mchp_core_pwm->base =3D devm_platform_get_and_ioremap_resource(pdev, 0,=
 &regs);
>  	if (IS_ERR(mchp_core_pwm->base))
> @@ -470,9 +471,7 @@ static int mchp_core_pwm_probe(struct platform_device=
 *pdev)
> =20
>  	mutex_init(&mchp_core_pwm->lock);
> =20
> -	mchp_core_pwm->chip.dev =3D &pdev->dev;
> -	mchp_core_pwm->chip.ops =3D &mchp_core_pwm_ops;
> -	mchp_core_pwm->chip.npwm =3D 16;
> +	chip->ops =3D &mchp_core_pwm_ops;
> =20
>  	mchp_core_pwm->channel_enabled =3D readb_relaxed(mchp_core_pwm->base + =
MCHPCOREPWM_EN(0));
>  	mchp_core_pwm->channel_enabled |=3D
> @@ -485,7 +484,7 @@ static int mchp_core_pwm_probe(struct platform_device=
 *pdev)
>  	writel_relaxed(1U, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
>  	mchp_core_pwm->update_timestamp =3D ktime_get();
> =20
> -	ret =3D devm_pwmchip_add(&pdev->dev, &mchp_core_pwm->chip);
> +	ret =3D devm_pwmchip_add(&pdev->dev, chip);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Failed to add pwmchip\n");
> =20
> --=20
> 2.42.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--SXnJvv4kOgRYNGEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV3ijQAKCRB4tDGHoIJi
0uH/AQD4m6PopEGhG9YwIxM6lYeFLIA8mpHBwkgQVVUzTKCrDAEAlBGTd+DJ67Hy
YWE5VSVNkHRXkYGOW3wz25bwwjzb/Ao=
=A3wH
-----END PGP SIGNATURE-----

--SXnJvv4kOgRYNGEg--


--===============9203020918765136875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9203020918765136875==--

