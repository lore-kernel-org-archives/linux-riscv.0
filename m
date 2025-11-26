Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF17CD11183
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 16:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZAh3Eh+74oKQhcq6yy1RNPTRuX4Yyl6fahoDHDcN0k=; b=sFS0CzSRFHlH/R
	bZIu9GaRUVfEA0gl925Z3vCBLFwIyqcmeLxlsKeWpsVnncIXEltv+e0tP5Ze7r1ITjhHCk19vLfyl
	Ml2IMv4B+SKdOeDuSpnXEHWH22n4YTItGvdrtmzdp4eg4FPUYFWvorqwO8lq0AUNPLNTtfELFdb/5
	u7nHGnpq7VZmcv1eGzwqx4ZCv4PGte5j0KenWXea6yIjdHlYAkhsw+CMe88OoLsTBzYHTbAKmElUn
	FQs71xGLqDlzm3+sPlIrDCmzcxCMg0t17euHbxnITz3jCbsplnfAlsaTgfa06uE1ZRCSci7jhX1zB
	9Zy9SuJ++X+9W1HI3qQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIA5-0000000FH6B-1gTv;
	Wed, 26 Nov 2025 16:14:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIA4-0000000FH63-0FqM
	for linux-riscv@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xDPyy9pi5OVhyM1CdkyG9VuNPRZRoyX93URKiDj11Fc=; b=kRmOJvMKChFgfhIlV6C8ItrRbf
	lPcMjYBge2okklcvRaq/HD3ngAULN+1bKSAZ62GJ/icu1PtlFJ3u/8OnHR/8neEBOFcaKKiGbu0rL
	E5DhDP+xWmu7nc5P/0k2mcQztwwPFi/m/AHuvZPQ1cDITWN7FZgu9eCYuxTZPuAtLpF8kz6vvShcz
	RvYNeSMryPmk4EhYXCupcwTkQv4Kq8i31qKudVmwyWZl4oDauO/EV8jXBlfZ5unvc3/y6Dv7Sd8xo
	giW+niM1dtIMAjwZEjCoy3tQg1UYACwg6Ceq+YPhBK1KGsUEICgUmH7+G5Ihk/GjgCRSPxUZ4T3za
	w6E+uwXg==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIA1-0000000AMgH-0Wp8
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 16:14:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2CCC620E95;
	Wed, 26 Nov 2025 17:14:20 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plvOBBVR04nM; Wed, 26 Nov 2025 17:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1764173659; bh=x0kK1Zt9GMug1E5KSufQyhfENjqsQBZR+UYh60o3iuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a+adtWVJRPL5kbbUY2jOqIkmrmPlTEZpk3zUcm9uIYtnZHEa7GPIOeT6siRgbKfny
	 UHZVKelDJF5J7A2zoLHoVxsgsdJAAvmgYr2NUFscOuCvcu25NGG8lzRdkBsHG72FCU
	 mnT6wIYwmQTcnmzZQvoYW2HcbSEa+6YLNMUssyyb80RovbqPnb1BuoyYsbW95keBUV
	 M0yy1fo6EIlUCvnTKtdQmDygJiAB04HmseDBEDXcgtAfUN+wEhMstJ8+ZLjp3RMBk5
	 SSOih19lEyPDE63aSxJIKyzuSfwee4knPASEzbCg85Z8aC3dp6lebLpFC9dbMUmAls
	 k5o5hRuPXwwCg==
Date: Wed, 26 Nov 2025 16:13:54 +0000
From: Yao Zi <ziyao@disroot.org>
To: Shuwei Wu <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] thermal: K1: Add driver for K1 SoC thermal sensor
Message-ID: <aScnQgLuV3kMLBJg@pie>
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
 <20251127-b4-k1-thermal-v1-2-f32ce47b1aba@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251127-b4-k1-thermal-v1-2-f32ce47b1aba@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_161429_240225_DD5A01C8 
X-CRM114-Status: GOOD (  28.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 27, 2025 at 02:44:08AM +0800, Shuwei Wu wrote:
> The thermal sensor unit (TSU) on K1 supports monitoring five temperature
> zones. The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
> =

> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
>  drivers/thermal/Kconfig      |  14 ++
>  drivers/thermal/Makefile     |   1 +
>  drivers/thermal/k1_thermal.c | 307 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 322 insertions(+)

...

> diff --git a/drivers/thermal/k1_thermal.c b/drivers/thermal/k1_thermal.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a0e9585cbc5a4e0f7c3a47deb=
b3cfa8e82082d88
> --- /dev/null
> +++ b/drivers/thermal/k1_thermal.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Thermal sensor driver for SpacemiT K1 SoC
> + *
> + * Copyright (C) 2025 Shuwei Wu <shuweiwoo@163.com>
> + */
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/thermal.h>

devm_kzalloc() is used in the file, but include for linux/slab.h is
missing.

> +#include "thermal_hwmon.h"
> +
> +#define MAX_SENSOR_NUMBER		5
> +#define TEMPERATURE_OFFSET		278
> +
> +#define K1_TSU_INT_EN			0x14
> +#define K1_TSU_INT_CLR			0x10
> +#define K1_TSU_INT_STA			0x18

...

> +#define K1_TSU_EN			0x8

...

> +#define K1_TSU_DATA_BASE		0x20

...

> +#define K1_TSU_THRSH_BASE		0x40

...

> +#define K1_TSU_TIME			0x0C

...

> +#define K1_TSU_PCTRL			0x00

...

> +#define K1_TSU_PCTRL2			0x04

Why not sort these register offsets?

> +struct k1_thermal_sensor {
> +	struct k1_thermal_priv *priv;
> +	struct thermal_zone_device *tzd;
> +	int id;
> +};

> +struct k1_thermal_priv {
> +	void __iomem *base;
> +	struct device *dev;

This variable is set but used nowhere, so I think this could be dropped.

> +	struct clk *clk;
> +	struct clk *bus_clk;
> +	struct reset_control *reset;

With devres-managed API, these three variables are only used in the
probe function, thus could be dropped, too.

> +	struct k1_thermal_sensor sensors[MAX_SENSOR_NUMBER];
> +};
> +
> +static int k1_init_sensors(struct platform_device *pdev)

Suggest passing k1_thermal_priv directly into the function, since
struct platform_device isn't really necessary for it. Also it could
return void, since there's no error to happen.

> +{

...

> +	/*
> +	 * Enable all sensors' auto mode, enable dither control,
> +	 * consecutive mode, and power up sensor.
> +	 */
> +	temp =3D readl(priv->base + K1_TSU_PCTRL);
> +	temp |=3D K1_TSU_PCTRL_RAW_SEL |
> +		K1_TSU_PCTRL_TEMP_MODE |
> +		K1_TSU_PCTRL_HW_AUTO_MODE |
> +		K1_TSU_PCTRL_ENABLE;
> +	temp &=3D ~K1_TSU_PCTRL_SW_CTRL;
> +	temp &=3D ~K1_TSU_PCTRL_CTUNE;
> +	writel(temp, priv->base + K1_TSU_PCTRL);

It's a nitpick, but I think it'll be better if you follow the same
pattern as in other readl-modification-writel blocks, to clear the bits
then set the desired ones later,

> +	/* Select 24M clk for high speed mode */

This looks a little confusing, in dt-bindings you only listed a core
clock and a bus clock, but neither core nor bus clock runs at 24MHz. So
I suspect there's another clock source supplying the "24MHz clk",
possibly the 24MHz oscillator, and it should be described in
dt-bindings, too.

> +	temp =3D readl(priv->base + K1_TSU_PCTRL2);
> +	temp &=3D ~K1_TSU_PCTRL2_CLK_SEL_MASK;
> +	temp |=3D K1_TSU_PCTRL2_CLK_SEL_24M;
> +	writel(temp, priv->base + K1_TSU_PCTRL2);

...

> +	/* Enable each sensor */
> +	for (i =3D 0; i < MAX_SENSOR_NUMBER; ++i) {
> +		temp =3D readl(priv->base + K1_TSU_EN);
> +		temp &=3D ~K1_TSU_EN_MASK(i);
> +		temp |=3D K1_TSU_EN_MASK(i);

What's the point of clearing a bit and setting it again?

Furthermore, this is the only place K1_TSU_EN_MASK is used. If you fold
the modified bits into a macro, let's say, K1_TSU_EN_ALL, to be
GENMASK(MAX_SENSOR_NUNBER - 1, 0), this loop could be replaced with
readl-or-writel operation, which seems much simpler to me.

> +		writel(temp, priv->base + K1_TSU_EN);
> +	}
> +
> +	return 0;
> +}

...

> +/*
> + * The conversion formula used is:
> + * T(m=B0C) =3D (((raw_value & mask) >> shift) - TEMPERATURE_OFFSET) * 1=
000
> + */
> +static int k1_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct k1_thermal_sensor *sensor =3D thermal_zone_device_priv(tz);
> +	struct k1_thermal_priv *priv =3D sensor->priv;
> +
> +	*temp =3D readl(priv->base + K1_TSU_DATA(sensor->id));
> +	*temp &=3D K1_TSU_DATA_MASK(sensor->id);
> +	*temp >>=3D K1_TSU_DATA_SHIFT(sensor->id);

FIELD_GET() would help here.

> +
> +	*temp -=3D TEMPERATURE_OFFSET;
> +
> +	*temp *=3D 1000;
> +
> +	return 0;
> +}
> +
> +/*
> + * For each sensor, the hardware threshold register is 32 bits:
> + * - Lower 16 bits [15:0] configure the low threshold temperature.
> + * - Upper 16 bits [31:16] configure the high threshold temperature.
> + */
> +static int k1_thermal_set_trips(struct thermal_zone_device *tz, int low,=
 int high)
> +{

...

> +	high_code =3D high_code / 1000 + TEMPERATURE_OFFSET;
> +	temp =3D readl(priv->base + K1_TSU_THRSH(sensor->id));
> +	temp &=3D ~K1_TSU_THRSH_HIGH_MASK;
> +	temp |=3D (high_code << K1_TSU_THRSH_HIGH_SHIFT);
> +	writel(temp, priv->base + K1_TSU_THRSH(sensor->id));
> +
> +	low_code =3D low_code / 1000 + TEMPERATURE_OFFSET;
> +	temp =3D readl(priv->base + K1_TSU_THRSH(sensor->id));
> +	temp &=3D ~K1_TSU_THRSH_LOW_MASK;
> +	temp |=3D (low_code << K1_TSU_THRSH_LOW_SHIFT);
> +	writel(temp, priv->base + K1_TSU_THRSH(sensor->id));

Similarly, FIELD_PUT() could simplify these threshold setting code.

> +
> +	return 0;
> +}

...

> +static irqreturn_t k1_thermal_irq_thread(int irq, void *data)
> +{
> +	struct k1_thermal_priv *priv =3D (struct k1_thermal_priv *)data;
> +	int msk, status, i;
> +
> +	status =3D readl(priv->base + K1_TSU_INT_STA);
> +
> +	for (i =3D 0; i < MAX_SENSOR_NUMBER; i++) {
> +		if (status & K1_TSU_INT_MASK(i)) {
> +			msk =3D readl(priv->base + K1_TSU_INT_CLR);
> +			msk |=3D K1_TSU_INT_MASK(i);
> +			writel(msk, priv->base + K1_TSU_INT_CLR);
> +			/* Notify thermal framework to update trips */

Purpose of the code looks obvious, do you think the comment should be
dropped?

> +			thermal_zone_device_update(priv->sensors[i].tzd, THERMAL_EVENT_UNSPEC=
IFIED);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int k1_thermal_probe(struct platform_device *pdev)
> +{

...

> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);

Why not using dev_err_probe() here?

...

> +	ret =3D k1_init_sensors(pdev);

k1_init_sensors would never fail, suggest changing it to return void,
and get rid of assignment to ret here.

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
