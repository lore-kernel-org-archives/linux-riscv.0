Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F14C02197
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sckFdHVWRpDPyQ4cGZ30qgc70QYpiaH5jswS/r+syIE=; b=o6XIsXWnYonm6S
	itHz6bKngv7Nwq7bKAzAXpcf10aSUV7iz0TkjXvecfl9kcbI5SqI6c3TZb7vzMAKgmklXOAb4zF8t
	piO1xQIyjZxgOt+k+gvKzs6VI4/vSUxVqeciEokA++ljN1Zl42qpj3LPykSpWXgC9+L36RyoDWZht
	bMTD0/W7tuhRJK8fvnJlf3U/O82E9Xt4KgqlyJIOuxgWeVdo/cFnF0mxgEYapJza9m8cV/DztrxZB
	ompokP5xXKXAZiqcxN5udv/2yT7tZZ3QRFS/xStko2abcFpNS1OTuv1zeLPnSCcwbkhFwl+cm1vRz
	Jclyi5uKuwKUkQfkhPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMr7-000000017w1-0ggV;
	Tue, 04 Feb 2025 17:37:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMr5-000000017uk-36Kp
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Feb 2025 17:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4L7l6MFXXcUV2bVk30z6MXm5Qm8mijm5NNhAeSWGtXg=; b=pEOkM9BPsdt1mGelEUUA2AxJ1A
	Bh+WprkZWxv6/dm31+c0bEA/OqJsLivFwtDX0ky9MKHKhlsJFk1Nez9gZAwtYeRL9EMfnTc8u/NQX
	MI/kBiIxgPdiBzeuu7WkSSkHDJP8ApuZiFMgtSH6/Gnq4Dor1HCKcAZ5UKfTLAguGqr4uq/oV6dMN
	uzxIgIpTkzk2ggkNhcYGgaaMw/eBqKXUaBAFU463F5SRZZa3+TyNr147fN4xWy4cq9ysSODZdAvui
	Oo8KzLD56frTj4tRc2hn4iA1I96RxGBwD1y2Tzg3kctWyHjkHkwsDEVoC0qibRgpp/TVsJmIqbSKv
	YJOwSIaA==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMr2-0000000GM1N-2UQq
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 17:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690616; x=1770226616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pIXT1Hs1aUtzZe3Mmj8B+f4h66p4s3gODDX3GQGG9jk=;
  b=dauHiidCPluzS6tfqADEQksDDCD7csPUOENdc32xOwZkD0Aexo7MQy2v
   BhI8qIsiRaxmiZyt2RRzJ7yjrcPk++++8sXSVcKxEq8SCEc1gZ+DGzy5u
   uQGLnhwLOqskRALdm05CskGDcOKV37HIi65aRQRdG9LUXb0gMQy7UIQrq
   Cd46xgVzWTSVgox4gFz/1zwlmmTTDMnmJacgCfPJFZHNyzSkvuOPOd8Mr
   1CWYdvxvnP11v/4yNgLtdRA3ZlcUT9ZR0Vq9xilj2lpaye+E+hvE2vuvQ
   er9kQGlF3sczj79p+EAdDK+ZljKg78NFFQmR90MqFdqpc4OO1ZWG/v3EY
   A==;
X-CSE-ConnectionGUID: BsCiqubTRkmKklatRk5z/g==
X-CSE-MsgGUID: 4KqK2rMPQS64mBhRFmGe5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64583766"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="64583766"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:51 -0800
X-CSE-ConnectionGUID: wCA9AbmgQMu5wOszPK0wRg==
X-CSE-MsgGUID: fMhha4lFQUKbtEVcr0PRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="110494598"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfMqn-00000008DQ7-3FFR;
	Tue, 04 Feb 2025 19:36:41 +0200
Date: Tue, 4 Feb 2025 19:36:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <Z6JQKQnBeB2Z9XQY@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
 <Z6DJ9kmNx4JoqRg-@sunil-laptop>
 <Z6DVDicVEgmSyGcT@smile.fi.intel.com>
 <Z6DVn8u-2EwMaMR4@smile.fi.intel.com>
 <Z6JHG-nqFWDv-jpE@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6JHG-nqFWDv-jpE@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173657_102142_248475FD 
X-CRM114-Status: GOOD (  20.70  )
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

On Tue, Feb 04, 2025 at 10:28:03PM +0530, Sunil V L wrote:
> On Mon, Feb 03, 2025 at 04:41:35PM +0200, Andy Shevchenko wrote:
> > > Ah, interesting. The original change that introduces this 3e3119d3088f ("device
> > > property: Introduce fwnode_property_get_reference_args") hadn't been reviewed
> > > by Mika or me, that's probably why we are not familiar with.
> > > 
> > > Since interface is already established, I would recommend to fix
> > > this as proposed, i.e. with a new API. This is the way to match
> > > how OF seems to be doing.
> > 
> > For the reference see implementation of of_fwnode_get_reference_args()
> > 
> > 	if (nargs_prop)
> > 		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
> > 						 nargs_prop, index, &of_args);
> > 	else
> > 		ret = of_parse_phandle_with_fixed_args(to_of_node(fwnode), prop,
> > 						       nargs, index, &of_args);
> > 
> > 
> Thanks!. I can do similar. But the change in
> __acpi_node_get_property_reference() will be still required since that
> is the place where the actual decoding of AML object is done. That would
> be similar to __of_parse_phandle_with_args() as well. Hope that is fine.

You don't need that. Split the core part to local static helper that
takes whatever it needs, but being not visible to anyone outside
drivers/acpi/property.c. And build the current helper and new visible one
on the basis of this split. For better reviewing and maintaining you can
split this approach to two patches: 1) preparatory by splitting a new
local helper; 2) the introduction of a new API.


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
