Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCDBC27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVfi59jjB1zK8w3TI5GFklC2AX9pffvXgmZ9Nl2RDPM=; b=0DjEcZxmu1TIfw
	raMn3MptGagKf63ADTEnmX4Mb6qngKejWic2SZ+tLc1rwSm1S4EqysUqnQpFeohc7xdmF300dQTLM
	9WNi0n+xxbWekfqC9cvehaMV2WKaP17G5a4FTWNOw5JTB3K7WeEJWm02+OCP2NgQoVY3b7RJ5HMjC
	Ira3+mKh8JiZFIpURHYkJy0eqGc7KvwuZYvW4Z8JPnLTqbzx8BYkplQX8pkbhyyi7Xk6HARp2XYSl
	b8f6DHsK3vinslcFY4bHItxCji24q+8w4gvpMtTweAqROg1NrEU4B4wrcUWtQqUrpvnOdNJNm2Pxz
	PQ1jyangHQZ6+1b9ZAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJE4k-0000000BOkI-1nA2;
	Mon, 17 Jun 2024 15:15:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJE4h-0000000BOjP-0tGG
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 15:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9B36CE1247;
	Mon, 17 Jun 2024 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CC7C2BD10;
	Mon, 17 Jun 2024 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637312;
	bh=sNqYN82aT6iqdyV+emqRd6GJICAQXA8CUkaLlNKeyVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adq+0pOko/AdQZjHmRX1Lb3GiikyLUThDUBNunbVgvle/FCcV84VttwN+MHGNnWFp
	 r3BxenlfNL5Arl1GNmFfwnfBBEnOzrlvdPXaJk7wmrkuELwRq1Pz9AXmERhOJZL9kO
	 kZLx/2N5C/mjm5vpx7ngqQ3nLUBGY2mY7Fzd4ZzY9jzLplx2yxhB+SoyQxsDskpv8f
	 pAzqxthHa5WDNYNNI0M69KzAoB28QR26CyryseQKJzm8SVTvSsgt4u1IjD3FuuZHLr
	 y0zk6hSGU10jsLtiVZFyKjm6JNX/tEcillbWm/FuIWxDjuws7kgjwMywHHd1AA/J1K
	 sncpe10VD7Wng==
Date: Mon, 17 Jun 2024 23:01:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] thermal: cv180x: Add cv180x thermal driver support
Message-ID: <ZnBPtUaAOksIW4d_@xhacker>
References: <SG2PR01MB4218013241B3EED779D3BAE8D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
 <SG2PR01MB42187EC277384F84A3126F0DD7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SG2PR01MB42187EC277384F84A3126F0DD7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_081515_655667_9AD3412F 
X-CRM114-Status: GOOD (  29.66  )
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

On Tue, Jun 04, 2024 at 12:54:21PM +0000, Haylen Chu wrote:
> Add support for cv180x SoCs integrated thermal sensors.
> 
> Signed-off-by: Haylen Chu <heylenay@outlook.com>
> ---
>  drivers/thermal/Kconfig          |   6 +
>  drivers/thermal/Makefile         |   1 +
>  drivers/thermal/cv180x_thermal.c | 262 +++++++++++++++++++++++++++++++
>  3 files changed, 269 insertions(+)
>  create mode 100644 drivers/thermal/cv180x_thermal.c
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 204ed89a3ec9..f53c973a361d 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -514,4 +514,10 @@ config LOONGSON2_THERMAL
>  	  is higher than the high temperature threshold or lower than the low
>  	  temperature threshold, the interrupt will occur.
>  
> +config CV180X_THERMAL
> +	tristate "Temperature sensor driver for Sophgo CV180X"
> +	help
> +	  If you say yes here you get support for thermal sensor integrated in
> +	  Sophgo CV180X SoCs.
> +
>  endif
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index 5cdf7d68687f..5b59bde8a579 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -65,3 +65,4 @@ obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
>  obj-$(CONFIG_SPRD_THERMAL)	+= sprd_thermal.o
>  obj-$(CONFIG_KHADAS_MCU_FAN_THERMAL)	+= khadas_mcu_fan.o
>  obj-$(CONFIG_LOONGSON2_THERMAL)	+= loongson2_thermal.o
> +obj-$(CONFIG_CV180X_THERMAL)	+= cv180x_thermal.o
> diff --git a/drivers/thermal/cv180x_thermal.c b/drivers/thermal/cv180x_thermal.c
> new file mode 100644
> index 000000000000..89425e2b75a2
> --- /dev/null
> +++ b/drivers/thermal/cv180x_thermal.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Sophgo Inc.
> + * Copyright (C) 2024 Haylen Chu <heylenay@outlook.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/thermal.h>

can we sort the headers?

> +
> +#define TEMPSEN_VERSION					0x0
> +#define TEMPSEN_CTRL					0x4
> +#define  TEMPSEN_CTRL_EN				BIT(0)
> +#define  TEMPSEN_CTRL_SEL_MASK				GENMASK(7, 4)
> +#define  TEMPSEN_CTRL_SEL_OFFSET			4
> +#define TEMPSEN_STATUS					0x8
> +#define TEMPSEN_SET					0xc
> +#define  TEMPSEN_SET_CHOPSEL_MASK			GENMASK(5, 4)
> +#define  TEMPSEN_SET_CHOPSEL_OFFSET			4
> +#define  TEMPSEN_SET_CHOPSEL_128T			0
> +#define  TEMPSEN_SET_CHOPSEL_256T			1
> +#define  TEMPSEN_SET_CHOPSEL_512T			2
> +#define  TEMPSEN_SET_CHOPSEL_1024T			3
> +#define  TEMPSEN_SET_ACCSEL_MASK			GENMASK(7, 6)
> +#define  TEMPSEN_SET_ACCSEL_OFFSET			6
> +#define  TEMPSEN_SET_ACCSEL_512T			0
> +#define  TEMPSEN_SET_ACCSEL_1024T			1
> +#define  TEMPSEN_SET_ACCSEL_2048T			2
> +#define  TEMPSEN_SET_ACCSEL_4096T			3
> +#define  TEMPSEN_SET_CYC_CLKDIV_MASK			GENMASK(15, 8)
> +#define  TEMPSEN_SET_CYC_CLKDIV_OFFSET			8
> +#define TEMPSEN_INTR_EN					0x10
> +#define TEMPSEN_INTR_CLR				0x14
> +#define TEMPSEN_INTR_STA				0x18
> +#define TEMPSEN_INTR_RAW				0x1c
> +#define TEMPSEN_RESULT(n)				(0x20 + (n) * 4)
> +#define  TEMPSEN_RESULT_RESULT_MASK			GENMASK(12, 0)
> +#define  TEMPSEN_RESULT_MAX_RESULT_MASK			GENMASK(28, 16)
> +#define  TEMPSEN_RESULT_CLR_MAX_RESULT			BIT(31)
> +#define TEMPSEN_AUTO_PERIOD				0x64
> +#define  TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_MASK		GENMASK(23, 0)
> +#define  TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_OFFSET		0
> +
> +struct cv180x_thermal_zone {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct clk *clk_tempsen;
> +	u32 chop_period;
> +	u32 accum_period;
> +	u32 sample_cycle;
> +};
> +
> +static void cv180x_thermal_init(struct cv180x_thermal_zone *ctz)
> +{
> +	void __iomem *base = ctz->base;
> +	u32 regval;
> +
> +	writel(readl(base + TEMPSEN_INTR_RAW), base + TEMPSEN_INTR_CLR);
> +	writel(TEMPSEN_RESULT_CLR_MAX_RESULT, base + TEMPSEN_RESULT(0));
> +
> +	regval = readl(base + TEMPSEN_SET);
> +	regval &= ~TEMPSEN_SET_CHOPSEL_MASK;
> +	regval &= ~TEMPSEN_SET_ACCSEL_MASK;
> +	regval &= ~TEMPSEN_SET_CYC_CLKDIV_MASK;
> +	regval |= ctz->chop_period << TEMPSEN_SET_CHOPSEL_OFFSET;
> +	regval |= ctz->accum_period << TEMPSEN_SET_ACCSEL_OFFSET;
> +	regval |= 0x31 << TEMPSEN_SET_CYC_CLKDIV_OFFSET;
> +	writel(regval, base + TEMPSEN_SET);
> +
> +	regval = readl(base + TEMPSEN_AUTO_PERIOD);
> +	regval &= ~TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_MASK;
> +	regval |= ctz->sample_cycle << TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_OFFSET;
> +	writel(regval, base + TEMPSEN_AUTO_PERIOD);
> +
> +	regval = readl(base + TEMPSEN_CTRL);
> +	regval &= ~TEMPSEN_CTRL_SEL_MASK;
> +	regval |= 1 << TEMPSEN_CTRL_SEL_OFFSET;
> +	regval |= TEMPSEN_CTRL_EN;
> +	writel(regval, base + TEMPSEN_CTRL);
> +}
> +
> +static void cv180x_thermal_deinit(struct cv180x_thermal_zone *ct)
> +{
> +	void __iomem *base = ct->base;
> +	u32 regval;
> +
> +	regval = readl(base + TEMPSEN_CTRL);
> +	regval &= ~(TEMPSEN_CTRL_SEL_MASK | TEMPSEN_CTRL_EN);
> +	writel(regval, base + TEMPSEN_CTRL);
> +
> +	writel(readl(base + TEMPSEN_INTR_RAW), base + TEMPSEN_INTR_CLR);
> +}
> +
> +/*
> + *	Raw register value to temperature (mC) formula:
> + *
> + *		       read_val * 1000 * 716
> + *	Temperature = ----------------------- - 273000
> + *				divider
> + *
> + *	where divider should be ticks number of accumulation period,
> + *	e.g. 2048 for TEMPSEN_CTRL_ACCSEL_2048T
> + */
> +static int cv180x_calc_temp(struct cv180x_thermal_zone *ctz, u32 result)
> +{
> +	u32 divider = (u32)(512 * int_pow(2, ctz->accum_period));
> +
> +	return (result * 1000) * 716 / divider - 273000;
> +}
> +
> +static int cv180x_get_temp(struct thermal_zone_device *tdev, int *temperature)
> +{
> +	struct cv180x_thermal_zone *ctz = thermal_zone_device_priv(tdev);
> +	void __iomem *base = ctz->base;
> +	u32 result;
> +
> +	result = readl(base + TEMPSEN_RESULT(0)) & TEMPSEN_RESULT_RESULT_MASK;
> +	*temperature = cv180x_calc_temp(ctz, result);
> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_device_ops cv180x_thermal_ops = {
> +	.get_temp = cv180x_get_temp,
> +};
> +
> +static const struct of_device_id cv180x_thermal_of_match[] = {
> +	{ .compatible = "sophgo,cv1800-thermal" },
> +	{ .compatible = "sophgo,cv180x-thermal" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cv180x_thermal_of_match);
> +
> +static int
> +cv180x_parse_dt(struct cv180x_thermal_zone *ctz)
> +{
> +	struct device_node *np = ctz->dev->of_node;
> +
> +	if (of_property_read_u32(np, "accumulation-period",
> +				 &ctz->accum_period)) {
> +		ctz->accum_period = TEMPSEN_SET_ACCSEL_2048T;
> +	} else {
> +		if (ctz->accum_period < TEMPSEN_SET_ACCSEL_512T ||
> +		    ctz->accum_period > TEMPSEN_SET_ACCSEL_4096T) {
> +			dev_err(ctz->dev, "invalid accumulation period %d\n",
> +				ctz->accum_period);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (of_property_read_u32(np, "chop-period", &ctz->chop_period)) {
> +		ctz->chop_period = TEMPSEN_SET_CHOPSEL_1024T;
> +	} else {
> +		if (ctz->chop_period < TEMPSEN_SET_CHOPSEL_128T ||
> +		    ctz->chop_period > TEMPSEN_SET_CHOPSEL_1024T) {
> +			dev_err(ctz->dev, "invalid chop period %d\n",
> +				ctz->chop_period);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (of_property_read_u32(np, "sample-cycle-us", &ctz->sample_cycle))
> +		ctz->sample_cycle = 1000000;
> +
> +	return 0;
> +}
> +
> +static int cv180x_thermal_probe(struct platform_device *pdev)
> +{
> +	struct cv180x_thermal_zone *ctz;
> +	struct thermal_zone_device *tz;
> +	struct resource *res;
> +	int ret;
> +
> +	ctz = devm_kzalloc(&pdev->dev, sizeof(*ctz), GFP_KERNEL);
> +	if (!ctz)
> +		return -ENOMEM;
> +
> +	ctz->dev = &pdev->dev;
> +
> +	ret = cv180x_parse_dt(ctz);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to parse dt\n");
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ctz->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(ctz->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ctz->base),
> +				     "failed to map tempsen registers\n");
> +
> +	ctz->clk_tempsen = devm_clk_get(&pdev->dev, "clk_tempsen");

devm_clk_get_enabled maybe better for easy exit and error handling
code path. see below

And since the so called "clk_tempsen" is the only clk, it's better
to remove the clk name.

> +	if (IS_ERR(ctz->clk_tempsen))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ctz->clk_tempsen),
> +				     "failed to get clk_tempsen\n");
> +
> +	clk_prepare_enable(ctz->clk_tempsen);
> +
> +	cv180x_thermal_init(ctz);
> +
> +	tz = devm_thermal_of_zone_register(&pdev->dev, 0, ctz,
> +					   &cv180x_thermal_ops);
> +	if (IS_ERR(tz))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(tz),
> +				     "failed to register thermal zone\n");

Missing undo the clk_prepare_enable. 

> +
> +	platform_set_drvdata(pdev, ctz);
> +
> +	return 0;
> +}
> +
> +static int cv180x_thermal_remove(struct platform_device *pdev)
> +{
> +	struct cv180x_thermal_zone *ctz = platform_get_drvdata(pdev);
> +
> +	cv180x_thermal_deinit(ctz);
> +	clk_disable_unprepare(ctz->clk_tempsen);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cv180x_thermal_suspend(struct device *dev)
> +{
> +	struct cv180x_thermal_zone *ctz = dev_get_drvdata(dev);
> +
> +	cv180x_thermal_deinit(ctz);
> +	clk_disable_unprepare(ctz->clk_tempsen);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cv180x_thermal_resume(struct device *dev)
> +{
> +	struct cv180x_thermal_zone *ctz = dev_get_drvdata(dev);
> +
> +	clk_prepare_enable(ctz->clk_tempsen);
> +	cv180x_thermal_init(ctz);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(cv180x_thermal_pm_ops,
> +			 cv180x_thermal_suspend, cv180x_thermal_resume);
> +
> +static struct platform_driver cv180x_thermal_driver = {
> +	.probe = cv180x_thermal_probe,
> +	.remove = cv180x_thermal_remove,
> +	.driver = {
> +		.name = "cv180x-thermal",
> +		.pm = &cv180x_thermal_pm_ops,
> +		.of_match_table = cv180x_thermal_of_match,
> +	},
> +};
> +
> +module_platform_driver(cv180x_thermal_driver);
> +
> +MODULE_DESCRIPTION("Sophgo CV180x thermal driver");
> +MODULE_AUTHOR("Haylen Chu <heylenay@outlook.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
