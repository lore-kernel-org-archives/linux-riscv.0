Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51278C5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+eOLO7Zdmpf7BwPWqnnlyt/BhKQjhyguN8eBRtb0kU=; b=SxB0NDZAyViuH5
	4IThkIThm/MSgIBe21mP9MLLCX2E4aDLfnAfMACDiic8Z5rDHzYq5lK+8MPwy7TVqqADyqYYs2ar1
	v67+QUpIK/7j+Q4kUsNnT/Sg1wo24Yj51ccGhkyF6RXQgb4xFl8hOyjMtvU0UmsMfhZ9/5G9/d4LD
	T4OJgu6IfxzI+VE25lj1XPpdjv3RmdSpNX09alVV4yOlbfzgHCf+ml1MTjuJvw2+0LdAssndFjrig
	I/BF1DeM3xdg/kehY3KedO5ueTaMWHpKAGmAIqUaCNrelH+tbb+RNkKAKhVpauojJ/xyaXHJcRi4t
	AMaXre5RfZvD2xN6mMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLpz-0000000Cwk9-3uQq;
	Fri, 21 Aug 2026 09:46:59 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLpx-0000000CwjD-0YE1
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 09:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787305617; x=1818841617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8v2/ogFndfgh8m90+gQPp4REVawnYyCxxkJjTJIox8=;
  b=KlLtzIU7dk4GZz8k3mDK8hKmt1YyDhrk7ayWdJBcJaKh0dWsGDX5Dt4B
   PAuLCxb2GbMmky/xLIWutlrPOVnKXoWrmNPMRk9o31TW82fnEu8VmjFLy
   Y0mRPqK9dGH78i/H7xZ8spR56I+cxSf3CXDvOZN5Gl+OIWdJq12ITYkKj
   7jN5CizPtr/KTAUYuqG/wiuAXb89zhhKbSU/8dzXFN/okHBZDNzeKuRPa
   MYK9qFItnsQu3aiIDq429imjGlQ9pV0t8s7vCf3w3cH/N4lN79hq6TMLl
   hH6e3DP5G0snOp81+Hw9MMJtEaSSFKTcT0pP3dd5tevNIZUl6cihNPVkL
   Q==;
X-CSE-ConnectionGUID: HIJmSToJTY+1vwrpL+xhQA==
X-CSE-MsgGUID: ikf7S+scQZ2NSkw1rz5mSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87621803"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="87621803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 02:46:55 -0700
X-CSE-ConnectionGUID: YY5c0jAQQ7CiuzwVDXO3EQ==
X-CSE-MsgGUID: ++tW1p51QbGSL2QypOxziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="270114138"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.241])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 02:46:49 -0700
Date: Fri, 21 Aug 2026 12:46:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
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
Subject: Re: [PATCH v9 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <aogehm5B7hoqmnKo@ashevche-desk.local>
References: <20260820-ad5529r-driver-v9-0-ba62e0b2a816@analog.com>
 <20260820-ad5529r-driver-v9-3-ba62e0b2a816@analog.com>
 <20260821024503.592fabc1@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821024503.592fabc1@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024657_209751_B91BE908 
X-CRM114-Status: GOOD (  16.98  )
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

On Fri, Aug 21, 2026 at 02:45:03AM +0100, Jonathan Cameron wrote:
> On Thu, 20 Aug 2026 09:08:23 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
> 
> > Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> > from Analog Devices.
> > 
> > The device communicates over SPI and supports per-channel output range
> > configuration. An optional external 4.096V reference can be used in
> > place of the internal reference.

> Sashiko calls out that dependency should be on CONFIG_SPI.
> 
> I didn't check it's reasoning but I believe the conclusion is correct.
> If that's all that comes up, I can tweak whilst applying.

Interestingly we have the following statistics (might be a few cases missing):

$ git grep -n 'depends on.*[[:space:]\(]SPI_MASTER' | wc -l
156
$ git grep -n 'depends on.*[[:space:]\(]SPI\([^_]*\)\?$' | wc -l
299

But reading the Kconfig I tend to agree that what we need is SPI_MASTER.
SPI might be enabled for SPI_SLAVE only, would it mean we have a usable
HW on such a configuration / platform?

> Looks good to me, but I'll leave it on list for a little longer
> as we aren't in a rush and others may well want to review.

...

> > +config AD5529R
> > +	tristate "Analog Devices AD5529R High Voltage DAC driver"
> > +	depends on SPI_MASTER
> 
> depends on SPI
> 
> > +	select REGMAP_SPI

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
