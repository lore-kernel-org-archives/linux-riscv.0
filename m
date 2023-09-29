Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C223E728C1
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6cEjGIRoViFRm1gAtl9m0vl/LrDqgbjQcjTG0pQmhk=; b=1wjPUNQJBpUJcG6lqifnUH5L9B
	37kcdEaXCiBmLFkWuKfpjwAlnfAUOHelDQFIwgdkeA8aj6/hVOfJK940dCEGfuAmJ0qkpiHry0TGV
	k1WJv4A1PTzDo95GuapP05ZtCK0Lp77jokEhZ3sGmUrkycfLT6x55cd7o82dT2GnZjm9rFkK8Anlk
	6LvvC44Dbmd3iZ2IaCuvDRI3nW1ZU7/mFyqLumy+Sg/zn8casH2PIQJOJFwBJfdD6eMUe/eKnbsfo
	HC4l4FWtLLMoPMjQZ5FN0t29AAPafht4HU6iBbB5xIKT8A69VZbUAIJQPK5+MZjjBHzW6AhWYgZ1Z
	KbrlkIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmFbr-008DJM-1I;
	Fri, 29 Sep 2023 15:40:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmFbm-008DHt-2p
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 15:40:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmFbS-0000kz-B6; Fri, 29 Sep 2023 17:40:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmFbP-009qYi-Gq; Fri, 29 Sep 2023 17:40:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmFbP-0060Vc-6f; Fri, 29 Sep 2023 17:40:27 +0200
Date: Fri, 29 Sep 2023 17:40:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH 2/2] pwm: add T-HEAD PWM driver
Message-ID: <20230929154027.lq77saenadxgry5x@pengutronix.de>
References: <20230928170254.413-1-jszhang@kernel.org>
 <20230928170254.413-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230928170254.413-3-jszhang@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_084051_217794_8DF12991 
X-CRM114-Status: GOOD (  43.54  )
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
Content-Type: multipart/mixed; boundary="===============0332974904924316191=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0332974904924316191==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7i7o422tklvgxyiz"
Content-Disposition: inline


--7i7o422tklvgxyiz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Sep 29, 2023 at 01:02:54AM +0800, Jisheng Zhang wrote:
> T-HEAD SoCs such as the TH1520 contain a PWM controller used
> among other things to control the LCD backlight, fan and so on.
> Add driver for it.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS             |   1 +
>  drivers/pwm/Kconfig     |  11 ++
>  drivers/pwm/Makefile    |   1 +
>  drivers/pwm/pwm-thead.c | 289 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 302 insertions(+)
>  create mode 100644 drivers/pwm/pwm-thead.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d55e40060c46..86cf0926dbfc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18482,6 +18482,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/usb/dwc3/dwc3-thead.c
> +F:	drivers/pwm/pwm-thead.c
> =20
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 8ebcddf91f7b..428fa365a19a 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -637,6 +637,17 @@ config PWM_TEGRA
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-tegra.
> =20
> +config PWM_THEAD
> +	tristate "T-HEAD PWM support"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  Generic PWM framework driver for the PWFM controller found on THEAD
> +	  SoCs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-thead.
> +
>  config PWM_TIECAP
>  	tristate "ECAP PWM support"
>  	depends on ARCH_OMAP2PLUS || ARCH_DAVINCI_DA8XX || ARCH_KEYSTONE || ARC=
H_K3 || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index c822389c2a24..4c317e6316e8 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_PWM_STMPE)		+=3D pwm-stmpe.o
>  obj-$(CONFIG_PWM_SUN4I)		+=3D pwm-sun4i.o
>  obj-$(CONFIG_PWM_SUNPLUS)	+=3D pwm-sunplus.o
>  obj-$(CONFIG_PWM_TEGRA)		+=3D pwm-tegra.o
> +obj-$(CONFIG_PWM_THEAD)		+=3D pwm-thead.o
>  obj-$(CONFIG_PWM_TIECAP)	+=3D pwm-tiecap.o
>  obj-$(CONFIG_PWM_TIEHRPWM)	+=3D pwm-tiehrpwm.o
>  obj-$(CONFIG_PWM_TWL)		+=3D pwm-twl.o
> diff --git a/drivers/pwm/pwm-thead.c b/drivers/pwm/pwm-thead.c
> new file mode 100644
> index 000000000000..8339f5617b6f
> --- /dev/null
> +++ b/drivers/pwm/pwm-thead.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * T-HEAD PWM driver
> + *
> + * Copyright (C) 2021 Alibaba Group Holding Limited.

If you have a public link to a reference manual, please mention this
here. Also please add a section that describes hardware (and software)
limitations sticking to the format in other drivers. The idea is that

	sed -rn '/Limitations:/,/\*\/?$/p'

tells you about (at least) about the following properties:

 - Can the PWM be updated atomically?
 - Does it complete the current running period before switching to the
   new configuration?
 - How does the output behave when disabled?

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pwm.h>
> +#include <linux/slab.h>
> +
> +#define MAX_PWM_NUM	6
> +
> +#define LIGHT_PWM_CHN_BASE(n)		((n) * 0x20)
> +#define LIGHT_PWM_CTRL(n)		(LIGHT_PWM_CHN_BASE(n) + 0x00)
> +#define LIGHT_PWM_RPT(n)		(LIGHT_PWM_CHN_BASE(n) + 0x04)
> +#define LIGHT_PWM_PER(n)		(LIGHT_PWM_CHN_BASE(n) + 0x08)
> +#define LIGHT_PWM_FP(n)			(LIGHT_PWM_CHN_BASE(n) + 0x0c)
> +#define LIGHT_PWM_STATUS(n)		(LIGHT_PWM_CHN_BASE(n) + 0x10)
> +
> +/* bit definition PWM_CTRL */
> +#define PWM_START				BIT(0)
> +#define PWM_SOFT_RST				BIT(1)
> +#define PWM_CFG_UPDATE				BIT(2)
> +#define PWM_INT_EN				BIT(3)
> +#define PWM_ONE_SHOT_MODE			BIT(4)
> +#define PWM_CONTINUOUS_MODE			BIT(5)
> +#define PWM_EVT_RISING_TRIG_UNDER_ONE_SHOT	BIT(6)
> +#define PWM_EVT_FALLING_TRIG_UNDER_ONE_SHOT	BIT(7)
> +#define PWM_FPOUT				BIT(8)
> +#define PWM_INFACTOUT				BIT(9)

Emil already criticised the naming here (Thanks btw for the review!). I
also want you to use a consistent prefix, but I wonder about "LIGHT_", I
would have expected "THEAD_" matching the driver name?!

> +struct thead_pwm_chip {
> +	struct clk *clk;
> +	void __iomem *mmio_base;
> +	struct pwm_chip chip;
> +};
> +
> +#define to_thead_pwm_chip(chip)		container_of(chip, struct thead_pwm_chi=
p, chip)

This is wrong. Try:

	struct pwm_chip *mychip;
	struct thead_pwm_chip *pc =3D to_thead_pwm_chip(mychip);

=2E (Of course you shouldn't name a pwm_chip "mychip", "chip" is fine.
Still this is too ugly.) I suggest a static inline here, ideally one
that has a name starting with "thead_pwm_". thead_pwm_from_chip() comes
to mind.
=09
> +static int thead_pwm_clk_prepare_enable(struct thead_pwm_chip *pc)
> +{
> +	return clk_prepare_enable(pc->clk);
> +}
> +
> +static void thead_pwm_clk_disable_unprepare(struct thead_pwm_chip *pc)
> +{
> +	clk_disable_unprepare(pc->clk);
> +}

I agree to Emil here that these wrappers are too thin. (Also you might
get rid of them completely, see below.)

> +static int thead_pwm_enable(struct pwm_chip *chip, struct pwm_device *pw=
m)
> +{
> +	struct thead_pwm_chip *pc =3D to_thead_pwm_chip(chip);
> +	u32 value;
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(chip->dev);

This function is typically called directly after thead_pwm_config()
which ended with calling pm_runtime_put_sync(). If you put the logic of
=2Eapply() in a single function (or move runtime pm handling in there) you
can prevent some put/get ping-pong.

> +	if (ret < 0) {
> +		dev_err(chip->dev, "failed to clock on the pwm device(%d)\n", ret);

Please use %pe for better readable error messages.

> +		return ret;
> +	}
> +
> +	value =3D readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	value |=3D PWM_START;
> +	writel(value, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	return 0;
> +}
> +
> +static void thead_pwm_disable(struct pwm_chip *chip, struct pwm_device *=
pwm)
> +{
> +	struct thead_pwm_chip *pc =3D to_thead_pwm_chip(chip);
> +	u32 value;
> +
> +	value =3D readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	value &=3D ~PWM_START;
> +	writel(value, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	pm_runtime_put_sync(chip->dev);
> +}
> +
> +static int thead_pwm_config(struct pwm_chip *chip, struct pwm_device *pw=
m,
> +			    int duty_ns, int period_ns)
> +{
> +	struct thead_pwm_chip *pc =3D to_thead_pwm_chip(chip);
> +	unsigned long rate =3D clk_get_rate(pc->clk);
> +	unsigned long duty_cycle, period_cycle;
> +	u32 pwm_cfg =3D PWM_INFACTOUT | PWM_FPOUT | PWM_CONTINUOUS_MODE | PWM_I=
NT_EN;
> +	int ret;
> +
> +	if (duty_ns > period_ns) {
> +		dev_err(chip->dev, "invalid pwm configure\n");
> +		return -EINVAL;

You can assume that won't happen (once you fixed the implicit type cast
in the call to thead_pwm_config pointed out below).

> +	}
> +
> +	ret =3D pm_runtime_get_sync(chip->dev);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "failed to clock on the pwm device(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	writel(pwm_cfg, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	period_cycle =3D period_ns * rate;

This might overflow. Please use mul_u64_u64_div_u64 here together with
making sure that rate <=3D NSEC_PER_SEC.

> +	do_div(period_cycle, NSEC_PER_SEC);
> +	writel(period_cycle, pc->mmio_base + LIGHT_PWM_PER(pwm->hwpwm));
> +	duty_cycle =3D duty_ns * rate;
> +	do_div(duty_cycle, NSEC_PER_SEC);
> +	writel(duty_cycle, pc->mmio_base + LIGHT_PWM_FP(pwm->hwpwm));
> +
> +	pwm_cfg =3D readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	pwm_cfg |=3D PWM_CFG_UPDATE;
> +	writel(pwm_cfg, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));

I assume this means period and duty_cycle are updated atomically (i.e.
at no time the hardware is configured to emit a wave that has the new
period but the old duty_cycle)?

Is this needed even if the PWM is currently off and you write PWM_START
a moment later? Can writing PWM_CFG_UPDATE and PWM_START be done in a
single step?

> +	pm_runtime_put_sync(chip->dev);
> +
> +	return 0;
> +}
> +
> +static int thead_pwm_set_polarity(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  enum pwm_polarity polarity)
> +{
> +	struct thead_pwm_chip *pc =3D to_thead_pwm_chip(chip);
> +	u32 value =3D readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(chip->dev);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "failed to clock on the pwm device(%d)\n", ret);

Please don't make .apply() emit an error message.

> +		return ret;
> +	}
> +
> +	if (polarity =3D=3D PWM_POLARITY_NORMAL)
> +		value |=3D PWM_FPOUT;
> +	else
> +		value &=3D ~PWM_FPOUT;
> +
> +	writel(value, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));

Oh, no PWM_CFG_UPDATE here? So writing the polarity takes effect
immediately? If so, please note this is the Limitations section I
asked for above.

> +	pm_runtime_put_sync(chip->dev);
> +
> +	return 0;
> +}
> +
> +static int thead_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	int err;
> +	bool enabled =3D pwm->state.enabled;
> +
> +	if (state->polarity !=3D pwm->state.polarity)
> +		thead_pwm_set_polarity(chip, pwm, state->polarity);
> +
> +	if (!state->enabled) {
> +		if (enabled)
> +			thead_pwm_disable(chip, pwm);
> +		return 0;
> +	}
> +
> +	err =3D thead_pwm_config(chip, pwm, state->duty_cycle, state->period);

state->duty_cycle is an u64, but thead_pwm_config takes an int ...

> +	if (err)
> +		return err;
> +
> +	if (!enabled)
> +		return thead_pwm_enable(chip, pwm);
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops thead_pwm_ops =3D {
> +	.apply =3D thead_pwm_apply,

Please implement .get_state() and test with PWM_DEBUG enabled.

> +	.owner =3D THIS_MODULE,
> +};
> +
> +static int __maybe_unused thead_pwm_runtime_suspend(struct device *dev)
> +{
> +	struct thead_pwm_chip *pc =3D dev_get_drvdata(dev);
> +
> +	thead_pwm_clk_disable_unprepare(pc);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused thead_pwm_runtime_resume(struct device *dev)
> +{
> +	struct thead_pwm_chip *pc =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D thead_pwm_clk_prepare_enable(pc);
> +	if (ret) {
> +		dev_err(dev, "failed to enable pwm clock(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int thead_pwm_probe(struct platform_device *pdev)
> +{
> +	struct thead_pwm_chip *pc;
> +	int ret;
> +
> +	pc =3D devm_kzalloc(&pdev->dev, sizeof(*pc), GFP_KERNEL);
> +	if (!pc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pc);
> +
> +	pc->mmio_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pc->mmio_base))
> +		return PTR_ERR(pc->mmio_base);
> +
> +	pc->clk =3D devm_clk_get(&pdev->dev, NULL);

devm_clk_get_enabled()

> +	if (IS_ERR(pc->clk))
> +		return PTR_ERR(pc->clk);
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
> +	ret =3D thead_pwm_clk_prepare_enable(pc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable pwm clock(%d)\n", ret);
> +		goto err_pm_disable;
> +	}
> +
> +	pc->chip.ops =3D &thead_pwm_ops;
> +	pc->chip.dev =3D &pdev->dev;
> +	pc->chip.npwm =3D MAX_PWM_NUM;
> +
> +	ret =3D pwmchip_add(&pc->chip);

devm_pwmchip_add()

> +	if (ret)
> +		goto err_clk_disable;
> +
> +	pm_runtime_put(&pdev->dev);
> +
> +	return 0;
> +
> +err_clk_disable:
> +	thead_pwm_clk_disable_unprepare(pc);
> +err_pm_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7i7o422tklvgxyiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUW7+oACgkQj4D7WH0S
/k7ALggAhmJTiDR1A8R13CZqNrc/bNOhs+UFYYTpafxG/rk2m3s3WZYP3l4XxHLu
6kmuQ+3A0FvDTalPkd4DWm9fX2ZfUyf4Kq5+YwipiWkXGf3PATSjhx7e/fYkQmgR
GK/OC6w41uoUvNYiEqZGzartdCcXpjriSqVpSLdAoxPN308rgH6qBB9EoqweBZGE
9LGW6yZ/2a8BcJmG2AlBxHSZgK+VdjpkW/mv8AWLcyfvhEWruvQufDzBePSBy/NB
9U4dkMxSSVxDFXvpLeAj49Q8Fv6+ZkV03vv5yg6NEe/YJdb4M+bY5Q/e4WYnQdLo
vMZI4WeRrhqZm+PVAm/wZjPcmi8rUw==
=j5Sk
-----END PGP SIGNATURE-----

--7i7o422tklvgxyiz--


--===============0332974904924316191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0332974904924316191==--

