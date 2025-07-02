Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E5DC83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AT2NUwSgKpzQG3fciXXz3kl6ekFiexcjn1fwVDbdY74=; b=d3B0BUnVKkTuor
	fxYjTZRD72ROSiCUIUFYWYQg05hJdoTilKmhR6yB3263mHwXl4izGpKpRebw4uG/S+Z0dm2DZTwIm
	AyoffgBBXEQ1TJ3Oi/2L/CEkrWYz1yF3C4ub8KbeK0NVoZNAeOTtR960FyrVL2uPxmQK8lRzq6jaC
	0kjcuA5ufbSK4L8lhshWEeFxHGXpFBNNCqeYUrEpSQW2bAZsT6RebSTMR9obAisQAqcJFlSOnCQd3
	a30ljDJP1vqpslvIy96M12sUys3PP4kLAhfhC9ZViCtwckIUoEnYb1KsdCT4v9msodAmx31iH8ZDt
	R+8xVs5L4b0h+3iISxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyKn-00000008c4F-2JDz;
	Wed, 02 Jul 2025 14:21:13 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxCQ-00000008Ot1-2pa1
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 13:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751461710; x=1782997710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OiNoLYPohzS6O6OmHodoyDxPsEF4t/bkOwQkU4sWqc0=;
  b=cZ/tcKLm3PNNwdl39dB8ipOUS0WQtzZqQ5OwjtkXGRVwVwcENwVAdP9j
   P63QJ5CtyTkdz/N+LRKi9RWhV2ETFfqal1mT6H3X8tNW5YFw1chSWOTdO
   IIjSqEst4wbBWrpi4SguX2OcH+5LOaG7wGVKcpswbpqr2Ex/l0XHvbbS9
   ZPenZvxU9fGYG8hFdVQAjGFwTg1e+bLq7Rlq5f2txqjnhMaIvHtCiBK+i
   w6zM5JbM1vfcWzz+jgg0RrCwFEFyuizTSi7cOiIcww3tI3Ia0ic2O5YeI
   Z/PEX0qKvwKtVuQZU1oNvPC8IE4rqv7EwfXeW6DIAUI1FGU4rIsN37p3O
   Q==;
X-CSE-ConnectionGUID: BmXiJLaoQEq5LU/mCZ3zWg==
X-CSE-MsgGUID: ADGtYVeoRaGSdNx6lpwPYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64448824"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64448824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:08:20 -0700
X-CSE-ConnectionGUID: /OlEb6b5TiuRhsJx8CCehg==
X-CSE-MsgGUID: D+4XGKXZTUG7f6nocLrJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159771935"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:08:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWxC4-0000000BvT0-2jDn;
	Wed, 02 Jul 2025 16:08:08 +0300
Date: Wed, 2 Jul 2025 16:08:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 10/24] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aGUvOLXXwF8c_czJ@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-11-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-11-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_060830_759820_2832F3F6 
X-CRM114-Status: GOOD (  11.24  )
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

On Wed, Jul 02, 2025 at 10:43:31AM +0530, Anup Patel wrote:
> 
> The RPMI specification defines a clock service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.
> 
> Add mailbox client based clock driver for the RISC-V RPMI clock
> service group.

Now it looks much better!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
One nit-pick below.

...

> +/*
> + * rpmi_clk_rates represents the rates format
> + * as specified by the RPMI specification.
> + * No other format conversion(eg. linear_range) is
> + * required to avoid to and fro conversion.

conversion appears twice. I would suggest use this:

 * No other data format (e.g., struct linear_range) is
 * required to avoid to and from conversion.

> + */

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
