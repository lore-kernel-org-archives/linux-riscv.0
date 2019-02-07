Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8DFC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 10:17:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3B0218FE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 10:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeN1ALSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3B0218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQPu7qIaP1fByhBOEO1xhFiO3g45RLBTsblLRwdc4QM=; b=MeN1ALSHzMW2lU
	kwasR05jNMXZTwOZFZiwymcRCgtGxnxi+7nGmMNrBpwXcDD4hmWJFeC9RoszBc0O9ZzXou4tvQVXb
	UxnwiovObDOUk7yoSgfxSpkesesK4Kd3pOeOD+PyjjKGk9lOlqB0+DJBMD2sUQTgspLLDOeIok4Io
	dqXQdLEej5dTQsvUn0/AdBMdOqzxocQKQbItXqIdTzJnDV77SagA4a9ey9KbeY3k9bYhu+QHwlId3
	KEzqTkwRGvVrsKpYrWIQbqV/BmsC/GGSf2VMBbYlhKQ0CUX22aeaj9PQXFdFBdgfLR8PECN/T5I3A
	GoUHwgtmHML/ORMypz6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grgk0-0005M1-2P; Thu, 07 Feb 2019 10:17:08 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grgjt-0005Jd-6y
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 10:17:06 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1grgjq-0005ge-1p; Thu, 07 Feb 2019 11:16:58 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1grgjp-0003KZ-7R; Thu, 07 Feb 2019 11:16:57 +0100
Date: Thu, 7 Feb 2019 11:16:57 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190207101657.rfzcq6xdv6ocvubg@pengutronix.de>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_021702_076318_577E3212 
X-CRM114-Status: GOOD (  32.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 sachin.ghadi@sifive.com, thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Tue, Jan 29, 2019 at 05:13:19PM +0530, Yash Shah wrote:
> Adds a PWM driver for PWM chip present in SiFive's HiFive Unleashed SoC.
> =

> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/pwm/Kconfig      |  11 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-sifive.c | 261 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 273 insertions(+)
>  create mode 100644 drivers/pwm/pwm-sifive.c
> =

> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index a8f47df..4a61d1a 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -380,6 +380,17 @@ config PWM_SAMSUNG
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-samsung.
>  =

> +config PWM_SIFIVE
> +	tristate "SiFive PWM support"
> +	depends on OF
> +	depends on COMMON_CLK
> +	depends on RISCV || COMPILE_TEST
> +	help
> +	  Generic PWM framework driver for SiFive SoCs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-sifive.
> +
>  config PWM_SPEAR
>  	tristate "STMicroelectronics SPEAr PWM support"
>  	depends on PLAT_SPEAR
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 9c676a0..30089ca 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_PWM_RCAR)		+=3D pwm-rcar.o
>  obj-$(CONFIG_PWM_RENESAS_TPU)	+=3D pwm-renesas-tpu.o
>  obj-$(CONFIG_PWM_ROCKCHIP)	+=3D pwm-rockchip.o
>  obj-$(CONFIG_PWM_SAMSUNG)	+=3D pwm-samsung.o
> +obj-$(CONFIG_PWM_SIFIVE)	+=3D pwm-sifive.o
>  obj-$(CONFIG_PWM_SPEAR)		+=3D pwm-spear.o
>  obj-$(CONFIG_PWM_STI)		+=3D pwm-sti.o
>  obj-$(CONFIG_PWM_STM32)		+=3D pwm-stm32.o
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> new file mode 100644
> index 0000000..2b516f7
> --- /dev/null
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2017-2018 SiFive
> + * For SiFive's PWM IP block documentation please refer Chapter 14 of
> + * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> + */
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/slab.h>
> +
> +/* Register offsets */
> +#define PWM_SIFIVE_PWMCFG		0x0
> +#define PWM_SIFIVE_PWMCOUNT		0x8
> +#define PWM_SIFIVE_PWMS			0x10
> +#define PWM_SIFIVE_PWMCMP0		0x20
> +
> +/* PWMCFG fields */
> +#define PWM_SIFIVE_PWMCFG_SCALE		0
> +#define PWM_SIFIVE_PWMCFG_STICKY	8
> +#define PWM_SIFIVE_PWMCFG_ZERO_CMP	9
> +#define PWM_SIFIVE_PWMCFG_DEGLITCH	10
> +#define PWM_SIFIVE_PWMCFG_EN_ALWAYS	12
> +#define PWM_SIFIVE_PWMCFG_EN_ONCE	13
> +#define PWM_SIFIVE_PWMCFG_CENTER	16
> +#define PWM_SIFIVE_PWMCFG_GANG		24
> +#define PWM_SIFIVE_PWMCFG_IP		28
> +
> +/* SIZE_PWMCMP is used to calculate the offset for pwmcmpX registers */
> +#define SIZE_PWMCMP		4
> +#define CMPWIDTH		16

Please add a PWM_SIFIVE_ prefix to these two.

> +struct pwm_sifive_ddata {
> +	struct pwm_chip	chip;
> +	struct notifier_block notifier;
> +	struct clk *clk;
> +	void __iomem *regs;
> +	unsigned int approx_period;
> +	unsigned int real_period;
> +};
> +
> +static inline struct pwm_sifive_ddata *to_pwm_sifive_chip(struct pwm_chi=
p *c)

even though this is inlined I would like this to have use the
pwm_sifive_ prefix, too.

> +{
> +	return container_of(c, struct pwm_sifive_ddata, chip);
> +}
> +
> +static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_devic=
e *dev,
> +				 struct pwm_state *state)
> +{
> +	struct pwm_sifive_ddata *pwm =3D to_pwm_sifive_chip(chip);
> +	u32 duty;
> +
> +	duty =3D readl(pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm * SIZE_PWMCM=
P);
> +
> +	state->period =3D pwm->real_period;
> +	state->duty_cycle =3D ((u64)duty * pwm->real_period) >> CMPWIDTH;
> +	state->polarity =3D PWM_POLARITY_INVERSED;
> +	state->enabled =3D duty > 0;
> +}
> +
> +static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *de=
v,
> +			    struct pwm_state *state)
> +{
> +	struct pwm_sifive_ddata *pwm =3D to_pwm_sifive_chip(chip);
> +	unsigned int duty_cycle;
> +	u32 frac, val;
> +
> +	if (state->polarity !=3D PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	if (state->period !=3D pwm->real_period)
> +		return -EINVAL;
> +
> +	duty_cycle =3D state->duty_cycle;
> +	if (!state->enabled)
> +		duty_cycle =3D 0;
> +
> +	frac =3D div_u64((u64)duty_cycle * 0xFFFF, state->period);
> +	frac =3D min(frac, 0xFFFFU);

If CMPWIDTH was only 8, we'd need 0xff here instead of 0xffff, right? So
better use

	(1 << PWM_SIFIVE_CMPWIDTH) - 1

here, maybe "hidden" behind a cpp define.

In a previous review round I had doubts about the calculation of frac
and I think they were addressed wrongly.
Looking at the figure at the start of chapter 14.9 in the reference
manual: They use (different than the driver here) pwmcmp0=3D6 and
pwmzerocmp=3D1. Then a period is 7 clock cycles long and pwmcmpX must be 7
(for X > 0) to yield a 100% signal. So pwmcmpX must be greater than or
equal to the period (in clock cycles).

Here we're using pwmzerocmp=3D0, still the constraint

	pwmcmpX >=3D period

must be true for a 100% cycle. (Right?) With pwmzerocmp=3D0 the period is
0x10000 clock cycles, so pwmcmpX must be >=3D 0x10000 to yield a 100%
signal. As this is not possible (pwmcmpX is a 16 bit value that can only
hold up to 0xffff) the output cannot yield 100%.

So I think the most correct implementation here is:

	frac =3D (duty_cycle * (1 << PWM_SIFIVE_CMPWIDTH) + (1 << PWM_SIFIVE_CMPWI=
DTH) / 2) / period;
	/* Sorry, we cannot do 100% :-( */
	frac =3D min(frac, (1 << PWM_SIFIVE_CMPWIDTH) - 1);

Thierry: What is the correct rounding strategy? I assumed "round to
nearest" (with round half up). If we want something like clk_round_rate
for PWMs in the future rounding down might be easier to handle.

Note that pwm_sifive_get_state is already (well, or still) using this as
it has:

	state->duty_cycle =3D ((u64)duty * pwm->real_period) >> CMPWIDTH;

which always yields something smaller than read_period as duty is
smaller than 1 << PWM_SIFIVE_CMPWIDTH.

I tried to understand the IP source at
https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/=
pwm/PWM.scala
to confirm (or disprove) this theory, but I failed.

Assuming my analysis is true, I'd like to have it documented
prominently in the driver that the hardware cannot generate a 100% duty
cycle.

> +	val =3D readl(pwm->regs + PWM_SIFIVE_PWMCFG);
> +	val |=3D (1 << PWM_SIFIVE_PWMCFG_DEGLITCH);

No parenthesis necessary. You might want to consider using the BIT macro
here, maybe already in the definition of PWM_SIFIVE_PWMCFG_DEGLITCH.

> +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> +
> +	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm * SIZE_PWMCMP);
> +
> +	val &=3D ~(1 << PWM_SIFIVE_PWMCFG_DEGLITCH);
> +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> +
> +	pwm_sifive_get_state(chip, dev, state);

Thierry: This changes the pwm_state. Is this how this should be done?

> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops pwm_sifive_ops =3D {
> +	.get_state =3D pwm_sifive_get_state,
> +	.apply =3D pwm_sifive_apply,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static struct pwm_device *pwm_sifive_xlate(struct pwm_chip *chip,
> +					   const struct of_phandle_args *args)
> +{
> +	struct pwm_sifive_ddata *pwm =3D to_pwm_sifive_chip(chip);
> +	struct pwm_device *dev;
> +
> +	if (args->args[0] >=3D chip->npwm)
> +		return ERR_PTR(-EINVAL);
> +
> +	dev =3D pwm_request_from_chip(chip, args->args[0], NULL);
> +	if (IS_ERR(dev))
> +		return dev;
> +
> +	/* The period cannot be changed on a per-PWM basis */
> +	dev->args.period =3D pwm->real_period;
> +	dev->args.polarity =3D PWM_POLARITY_NORMAL;
> +	if (args->args[1] & PWM_POLARITY_INVERSED)
> +		dev->args.polarity =3D PWM_POLARITY_INVERSED;

The driver does only support PWM_POLARITY_INVERSED. So I guess this
should be:

	dev->args.polarity =3D PWM_POLARITY_INVERSED;
	if (!(args->args[1] & PWM_POLARITY_INVERSED))
		dev_warn(dev, "...");

> +
> +	return dev;
> +}
> +
> +static void pwm_sifive_update_clock(struct pwm_sifive_ddata *pwm,
> +				    unsigned long rate)
> +{
> +	/* (1 << (16+scale)) * 10^9/rate =3D real_period */
> +	unsigned long scale_pow =3D
> +			(pwm->approx_period * (u64)rate) / NSEC_PER_SEC;
> +	int scale =3D clamp(ilog2(scale_pow) - 16, 0, 0xf);

is this 16 in reality PWM_SIFIVE_CMPWIDTH?

> +	writel((1 << PWM_SIFIVE_PWMCFG_EN_ALWAYS) | (scale <<
> +	       PWM_SIFIVE_PWMCFG_SCALE), pwm->regs + PWM_SIFIVE_PWMCFG);
> +
> +	/* As scale <=3D 15 the shift operation cannot overflow. */
> +	pwm->real_period =3D div64_ul(1000000000ULL << (16 + scale), rate);
> +	dev_dbg(pwm->chip.dev, "New real_period =3D %u ns\n", pwm->real_period);
> +}
> +
> +static int pwm_sifive_clock_notifier(struct notifier_block *nb,
> +				     unsigned long event, void *data)
> +{
> +	struct clk_notifier_data *ndata =3D data;
> +	struct pwm_sifive_ddata *pwm =3D
> +		container_of(nb, struct pwm_sifive_ddata, notifier);
> +
> +	if (event =3D=3D POST_RATE_CHANGE)
> +		pwm_sifive_update_clock(pwm, ndata->new_rate);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int pwm_sifive_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct pwm_sifive_ddata *pwm;
> +	struct pwm_chip *chip;
> +	struct resource *res;
> +	int ret;
> +
> +	pwm =3D devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
> +	if (!pwm)
> +		return -ENOMEM;
> +
> +	chip =3D &pwm->chip;
> +	chip->dev =3D dev;
> +	chip->ops =3D &pwm_sifive_ops;
> +	chip->of_xlate =3D pwm_sifive_xlate;
> +	chip->of_pwm_n_cells =3D 2;
> +	chip->base =3D -1;
> +	chip->npwm =3D 4;
> +
> +	ret =3D of_property_read_u32(node, "sifive,period-ns",
> +				   &pwm->approx_period);
> +
> +	if (ret < 0) {
> +		dev_err(dev, "Unable to read sifive,period-ns from DTS\n");
> +		return ret;
> +	}
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	pwm->regs =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(pwm->regs)) {
> +		dev_err(dev, "Unable to map IO resources\n");
> +		return PTR_ERR(pwm->regs);
> +	}
> +
> +	pwm->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(pwm->clk)) {
> +		if (PTR_ERR(pwm->clk) !=3D -EPROBE_DEFER)
> +			dev_err(dev, "Unable to find controller clock\n");
> +		return PTR_ERR(pwm->clk);
> +	}
> +
> +	ret =3D clk_prepare_enable(pwm->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock for pwm: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Watch for changes to underlying clock frequency */
> +	pwm->notifier.notifier_call =3D pwm_sifive_clock_notifier;
> +	ret =3D clk_notifier_register(pwm->clk, &pwm->notifier);
> +	if (ret) {
> +		dev_err(dev, "failed to register clock notifier: %d\n", ret);
> +		goto disable_clk;
> +	}

Would it make sense to only enable the clock when the pwm is enabled?
(If yes, how does the output behave if the clock is disabled while the
hardware is enabled? I assume the output just freezes at the state where
it happens to be?)

> +	/* Initialize PWM config */
> +	pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));
> +
> +	ret =3D pwmchip_add(chip);
> +	if (ret < 0) {
> +		dev_err(dev, "cannot register PWM: %d\n", ret);
> +		goto unregister_clk;
> +	}
> +
> +	platform_set_drvdata(pdev, pwm);
> +	dev_dbg(dev, "SiFive PWM chip registered %d PWMs\n", chip->npwm);
> +
> +	return 0;
> +
> +unregister_clk:
> +	clk_notifier_unregister(pwm->clk, &pwm->notifier);
> +disable_clk:
> +	clk_disable_unprepare(pwm->clk);
> +
> +	return ret;
> +}
> +
> +static int pwm_sifive_remove(struct platform_device *dev)
> +{
> +	struct pwm_sifive_ddata *pwm =3D platform_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pwmchip_remove(&pwm->chip);
> +	clk_notifier_unregister(pwm->clk, &pwm->notifier);
> +	clk_disable_unprepare(pwm->clk);
> +	return ret;
> +}
> +
> +static const struct of_device_id pwm_sifive_of_match[] =3D {
> +	{ .compatible =3D "sifive,pwm0" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, pwm_sifive_of_match);
> +
> +static struct platform_driver pwm_sifive_driver =3D {
> +	.probe =3D pwm_sifive_probe,
> +	.remove =3D pwm_sifive_remove,
> +	.driver =3D {
> +		.name =3D "pwm-sifive",
> +		.of_match_table =3D pwm_sifive_of_match,
> +	},
> +};
> +module_platform_driver(pwm_sifive_driver);
> +
> +MODULE_DESCRIPTION("SiFive PWM driver");
> +MODULE_LICENSE("GPL v2");

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
