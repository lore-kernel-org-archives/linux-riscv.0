Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038E2606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GlWNJ4Y5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzgC/Mj6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6mBn/lSJw6bi6D2paIwCnVPVICpK2jl2ZEg8p9HnF7w=; b=GlWNJ4Y5gzFtd/A3Vmdcla0H71
	Yaliopj9sW01u3B0A2tByHvMfsqYck8rSVlN5Fd/P7EQ8NQduR+UPIt5Pid4dZz8rzXxKaTrQ5DBn
	VERab/atZSvDCz887Q9q2jb4DRWOOG6ULHb6Y27vUwZ6+0lBScnC3NLfWXgI5KapfUqLErmycYkEz
	uj0Yv6jlKvuvoFM+8hS+UczHamVxLyIfgmEGSr11ivI5Ee5NdHQjcGXwZq90lN1eZl9/yE392qaPm
	/p8jme0+f2xerS1zcW2JrU70TTpHtTOjH0f7yr4BRo9LCJj2j5WQtwjq7gEz1byg7lOolXl8Zerzq
	SCZpTrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOagv-00000005R0R-2niJ;
	Wed, 04 Nov 2026 13:06:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOagt-00000005Qzr-3CwU;
	Wed, 04 Nov 2026 13:06:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 352E362CCD;
	Wed,  4 Nov 2026 13:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6D01F000C1;
	Wed,  4 Nov 2026 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797570;
	bh=ZzMEbYA4V1ijTINuiBxo7UEs4HRgu3cpEmg+6Wx8grI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VzgC/Mj6YIWJ0AxGwvOLSwRfM1RU5vzmYnEGDOF8pLHyZ3jGCnImJI4c+DdSGVmTm
	 uknm6xCaRZYeTPni+axDTJ1Zw52DIRZeNQ+SHcAdAoWtuv9VZW1uCRt/acpNoKtaLB
	 qzZBje0sw7VHEs3bi+19VrwWDio0bQSVWQEr0pqx9mssqBK/xj0C3oJmACmarrFAfF
	 KGdVnUe8n5xmRmUrqIUT/2QBbSBYOsqVPCmfVe7QMivCA6N5OMhEFa6MigPM99eHr4
	 fZfh1y7rNvyNVW3AJSRPNdbj8UnSxnpa6AzzJLC2tKJS4Am01ekEgmm79nj4DvQ3zk
	 XuX1HtX8+Hp6A==
Date: Wed, 4 Nov 2026 14:06:08 +0100
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
Message-ID: <austohDT6sVqXjmi@orome>
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
Content-Type: multipart/mixed; boundary="===============1275251246932793273=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1275251246932793273==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r47ioco2lojtqtsf"
Content-Disposition: inline


--r47ioco2lojtqtsf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 12:39:58PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>=20
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
[...]
>  drivers/spi/spi-tegra114.c        | 6 ++----
>  drivers/spi/spi-tegra20-slink.c   | 6 ++----
>  drivers/spi/spi-tegra210-quad.c   | 6 ++----

Acked-by: Thierry Reding <treding@nvidia.com>

--r47ioco2lojtqtsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrrLb0ACgkQ3SOs138+
s6Fh4BAArZ9G0J40Sc0WR4narKlfZF1usKqwyjAubLvxVVm1ABcW7HLQy6ojuZU9
2s3UgBP9rFk8ZULpe+cax4/U3dlMXS8SxfonI4imx86Xn1zGzt4Ge9Ho42p41YyV
UaGejA2LtHz30dxEMI5SDt5yVg7k7oZLUIoZ7ssr0TAjuP6WPEuw+lx7UZy6OJ95
VXqb/jpz1fW6OEa1TsacFqqEXIw+JLxeD2WQGm33OMH5tfv53MTgfWHoSP7KF71m
xbANUfc2+OYcymeBLRMoCVIzv3WVyb5PSMrXrXY6U/mMfUUkC/IMILsDZvQ8wsua
VWUsj7hLVZlZUjVr2vvSfaiY9tZ6JiocaEs/BiUTGFpPg7GPzgIOvmn9SDgwLN/w
6nub3ObAvkU2ycqFWDypAOT43Yzqg17PR9L6LUyIB3hs8y8a8Uz74cpV7iMtg13o
VQ2tjXMJ00/kk45niYAlW18EBsgm4K4OBgplzlHHRQyG8+6PSZi+MJsF2jvy83oI
as7pTI6gPpNS0hB64ty/bSsQc6wZ1iOK1liQOAkpmV8pBuJzprxI+WCKmlBupJas
PDZY349C/AVPrK1zF6kum20SrlNPq5fKu45sigiciRrq5bBglX3qLh4Si4/hDIKJ
DIuO3rNQS6zjLAz1yotoAHOo1xNsr4igGGWmmmn5RGNxY0ZpgnU=
=N9j3
-----END PGP SIGNATURE-----

--r47ioco2lojtqtsf--


--===============1275251246932793273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1275251246932793273==--

