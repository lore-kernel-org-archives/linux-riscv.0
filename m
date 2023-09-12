Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4039CA0EF1
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 15:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wHcZLLDl+tQAlqRjmCVVARgw2evQ5ozJWxUrZ0rebnI=; b=0kSjHTyFFMAwx3OzCE6+earD1p
	kVLDlnx4oYMRuV8MQnx8P76RfZ0FxKplQJqUFr1PIxNsEDgQ5b3GXu2lK5UCVL8Pt5X5kb8NPUHaA
	aQgKj1zkTmDSyOCPihs42Ri3rkMh1x1z5QWq/+wt+DLD+y2EbBhsSKQQeZ3qWxXeRh6THEDCLh7b0
	JVrKDNItb42cELIMKQtP6ApFHOj0iY2Gfg4iDnTbzOYQtYq7CSmT0xuIx/m3ZOMJXlKXrXfocP35w
	mXgzeBnyllMGbrx/VD729EHk1hH5JeSCUTJNlJPwevDCf00XHI9xTJUPiuPx8pv1Fs7jj1g1tkulk
	60EqH+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4w2-003gif-1P;
	Tue, 12 Sep 2023 15:04:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4vy-003giF-1x
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 15:04:13 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 20EE43F641
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694531046;
	bh=I+FJ5qUcevTthg+RKBHlanDF25KRUOA3+bky9ouyoIE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SxMOj2eoinmykrc/Vd+bPsIqXcS4/ZRD37bSmVmFLZoIOajlkbPO4wRO9/1+kapfN
	 lpoG/i1m9qkIQsPF02xDkS0agdRTzaFROAP2Y6QT0GA6HSIiPfvkjzvXVBxPzAvcG0
	 nZYq8PoSfkqsSgusrv658Oc2B1Cvyq4gg89P0BXUchaH8elc8gglHh6YK+zk+DHQYv
	 BWg/Fk/szJSU/Yt17eVmxnODb9heWc+xz4EIwta+84Wj/mPrPUN/KOlWOJRqUuzRcz
	 q4YLI4KFYnQwTPRBxY/5+IGTuOz1on08eNBFR2fe7xuR116DaEjG6v/odf6hpVnyle
	 hmyZdMzr55Ykw==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4120b583ab4so59055731cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 08:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694531045; x=1695135845;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+FJ5qUcevTthg+RKBHlanDF25KRUOA3+bky9ouyoIE=;
        b=xHwcmV/bcNAJxdRKz//jCUcPCkSwgil8O+VWbY5Wg30xtDByIG3ptxt682E7chfGbM
         UkZk7cV7YU/2eVi5djyc9Sa/hfHH7m6zlKs8258KXR23yWE4HoZh2qrfRrZugaVWpyD3
         q8WfC9dr1jRfwmgdyMKpqzUlXXiwqZfYUTp3YQ2ggd0BRg/2ZNEVmepKUozKVYb8ByXt
         EM+hY9i+vX1PnJy6+NMYX+LhfZivsENhKOqswE86gChD986nCZtoWJ32t9HdnuEBlc3a
         zxPMLRX0bB7MpGR2TBZZYfK5EjuW0qZoKD48/tbH6PtJqM2jLf4WFSQ9tBPTD1mUwCkI
         DbjA==
X-Gm-Message-State: AOJu0YzguRNtmnV5uCLHJCNYd+VUGgRS0VYI/2vqFxEHHhvOkSTcFaGk
	wAdhVNQWBeQ1/A5LGw/dRWD2SWBtLh8yzUJfdV5HeuDiDTgh0HcNP8eqlhl+tyD3EhIg0NIoIla
	qH/JBc8szYjkyaeYQ2Z8YVPOqn/McAGNUo2Xz67urKKGHb2sDp4yFE556JrFvow==
X-Received: by 2002:ac8:5792:0:b0:412:1e0a:772a with SMTP id v18-20020ac85792000000b004121e0a772amr14240864qta.17.1694531045050;
        Tue, 12 Sep 2023 08:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXJZ9tJtDyqupBORgZnQ2b1zZkE/hgUw5vXIjxSTB1REi9bq2ivOEvuFYhLwnb7XJ11MnS4Bh94PJQPVox+1s=
X-Received: by 2002:ac8:5792:0:b0:412:1e0a:772a with SMTP id
 v18-20020ac85792000000b004121e0a772amr14240794qta.17.1694531044274; Tue, 12
 Sep 2023 08:04:04 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Sep 2023 08:04:03 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230825081328.204442-3-william.qiu@starfivetech.com>
References: <20230825081328.204442-1-william.qiu@starfivetech.com> <20230825081328.204442-3-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 12 Sep 2023 08:04:03 -0700
Message-ID: <CAJM55Z9RsV7qGr6LUckg2XOeS2xjFO8tki3F4LoJj4COQv8dJw@mail.gmail.com>
Subject: Re: [RFC v4 2/4] pwm: starfive: Add PWM driver support
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_080410_801296_7E5DBDB6 
X-CRM114-Status: GOOD (  35.49  )
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

William Qiu wrote:
> Add Pulse Width Modulation driver support for StarFive
> JH7100 and JH7110 SoC.
>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  MAINTAINERS                    |   7 ++
>  drivers/pwm/Kconfig            |   9 ++
>  drivers/pwm/Makefile           |   1 +
>  drivers/pwm/pwm-starfive-ptc.c | 192 +++++++++++++++++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 drivers/pwm/pwm-starfive-ptc.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d590ce31aa72..0e47818c6f64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20299,6 +20299,13 @@ F:	drivers/pinctrl/starfive/pinctrl-starfive-jh71*
>  F:	include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
>  F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
>
> +STARFIVE JH71X0 PWM DRIVERS
> +M:	William Qiu <william.qiu@starfivetech.com>
> +M:	Hal Feng <hal.feng@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml
> +F:	drivers/pwm/pwm-starfive-ptc.c
> +
>  STARFIVE JH71X0 RESET CONTROLLER DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 6210babb0741..48800f33b5c1 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -569,6 +569,15 @@ config PWM_SPRD
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-sprd.
>
> +config PWM_STARFIVE_PTC
> +	tristate "StarFive PWM PTC support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	help
> +	  Generic PWM framework driver for StarFive SoCs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-starfive-ptc.

What is PTC short for? Are there other PWM peripherals on the JH7100 or JH7110
that are not PTCs?

If there are both PTC and non-PTC PWMs on these SoCs then the device tree
compatible strings should reflect that.

If not, maybe just call this driver pwm-starfive / PWM_STARFIVE, or maybe
pwm-starfive-jh7100 / PWM_STARFIVE_JH7110 if you already know the PWMs on the
JH81xx will be different.

> +
>  config PWM_STI
>  	tristate "STiH4xx PWM support"
>  	depends on ARCH_STI || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index c822389c2a24..d2b2a3aeea22 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
>  obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
>  obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
>  obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
> +obj-$(CONFIG_PWM_STARFIVE_PTC)	+= pwm-starfive-ptc.o
>  obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
>  obj-$(CONFIG_PWM_STM32)		+= pwm-stm32.o
>  obj-$(CONFIG_PWM_STM32_LP)	+= pwm-stm32-lp.o
> diff --git a/drivers/pwm/pwm-starfive-ptc.c b/drivers/pwm/pwm-starfive-ptc.c
> new file mode 100644
> index 000000000000..57b5736f6732
> --- /dev/null
> +++ b/drivers/pwm/pwm-starfive-ptc.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PWM driver for the StarFive JH71x0 SoC
> + *
> + * Copyright (C) 2018-2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +/* Access PTC register (CNTR, HRC, LRC and CTRL) */
> +#define REG_PTC_BASE_ADDR_SUB(base, N)	\
> +((base) + (((N) > 3) ? (((N) % 4) * 0x10 + (1 << 15)) : ((N) * 0x10)))

Please indent the line above.

> +#define REG_PTC_RPTC_CNTR(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N))
> +#define REG_PTC_RPTC_HRC(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N) + 0x4)
> +#define REG_PTC_RPTC_LRC(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N) + 0x8)
> +#define REG_PTC_RPTC_CTRL(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N) + 0xC)
> +
> +/* PTC_RPTC_CTRL register bits*/
> +#define PTC_EN      BIT(0)
> +#define PTC_ECLK    BIT(1)
> +#define PTC_NEC     BIT(2)
> +#define PTC_OE      BIT(3)
> +#define PTC_SIGNLE  BIT(4)
> +#define PTC_INTE    BIT(5)
> +#define PTC_INT     BIT(6)
> +#define PTC_CNTRRST BIT(7)
> +#define PTC_CAPTE   BIT(8)
> +
> +struct starfive_pwm_ptc_device {
> +	struct pwm_chip chip;
> +	struct clk *clk;
> +	struct reset_control *rst;
> +	void __iomem *regs;
> +	u32 clk_rate; /* PWM APB clock frequency */
> +};
> +
> +static inline
> +struct starfive_pwm_ptc_device *chip_to_starfive_ptc(struct pwm_chip *c)

This looks weird. Either just put it on a single line or split between the type
and function name. Also there was recently a patch to always name pwm_chip
variables "chip".  Eg.

static inline struct starfive_pwm_ptc_device *
chip_to_starfive_ptc(struct pwm_chip *chip)
{


> +{
> +	return container_of(c, struct starfive_pwm_ptc_device, chip);
> +}
> +
> +static int starfive_pwm_ptc_get_state(struct pwm_chip *chip,
> +				      struct pwm_device *dev,
> +				      struct pwm_state *state)
> +{
> +	struct starfive_pwm_ptc_device *pwm = chip_to_starfive_ptc(chip);
> +	u32 period_data, duty_data, ctrl_data;
> +
> +	period_data = readl(REG_PTC_RPTC_LRC(pwm->regs, dev->hwpwm));
> +	duty_data = readl(REG_PTC_RPTC_HRC(pwm->regs, dev->hwpwm));
> +	ctrl_data = readl(REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
> +
> +	state->period = DIV_ROUND_CLOSEST_ULL((u64)period_data * NSEC_PER_SEC, pwm->clk_rate);
> +	state->duty_cycle = DIV_ROUND_CLOSEST_ULL((u64)duty_data * NSEC_PER_SEC, pwm->clk_rate);
> +	state->polarity = PWM_POLARITY_INVERSED;
> +	state->enabled = (ctrl_data & PTC_EN) ? true : false;
> +
> +	return 0;
> +}
> +
> +static int starfive_pwm_ptc_apply(struct pwm_chip *chip,
> +				  struct pwm_device *dev,
> +				  const struct pwm_state *state)
> +{
> +	struct starfive_pwm_ptc_device *pwm = chip_to_starfive_ptc(chip);
> +	u32 period_data, duty_data, ctrl_data = 0;
> +
> +	if (state->polarity != PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	period_data = DIV_ROUND_CLOSEST_ULL(state->period * pwm->clk_rate,
> +					    NSEC_PER_SEC);
> +	duty_data = DIV_ROUND_CLOSEST_ULL(state->duty_cycle * pwm->clk_rate,
> +					  NSEC_PER_SEC);
> +
> +	writel(period_data, REG_PTC_RPTC_LRC(pwm->regs, dev->hwpwm));
> +	writel(duty_data, REG_PTC_RPTC_HRC(pwm->regs, dev->hwpwm));
> +	writel(0,  REG_PTC_RPTC_CNTR(pwm->regs, dev->hwpwm));
> +
> +	ctrl_data = readl(REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
> +	if (state->enabled)
> +		writel(ctrl_data | PTC_EN | PTC_OE, REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
> +	else
> +		writel(ctrl_data & ~(PTC_EN | PTC_OE), REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops starfive_pwm_ptc_ops = {
> +	.get_state	= starfive_pwm_ptc_get_state,
> +	.apply		= starfive_pwm_ptc_apply,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int starfive_pwm_ptc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct starfive_pwm_ptc_device *pwm;
> +	struct pwm_chip *chip;
> +	int ret;
> +
> +	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
> +	if (!pwm)
> +		return -ENOMEM;
> +
> +	chip = &pwm->chip;
> +	chip->dev = dev;
> +	chip->ops = &starfive_pwm_ptc_ops;
> +	chip->npwm = 8;
> +	chip->of_pwm_n_cells = 3;
> +
> +	pwm->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pwm->regs))
> +		return dev_err_probe(dev, PTR_ERR(pwm->regs),
> +				     "Unable to map IO resources\n");
> +
> +	pwm->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(pwm->clk))
> +		return dev_err_probe(dev, PTR_ERR(pwm->clk),
> +				     "Unable to get pwm's clock\n");

I think you can use devm_clk_get_enabled() here and drop the .clk field and
clk_prepare_enable() and clk_disable_unprepare() calls below.

> +
> +	pwm->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(pwm->rst))
> +		return dev_err_probe(dev, PTR_ERR(pwm->rst),
> +				     "Unable to get pwm's reset\n");
> +
> +	ret = clk_prepare_enable(pwm->clk);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to enable clock for pwm: %d\n", ret);
> +		return ret;
> +	}
> +
> +	reset_control_deassert(pwm->rst);

This returns an int that you ignore. Please don't do that.

> +
> +	pwm->clk_rate = clk_get_rate(pwm->clk);
> +	if (pwm->clk_rate <= 0) {
> +		dev_warn(dev, "Failed to get APB clock rate\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_pwmchip_add(dev, chip);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot register PTC: %d\n", ret);
> +		clk_disable_unprepare(pwm->clk);
> +		reset_control_assert(pwm->rst);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, pwm);
> +
> +	return 0;
> +}
> +
> +static int starfive_pwm_ptc_remove(struct platform_device *dev)
> +{
> +	struct starfive_pwm_ptc_device *pwm = platform_get_drvdata(dev);
> +
> +	reset_control_assert(pwm->rst);
> +	clk_disable_unprepare(pwm->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id starfive_pwm_ptc_of_match[] = {
> +	{ .compatible = "starfive,jh7100-pwm" },
> +	{ .compatible = "starfive,jh7110-pwm" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, starfive_pwm_ptc_of_match);
> +
> +static struct platform_driver starfive_pwm_ptc_driver = {
> +	.probe = starfive_pwm_ptc_probe,
> +	.remove = starfive_pwm_ptc_remove,
> +	.driver = {
> +		.name = "pwm-starfive-ptc",
> +		.of_match_table = starfive_pwm_ptc_of_match,
> +	},
> +};
> +module_platform_driver(starfive_pwm_ptc_driver);
> +
> +MODULE_AUTHOR("Jieqin Chen");
> +MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive PWM PTC driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
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
