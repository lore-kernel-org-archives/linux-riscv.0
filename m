Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F78C79F9E
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aK6TP6viNNKORM4xgDmcjBo1d08cHuCUN7VRuBl4orw=; b=3elNrQ4A9RRDRZ
	BtSLy008yJq7SRdqOZJ9ZRvQ9yxE02wPG4gZD0NHhFlf8YoS6Xp90Y1btXjvC/AosyYSVr2gbNPIG
	4R9zSIQqSOCkwdqIo7yR4ZnQZik4hhVGYVKZZ2xDnb4FzIVtd3PFV1G2LwRfeRdP3f+ZLGHR1ukIs
	M1k1P9wwEdd/WcG+Z3cy+IWBn3zp4MQbZd4mtpy2Ndh3JHvXNdCJMpt2BXgKgU8GsDyYtMCI4jkJh
	Nn4kzQvSaIjPpSWOP1JBs4X/jB1n7r79Y42drqWe8q4TWvPaxZT4YVTQzvrKDG2/zGA/DU8GEzJwL
	z5Co5xwzF0AVDN/Xz2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3KM9-00000005aAu-3KQr;
	Sun, 06 Sep 2026 21:24:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3KM8-00000005aAo-2Y9D
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 21:24:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82AB9601DE;
	Sun,  6 Sep 2026 21:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4EA1F00A3A;
	Sun,  6 Sep 2026 21:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788729891;
	bh=yI1ISZStHsI8HeOW6HBXC0E/onU4SL9A5+VALs2VukY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WrEBvDhqAxQXIPMonisjvp9LZh06k99gCdM8iXfvMH2ZZ5WTy3HVQIrp0lhjIlwrl
	 pLMzNLBdXNUFKSx5iE2vCf0l4rWbq9XV7b0MuzsylG8Ah+G8UkfHtRLXAKDbvonzHr
	 MaWT7ytX3uBeb1v2BnFD07xWtwxeJQPyqyaJQL+auRoTtsM9KbxkcU62KduldCAqKI
	 wQrq9qMqHvuUCzI+Ntz+tSJS3kYB8SYnyxAncENKbtqUyEm4ldxdkGgY8JVc4IANYF
	 jQH/WhqSPjF95KFUQ+102qfSK4TkEcgxIbp0eJJ42ot5/u1Af+ea3DmozWl5oe4Su6
	 EV9ZP1Dng9LJA==
Date: Sun, 6 Sep 2026 22:24:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Janani Sunil <janani.sunil@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, Marius Cristea <marius.cristea@microchip.com>, Marcus
 Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>,
 Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>,
 linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260906222442.01ff098d@jic23-huawei>
In-Reply-To: <apgdEf3pi_soGr3T@ashevche-desk.local>
References: <20260902-ad5529r-driver-v11-0-301c491a0719@analog.com>
	<20260902-ad5529r-driver-v11-3-301c491a0719@analog.com>
	<apgdEf3pi_soGr3T@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Wed, 2 Sep 2026 15:56:49 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Sep 02, 2026 at 11:26:17AM +0200, Janani Sunil wrote:
> > Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> > from Analog Devices.
> > 
> > The device communicates over SPI and supports per-channel output range
> > configuration. An optional external 4.096V reference can be used in
> > place of the internal reference.  
> 
> Since there might be a v12 (depends on Jonathan), a few more nit-picks.
> 
> ...
> 
> > +static const s32 ad5529r_output_ranges_mV[8][2] = {
> > +	[AD5529R_RANGE_0V_5V] = { 0, 5000 },
> > +	[AD5529R_RANGE_0V_10V] = { 0, 10000 },
> > +	[AD5529R_RANGE_0V_20V] = { 0, 20000 },
> > +	[AD5529R_RANGE_0V_40V] = { 0, 40000 },
> > +	[AD5529R_RANGE_M5V_5V] = { -5000, 5000 },
> > +	[AD5529R_RANGE_M10V_10V] = { -10000, 10000 },
> > +	[AD5529R_RANGE_M15V_15V] = { -15000, 15000 },
> > +	[AD5529R_RANGE_M20V_20V] = { -20000, 20000 },
> > +};  
> 
> Perhaps use MILLI multiplier?
I tried this and it looks pretty ugly so didn't adopt this one.
If it were many more zeros I'd agree.

> 
> ...
> 
> > +static int ad5529r_read_raw(struct iio_dev *indio_dev,
> > +			    struct iio_chan_spec const *chan,
> > +			    int *val, int *val2, long mask)
> > +{
> > +	struct ad5529r_state *st = iio_priv(indio_dev);
> > +	unsigned int reg_addr, reg_val_h;
> > +	int ret, range_idx, span_mV;  
> 
> Why is 'range_idx' signed?

Why isn't it the enum like where it is coming from?
I changed it to the enum.

diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
index bc11d7671a76..8154b87ff831 100644
--- a/drivers/iio/dac/ad5529r.c
+++ b/drivers/iio/dac/ad5529r.c
@@ -228,8 +228,9 @@ static int ad5529r_read_raw(struct iio_dev *indio_dev,
                            int *val, int *val2, long mask)
 {
        struct ad5529r_state *st = iio_priv(indio_dev);
+       enum ad5529r_output_range range_idx;
        unsigned int reg_addr, reg_val_h;
-       int ret, range_idx, span_mV;
+       int ret, span_mV;
 
        switch (mask) {
        case IIO_CHAN_INFO_RAW:

> 
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		/*
> > +		 * Read from DAC_INPUT_A register rather than DAC_DATA_READBACK.
> > +		 * The DAC operates in transparent mode and directly reflects
> > +		 * whatever value is written to the INPUT_A register.
> > +		 */
> > +		reg_addr = AD5529R_REG_DAC_INPUT_A(chan->channel);
> > +		ret = regmap_read(st->regmap_16bit, reg_addr, &reg_val_h);
> > +		if (ret)
> > +			return ret;
> > +
> > +		*val = reg_val_h;
> > +
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_SCALE:
> > +		range_idx = st->output_range_idx[chan->channel];
> > +
> > +		/*
> > +		 * The datasheet specifies a 4.096 V external reference,
> > +		 * matching the nominal output voltage of the internal
> > +		 * reference.
> > +		 */
> > +		span_mV = ad5529r_output_ranges_mV[range_idx][1] -
> > +			  ad5529r_output_ranges_mV[range_idx][0];
> > +		*val = span_mV;
> > +		*val2 = st->model_data->resolution;
> > +
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +	case IIO_CHAN_INFO_OFFSET:
> > +		range_idx = st->output_range_idx[chan->channel];
> > +
> > +		if (ad5529r_output_ranges_mV[range_idx][0] < 0)
> > +			*val = -BIT(st->model_data->resolution - 1);
> > +		else
> > +			*val = 0;
> > +
> > +		return IIO_VAL_INT;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
