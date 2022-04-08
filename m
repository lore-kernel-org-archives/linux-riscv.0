Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58083C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kjji8KTwVSEYp6uqbYW2ucSMbMDq21H8RyYtMKCQam4=; b=wfxEneURokxrl2kJEfs2OAF/z7
	MvEUkwtkbGyCjHBE24vMaHvb3j38Ge/VNMmc1k/Xa7hQ/79ODHLlrdqxYCO6U7vEcLWyeO3+fTikJ
	ENlxNkKDDGy40BtakWT5QFA5ftfgJejxYD4RWvPHvwAaJZ6N+/GpZBrif752pTFz3PO1QasoIGE0i
	c4i0XRNvRvdIVUMnJegn75F1f9x0l5lqbjkGxB09WPIG3L7dqQf/cqDjQnmGE7yO2gxzoARg+t/MW
	PQAQirTBCqAx5b2gH/TihI8bq6y4akp954q2sgI2Y1UmHXQmB/zJIUqQB4oeYMzJl4LRXKycaWdbW
	CnyUKdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclXO-00GHCd-RQ; Fri, 08 Apr 2022 10:08:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclXL-00GH4p-Ik
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 10:08:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nclWo-0001D7-OD; Fri, 08 Apr 2022 12:07:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nclWo-001mY5-FE; Fri, 08 Apr 2022 12:07:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nclWl-001wSJ-UN; Fri, 08 Apr 2022 12:07:39 +0200
Date: Fri, 8 Apr 2022 12:07:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: sifive: simplify if-if to if-else
Message-ID: <20220408100721.rinvvgard3nr5wff@pengutronix.de>
References: <20220408083007.41538-1-wanjiabing@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20220408083007.41538-1-wanjiabing@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_030815_649834_01890607 
X-CRM114-Status: GOOD (  23.27  )
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
Content-Type: multipart/mixed; boundary="===============4875259752354755926=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4875259752354755926==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hmg2yezfbimyu7f"
Content-Disposition: inline


--5hmg2yezfbimyu7f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2022 at 04:30:07PM +0800, Wan Jiabing wrote:
> use if and else instead of if(A) and if (!A).
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/pwm/pwm-sifive.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index 253c4a17d255..e6d05a329002 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -138,10 +138,9 @@ static int pwm_sifive_enable(struct pwm_chip *chip, =
bool enable)
>  			dev_err(ddata->chip.dev, "Enable clk failed\n");
>  			return ret;
>  		}
> -	}
> -
> -	if (!enable)
> +	} else {
>  		clk_disable(ddata->clk);
> +	}
> =20
>  	return 0;
>  }

The patch looks fine. I wonder if it would be sensible to clean up even
more: pwm_sifive_apply() is only a single caller of
pwm_sifive_enable(). If this is optimized to skip the duty_cycle and
period calculation for the state->enabled =3D false case and just disables
the clock this should still work.

Also I wonder if there is a clk mismatch issue in this driver: .probe
enables the clk and if the PWM is off (i.e. .get_state diagnoses that)
the clock will never be disabled while the driver is bound, will it?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5hmg2yezfbimyu7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJQCVcACgkQwfwUeK3K
7Al38Af7BAOq90kL/kjCqKlWjXccUKG6Dj3BDwGcg5UfGg/JRiJmYayalIAR2LIn
mKa9mxv/NmCLa9jl5uPCJ5WqvJnmYcdz4rL11wXGwlEY93YYn56FOG0U7MBo1ij9
NUdVK8np9+RnN2HYy3YWeiIwGnHFu4xoU9Iv1ahdfPGw+UAPiH2VSYCUkQguXjZ5
0Lf49mFIHiOBjyiWCHO2pV1k7JWAXLlbPbSthFLufhdQORrYkfqb6K+o8/LfgPtL
VswPzS7Hd/LNUzP3pHKF1tig1XNRMaTq1E+vkG4x680WLeVgCzWxeIjqeB+wZFar
8g21tTWYs3nI8bfyBzbE27vAwKI58w==
=xpSm
-----END PGP SIGNATURE-----

--5hmg2yezfbimyu7f--


--===============4875259752354755926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4875259752354755926==--

