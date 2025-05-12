Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A22C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5eZ519EmLS2PUCPvZUUrFcRQa+2BkTh2jb0R9j8fnY=; b=39qCCITnJtCA/M
	WIsMe6l/joJMZWjRc44LxMYZ3x9BGhUvGRc0BX2l2Rgo3mqyMHGn8nUGroQOrGXGkXn9jvk+9BIyP
	znGz4uT81KpEKBzuCZTFy50ymQUYhFVtoELGC9RzMszQVkzNtRLUzaJvbvpzzpHTSfTPej9FVLKhP
	ez2mEg3hdorzzG3DwBihE3ymPlUEnTLfOuEwy/o/tv9VbUEwKZWUwmBx8oPVVWVUYGkUT3hhgJYYN
	Ke4ndHM7u5Mq06E2/HmLC53l+uo2TCOQWQUSKtOIot+LW6wihv/t/g0seGqcPyE5HMkWK9q9BhsRd
	l+HzfzGb0/xgsEHWXvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOn0-00000008oP0-3Tmr;
	Mon, 12 May 2025 08:45:34 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOlY-00000008nhs-3fcP
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747039445; x=1778575445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aO0nrrJS8HORN2b0dkbOEnZb76TM/1Rz49FnYj/O6R4=;
  b=IUp0IBgqWpQpPRkxkVT3VFolzu+GMmnOKZKxN0EZn10+3wK7c9tB80of
   IQJC8dk3e2wMf2/2IpOneynGxeLBC8FcDWQMTOoD5Yb+NyBcJd14NG6ak
   chdSqk4pE+XszP26nJF5xp5hNNjxAzHMoyOklEl+0iO0WqJpnNX1Me159
   M0vn/myo/vuPEuF4f7J0UEShnbKJtuhRne+yHLrft2ndKQfjnjucna74b
   ZGUZzyNwA7e9/YoD2pl1Smv7hnGVBc4nQy0HEl4hqUOCbWGSbgkqGOqXX
   Q2Gj1cVNp7I0xvt4D6/6OXu7vBu4kGUpZ5XJA9NGid3tO+uUotokM5jTl
   Q==;
X-CSE-ConnectionGUID: +FyPjo8qTM+h6BUxvB+8Ew==
X-CSE-MsgGUID: I32YzpyITjWQfmqTv8kgNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48901673"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48901673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:44:04 -0700
X-CSE-ConnectionGUID: sVxN3AVHRf2RESn32JKGZQ==
X-CSE-MsgGUID: nsx9lkCuRn6kBHgYj8UcUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137205262"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:43:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEOlO-00000000rhm-1X7N;
	Mon, 12 May 2025 11:43:54 +0300
Date: Mon, 12 May 2025 11:43:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 14/23] ACPI: property: Refactor
 acpi_fwnode_get_reference_args()
Message-ID: <aCG0ykZt-DcEG2kr@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-15-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-15-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_014404_988849_99AA884E 
X-CRM114-Status: GOOD (  10.60  )
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

On Sun, May 11, 2025 at 07:09:30PM +0530, Anup Patel wrote:
> 
> Currently acpi_fwnode_get_reference_args() calls the public function
> __acpi_node_get_property_reference() which ignores the nargs_prop
> parameter. To fix this, make __acpi_node_get_property_reference() to
> call the static acpi_fwnode_get_reference() so that callers of
> fwnode_get_reference_args() can still pass a valid property name to
> fetch the number of arguments.

...

> +static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
> +					  const char *prop, const char *nargs_prop,

Why prop and not propname?

> +					  unsigned int args_count, unsigned int index,
> +					  struct fwnode_reference_args *args)

...

> -	ret = acpi_data_get_property(data, propname, ACPI_TYPE_ANY, &obj);
> +	ret = acpi_data_get_property(data, prop, ACPI_TYPE_ANY, &obj);

Ditto.

Sounds like an unneeded churn.

>  	if (ret)
>  		return ret == -EINVAL ? -ENOENT : -EINVAL;

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
