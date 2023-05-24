Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C30C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNXHgveis5ZelYyBi8I7B+urtBtCivreTyADVI/ifpc=; b=kCI5pDGYw1oRl3
	x2lDUs78eSb+JUFKry/Mkwm5F2W3YRFq8T6OpWbZ8k9enNo6dBV92XfW0ktWQXrPisow+MdvtXxo4
	Tt7CFvwLUPq+eNvaNjodm0PSOofken/uz03UMemk6aX8KKDIDciTtFdP0z5gvBPYwpKQieXrM3xAD
	q1eKzv70l7FrOxulUyw4uFcuux/ltGMPDxRw1w0hPuxZsivwpFeARpjCqGSqV7qHMZNCCEm3hM7pz
	A+P6ygS5xyFbv3LnEQ7KSfml8kcxPMy0BVrN9iLmln9YTCRlGkVrtEr5+f2tHtlZiNO3K1BuGme46
	tQaWg0c5L1JeACvmywaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mL0-00DHJt-1R;
	Wed, 24 May 2023 11:07:26 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mKu-00DHHQ-2e;
	Wed, 24 May 2023 11:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684926442; x=1716462442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dwI8xxMEjunWpxl7fD4Qdm430ndHRu9GRBnfhcyQF7o=;
  b=NR1fNKMYvxE85c8diEl8w4fyywh8sNj51wV5G7WIwKRvBpqr1oWbHiVP
   SVdPqQKTm1puq27vJ7KCH9F+QY0p93mPnGp29EfbMsEKlxiU/5OX0qCHT
   Q3T78Z6FzIZkrcP/EcZxJVBQzzk6uY5//U5ILQvNFJCZBAH2ksEX8ZVjV
   ayOrV3Tbj+kRXdpbuacmKhfBVz+smmWI5IEPxukC8U3LfxuV5LbJqw1OA
   vOu6rqzvlAWHSYTWG/Eu1/XzpE0vvimAXT90FaN5sTyHGA0ava0U4YxYb
   ErYBYyy7Pa2EMobdpn+hhz921D5IgT75DrXw2IJM271Ay53AsZuUl2I2M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="353555541"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="353555541"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="774201652"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="774201652"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 24 May 2023 04:06:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q1mKW-000GEH-01;
	Wed, 24 May 2023 14:06:56 +0300
Date: Wed, 24 May 2023 14:06:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v1 1/4] iio: adc: Add Allwinner D1/T113s/R329 SoCs
 GPADC
Message-ID: <ZG3vzxWicUgndMqv@smile.fi.intel.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
 <20230524082744.3215427-2-bigunclemax@gmail.com>
 <20230524110105.4928906c@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524110105.4928906c@donnerap.cambridge.arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_040723_026260_FFFAAACF 
X-CRM114-Status: GOOD (  19.53  )
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

On Wed, May 24, 2023 at 11:01:05AM +0100, Andre Przywara wrote:
> On Wed, 24 May 2023 11:27:30 +0300
> Maxim Kiselev <bigunclemax@gmail.com> wrote:

...

> > +static const struct regmap_config sun20i_gpadc_regmap_config = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.fast_io = true,
> > +};
> 
> Is there any particular reason you chose a regmap to model this here?
> Isn't that just straight-forward MMIO, which we could just drive using
> readl()/writel()?

Even though regmap adds a few nice features that might be used.
For example, locking. But I dunno if this driver actually uses it
OR uses it correctly.

...

> > +	config = of_device_get_match_data(&pdev->dev);

Please, avoid using OF-centric APIs in the new IIO drivers.

	config = device_get_match_data(&pdev->dev);

should suffice.

> > +	if (!config)
> > +		return -ENODEV;

...

> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");

We should not repeat the message that printed by platform core.

...

> > +	ret = devm_request_irq(&pdev->dev, irq, sun20i_gpadc_irq_handler,
> > +			       0, dev_name(&pdev->dev), info);

You can simplify your life with

	struct device *dev = &pdev->dev;

at the definition block of the function.

> > +	if (ret < 0)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed requesting irq %d\n", irq);

...

> > +		.data = &sun20i_d1_gpadc_channels[1]

Also, leave comma here.

...

> > +		.data = &sun50i_r329_gpadc_channels[2]

Same as above.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
