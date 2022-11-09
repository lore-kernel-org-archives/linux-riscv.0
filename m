Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802ECC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojKfCv1E/S9dC6rouQEFE4xHU5GXmkTtg8LEzH6qvUE=; b=lsGyMgmKQBlDEsXgfZkVz/lG+3
	wJhA9NtNG1fNIpwrBzctvi8t+EXXrW6rCrfkD+Qca3hm6jQkQqLJcq493BwaqxptJ3taT3H7+ILvz
	ZkVMnS37MkhOb+gNb9Q38/9/+toli2DmCKeJYBkwkewFT+Zu6l8P9TnKJ9Wn6PwjdcEbCtef+OPF5
	0iX/NtnLjPBOgyll0p20b6agtCT1yIkY8OEfNRoR8vaj03R2R1pgd906pTwCH9gSEXOKTZLR7Y/JR
	7wCRs5UTIhupTPuBD6+lXBXM/PcZCdULoupaVrGjtPlSX7TQETCE9V9Gg17mDLOLbl0LoYrNPPwnl
	/8nMAx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjld-00DIOW-5h; Wed, 09 Nov 2022 12:01:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjlT-00DIEG-PV
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 12:01:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1osjlQ-0002aS-2z; Wed, 09 Nov 2022 13:01:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1osjlO-003F1T-48; Wed, 09 Nov 2022 13:01:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1osjlO-00FPUZ-53; Wed, 09 Nov 2022 13:01:02 +0100
Date: Wed, 9 Nov 2022 13:01:02 +0100
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
Message-ID: <20221109120102.ylnseq2w33rvt7fz@pengutronix.de>
References: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_040107_849579_18CDB1F7 
X-CRM114-Status: GOOD (  31.44  )
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
Content-Type: multipart/mixed; boundary="===============8463009872011119769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8463009872011119769==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4dabd3upl2gtggj"
Content-Disposition: inline


--t4dabd3upl2gtggj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Emil,

On Wed, Nov 09, 2022 at 12:37:24PM +0100, Emil Renner Berthing wrote:
> Commit 2cfe9bbec56ea579135cdd92409fff371841904f added support for the
> RGB and green PWM controlled LEDs on the HiFive Unmatched board
> managed by the leds-pwm-multicolor and leds-pwm drivers respectively.
> All three colours of the RGB LED and the green LED run from different
> lines of the same PWM, but with the same period so this works fine when
> the LED drivers are loaded one after the other.
>=20
> Unfortunately it does expose a race in the PWM driver when both LED
> drivers are loaded at roughly the same time. Here is an example:
>=20
>   |          Thread A           |          Thread B           |
>   |  led_pwm_mc_probe           |  led_pwm_probe              |
>   |    devm_fwnode_pwm_get      |                             |
>   |      pwm_sifive_request     |                             |
>   |        ddata->user_count++  |                             |
>   |                             |    devm_fwnode_pwm_get      |
>   |                             |      pwm_sifive_request     |
>   |                             |        ddata->user_count++  |
>   |         ...                 |          ...                |
>   |    pwm_state_apply          |    pwm_state_apply          |
>   |      pwm_sifive_apply       |      pwm_sifive_apply       |
>=20
> Now both calls to pwm_sifive_apply will see that ddata->approx_period,
> initially 0, is different from the requested period and the clock needs
> to be updated. But since ddata->user_count >=3D 2 both calls will fail
> with -EBUSY, which will then cause both LED drivers to fail to probe.
>=20
> Fix it by letting the first call to pwm_sifive_apply update the clock
> even when ddata->user_count !=3D 1.
>=20
> Fixes: 9e37a53eb051 ("pwm: sifive: Add a driver for SiFive SoC PWM")
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/pwm/pwm-sifive.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index 2d4fa5e5fdd4..b3c60ec72a6e 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -159,7 +159,13 @@ static int pwm_sifive_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
> =20
>  	mutex_lock(&ddata->lock);
>  	if (state->period !=3D ddata->approx_period) {
> -		if (ddata->user_count !=3D 1) {
> +		/*
> +		 * Don't let a 2nd user change the period underneath the 1st user.
> +		 * However if ddate->approx_period =3D=3D 0 this is the first time we =
set
> +		 * any period, so let whoever gets here first set the period so other
> +		 * users who agree on the period won't fail.
> +		 */
> +		if (ddata->user_count !=3D 1 && ddata->approx_period) {

While I'm convinced this works, we'd get some more uniform behaviour
compared to other hardwares with similar restrictions if you lock the
period on enabling the PWM instead of at request time. See for example
drivers/pwm/pwm-pca9685.c.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t4dabd3upl2gtggj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNrlnsACgkQwfwUeK3K
7AlrkQf9G9GElGNux4M68pXQEPSZJDjAV8oO0gxmQfv43z3is9nY68QEjQOD2paF
W31xuYFlImgRADsdTkBUOzijEhjiT35uOA6+9kKJYKfCth5e+7fq0hP57tWwzPCH
P21bpasJQr4VPiyUH6HLkQ4Pkh1twZuopyKSvhvWYne8GwxXbab2tq+mRGSQRP1r
I1bJbN/sLipjdWm0JEFicEPQbgxlRQzkH/4NK4h/nPlnByGmRFzHYYPQJtbabi4O
8cODRp/W85fl99I0SIXr/cRA0CILPSebb+M/KaMZHhjURQUIFB+UswJ77bT+jQl3
6uVWQ4qAMZlNDH0u+kTZSKOJC2cNBQ==
=hPjF
-----END PGP SIGNATURE-----

--t4dabd3upl2gtggj--


--===============8463009872011119769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8463009872011119769==--

