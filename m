Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035E5C4828D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZj/q+Rh26sZkvL2ZySYi1UNfSOXWLu83be5q9EWeNQ=; b=q6HPtzeFEN+MX0XoUjIUkjfUkD
	EUNNFLKgAJ7PBCrUGwjg6nPzQIl0vdb8uD9rQPwm06nAylzSy43S+p0NjqPOJx9xcpI3JEOlPt+G3
	yuc1ju39SWTwXSADJZfawuAaIzbPA/SKBrXA61rvAZMoEncvEKa01l2Xxq85KO+ZxhtOp+z71NHqA
	jHd4hOvGfRoGRa1uxcEBrUeoSctI4vwFP+d0s8csZBvRUcZhzbXPHdE6CjUZ4cdYoa4mRnzIcfxsK
	wF7OmkBWhxdXNcBxccJ5dilfH4Y4YyielFWlHb+/boNFqMsHrZgCEWK8bzdxnNY9gnTzTpXmaNsV4
	iK42IkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdTP-0000000A3pv-2Eib;
	Wed, 07 Feb 2024 08:40:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdTM-0000000A3oe-2OhG
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 08:40:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXdSu-0001Xk-CX; Wed, 07 Feb 2024 09:39:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXdSs-004z5B-P9; Wed, 07 Feb 2024 09:39:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXdSs-00HCvw-27;
	Wed, 07 Feb 2024 09:39:30 +0100
Date: Wed, 7 Feb 2024 09:39:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dlan@gentoo.org, 
	inochiama@outlook.com
Subject: Re: [PATCH v1 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Message-ID: <sgdzjoyabi7jf6h6lzrx6evl5g625ccczqgnyseeh24zauvqgp@dhad3txonq6a>
References: <20240207055856.672184-1-qiujingbao.dlmu@gmail.com>
 <20240207060913.672554-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240207060913.672554-1-qiujingbao.dlmu@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_004000_796673_2C79A33F 
X-CRM114-Status: GOOD (  45.80  )
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
Content-Type: multipart/mixed; boundary="===============1815747897883950329=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1815747897883950329==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ku6e3d7ezi6spch7"
Content-Disposition: inline


--ku6e3d7ezi6spch7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jingbao,

On Wed, Feb 07, 2024 at 02:09:13PM +0800, Jingbao Qiu wrote:
> Implement the PWM driver for CV1800.
>=20
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 229 insertions(+)
>  create mode 100644 drivers/pwm/pwm-cv1800.c
>=20
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 4b956d661755..455f07af94f7 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -186,6 +186,16 @@ config PWM_CROS_EC
>  	  PWM driver for exposing a PWM attached to the ChromeOS Embedded
>  	  Controller.
> =20
> +config PWM_CV1800
> +	tristate "Sophgo CV1800 PWM driver"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	help
> +	  Generic PWM framework driver for the Sophgo CV1800 series
> +	  SoCs.
> +
> +	  To compile this driver as a module, build the dependecies
> +	  as modules, this will be called pwm-cv1800.
> +
>  config PWM_DWC_CORE
>  	tristate
>  	depends on HAS_IOMEM
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index c5ec9e168ee7..6c3c4a07a316 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_PWM_CLK)		+=3D pwm-clk.o
>  obj-$(CONFIG_PWM_CLPS711X)	+=3D pwm-clps711x.o
>  obj-$(CONFIG_PWM_CRC)		+=3D pwm-crc.o
>  obj-$(CONFIG_PWM_CROS_EC)	+=3D pwm-cros-ec.o
> +obj-$(CONFIG_PWM_CV1800)	+=3D pwm-cv1800.o
>  obj-$(CONFIG_PWM_DWC_CORE)	+=3D pwm-dwc-core.o
>  obj-$(CONFIG_PWM_DWC)		+=3D pwm-dwc.o
>  obj-$(CONFIG_PWM_EP93XX)	+=3D pwm-ep93xx.o
> diff --git a/drivers/pwm/pwm-cv1800.c b/drivers/pwm/pwm-cv1800.c
> new file mode 100644
> index 000000000000..4d4f233c9087
> --- /dev/null
> +++ b/drivers/pwm/pwm-cv1800.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rtc-cv1800.c: PWM driver for Sophgo cv1800 RTC
> + *
> + * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Please document the behaviour of the PWM here at the top of the driver.
Things to mention are:

 - How does the hardware behave on disable? (Usual behaviours include:
   output of inactive state; freeze where it just happens to be; high-z)

 - If you reconfigure the hardware, does it complete the previously
   running period before emitting the new wave form?

 - Are there possible glitches in .apply()? (i.e. can it happen, that
   for a short moment a wave form is emitted that has the new period but
   the old duty_cycle?)

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +
> +#define HLPERIOD_BASE  0x00
> +#define PERIOD_BASE    0x04
> +#define POLARITY       0x040
> +#define PWMSTART       0x044
> +#define PWMDONE        0x048
> +#define PWMUPDATE      0x4c
> +#define PWM_OE         0xd0
> +#define HLPERIOD_SHIFT 0x08
> +#define PERIOD_SHIFT   0x08
> +
> +#define HLPERIOD(n)    (HLPERIOD_BASE + ((n) * HLPERIOD_SHIFT))
> +#define PERIOD(n)      (PERIOD_BASE + ((n) * PERIOD_SHIFT))
> +#define UPDATE(n)      (BIT(0) << (n))
> +#define OE_MASK(n)     (BIT(0) << (n))
> +#define START_MASK(n)  (BIT(0) << (n))
> +
> +#define PERIOD_RESET   0x02
> +#define HLPERIOD_RESET 0x1
> +#define REG_DISABLE    0x0U
> +#define REG_ENABLE     BIT(0)

Please use a driver specific prefix for all these defines.

> +struct soc_info {
> +	unsigned int num_pwms;
> +};
> +
> +struct cv1800_pwm {
> +	struct pwm_chip chip;
> +	struct regmap *map;
> +	struct clk *clk;
> +};
> +
> +static inline struct cv1800_pwm *to_cv1800_pwm_dev(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct cv1800_pwm, chip);
> +}
> +
> +static int cv1800_pwm_enable(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +			     u32 enable)

This is called with the enable parameter set to state->enabled which is
a bool. Please use a bool here, too, instead of a u32.

> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +	u32 pwm_enable;
> +
> +	regmap_read(priv->map, PWMSTART, &pwm_enable);
> +	pwm_enable >>=3D pwm->hwpwm;

I don't understand why this value is shifted here. I guess this misses a
mask?

> +	if (enable)
> +		clk_prepare_enable(priv->clk);
> +	else
> +		clk_disable_unprepare(priv->clk);

This is broken. It might well happen that the first call to .apply() has
state->enabled =3D false. Please make sure to properly balance clk
enabling.

> +	/*
> +	 * If the parameters are changed during runtime, Register needs
> +	 * to be updated to take effect.
> +	 */
> +	if (pwm_enable) {
> +		regmap_update_bits(priv->map, PWMUPDATE, UPDATE(pwm->hwpwm),
> +				   REG_ENABLE << pwm->hwpwm);
> +		regmap_update_bits(priv->map, PWMUPDATE, UPDATE(pwm->hwpwm),
> +				   REG_DISABLE << pwm->hwpwm);

REG_DISABLE is zero. Why is this shifted? Very strange.

> +	} else {
> +		regmap_update_bits(priv->map, PWM_OE, OE_MASK(pwm->hwpwm),
> +				   enable << pwm->hwpwm);
> +		regmap_update_bits(priv->map, PWMSTART, START_MASK(pwm->hwpwm),
> +				   enable << pwm->hwpwm);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cv1800_pwm_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> +			    const struct pwm_state *state)
> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +	u64 period_ns, duty_ns;
> +	u32 period_val, hlperiod_val;
> +	unsigned long long rate, div;
> +
> +	period_ns =3D state->period;
> +	duty_ns =3D state->duty_cycle;
> +
> +	rate =3D (unsigned long long)clk_get_rate(priv->clk);

This cast has no effect, so please drop it. To prevent that the clock
changes rate while the PWM is running, please use
clk_rate_exclusive_get().

> +	div =3D rate * period_ns;

This might overflow. Please use mul_u64_u64_div_u64() or one of its
variants and error out on rate > NSEC_PER_SEC. (There are other pwm
drivers that make it right, took a look into these if this is unclear.)

> +	do_div(div, NSEC_PER_SEC);
> +	period_val =3D div;
> +
> +	div =3D rate * (period_ns - duty_ns);
> +	do_div(div, NSEC_PER_SEC);
> +	hlperiod_val =3D div;

I think it can happen here, that div it too big to fit into this u32.

> +	regmap_write(priv->map, PERIOD(pwm->hwpwm), period_val);
> +	regmap_write(priv->map, HLPERIOD(pwm->hwpwm), hlperiod_val);
> +
> +	cv1800_pwm_enable(chip, pwm, state->enabled);
> +
> +	return 0;
> +}
> +
> +static int cv1800_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> +				 struct pwm_state *state)
> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +	u32 period_val, hlperiod_val, tem;
> +	u64 rate;
> +	u64 period_ns =3D 0;
> +	u64 duty_ns =3D 0;
> +	u32 enable =3D 0;
> +
> +	regmap_read(priv->map, PERIOD(pwm->hwpwm), &period_val);
> +	regmap_read(priv->map, HLPERIOD(pwm->hwpwm), &hlperiod_val);
> +
> +	if (period_val !=3D PERIOD_RESET || hlperiod_val !=3D HLPERIOD_RESET) {
> +		rate =3D (u64)clk_get_rate(priv->clk);
> +
> +		tem =3D NSEC_PER_SEC * period_val;

This might overflow.

> +		do_div(tem, rate);
> +		period_ns =3D tem;

This uses wrong rounding. If you enabled PWM_DEBUG during your tests,
this should be catched and logged.

> +
> +		tem =3D period_val * period_ns;
> +		do_div(tem, hlperiod_val);
> +		duty_ns =3D tem;
> +
> +		regmap_read(priv->map, PWMSTART, &enable);
> +		enable >>=3D pwm->hwpwm;

Again a missing mask??

> +	}
> +
> +	state->period =3D period_ns;
> +	state->duty_cycle =3D duty_ns;
> +	state->enabled =3D enable;
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops cv1800_pwm_ops =3D {
> +	.apply =3D cv1800_pwm_apply,
> +	.get_state =3D cv1800_pwm_get_state,
> +};
> +
> +static const struct regmap_config cv1800_pwm_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static int cv1800_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cv1800_pwm *cv_pwm;

Please pick always the same name for your driver private variable. In
the other functions it is called "priv".

> +	void __iomem *base;
> +	const struct soc_info *info;
> +
> +	info =3D device_get_match_data(dev);
> +	if (!info)

error message please.

> +		return -EINVAL;
> +
> +	cv_pwm =3D devm_kzalloc(dev, sizeof(*cv_pwm), GFP_KERNEL);
> +	if (!cv_pwm)
> +		return -ENOMEM;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	cv_pwm->map =3D devm_regmap_init_mmio(&pdev->dev, base,
> +					    &cv1800_pwm_regmap_config);
> +	if (IS_ERR(cv_pwm->map))
> +		return PTR_ERR(cv_pwm->map);
> +
> +	cv_pwm->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(cv_pwm->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(cv_pwm->clk),
> +				     "clk not found\n");
> +
> +	cv_pwm->chip.dev =3D dev;
> +	cv_pwm->chip.ops =3D &cv1800_pwm_ops;
> +	cv_pwm->chip.npwm =3D info->num_pwms;

Missing clk handling here. Please all clk_prepare_enable once for each
running channel.

> +	return devm_pwmchip_add(dev, &cv_pwm->chip);
> +}
> +
> +static const struct soc_info cv1800b_soc_info =3D {
> +	.num_pwms =3D 4,
> +};

Until you support more variants, I suggest to just hardcode npwm to
four.

> +static const struct of_device_id cv1800_pwm_dt_ids[] =3D {
> +	{ .compatible =3D "sophgo,cv1800-pwm", .data =3D &cv1800b_soc_info },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_pwm_dt_ids);
> +
> +static struct platform_driver cv1800_pwm_driver =3D {
> +	.driver =3D {
> +		.name =3D "cv1800-pwm",
> +		.of_match_table =3D cv1800_pwm_dt_ids,
> +	},
> +	.probe =3D cv1800_pwm_probe,
> +};
> +module_platform_driver(cv1800_pwm_driver);
> +
> +MODULE_ALIAS("platform:cv1800-pwm");

I'm with Krzysztof here, this shouldn't be needed.

> +MODULE_AUTHOR("Jingbao Qiu");
> +MODULE_DESCRIPTION("Sophgo cv1800 RTC Driver");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ku6e3d7ezi6spch7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXDQcEACgkQj4D7WH0S
/k7MUwgAsrKBGI9Hel0m1xmG2Q3RC/iv2KKO5zVzYfXMFviJjQF+3FVXxpAIBM2N
61XfltHtaZgx+RGq68rxHgobCPkXNA5Dys4W8g3ek0T8XVh1QLouAFGYCRl66Sxz
CTNE2TwGmipF2GwuLljLNadPuL6odF0NEUp9Z5Cu6eMkBvRpFfNc492SSmYnndiR
UYaus3hjfCP62MCTdLhrr8DObvYLU0dBIumrkFhfhWhj6hxksztYY4cKOblM2O9I
DGzdXlCHBGHnVQ6m7yBId5giZhJIYkI5goR4bxTFdn4ZWGIjrN0Fp0H3AhktPlSp
v1oeT03M/lfha0BXfBZVpLf4DX8F/A==
=aldx
-----END PGP SIGNATURE-----

--ku6e3d7ezi6spch7--


--===============1815747897883950329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1815747897883950329==--

