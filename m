Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D6606A331
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d9a+pRro;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QcpuR7ET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iFTDnR5rAKGZJxBjBavlavAcAw1F76R7yCeM2Y2S5Zc=; b=d9a+pRroaY7fBC+T0v/wafcmdF
	7cXZCt8g7rXNpz/r5rEcdlhOYCw2oMsxSMdEDcrPmGLHvYtWEOXlEhDuFgwA/FkCL75nZ6l5TNpvp
	nZn6yNlCaPjUCmO/sLEsIyetwM6vTWcbBe3wM9Aw0wmdwbRN1bAq09/f80kSJ3bB8o/AwO8rQPQOc
	oFbei94KEqLhAM7PgOlTElFEZJdQ6Ia882+aNWNN5tJcWjFJV6AH4OxIKADR+QW4eThiNAmIxW13E
	rXGxyTfnPEfohqV8iF3HVYVxaOquzGuzMcNtSOPzyl4JdfvQYTdbCZnZBSVsivyVBodUBNU14iQAi
	LOEmHrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOay0-00000005TWR-1ydV;
	Wed, 04 Nov 2026 13:23:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaxx-00000005TW1-3L9K;
	Wed, 04 Nov 2026 13:23:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E785B60546;
	Wed,  4 Nov 2026 13:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39071F000C1;
	Wed,  4 Nov 2026 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798628;
	bh=oFQnvnnH43Wjq3NYgvbhyicdVMArULRPqgjr7vsX1pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QcpuR7ET2kcVQW1ILYUtFcGQUEsKGY8ZeaQ18BLfMdpM6Zy6dkppvEbCV6rUBWF+Z
	 Avh461nN5C3d1WxLXpdJfJmRlSx94IWc0WORuZHjgQFVG8AHCMBDHIBB21RFeWNL7c
	 CYfv29sCqv9yv9eKKZCmsvqy/46JQVY9jYhn4wBixP0qFjGg8bGSfVE5wP+9W86Y5x
	 86TU3B/xrwNjStTaH8iRHT9M3mYY+xdVYghtd2X3Xd+x2Sbcg6RdDy1a0wNkaZh/lu
	 rv/Ff6yJHH6uJzZihNSR3BrMSXAfQ0wbr/gGY+M+iePQDMSrsMBvSsPT1SYiR62UgJ
	 Znax0soeaSpHQ==
Date: Wed, 4 Nov 2026 14:23:46 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Radu Pirea <radu_nicolae.pirea@upb.ro>, 
	CL Wang <cl634@andestech.com>, Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, vkoul@kernel.org
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
Message-ID: <aust2fUAFSsAXK9g@orome>
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2055119677758729893=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============2055119677758729893==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="unoy3twvi5fxh2md"
Content-Disposition: inline


--unoy3twvi5fxh2md
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 12:39:58PM -0500, Frank.Li@oss.nxp.com wrote:
[...]
> diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
> index 087735ed9c80c..b115daf2c76f3 100644
> --- a/drivers/spi/spi-davinci.c
> +++ b/drivers/spi/spi-davinci.c
> @@ -703,10 +703,8 @@ static int davinci_spi_bufs(struct spi_device *spi, =
struct spi_transfer *t)
>  		if (!txdesc)
>  			goto err_desc;
> =20
> -		rxdesc->callback =3D davinci_spi_dma_rx_callback;
> -		rxdesc->callback_param =3D (void *)dspi;
> -		txdesc->callback =3D davinci_spi_dma_tx_callback;
> -		txdesc->callback_param =3D (void *)dspi;
> +		dmaengine_desc_set_callback(rxdesc, davinci_spi_dma_rx_callback, NULL,=
 (void *)dspi);
> +		dmaengine_desc_set_callback(txdesc, davinci_spi_dma_tx_callback, NULL,=
 (void *)dspi);

You could probably drop the cast while at it.

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index b25f94b2ef738..7798197d5b350 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
> @@ -634,8 +634,7 @@ static int fsl_lpspi_dma_transfer(struct spi_controll=
er *controller,
>  	if (!desc_rx)
>  		return -EINVAL;
> =20
> -	desc_rx->callback =3D fsl_lpspi_dma_rx_callback;
> -	desc_rx->callback_param =3D (void *)fsl_lpspi;
> +	dmaengine_desc_set_callback(desc_rx, fsl_lpspi_dma_rx_callback, NULL, (=
void *)fsl_lpspi);

Same here.

>  	dmaengine_submit(desc_rx);
>  	reinit_completion(&fsl_lpspi->dma_rx_completion);
>  	dma_async_issue_pending(controller->dma_rx);
> @@ -648,8 +647,7 @@ static int fsl_lpspi_dma_transfer(struct spi_controll=
er *controller,
>  		return -EINVAL;
>  	}
> =20
> -	desc_tx->callback =3D fsl_lpspi_dma_tx_callback;
> -	desc_tx->callback_param =3D (void *)fsl_lpspi;
> +	dmaengine_desc_set_callback(desc_tx, fsl_lpspi_dma_tx_callback, NULL, (=
void *)fsl_lpspi);

And here.

> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index cadf0b93f4403..f8a3ac11f49d0 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -1738,8 +1738,7 @@ static int spi_imx_dma_submit(struct spi_imx_data *=
spi_imx,
>  		return -EINVAL;
>  	}
> =20
> -	desc_rx->callback =3D spi_imx_dma_rx_callback;
> -	desc_rx->callback_param =3D (void *)spi_imx;
> +	dmaengine_desc_set_callback(desc_rx, spi_imx_dma_rx_callback, NULL, (vo=
id *)spi_imx);

Here, too.

>  	cookie =3D dmaengine_submit(desc_rx);
>  	if (dma_submit_error(cookie)) {
>  		dev_err(spi_imx->dev, "submitting DMA RX failed\n");
> @@ -1756,8 +1755,7 @@ static int spi_imx_dma_submit(struct spi_imx_data *=
spi_imx,
>  	if (!desc_tx)
>  		goto dmaengine_terminate_rx;
> =20
> -	desc_tx->callback =3D spi_imx_dma_tx_callback;
> -	desc_tx->callback_param =3D (void *)spi_imx;
> +	dmaengine_desc_set_callback(desc_tx, spi_imx_dma_tx_callback, NULL, (vo=
id *)spi_imx);

And here.

> index eb3485149e75a..fdda26eb311fb 100644
> --- a/drivers/spi/spi-topcliff-pch.c
> +++ b/drivers/spi/spi-topcliff-pch.c
> @@ -1021,8 +1021,7 @@ static void pch_spi_handle_dma(struct pch_spi_data =
*data, int *bpw)
>  		return;
>  	}
>  	dma_sync_sg_for_device(&data->host->dev, sg, num, DMA_FROM_DEVICE);
> -	desc_rx->callback =3D pch_dma_rx_complete;
> -	desc_rx->callback_param =3D data;
> +	dmaengine_desc_set_callback(desc_rx, pch_dma_rx_complete, NULL, data);
>  	dma->nent =3D num;
>  	dma->desc_rx =3D desc_rx;
> =20
> @@ -1083,8 +1082,7 @@ static void pch_spi_handle_dma(struct pch_spi_data =
*data, int *bpw)
>  		return;
>  	}
>  	dma_sync_sg_for_device(&data->host->dev, sg, num, DMA_TO_DEVICE);
> -	desc_tx->callback =3D NULL;
> -	desc_tx->callback_param =3D data;
> +	dmaengine_desc_set_callback(desc_tx, NULL, NULL, data);

This is a preexisting issue, so nothing to do with your patch, but I'm
not sure I understand the purpose of setting callback_param to !=3D NULL
when callback =3D=3D NULL. If neither callback nor callback_result are non-
NULL, then callback_params seems to be completely unused.

Anyway, none of the above are blockers, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--unoy3twvi5fxh2md
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrrMd8ACgkQ3SOs138+
s6EYaw//UO6AHvJ+t7TrjGZA+UYLQHdy+GHHN92wIwin6E29tqokUx9FRtT1mxc+
QfpP+rIE6hr579pxyCp6mS/ocEtwyvXQ0NiQxu2KDDs4YHYh9OK6JhUHGwGtYn6r
P3Dhqwabt4yfcKDEwG00Xps8UwXK/mLJYsm5TPXnS0FiFetZeNGK0KORgB977tWk
4CEOjQOIvgKJIDgW0ornKkP5p3u5Nf+8qI6OuOkCkPmuK4Ed9DTwjHxzdx3M1Enf
6X9C8OMo5MWcn5Q4WWN4YwG/S+yYPkhz8wZOotBTvMcl1xLiz8Uc9Vn5AiDcH6hG
W8z1TXNaLhzBAE+Ov9viiL/wkD5sunZNnYLjkBsyxY1Lt1LNkOgvJGnKrf7u7Nn1
9NMMQEdb07ppFaphiVGbHRFmKFfVimrXPKBIbjoDfyFF7DscLjhXzl4ICwv4RaMR
k9vh0aZ4Efy2fOA4v61ePYYIY6sNjy+jyQp5YwXrToTkJ6UfnPyF9xeIBHJNM91Y
WqO7StU+DRjiP3FKmfYMt6rLJFe/SgGJ35vOl2fgMHD2NNRGafYIWsC0jHpteo8s
mA1Rd9Sj+E1fQqzIi+8a9grsUfq4aodwBgy3MNZhqs+6JG6BadJmTD+r/POrX7BJ
9MPiWfYSOGkvf4dm2lHIJ2nQVZZcUtLrj/Hm6DakNESIle457lU=
=AUYN
-----END PGP SIGNATURE-----

--unoy3twvi5fxh2md--


--===============2055119677758729893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2055119677758729893==--

