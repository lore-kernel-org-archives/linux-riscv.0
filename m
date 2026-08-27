Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC6FC61DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKXqloSK5NNSs6lZZ1bnbv+Bnm4d/IiwN0Nni/nRUn0=; b=WRjEvv/o65sJYp
	8HVdkrKvEPyy4PjqmVIvZ8P2BzzTArA9TYNUZQjob6SzZkG2xPaDier9z8ESJ8IenUCLXYCn7c7QR
	bCfjVp6YNi1BNlyFbIs0S9UB7y5fMr4fhzYgDkOuZESeNw5/wJwwcuibsAWehmuimzyDLiokkwBDo
	jRr+/l9lwMrcGrSHy0+F+8EUwhvHwlY74NNWhOSNMtFXEwH/5lcpByP+aPvoq4dYZkW6EnGhzOiKp
	exIzlCrU4KLGf70tzW31XhDOmJzk2VB3qIw94TstegFBWpOIIGW8QiNAhpXbOGu1joxJV4iCbf+X6
	9i58HRl5bzf6sqOmSkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWGP-00000003izQ-1jLF;
	Thu, 27 Aug 2026 09:19:13 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWGM-00000003iyz-1cjQ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 09:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787822350; x=1819358350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MEUF1NgIQ2o8y07dT6rcSGit38kuev4FCU62GKNlPz8=;
  b=Ga7XTG9fyxB2iPlr18fQb12fNOXetMlXaZdMdOrbsV6rbeRO0sQGwrYC
   0Z1aloBxWVHtaUgVIAsALT39LrsL2WJx+QVjIdHqMehZiPMJUbFBoFeQV
   x7p4U/3FLkTH8n8UQ/fUXnG1TwL6N5YGVvErEnj7QtTkJZ3YNGoZHkp6n
   /tKzqNg5AS6asIn6QYxRql0ZTk7loGnywhk+Dz4x99cQtiCYzWp1sH3VQ
   b9moYhcTXckh3rmo51973qZifkEo1Qodc+gxLowG1kcDhdLN/wvY+Z2KC
   BC6C9NisOZlYIOcx4ZuV76lQW1tlqKxnt2ZWI9pFB0k4dX/6kxtU1NRJs
   w==;
X-CSE-ConnectionGUID: EdhNJs2bT+m8UETb24HZ+g==
X-CSE-MsgGUID: 217rNc4ZQDy8v69w6AN7UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105692547"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="105692547"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:19:06 -0700
X-CSE-ConnectionGUID: PoVM2A/cQPiikVGo2Ndg3g==
X-CSE-MsgGUID: G9q0iJJkRr+am2kPlS0P/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="292657822"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:19:00 -0700
Date: Thu, 27 Aug 2026 12:18:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Janani Sunil <janani.sunil@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
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
Message-ID: <apABAXL3OzSVc3AS@ashevche-desk.local>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <20260827103019.00002663@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827103019.00002663@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_021910_488276_897340C5 
X-CRM114-Status: GOOD (  15.14  )
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

On Thu, Aug 27, 2026 at 10:30:19AM +0200, Joshua Crofts wrote:
> On Thu, 27 Aug 2026 09:34:48 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:

...

> > +#include <linux/array_size.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/iio/iio.h>
> 
> IIO specific headers should go after the generic <linux/*> headers,
> it's just convention.
> 
> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/reset.h>
> > +#include <linux/spi/spi.h>
> > +#include <linux/types.h>
> > +#include <linux/units.h>

When it's a single header we don't strict this too much.

...

> > +static int ad5529r_write_raw(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan,
> > +			     int val, int val2, long mask)
> > +{
> > +	struct ad5529r_state *st = iio_priv(indio_dev);
> > +	unsigned int reg_addr;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (val < 0 || val > GENMASK(st->model_data->resolution - 1, 0))
> 
> There is a function for this - in_range(), in linux/minmax.h.

This is a trade-off and sometimes open-coded variants are okay.
I'm fine with either.

> > +			return -EINVAL;
> > +
> > +		reg_addr = AD5529R_REG_DAC_INPUT_A(chan->channel);
> > +
> > +		return regmap_write(st->regmap_16bit, reg_addr, val);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
