Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE1CC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 10:35:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C3DF2190A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 10:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3s6U9mG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C3DF2190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XynI2lGBbqrNhoN8wm2/eT/m+v4GsgvNNRBFE+XCd4=; b=N3s6U9mGnUpRf/
	KdzfGOrLf5Wkek17sCbfG0sN8x9nLPyITBBzmXt0lJxxUY2RQOYFoFdjO1PlXnj072na4Pv3Q565f
	8Ia5djZWwUTdvrVh9x99qmDpZqMHg7n3vmG0NkhmGEKXSKUVzSQBPzU7VPEt03a4bsbE3jiPog615
	esq041g8zFwspoa/N3iWNhSHIu+WVcHTCZmoZOmzlGGKcvW9z+2JJcOFiUwii3arWMFihyx9/vOmy
	+RRmBMCdbV9tNBkVd5Duk9x52D9OO0gZ+duGVdJAWCBDHuHs/9fusxPl+4/GYAzSdDpklkbSFYEia
	hKWhI6KrwI0Q1zgw0Wjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtrsj-0001h8-J6; Wed, 13 Feb 2019 10:35:09 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtrse-0000SH-NK
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 10:35:07 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gtrsa-00043V-67; Wed, 13 Feb 2019 11:35:00 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gtrsZ-00057U-7b; Wed, 13 Feb 2019 11:34:59 +0100
Date: Wed, 13 Feb 2019 11:34:59 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v6 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190213103459.t5bvemxrb2x6iagm@pengutronix.de>
References: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
 <1550049978-20705-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1550049978-20705-3-git-send-email-yash.shah@sifive.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_023504_924795_71287C75 
X-CRM114-Status: GOOD (  27.16  )
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

On Wed, Feb 13, 2019 at 02:56:18PM +0530, Yash Shah wrote:
> Adds a PWM driver for PWM chip present in SiFive's HiFive Unleashed SoC.
> =

> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/pwm/Kconfig      |  11 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-sifive.c | 311 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 323 insertions(+)
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
> index 0000000..c0eb90e
> --- /dev/null
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -0,0 +1,311 @@
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

PWM_SIFIVE_PWMCFG_EN_ALWAYS is always used as

	BIT(PWM_SIFIVE_PWMCFG_EN_ALWAYS)

so defining this as BIT(12) directly makes some expressions below easier
to read.

> +#define PWM_SIFIVE_PWMCFG_EN_ONCE	13
> +#define PWM_SIFIVE_PWMCFG_CENTER	16
> +#define PWM_SIFIVE_PWMCFG_GANG		24
> +#define PWM_SIFIVE_PWMCFG_IP		28
> +
> +/* PWM_SIFIVE_SIZE_PWMCMP is used to calculate offset for pwmcmpX regist=
ers */
> +#define PWM_SIFIVE_SIZE_PWMCMP		4
> +#define PWM_SIFIVE_CMPWIDTH		16
> +
> +struct pwm_sifive_ddata {
> +	struct pwm_chip	chip;
> +	struct notifier_block notifier;
> +	struct clk *clk;
> +	void __iomem *regs;
> +	unsigned int real_period;
> +	int user_count;
> +};
> +
> +static inline
> +struct pwm_sifive_ddata *pwm_sifive_chip_to_ddata(struct pwm_chip *c)
> +{
> +	return container_of(c, struct pwm_sifive_ddata, chip);
> +}
> +
> +static int pwm_sifive_request(struct pwm_chip *chip, struct pwm_device *=
dev)
> +{
> +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> +
> +	pwm->user_count++;
> +
> +	return 0;
> +}
> +
> +static void pwm_sifive_free(struct pwm_chip *chip, struct pwm_device *de=
v)
> +{
> +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> +
> +	pwm->user_count--;
> +}
> +
> +static void pwm_sifive_update_clock(struct pwm_sifive_ddata *pwm,
> +				    unsigned long rate)
> +{
> +	/* (1 << (16+scale)) * 10^9/rate =3D real_period */

Maybe you want to mention here the relation between 16 and
PWM_SIFIVE_CMPWIDTH.

> +	unsigned long scale_pow =3D
> +			div64_ul(pwm->real_period * (u64)rate, NSEC_PER_SEC);
> +	int scale =3D clamp(ilog2(scale_pow) - PWM_SIFIVE_CMPWIDTH, 0, 0xf);
> +
> +	writel((1 << PWM_SIFIVE_PWMCFG_EN_ALWAYS) | (scale <<
> +	       PWM_SIFIVE_PWMCFG_SCALE), pwm->regs + PWM_SIFIVE_PWMCFG);

I think this would be better readable with the newline after the |. With
my editor's configuration when broken like this, the 2nd line would be
intended with the opening ( after the |.

> +
> +	/* As scale <=3D 15 the shift operation cannot overflow. */
> +	pwm->real_period =3D div64_ul(1000000000ULL << (PWM_SIFIVE_CMPWIDTH +
> +				    scale), rate);

ditto. Maybe break after the =3D?

> +	dev_dbg(pwm->chip.dev, "New real_period =3D %u ns\n", pwm->real_period);
> +}
> +
> +static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_devic=
e *dev,
> +				 struct pwm_state *state)
> +{
> +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> +	u32 duty;
> +	int val;
> +
> +	duty =3D readl(pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm *
> +		     PWM_SIFIVE_SIZE_PWMCMP);
> +
> +	val =3D readl(pwm->regs + PWM_SIFIVE_PWMCFG);
> +	state->enabled =3D (val & BIT(PWM_SIFIVE_PWMCFG_EN_ALWAYS)) > 0;
> +
> +	val &=3D 0x0F;
> +	pwm->real_period =3D div64_ul(1000000000ULL << (PWM_SIFIVE_CMPWIDTH +
> +				    val), clk_get_rate(pwm->clk));

Another bad line break.

> +
> +	state->period =3D pwm->real_period;
> +	state->duty_cycle =3D ((u64)duty * pwm->real_period) >>
> +			    PWM_SIFIVE_CMPWIDTH;
> +	state->polarity =3D PWM_POLARITY_INVERSED;
> +}
> +
> +static int pwm_sifive_enable(struct pwm_chip *chip, struct pwm_device *d=
ev,
> +			     bool enable)
> +{
> +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> +	u32 val;
> +	int ret;
> +
> +	if (enable) {
> +		ret =3D clk_enable(pwm->clk);
> +		if (ret) {
> +			dev_err(pwm->chip.dev, "Enable clk failed:%d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	val =3D readl(pwm->regs + PWM_SIFIVE_PWMCFG);
> +
> +	if (enable)
> +		val |=3D BIT(PWM_SIFIVE_PWMCFG_EN_ALWAYS);
> +	else
> +		val &=3D ~BIT(PWM_SIFIVE_PWMCFG_EN_ALWAYS);
> +
> +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> +
> +	if (!enable)
> +		clk_disable(pwm->clk);

A disabled PWM is supposed to output an inactive signal. If the PWM runs
at (near) 100% and you disable it, does it reliably give that inactive
signal after completing the currently running period?

> +
> +	return 0;
> +}
> +
> +static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *de=
v,
> +			    struct pwm_state *state)
> +{
> +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> +	unsigned int duty_cycle;
> +	u32 frac, val;
> +	struct pwm_state cur_state;
> +	bool enabled;
> +	int ret;
> +
> +	pwm_get_state(dev, &cur_state);
> +	enabled =3D cur_state.enabled;
> +
> +	if (state->polarity !=3D PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	if (state->period !=3D cur_state.period) {
> +		if (pwm->user_count !=3D 1)
> +			return -EINVAL;

I think we need locking here. Consider two pwm users on two CPUs:

	CPU1					CPU2
	pwm_sifive_apply(pwm0, period=3DA, ...)
	 check user_count=3D=3D1 -> good
	 ...					pwm1 =3D pwm_get(...)
	 ...					pwm_sifive_apply(pwm1, period=3DB...)
	 ...					  configure based on B
	 pwm_sifive_update_clock()

Also I wonder if we should change the period if the user requested
enabled=3Dfalse.

> +		pwm->real_period =3D state->period;
> +		pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));

If you change from

	.period =3D A
	.duty_cycle =3D B

to

	.period =3D C
	.duty_cycle =3D D

the output pin might see a period with

	.period =3D C
	.duty_cycle =3D B

right? I think this is not fixable, but this needs a prominent comment.

> +	}
> +
> +	if (!state->enabled && enabled) {
> +		ret =3D pwm_sifive_enable(chip, dev, false);
> +		if (ret)
> +			return ret;
> +		enabled =3D false;
> +	}
> +
> +	duty_cycle =3D state->duty_cycle;
> +	frac =3D div_u64((u64)duty_cycle * (1 << PWM_SIFIVE_CMPWIDTH) +
> +		       (1 << PWM_SIFIVE_CMPWIDTH) / 2, state->period);
> +	/* The hardware cannot generate a 100% duty cycle */

@Thierry: Do you consider this bad enough that pwm_apply_state should
fail if 100% is requested?

> +	frac =3D min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
> +
> +	val =3D readl(pwm->regs + PWM_SIFIVE_PWMCFG);
> +	val |=3D BIT(PWM_SIFIVE_PWMCFG_DEGLITCH);
> +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> +
> +	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm *
> +	       PWM_SIFIVE_SIZE_PWMCMP);
> +
> +	val &=3D ~BIT(PWM_SIFIVE_PWMCFG_DEGLITCH);

Doesn't that come too early? I thought the right thing was to keep it
set all the time. With this code I think you might see a duty cycle of
50 when going from 60 to 40.

> +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> +
> +	if (state->enabled !=3D enabled) {
> +		ret =3D pwm_sifive_enable(chip, dev, state->enabled);
> +		if (ret)
> +			return ret;
> +	}

FTR: This doesn't block until the newly configured state is active.

> +
> +	return 0;
> +}

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
