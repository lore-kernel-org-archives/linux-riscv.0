Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B63ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 06:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3YCR1UdFyIdOSUdq3WML1Y3qyuv7Tv2KWvLAKN0uwU=; b=Dk62sRJiz2O0DiqKzu63AmTdC1
	l3osveH4t+cuR7jxTr+rdTNIAuPKEydexNi1ktrkS+/vLWwNphcFxjjHRBOKUYC9r9pg59pHDoHDE
	zPKmVWOFPvSluATZA9/BNVuyPENlI0ktm8fwb+FSTzap6A45993xPsLZrw7McCC/LWnjF5zlqW8wL
	0vH0V3ZxUPfu/hT4sbETS2kJjfWnlIFQQGUuqc/nvgueiU/1rCPLztWPYWtBAOtz3ObBWzvLVcNyz
	N7JEAqUgNmIh9fVQp6Tm8xOVJ/quS9RKH0NB3xrBCVaMzKHx0iIWn7W7M50YUmrB72c5PtoD0vxrz
	CQ2CKlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWWt-000vOy-4l; Tue, 20 Sep 2022 06:14:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWWq-000vLS-Pv
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 06:14:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaWWm-00024b-80; Tue, 20 Sep 2022 08:14:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaWWm-001o7S-1M; Tue, 20 Sep 2022 08:14:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaWWj-0028m5-Op; Tue, 20 Sep 2022 08:14:37 +0200
Date: Tue, 20 Sep 2022 08:14:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olof Johansson <olof@lixom.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] serial: sifive: enable clocks for UART when probed
Message-ID: <20220920061434.ettul5ae2bw6mxme@pengutronix.de>
References: <20220919223915.5146-1-olof@lixom.net>
MIME-Version: 1.0
In-Reply-To: <20220919223915.5146-1-olof@lixom.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_231444_860176_BBAAC057 
X-CRM114-Status: GOOD (  23.44  )
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
Content-Type: multipart/mixed; boundary="===============8969422195461334105=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8969422195461334105==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="esuswvtwlxfa63tf"
Content-Disposition: inline


--esuswvtwlxfa63tf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 19, 2022 at 03:39:15PM -0700, Olof Johansson wrote:
> When the PWM driver was changed to disable clocks if no PWMs are enabled,
> it ended up also disabling the shared parent with the UART, since the
> UART doesn't do any clock enablement on its own.
>=20
> To avoid these surprises, add clk_prepare_enable/clk_disable_unprepare
> calls.
>=20
> Fixes: ace41d7564e655 ("pwm: sifive: Ensure the clk is enabled exactly on=
ce per running PWM")
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  drivers/tty/serial/sifive.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 5c3a07546a58..751f98068806 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -950,23 +950,28 @@ static int sifive_serial_probe(struct platform_devi=
ce *pdev)
>  		dev_err(&pdev->dev, "unable to find controller clock\n");
>  		return PTR_ERR(clk);
>  	}
> +	clk_prepare_enable(clk);

The return code of clk_prepare_enable() must be checked. Also there is a
simpler patch to fix that problem. I didn't test but I expect just doing=20

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 5c3a07546a58..4b1d4fe8458e 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -945,7 +945,7 @@ static int sifive_serial_probe(struct platform_device *=
pdev)
 		return PTR_ERR(base);
 	}
=20
-	clk =3D devm_clk_get(&pdev->dev, NULL);
+	clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "unable to find controller clock\n");
 		return PTR_ERR(clk);

would be enough and also cares for disabling the clock on remove.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--esuswvtwlxfa63tf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMpWkYACgkQwfwUeK3K
7AnywQf7BdspOW1w2yf0sn2zzN7vZ8uTyeaUdaeAPp30OHYQrYxG8NItdzcFeAjQ
SgP7GV52s0NzSYLquIRHJ60xVOfS15fnJaJkzHu9P0Bq9I3dRqVE1KmB7+VNF0jh
eMfr+DyWJan6s2EjS3U1AwnDP5lkZz+S81RSxgEnlGSxoFnuIYS5lrQeLNBWx3dv
1vGSPC2qKbHBNuAAMCSFoJvvG0fljA5iUcXolnmL0bWsoywEY5tq0PpfVRLvQltx
gDqi7XshrO5YjTux/MMEWHLnLD+LtpCt+lerGnVkw1t5rNdBIvP/b5UqSUmlCWPg
7EkuwFzXLwZiUTyZfYqlIeTkxGc+mw==
=1mpl
-----END PGP SIGNATURE-----

--esuswvtwlxfa63tf--


--===============8969422195461334105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8969422195461334105==--

