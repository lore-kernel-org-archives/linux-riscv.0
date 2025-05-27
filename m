Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE9C54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RtQVxcAOtNo0PfxIfXV8X+AMmpfqx4wkuZso0IgXuM=; b=Zmj+Oj7rM+ViVB
	dlq0u950thWHt+1bGK+osqgJQkf0FL0v4Znh5PF15dhtW1D6CcKhApwDsePak5V6SkfrkVcP2oIz6
	vGupdd00y+EguIA0U5nrMzSJzwT2Gj532lK4w5qwsQz1jJ3oWm1WT6IY/GqNjvwfAYSUCxJWeD1G7
	9JST8KIoOQS6kPX9Cb51hIA1Q5qwN2E/A49SZx0RaBaclJJVQwbq99EBURx+TQhJAwjYNI+NyXrbD
	bfHv+mdzagUUWgtORejADj0mUAP4vdLH1lh3HJWWAQrMqU0xk9HPHD4qbXY5X8l+gETrB9CTCAUSq
	FFC4C7ZMMjZ939AHGFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsif-0000000AbpL-0T0G;
	Tue, 27 May 2025 11:43:45 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsga-0000000AbdO-12Dt
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 11:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748346096; x=1779882096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W5E3Xu6pVeg4WGDqRtohIYctx/gK/C6GG/OwK5hM5A4=;
  b=BbuyqjympMNyPwv2MjJ+Y0uT24Zjuqe27Er6nWmWLUy4W2Xnx7RAecrT
   JmTVqm9OkhGwps1/MW3r+iNUjdZkcGbTFgauoQx5PYbUf+VcFwqZgHnwz
   hUQKEE3QQNc3lJnYKCFGgY9vSb4rr/k0GcKATRcDqbgmsr+XWgNb3rkMh
   W55PvZULxrc4wQY+IlIqrPuBrrD40rY0TXzYS9Dtz+0axDuyEIEbdSJtI
   rMTcWGCnOCEO8/gOmsaKykm9186BEEFt+pZzxFFHGiaS29ZkhFN4933Mt
   5F6Z0wk9QpH/hD4D21vlbtIE+V4P5HhCgOK91NkFCRXuwXfnyPu2+vZYr
   g==;
X-CSE-ConnectionGUID: eiYn7WmwSOefzOnph2RUMg==
X-CSE-MsgGUID: t4SEVvSSRJm8Jd4LZViuEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61385810"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="61385810"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:41:35 -0700
X-CSE-ConnectionGUID: Bs/edGu0Tde6lrxtkstj2A==
X-CSE-MsgGUID: XtLu7GQ6T3+4Ynx8hbYSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143749122"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:41:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJsgQ-000000019Z8-21f1;
	Tue, 27 May 2025 14:41:26 +0300
Date: Tue, 27 May 2025 14:41:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 06/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-7-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_044136_324817_D20B5D9F 
X-CRM114-Status: GOOD (  18.29  )
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

On Sun, May 25, 2025 at 02:16:53PM +0530, Anup Patel wrote:
> Introduce optional fw_node() callback which allows a mailbox controller
> driver to provide controller specific mapping using fwnode.
> 
> The Linux OF framework already implements fwnode operations for the
> Linux DD framework so the fw_xlate() callback works fine with device
> tree as well.

...

>  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
>  {
> +	struct fwnode_reference_args fwspec;

+ property.h (if not done yet)

> -	int ret;
> +	int i, ret;

Why is 'i' signed?

> -	if (!dev || !dev->of_node) {
> -		pr_debug("%s: No owner device node\n", __func__);
> +	if (!dev || !dev->fwnode) {

Do not dereference fwnode directly. Use dev_fwnode.

> +		pr_debug("%s: No owner %s\n", __func__, !dev ? "device" : "fwnode");

Use positive conditional.

__func__ is redundant it debug messages. With Dynamic Debug enabled it may be
switched at run-time.

>  		return ERR_PTR(-ENODEV);
>  	}
>  
> -	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
> -					 index, &spec);
> +	ret = fwnode_property_get_reference_args(dev->fwnode, "mboxes",

	struct fwnode_handle *fwnode = dev_fwnode(dev);

> +						 "#mbox-cells", 0, index, &fwspec);
>  	if (ret) {
>  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
>  		return ERR_PTR(ret);
>  	}

> +	memset(&spec, 0, sizeof(spec));
> +	if (dev->of_node) {

What is this check for?

> +		spec.np = to_of_node(fwspec.fwnode);
> +		spec.args_count = fwspec.nargs;
> +		for (i = 0; i < spec.args_count; i++)
> +			spec.args[i] = fwspec.args[i];
> +	}
> +
>  	mutex_lock(&con_mutex);
>  
>  	chan = ERR_PTR(-EPROBE_DEFER);
> -	list_for_each_entry(mbox, &mbox_cons, node)
> -		if (mbox->dev->of_node == spec.np) {
> +	list_for_each_entry(mbox, &mbox_cons, node) {
> +		if (mbox->fw_xlate && mbox->dev->fwnode == fwspec.fwnode) {
> +			chan = mbox->fw_xlate(mbox, &fwspec);
> +			if (!IS_ERR(chan))
> +				break;
> +		} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {
>  			chan = mbox->of_xlate(mbox, &spec);
>  			if (!IS_ERR(chan))
>  				break;
>  		}


		if (!IS_ERR(...))
			break;

is common.


> +	}

...

> +fw_mbox_index_xlate(struct mbox_controller *mbox,
> +		    const struct fwnode_reference_args *sp)

One line?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
