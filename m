Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416E8C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpfNJQOCyEiyQb3dXo2df5ddJ2SJq2e/CgD6nzotdP0=; b=nUFy/bmBhSk0WiSfP3ZZA4SZpf
	lwH7UOTpXalDYjSHdc9ZLld0OdbusXq0FRG0oGqj54vFPGOtdMyREyHkePh1ySqnwaM9pP46qbtKw
	va4kT9yIbaMosFDu9/qqbv0l0FhKNYEGlbOPcgmxkPClNuJWa6mH/TwY70xmavnqfg4FDZlZ4p2kM
	Mm4fmrGw+ytrwiEXlNItiKs7DzSKs4QgJzCuX53FcgeimyCDr6hi9JKfq9qVrNaX0Yx4sjL6D7GsW
	f1T37Zay5/caO8XAZ6R7duvjBk/vQbEEyiNOsEIbLS61hvdOkQLked7xTNdeoKCrX1cVOuRS+S1CD
	Hk/PT8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9U5-0074Me-Rg; Fri, 03 Mar 2023 17:46:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9T2-0073vP-Ll
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:45:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 98064B818FB;
	Fri,  3 Mar 2023 17:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2081C433EF;
	Fri,  3 Mar 2023 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677865512;
	bh=YEsOAGjW3wJ37nuzTUD4sEHtd/rS1uMDhbqFEzFllKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8LaqiNwqZkZpRfb6NhoC5VG/47ZqUKMTAYGJlWDrLgQIgnsoam/K+k9E5aHUhl/f
	 3CIM1+0p94nWeKCWApYvP15m2JxE7+kJk+qSu2zbsM8nCDJCMuacw05gyvTacN76vG
	 TE40bT+t1WZpVCfQVLDycbKV0T1kgtr4TNOJ+BYGGlc6Wy8B0cgi4bW7po9JFpX4Zm
	 GXRe7JbQILUWpWOrJtPN0P5qmxrKWXPkEr8GG9J1BruQXPi/VhF8kg3eFGW7KRaEbS
	 +eZeBouRXgwYwkWhYDDeFUXxJdjdyxUTHV1sro85qkF/36ZDmRvlw0QqaxdWu1fDQx
	 Q9GqO93aJXEOA==
Date: Fri, 3 Mar 2023 17:45:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 36/87] spi: microchip-core-qspi: Convert to platform
 remove callback returning void
Message-ID: <5a1747b5-ad3f-41c9-bc1b-0319ee88de76@spud>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
 <20230303172041.2103336-37-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230303172041.2103336-37-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_094517_069578_D6756CF3 
X-CRM114-Status: GOOD (  24.73  )
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
Content-Type: multipart/mixed; boundary="===============5648861358749799281=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5648861358749799281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SnlvmsQuXmNAf7KZ"
Content-Disposition: inline


--SnlvmsQuXmNAf7KZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 06:19:50PM +0100, Uwe Kleine-K=F6nig wrote:
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
>  drivers/spi/spi-microchip-core-qspi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-micr=
ochip-core-qspi.c
> index 19a6a46829f6..4f76ddf97b10 100644
> --- a/drivers/spi/spi-microchip-core-qspi.c
> +++ b/drivers/spi/spi-microchip-core-qspi.c
> @@ -566,7 +566,7 @@ static int mchp_coreqspi_probe(struct platform_device=
 *pdev)
>  	return ret;
>  }
> =20
> -static int mchp_coreqspi_remove(struct platform_device *pdev)
> +static void mchp_coreqspi_remove(struct platform_device *pdev)
>  {
>  	struct mchp_coreqspi *qspi =3D platform_get_drvdata(pdev);
>  	u32 control =3D readl_relaxed(qspi->regs + REG_CONTROL);
> @@ -575,8 +575,6 @@ static int mchp_coreqspi_remove(struct platform_devic=
e *pdev)
>  	control &=3D ~CONTROL_ENABLE;
>  	writel_relaxed(control, qspi->regs + REG_CONTROL);
>  	clk_disable_unprepare(qspi->clk);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id mchp_coreqspi_of_match[] =3D {
> @@ -591,7 +589,7 @@ static struct platform_driver mchp_coreqspi_driver =
=3D {
>  		.name =3D "microchip,coreqspi",
>  		.of_match_table =3D mchp_coreqspi_of_match,
>  	},
> -	.remove =3D mchp_coreqspi_remove,
> +	.remove_new =3D mchp_coreqspi_remove,
>  };
>  module_platform_driver(mchp_coreqspi_driver);
> =20
> --=20
> 2.39.1
>=20

--SnlvmsQuXmNAf7KZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAIyJAAKCRB4tDGHoIJi
0gaIAQD67FENv5CFm3XI2rGFd91cNd5KQi6z2ITLjp6N5BPwoQD9Ghd5ncasQ/Y2
IwdvWr6QB32McNURMyELW7tbReeEbAg=
=PldB
-----END PGP SIGNATURE-----

--SnlvmsQuXmNAf7KZ--


--===============5648861358749799281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5648861358749799281==--

