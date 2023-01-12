Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBFBC54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 12:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Nu6uKz8GBsKJCr8TIrcVVo61ozSdN40O67Cv80emXM=; b=cBxSY0maEjNpmrThIZkbdwMAB5
	Pt2xm3c6ZQ6zb81NNdtnVGIwcEtPcv/MWrkAhEyPuZQ2K+5tJ/yz3pi1+7KIzg9Y2MO8exS7NOSZk
	YALNUug+jp5Fn3mSv+06d7SX8Fhpc5l7rfuONe/TP8/rz4m+YEKGEjjqbA/D/jZCbpk03xDnpMjB6
	COED9xzxyxaUjqlhIGo1xUXS1K6qic1cp16vPAf7VGWx+XdgD+b11Z7KB3h/VhLIPo5QEYOHZKj7i
	w1ZFva91PPVhAV4m7jESKJnThf4gsn1ZouWEUR2tBrll1ja4OLVqCAaLri9jjWGHWkH4jgRzzjzXL
	tcZ1sTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwHX-00EwSE-0n; Thu, 12 Jan 2023 12:02:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwHT-00EwQq-Vt
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 12:02:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFwH9-0005Oy-92; Thu, 12 Jan 2023 13:01:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFwH8-005WoO-9s; Thu, 12 Jan 2023 13:01:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFwH7-00CFus-H2; Thu, 12 Jan 2023 13:01:41 +0100
Date: Thu, 12 Jan 2023 13:01:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230112120141.fpjwhtjuaxrwqt5m@pengutronix.de>
References: <20221221112912.147210-1-conor@kernel.org>
 <20221221112912.147210-2-conor@kernel.org>
 <20230110224805.3pqxd3yv4wyci2zj@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230110224805.3pqxd3yv4wyci2zj@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_040204_046889_3B9C35E2 
X-CRM114-Status: GOOD (  23.40  )
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
Content-Type: multipart/mixed; boundary="===============8756930546991475609=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8756930546991475609==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4lhg7s5jl5wrhlm7"
Content-Disposition: inline


--4lhg7s5jl5wrhlm7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 10, 2023 at 11:48:05PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Conor,
>=20
> On Wed, Dec 21, 2022 at 11:29:12AM +0000, Conor Dooley wrote:
> > +static void mchp_core_pwm_calc_period(const struct pwm_state *state, u=
nsigned long clk_rate,
> > +				      u16 *prescale, u8 *period_steps)
> > +{
> > +	u64 tmp;
> > +
> > +	/*
> > +	 * Calculate the period cycles and prescale values.
> > +	 * The registers are each 8 bits wide & multiplied to compute the per=
iod
> > +	 * using the formula:
> > +	 * (clock_period) * (prescale + 1) * (period_steps + 1)
> > +	 * so the maximum period that can be generated is 0x10000 times the
> > +	 * period of the input clock.
> > +	 * However, due to the design of the "hardware", it is not possible to
> > +	 * attain a 100% duty cycle if the full range of period_steps is used.
> > +	 * Therefore period_steps is restricted to 0xFE and the maximum multi=
ple
> > +	 * of the clock period attainable is 0xFF00.
> > +	 */
> > +	tmp =3D mul_u64_u64_div_u64(state->period, clk_rate, NSEC_PER_SEC);
> > +
> > +	/*
> > +	 * The hardware adds one to the register value, so decrement by one to
> > +	 * account for the offset
> > +	 */
> > +	if (tmp >=3D MCHPCOREPWM_PERIOD_MAX) {
> > +		*prescale =3D MCHPCOREPWM_PRESCALE_MAX - 1;
> > +		*period_steps =3D MCHPCOREPWM_PERIOD_STEPS_MAX - 1;
> > +
> > +		return;
> > +	}
> > +
> > +	*prescale =3D div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX);
> > +	/* PREG_TO_VAL() can produce a value larger than UINT8_MAX */
> > +	*period_steps =3D div_u64(tmp, PREG_TO_VAL(*prescale)) - 1;
>=20
> This looks wrong, but I didn't think long about that. Did we discuss
> this already and/or are you sure this is correct?
>=20
> (We have:
> 	          (prescale + 1) * (period_steps + 1)
> 	period =3D ------------------------------------
> 	                       clk_rate
>=20

We want prescale small such that period_steps can be big to give
fine-grained control over the available duty_cycles. period_steps is a
8-bit value < 0xff, so we get:

                    period * clk_rate  =20
	prescale =3D ------------------- - 1
                   NSEC_PER_SEC * 0xff

which in code then reads:

	*prescale =3D div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX)
	if (*prescale)
		*prescale -=3D 1;


> You calculate
> 	            period * clk_rate
> 	prescale =3D -------------------
> 	           NSEC_PER_SEC * 0xff
>=20
> 	                     period * clk_rate
> 	period_steps =3D ----------------------------- - 1
> 	               NSEC_PER_SEC * (prescale + 1)

The formula for period_steps is right.

Please double-check!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4lhg7s5jl5wrhlm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO/9qIACgkQwfwUeK3K
7AmFOAf+LcIW/Q/o41Jo0SYTIKqNiVc8MCJ8FSZ5v0SSqxa4ucwpuLJub1/1dJQq
cGWtSHYNYfGguHiOa0vThFj4khBmXNqrnd87loLrKUJudDghyDOkeg78tdFBmUkR
Ha7gBC8VgtVevpY5ovGfx3vvNmqR4pw1rfin31XX6ZZ1CgQ7Wgi94rOev/DDzmbF
TD35FRy8IR95bbtXN7Rjr7UoulZakG1I32fDIV8UBCnWbNdjW35iJ43nX/ZCroNw
DgaRMyARSEbk8nZUWS2/3xl4CuPpbJFFW8MaKUoJRzgUKU8gu4ssVNPxtqmfDMhC
jQTFIN9SQbXfO02y36hg64cBQ5DcOA==
=xjC9
-----END PGP SIGNATURE-----

--4lhg7s5jl5wrhlm7--


--===============8756930546991475609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8756930546991475609==--

