Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6557E80ABC
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qe/BCDG8akWbHLHyJj99PGlwgjYDtHfBkZU5EYADkpY=; b=b0ojqcDim4vYMgSJcFFBzfx9sL
	7plysE6TEvk259N5TffR1RfXH8kJlSOoyaT68Wija6qBFwTWbC1EKckD3SKS9QtsNk8MsCfOr5jfD
	cPY4tXobQ+jTXCrvQ38avZVwksf7STCGYhRz+ca0g/PK9sZU9J4V5f7cTJ1LLChpemhX+NmNygeIu
	bOF2fdeMbfpCTqp5Tpy7tMx1iyGekQbALRErCJ/DDmXQt0ItHPjr4SeiVBQaROx+V8eHuOVnOINcO
	k5fdCty4KxqDCgJMjs0DbyIjRakVc+BZGrCMPm8ohIKnqgWVTHpQwavIhogsN5Wu8Y+ntuKYIieKS
	qqHp4Y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBdu-007mtZ-0E;
	Fri, 29 Sep 2023 11:26:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBdp-007msb-32
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 11:26:44 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0E85F3F626
	for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1695986798;
	bh=Fxf1lvJPvb3Kv1uSBbUjPweQB0kuuklhii+t73FLamY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Dll7TOJfqj/iDYNMNYnSTApCdK4tkMAsaaHvW8Fzxyfak5UsGaigvMlxiURNFGJAV
	 e/ZDH1ORLFDuwH+xxjpcKu1Nbvusf1ptg2Q0E5Pd1cyNLU+UFoo1+jRHtTpeePEsDz
	 cKGvwhcpazLEEqlBpBP8LqlSsiVT98Zqp2/7zMF0me3UzrNGOTyePoS7/tntAXh++u
	 9Ye0oIXPCw9DaK2+2eDiunarQ1UVJkn96UR1BkC1LuLGHT0ekpyBd2XXXPCbIa5/9E
	 5okiCvtOY+ClwJ3sulkwU3pMzFnkTmPq0TRv8PEvUOxieldytN25xmXR2l08ZivjBs
	 TRGNDBU1Ky98w==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4180b3a5119so182993241cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 04:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695986797; x=1696591597;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxf1lvJPvb3Kv1uSBbUjPweQB0kuuklhii+t73FLamY=;
        b=Rpe90/YOUhdXPyPmhaoLP6fSUEd5Oi2WfKVdw+MCdULu+cDQB5k2XjNtq9AQcEG0eR
         Gy/JOsHo1bwVdj9ZpxmdJ2nGk7HvOjHDNBgloHiebiSEFOwro6nl1fDOmQZtcg1SlJLh
         RKEXT3vqbaL/ztK/kas9oAYGD90BSUCxcniQLk8KfW7tm4clRxp08kfiTEQb0a+ZbPYD
         AAxzoSZB8loNQyCgJXQSJhcdKltfm8KbjIPXroPcZXKMVcs2wOeHFWASJBot4QyjF3ku
         /54cMI6FZ6Qhb1230mBbeR1gaw34vYS9VJGHiw48uR6aMpBpZYQ+VXwk9zCjLZGbQ+K4
         Pygw==
X-Gm-Message-State: AOJu0Yxq/3+E8JtJIleqERXaawGFlvuZmQQaRerNjoW9Gb08sroQDbdj
	ZvcVTbXUaPYQQ65runCwG8c2iUnO64eJS+pw9aQH59X8pBjO15X1mLOkBK1bPHKqG5douq61nwo
	9Is3K0tKqrbtzhO+ACbc23bul+SQFTNpJoti23fQWloZStheAl0qOp6stKXDkdA==
X-Received: by 2002:ac8:5b11:0:b0:418:16d6:5a8d with SMTP id m17-20020ac85b11000000b0041816d65a8dmr5210074qtw.19.1695986796957;
        Fri, 29 Sep 2023 04:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg2YS80s8kcYdHWuFJ9syzZApUgYuDHgdtax9I8vSgakg9zGY+D15JXE+dI0icZyE/+yximve2DOD8H5mq6Wc=
X-Received: by 2002:ac8:5b11:0:b0:418:16d6:5a8d with SMTP id
 m17-20020ac85b11000000b0041816d65a8dmr5210054qtw.19.1695986796548; Fri, 29
 Sep 2023 04:26:36 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Sep 2023 04:26:35 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230928170254.413-3-jszhang@kernel.org>
References: <20230928170254.413-1-jszhang@kernel.org> <20230928170254.413-3-jszhang@kernel.org>
Mime-Version: 1.0
Date: Fri, 29 Sep 2023 04:26:35 -0700
Message-ID: <CAJM55Z9sbi5zMPSagDH2Za0mqsBr3004Tn_Zn2Gy90MiKizYcQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: add T-HEAD PWM driver
To: Jisheng Zhang <jszhang@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_042642_422362_E6538698 
X-CRM114-Status: GOOD (  35.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Jisheng Zhang wrote:
> T-HEAD SoCs such as the TH1520 contain a PWM controller used
> among other things to control the LCD backlight, fan and so on.
> Add driver for it.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS             |   1 +
>  drivers/pwm/Kconfig     |  11 ++
>  drivers/pwm/Makefile    |   1 +
>  drivers/pwm/pwm-thead.c | 289 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 302 insertions(+)
>  create mode 100644 drivers/pwm/pwm-thead.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d55e40060c46..86cf0926dbfc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18482,6 +18482,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/usb/dwc3/dwc3-thead.c
> +F:	drivers/pwm/pwm-thead.c
>
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 8ebcddf91f7b..428fa365a19a 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -637,6 +637,17 @@ config PWM_TEGRA
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-tegra.
>
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
>  	depends on ARCH_OMAP2PLUS || ARCH_DAVINCI_DA8XX || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index c822389c2a24..4c317e6316e8 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_PWM_STMPE)		+= pwm-stmpe.o
>  obj-$(CONFIG_PWM_SUN4I)		+= pwm-sun4i.o
>  obj-$(CONFIG_PWM_SUNPLUS)	+= pwm-sunplus.o
>  obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
> +obj-$(CONFIG_PWM_THEAD)		+= pwm-thead.o
>  obj-$(CONFIG_PWM_TIECAP)	+= pwm-tiecap.o
>  obj-$(CONFIG_PWM_TIEHRPWM)	+= pwm-tiehrpwm.o
>  obj-$(CONFIG_PWM_TWL)		+= pwm-twl.o
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

Hi Jisheng,

I'd be worried that these defines one day clash with the PWM framework. Maybe
just keep the LIGHT_PWM_ prefix?

> +
> +struct thead_pwm_chip {
> +	struct clk *clk;
> +	void __iomem *mmio_base;
> +	struct pwm_chip chip;
> +};
> +
> +#define to_thead_pwm_chip(chip)		container_of(chip, struct thead_pwm_chip, chip)
> +
> +static int thead_pwm_clk_prepare_enable(struct thead_pwm_chip *pc)
> +{
> +	return clk_prepare_enable(pc->clk);
> +}
> +
> +static void thead_pwm_clk_disable_unprepare(struct thead_pwm_chip *pc)
> +{
> +	clk_disable_unprepare(pc->clk);
> +}

These two wrappers don't seem to add a lot of value compared to just writing
clk_*(pc->clk) directly and they're not used as callbacks.

> +
> +static int thead_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct thead_pwm_chip *pc = to_thead_pwm_chip(chip);
> +	u32 value;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(chip->dev);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "failed to clock on the pwm device(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	value = readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	value |= PWM_START;
> +	writel(value, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	return 0;
> +}
> +
> +static void thead_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct thead_pwm_chip *pc = to_thead_pwm_chip(chip);
> +	u32 value;
> +
> +	value = readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	value &= ~PWM_START;
> +	writel(value, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	pm_runtime_put_sync(chip->dev);
> +}
> +
> +static int thead_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> +			    int duty_ns, int period_ns)
> +{
> +	struct thead_pwm_chip *pc = to_thead_pwm_chip(chip);
> +	unsigned long rate = clk_get_rate(pc->clk);
> +	unsigned long duty_cycle, period_cycle;
> +	u32 pwm_cfg = PWM_INFACTOUT | PWM_FPOUT | PWM_CONTINUOUS_MODE | PWM_INT_EN;
> +	int ret;
> +
> +	if (duty_ns > period_ns) {
> +		dev_err(chip->dev, "invalid pwm configure\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = pm_runtime_get_sync(chip->dev);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "failed to clock on the pwm device(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	writel(pwm_cfg, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	period_cycle = period_ns * rate;
> +	do_div(period_cycle, NSEC_PER_SEC);

I thought do_div() was only needed to do 64bit by 32bit divisions on
32bit hardware, but here
period_cycle is an unsigned long, so only 32bit on 32bit hardware.

> +	writel(period_cycle, pc->mmio_base + LIGHT_PWM_PER(pwm->hwpwm));
> +
> +	duty_cycle = duty_ns * rate;
> +	do_div(duty_cycle, NSEC_PER_SEC);

Same as above.

> +	writel(duty_cycle, pc->mmio_base + LIGHT_PWM_FP(pwm->hwpwm));
> +
> +	pwm_cfg = readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	pwm_cfg |= PWM_CFG_UPDATE;
> +	writel(pwm_cfg, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	pm_runtime_put_sync(chip->dev);
> +
> +	return 0;
> +}
> +
> +static int thead_pwm_set_polarity(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  enum pwm_polarity polarity)
> +{
> +	struct thead_pwm_chip *pc = to_thead_pwm_chip(chip);
> +	u32 value = readl(pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(chip->dev);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "failed to clock on the pwm device(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (polarity == PWM_POLARITY_NORMAL)
> +		value |= PWM_FPOUT;
> +	else
> +		value &= ~PWM_FPOUT;
> +
> +	writel(value, pc->mmio_base + LIGHT_PWM_CTRL(pwm->hwpwm));
> +
> +	pm_runtime_put_sync(chip->dev);
> +
> +	return 0;
> +}
> +
> +static int thead_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	int err;
> +	bool enabled = pwm->state.enabled;
> +
> +	if (state->polarity != pwm->state.polarity)
> +		thead_pwm_set_polarity(chip, pwm, state->polarity);
> +
> +	if (!state->enabled) {
> +		if (enabled)
> +			thead_pwm_disable(chip, pwm);
> +		return 0;
> +	}
> +
> +	err = thead_pwm_config(chip, pwm, state->duty_cycle, state->period);
> +	if (err)
> +		return err;
> +
> +	if (!enabled)
> +		return thead_pwm_enable(chip, pwm);
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops thead_pwm_ops = {
> +	.apply = thead_pwm_apply,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int __maybe_unused thead_pwm_runtime_suspend(struct device *dev)
> +{
> +	struct thead_pwm_chip *pc = dev_get_drvdata(dev);
> +
> +	thead_pwm_clk_disable_unprepare(pc);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused thead_pwm_runtime_resume(struct device *dev)
> +{
> +	struct thead_pwm_chip *pc = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = thead_pwm_clk_prepare_enable(pc);
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
> +	pc = devm_kzalloc(&pdev->dev, sizeof(*pc), GFP_KERNEL);
> +	if (!pc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pc);
> +
> +	pc->mmio_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pc->mmio_base))
> +		return PTR_ERR(pc->mmio_base);
> +
> +	pc->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(pc->clk))
> +		return PTR_ERR(pc->clk);

A lot of other drivers have something like
return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk), "failed to get clock\n");
when failing to get clocks.

> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
> +	ret = thead_pwm_clk_prepare_enable(pc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable pwm clock(%d)\n", ret);
> +		goto err_pm_disable;
> +	}
> +
> +	pc->chip.ops = &thead_pwm_ops;
> +	pc->chip.dev = &pdev->dev;
> +	pc->chip.npwm = MAX_PWM_NUM;
> +
> +	ret = pwmchip_add(&pc->chip);
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

Here you disable the clock and then pm_runtime_disable()..

> +	return ret;
> +}
> +
> +static void thead_pwm_remove(struct platform_device *pdev)
> +{
> +	struct thead_pwm_chip *pc = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	thead_pwm_clk_disable_unprepare(pc);

..but here it's the other way around. It may not make a difference, but let's
be consistent anyway.

> +	pwmchip_remove(&pc->chip);
> +}
> +
> +static const struct of_device_id thead_pwm_dt_ids[] = {
> +	{.compatible = "thead,th1520-pwm",},
> +	{/* sentinel */}
> +};
> +
> +static const struct dev_pm_ops thead_pwm_pm_ops = {
> +	SET_RUNTIME_PM_OPS(thead_pwm_runtime_suspend, thead_pwm_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver thead_pwm_driver = {
> +	.driver = {
> +		.name = "thead-pwm",
> +		.of_match_table = thead_pwm_dt_ids,
> +		.pm = &thead_pwm_pm_ops,
> +	},
> +	.probe = thead_pwm_probe,
> +	.remove_new = thead_pwm_remove,
> +};
> +module_platform_driver(thead_pwm_driver);
> +
> +MODULE_AUTHOR("wei.liu <lw312886@linux.alibaba.com>");

wei.liu is a very uncommon name, do you mean Wei Liu?

> +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> +MODULE_DESCRIPTION("T-HEAD pwm driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
