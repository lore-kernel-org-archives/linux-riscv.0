Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F8EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 22:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4F320866
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 22:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kvn5RFAf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4F320866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ag6nTt+kUQMp9ZErZFz0XFAEiKXzvF9ti2xgCBttvSI=; b=kvn5RFAfVOiUcd
	YLguI4M2J53b7EpOU1bXvAMizuS9WUpyKy7NNO6P6Gv9TwLw1625PgVXu3ZJ7NbU8x+uSi/aSSsJd
	jDOdbM9pIJyavYIC/t4rw0aGa1LN6PJ1jDdIbLZkPWFN/3lmCKTOajyJymB0eJPshT0qdwhz6CEZE
	XBExfQmRDC4PPusK6e9XaXA3ghiiENCvvhNu5XhQyS8fegfl0XfeflC1UHPmpLnfT6K7feJ7nIjIn
	9c8xsDBBFdvxZanT+VcC0yfC44do9zotpEoiw+rSlelCrALYIMLmi14sC6QyD4QaRkJesEKjuoB9n
	Spp0sq5jH+CH2N9+m0vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjWlQ-00069Y-WF; Tue, 15 Jan 2019 22:00:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjWlN-000696-HP
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 22:00:51 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gjWlL-0008I7-FB; Tue, 15 Jan 2019 23:00:47 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gjWlK-0000mg-4Z; Tue, 15 Jan 2019 23:00:46 +0100
Date: Tue, 15 Jan 2019 23:00:46 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190115220046.etgbno6ymsux75dk@pengutronix.de>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_140049_894287_FC9A5068 
X-CRM114-Status: GOOD (  30.66  )
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

On Fri, Jan 11, 2019 at 01:52:44PM +0530, Yash Shah wrote:
> Adds a PWM driver for PWM chip present in SiFive's HiFive Unleashed SoC.
> =

> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-sifive.c | 246 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 drivers/pwm/pwm-sifive.c
> =

> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index a8f47df..3bcaf6a 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -380,6 +380,16 @@ config PWM_SAMSUNG
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-samsung.
>  =

> +config PWM_SIFIVE
> +	tristate "SiFive PWM support"
> +	depends on OF
> +	depends on COMMON_CLK

I'd say add:

	depends on MACH_SIFIVE || COMPILE_TEST

(I guess "MACH_SIFIVE" is wrong, but I assume you get what I mean.)

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
> index 0000000..7fee809
> --- /dev/null
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2017-2018 SiFive
> + * For SiFive's PWM IP block documentation please refer Chapter 14 of
> + * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf

I wonder if such an instance should be only a single PWM instead of
four. Then you were more flexible with the period lengths (using
pwmcfg.pwmzerocmp) and could do stuff like inverted and uninverted mode.

I didn't understand how the deglitch logic works yet. Currently it is
not used which might result in four edges in a single period (which is
bad).

> + */
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/slab.h>
> +
> +/* Register offsets */
> +#define REG_PWMCFG		0x0
> +#define REG_PWMCOUNT		0x8
> +#define REG_PWMS		0x10
> +#define REG_PWMCMP0		0x20

I suggest a common prefix for these defines. Something like
PWM_SIFIVE_

> +
> +/* PWMCFG fields */
> +#define BIT_PWM_SCALE		0
> +#define BIT_PWM_STICKY		8
> +#define BIT_PWM_ZERO_ZMP	9

the manual calls this "pwmzerocmp".

> +#define BIT_PWM_DEGLITCH	10
> +#define BIT_PWM_EN_ALWAYS	12
> +#define BIT_PWM_EN_ONCE		13
> +#define BIT_PWM0_CENTER		16
> +#define BIT_PWM0_GANG		24
> +#define BIT_PWM0_IP		28

Also a common prefix please. Something like PWM_SIFIVE_PWMCFG_ seems
sensible.

> +#define SIZE_PWMCMP		4

Please describe what this constant means. I think this is "ncmp" in the
reference manual. If so, using PWM_SIFIVE_NCMP as name instead seems
adequate.

> +#define MASK_PWM_SCALE		0xf

MASK_PWM_SCALE is unused, please drop it.

> +struct sifive_pwm_device {
> +	struct pwm_chip	chip;
> +	struct notifier_block notifier;
> +	struct clk *clk;
> +	void __iomem *regs;
> +	unsigned int approx_period;
> +	unsigned int real_period;
> +};

I'd call this pwm_sifive_ddata. The prefix because the driver is called
pwm-sifive and ddata because this is driver data and not a device.

> +static inline struct sifive_pwm_device *to_sifive_pwm_chip(struct pwm_ch=
ip *c)
> +{
> +	return container_of(c, struct sifive_pwm_device, chip);
> +}
> +
> +static void sifive_pwm_get_state(struct pwm_chip *chip, struct pwm_devic=
e *dev,
> +				 struct pwm_state *state)

given that the driver is called pwm-sifive, please use pwm_sifive as
function prefix.

> +{
> +	struct sifive_pwm_device *pwm =3D to_sifive_pwm_chip(chip);
> +	u32 duty;
> +
> +	duty =3D readl(pwm->regs + REG_PWMCMP0 + dev->hwpwm * SIZE_PWMCMP);
> +
> +	state->period =3D pwm->real_period;
> +	state->duty_cycle =3D ((u64)duty * pwm->real_period) >> 16;

In the reference manual this 16 is called "cmpwidth" I think. If I
understand correctly this might in theory be different from 16, so it
would be great if this would be at least a cpp symbol for now.

> +	state->polarity =3D PWM_POLARITY_INVERSED;
> +	state->enabled =3D duty > 0;
> +}
> +
> +static int sifive_pwm_apply(struct pwm_chip *chip, struct pwm_device *de=
v,
> +			    struct pwm_state *state)
> +{
> +	struct sifive_pwm_device *pwm =3D to_sifive_pwm_chip(chip);
> +	unsigned int duty_cycle;
> +	u32 frac;
> +
> +	if (state->polarity !=3D PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	duty_cycle =3D state->duty_cycle;
> +	if (!state->enabled)
> +		duty_cycle =3D 0;
> +
> +	frac =3D div_u64((u64)duty_cycle << 16, state->period);
> +	frac =3D min(frac, 0xFFFFU);

In the previous review round I asked here:

| Also if real_period is for example 10 ms and the consumer requests
| duty=3D12 ms + period=3D100 ms, the hardware is configured for duty=3D1.2=
 ms +
| period=3D10 ms, right?

which you confirmed. IMHO this is not acceptable. If the period is
fixed, you should return -EINVAL (I think) if a different period is
requested.

> +	writel(frac, pwm->regs + REG_PWMCMP0 + dev->hwpwm * SIZE_PWMCMP);

If you get a constant inactive output with frac=3D0 and a constant active
output with frac=3D0xffff the calculation above seems wrong to me.
(A value i written to the pwmcmpX register means a duty cycle of
(i * period / 0xffff). Your calculation assumes a divisor of 0x10000
however.)

> +
> +	if (state->enabled)
> +		sifive_pwm_get_state(chip, dev, state);

@Thierry: Should we bless this correction of state?

> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops sifive_pwm_ops =3D {
> +	.get_state =3D sifive_pwm_get_state,
> +	.apply =3D sifive_pwm_apply,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static struct pwm_device *sifive_pwm_xlate(struct pwm_chip *chip,
> +					   const struct of_phandle_args *args)
> +{
> +	struct sifive_pwm_device *pwm =3D to_sifive_pwm_chip(chip);
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
> +
> +	return dev;
> +}
> +
> +static void sifive_pwm_update_clock(struct sifive_pwm_device *pwm,
> +				    unsigned long rate)
> +{
> +	/* (1 << (16+scale)) * 10^9/rate =3D real_period */
> +	unsigned long scale_pow =3D (pwm->approx_period * (u64)rate) / 10000000=
00;

NSEC_PER_SEC instead of 1000000000

> +	int scale =3D clamp(ilog2(scale_pow) - 16, 0, 0xf);
> +
> +	writel((1 << BIT_PWM_EN_ALWAYS) | (scale << BIT_PWM_SCALE),
> +	       pwm->regs + REG_PWMCFG);
> +
> +	/* As scale <=3D 15 the shift operation cannot overflow. */
> +	pwm->real_period =3D div64_ul(1000000000ULL << (16 + scale), rate);
> +	dev_dbg(pwm->chip.dev, "New real_period =3D %u ns\n", pwm->real_period);
> +}
> +
> +static int sifive_pwm_clock_notifier(struct notifier_block *nb,
> +				     unsigned long event, void *data)
> +{
> +	struct clk_notifier_data *ndata =3D data;
> +	struct sifive_pwm_device *pwm =3D
> +		container_of(nb, struct sifive_pwm_device, notifier);
> +
> +	if (event =3D=3D POST_RATE_CHANGE)
> +		sifive_pwm_update_clock(pwm, ndata->new_rate);

Does this need locking? (Maybe not with the current state.)

> +
> +	return NOTIFY_OK;
> +}
> +
> +static int sifive_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct sifive_pwm_device *pwm;
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
> +	chip->ops =3D &sifive_pwm_ops;
> +	chip->of_xlate =3D sifive_pwm_xlate;
> +	chip->of_pwm_n_cells =3D 2;
> +	chip->base =3D -1;
> +	chip->npwm =3D 4;
> +
> +	ret =3D of_property_read_u32(node, "sifive,approx-period-ns",
> +				   &pwm->approx_period);
> +	if (ret < 0) {
> +		dev_err(dev, "Unable to read sifive,approx-period from DTS\n");
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
> +	pwm->notifier.notifier_call =3D sifive_pwm_clock_notifier;
> +	ret =3D clk_notifier_register(pwm->clk, &pwm->notifier);
> +	if (ret) {
> +		dev_err(dev, "failed to register clock notifier: %d\n", ret);
> +		clk_disable_unprepare(pwm->clk);
> +		return ret;
> +	}
> +
> +	/* Initialize PWM config */
> +	sifive_pwm_update_clock(pwm, clk_get_rate(pwm->clk));
> +
> +	ret =3D pwmchip_add(chip);
> +	if (ret < 0) {
> +		dev_err(dev, "cannot register PWM: %d\n", ret);
> +		clk_notifier_unregister(pwm->clk, &pwm->notifier);
> +		clk_disable_unprepare(pwm->clk);
> +		return ret;
> +	}

Can you please use a common error path using goto?

> +	platform_set_drvdata(pdev, pwm);
> +	dev_dbg(dev, "SiFive PWM chip registered %d PWMs\n", chip->npwm);
> +
> +	return 0;
> +}
> +
> +static int sifive_pwm_remove(struct platform_device *dev)
> +{
> +	struct sifive_pwm_device *pwm =3D platform_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pwmchip_remove(&pwm->chip);
> +	clk_notifier_unregister(pwm->clk, &pwm->notifier);
> +	clk_disable_unprepare(pwm->clk);
> +	return ret;
> +}
> +
> +static const struct of_device_id sifive_pwm_of_match[] =3D {
> +	{ .compatible =3D "sifive,pwm0" },
> +	{ .compatible =3D "sifive,fu540-c000-pwm" },

Do you really need both compatible strings here?

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sifive_pwm_of_match);
> +
> +static struct platform_driver sifive_pwm_driver =3D {
> +	.probe =3D sifive_pwm_probe,
> +	.remove =3D sifive_pwm_remove,
> +	.driver =3D {
> +		.name =3D "pwm-sifive",
> +		.of_match_table =3D sifive_pwm_of_match,
> +	},
> +};
> +module_platform_driver(sifive_pwm_driver);
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
