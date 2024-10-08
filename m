Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330D9CED27C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SSSVXjXk6AXJlKFnRauBChGgrHIidrVLlgRA+FmoU0=; b=mfiv6m7qe9IPAR
	/M/tviIGAOAApZkIGIHx+ksFYEWfNedbwttgAejk/PHdOYtKo3k/K4YFkXXrfg6Nnryj17uZQhmi4
	PSeDQp4hgF3t4FGHPEX3CFw/AFO8JzgZp4gUmTGmuUyHUlEBYeY00lVvR6bEvUUFi9bm3k7KJILHH
	7gFb4BjcT1IvRO+LsQbCdrv8CnNOjNByrB/WigzTLCSbbVJWzqMiM4plpuPCAB2GJ/67JnIKIiV0e
	UAu0FcYykVHRwPO8ds1D2JyPW6QvgbJGzrU2fGBa89Njq5++Oyyj1oYQxBBE0nXct19ze/hw1t0Pk
	pmcusigeHtnGL60dYssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5kv-000000055g5-2T39;
	Tue, 08 Oct 2024 08:39:45 +0000
Received: from gofer.mess.org ([88.97.38.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5WU-0000000512V-2ZR8
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 08:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1728375885; bh=p8O/sEYZVbUMhVZQJSEP2Q1Ny12LP28b8VlON+FkH54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4dTXIaI6Bnt8yB3TnEYNb+az8JLv5lvmWJWGjc/PndukWyuiXbT9Tlz9E15MOno+
	 Jat56Qrgcnp7/9QHOYWs0XxBOri4ClVwyX21PQoRbSKiZBNwdPJp486SzvcMgGbKah
	 HEoHAQ2tHIc2ahMaJXIZ4r2rJKTygL3eZgaPEW189J37JQwN03ZbelxqmuomDBxqD2
	 80qpZ5CrfNEAzRjY6XMB2407NhusmJxUX5Kbx7TqFhgK7TttLa3bU9zuv5D3hk3Jm/
	 1eeAGoF6kQbZIYIFKqvAx4R2CD8Fg42Fk+EThx1l24gLu/pK13701yAmaRlr0LsXNu
	 j3pVd79uFS35g==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 6C2DC1002BF; Tue,  8 Oct 2024 09:24:45 +0100 (BST)
Date: Tue, 8 Oct 2024 09:24:45 +0100
From: Sean Young <sean@mess.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: Re: [PATCH v3 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <ZwTsTQiTkFFu3pwX@gofer.mess.org>
References: <cover.1728355974.git.unicorn_wang@outlook.com>
 <57cf7ac3b4c092df1a6962d310b6d2603ca26995.1728355974.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57cf7ac3b4c092df1a6962d310b6d2603ca26995.1728355974.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_012451_298530_A49B3EA1 
X-CRM114-Status: GOOD (  34.13  )
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

On Tue, Oct 08, 2024 at 11:04:14AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add a PWM driver for PWM controller in Sophgo SG2042 SoC.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/pwm/Kconfig             |  10 ++
>  drivers/pwm/Makefile            |   1 +
>  drivers/pwm/pwm-sophgo-sg2042.c | 180 ++++++++++++++++++++++++++++++++
>  3 files changed, 191 insertions(+)
>  create mode 100644 drivers/pwm/pwm-sophgo-sg2042.c
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 0915c1e7df16..ec85f3895936 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -584,6 +584,16 @@ config PWM_SL28CPLD
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-sl28cpld.
>  
> +config PWM_SOPHGO_SG2042
> +	tristate "Sophgo SG2042 PWM support"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	help
> +	  PWM driver for the PWM controller on Sophgo SG2042 SoC. The PWM
> +	  controller supports outputing 4 channels of PWM waveforms.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm_sophgo_sg2042.
> +
>  config PWM_SPEAR
>  	tristate "STMicroelectronics SPEAr PWM support"
>  	depends on PLAT_SPEAR || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 9081e0c0e9e0..539e0def3f82 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_PWM_RZ_MTU3)	+= pwm-rz-mtu3.o
>  obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
>  obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
>  obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
> +obj-$(CONFIG_PWM_SOPHGO_SG2042)	+= pwm-sophgo-sg2042.o
>  obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
>  obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
>  obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
> diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
> new file mode 100644
> index 000000000000..198019b751ad
> --- /dev/null
> +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sophgo SG2042 PWM Controller Driver
> + *
> + * Copyright (C) 2024 Sophgo Technology Inc.
> + * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
> + *
> + * Limitations:
> + * - After reset, the output of the PWM channel is always high.
> + *   The value of HLPERIOD/PERIOD is 0.
> + * - When HLPERIOD or PERIOD is reconfigured, PWM will start to
> + *   output waveforms with the new configuration after completing
> + *   the running period.
> + * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
> + *   be stopped and the output is pulled to high.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +
> +#include <asm/div64.h>
> +
> +/*
> + * Offset RegisterName
> + * 0x0000 HLPERIOD0
> + * 0x0004 PERIOD0
> + * 0x0008 HLPERIOD1
> + * 0x000C PERIOD1
> + * 0x0010 HLPERIOD2
> + * 0x0014 PERIOD2
> + * 0x0018 HLPERIOD3
> + * 0x001C PERIOD3
> + * Four groups and every group is composed of HLPERIOD & PERIOD
> + */
> +#define SG2042_HLPERIOD(chan) ((chan) * 8 + 0)
> +#define SG2042_PERIOD(chan) ((chan) * 8 + 4)
> +
> +#define SG2042_PWM_CHANNELNUM	4
> +
> +/**
> + * struct sg2042_pwm_ddata - private driver data
> + * @base:		base address of mapped PWM registers
> + * @clk_rate_hz:	rate of base clock in HZ
> + */
> +struct sg2042_pwm_ddata {
> +	void __iomem *base;
> +	unsigned long clk_rate_hz;
> +};
> +
> +static void pwm_sg2042_config(void __iomem *base, unsigned int chan, u32 period, u32 hlperiod)
> +{
> +	writel(period, base + SG2042_PERIOD(chan));
> +	writel(hlperiod, base + SG2042_HLPERIOD(chan));
> +}
> +
> +static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			    const struct pwm_state *state)
> +{
> +	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
> +	u32 hlperiod;
> +	u32 period;
> +
> +	if (state->polarity == PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	if (!state->enabled) {
> +		pwm_sg2042_config(ddata->base, pwm->hwpwm, 0, 0);
> +		return 0;
> +	}
> +
> +	/*
> +	 * Period of High level (duty_cycle) = HLPERIOD x Period_clk
> +	 * Period of One Cycle (period) = PERIOD x Period_clk
> +	 */
> +	period = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
> +	hlperiod = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);
> +
> +	if (hlperiod > period) {
> +		dev_err(pwmchip_parent(chip), "period < hlperiod, failed to apply current setting\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(pwmchip_parent(chip), "chan[%u]: period=%u, hlperiod=%u\n",
> +		pwm->hwpwm, period, hlperiod);
> +
> +	pwm_sg2042_config(ddata->base, pwm->hwpwm, period, hlperiod);
> +
> +	return 0;
> +}
> +
> +static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +				struct pwm_state *state)
> +{
> +	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
> +	unsigned int chan = pwm->hwpwm;
> +	u32 hlperiod;
> +	u32 period;
> +
> +	period = readl(ddata->base + SG2042_PERIOD(chan));
> +	hlperiod = readl(ddata->base + SG2042_HLPERIOD(chan));
> +
> +	if (!period && !hlperiod)
> +		state->enabled = false;
> +	else
> +		state->enabled = true;
> +
> +	state->period = DIV_ROUND_UP_ULL((u64)period * NSEC_PER_SEC, ddata->clk_rate_hz);
> +	state->duty_cycle = DIV_ROUND_UP_ULL((u64)hlperiod * NSEC_PER_SEC, ddata->clk_rate_hz);
> +
> +	state->polarity = PWM_POLARITY_NORMAL;
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops pwm_sg2042_ops = {
> +	.apply = pwm_sg2042_apply,
> +	.get_state = pwm_sg2042_get_state,
> +};
> +
> +static const struct of_device_id sg2042_pwm_ids[] = {
> +	{ .compatible = "sophgo,sg2042-pwm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
> +
> +static int pwm_sg2042_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sg2042_pwm_ddata *ddata;
> +	struct pwm_chip *chip;
> +	struct clk *clk;
> +	int ret;
> +
> +	chip = devm_pwmchip_alloc(dev, SG2042_PWM_CHANNELNUM, sizeof(*ddata));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +	ddata = pwmchip_get_drvdata(chip);
> +
> +	ddata->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ddata->base))
> +		return PTR_ERR(ddata->base);
> +
> +	clk = devm_clk_get_enabled(dev, "apb");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get base clk\n");
> +
> +	ret = devm_clk_rate_exclusive_get(dev, clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get exclusive rate\n");
> +
> +	ddata->clk_rate_hz = clk_get_rate(clk);
> +	if (!ddata->clk_rate_hz || ddata->clk_rate_hz > NSEC_PER_SEC)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid clock rate: %lu\n", ddata->clk_rate_hz);
> +
> +	chip->ops = &pwm_sg2042_ops;

I think you can add here:

	chip->atomic = true;

As far as I can see, the driver does not do any sleeping operations
in pwm_sg2042_apply(). This probably should be tested with 
CONFIG_PWM_DEBUG and CONFIG_DEBUG_ATOMIC_SLEEP just to be sure.

Thanks,
Sean

> +
> +	ret = devm_pwmchip_add(dev, chip);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to register PWM chip\n");
> +
> +	return 0;
> +}
> +
> +static struct platform_driver pwm_sg2042_driver = {
> +	.driver	= {
> +		.name = "sg2042-pwm",
> +		.of_match_table = sg2042_pwm_ids,
> +	},
> +	.probe = pwm_sg2042_probe,
> +};
> +module_platform_driver(pwm_sg2042_driver);
> +
> +MODULE_AUTHOR("Chen Wang");
> +MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
