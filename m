Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD05606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 02:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VHtUTqgt;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NR6/RAAt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MeW1g+A5zfMGOpvDlAB4gg0XolJK5mml22OBdtP4qoA=; b=VHtUTqgtxuPksaoNa7yc8hoM+Y
	Bo3zwbtAE3bOJWAw66fWasfOYQe5dfevwJ0MVhGjYyjDR0B0c52uV8M6FjVfW6pqbGo9da7JKc5lT
	hBcm2iezp/7OIRCbG3DCONHBvuOggOvML0ALCxJh6oq6Y7Cz6T5WKfvJFonBzf+2xCJEMOljHgda8
	8UVUyYogI1ZeeRTNyIerANLAUYQzFlbYhWbEYpsm+9Jbiz/oUB+pYELVBRZ2vXrqljqtDzXr41uKn
	IPNyouSq94hY53f1lPXLN3RGZEzYJCmSVXizJrqJFCiMQJHHGKMD+L8yIbCwtWsB3fs9gQr/HTMX/
	D7zes4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQJ1-000000046pB-16yd;
	Wed, 04 Nov 2026 02:00:51 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQIw-000000046mi-1IUe;
	Wed, 04 Nov 2026 02:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793757606;
	bh=ID6BIMHIs5dozQ7uo2Zz7lMx53/Uma4fVMefg73C8Wc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=NR6/RAAtadCxMT4aZNlWPKRVIcS8Uk+8x0Dzwevvs6B9RgwZ7gNVgfqgw2V6jccY2
	 diZt/zl8uph3tIhysVhM5N/Yu8QvYwWUDPYY1qlQnLcFnuzUtdu8OZw0KH4ezoDL8p
	 E2DgEks2Bd8LbYe+KH6+erZz2fFcbxQrJtZNGXkc=
X-QQ-mid: zesmtpsz9t1793757596tb1b7ee28
X-QQ-Originating-IP: MD06nJQTuVrERiBp4eZOuk/3YdF/RHaLSj82pRQMepc=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 09:59:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13434004078560652839
EX-QQ-RecipientCnt: 60
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 04 Nov 2026 09:04:38 +0800
Message-Id: <DMM0TNL4VAOH.JFJQU10EQHE4@linux.spacemit.com>
Cc: <vkoul@kernel.org>
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <Frank.Li@oss.nxp.com>, "Mark Brown" <broonie@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Radu Pirea" <radu_nicolae.pirea@upb.ro>, "CL
 Wang" <cl634@andestech.com>, "Ryan Wanner" <ryan.wanner@microchip.com>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>, "Ray Jui"
 <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Vladimir Oltean" <olteanv@gmail.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han Xu"
 <han.xu@nxp.com>, "Haibo Chen" <haibo.chen@nxp.com>, "Linus Walleij"
 <linusw@kernel.org>, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Daniel Mack" <daniel@zonque.org>, "Haojian Zhuang"
 <haojian.zhuang@gmail.com>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Heiko Stuebner" <heiko@sntech.de>, "Fabrizio Castro"
 <fabrizio.castro.jz@renesas.com>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Alain Volmat" <alain.volmat@foss.st.com>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Laxman
 Dewangan" <ldewangan@nvidia.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Kunihiko Hayashi"
 <hayashi.kunihiko@socionext.com>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated
 list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>, "moderated list:BROADCOM BCM2711/BCM2835
 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open
 list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, "open list:ARM/QUALCOMM
 MAILING LIST" <linux-arm-msm@vger.kernel.org>, "open list:ARM/Rockchip SoC
 support" <linux-rockchip@lists.infradead.org>, "open list:RENESAS RZ/V2H(P)
 RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, "open list:SAMSUNG SPI
 DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:RISC-V SPACEMIT
 SoC Support" <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT
 SoC Support" <spacemit@lists.linux.dev>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, "open
 list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, "open
 list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nt+vlNWZIyDVardnGhXGmIz++iaqJMa8X3K58BDfcKrjn6KaGyofIuD6
	nz8dSWt249uhFGj4Pb8bYC4xaH1HnVMJJPn89VWhNglD/1gvydP5OtVvSl+EqZamjvTFckx
	ugBuwgDN5ptpNMH72eq2Y63G0E4C7QMjOFQcYmGlhb+q480da9+nx18DIuiSFOKjbAAuv1H
	zkgQM6D7rilR++Tv+6Q5WAnb4bBCI7nawFn96/eUPRJMbvvINh1/637ZNObW2T5Dgr8hxGv
	Pb0l6S8qZ3vZ0bI5mifRidCRb9vv959e7eFJtvcWA5zl5+bIrz4+S27UZLhBvX2iNVPi1cL
	Px3kTuyCZH1JrP1ZXuBOxDd2nGu9NwWEHtZMlyfsvx14b/R0rhbyO1X8ovJIrC7lXaueNOz
	mMOr+5Q2W24oDLguL4JqbBvCGS2FwNnRIiJZwwrBOgPRSekxYl9QdpmWjfromcv5XtLKCV8
	MZTINDasYkzG2j96yHsNeNQSOdWhIybRmjTaCkwT38irHlhzvlAccCEz0KICVJtcCibUtRf
	gWeTXJ82hdoQSq+bxDIs7P8uaLOReHALmwQE7oryG7KeaFY69WffoNGQC6FY9d6szd+bXuC
	jJzKROR4GFUfcskWrwH793dePS0tVCdOipEdxjwkO05Z9VxAH+8rt4n2ci6s6JpwnD+tOZ+
	6X36jtSsab+n0UpEv67zr4ER8o99LM+DH97wUDFGRKnhIb2Mm5QQro7DeXREtVdU9MaHvSE
	MNksRHdUcAHTgr/hrFcM2U/+ztu221ka/0K0Z9MtNd2zdiRe9E1PlVFSlVXhmH3TH8tcdlw
	H6lD9c5jLRZiGeOEG/bsdJ/HR7AbMAzg8EBfDCHx8psM4wbU9Cqb7LyBqspjebBYUaEWD+K
	ppdk8J/X11UaZid7kw+wuHnQX/mhlM5IrpwKF2dl1WmwzOdh+tiwGYSa/mmL6CVlTknvf9l
	24Oq/Tuc7DeIyBJwnxCBXVMFXRsOGph2cPMZSUxDpdSCOyGANaDLoO+cspFxpbtGCExQwWw
	cmNLQI9qiDC9uvJUOwpj2e4EjYQN6t3829Ak2gPEcZf4UQNsDmeylvjtqUR30r+J4R1KS8h
	d9Zvw4VQD2x7KUoiUU+ZskhtqEtajoCrQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_180047_244687_B9A1DED6 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5876203440310822540=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5876203440310822540==
Content-Type: multipart/signed;
 boundary=491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 1:39 AM +08, Frank.Li wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/spi/atmel-quadspi.c       | 3 +--

[...]

>  drivers/spi/spi-spacemit-k1.c     | 3 +--
For spi-spacemit-k1.c:
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauqEphAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQvbm4A/3HANvkYXGwCFgtSV4A5x/SL0RIfjNSYBzhT
PnYB++eVAQDPfgYcXc7pJv333Y0YE7vFp8FUIkC1g+Aqf+cidgd9CA==
=y0Nc
-----END PGP SIGNATURE-----

--491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d--


--===============5876203440310822540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5876203440310822540==--

