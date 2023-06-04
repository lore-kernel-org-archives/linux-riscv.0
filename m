Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EF8C77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2N6DgXsr/Xaxrp4VbRNnk2HFg/jqT5C9h44/VZrlBc=; b=WENn2WsOB1Rnz0
	frQ0SLPnQ+LQ3Fogd4N6F+PKOtXoKvO0JzrygjvEkLcqCfda9Xnwq5ZoTVfeHMk4+ZsJ75xdfbUVv
	XDshitmVJgbUhKmSBKoEOWDMGrKlwkRMH5aiNM1YYV/AqNddSKfHwVNIIlwpm4R9jyv+DXUnTr5sn
	yZoCdfRqLTJiVPnh0jAgkY7+Qhs3bRvlVUc4dTB4/DuBQLdFDrFlBuCOYdWWv5ILr6AoD7mLoNDpG
	Y1Rb14YKdrpZ/U4sK2qHKGRJFbRGlkaJitG/MEqORs8bQfVFtzKnMJ7D6eEEqGzK7Ktka30hDVhWp
	exUHiModydUOsAVU7Vzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lFb-00ByQ0-05;
	Sun, 04 Jun 2023 10:46:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lFX-00ByOW-0W;
	Sun, 04 Jun 2023 10:46:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7867960E74;
	Sun,  4 Jun 2023 10:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5269BC433D2;
	Sun,  4 Jun 2023 10:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685875573;
	bh=7j+nOXpMEYvkZcpIkT+9RZ5h5yppMuPNbpho/AMQeWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EQ3wn3VmR30NKNa+TmmHCemQzpkbU9io45pj7VeKbySu6IssUM0HlTPVziMj76n14
	 abE6z/XXYBusPPicEEK6nPtGRL7yBpq8jrb8R2qQB5kHy0GE78X5gLegTjcP8sHSsu
	 eCMdBzkg9RmT6y5XBxEZdSpbpOvXWE1VLcRdEdCRtYtTDhAAMNEVtsuQYPWWg3p+8F
	 /6gQZN1TlEKyMpMoyl8WDxj1XcXIPmmRurjHaPqrnDXPEaTDsKmF3Qf/QPGuRa/Ses
	 UJPZIdmvqtE/tycQFjNWBwh7tnPyr9fyWsdr0RInXiIslyC0Yq4ml7tJgGOPt+xmFn
	 IeINXFyA/aRtQ==
Date: Sun, 4 Jun 2023 11:46:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav
 <demonsingur@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, ChiaEn
 Wu <chiaen_wu@richtek.com>, Arnd Bergmann <arnd@arndb.de>, Ramona Bolboaca
 <ramona.bolboaca@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>, William Breathitt Gray
 <william.gray@linaro.org>, Leonard =?UTF-8?B?R8O2aHJz?=
 <l.goehrs@pengutronix.de>, Haibo Chen <haibo.chen@nxp.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Mike Looijmans <mike.looijmans@topic.nl>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs
 GPADC
Message-ID: <20230604114605.6b18490a@jic23-huawei>
In-Reply-To: <20230601223104.1243871-2-bigunclemax@gmail.com>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
	<20230601223104.1243871-2-bigunclemax@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_034615_290229_F967B257 
X-CRM114-Status: GOOD (  30.72  )
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

On Fri,  2 Jun 2023 01:30:39 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> The General Purpose ADC (GPADC) can convert the external signal into
> a certain proportion of digital value, to realize the measurement of
> analog signal, which can be applied to power detection and key detection.
> 
> Theoretically, this ADC can support up to 16 channels. All SoCs below
> contain this GPADC IP. The only difference between them is the number
> of available channels:
> 
>  T113 - 1 channel
>  D1   - 2 channels
>  R329 - 4 channels
>  T507 - 4 channels
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

Hi Maxim,

A few more minor comments from me.  Looking good in general though.

> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
> new file mode 100644
> index 000000000000..f4f1dcb06ea5
> --- /dev/null
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPADC driver for sunxi platforms (D1, T113-S3 and R329)
> + * Copyright (c) 2023 Maksim Kiselev <bigunclemax@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include <linux/iio/iio.h>
> +
> +#define SUN20I_GPADC_DRIVER_NAME	"sun20i-gpadc"
> +
> +/* Register map definition */
> +#define SUN20I_GPADC_SR			0x00
> +#define SUN20I_GPADC_CTRL		0x04
> +#define SUN20I_GPADC_CS_EN		0x08
> +#define SUN20I_GPADC_FIFO_INTC		0x0c
> +#define SUN20I_GPADC_FIFO_INTS		0x10
> +#define SUN20I_GPADC_FIFO_DATA		0X14
> +#define SUN20I_GPADC_CB_DATA		0X18
> +#define SUN20I_GPADC_DATAL_INTC		0x20
> +#define SUN20I_GPADC_DATAH_INTC		0x24
> +#define SUN20I_GPADC_DATA_INTC		0x28
> +#define SUN20I_GPADC_DATAL_INTS		0x30
> +#define SUN20I_GPADC_DATAH_INTS		0x34
> +#define SUN20I_GPADC_DATA_INTS		0x38
> +#define SUN20I_GPADC_CH_CMP_DATA(x)	(0x40 + (x) * 4)
> +#define SUN20I_GPADC_CH_DATA(x)		(0x80 + (x) * 4)
> +
> +/* ADC bit shift */

Not sure what this comment means?  I'd just drop it.

> +#define SUN20I_GPADC_CTRL_ADC_AUTOCALI_EN_MASK		BIT(23)
> +#define SUN20I_GPADC_CTRL_WORK_MODE_MASK		GENMASK(19, 18)
> +#define SUN20I_GPADC_CTRL_ADC_EN_MASK			BIT(16)
> +#define SUN20I_GPADC_CS_EN_ADC_CH(x)			BIT(x)
> +#define SUN20I_GPADC_DATA_INTC_CH_DATA_IRQ_EN(x)	BIT(x)



> +static int sun20i_gpadc_read_raw(struct iio_dev *indio_dev,
> +				 struct iio_chan_spec const *chan, int *val,
> +				 int *val2, long mask)
> +{
> +	struct sun20i_gpadc_iio *info = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = sun20i_gpadc_adc_read(info, chan, val);
> +		return ret;

		return sun20i_gpadc_adc_read()
and drop the local variable ret as no longer used.



> +	case IIO_CHAN_INFO_SCALE:
> +		/* value in mv = 1800mV / 4096 raw */
> +		*val = 1800;
> +		*val2 = 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +}

> +static int sun20i_gpadc_alloc_channels(struct iio_dev *indio_dev,
> +				       struct device *dev)
> +{
> +	unsigned int channel;
> +	int num_channels, i, ret;
> +	struct iio_chan_spec *channels;
> +	struct fwnode_handle *node;
> +
> +	num_channels = device_get_child_node_count(dev);
> +	if (num_channels == 0) {
> +		dev_err(dev, "no channel children");
> +		return -ENODEV;
> +	}
> +
> +	if (num_channels > SUN20I_GPADC_MAX_CHANNELS) {
> +		dev_err(dev, "num of channel children out of range");
> +		return -EINVAL;
> +	}
> +
> +	channels = devm_kcalloc(dev, num_channels,
> +				sizeof(*channels), GFP_KERNEL);
> +	if (!channels)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	device_for_each_child_node(dev, node) {
> +		ret = fwnode_property_read_u32(node, "reg", &channel);
> +		if (ret)
> +			goto err_child_out;

You are fairly verbose on error messages elsewhere - which is somewhat of a
personal choice, but if you are going to do that I'd expect to see on here as well.

> +
> +		channels[i].type = IIO_VOLTAGE;
> +		channels[i].indexed = 1;
> +		channels[i].channel = channel;
> +		channels[i].info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
> +		channels[i].info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE);
> +
> +		i++;
> +	}
> +
> +	indio_dev->channels = channels;
> +	indio_dev->num_channels = num_channels;
> +
> +	return 0;
> +
> +err_child_out:
> +	fwnode_handle_put(node);
> +
> +	return ret;
> +}
> +
> +static int sun20i_gpadc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct iio_dev *indio_dev;
> +	struct sun20i_gpadc_iio *info;
> +	struct reset_control *rst;
> +	void __iomem *base;
> +	struct clk *clk;
> +	int irq;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info = iio_priv(indio_dev);
> +	info->lastch = -1;

That naming briefly had me confused as my brain tried to figure it out as
a typo :). Perhaps last_ch is clearer?  Or just go with last_channel and
be really clear.

> +
> +	mutex_init(&info->lock);
> +	init_completion(&info->completion);
> +
> +	ret = sun20i_gpadc_alloc_channels(indio_dev, dev);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->info = &sun20i_gpadc_iio_info;
> +	indio_dev->name = SUN20I_GPADC_DRIVER_NAME;

We try to make this name identify the chip in question.
If the driver name is sufficient for these platforms then fair enough.
It should certainly be enough to distinguish this from other ADCs on the
platform.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
