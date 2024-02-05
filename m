Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A170BC4828D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZtlkbakX71zjDwrj9rAlflY4oeFaBE5QlTZ9sqTuWI=; b=DhtHci/sYAb1v3Hnfk8MO9gatG
	Fhu0liuK3ce+qbxnS3JVmQj0yKmFT4AHudpptzUxIsJo6eQ6AA2GKkcsKsNNZMbvBSfI1ReO19Idw
	170qgj+qOohLFpsn17PIGFMXb/pj2WPCnGrDWnavvsxpOxRB8L/6l3lKn6stdmWHdvcnCleYN/t8p
	J2HZ5gC2IMHA0Gd9RiozqdPFTGzaBUfE3FQN3SSKOZ9LvT9RMRlxLxjqeHgOMuueYOfc76RJykVXh
	u/9e/WjdGT9mxBc352cCBNIxTuaVsMuJQmMKtDpssbs/8nJ97Tdza/+6lK2117KWexOwlJpyE5wOA
	BQwXZ0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3NH-00000004JSs-2xwe;
	Mon, 05 Feb 2024 18:07:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3NE-00000004JRp-3uBM
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 18:07:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rX3ND-0002rX-MG; Mon, 05 Feb 2024 19:07:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rX3NC-004fwa-68; Mon, 05 Feb 2024 19:07:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rX3NC-00Fkrt-0H;
	Mon, 05 Feb 2024 19:07:14 +0100
Date: Mon, 5 Feb 2024 19:07:13 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, thierry.reding@gmail.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH v8 2/3] pwm: sifive: change the PWM controlled LED
 algorithm
Message-ID: <4kqkazromkzyhic2mgyyjrh4jlnp6djfuotu37btdfolqp5e2o@6jkbjnahvrbo>
References: <20240126074045.20159-1-nylon.chen@sifive.com>
 <20240126074045.20159-3-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240126074045.20159-3-nylon.chen@sifive.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_100717_000156_E89EB78C 
X-CRM114-Status: GOOD (  22.45  )
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
Content-Type: multipart/mixed; boundary="===============6514021318526948819=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6514021318526948819==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ngq5sitimfjzgek5"
Content-Disposition: inline


--ngq5sitimfjzgek5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Regarding the Subject: The patch has nothing to do with an LED, has it?

On Fri, Jan 26, 2024 at 03:40:44PM +0800, Nylon Chen wrote:
> The `frac` variable represents the pulse inactive time, and the result
> of this algorithm is the pulse active time. Therefore, we must reverse th=
e result.

Please break lines at 75 columns in the commit log.

> The reference is SiFive FU740-C000 Manual[0]
>=20
> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b=
16acba_fu740-c000-manual-v1p6.pdf [0]

I looked at Figure 29 in this document (version v1p6, pdf page 148). Not
sure I understand that correctly, but I expect that the output of the
">=3D?" node below pwmcmp0 to become 1 if pwms has reached pwmcmp0, is
that right? In that case this output is zero when pwmcount is zero and
then pwmcmp0ip is zero, too. So a period starts with the inactive part
and so it's inversed polarity.

What made you think that the current driver implementation is wrong?

> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  drivers/pwm/pwm-sifive.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index eabddb7c7820..b07c8598bb21 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -113,6 +113,7 @@ static int pwm_sifive_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>  	u32 duty, val;
> =20
>  	duty =3D readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
> +	duty =3D (1U << PWM_SIFIVE_CMPWIDTH) - 1 - duty;

I find it irritating that both values are assigned to duty. I'd spend
another variable and make this:

	inactive =3D readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
	duty =3D (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;


> =20
>  	state->enabled =3D duty > 0;
> =20
> @@ -123,11 +124,10 @@ static int pwm_sifive_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>  	state->period =3D ddata->real_period;
>  	state->duty_cycle =3D
>  		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
> -	state->polarity =3D PWM_POLARITY_INVERSED;
> +	state->polarity =3D PWM_POLARITY_NORMAL;
> =20
>  	return 0;
>  }
> -

Please keep this empty line between functions.

>  static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
>  			    const struct pwm_state *state)
>  {

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ngq5sitimfjzgek5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXBI9AACgkQj4D7WH0S
/k5uxQgAnQ/SvX4+QQISrWgnYygCgVlr4ryD5EN3wAHNeDGn3EvG8hNVvZTlQtZV
CA5wYClIyGjAq6Qeg/tlfwjhthtMinqwQZpZ0K67c/Fr51cp0ic7PNKWkQF3UMWf
EaShSF6NIyFsCX25OZNa9lUpMgp9hx+klZ0gFSL5aZ9n/MGmgM4In68YfKEQsS01
X/LgQj0AwDo5utQmLL+zp8sKneEs5WM7/Wcs7910eC/+bpo4fBBs5D1R7ap8LHts
J6qse4XMtdHJyHQxXuDq2/tH4+ttAz7lodvJuYSjGoU/OAhCOUNx0rF+TgUFs5zj
FqHeGOJyQ2QKYeqv3kqqjdd3VpHLjw==
=4mPe
-----END PGP SIGNATURE-----

--ngq5sitimfjzgek5--


--===============6514021318526948819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6514021318526948819==--

