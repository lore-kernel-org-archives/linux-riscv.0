Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF45C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ1MWbhkmuJvmNMyl0kU9Kx5vPkb70BHaXNWZtqLhHI=; b=SmBFDxJKzvYg0H3G0WHGEfeprp
	6L/Wyq76dLFYlLk66WIe3/4iB1IPewoqLIZB0LSQWbyuBlVO+DKnMBu7H9/9p41TmrFsaSyaHRaRT
	j4XKaqnlOB4xKacXVC/MbDqcLHDfqD6gNArx8kmf/zUwLLWSBa4SCu/648wpM9wl/KKStcgYy1Diz
	WHpfgzNmqqDGmIyygRsV04QW3UUcLK0SieAXNNFp/SkTRkMP5DMR0jgvWYynue5aWJJIcbJNI3FGy
	NgtPFYvDXuuKdYDG+abPJawK5owIr1wpBsrNBxO1B+c9wSAO+GvVOLXVFashhNMOjP2dQP0tiePdi
	kmmonudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHX3-00000009cyN-2m8c;
	Mon, 18 Mar 2024 18:16:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHX0-00000009cx2-0v2d
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 18:16:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmHWy-0007zD-DD; Mon, 18 Mar 2024 19:16:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmHWw-0077xD-MN; Mon, 18 Mar 2024 19:16:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmHWw-00872I-1u;
	Mon, 18 Mar 2024 19:16:14 +0100
Date: Mon, 18 Mar 2024 19:16:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, thierry.reding@gmail.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH v9 2/3] pwm: sifive: change the PWM algorithm
Message-ID: <f5ukvah2ujko2iht3pd5jxq5kaukbs5z3pn5s7qwcnx4aqr3yv@mwtbwkcfa44a>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-3-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240222081231.213406-3-nylon.chen@sifive.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_111618_391677_4AC94B33 
X-CRM114-Status: GOOD (  21.88  )
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
Content-Type: multipart/mixed; boundary="===============2969009941224660355=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2969009941224660355==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sht7baa5xh6fhhdu"
Content-Disposition: inline


--sht7baa5xh6fhhdu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 04:12:30PM +0800, Nylon Chen wrote:
> The `frac` variable represents the pulse inactive time, and the result
> of this algorithm is the pulse active time.
> Therefore, we must reverse the result.
>=20
> The reference is SiFive FU740-C000 Manual[0]
>=20
> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b=
16acba_fu740-c000-manual-v1p6.pdf [0]
>=20
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  drivers/pwm/pwm-sifive.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index eabddb7c7820..a586cfe4191b 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -110,9 +110,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>  				struct pwm_state *state)
>  {
>  	struct pwm_sifive_ddata *ddata =3D pwm_sifive_chip_to_ddata(chip);
> -	u32 duty, val;
> +	u32 duty, val, inactive;
> =20
> -	duty =3D readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
> +	inactive =3D readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
> +	duty =3D (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
> =20
>  	state->enabled =3D duty > 0;
> =20
> @@ -123,7 +124,7 @@ static int pwm_sifive_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>  	state->period =3D ddata->real_period;
>  	state->duty_cycle =3D
>  		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
> -	state->polarity =3D PWM_POLARITY_INVERSED;
> +	state->polarity =3D PWM_POLARITY_NORMAL;
> =20
>  	return 0;
>  }
> @@ -139,7 +140,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>  	int ret =3D 0;
>  	u32 frac;
> =20
> -	if (state->polarity !=3D PWM_POLARITY_INVERSED)
> +	if (state->polarity !=3D PWM_POLARITY_NORMAL)
>  		return -EINVAL;
> =20
>  	cur_state =3D pwm->state;
> @@ -159,6 +160,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>  	frac =3D DIV64_U64_ROUND_CLOSEST(num, state->period);
>  	/* The hardware cannot generate a 100% duty cycle */

Is this still true now that we know that PWM_SIFIVE_PWMCMP is the
inactive time in a period? If you fix that, the same claim in the header
of the driver needs adaption, too.

>  	frac =3D min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
> +	frac =3D (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;

I like the additional variable in pwm_sifive_get_state(). Can you please
add one here, too?

>  	mutex_lock(&ddata->lock);
>  	if (state->period !=3D ddata->approx_period) {

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sht7baa5xh6fhhdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmX4hO0ACgkQj4D7WH0S
/k5I7Af/anilkuBk6OcjkFY2IstjOdldOJ1UOGE/SIMZvUFUkjlFsQ1Lx9KpG5dY
kIGEQ6h7q9iYUnvK5QwPHm1lj7KReDWg//hJZw0KkbrO7v22cGdcHmA/RS4wGs9u
o0nbvSLnJszi/akI8CbQqiuebkMRzcIaSP3+3mjnxMWeT+74L9jMs17quPen1Jo7
36aLy03/Gd5p+NkUlC9r+6z6s5qWdTzC2c2RpwtRdsujiUJ35TJ70gS/+nCH+dyd
//eyVjdPJRDVx0EYF+mcBjWyGe+Q+3+oh1Mj+LvYtyJY8PFieAceNA8E8hU39pAC
dWsfG3vp+3zxsicL0snmhFPcMqw3+Q==
=LMZN
-----END PGP SIGNATURE-----

--sht7baa5xh6fhhdu--


--===============2969009941224660355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2969009941224660355==--

