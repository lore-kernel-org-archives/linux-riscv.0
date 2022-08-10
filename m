Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9EBC25B07
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cy6eFCrcsZZzoIg3DomQqKxUz6pBP/Hdu9qKMy745kQ=; b=jTnEnBYH+vs3nEvluSyIdgC/v6
	+Tp6Lfqc15tuVsfOD/AFoYR+CYyXTJvJRxoy/JbyQy1brHjas+LPKIVs3MoIXBbtptKMEB4usQcVE
	VrDuv3w4syAjzUi6O8jCVysVktHODYAFD0yjTwJxA/BApSnYKhBt+mfoaiGmfoSL/eVcpZS9x5QBc
	Bk8GzM2PqsHmpkB+1b+p3S8JgCg2Rm+t9vGKgSFYiNEuyZ2TDTXg82tvMy4NKKhSFWUjAc4Z95nP/
	AqrrVmxyLWXqv4BQLGNM6bXFnRlpCUYL+hzf7ZSBCv6WLWzrVrQiQOY+OBH3quynCYW0q6dszUjdE
	o0SQ+eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLpFe-00DDed-Uh; Wed, 10 Aug 2022 17:12:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLpFZ-00DDVo-Ca
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 17:12:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oLpEt-0002uN-6E; Wed, 10 Aug 2022 19:11:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oLpEp-002wXp-BR; Wed, 10 Aug 2022 19:11:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oLpEq-00App4-9v; Wed, 10 Aug 2022 19:11:24 +0200
Date: Wed, 10 Aug 2022 19:11:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: soc@kernel.org, Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [RESEND PATCH 1/2] MAINTAINERS: add PolarFire SoC dt bindings
Message-ID: <20220810171124.74ew3yz5dtkz6v2s@pengutronix.de>
References: <20220810140243.2685416-1-conor.dooley@microchip.com>
 <20220810140243.2685416-2-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220810140243.2685416-2-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_101209_465547_9A9A1A34 
X-CRM114-Status: GOOD (  18.41  )
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
Content-Type: multipart/mixed; boundary="===============4882144814253309594=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4882144814253309594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuxnv4wk5vpd2vuv"
Content-Disposition: inline


--uuxnv4wk5vpd2vuv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2022 at 03:02:43PM +0100, Conor Dooley wrote:
> So far when I added bindings for the platform I never added them to
> our MAINTAINERS entry. No time like the present to improve the coverage.
>=20
> CC: Mark Brown <broonie@kernel.org>
> CC: Wolfram Sang <wsa@kernel.org>
> CC: Thierry Reding <thierry.reding@gmail.com>
> CC: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

> CC: Jassi Brar <jassisinghbrar@gmail.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Bartosz Golaszewski <brgl@bgdev.pl>
> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Olof Johansson <olof@lixom.net>
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 868bbf31603d..fd0f10a110e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17512,6 +17512,15 @@ M:	Conor Dooley <conor.dooley@microchip.com>
>  M:	Daire McNamara <daire.mcnamara@microchip.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
> +F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> +F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> +F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> +F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> +F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> +F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-co=
ntroller.yaml
> +F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> +F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
>  F:	arch/riscv/boot/dts/microchip/
>  F:	drivers/char/hw_random/mpfs-rng.c
>  F:	drivers/clk/microchip/clk-mpfs.c
> --=20
> 2.36.1
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uuxnv4wk5vpd2vuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLz5rkACgkQwfwUeK3K
7Anm1Qf8DzbSGq4tgk2Wj0ATtAx3MSlHam7uMAjWg9q4xDdgxD2/B/JW+Vy3U8TA
w4rcMeohX+4I8OwmOJMKAwXkGT6HgYQq3/sayYo0MvSj56xBa73SdgyEGHRiBqL2
KWyeeUT/WB0Pa3ZWf3k7L7QGHO+iTNgyowxiPAaUk/LsVUUdB09aCVAV65Lenyvk
vM1XaPgGPvFmTScxkRdjhiUCIUDrdCaBqsSuhHRgDMsmy7AVYqo/e4M+qpMvrslY
A0pNE6cDXTrOXnc8vmWbuYFSnlVnCzNAQWkLLlwiDXpk8LlEYAF8HVUiDlJOzaR2
SfPbaTU1BStvodgp79hj+KlzrDyR5A==
=kGXF
-----END PGP SIGNATURE-----

--uuxnv4wk5vpd2vuv--


--===============4882144814253309594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4882144814253309594==--

