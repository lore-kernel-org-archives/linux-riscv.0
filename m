Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34630C61D97
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUdGPwILqh1YomJW4lmJqY75cGzGWi4nHilJZi5ywgc=; b=SLgo5RKNVjACYKsikELuuLRTiX
	/MePKoByEkPIGRpph0dzvOI8hDGgkOFpVtkavylUQsTpR0XQtvsOAkRGQ6iLt0rLSzXdYEpQkyLw/
	BIt8zHHHo0KpTmtgVC+xRls2tiqpEkNODV6ERYNeNlIU73Z0e/KyRShMMj365mmWYbxdpLZx+Rjsu
	h4oxqXL/Jjm5ai67gHAZfDLKjCYMjGuCfe0rzAAk8dBTFAIevMg8qMciJt/4uvENSyhGNJmBW+c55
	G2XbZmkleuKSc7XP/fQVps2xq0H+dpr7n+kAOkG37+3+bOXP/hS4RMjKqNSsIvDYxo6DO+duISBUy
	vT+4zx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYr8-004yc5-DL; Mon, 30 Jan 2023 18:26:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYod-004xBB-Cz
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pMYoY-0001Hf-KZ
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 19:23:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pMRDp-001RYw-MJ; Mon, 30 Jan 2023 11:17:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pMRDo-00H0dV-5B; Mon, 30 Jan 2023 11:17:08 +0100
Date: Mon, 30 Jan 2023 11:17:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: aou@eecs.berkeley.edu, conor@kernel.org,
	emil.renner.berthing@canonical.com, geert+renesas@glider.be,
	heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	thierry.reding@gmail.com, devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, nylon7717@gmail.com,
	zong.li@sifive.com, greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED
 algorithm
Message-ID: <20230130101707.pdvabl3na2wpwxqu@pengutronix.de>
References: <20230130093229.27489-1-nylon.chen@sifive.com>
 <20230130093229.27489-3-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230130093229.27489-3-nylon.chen@sifive.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102339_484845_6E20BF3D 
X-CRM114-Status: GOOD (  21.85  )
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
Content-Type: multipart/mixed; boundary="===============8860649214379311495=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8860649214379311495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jlahpnwnp2we3m5x"
Content-Disposition: inline


--jlahpnwnp2we3m5x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 05:32:29PM +0800, Nylon Chen wrote:
> The `frac` variable represents the pulse inactive time, and the result of
> this algorithm is the pulse active time. Therefore, we must reverse the
> result.
>=20
> The reference is SiFive FU740-C000 Manual[0].
>=20
> [0]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b1=
6acba_fu740-c000-manual-v1p6.pdf
>=20
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  drivers/pwm/pwm-sifive.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index 62b6acc6373d..a5eda165d071 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -158,6 +158,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>  	frac =3D DIV64_U64_ROUND_CLOSEST(num, state->period);
>  	/* The hardware cannot generate a 100% duty cycle */
>  	frac =3D min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
> +	frac =3D (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;

The same problem exists in pwm_sifive_get_state(), doesn't it?

As fixing this is an interruptive change anyhow, this is the opportunity
to align the driver to the rules tested by PWM_DEBUG.

The problems I see in the driver (only checked quickly, so I might be
wrong):

 - state->period !=3D ddata->approx_period isn't necessarily a problem. If
   state->period > ddata->real_period that's fine and the driver should
   continue

 - frac =3D DIV64_U64_ROUND_CLOSEST(num, state->period);
   is wrong for two reasons:
   it should round down and use the real period.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jlahpnwnp2we3m5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPXmSAACgkQwfwUeK3K
7AleyggAkGDMZYle0TOKBmbhKP3cCv66Lspwhkit9fvzLF+u5WV9aZ2Hhh18MHLj
MH8UhAepKUC7oy5vd5eCo5fafKOOr71uJvkxg6W6IJncOMbphNH9K55LeAktSDg6
AAk4bHiUx9AW1UEhnyu+9SqTl/SS6UoRzWBB8naxQil/YPJpvP6kUM/MnWDthd5r
1HM4iovyCbXcWYhdG4asGUvA4lQnK92UO47apHnOW7VL9ivVgmfE6N6m5Q4ELy8e
KarTUp8nG5N5Ki/+2LlpZYWY6w3t27CQJ0UegXxcn3Igu44a0hpYbpeHgi4kYIME
Su9cOg8cW7mP2GIhIiVZ+63s+pTWqQ==
=uHqH
-----END PGP SIGNATURE-----

--jlahpnwnp2we3m5x--


--===============8860649214379311495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8860649214379311495==--

