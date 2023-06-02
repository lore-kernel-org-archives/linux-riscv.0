Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F20C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WSySAENZVMQLYYngFnTqz8TcRkRl+y0splJykAKusM=; b=CE+tn47bYAJZ/B
	JrwtjGDI8SfpEa4GzQd6VDo0QbVA99D2wPaNY4fgBgYIreLXW13dbLJzpscopZyfMixPhNV/Ob02N
	ZIIGwYfI7GWv165aF80qQ35ggJSkd54u3c8Q6h8kWYBfKweswdp3vJw/ZuFlXOTaeIfmt/a1A+tSj
	bhsNOX0sAC15TC2jj2AVuTf17uvcflSEnicQPpVDLjucqsA9pJkUycc6JB9dOkXUNE8ZIj6l5fJo2
	rcI1bEfixqEba2bzodbNaLqZGLkt0gdZYRD0N8HkpCjasWdmSm7Yy8HihamR6pLk4jmEwtikTRFfl
	u2PbRi14BCdY5pOhuU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q565i-0079fQ-0L;
	Fri, 02 Jun 2023 14:49:22 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q565e-0079eP-1e;
	Fri, 02 Jun 2023 14:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685717358; x=1717253358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YPUlxeS32cApP+ZDIUHR9khrq40A8i+TVQo/LyymAAg=;
  b=PJSC832DQt4fw6Mg5Js8wcQnoYStLOALwkvEMeYopZzIuHh8iZCjJAk/
   +/AAOiv75uHIwgyYQD5Ji7mT/YY0rPeKY6o6nk9QcGXe1OKMF7gXuCIS8
   aJWUr10jfO2qBbva4GJQ2j2FdEAEof6e2q/r7gacv72cOrJEyyXP0bBUL
   WwKUSrfkaWMdf566AuCaaJ6AOOwxPLRI9abUUsxLn9fG+680dfs5A/NCr
   /matzKUYpPadmsihYTzQb1tepNlSyRKCczx2QVSAdPnxdLxRcXqArm+bN
   aXOfJee3XJOPcxYWGPDg2zdn3BlVyz/VT2dRp083bqned3y31ryjhufMc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="353378803"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="353378803"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="772905903"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="772905903"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 07:49:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q565Q-000fQj-0X;
	Fri, 02 Jun 2023 17:49:04 +0300
Date: Fri, 2 Jun 2023 17:49:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>, Arnd Bergmann <arnd@arndb.de>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs
 GPADC
Message-ID: <ZHoBXxM80aqvLZNt@smile.fi.intel.com>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-2-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601223104.1243871-2-bigunclemax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_074918_591962_06A0CD4A 
X-CRM114-Status: GOOD (  21.66  )
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

On Fri, Jun 02, 2023 at 01:30:39AM +0300, Maksim Kiselev wrote:
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

...

> +struct sun20i_gpadc_iio {
> +	struct regmap		*regmap;
> +	struct completion	completion;
> +	struct mutex		lock;

The locks should be explained (what are they for? what do they protect?).

> +	int			lastch;
> +};

...

> +static const struct regmap_config sun20i_gpadc_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.fast_io = true,

I forgot if I asked about regmap lock do you need it?

> +};

...

> +	if (!wait_for_completion_timeout(&info->completion,
> +					 msecs_to_jiffies(100))) {

Dunno if it's better to have this parameter to be defined with self-explanatory
name.

> +		ret = -ETIMEDOUT;
> +		goto err;
> +	}

...

> +err:

err_unlock:

> +	mutex_unlock(&info->lock);
> +
> +	return ret;

...

> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = sun20i_gpadc_adc_read(info, chan, val);
> +		return ret;

		return sun...;

> +	case IIO_CHAN_INFO_SCALE:
> +		/* value in mv = 1800mV / 4096 raw */
> +		*val = 1800;
> +		*val2 = 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}

...

> +	if (num_channels > SUN20I_GPADC_MAX_CHANNELS) {
> +		dev_err(dev, "num of channel children out of range");
> +		return -EINVAL;
> +	}

Is it really critical error?

...

> +	channels = devm_kcalloc(dev, num_channels,
> +				sizeof(*channels), GFP_KERNEL);

At least one more parameter can be located on the previous line.

> +	if (!channels)
> +		return -ENOMEM;

...

> +err_child_out:

err_put_child:

The goto labels should be self-explanatory of what to expect when goto.

> +	fwnode_handle_put(node);
> +
> +	return ret;

...

> +	ret = devm_request_irq(dev, irq, sun20i_gpadc_irq_handler,
> +			       0, dev_name(dev), info);
> +	if (ret < 0)

Here...

> +		return dev_err_probe(dev, ret,
> +				     "failed requesting irq %d\n", irq);

...

> +	ret = devm_iio_device_register(dev, indio_dev);
> +	if (ret < 0)

...and here, do the positive returned values even possible?

> +		return dev_err_probe(dev, ret,
> +				     "could not register the device\n");

...

> +	{ .compatible = "allwinner,sun20i-d1-gpadc", },

Inner comma is not needed.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
