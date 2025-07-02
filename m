Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B601C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Aaeo/9UU8Jwuqc9X5g54vXW/0PW+hfCzCXn74g0NFI=; b=Rtk6gPSiqQCA72
	FDVZnDWOhu69B+GawAQF9j/0RDMd0mCkVI5zWmIQJdycXaT9yCcz2XHpAHH+2y3aSbbIYdtrDki5t
	T33J5pmV5CfHENZZbNEdsHuvXPQrATEBBorjwG13DCoKU554HmPjxQgOReSas8H5Bhqq3T5YrdcSm
	YcZcTmSnBex5QNMwxxOFeyxQCfvqmL9uVNdcTmmjZYhIdsxieOQP9e2AavxmPCMV7el0/Hxt4gOLy
	o+ebqcnKp06gQZA+Fuvc+lbpTtdWOWzfutuw1CW0Y6S6tc+2jZgxCOUajV1WzzDDB+HUWV3y9MoO4
	LMdzma+tAqzbDVs7Aqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwXS-00000008Jdu-1tGx;
	Wed, 02 Jul 2025 12:26:10 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvtB-00000008Awt-0sOj
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751456673; x=1782992673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BpBCvq4RPD3JQB3NRc9+j8XkTmlFaTJQQCP78Asb59M=;
  b=ANu+x2whOGNRDhWJE5zkh3YPH1I4Z2Qo7+UxTqOnrVz2LIagbpglfuK5
   GdzkFJ2s9yHERm0upmk3/zYG0oh40hgz5ZfTLvpR8fp3NwTeeSxLbHgKb
   qfhltuZhRjnHv8zPTxLTJEtoMgVMTNeApmC/PzfbgGN/jxD5sIq4W312h
   dCBrHNmzZYbVSQfxmJFI/vLJboTT9bV2bfrRm3AzHiSlJCsQQB9401JY3
   Qp5rsMIHKiEllH5lyAyCaCR+vtxe+45Q4x9EzCWP/4JPlWE5thikbe2PS
   YxcUnr1F3YQGqI4gzoCdvFst7d8DuUJTweZfp+zfVm5hevBpn3RefY0LH
   Q==;
X-CSE-ConnectionGUID: GylVQvafTzqhfERMjyf7gg==
X-CSE-MsgGUID: Iq/Rk+QiTJKw11J11cKi8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57555491"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57555491"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:44:32 -0700
X-CSE-ConnectionGUID: kvCPwjhTQvmObDaiwBgeGQ==
X-CSE-MsgGUID: oaJ5N5q4RoCq/O4ueG6nsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154393699"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:44:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWvsz-0000000BuFM-3tNf;
	Wed, 02 Jul 2025 14:44:21 +0300
Date: Wed, 2 Jul 2025 14:44:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
Message-ID: <aGUblcoNMCFiK3CL@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-16-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_044433_260425_A3185FFE 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 10:43:36AM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Currently, ACPI doesn't support cells property when
> fwnode_property_get_reference_args() is called. ACPI always expects
> the number of arguments to be passed. However, the above mentioned
> call being a common interface for OF and ACPI, it is better to have
> single calling convention which works for both. Hence, add support
> for cells property on the reference device to get the number of
> arguments dynamically.

You can use Elvis to shorten lines, but in my opinion this is okay change
overall. FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>



>  
> +			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
>  			element++;
> -


u probably want to leave this blank line and rather move the new code here

			element++;

			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);

>  			ret = acpi_get_ref_args(idx == index ? args : NULL,
>  						acpi_fwnode_handle(device),
> -						&element, end, args_count);
> +						&element, end,
> +						nargs_count ? nargs_count : args_count);

						&element, end, nargs_count ?: args_count);

>  			if (ret < 0)
>  				return ret;

...

> +			device = to_acpi_device_node(ref_fwnode);
> +			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
>  			element++;
> -
>  			ret = acpi_get_ref_args(idx == index ? args : NULL,
>  						ref_fwnode, &element, end,
> -						args_count);
> +						nargs_count ? nargs_count : args_count);
>  			if (ret < 0)
>  				return ret;

As per above.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
