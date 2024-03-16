Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099E2C54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Mar 2024 01:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ario0Nv7ZI3Dt/sXh/JIHHflcG3KhzClmBZgylOVN+w=; b=II8fg4TFQ6iCfd
	QPbYli470y+Rd0s199Q7s9CpV59I4IuA+SpEz7YmUwz5LyLTUuhZpfELKUSgox/Yhd5zbhLGTVVVF
	xAYthE44e/ACymk5ECH9WhBRz3mO+7Qs2LOEqTGvflBo470nVFPXLSUnyAvEAHY+cEwxVYim9vPFp
	xGSSE4x700PoycaS+491/eGgUHkDNR7VYBAqfDY7xey7xQaNUbqQwT653Xbcxam5W7Xigr6RoBwzZ
	VaQ6FUkX1C7jqub2qy8EsqriqWiQv3+FHlPX7X5Sj4dBEwaSpgWwsnj+JYZ9c26dmReY7i2JrdGTD
	E4A7QvJPuFtmTEMa1GVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlJGU-0000000258y-3FaX;
	Sat, 16 Mar 2024 01:55:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlJGQ-0000000257Z-2RtP
	for linux-riscv@lists.infradead.org;
	Sat, 16 Mar 2024 01:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16E87CE2205;
	Sat, 16 Mar 2024 01:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B359C433C7;
	Sat, 16 Mar 2024 01:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710554103;
	bh=NFzqh48tQblSXWws8RIlsPTXww9Ugg1dROV4zdHCtu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGzrt/KtBNnpd7U5inAMwbV+yDwvNbRcvj0Thoc4nz9vELtznZBA/wVIxTHISq3aU
	 hQUEEwUik+28WvoCNQ78Qokh8enOTX6zqFNinZPWZKj/xQt3ZvRLfkM5ZWJEHHYe1I
	 7EyoER4BEaFpF0jLtrivyRko5JVFZ9DOrHAMj59B3WNiPuJQ87xrVzHTU/25vkw5rx
	 zlJlvNa/QVJUF4NQrVI5tboWvpHtYu2N2Z20hDWdPJc4DC5RIYYv5yL86perRDqIRU
	 f5SznlD5ZSacEW4HGqACSNyPNdLLU4hCvzBaKycxVdXd/bvg9QGIKPyfDgdJXZb3CA
	 uC+/US/cGFw+Q==
Date: Sat, 16 Mar 2024 09:41:46 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, inochiama@outlook.com
Subject: Re: [PATCH v5 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Message-ID: <ZfT42gzJhVd1NQzd@xhacker>
References: <20240314100131.323540-1-qiujingbao.dlmu@gmail.com>
 <20240314100131.323540-3-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314100131.323540-3-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_185511_002491_A1234F1E 
X-CRM114-Status: GOOD (  42.66  )
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

On Thu, Mar 14, 2024 at 06:01:31PM +0800, Jingbao Qiu wrote:
> Implement the PWM driver for CV1800.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-cv1800.c | 315 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 326 insertions(+)
>  create mode 100644 drivers/pwm/pwm-cv1800.c
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 4b956d661755..455f07af94f7 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -186,6 +186,16 @@ config PWM_CROS_EC
>  	  PWM driver for exposing a PWM attached to the ChromeOS Embedded
>  	  Controller.
>  
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
> @@ -15,6 +15,7 @@ obj-$(CONFIG_PWM_CLK)		+= pwm-clk.o
>  obj-$(CONFIG_PWM_CLPS711X)	+= pwm-clps711x.o
>  obj-$(CONFIG_PWM_CRC)		+= pwm-crc.o
>  obj-$(CONFIG_PWM_CROS_EC)	+= pwm-cros-ec.o
> +obj-$(CONFIG_PWM_CV1800)	+= pwm-cv1800.o
>  obj-$(CONFIG_PWM_DWC_CORE)	+= pwm-dwc-core.o
>  obj-$(CONFIG_PWM_DWC)		+= pwm-dwc.o
>  obj-$(CONFIG_PWM_EP93XX)	+= pwm-ep93xx.o
> diff --git a/drivers/pwm/pwm-cv1800.c b/drivers/pwm/pwm-cv1800.c
> new file mode 100644
> index 000000000000..8eca07c60942
> --- /dev/null
> +++ b/drivers/pwm/pwm-cv1800.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Sophgo CV1800 PWM driver
> + * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> + *
> + * Limitations:
> + * - It output low when PWM channel disabled.
> + * - This pwm device supports dynamic loading of PWM parameters. When PWMSTART
> + *   is written from 0 to 1, the register value (HLPERIODn, PERIODn) will be
> + *   temporarily stored inside the PWM. If you want to dynamically change the
> + *   waveform during PWM output, after writing the new value to HLPERIODn and
> + *   PERIODn, write 1 and then 0 to PWMUPDATE[n] to make the new value effective.
> + * - Supports up to Rate/2 output, and the lowest is about Rate/(2^30-1).
> + * - By setting HLPERIODn to 0, can produce 100% duty cycle.
> + * - This hardware could support inverted polarity. By default, the value of the
> + *   POLARITY register is 0x0. This means that HLPERIOD represents the number
> + *   of low level beats.
> + * - This hardware supports input mode and output mode, implemented through the
> + *   Output-Enable/OE register. However, this driver has not yet implemented
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
> +#define PWM_CV1800_HLPERIOD(n)       (PWM_CV1800_HLPERIOD_BASE + ((n) * 0x08))
> +#define PWM_CV1800_PERIOD(n)         (PWM_CV1800_PERIOD_BASE + ((n) * 0x08))
> +
> +#define PWM_CV1800_UPDATE_MASK(n)    (BIT(0) << (n))
> +#define PWM_CV1800_OE_MASK(n)        (BIT(0) << (n))
> +#define PWM_CV1800_START_MASK(n)     (BIT(0) << (n))
> +#define PWM_CV1800_POLARITY_MASK(n)  (BIT(0) << (n))
> +
> +#define PWM_CV1800_MAXPERIOD         0x3fffffff
> +#define PWM_CV1800_MINPERIOD         2
> +#define PWM_CV1800_CHANNELS          4
> +#define PWM_CV1800_PERIOD_RESET      BIT(1)
> +#define PWM_CV1800_HLPERIOD_RESET    BIT(0)
> +#define PWM_CV1800_REG_DISABLE       0x00U
> +#define PWM_CV1800_REG_ENABLE(n)     (BIT(0) << (n))
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
> +static const struct regmap_config cv1800_pwm_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int cv1800_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm,
> +			     bool enable)
> +{
> +	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
> +	u32 pwm_enable;
> +
> +	regmap_read(priv->map, PWM_CV1800_START, &pwm_enable);
> +	pwm_enable &= PWM_CV1800_START_MASK(pwm->hwpwm);
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
> +	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
> +	u32 config_polarity = 0;
> +
> +	if (pwm->state.enabled)
> +		cv1800_pwm_enable(chip, pwm, !pwm->state.enabled);
> +
> +	if (polarity == PWM_POLARITY_INVERSED)
> +		config_polarity =  PWM_CV1800_POLARITY_MASK(pwm->hwpwm);
> +
> +	regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
> +			   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
> +			   config_polarity);
> +}
> +
> +/**
> + * cv1800_pwm_set_oe() - check and config nth channal output-enable/OE mode
> + * @chip: PWM chip
> + * @pwm: PWM device
> + * @mode: The nth bit of the mode represents the output-enable/OE mode
> + *        of the nth channal. 1 represents output mode, 0 represents
> + *        input mode.
> + */
> +static void cv1800_pwm_set_oe(struct pwm_chip *chip, struct pwm_device *pwm,
> +			      u32 mode)

Did you get any information about the capture support pwm controller?

> +{
> +	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
> +	u32 state;
> +
> +	regmap_read(priv->map, PWM_CV1800_OE, &state);
> +	state &= PWM_CV1800_OE_MASK(pwm->hwpwm);
> +
> +	if (state == mode)
> +		return;
> +
> +	/* disenable pwm output before changing output mode */
> +	cv1800_pwm_enable(chip, pwm, false);
> +
> +	regmap_update_bits(priv->map, PWM_CV1800_OE,
> +			   PWM_CV1800_OE_MASK(pwm->hwpwm), mode);
> +}
> +
> +static int cv1800_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			    const struct pwm_state *state)
> +{
> +	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
> +	u32 period_val, hlperiod_val;
> +	u64 ticks;
> +
> +	cv1800_pwm_set_oe(chip, pwm, PWM_CV1800_OE_MASK(pwm->hwpwm));

If no capture support, I don't think we need to take care OE, could it
be done during init?

> +
> +	if (state->polarity != pwm->state.polarity)
> +		cv1800_pwm_set_polarity(chip, pwm, state->polarity);
> +
> +	/*
> +	 * This hardware use PERIOD and HLPERIOD registers to represent PWM waves.
> +	 *
> +	 * The meaning of PERIOD is how many clock cycles (from the clock source)
> +	 * are used to represent PWM waves.
> +	 * PERIOD = rate(MHz) / target(MHz)
> +	 * PERIOD = period(ns) * rate(Hz) / NSEC_PER_SEC
> +	 */
> +	ticks = mul_u64_u64_div_u64(state->period, priv->clk_rate,
> +				    NSEC_PER_SEC);
> +	if (ticks < PWM_CV1800_MINPERIOD)
> +		return -EINVAL;
> +
> +	if (ticks > PWM_CV1800_MAXPERIOD)
> +		ticks = PWM_CV1800_MAXPERIOD;
> +	period_val = (u32)ticks;
> +
> +	/*
> +	 * After mapping, hlperiod represents the same polarity as duty.
> +	 * HLPERIOD = rate(MHz) / duty(MHz)
> +	 * HLPERIOD = duty(ns) * rate(Hz) / NSEC_PER_SEC
> +	 */
> +	ticks = mul_u64_u64_div_u64(state->duty_cycle, priv->clk_rate,
> +				    NSEC_PER_SEC);
> +	if (ticks > period_val)
> +		ticks = period_val;
> +	hlperiod_val = (u32)ticks;
> +
> +	regmap_write(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), period_val);
> +	regmap_write(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), hlperiod_val);
> +
> +	cv1800_pwm_enable(chip, pwm, state->enabled);
> +
> +	return 0;
> +}
> +
> +static int cv1800_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +				struct pwm_state *state)
> +{
> +	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
> +	u32 period_val, hlperiod_val;
> +	u64 period_ns = 0, duty_ns = 0;
> +	u32 enable = 0, polarity = 0;
> +
> +	regmap_read(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), &period_val);
> +	regmap_read(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), &hlperiod_val);
> +
> +	if (period_val != PWM_CV1800_PERIOD_RESET ||
> +	    hlperiod_val != PWM_CV1800_HLPERIOD_RESET) {
> +		period_ns = DIV_ROUND_UP_ULL(period_val * NSEC_PER_SEC,
> +					     priv->clk_rate);
> +		duty_ns = DIV_ROUND_UP_ULL(hlperiod_val * NSEC_PER_SEC,
> +					   priv->clk_rate);
> +
> +		regmap_read(priv->map, PWM_CV1800_START, &enable);
> +		enable &= PWM_CV1800_START_MASK(pwm->hwpwm);
> +
> +		regmap_read(priv->map, PWM_CV1800_POLARITY, &polarity);
> +		polarity &= PWM_CV1800_POLARITY_MASK(pwm->hwpwm);
> +	}
> +
> +	state->period = period_ns;
> +	state->duty_cycle = duty_ns;
> +	state->enabled = enable;
> +
> +	/*
> +	 * To ensure that duty and hlperiod represent the same polarity
> +	 * the following mapping needs to be completed.
> +	 *
> +	 * |----------|------------|------------|-----------|
> +	 * |  Linux   |  register  |    duty    | register  |
> +	 * | polarity |  polarity  |            | hlperiod  |
> +	 * |----------|------------|------------|-----------|
> +	 * |    1     |      0     | low level  | low level |
> +	 * |----------|------------|------------|-----------|
> +	 * |    0     |      1     | high level | high level|
> +	 * |----------|------------|------------|-----------|
> +	 */
> +	state->polarity = polarity ? PWM_POLARITY_NORMAL :
> +					   PWM_POLARITY_INVERSED;
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops cv1800_pwm_ops = {
> +	.apply = cv1800_pwm_apply,
> +	.get_state = cv1800_pwm_get_state,
> +};
> +
> +static int cv1800_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cv1800_pwm *priv;
> +	struct pwm_chip *chip;
> +	void __iomem *base;
> +	int ret;
> +
> +	chip = devm_pwmchip_alloc(dev, PWM_CV1800_CHANNELS, sizeof(*priv));
> +	if (!chip)
> +		return PTR_ERR(chip);
> +	priv = to_cv1800_pwm_dev(chip);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->map = devm_regmap_init_mmio(&pdev->dev, base,
> +					  &cv1800_pwm_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
> +				     "clk not found\n");
> +
> +	ret = devm_clk_rate_exclusive_get(dev, priv->clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to get exclusive rate\n");
> +
> +	priv->clk_rate = clk_get_rate(priv->clk);
> +	if (!priv->clk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Invalid clock rate: %lu\n",
> +				     priv->clk_rate);
> +
> +	chip->ops = &cv1800_pwm_ops;
> +
> +	ret = devm_pwmchip_add(dev, chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id cv1800_pwm_dt_ids[] = {
> +	{ .compatible = "sophgo,cv1800-pwm" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_pwm_dt_ids);
> +
> +static struct platform_driver cv1800_pwm_driver = {
> +	.probe = cv1800_pwm_probe,
> +	.driver	= {
> +		.name = "cv1800-pwm",
> +		.of_match_table = cv1800_pwm_dt_ids,
> +	},
> +};
> +module_platform_driver(cv1800_pwm_driver);
> +
> +MODULE_AUTHOR("Jingbao Qiu");
> +MODULE_DESCRIPTION("Sophgo cv1800 PWM Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
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
