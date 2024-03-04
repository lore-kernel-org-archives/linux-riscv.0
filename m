Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78059C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRdpzGGT5KglGXJyepFitf7RvqanSJBaqX6lWsnaXs4=; b=CsE1v6Fx00ZrMJXDZNpQyynEVE
	2jt6TPr3781UnPPVw0Hxm04MNLZPhadKYhoptlgI/P2nRtHbPcp3YT2WrOPFV+47lhqo8I/RJw+pg
	n2zKdwc7J+kPGNzwGCc6ZHdARV6n/6U+28stnhILWVPF1+BJzHvAmu15RSnNSUhGW+I+BmC84QiE6
	53HRXoKR67dnTRS/PyK21hub/E/gxY4h5QXZ47egiQ6PdRRthw6vGK3J3knCC0TgQTYSC/bsxzQ/Z
	4zvJIN0PgZoRsl14UrSBuaA2mlvKElkIS1T1zduCd927YjE1Yi4aG08+snP+qsChKs+QOQ+BvXnMp
	5OADIWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhAO9-00000009dh6-2K8n;
	Mon, 04 Mar 2024 15:38:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhANU-00000009d8N-0pXH
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:37:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhANF-0002ed-2i; Mon, 04 Mar 2024 16:37:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhANC-004Nhh-HD; Mon, 04 Mar 2024 16:37:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhANC-00Gqsh-1O;
	Mon, 04 Mar 2024 16:37:02 +0100
Date: Mon, 4 Mar 2024 16:37:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dlan@gentoo.org, 
	inochiama@outlook.com
Subject: Re: [PATCH v4 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Message-ID: <twzx4abuhduos5s32txeugqr2yyca6ey7adcontsnapthwqaxa@dscea3ybrlym>
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
 <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_073721_000163_B045C0CD 
X-CRM114-Status: GOOD (  43.98  )
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
Content-Type: multipart/mixed; boundary="===============4797234823934290882=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4797234823934290882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e7bcxw3shvpcg4m6"
Content-Disposition: inline


--e7bcxw3shvpcg4m6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

thanks for your patch.

On Mon, Mar 04, 2024 at 05:02:48PM +0800, Jingbao Qiu wrote:
> Implement the PWM driver for CV1800.
>=20
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-cv1800.c | 314 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 325 insertions(+)
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
> index 000000000000..d5b31a2b7787
> --- /dev/null
> +++ b/drivers/pwm/pwm-cv1800.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * pwm-cv1800.c: PWM driver for Sophgo cv1800

Mentioning the filename in the file isn't very helpful. It's obvious
information.

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
> + * - This hardware could support inverted polarity. By default, the valu=
e of the
> + *   POLARITY register is 0x0. This means that HLPERIOD represents the n=
umber
> + *   of low level beats.
> + * - This hardware supports input mode and output mode, implemented thro=
ugh the
> + *   Output-Enable/OE register. However, this driver has not yet impleme=
nted
> + *   capture callback.
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
> +#define PWM_CV1800_HLPERIOD_BASE     0x00
> +#define PWM_CV1800_PERIOD_BASE       0x04
> +#define PWM_CV1800_POLARITY          0x40
> +#define PWM_CV1800_START             0x44
> +#define PWM_CV1800_DONE              0x48
> +#define PWM_CV1800_UPDATE            0x4c
> +#define PWM_CV1800_OE                0xd0
> +
> +#define PWM_CV1800_HLPERIOD(n)       (PWM_CV1800_HLPERIOD_BASE + ((n) * =
0x08))
> +#define PWM_CV1800_PERIOD(n)         (PWM_CV1800_PERIOD_BASE + ((n) * 0x=
08))
> +
> +#define PWM_CV1800_UPDATE_MASK(n)    (BIT(0) << (n))
> +#define PWM_CV1800_OE_MASK(n)        (BIT(0) << (n))
> +#define PWM_CV1800_START_MASK(n)     (BIT(0) << (n))
> +#define PWM_CV1800_POLARITY_MASK(n)  (BIT(0) << (n))
> +
> +#define PWM_CV1800_OE_INPUT          0x00U
> +#define PWM_CV1800_OE_OUTPUT(n)      (BIT(0) << (n))
> +#define PWM_CV1800_MAXPERIOD         (BIT(30) - 1)
> +#define PWM_CV1800_MINPERIOD         BIT(1)

These are minimal and maximal values. I'd do

#define PWM_CV1800_MAXPERIOD         0x3fffffff
#define PWM_CV1800_MINPERIOD         2

> +#define PWM_CV1800_PERIOD_RESET      BIT(1)
> +#define PWM_CV1800_HLPERIOD_RESET    BIT(0)
> +#define PWM_CV1800_REG_DISABLE       0x00U
> +#define PWM_CV1800_REG_ENABLE(n)     (BIT(0) << (n))
> +#define PWM_CV1800_CHANNELS          4
> +
> +struct cv1800_pwm {
> +	struct regmap *map;
> +	struct clk *clk;
> +	unsigned long clk_rate;
> +};
> +
> +static inline struct cv1800_pwm *to_cv1800_pwm_dev(struct pwm_chip *chip)
> +{
> +	return pwmchip_get_drvdata(chip);
> +}
> +
> +static const struct regmap_config cv1800_pwm_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
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
> +		regmap_update_bits(priv->map, PWM_CV1800_START,
> +				   PWM_CV1800_START_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
> +	} else if (pwm_enable && !enable) {
> +		regmap_update_bits(priv->map, PWM_CV1800_START,
> +				   PWM_CV1800_START_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_DISABLE);
> +	}
> +
> +	return 0;
> +}
> +
> +static void cv1800_pwm_set_polarity(struct pwm_chip *chip,
> +				    struct pwm_device *pwm,
> +				    enum pwm_polarity polarity)
> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +
> +	if (pwm->state.enabled)
> +		cv1800_pwm_enable(chip, pwm, !pwm->state.enabled);
> +
> +	if (polarity =3D=3D PWM_POLARITY_INVERSED)
> +		regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
> +				   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
> +	else
> +		regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
> +				   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_DISABLE);

Wouldn't it be more natural to make this read:

	if (polarity =3D=3D PWM_POLARITY_INVERSED)
		regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
				   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
				   PWM_CV1800_POLARITY_MASK(pwm->hwpwm));
	else
		regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
				   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
				   0);

or even:

	u32 polarity =3D 0;

	if (polarity =3D=3D PWM_POLARITY_INVERSED)
		polarity =3D PWM_CV1800_POLARITY_MASK(pwm->hwpwm);

	regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
			   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
			   polarity);

?

> +}
> +
> +static void cv1800_pwm_set_oe(struct pwm_chip *chip, struct pwm_device *=
pwm,
> +			      u32 mode)
> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +	u32 state;
> +
> +	regmap_read(priv->map, PWM_CV1800_OE, &state);
> +	state &=3D PWM_CV1800_OE_MASK(pwm->hwpwm);
> +
> +	if (state =3D=3D mode)
> +		return;
> +
> +	cv1800_pwm_enable(chip, pwm, false);
> +
> +	if (mode =3D=3D PWM_CV1800_OE_INPUT)
> +		regmap_update_bits(priv->map, PWM_CV1800_OE,
> +				   PWM_CV1800_OE_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_DISABLE);
> +	else if (mode =3D=3D PWM_CV1800_OE_OUTPUT(pwm->hwpwm))
> +		regmap_update_bits(priv->map, PWM_CV1800_OE,
> +				   PWM_CV1800_OE_MASK(pwm->hwpwm),
> +				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
> +}

What does this function do? A comment describing that would be good. I
wonder about it being called unconditionally in .apply() below.

> +
> +static int cv1800_pwm_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> +			    const struct pwm_state *state)
> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +	u32 period_val, hlperiod_val;
> +	u64 tem;
> +
> +	cv1800_pwm_set_oe(chip, pwm, PWM_CV1800_OE_OUTPUT(pwm->hwpwm));
> +
> +	if (state->polarity !=3D pwm->state.polarity)
> +		cv1800_pwm_set_polarity(chip, pwm, state->polarity);
> +
> +	/*
> +	 * This hardware use PERIOD and HLPERIOD registers to represent PWM wav=
es.
> +	 *
> +	 * The meaning of PERIOD is how many clock cycles (from the clock sourc=
e)
> +	 * are used to represent PWM waves.
> +	 * PERIOD =3D rate(MHz) / target(MHz)
> +	 * PERIOD =3D period(ns) * rate(Hz) / NSEC_PER_SEC
> +	 */
> +	tem =3D mul_u64_u64_div_u64(state->period, priv->clk_rate, NSEC_PER_SEC=
);

What does "tem" stand for? Maybe "ticks" is a better name?

> +	if (tem < PWM_CV1800_MINPERIOD)
> +		return -EINVAL;
> +
> +	if (tem > PWM_CV1800_MAXPERIOD)
> +		tem =3D PWM_CV1800_MAXPERIOD;
> +
> +	period_val =3D (u32)tem;
> +
> +	/*
> +	 * The meaning of HLPERIOD is the number of beats in the low or high le=
vel
> +	 * of the PERIOD. When the value of the POLARITY register is 0, HLPERIOD
> +	 * represents a low level.
> +	 * HLPERIOD =3D period_val - rate(MHz) / duty(MHz)
> +	 * HLPERIOD =3D period_val - duty(ns) * rate(Hz) / NSEC_PER_SEC

So HLPERIOD defines the second part of each period, right? This isn't
considered in .get_state().

> +	 */
> +	tem =3D mul_u64_u64_div_u64(state->duty_cycle, priv->clk_rate,
> +				  NSEC_PER_SEC);
> +	if (tem > period_val)
> +		return -EINVAL;

if (tem > period_val)
	tem =3D period_val;

> +	hlperiod_val =3D period_val - (u32)tem;

Wrong rounding I think. Did you test your driver with PWM_DEBUG enabled?

> +	regmap_write(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), period_val);
> +	regmap_write(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), hlperiod_val);
> +
> +	cv1800_pwm_enable(chip, pwm, state->enabled);
> +
> +	return 0;
> +}
> +
> +static int cv1800_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> +				struct pwm_state *state)
> +{
> +	struct cv1800_pwm *priv =3D to_cv1800_pwm_dev(chip);
> +	u32 period_val, hlperiod_val;
> +	u64 period_ns =3D 0;
> +	u64 duty_ns =3D 0;
> +	u32 enable =3D 0;
> +	u32 polarity =3D 0;
> +
> +	regmap_read(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), &period_val);
> +	regmap_read(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), &hlperiod_val);
> +
> +	if (period_val !=3D PWM_CV1800_PERIOD_RESET ||
> +	    hlperiod_val !=3D PWM_CV1800_HLPERIOD_RESET) {
> +		period_ns =3D DIV_ROUND_UP_ULL(period_val * NSEC_PER_SEC,
> +					     priv->clk_rate);
> +		duty_ns =3D DIV_ROUND_UP_ULL(hlperiod_val * period_ns, period_val);
> +
> +		regmap_read(priv->map, PWM_CV1800_START, &enable);
> +		enable &=3D PWM_CV1800_START_MASK(pwm->hwpwm);
> +
> +		regmap_read(priv->map, PWM_CV1800_POLARITY, &polarity);
> +		polarity &=3D PWM_CV1800_POLARITY_MASK(pwm->hwpwm);
> +	}
> +
> +	state->period =3D period_ns;
> +	state->duty_cycle =3D duty_ns;
> +	state->enabled =3D enable;
> +	state->polarity =3D polarity ? PWM_POLARITY_INVERSED : PWM_POLARITY_NOR=
MAL;
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops cv1800_pwm_ops =3D {
> +	.apply =3D cv1800_pwm_apply,
> +	.get_state =3D cv1800_pwm_get_state,
> +};
> +
> +static void devm_clk_rate_exclusive_put(void *data)
> +{
> +	struct clk *clk =3D data;
> +
> +	clk_rate_exclusive_put(clk);
> +}
> +
> +static int cv1800_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cv1800_pwm *priv;
> +	struct pwm_chip *chip;
> +	void __iomem *base;
> +	int ret;
> +
> +	chip =3D devm_pwmchip_alloc(dev, PWM_CV1800_CHANNELS, sizeof(*priv));
> +	if (!chip)
> +		return PTR_ERR(chip);
> +	priv =3D to_cv1800_pwm_dev(chip);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->map =3D devm_regmap_init_mmio(&pdev->dev, base,
> +					  &cv1800_pwm_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	priv->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
> +				     "clk not found\n");
> +
> +	ret =3D clk_rate_exclusive_get(priv->clk);

There is a devm_clk_rate_exclusive_get() in next. Please make use of it.
(See commit b0cde62e4c54)

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to get exclusive rate\n");
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev, devm_clk_rate_exclusive_pu=
t,
> +				       priv->clk);
> +	if (ret) {
> +		clk_rate_exclusive_put(priv->clk);
> +		return ret;
> +	}
> +
> +	priv->clk_rate =3D clk_get_rate(priv->clk);
> +	if (!priv->clk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Invalid clock rate: %lu\n",
> +				     priv->clk_rate);
> +
> +	chip->ops =3D &cv1800_pwm_ops;
> +
> +	return devm_pwmchip_add(dev, chip);

Error message if devm_pwmchip_add() fails, please.

> +}
> +
> +static const struct of_device_id cv1800_pwm_dt_ids[] =3D {
> +	{ .compatible =3D "sophgo,cv1800-pwm" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_pwm_dt_ids);
> +
> +static struct platform_driver cv1800_pwm_driver =3D {
> +	.probe =3D cv1800_pwm_probe,
> +	.driver	=3D {
> +		.name =3D "cv1800-pwm",
> +		.of_match_table =3D cv1800_pwm_dt_ids,
> +	},
> +};
> +module_platform_driver(cv1800_pwm_driver);
> +
> +MODULE_AUTHOR("Jingbao Qiu");
> +MODULE_DESCRIPTION("Sophgo cv1800 PWM Driver");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--e7bcxw3shvpcg4m6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXl6p0ACgkQj4D7WH0S
/k4xAwf/VFdbutVVhfqu7Q8bKKV0Zz9fBPfLtiSSilpxZ37vIowyBOyg6KgIuQ6a
gculAIj10VSUAPQAZ9w5juInsuKL5BOijigRILQM8VG8Y0ufo46L2p+TJT1bGyKc
TfZyJI4Wff06jdhYXYwIDIq5yGFjrKlBrHWGIBXMv3GKalMiIyG1uLxiSCryGrFx
EwMBMmZk+dieX3S0F5QOQr8Mb2m3EPOyvlAPgf3pHKDuwU4jGXpRoPuxBqtoN4O8
zJoVb8vM1ONrkebkHNy/Xi9s9tpkU6f1QYyllPPwIMRpnXVbkns/QPzYa7iZEGC7
wU7HoQkjbubSqaWeZ6Tc1ShvrfsyVg==
=z3hh
-----END PGP SIGNATURE-----

--e7bcxw3shvpcg4m6--


--===============4797234823934290882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4797234823934290882==--

