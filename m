Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E7FC71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYFLIoKVus4PngPqD+wy8tZeek+byuu/8waAiXnIeo8=; b=4+lxA9i8jGqOP8
	cioS7NfELmFfQ9ifdoZslJ19/oVqofpNYJUg2+Kf7I/PoFXSuEWlp8EmE8xi6JL4OAb9cUbGbH0Fm
	HDx7sHi8uLviw/lQ91uXP1eeriMMEU5r1AtWTP1oAHzyJ5SLKUk88wRXZE9CsbpxVlkKD2y9xmd1t
	Uo9Ha+YOlu5pFThmtXyuLWNzUTVInDX2PANzz2rSjBSwjP9YS+u29Mk3sdGCqChZ6/WGNVUtJ2QPS
	JQ+iNiYsSuZyuNtM3KvvHTaJ0qfzl5t5OASRGBJdIPzPNbfkCq/rWfPnuBy6uuHkPdcxuOE4xK6qg
	ZYyFyhDTlEqL20TgMAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPShA-0000000BFWw-0oDo;
	Wed, 11 Jun 2025 21:09:16 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNUG-0000000AQFc-15Kg
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 15:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749656136; x=1781192136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wtS78pPmQeKtNXLAVDUqcIovJ+ivy0sR/W7vIR6YqYU=;
  b=kZZmSoShVwf5UlaStrMMzzkFav5fxi6DrmR8twYxPrm823fCjMx2tJLu
   9qRqEWWASaOmh5D1oS0ugf12BUYJ16uADCWTVEvoId9NioxLnmont4o3t
   oOhwWyEGigjD3w8jp6OalCapnodDaxaYEqiJvLE3luP2KZGuTcNh/yKrb
   3n/yJ+QBibTnZNtFR0wTZ4vqLR03mXudWXv8iSglxkCTOTkb7UR1qheTv
   p15lQjppz1LA/QYZISxuHUka7DP2G6eEltH1DLOPpowroh8iMFOoiOdJW
   vrRxR8tBzYN4klrKrk5TTeE+B/mcaGmYckgUGyB7wN/aoEA9Sn5qcFbNo
   w==;
X-CSE-ConnectionGUID: YkSLxH4qQbuHf+fPuKDPtQ==
X-CSE-MsgGUID: pBrfNLbIScavwSwaudZkpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55600017"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55600017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:35:31 -0700
X-CSE-ConnectionGUID: 3p/wA2aPQdyG41GuMigxwA==
X-CSE-MsgGUID: Go7CJ2mwSm+nXLNn8eq13A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147118627"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:35:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPNU0-00000005gZ7-2TyD;
	Wed, 11 Jun 2025 18:35:20 +0300
Date: Wed, 11 Jun 2025 18:35:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 05/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aEmiOFwofEJyXm4R@smile.fi.intel.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611062238.636753-6-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083536_314458_7EA734CA 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Jun 11, 2025 at 11:52:20AM +0530, Anup Patel wrote:
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

Define

	struct fwnode_handle *fwnode;


>  	struct device *dev = cl->dev;

This better to be just a declaration.

>  	struct mbox_controller *mbox;
>  	struct of_phandle_args spec;
>  	struct mbox_chan *chan;
> +	unsigned int i;
>  	int ret;

With the above the below will look like...

> -	if (!dev || !dev->of_node) {
> -		pr_debug("%s: No owner device node\n", __func__);
> +	if (!dev || !dev_fwnode(dev)) {
> +		pr_debug("No owner %s\n", dev ? "fwnode" : "device");
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> -	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
> -					 index, &spec);
> +	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "mboxes",
> +						 "#mbox-cells", 0, index, &fwspec);
>  	if (ret) {
>  		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
>  		return ERR_PTR(ret);
>  	}

...this

	dev = cl->dev;
	if (!dev) {
		pr_debug("No owner device\n");
		return ERR_PTR(-ENODEV);
	}

	fwnode = dev_fwnode(dev);
	if (!fwnode) {
		dev_dbg(dev, "No owner fwnode\n");
		return ERR_PTR(-ENODEV);
	}

	ret = fwnode_property_get_reference_args(fwnode, "mboxes",
						 "#mbox-cells", 0, index, &fwspec);
	if (ret) {
		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);

You may save a few bytes by doing it as

		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");

		return ERR_PTR(ret);
	}

> +	spec.np = to_of_node(fwspec.fwnode);
> +	spec.args_count = fwspec.nargs;
> +	for (i = 0; i < spec.args_count; i++)
> +		spec.args[i] = fwspec.args[i];
> +
>  	scoped_guard(mutex, &con_mutex) {
>  		chan = ERR_PTR(-EPROBE_DEFER);
> -		list_for_each_entry(mbox, &mbox_cons, node)
> -			if (mbox->dev->of_node == spec.np) {
> +		list_for_each_entry(mbox, &mbox_cons, node) {

> +			if (mbox->fw_xlate && dev_fwnode(mbox->dev) == fwspec.fwnode) {

We have a helper device_match_fwnode()

> +				chan = mbox->fw_xlate(mbox, &fwspec);
> +				if (!IS_ERR(chan))
> +					break;
> +			} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {

No need to check OF node (again). Instead refactor as

			if (device_match_fwnode(...)) {
				if (fw_xlate) {
					...
				} else if (of_xlate) {
					...
				}
			}

>  				chan = mbox->of_xlate(mbox, &spec);
>  				if (!IS_ERR(chan))
>  					break;
>  			}
> +		}
>  
> -		of_node_put(spec.np);
> +		fwnode_handle_put(fwspec.fwnode);
>  
>  		if (IS_ERR(chan))
>  			return chan;


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
