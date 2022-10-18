Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2865FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le4BMgO+w+fmyMmDjUbdwP49eyQ/HYA/xDf/M9eOj40=; b=4x3krPFMbGYLcsP+RBuwKT0TGN
	iH/kv/VxFEGkq4GP8BcNTCm8Xc80vW8YX9CSL5bTxa5NWXr9RDq5lX9PsJ7UP3sMypGwwUwMIpr8q
	4kQ3h48EBi7+hzGNZtcLDX4YkucmgZmNaxBWmZHqo4LQPZDp3HbMQExv6BlKwOXvN+NUTrbjuxqVX
	PRkLjO8fdpRNJeAUB7iN/Xbp9dpNMSWEypVmOPLuqjOBaXUOayfUKOvjuEk+we00X3pjh62xFsDgw
	kBUpq23weoNxXX8WGjYv/sdG8wBqkmIvtIULqU8uUgUnrABodY371/jlV/LFoXUGI/WBQnaE4kUoS
	9DZbiI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmey-0074X1-3e; Tue, 18 Oct 2022 13:29:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmeu-0074V4-TB
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 13:29:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1okmeq-0000U6-8n; Tue, 18 Oct 2022 15:29:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1okmeo-002Hwp-Pu; Tue, 18 Oct 2022 15:29:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1okmeo-008os2-1H; Tue, 18 Oct 2022 15:29:22 +0200
Date: Tue, 18 Oct 2022 15:29:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pwm: sifive: Always let the first pwm_apply_state
 succeed
Message-ID: <20221018132921.5fsbiz254npk2fci@pengutronix.de>
References: <20221018091316.415685-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20221018091316.415685-1-emil.renner.berthing@canonical.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_062928_962388_3C166070 
X-CRM114-Status: GOOD (  28.78  )
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
Content-Type: multipart/mixed; boundary="===============1018240982260686315=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1018240982260686315==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mm6vvxtocb2k52r"
Content-Disposition: inline


--4mm6vvxtocb2k52r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Oct 18, 2022 at 11:13:16AM +0200, Emil Renner Berthing wrote:
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
>  drivers/pwm/pwm-sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index 2d4fa5e5fdd4..ccdf92045f34 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -159,7 +159,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
> =20
>  	mutex_lock(&ddata->lock);
>  	if (state->period !=3D ddata->approx_period) {
> -		if (ddata->user_count !=3D 1) {
> +		if (ddata->user_count !=3D 1 && ddata->approx_period) {

IMHO this needs a code comment. It should among others mention that
approx_period is only zero if .apply() wasn't called before.

Let me note this is inconsistent. I didn't check the details, but let's
assume the PWM can implement .period =3D 500 and .period =3D 514 and nothing
in between. So if the the first PWM requests 512 ns it gets (I hope) 500
ns. Then when the second requests comes in requesting 511 it fails and
if it requests 512 is succeeds also getting 500 ns. Hmm.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4mm6vvxtocb2k52r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNOqi8ACgkQwfwUeK3K
7AkPuwf/aMdvPVFLhS+ygY/c1Guwk89BPz1Yy9kO0c0YNna1B6Vp8f02XEeGMeK7
hirxK+eqKE+2mhj/4Ma1kqkcDCA11curbutAxiKlBo13FGJsSYGfI6fPQIb4QFc2
B2dbxcF7MkJaDJ9+1RB5FhaK84cfJ0YSXvt0zC2MXzUQUaKQYXsO8KRIcExrmsSY
3qni4f8ZGIojR/5BSW4wxZvdok3rt4LqAYKavkVwXsPM1gAC7QzW8bM5ian2Qz5u
TGE+O9jX2frictFolA3vL8dW/Ums8MziSnncS1VhCKjW0Z0Hwu4JePf8Jc8Fofbq
a9UJSsy7sT/d+Zj+1Nu7DOgPmoT8LQ==
=ysZi
-----END PGP SIGNATURE-----

--4mm6vvxtocb2k52r--


--===============1018240982260686315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1018240982260686315==--

