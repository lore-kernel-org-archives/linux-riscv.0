Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543E8C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nvq9gCg8cXbIb4tYA9/3pcGCgMh3FMSzd30Z1Zo4sk=; b=GxQFU3ov+FY+UvzUkTZG4nQUg2
	25kvO+d0fi0kNrstu/bkU1Jyf+a7hmAkVwfIins4gmnxCkWCZdK+mWW2yrBKyVBiHKj7eSziwP20t
	K+13r+ckufwuc7G0nUdVZAGHLoOaxDvXXM3/Nq3tnjllyVvU4soFxgJYCYG7nDbeyp8JfmosnSJJp
	dBSZqPYdITM9SoT7jCv08kS3seBJYnEN7v2ziWXyxzivfxiKawEe+OHQSbgL98UwrueNv5C+SQnyu
	iqkL4LK8IPVi7HLNQEbU+/9V1aRYeZCkrxm1hEKLDARXNMIVxqZIvR6ZXmxTLfgDE6xUCJIzX3wq7
	uqTwnQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcNfe-0000000EK5m-16GA;
	Tue, 20 Feb 2024 10:48:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcNfa-0000000EK4k-3cr3
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 10:48:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcNfM-0000FW-IK; Tue, 20 Feb 2024 11:48:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcNfK-001pIp-7S; Tue, 20 Feb 2024 11:47:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcNfK-008PTy-0S;
	Tue, 20 Feb 2024 11:47:58 +0100
Date: Tue, 20 Feb 2024 11:47:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dlan@gentoo.org, 
	inochiama@outlook.com
Subject: Re: [PATCH v2 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Message-ID: <54cwiddo4rsfgryxcgrniauwu2jqfynatmw5i7fzssbxm7txbp@cydhntyrls4p>
References: <20240212121729.1086718-1-qiujingbao.dlmu@gmail.com>
 <20240212121729.1086718-3-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240212121729.1086718-3-qiujingbao.dlmu@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_024815_091649_7CE19DDC 
X-CRM114-Status: GOOD (  36.00  )
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
Content-Type: multipart/mixed; boundary="===============7269080539758595749=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7269080539758595749==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cjk7gu26xrxspefg"
Content-Disposition: inline


--cjk7gu26xrxspefg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 12, 2024 at 08:17:29PM +0800, Jingbao Qiu wrote:
> Implement the PWM driver for CV1800.
>=20
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-cv1800.c | 248 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 259 insertions(+)
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
> index 000000000000..3d7f2ff3a6c2
> --- /dev/null
> +++ b/drivers/pwm/pwm-cv1800.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * pwm-cv1800.c: PWM driver for Sophgo cv1800
> + *
> + * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> + *
> + * Limitations:
> + * - It output low when PWM channel disabled.
> + * - This pwm device supports dynamic loading of PWM parameters. When PW=
MSTART
> + *   is written from 0 to 1, the register value (HLPERIODn, PERIODn) wil=
l be
> + *   temporarily stored inside the PWM. If you want to dynamically chang=
e the
> + *   waveform during PWM output, after writing the new value to HLPERIOD=
n and
> + *   PERIODn, write 1 and then 0 to PWMUPDATE[n] to make the new value e=
ffective.
> + * - Supports up to Rate/2 output, and the lowest is about Rate/(2^30-1).
> + * - By setting HLPERIODn to 0, can produce 100% duty cycle.
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
> +#define PWM_CV1800_HLPERIOD_BASE       0x00
> +#define PWM_CV1800_PERIOD_BASE         0x04
> +#define PWM_CV1800_PWM_CV1800_POLARITY 0x40
> +#define PWM_CV1800_START               0x44
> +#define PWM_CV1800_DONE                0x48
> +#define PWM_CV1800_UPDATE              0x4c
> +#define PWM_CV1800_OE                  0xd0
> +#define PWM_CV1800_HLPERIOD_SHIFT      0x08
> +#define PWM_CV1800_PERIOD_SHIFT        0x08
> +
> +#define PWM_CV1800_HLPERIOD(n)         \
> +	(PWM_CV1800_HLPERIOD_BASE + ((n) * PWM_CV1800_HLPERIOD_SHIFT))
> +#define PWM_CV1800_PERIOD(n)           \
> +	(PWM_CV1800_PERIOD_BASE + ((n) * PWM_CV1800_PERIOD_SHIFT))

I would have used a plain 0x08 instead of PWM_CV1800_HLPERIOD_SHIFT and
PWM_CV1800_PERIOD_SHIFT.

> +#define PWM_CV1800_UPDATE_MASK(n) (BIT(0) << (n))
> +#define PWM_CV1800_OE_MASK(n)     (BIT(0) << (n))
> +#define PWM_CV1800_START_MASK(n)  (BIT(0) << (n))
> +
> +#define PWM_CV1800_MAXPERIOD      (BIT(30) - 1)
> +#define PWM_CV1800_MINPERIOD      BIT(1)
> +#define PWM_CV1800_MINHLPERIOD    BIT(0)
> +#define PWM_CV1800_PERIOD_RESET   BIT(1)
> +#define PWM_CV1800_HLPERIOD_RESET BIT(0)
> +#define PWM_CV1800_REG_DISABLE    0x0U
> +#define PWM_CV1800_REG_ENABLE(n)  (BIT(0) << (n))
> +
> +struct cv1800_pwm {
> +	struct pwm_chip chip;
> +	struct regmap *map;
> +	struct clk *clk;
> +	unsigned long clk_rate;
> +};
> +
> +static const struct regmap_config cv1800_pwm_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static inline struct cv1800_pwm *to_cv1800_pwm_dev(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct cv1800_pwm, chip);

Please rework the driver to use pwmchip_alloc(). See
https://lore.kernel.org/linux-pwm/a37a167364366b6cbe2dd299dce02731706213b2.=
1707900770.git.u.kleine-koenig@pengutronix.de/T/#u
for a simple example for such a rework.

> +}
> +
> +static int cv1800_pwm_enable(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +			     bool enable)
> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +	u32 pwm_enable;
> +
> +	regmap_read(priv->map, PWM_CV1800_START, &pwm_enable);
> +	pwm_enable &=3D PWM_CV1800_START_MASK(pwm->hwpwm);
> +
> +	/*
> +	 * If the parameters are changed during runtime, Register needs
> +	 * to be updated to take effect.
> +	 */
> +	if (pwm_enable && enable) {
> +		regmap_update_bits(priv->map, PWM_CV1800_UPDATE,
> +				   PWM_CV1800_UPDATE_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
> +		regmap_update_bits(priv->map, PWM_CV1800_UPDATE,
> +				   PWM_CV1800_UPDATE_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_DISABLE);
> +	} else if (!pwm_enable && enable) {
> +		regmap_update_bits(priv->map, PWM_CV1800_OE,
> +				   PWM_CV1800_OE_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
> +		regmap_update_bits(priv->map, PWM_CV1800_START,
> +				   PWM_CV1800_START_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
> +	} else if (pwm_enable && !enable) {
> +		regmap_update_bits(priv->map, PWM_CV1800_OE,
> +				   PWM_CV1800_OE_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_DISABLE);
> +		regmap_update_bits(priv->map, PWM_CV1800_START,
> +				   PWM_CV1800_START_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_DISABLE);
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
> +	u32 period_val, hlperiod_val;
> +	u64 tem;
> +
> +	if (state->polarity !=3D PWM_POLARITY_NORMAL)
> +		return -EINVAL;
> +
> +	tem =3D mul_u64_u64_div_u64(state->period, priv->clk_rate, NSEC_PER_SEC=
);
> +	if (tem > PWM_CV1800_MAXPERIOD || tem < PWM_CV1800_MINPERIOD)
> +		return -EINVAL;

Please use:

	if (tem < PWM_CV1800_MINPERIOD)
		return -EINVAL
	if (tem > PWM_CV1800_MAXPERIOD)
		tem =3D PWM_CV1800_MAXPERIOD;

> +	period_val =3D (u32)tem;
> +
> +	tem =3D mul_u64_u64_div_u64(state->period - state->duty_cycle,
> +				  priv->clk_rate, NSEC_PER_SEC);

Given that you're supposed to configure the biggest duty_cycle not
bigger than the requested value, you have to round up here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cjk7gu26xrxspefg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXUg10ACgkQj4D7WH0S
/k41lggAljRXqWa2Xerk5/sOtzrwKao8H0XqZCZfI2VNVmcyFqID9ZqatZxvnWkE
/BIq+00xygUSmlupdxeaRxbWcuKQ7VsFiq0ulhiwNgbWgYw1QykdXV+ukxF5eNsp
OWq8+m4S3/ueQIF2GfLq9Pcp6csmBCaQxWH28P4IMO6cyrlB7Rx7ZhRIBuKj9iUf
BZTsNfSV7g35JQZRlBic0+Bt0zNCYS9UkAhK6dKddgUZ9TapBsm5+pqnSjjl7ZEY
cMHcpIYdMqgzMo1nmlIo2SgW4e8Mue3H5We1SR/Li4szk/DcESHVNZKGG7XHuDYL
g565r7uqbftADQuMQ+aLRn6gFjPcnw==
=qwpP
-----END PGP SIGNATURE-----

--cjk7gu26xrxspefg--


--===============7269080539758595749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7269080539758595749==--

