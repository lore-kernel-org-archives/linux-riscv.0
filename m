Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D20C624D6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gLXpPcYr47ivL4O0AaiCFKCo5VmQqnmZZia0D4lITg=; b=sMbcw+fhhg7YNq
	2Kyz+gUukqX+BJY8mYkG1ZGhAJ+iPpVvtxlb7GVY2VCT7heVF+KTNBGonL5JNoVI2sTMtBAsJYn5U
	nxX1wFbSIUX645DtseV98fEPY29wIrusDSG2cuKkKNYsy4/EMsLnUc2DPp/GDdw/aLIFygAMF6mvg
	wdBiTF4DD9EL/+1AsEdn2HQ8mxaxEnA7k9VBov4XFvq4fUCKkEaKvrcWh+uExTj4UfIZPI5URa72t
	CZFj/C2YEz0Za59bUkDyNJjWRW4Wn1M/y1KD2EnJlgGY2tG3RBnJBpGLS6uZ11C4kI1MR6kN4IXBB
	N2YDdBuTLrtBpzptFLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kWW-0000000EjZn-35Vl;
	Wed, 02 Sep 2026 12:57:04 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kWV-0000000EjYs-00wF
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 12:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788353823; x=1819889823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+sqEe1LGe4fEP5uabRD28y+M+U2lWTjublfmuX++eck=;
  b=BZr9FMYuJLguMgWohmMJ3oT09Y4/J45Qgqa8ddBzQbgFFQh5L/xyyZLk
   Ba4bXYk92HUno0y5Wp5lUyf6h5AXRYf0akIcIx3N6IOzbK8rvgfSSnbxZ
   NyKgWU0ScXjJy+BWBarTacfKX5dLge1XfSrClVkKDz3mERgJTjn1tX60Z
   j+KPvm/kiBxa2ZfQqO9wirqi/etNYeH1jPwGCtdsGaQPx3+YqfIGhnKeK
   42b1zJSUcsAQZ/+NKxoNQZTupanlSZgJKrJVkq4RhiDmyO0QCeSiStCIY
   tBO73rcBkPFzAqOhHry5MnVuAFbWsh8fd2N/VxNFcAurRFdx82wPNpWXE
   g==;
X-CSE-ConnectionGUID: X2BIU0IeQxeAe0P6wL3JKg==
X-CSE-MsgGUID: XGWBmB07RjCGkvGHwX1AWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100165337"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100165337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:56:58 -0700
X-CSE-ConnectionGUID: ydY/x6WaSTiRl04+a7s3zA==
X-CSE-MsgGUID: Yl8xqNi8R+e7HGDSivpLpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="273570230"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.118])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:56:51 -0700
Date: Wed, 2 Sep 2026 15:56:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Marius Cristea <marius.cristea@microchip.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Kent Gustavsson <kent@minoris.se>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org,
	Kent Gustavsson <nedo80@gmail.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <apgdEf3pi_soGr3T@ashevche-desk.local>
References: <20260902-ad5529r-driver-v11-0-301c491a0719@analog.com>
 <20260902-ad5529r-driver-v11-3-301c491a0719@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902-ad5529r-driver-v11-3-301c491a0719@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_055703_112363_6A501CF6 
X-CRM114-Status: GOOD (  18.35  )
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

On Wed, Sep 02, 2026 at 11:26:17AM +0200, Janani Sunil wrote:
> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> from Analog Devices.
> 
> The device communicates over SPI and supports per-channel output range
> configuration. An optional external 4.096V reference can be used in
> place of the internal reference.

Since there might be a v12 (depends on Jonathan), a few more nit-picks.

...

> +static const s32 ad5529r_output_ranges_mV[8][2] = {
> +	[AD5529R_RANGE_0V_5V] = { 0, 5000 },
> +	[AD5529R_RANGE_0V_10V] = { 0, 10000 },
> +	[AD5529R_RANGE_0V_20V] = { 0, 20000 },
> +	[AD5529R_RANGE_0V_40V] = { 0, 40000 },
> +	[AD5529R_RANGE_M5V_5V] = { -5000, 5000 },
> +	[AD5529R_RANGE_M10V_10V] = { -10000, 10000 },
> +	[AD5529R_RANGE_M15V_15V] = { -15000, 15000 },
> +	[AD5529R_RANGE_M20V_20V] = { -20000, 20000 },
> +};

Perhaps use MILLI multiplier?

...

> +static int ad5529r_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct ad5529r_state *st = iio_priv(indio_dev);
> +	unsigned int reg_addr, reg_val_h;
> +	int ret, range_idx, span_mV;

Why is 'range_idx' signed?

> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		/*
> +		 * Read from DAC_INPUT_A register rather than DAC_DATA_READBACK.
> +		 * The DAC operates in transparent mode and directly reflects
> +		 * whatever value is written to the INPUT_A register.
> +		 */
> +		reg_addr = AD5529R_REG_DAC_INPUT_A(chan->channel);
> +		ret = regmap_read(st->regmap_16bit, reg_addr, &reg_val_h);
> +		if (ret)
> +			return ret;
> +
> +		*val = reg_val_h;
> +
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		range_idx = st->output_range_idx[chan->channel];
> +
> +		/*
> +		 * The datasheet specifies a 4.096 V external reference,
> +		 * matching the nominal output voltage of the internal
> +		 * reference.
> +		 */
> +		span_mV = ad5529r_output_ranges_mV[range_idx][1] -
> +			  ad5529r_output_ranges_mV[range_idx][0];
> +		*val = span_mV;
> +		*val2 = st->model_data->resolution;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_OFFSET:
> +		range_idx = st->output_range_idx[chan->channel];
> +
> +		if (ad5529r_output_ranges_mV[range_idx][0] < 0)
> +			*val = -BIT(st->model_data->resolution - 1);
> +		else
> +			*val = 0;
> +
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
