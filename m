Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581EAC61DE2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=702uVQyVR3dAx97ExL0HnOB6HafScQvjiUOUBSQU3no=; b=WsGs+/1wJCfxIA
	xfJ27MwDsmSnxRswBFToNbyRZmZtkaH+LFVhXtTOTqDkqx1vHrncLfj432AZJ4bFJSMu1/HhJ9U37
	ZGTlxwHlJWWqfv6xf/W/trdTs2e+XBH3IyLR1p999eYPTEwEMYvYhgTd49o72CnOvfbnIjqycWks+
	eOL5MS6p4qeQ1kE53lg8qT8jU8q4QEgsQjtlU9rkSKbUsJE33PgGbZb023+sgKRFy1nTDUtj53x89
	3ZRpToVNK89bgUG6p3L2SDyvTlHGxWE5iV6OMn44itIuqqWcVlP48VuFfltjQ3utEciygkvLvtpyi
	GHRIaQzEOfS7iZqoObhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wA9-00000008glX-0eGu;
	Mon, 31 Aug 2026 07:10:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wA6-00000008gky-3hYX
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 07:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788160236; x=1819696236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DCGlvKDUkP1G/KwYWNTX6WcOhRQbdg3ohXwUPm4DSI=;
  b=jr6f0nEGdVY0h20ffaWAKrjJipVVncRmujLKoiMjS6JsUAZlVoBGh9vw
   BcOAKW7Q0h/M2j1NHQPL6bkCnu7uFjkLKZ87UxnGsgZaStxeq0MhIplgl
   NTVvyp32dhdq0c+Jdo0mLi5fzfkl+HOsP3LRBi8+LGDJqM5UBIOxqUSu8
   4yAVnFR+NDewdaHVW4xPzRFrdkqJE5INWNiJoGgxHkPRB4HDAFPhd0qDk
   5tSk1VJ5KV4Vxbceg/qAn0+cwqKe5Q2kq2U7UbC4NEgmHz6a8pUitAaOO
   hl9VQyRT46s6fscnS7ZhzMAnBLbm7Pmd32ea7ytRjRKsekx2tW8N0j2+u
   Q==;
X-CSE-ConnectionGUID: SNliNwwDTSilCdb1Uz5tVg==
X-CSE-MsgGUID: EmB59MMNSYmL2mbOQSp9NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88583722"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88583722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:10:34 -0700
X-CSE-ConnectionGUID: RdRENIHISO+A1ZRClSZCcw==
X-CSE-MsgGUID: /uYFfDbIQOe5kO6KqRv6hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265478049"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:10:28 -0700
Date: Mon, 31 Aug 2026 10:10:25 +0300
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
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <apUo4afCh5LhUqIO@ashevche-desk.local>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <ao_z9QTJC_q8gH0v@ashevche-desk.local>
 <178813177252.2788519.10940489053707901297.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178813177252.2788519.10940489053707901297.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_001034_966285_E3044495 
X-CRM114-Status: GOOD (  15.51  )
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

On Mon, Aug 31, 2026 at 12:16:12AM +0100, Jonathan Cameron wrote:

...

> > > +	device_for_each_child_node_scoped(dev, child) {
> > > +		if (st->num_channels == ARRAY_SIZE(st->channels))
> > > +			return dev_err_probe(dev, -ECHRNG, "Too many channels\n");
> > 
> > Okay, this actually better to be ENOSPC
> > 
> > > +		ret = fwnode_property_read_u32(child, "reg", &ch);
> > > +		if (ret)
> > > +			return dev_err_probe(dev, ret,
> > > +					     "Missing reg property in channel node\n");
> > > +
> > > +		if (ch >= AD5529R_MAX_CHANNELS)
> > > +			return dev_err_probe(dev, -EINVAL,
> > 
> > and ECHRNG is here.
> 
> That one is getting rather creative even though I guess the description
> does fit rather well.  So I don't object, but also feel -EINVAL is
> probably good enough for an invalid property value.

But missing property message propagates the fwnode return code (which will be
EINVAL IIRC). So the above is not about missing property, it's about wrong
channel. Note, I have checked uses of ECHRNG in the kernel, and many of them
are fine with the suggested one.

> > > +					     "Channel %u exceeds maximum 15\n",

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
