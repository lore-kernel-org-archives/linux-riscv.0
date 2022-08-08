Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53115C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS9R6Lq2rx7b5ZBZwDt34Xn+8xzV9rtR9TfRcq/P240=; b=M0rbhnbKxtq6O9xj+fW4ivlDDp
	i6vp7igow8a8JG1GKfBdF/pKGkV9+oqX3ilhgOhzt53HENL4i4V40mGPQPtnc8476u7JEBD5nTpjk
	bNB3g8Kq1VsBfeeGj0OlLs1+ugEuVFkrdqOyeSIaFhs2IBBqmS1r0R611iTNznfwb6pAnOm/wrqcj
	+uvOCh9OIE2Hb6VZu6IR05GPrCdSwc7fP2DwkcFOIzSWzEMjUwDpOmavet/TF56GVFiUEf28DxvKH
	MO+SKqK/b56jHZkccnmY4h3Sc4adsAWsOPubDslGdZQOSaIh45dctP/7xSS1DDSKEXuEi4t9Hw1Nl
	z6lMRezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxjY-00CHrB-0q; Mon, 08 Aug 2022 08:03:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxjT-00CHpD-74
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 08:03:30 +0000
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1oKxjI-00013K-AU; Mon, 08 Aug 2022 10:03:16 +0200
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 45B26C45C4;
	Mon,  8 Aug 2022 08:03:12 +0000 (UTC)
Date: Mon, 8 Aug 2022 10:03:10 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add PolarFire SoC dt bindings
Message-ID: <20220808080310.ets2zqhgjbymajkx@pengutronix.de>
References: <20220805134908.749935-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220805134908.749935-1-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010327_274938_0649509D 
X-CRM114-Status: GOOD (  15.83  )
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
Content-Type: multipart/mixed; boundary="===============1296358353507837364=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1296358353507837364==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akuyayyjxuecv7hz"
Content-Disposition: inline


--akuyayyjxuecv7hz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05.08.2022 14:49:09, Conor Dooley wrote:
> So far when I added bindings for the platform I never added them to
> our MAINTAINERS entry. No time like the present to improve the coverage.
>=20
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I have another maintainers change queued, I'll send this via soc along
> with it unless there are any objections.
>=20
> CC: Mark Brown <broonie@kernel.org>
> CC: Wolfram Sang <wsa@kernel.org>
> CC: Thierry Reding <thierry.reding@gmail.com>
> CC: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> CC: Jassi Brar <jassisinghbrar@gmail.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Bartosz Golaszewski <brgl@bgdev.pl>
> CC: Wolfgang Grandegger <wg@grandegger.com>
> CC: Marc Kleine-Budde <mkl@pengutronix.de>

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--akuyayyjxuecv7hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmLwwzwACgkQrX5LkNig
013l+wgApwvDL8b9qW0m6aPWs7WXpXGzFfqR5PZFh+o3IpIYaQurj3KbQ9S0rSRP
iRq2vTbwdn/9aVMaiXRGm0ueJ0MJbZ4qLXQlUQ3ZCvC41Laobgm6AXaZwerwrINe
sCQm+ruJUoVvf2I7zDEjYx1OaCrIS8slPOHXHnN2EZk+PqNzXuKy3BShRACjsAyw
SKxCgmfoiKlSTM+nEw6QOmEkPKHf2Nz6aqmOeNNVZ7wocMU8jmwYdBMrK1X2fNpQ
xXNUFTRALOW/CS/dLohurp5hpnBzzufYu/mO8hCDCfgSSdF25ZjzJWhYE3YdORTO
11gCmKQ41hHEz92LOr94vyPPl0QfZg==
=udbm
-----END PGP SIGNATURE-----

--akuyayyjxuecv7hz--


--===============1296358353507837364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1296358353507837364==--

