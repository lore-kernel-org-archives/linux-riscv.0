Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE18E7B5E1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqIjfq+6vjVZnhrPGjIHCy8/4ZtNNIdYNvDr6y5O33o=; b=Ldawefsb1QWWEJmKdeIHcCSdFM
	+JtEI2hqQ5uyNPCqaoY9Z3cXHZfUivSfWtpUlH6BgS/OgW/eOTFCTuadHFCr6LaxXQLksOF/SGQOG
	bBzTC0lOPacFMCh/8TcpAlJn9V3iOJKopUsd9ZbC1lxw4Vv6zeh8REkvLE4OT2XfQ/smkMzGnHcbm
	DZ1a97jIZhrmSfBvCwJUrTh7Fuvj/ZSse/qTuI7wpf7Dc8Q+/K9bZLdZMkSnpLNJmQjEYylrQUJ9h
	vlo3uAKAPvf6m2Tg2UsytEOQ2cBZOIz9kqmSWV+2C2N4+/uOzuSj4EZIhRofM5F107ZM0oo+L6wx4
	sUzGDfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyfT-00H9yk-2D;
	Wed, 04 Oct 2023 09:59:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyfP-00H9wT-11
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 09:59:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnyf5-0002vN-0q; Wed, 04 Oct 2023 11:59:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnyf3-00Azxr-7z; Wed, 04 Oct 2023 11:59:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnyf2-008uPw-UB; Wed, 04 Oct 2023 11:59:20 +0200
Date: Wed, 4 Oct 2023 11:59:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pwm@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic
 context
Message-ID: <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
MIME-Version: 1.0
In-Reply-To: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_025943_377172_6BEEE029 
X-CRM114-Status: GOOD (  22.37  )
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
Content-Type: multipart/mixed; boundary="===============4521956592910431537=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4521956592910431537==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hz3c3li5tw4muaqt"
Content-Disposition: inline


--hz3c3li5tw4muaqt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sean,

On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index dc66e3405bf5..d9679ae5b2be 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -505,7 +505,7 @@ int pwm_apply_state(struct pwm_device *pwm, const str=
uct pwm_state *state)
>  	 * is a bad idea. So make it explicit that calling this function might
>  	 * sleep.
>  	 */
> -	might_sleep();
> +	might_sleep_if(pwm_can_sleep(pwm));
> =20
>  	if (!pwm || !state || !state->period ||
>  	    state->duty_cycle > state->period)

I'd like to have a mechanism to catch drivers that missed to set
=2Ecan_sleep. The best idea I currently have for that is to disable
preemption if IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_can_sleep(pwm) while
=2Eapply() is running.

> diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> index b7c6045c5d08..b8b9392844e9 100644
> --- a/drivers/pwm/pwm-fsl-ftm.c
> +++ b/drivers/pwm/pwm-fsl-ftm.c
> @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *pdev)
> =20
>  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
>  	fpc->chip.dev =3D &pdev->dev;
> +	fpc->chip.can_sleep =3D true;

As .apply() being callable in non-sleepable context only depends on
=2Eapply() I think a better place for this property is in struct pwm_ops.

Also I wonder if the distinction between atomic and sleeping
pwm_state_apply() should be more explicit. For GPIOs you have a sleeping
variant gpiod_set_value_cansleep() that allows to immediately determine
the intended context in the caller. This would allow that programming
a PWM stays a preemption point (if possible/desired) even if the
underlying hardware/driver is atomic. To not have to touch all consumer
drivers, maybe the pair for pwm should better be

	pwm_apply_state()
	pwm_apply_state_atomic()

instead of a "cansleep" suffix for the sleeping variant? Or maybe it's
better to accept touching all consumer drivers to get semantics similar
to gpio? I couldn't decide quickly what I really like better here, so
that's your chance to comment and influence the outcome :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hz3c3li5tw4muaqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUdN3gACgkQj4D7WH0S
/k7Vgwf+OSTM/5a3jTbEn+zj18WbWk6jQQdj6kqyM47GR36RweXbkLMfbl++5ogJ
z6xjVfn/ov9rQsnn2Em53Zkv7yV/AQb+Hu1tLnuVAsdyxVC/CrCRjWAcrkpoZf6o
Ru7Nf7hs/mJ57jeLgBfPp+k2kwntn470QPIpzLiruZge1YeEwuYKzeHuO7WI4KCb
777XYS5j+tntQRSrlm2dzE8H+5lEqc7mEzG22MAd+yIt4dAsuSAdno2hKLMJx960
4k6Y+UmLJB3cC+BPcAjEllupp1c4turpZ+3P/7D0Fo8P5BgH937nm/wktXJJlPBs
aJ8B/mMpia+WhQcYdq+TjejxlzAf3Q==
=THVI
-----END PGP SIGNATURE-----

--hz3c3li5tw4muaqt--


--===============4521956592910431537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4521956592910431537==--

