Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF204C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKCmJEr1dPRL7YxIgdJAPumb5oL4CdA5gfBZejBkOaw=; b=xGIIvHjFtZiT4B
	oT2mtUDW0bPNhWbBU2T128Vl+fAZdx2CH7uA95dCoATNeXJPY7iEjzfYmTDyLQeub7SNTwacKyC9s
	yBcUXEJjf+0DJOdsU6Kp5SVa7u4xzLQXq+cGIXqvepcmlieBNK2zGWb/DIklD8i4Yp0Kod/GOmYSf
	0XUZDdO5RQJs/Vb8ZGxN0ju9jwEcJ3f/AkXcWxZi7ukv1rMoDZQQLMUd4/lSe5DGrs4SXTI/junCh
	s4rmV85S4xG32bxayVyqMYbRK5WybjOtG2EKDLIriC2hb+5qvDQ/1AtXNdKGHKAfuT5j0YOCV5Ids
	uJpfY/Houy1KaV8zVlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENGk-00000008arM-0jk2;
	Mon, 12 May 2025 07:08:10 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENGh-00000008aqH-0tzD
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 07:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747033687; x=1778569687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mul8tNeRrypv/NSAZe83gZO8+DlWm98zYe0h3LwG4jg=;
  b=BhDDGP1QxhvTeMB5md+JrSu5AEU1vHZtdCIE85Seja46DrRnOKp3JZe0
   VMYa7kyOeKJ6jFlGYNl5BozDPNzd5N5d25UOr6MXe7n3ojJu/osNxHlhe
   XVzyA/KcBehTCH+EBEadGAFtE2PTfTASetvnNX6BthI0VCmqUB7wNGmwd
   iMH4f+1ilnFXV7mVF3uAoMvX8HDknCOjJmW56rpXKa0lXaMyEGcWED3ZT
   InoevZ2ZmxRyMLebcGohZLNfz1WTtpRhCcoU0nrsKqaKE/bbiuCDz/AXC
   yHh+rMyhG3h3LxAmrRxL35nmLplJ4uFX3bL+J4PurJdcgxF6d0xBLfXTO
   w==;
X-CSE-ConnectionGUID: IjhTUwtrTW+2jlYSlao6pA==
X-CSE-MsgGUID: /0R/ixDnQRaymlxo+xhhWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66355108"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="66355108"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:08:07 -0700
X-CSE-ConnectionGUID: +NC4/pH6QHKeJIQkvRlB3Q==
X-CSE-MsgGUID: zFExEVxoRFiOmm8OdIwj5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="174434482"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:08:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENGX-00000000qLL-0P5S;
	Mon, 12 May 2025 10:07:57 +0300
Date: Mon, 12 May 2025 10:07:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-11-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_000807_325213_70C884EA 
X-CRM114-Status: GOOD (  28.86  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 11, 2025 at 07:09:26PM +0530, Anup Patel wrote:
> From: Rahul Pathak <rpathak@ventanamicro.com>
> 
> The RPMI specification defines a clock service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.
> 
> Add mailbox client based clock driver for the RISC-V RPMI clock
> service group.

...

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>

Just to point out again that the above misses a lot of headers definitions
and/or APIs this driver uses. Follow IWYU principle.

...

> +#define GET_RATE_U64(hi_u32, lo_u32)	((u64)(hi_u32) << 32 | (lo_u32))

Hmm... Perhaps add this kind of macro to wordpart.h ? IIRC not only this driver
uses something like this.

...

> +enum rpmi_clk_type {
> +	RPMI_CLK_DISCRETE = 0,
> +	RPMI_CLK_LINEAR = 1,

> +	RPMI_CLK_TYPE_MAX_IDX,

No comma for the terminator. Please, clean all these cases.

> +};

...

> +union rpmi_clk_rates {
> +	u64 discrete[RPMI_CLK_DISCRETE_MAX_NUM_RATES];
> +	struct {
> +		u64 min;
> +		u64 max;
> +		u64 step;
> +	} linear;

Have you looked at the linear ranges library we have in the kernel? Can you
utilise it here?

> +};

...

> +struct rpmi_clk {
> +	struct rpmi_clk_context *context;
> +	u32 id;
> +	u32 num_rates;
> +	u32 transition_latency;
> +	enum rpmi_clk_type type;
> +	union rpmi_clk_rates *rates;
> +	char name[RPMI_CLK_NAME_LEN];
> +	struct clk_hw hw;

Just a reminder to use `pahole` to check that your data layout is optimised for
memory consumption.

> +};

...

> +struct rpmi_get_supp_rates_rx {
> +	u32 status;
> +	u32 flags;
> +	u32 remaining;
> +	u32 returned;
> +	u32 rates[];
> +};

Is it ABI? (I mean if this is interface with some kind of FW)
If so, Use proper endianess aware types. Same Q for all data
types defined in this driver.

...

> +			for (j = 0; j < rx->returned; j++) {
> +				if (rateidx >= (clk_rate_idx + rx->returned))

Too many parentheses.

> +					break;
> +				rpmi_clk->rates->discrete[rateidx++] =
> +					GET_RATE_U64(rate_discrete[j].hi,
> +						     rate_discrete[j].lo);
> +			}
> +		}

...

> +	devm_kfree(context->dev, rx);

Why?! This is a red flag to point that here is misunderstanding or abuse of
managed resources approach. Either use __Free() from cleanup.h or don't call
devm_kfree(). The latter must have a very good justification to explain why.

> +	return 0;

(this is even not an error path, where it might have a little argument for)

...

> +	/* Keep the requested rate if the clock format
> +	 * is of discrete type. Let the platform which
> +	 * is actually controlling the clock handle that.
> +	 */

/*
 * Use proper style for the multi-line comments. You can
 * refer to this comment as an example.
 */

...

> +out:

Redundant label. Note, the labels are recommended to be named after the flow
they will run if goto. This one can be named as out_literally_with_return_0,
which makes it obvious how useless it is.

> +	return 0;

...

> +	rates = devm_kzalloc(dev, sizeof(union rpmi_clk_rates), GFP_KERNEL);

sizeof(*...)

> +	if (!rates)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rpmi_clk = devm_kzalloc(dev, sizeof(struct rpmi_clk), GFP_KERNEL);

Ditto.

> +	if (!rpmi_clk)
> +		return ERR_PTR(-ENOMEM);

...

> +	ret = rpmi_clk_get_supported_rates(clkid, rpmi_clk);
> +	if (ret)
> +		return dev_err_ptr_probe(dev, ret,
> +			"Get supported rates failed for clk-%u, %d\n", clkid, ret);

Indentation issues. Repetitive ret in the message. Please, get familiar with
the format dev_err_probe() uses.

...

> +	int ret, num_clocks, i;

Why is 'i' signed?

...

> +	/* Allocate RPMI clock context */
> +	context = devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);

Ha-ha, you have even inconsistent style in the same file! So, go through the
whole series and make sure that the style used in each file is consistent.

> +	if (!context)
> +		return -ENOMEM;

...

> +	/* Validate RPMI specification version */
> +	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to get spec version\n");
> +		goto fail_free_channel;

This is simply wrong. You should not do goto before any devm_*() calls.
The error path and ->remove(), if present) is broken. Fix it accordingly.

Here should be

		return dev_err_probe(...);

it's your homework to understand how to achieve that. Plenty of the examples in
the kernel.

> +	}

...

> +enum rpmi_clock_service_id {
> +	RPMI_CLK_SRV_ENABLE_NOTIFICATION = 0x01,
> +	RPMI_CLK_SRV_GET_NUM_CLOCKS = 0x02,
> +	RPMI_CLK_SRV_GET_ATTRIBUTES = 0x03,
> +	RPMI_CLK_SRV_GET_SUPPORTED_RATES = 0x04,
> +	RPMI_CLK_SRV_SET_CONFIG = 0x05,
> +	RPMI_CLK_SRV_GET_CONFIG = 0x06,
> +	RPMI_CLK_SRV_SET_RATE = 0x07,
> +	RPMI_CLK_SRV_GET_RATE = 0x08,

> +	RPMI_CLK_SRV_ID_MAX_COUNT,

No comma in the terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
