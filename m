Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C7CC2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GX89dQbeOkL61CbWJki3mxOllal/pw+LHNZE/RQHNc=; b=qdwyb6npaAI8rs
	KOJ/m0ERhqpIvwFQSTwNHq5M8NDSvGMKg8MZmpjrci/b5dbWTRS8i+9Cs3wbEw7BjzZ/2o/ptyHdq
	BznBy9VFzYw9pshjzlkL7Jh/l4CoRABzqDWwNa/Q2Zj4CYqi58YgxM85gy7FOx0t0KSqnUnRc2POV
	DlC+m2dUxlYzbsCXMsI9ui8PmcRiL/SPP+oVs78RDX8ASJdj/+6iDWmfwwbnzRcKRjDhOf+krvfYm
	genq2xaO8cKi7syn4/QGuCnJ9a+9H/rcn5/wWbi7WhgcIW0QiKGfXax1RWbJTTa1KQvUspXbmM2vf
	Ykq34OSKriVrzl0f8a3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ3J2-000000006hX-2f6w;
	Sat, 06 Jul 2024 11:10:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ3Iz-000000006h2-3fgL
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 11:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E3CB61BF2;
	Sat,  6 Jul 2024 11:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F37C2BD10;
	Sat,  6 Jul 2024 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720264212;
	bh=5A5vfBW6U9H7YwwLUBx1pG9cZrxrnGhdVlAs9baicho=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LO4Qf5/QzGeLa9Ex4CIoLIH66jwQYf8YYQrdTpMs6PskMgSpg8OwBlaWG8Oo51iiL
	 KSLZAmc/XbNXUUvrMVjvCMoL4IPujwJ+gZRlTyoZRIX3cMfJ6Ex4Vu0ZwjZSxKliTg
	 IslssCvSiEijwFSquaARAhGkQC8+u1ShQwgHuE7wc1jqOiRQnpjK/eLaJ+VrE+xttP
	 O0ZHoou8g6e+DfWin4hG07Go/ypIeuVnuE8IAtZfK8YC7lWAkoORFfprKfDBJnEWDR
	 NS0vfih5BtHc55KhIyDaQcra2cje5kKeErHRlFqc5a+0vYNQGceoViQpsY1UWJhbZ/
	 md0EPQYkfAy/w==
Date: Sat, 6 Jul 2024 12:10:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 SARADC
Message-ID: <20240706121004.37ee9fb5@jic23-huawei>
In-Reply-To: <20240705-sg2002-adc-v2-2-83428c20a9b2@bootlin.com>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
	<20240705-sg2002-adc-v2-2-83428c20a9b2@bootlin.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_041014_040576_ED5E8DB3 
X-CRM114-Status: GOOD (  29.01  )
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

On Fri, 05 Jul 2024 15:42:24 +0200
Thomas Bonnefille <thomas.bonnefille@bootlin.com> wrote:

> This adds a driver for the common Sophgo SARADC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Some more minor feedback inline.

Thanks,

Jonathan

> diff --git a/drivers/iio/adc/sophgo-cv18xx-adc.c b/drivers/iio/adc/sophgo-cv18xx-adc.c
> new file mode 100644
> index 000000000000..dd1188b1923e
> --- /dev/null
> +++ b/drivers/iio/adc/sophgo-cv18xx-adc.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Sophgo CV18XX series SARADC Driver
> + *
> + *  Copyright (C) Bootlin 2024
> + *  Author: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/dev_printk.h>
> +#include <linux/interrupt.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#define CV18XX_ADC_CTRL_REG			0x04
> +#define		CV18XX_ADC_EN			BIT(0)
> +#define		CV18XX_ADC_SEL(x)		BIT((x)+4)
BIT((x) + 4)

> +#define CV18XX_ADC_STATUS_REG			0x08
> +#define		CV18XX_ADC_BUSY			BIT(0)
> +#define CV18XX_ADC_CYC_SET_REG			0x0C
> +#define		CV18XX_ADC_DEF_CYC_SETTINGS	0xF1F0F

I'd prefer to see that broken up into fields if we have any info
on what they are.

> +#define CV18XX_ADC_CH_RESULT_REG(x)		(0x10+4*(x))
(0x10 + 4 * (x))
code style also applies in macros.

> +#define		CV18XX_ADC_CH_RESULT		0xfff

GENMASK(11, 0)

> +#define		CV18XX_ADC_CH_VALID		BIT(15)
> +#define CV18XX_ADC_INTR_EN_REG			0x20
> +#define CV18XX_ADC_INTR_CLR_REG			0x24
> +#define CV18XX_ADC_INTR_STA_REG			0x28
>
> +
> +static int cv18xx_adc_read_raw(struct iio_dev *indio_dev,
> +				  struct iio_chan_spec const *chan,
> +				  int *val, int *val2, long mask)
> +{
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
{
> +		struct cv18xx_adc *saradc = iio_priv(indio_dev);
> +		u32 sample;
> +		int ret;
> +
> +		scoped_guard(mutex, &saradc->lock) {
> +			cv18xx_adc_start_measurement(saradc, chan->scan_index);
> +			ret = cv18xx_adc_wait(saradc);
> +			if (ret < 0)
> +				return ret;
> +
> +			sample = readl(saradc->regs + CV18XX_ADC_CH_RESULT_REG(chan->scan_index));
> +		}
> +		if (!(sample & CV18XX_ADC_CH_VALID))
> +			return -ENODATA;
> +
> +		*val = sample & CV18XX_ADC_CH_RESULT;
> +		return IIO_VAL_INT;
}

> +	case IIO_CHAN_INFO_SCALE:
> +		*val = 3300;
> +		*val2 = 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static irqreturn_t cv18xx_adc_interrupt_handler(int irq, void *private)
> +{
> +	struct cv18xx_adc *saradc = private;
> +
> +	if (!(readl(saradc->regs + CV18XX_ADC_INTR_STA_REG) & BIT(0)))

Add a define for that BIT(0) and use FIELD_GET() to extract it.


> +		return IRQ_NONE;
> +
> +	writel(1, saradc->regs + CV18XX_ADC_INTR_CLR_REG);

Add a define for the 1 here (I guess it's BIT(0)?)
as well to show what is logically being cleared rather than simply
the register value.

> +	complete(&saradc->completion);
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct iio_info cv18xx_adc_info = {
> +	.read_raw = &cv18xx_adc_read_raw,
> +};
> +
> +static int cv18xx_adc_probe(struct platform_device *pdev)
> +{
> +	struct cv18xx_adc *saradc;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*saradc));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	saradc = iio_priv(indio_dev);
> +	indio_dev->name = "sophgo-cv18xx-adc";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &cv18xx_adc_info;
> +	indio_dev->num_channels = ARRAY_SIZE(sophgo_channels);
> +	indio_dev->channels = sophgo_channels;
> +

One blank line is almost always enough for readability and if you use too many
we get less code on the screen and hence it hurts readability a little.

> +
> +	if (IS_ERR(devm_clk_get_optional_enabled(&pdev->dev, NULL)))
> +		dev_dbg(&pdev->dev, "Can't get clock from device tree, using No-Die domain");

Failure to get a clock is an error and you should exit with a suitable
dev_err_probe().
Getting a NULL answer from this call reflects that one wasn't provided
and your handling here would be appropriate for that.

> +
> +	saradc->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(saradc->regs)) {
> +		ret = PTR_ERR(saradc->regs);
> +		return ret;

		return PTR_ERR(saradc->regs);
and drop the brackets.

> +	}
> +
> +	saradc->irq = platform_get_irq_optional(pdev, 0);
> +	if (saradc->irq >= 0) {
> +		init_completion(&saradc->completion);
> +		ret = devm_request_irq(&pdev->dev, saradc->irq,
> +				cv18xx_adc_interrupt_handler, 0,
> +				dev_name(&pdev->dev), saradc);

Where it isn't limited by line length, preferred style is to align to
just after the opening bracket. e.g.

		ret = devm_request_irq(&pdev->dev, saradc->irq,
				       cv18xx_adc_interrupt_handler, 0,
				       dev_name(&pdev->dev), saradc);

> +		if (ret)
> +			return ret;
> +
> +		writel(1, saradc->regs + CV18XX_ADC_INTR_EN_REG);
> +

Drop this blank line.

> +	}

One blank here is plenty.

> +
> +
> +	mutex_init(&saradc->lock);

Whilst mutex cleanup is of dubious benefit as only helpful if doing particularly forms
of mutex debugging and looking for use after free etc, we do finally have devm_mutex_init()
to make it easy so for new code I'm going to encourage it's use but not insist
on it yet...

	ret = devm_mutex_init(&saradc->lock);
	if (ret)
		return;

> +	platform_set_drvdata(pdev, indio_dev);
> +	writel(CV18XX_ADC_DEF_CYC_SETTINGS, saradc->regs + CV18XX_ADC_CYC_SET_REG);
> +	ret = devm_iio_device_register(&pdev->dev, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

	return devm_iio_device_register().

> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
