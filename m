Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE02C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJczay9lTi1QZu5hnoNpP+bMjNQPTodTVEzXSFPN78s=; b=Jpz0wM2Ij+PQYN0PpFPhxXvLk7
	Vvd59ZzFLzCcLYy3/wr2OaXfJ8D9xwgn0wNrD/4Sgkx9S1wgIFQ1Zdx1Vc23dudtbJRPW2k7lrvuh
	gvMTJjbzz5OpbyTODcQhI6md8IKBQiLqBtwccoFR8Lnsuxp6WOLlFv7jHGQQTuEkfo6mD4mFVheO1
	FHfyZCQlHZuXlgf2fhMqmwacrFE5CyjJT2cork1xsLs97SUfwffDhOnd1f5iJN42pJNSthYUbN6e8
	nk7uQjGf8cnYVQ8s86IC9w7EtnPzUl8+BodiDMyHGmMm3nxBL8WNGIHzLu+1WjeZq03IFLM7ztEL/
	fuGUtLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osn4t-00Edcw-Go; Wed, 09 Nov 2022 15:33:23 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osn4q-00Edc7-KT
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 15:33:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1osn4k-0006HM-QC; Wed, 09 Nov 2022 16:33:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1osn4h-003HLm-Vh; Wed, 09 Nov 2022 16:33:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1osn4h-00FRbV-OJ; Wed, 09 Nov 2022 16:33:11 +0100
Date: Wed, 9 Nov 2022 16:33:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: sifive: Always let the first pwm_apply_state
 succeed
Message-ID: <20221109153311.cszr7fgfmyelwra3@pengutronix.de>
References: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
 <20221109120102.ylnseq2w33rvt7fz@pengutronix.de>
 <CAJM55Z-EVXB6FTWwh_vY_B3LoVv+b7TCQCE7asB8G8wkEwui_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z-EVXB6FTWwh_vY_B3LoVv+b7TCQCE7asB8G8wkEwui_g@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_073320_863708_6610DED6 
X-CRM114-Status: GOOD (  53.51  )
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
Content-Type: multipart/mixed; boundary="===============8583688151296602216=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8583688151296602216==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wiechjgncqw7xr3v"
Content-Disposition: inline


--wiechjgncqw7xr3v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 01:45:43PM +0100, Emil Renner Berthing wrote:
> On Wed, 9 Nov 2022 at 13:01, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello Emil,
> >
> > On Wed, Nov 09, 2022 at 12:37:24PM +0100, Emil Renner Berthing wrote:
> > > Commit 2cfe9bbec56ea579135cdd92409fff371841904f added support for the
> > > RGB and green PWM controlled LEDs on the HiFive Unmatched board
> > > managed by the leds-pwm-multicolor and leds-pwm drivers respectively.
> > > All three colours of the RGB LED and the green LED run from different
> > > lines of the same PWM, but with the same period so this works fine wh=
en
> > > the LED drivers are loaded one after the other.
> > >
> > > Unfortunately it does expose a race in the PWM driver when both LED
> > > drivers are loaded at roughly the same time. Here is an example:
> > >
> > >   |          Thread A           |          Thread B           |
> > >   |  led_pwm_mc_probe           |  led_pwm_probe              |
> > >   |    devm_fwnode_pwm_get      |                             |
> > >   |      pwm_sifive_request     |                             |
> > >   |        ddata->user_count++  |                             |
> > >   |                             |    devm_fwnode_pwm_get      |
> > >   |                             |      pwm_sifive_request     |
> > >   |                             |        ddata->user_count++  |
> > >   |         ...                 |          ...                |
> > >   |    pwm_state_apply          |    pwm_state_apply          |
> > >   |      pwm_sifive_apply       |      pwm_sifive_apply       |
> > >
> > > Now both calls to pwm_sifive_apply will see that ddata->approx_period,
> > > initially 0, is different from the requested period and the clock nee=
ds
> > > to be updated. But since ddata->user_count >=3D 2 both calls will fail
> > > with -EBUSY, which will then cause both LED drivers to fail to probe.
> > >
> > > Fix it by letting the first call to pwm_sifive_apply update the clock
> > > even when ddata->user_count !=3D 1.
> > >
> > > Fixes: 9e37a53eb051 ("pwm: sifive: Add a driver for SiFive SoC PWM")
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.c=
om>
> > > ---
> > >  drivers/pwm/pwm-sifive.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> > > index 2d4fa5e5fdd4..b3c60ec72a6e 100644
> > > --- a/drivers/pwm/pwm-sifive.c
> > > +++ b/drivers/pwm/pwm-sifive.c
> > > @@ -159,7 +159,13 @@ static int pwm_sifive_apply(struct pwm_chip *chi=
p, struct pwm_device *pwm,
> > >
> > >       mutex_lock(&ddata->lock);
> > >       if (state->period !=3D ddata->approx_period) {
> > > -             if (ddata->user_count !=3D 1) {
> > > +             /*
> > > +              * Don't let a 2nd user change the period underneath th=
e 1st user.
> > > +              * However if ddate->approx_period =3D=3D 0 this is the=
 first time we set
> > > +              * any period, so let whoever gets here first set the p=
eriod so other
> > > +              * users who agree on the period won't fail.
> > > +              */
> > > +             if (ddata->user_count !=3D 1 && ddata->approx_period) {
> >
> > While I'm convinced this works, we'd get some more uniform behaviour
> > compared to other hardwares with similar restrictions if you lock the
> > period on enabling the PWM instead of at request time. See for example
> > drivers/pwm/pwm-pca9685.c.
>=20
> Hmm.. that driver uses a pwms_enabled bitmap rather than a user count,
> but it still sets the bit in the request method and refuses to change
> period in the apply method if more than 1 bit is set.

Note there are two different bitmaps. The one modified in .request is
for gpio stuff and the other in .apply() for locking the common period
length.

> So as far as I
> can tell it still suffers from the same race. However using a bitmap
> instead of a user count would let us handle everything in the apply
> method if we don't set the bit in the request method, but then the
> behaviour would still be different. In any case it would still be a
> large change to this driver.
>=20
> How about we merge this bug fix that can easily be backported first
> and then look at how it should be handled properly?

I thought it wouldn't be that hard to do it right from the start,
but I admit it's harder than I expected to get right. My prototype looks
as follows:

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 2d4fa5e5fdd4..89846d95bfc0 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -41,13 +41,13 @@
=20
 struct pwm_sifive_ddata {
 	struct pwm_chip	chip;
-	struct mutex lock; /* lock to protect user_count and approx_period */
+	struct mutex lock; /* lock to protect approx_period */
 	struct notifier_block notifier;
 	struct clk *clk;
 	void __iomem *regs;
 	unsigned int real_period;
 	unsigned int approx_period;
-	int user_count;
+	DECLARE_BITMAP(pwms_enabled, 4);
 };
=20
 static inline
@@ -59,10 +59,16 @@ struct pwm_sifive_ddata *pwm_sifive_chip_to_ddata(struc=
t pwm_chip *c)
 static int pwm_sifive_request(struct pwm_chip *chip, struct pwm_device *pw=
m)
 {
 	struct pwm_sifive_ddata *ddata =3D pwm_sifive_chip_to_ddata(chip);
+	u32 val =3D readl(ddata->regs + PWM_SIFIVE_PWMCFG);
=20
-	mutex_lock(&ddata->lock);
-	ddata->user_count++;
-	mutex_unlock(&ddata->lock);
+	if (val & PWM_SIFIVE_PWMCFG_EN_ALWAYS) {
+		val =3D readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+		if (val > 0) {
+			mutex_lock(&ddata->lock);
+			__set_bit(pwm->hwpwm, ddata->pwms_enabled);
+			mutex_unlock(&ddata->lock);
+		}
+	}
=20
 	return 0;
 }
@@ -72,7 +78,7 @@ static void pwm_sifive_free(struct pwm_chip *chip, struct=
 pwm_device *pwm)
 	struct pwm_sifive_ddata *ddata =3D pwm_sifive_chip_to_ddata(chip);
=20
 	mutex_lock(&ddata->lock);
-	ddata->user_count--;
+	__clear_bit(pwm->hwpwm, ddata->pwms_enabled);
 	mutex_unlock(&ddata->lock);
 }
=20
@@ -158,11 +164,18 @@ static int pwm_sifive_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
 	frac =3D min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
=20
 	mutex_lock(&ddata->lock);
+
+	if (state->enabled) {
+		__set_bit(pwm->hwpwm, ddata->pwms_enabled);
+
 	if (state->period !=3D ddata->approx_period) {
-		if (ddata->user_count !=3D 1) {
+		if (bitmap_weight(ddata->pwms_enabled, 4) > 1) {
+			if (!enabled) {
+				__clear_bit(pwm->hwpwm, ddata->pwms_enabled);
 			mutex_unlock(&ddata->lock);
 			return -EBUSY;
 		}
+
 		ddata->approx_period =3D state->period;
 		pwm_sifive_update_clock(ddata, clk_get_rate(ddata->clk));
 	}
@@ -177,14 +190,23 @@ static int pwm_sifive_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
 		ret =3D clk_enable(ddata->clk);
 		if (ret) {
 			dev_err(ddata->chip.dev, "Enable clk failed\n");
+			if (state->enabled) {
+				mutex_lock(&ddata->lock);
+				__clear_bit(pwm->hwpwm, ddata->pwms_enabled);
+				mutex_unlock(&ddata->lock);
+			}
 			return ret;
 		}
 	}
=20
 	writel(frac, ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
=20
-	if (!state->enabled)
+	if (!state->enabled) {
+		mutex_lock(&ddata->lock);
+		__clear_bit(pwm->hwpwm, ddata->pwms_enabled);
+		mutex_unlock(&ddata->lock);
 		clk_disable(ddata->clk);
+	}
=20
 	return 0;
 }

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wiechjgncqw7xr3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNryDQACgkQwfwUeK3K
7AkMVAf+KzRDTK6DBmkno8MPgGyQLYPP4iboShZ7T4i3IA15toLWxs+PyU/E18vx
gct9YRRoyS6PfZ4vR39SLcRh0l12rnXMAS9iKKORYnnpvK6cai3ayZkTZNNmQiRS
7TMPBhrcm9jJ60RJjqHToVfV+b393+ZmeVslIR7VdQCOCBk2QWwFxPZl07a/+7D4
XK3L+BCx8LDViPIOE73S3LeXkC727yPKYPmtJAigX5+SXAMxPrj8KesAD/k3n8QE
Anj3+XEgKnlJM2YK32mvbdszvm/MfFV+JGEifisotFV//d/+N92srRs0oY2dG29S
k8buk+fIM9Y8ekV/fapyjcRkDXg1Nw==
=9mwE
-----END PGP SIGNATURE-----

--wiechjgncqw7xr3v--


--===============8583688151296602216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8583688151296602216==--

