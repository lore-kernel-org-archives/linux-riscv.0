Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D494C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVbDamYjByHLKK9k4R06Au3aLxLpEy81hkGPemnkadQ=; b=oSK52QvCSnHACh
	LK1cVyJiP3zJ2MZbsomVqWzswbjA79sxfOwIsTpW4xUbmpN3AmJjzp15v/f5AXpR9oUuqOsWAgEAK
	0LNqAuKnZSlPNInLPjkdj9IvojKuz4WIzicQKzI7T2483IQKhGWkph5RS+qZO8YOU2z1ZyG6rT0un
	QL7dPtaJJvZQYe7uWR/jh+xbegEYGRG0AsowKfZjlotwyZO+HA16q1M4/wTzn+BDieIVm8CuDgk3U
	Pl9APV7II1wFfVnXoF7Xop2Bsdh7in+I/mo54bOCy0GxZwClnEtk6XcTHdmufwvTaNL+kRLeCd8Ax
	92FDyvRu9SpfUm21GppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdOF-000000029wg-3NNJ;
	Mon, 23 Jun 2025 09:22:59 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdFy-000000028J0-1icV
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 09:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750670066; x=1782206066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eIeY3heN+gnrpZQU6Tbcw37VApX8DZLMbgNPQw+j5oI=;
  b=M9+TxHmB9wMgmsHBBpmUDchcKOU6YAl3mI8DuUGWfIicDk19tplmuc1v
   73lH+yr47P0JZkrvf3oxSye32TQ9TrT+l0wmH0ko8ND85Y1swOhHzskYq
   o4u+ZXEURzBD7KwqocIhCCiseqejnqr31hfGeEPBsVvgyc4s9V5hr7Xrj
   BGKTGIrehIqSjGclcx6oYOf+D/mGYtjBgLu67CNoRak3IjaJwFb687tnv
   HkguNDEAYNeb3g2e66UTmQCHafHM16G4FZec7/HT3i6fM5Dy+uwoG3gXq
   RpEjbxd2UyYTw9600vohNowxr+y1hOFyJD0monrkhGARvE6zI7XHrZ9Cr
   w==;
X-CSE-ConnectionGUID: 2nuR/rwMRbqT5XfDnxcRJg==
X-CSE-MsgGUID: npV9eOHtSteCy1OeASBSwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="75401273"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="75401273"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:14:18 -0700
X-CSE-ConnectionGUID: e4ekD39qTday9sIFTi7Scg==
X-CSE-MsgGUID: 9gtBh0Q9Tb6PnnFaBaRxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155846754"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:14:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTdFf-000000097Qy-3DMk;
	Mon, 23 Jun 2025 12:14:07 +0300
Date: Mon, 23 Jun 2025 12:14:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v6 14/23] ACPI: property: Add support for cells property
Message-ID: <aFka3y1494LIzyUA@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-15-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-15-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_021426_484836_5119C12B 
X-CRM114-Status: GOOD (  17.31  )
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

On Wed, Jun 18, 2025 at 05:43:49PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Currently, ACPI doesn't support cells property when
> fwnode_property_get_reference_args() is called. ACPI always expects
> the number of arguments to be passed. However, the above mentioned
> call being a common interface for OF and ACPI, it is better to have
> single calling convention which works for both. Hence, add support
> for cells property on the reference device to get the number of
> arguments dynamically.

...

> +static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
> +					       const char *nargs_prop)
> +{
> +	const union acpi_object *obj;

> +	if (!nargs_prop)
> +		return 0;

This check is implied by the call. No need to duplicate.

> +	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
> +		return 0;
> +
> +	return obj->integer.value;
> +}

...

> +			if (nargs_prop)

Again, if you don't won't to reassign the existing value, it's better to have
this data be collected in the temporary variable of the same semantics. Then
you will choose one when it's needed, no need to have this dup check (again!).

> +				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
> +
>  			element++;
>  
>  			ret = acpi_get_ref_args(idx == index ? args : NULL,

...

> +			if (nargs_prop) {

Ditto.

> +				device = to_acpi_device_node(ref_fwnode);
> +				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
> +			}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
