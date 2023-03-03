Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AC7C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSzSU9HVgTgSjHJ2tcYhDLs2Iw12Hruo1101Xn+ddLY=; b=sR5gc8dwv/6IEZaE+AnYAmUV+G
	zDpP8ykiWF2S5XCm5DsO6amycqvfiY0oXDL5De5KapVOr1CeDaXGzePum5mLQ/NqY+gmE32Pg3m1n
	ykMAYl/k8YJv6+pfZNnup7+CAca25PXBSKmW0FoCSepEQvoIROOWZJmX+6KPqBhN/6VQJjClC5WMN
	B3pVVQLFnv1zPLfzqHU2xwB9A6Judm4Z3+td6hVaCMSfL+GQAJpaXeCozq1bZ48AetDO/4y+8v669
	xHCtxPU8hrGNErpgAOsoaZdzrB1FvJyh21TjL4u+YhzwS58dyt9lguKCEJYQevtHdz9swmPfbQDH6
	VeOb1IxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9Ty-0074Ii-H6; Fri, 03 Mar 2023 17:46:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9Sf-0073kt-63
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:44:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5CEFBB81991;
	Fri,  3 Mar 2023 17:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6517CC433EF;
	Fri,  3 Mar 2023 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677865490;
	bh=xud2gjW8VOUUIuL3oEVZaetezfIAxATDZm0MEYpXJ04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkI9UA1D+NMSFv2UV4A7tlAYDYtfXBKmL2vzeX+TSNht1hgVo/7uekqpsvLYIfdCr
	 Gm3IIdc4s46pt1ZxFe0ujEsfZ0RCAsdNHpz/InR1tV5kkeg8KiU5M/AZtYiQog4TkJ
	 b9YOH1/S6jnsAO//qcNfpCD8R76OlFLBR71BAWfukVCF9UkAPdG/vS50c13SVYYmct
	 QxQeHZBX1XR5FEoFMCZnRratoeE/F2Ecud+zRfzKp+mSlwHwzAcDH6h8i1fgrz9mlB
	 i2lK9E2edvRYvsa2moTadXj/EYVs27VSRnNQ3xmOLpnwUcfLHZn6IU0iiqO29l3T8G
	 lNMvsKDTXJHFw==
Date: Fri, 3 Mar 2023 17:44:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 37/87] spi: microchip-core: Convert to platform remove
 callback returning void
Message-ID: <7aee8e72-d7f5-4f13-8b8b-81feaf394ce7@spud>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
 <20230303172041.2103336-38-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230303172041.2103336-38-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_094453_579167_200062B0 
X-CRM114-Status: GOOD (  24.10  )
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
Content-Type: multipart/mixed; boundary="===============3844979366949569644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3844979366949569644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iAZQem5ygUBbukJK"
Content-Disposition: inline


--iAZQem5ygUBbukJK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 06:19:51PM +0100, Uwe Kleine-K=F6nig wrote:
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
>  drivers/spi/spi-microchip-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip=
-core.c
> index aeaa1da88f39..e6cf6ff08061 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -566,7 +566,7 @@ static int mchp_corespi_probe(struct platform_device =
*pdev)
>  	return 0;
>  }
> =20
> -static int mchp_corespi_remove(struct platform_device *pdev)
> +static void mchp_corespi_remove(struct platform_device *pdev)
>  {
>  	struct spi_master *master  =3D platform_get_drvdata(pdev);
>  	struct mchp_corespi *spi =3D spi_master_get_devdata(master);
> @@ -574,8 +574,6 @@ static int mchp_corespi_remove(struct platform_device=
 *pdev)
>  	mchp_corespi_disable_ints(spi);
>  	clk_disable_unprepare(spi->clk);
>  	mchp_corespi_disable(spi);
> -
> -	return 0;
>  }
> =20
>  #define MICROCHIP_SPI_PM_OPS (NULL)
> @@ -599,7 +597,7 @@ static struct platform_driver mchp_corespi_driver =3D=
 {
>  		.pm =3D MICROCHIP_SPI_PM_OPS,
>  		.of_match_table =3D of_match_ptr(mchp_corespi_dt_ids),
>  	},
> -	.remove =3D mchp_corespi_remove,
> +	.remove_new =3D mchp_corespi_remove,
>  };
>  module_platform_driver(mchp_corespi_driver);
>  MODULE_DESCRIPTION("Microchip coreSPI SPI controller driver");
> --=20
> 2.39.1
>=20

--iAZQem5ygUBbukJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAIyDQAKCRB4tDGHoIJi
0gjEAP4iTpLd9NzvzdbUUnK7BPLTDps60QAtbMaVC690u8EhgwEAzXhkz29RTq/J
uXXQX+BftEtLzsAEQ+xwTcJo//Xe2Ag=
=dG4f
-----END PGP SIGNATURE-----

--iAZQem5ygUBbukJK--


--===============3844979366949569644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3844979366949569644==--

