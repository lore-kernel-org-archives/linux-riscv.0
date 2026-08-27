Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D19C61DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24oNU6crFlBYyafcSg2AxK29x+EPgjN2HwZ+g/ws8v0=; b=39RDDVTTQcT5oP
	tkAqz5f9GEfjdtLGNP+sUtbx/9Blyqujwznmj+Ibw0K0BtQXaIKSp5bHsTTkCYceP5RRPPvKZRVqk
	0uiX/1rY3p/Mw6ofC3XYv0m+PqfaD6mxzOCUIJmotguhtlCmeeX0h8AWZ8SHEx7P8g6AnyF2dLhE7
	WLtzu0+HEuO5pX9kAqbfa/HLvxcqrXeAuZ2DF9ysHFyTdggp/kNpsVEyj4+L0N/CRTfzAQUL0usjy
	77xnzNNHw8eg1uHhveP96HOq45d/BcoLqToGy7ZA1GeHiQvbu/jsuhjL6qwPz6W1RcLkmVuXZeVBl
	YmedpJD7dasmbXb0hu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVOS-00000003d0v-2Gpw;
	Thu, 27 Aug 2026 08:23:28 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVOQ-00000003d0T-3E5m
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 08:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787819006; x=1819355006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zXoFXBF16RYQNFRjCj4DCymrGUMbzxz6bjyW/wn/hL8=;
  b=CCigRrU2/mOcw38ME35PQj/8zmAmzIKWcVZ2I2XJtTJQedRtElQavbwF
   9HPIpYHTMRI15bwf9cVRIIw6i9gqHX48BTtzgrDOxAA2lMPhBkI5Er7bs
   V+GXsMtHP2a0Z3yDXZ5U8Io1WSRBHrK8grYdgA0aG3ylJOU3DfjtipueD
   czywBvZkIgM/LG/jdjbYOmOI6WZYknW++oSGloycm9uaMH4HcwxOlbEkN
   rNLwXaYhtg6DhiKiSpjlA6Q6drcVf29ZfxMDRT2V4XkJjGYUpH+qfOGqi
   QUim8E/ESBUz7UU/GcXBnz4kGwZjx8Kvinpyb5hRUop8Z4WLLvr+OG4E6
   g==;
X-CSE-ConnectionGUID: fIPSGnWGTAm2RoDb5itlYA==
X-CSE-MsgGUID: SdHnqBuGQDeKJy6/exHtGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87447675"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="87447675"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:23:26 -0700
X-CSE-ConnectionGUID: BZTCOsTISJiwB0Cy4AKNnQ==
X-CSE-MsgGUID: 5sTsQy1+SrWMmybKjgelnw==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:23:19 -0700
Date: Thu, 27 Aug 2026 11:23:17 +0300
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
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <ao_z9QTJC_q8gH0v@ashevche-desk.local>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_012326_829941_0945E759 
X-CRM114-Status: GOOD (  25.18  )
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

More or less in a good shape, a few nit-picks and minor issues here and there
and I believe the next version will be fine to go. Note, some of the mentioned
issues can be addressed later, but if no doubts, address now.

On Thu, Aug 27, 2026 at 09:34:48AM +0200, Janani Sunil wrote:
> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> from Analog Devices.
> 
> The device communicates over SPI and supports per-channel output range
> configuration. An optional external 4.096V reference can be used in
> place of the internal reference.

Don't you want to add Datasheet tag?

...

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>

err.h implies standard errno, so unless you are not using Linux specific ones
(>= 512), the errno.h is not required.

> +#include <linux/errno.h>
> +#include <linux/iio/iio.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/units.h>

...

> +static int ad5529r_reset(struct ad5529r_state *st)
> +{
> +	struct reset_control *rst;
> +	struct regmap *map = st->regmap_8bit;
> +	struct device *dev = regmap_get_device(map);

Keep it in reversed xmas tree order

	struct regmap *map = st->regmap_8bit;
	struct device *dev = regmap_get_device(map);
	struct reset_control *rst;

> +	int ret;
> +
> +	rst = devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(rst))
> +		return PTR_ERR(rst);
> +
> +	if (rst) {
> +		ret = reset_control_assert(rst);
> +		if (ret)
> +			return ret;
> +
> +		/* Minimum reset low width (t_reset) is 20 ns per datasheet. */
> +		ndelay(20);
> +
> +		ret = reset_control_deassert(rst);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = regmap_write(map, AD5529R_REG_INTERFACE_CONFIG_A,
> +				   AD5529R_INTERFACE_CONFIG_A_SW_RESET);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Wait 10 ms for digital initialization to complete.
> +	 * Per datasheet, Interface Status A register NOT_READY_ERR bit is
> +	 * set if SPI transactions are attempted before digital initialization
> +	 * completes.
> +	 */
> +	fsleep(10 * USEC_PER_MSEC);
> +
> +	return regmap_write(map, AD5529R_REG_INTERFACE_CONFIG_A,
> +			    AD5529R_INTERFACE_CONFIG_A_SDO_ENABLE |
> +			    AD5529R_INTERFACE_CONFIG_A_ADDR_ASCENSION);
> +}

...

> +static int ad5529r_parse_channel_ranges(struct device *dev,
> +					struct ad5529r_state *st)
> +{
> +	unsigned long channel_mask = 0;
> +	s32 vals[2];
> +	int ret, range_idx;
> +	u32 ch;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		if (st->num_channels == ARRAY_SIZE(st->channels))
> +			return dev_err_probe(dev, -ECHRNG, "Too many channels\n");

Okay, this actually better to be ENOSPC

> +		ret = fwnode_property_read_u32(child, "reg", &ch);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Missing reg property in channel node\n");
> +
> +		if (ch >= AD5529R_MAX_CHANNELS)
> +			return dev_err_probe(dev, -EINVAL,

and ECHRNG is here.

> +					     "Channel %u exceeds maximum 15\n",

Replace 15 with the compile-time constant based on the actual capacity?

> +					     ch);

> +		if (channel_mask & BIT(ch))
> +			return dev_err_probe(dev, -EINVAL,

EEXIST

> +					     "Duplicate channel %u\n", ch);
> +
> +		channel_mask |= BIT(ch);

		if (__test_and_set_bit(...))

will require replacing bits.h with bitops.h.

> +		if (fwnode_property_present(child, "output-range-microvolt")) {
> +			/*
> +			 * DT stores cells as raw 32-bit values; signed endpoints are
> +			 * encoded by dtc in two's-complement and then interpreted
> +			 * here as s32.
> +			 */
> +			ret = fwnode_property_read_u32_array(child,
> +							     "output-range-microvolt",
> +							     (u32 *)vals, ARRAY_SIZE(vals));
> +			if (ret < 0)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to read range for ch %u\n",
> +						     ch);
> +
> +			range_idx = ad5529r_find_output_range(vals);
> +			if (range_idx < 0)
> +				return dev_err_probe(dev, range_idx,
> +						     "Invalid range [%d %d] for ch %u\n",
> +						     vals[0], vals[1], ch);
> +		} else {
> +			range_idx = AD5529R_RANGE_0V_5V;
> +		}
> +
> +		st->output_range_idx[ch] = range_idx;
> +		ret = regmap_write(st->regmap_16bit,
> +				   AD5529R_REG_OUT_RANGE(ch), range_idx);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to configure range for ch %u\n",
> +					     ch);
> +
> +		st->channels[st->num_channels++] = AD5529R_DAC_CHANNEL(ch);
> +	}
> +
> +	return 0;
> +}

...

> +static int ad5529r_probe(struct spi_device *spi)
> +{
> +	struct regmap_config regmap_16bit_cfg;
> +	struct regmap_config regmap_8bit_cfg;
> +	struct device *dev = &spi->dev;
> +	struct iio_dev *indio_dev;
> +	struct ad5529r_state *st;
> +	bool external_vref;
> +	u32 dev_addr = 0;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st = iio_priv(indio_dev);
> +
> +	st->model_data = spi_get_device_match_data(spi);
> +	if (!st->model_data)
> +		return dev_err_probe(dev, -ENODATA,
> +				     "Failed to identify device variant\n");
> +
> +	device_property_read_u32(dev, "spi-device-addr", &dev_addr);
> +	if (dev_addr > 3)
> +		return dev_err_probe(dev, -EINVAL,

EADDRNOTAVAIL ?

> +				     "spi-device-addr %u out of range [0, 3]\n",
> +				     dev_addr);
> +
> +	regmap_8bit_cfg = (struct regmap_config) {
> +		.name = "ad5529r-8bit",
> +		.reg_bits = 16,
> +		.val_bits = 8,
> +		.max_register = AD5529R_8BIT_REG_MAX,
> +		.read_flag_mask = AD5529R_SPI_READ_FLAG,
> +		.rd_table = &ad5529r_8bit_readable_table,
> +		.wr_table = &ad5529r_8bit_writeable_table,
> +		.reg_base = dev_addr << AD5529R_ADDR_SHIFT,
> +	};
> +	regmap_16bit_cfg = (struct regmap_config) {
> +		.name = "ad5529r-16bit",
> +		.reg_bits = 16,
> +		.val_bits = 16,
> +		.max_register = AD5529R_MAX_REGISTER,
> +		.read_flag_mask = AD5529R_SPI_READ_FLAG,
> +		.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +		.rd_table = &ad5529r_16bit_readable_table,
> +		.wr_table = &ad5529r_16bit_writeable_table,
> +		.reg_stride = 2,
> +		.reg_base = dev_addr << AD5529R_ADDR_SHIFT,
> +	};
> +
> +	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(ad5529r_supply_names),
> +					     ad5529r_supply_names);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable regulators\n");

> +	for (unsigned int i = 0; i < ARRAY_SIZE(ad5529r_vss_supply_names); i++) {
> +		ret = devm_regulator_get_enable_optional(dev,
> +							 ad5529r_vss_supply_names[i]);
> +		if (ret && ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to get and enable %s regulator\n",
> +					     ad5529r_vss_supply_names[i]);
> +	}

Hmm... Can we use bulk regulator approach here?

> +	ret = devm_regulator_get_enable_optional(dev, "vref");
> +	if (ret == -ENODEV)
> +		external_vref = false;
> +	else if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable vref regulator\n");
> +	else
> +		external_vref = true;
> +
> +	/* Wait 10 ms after power-up before the first SPI transaction. */
> +	fsleep(10 * USEC_PER_MSEC);
> +
> +	st->regmap_8bit = devm_regmap_init_spi(spi, &regmap_8bit_cfg);
> +	if (IS_ERR(st->regmap_8bit))
> +		return dev_err_probe(dev, PTR_ERR(st->regmap_8bit),
> +				     "Failed to initialize 8-bit regmap\n");
> +
> +	st->regmap_16bit = devm_regmap_init_spi(spi, &regmap_16bit_cfg);
> +	if (IS_ERR(st->regmap_16bit))
> +		return dev_err_probe(dev, PTR_ERR(st->regmap_16bit),
> +				     "Failed to initialize 16-bit regmap\n");
> +
> +	ret = ad5529r_reset(st);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
> +
> +	ret = regmap_assign_bits(st->regmap_16bit, AD5529R_REG_REF_SEL,
> +				 AD5529R_REF_SEL_INTERNAL_REF,
> +				 !external_vref);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure reference\n");
> +
> +	ret = ad5529r_parse_channel_ranges(dev, st);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->name = st->model_data->model_name;
> +	indio_dev->info = &ad5529r_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = st->channels;
> +	indio_dev->num_channels = st->num_channels;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
