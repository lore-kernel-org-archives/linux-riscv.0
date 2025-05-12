Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00A1C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAtH986bRvLp4MZcyeKGOq1PKLZEgIYpqmSrEGKtLZI=; b=T+tA3ISu3pIa1B
	aHB0shIwx43Z4B628iiW9bMgQh1RuMv9fJMpJF771zJbQLd1qST511evnwPlZ1GDGjRdpU910/F/F
	QEEZBGR+T344Dehj+poQlWT9ou1oBuLXjT+OAXIKUvK9DJWjvlKwiiwIXumh01xzmvu2tzbH7n66s
	jgOkVIXPv6txYd61Pgj09BwImZFVvsrscQCsYVy5o+KjvgB2M/q3F4nZ2QIHJi2UXMAXZzplCp6BP
	z4TVjkHOEr8V9Y2WuTO51FnIyjwKpRqysulrcwlWnvQKO3mC/uN3hSSwac9Zkq2YWh7LhfyoLHuAR
	IIoR1RSQbXBn/QdeqTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENgC-00000008dIu-1GoY;
	Mon, 12 May 2025 07:34:28 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENgA-00000008dIY-0rEv
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 07:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747035266; x=1778571266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=028RP0yDMQgC4nJR+FUCOYUcj4/V6uAUEiZ9iXxV4Xk=;
  b=BHWwrKyOJuLFh3IV+I8/IMqkXYqXmYijuJniq04O+Q3RkozjiZ8LH/6m
   rdeCRdUTCmtZE5hZXwRbu6S4vp+V/6etCFeyS5jkTaEUG2/4XLpJvlx9Y
   qt7iat4n0DsyjmQXqBv9gCo65Dzbhm6iTRFczTYAAc6JIBUiUj3/18j9Y
   7JkBMlbSfJsCp60y1fx+LwZtJIeJzmZsHPH7DaiSUSnB4p5BDCfd22v/R
   H9lM5sWoLM8FtSpF5gQ89MYVec55pu5cxz5WGMv5XI5CBnRnWqBN1YRog
   KMRPm2cTOZv8lWJRTkB6BmywohNNWwH28TwcBzcfS6zqaiCmgqFrzUQny
   A==;
X-CSE-ConnectionGUID: jKQgYqu4Qg2oH4ggU72UVw==
X-CSE-MsgGUID: KNWLWHdbSUe3Iy9gCQf8Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52627783"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="52627783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:34:24 -0700
X-CSE-ConnectionGUID: qoc1OzjqRr+uQOLA1U/SYA==
X-CSE-MsgGUID: Y4XJzRPFQk2CkC5gCJrTRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="136990025"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:34:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENfy-00000000qhH-31ST;
	Mon, 12 May 2025 10:34:14 +0300
Date: Mon, 12 May 2025 10:34:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <aCGkdqcLhPVXSSLq@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-22-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-22-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_003426_271578_C64FECAC 
X-CRM114-Status: GOOD (  13.22  )
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

On Sun, May 11, 2025 at 07:09:37PM +0530, Anup Patel wrote:
> 
> Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

...

	struct fwnode_handle *fwnode;
	...
	fwnode = dev_fwnode(dev);

> +	if (is_acpi_node(dev_fwnode(dev))) {
> +		u32 nr_irqs;
> +
> +		rc = riscv_acpi_get_gsi_info(dev_fwnode(dev), &priv->gsi_base, &id,
> +					     &nr_irqs, NULL);

		...(fwnode, ...)

...and so on...

> +		if (rc) {
> +			dev_err(dev, "failed to find GSI mapping\n");
> +			return rc;
> +		}
> +
> +		/* Update with actual GSI range */
> +		if (nr_irqs != priv->nr_irqs)
> +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> +	}

> -		if (is_of_node(dev_fwnode(dev)))
> +		if (is_of_node(dev_fwnode(dev))) {
>  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +		} else {

		} else if (is_acpi_..._node(...)) {

> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);
> +			dev_set_msi_domain(dev, msi_domain);
> +		}

...

> +#ifdef CONFIG_ACPI
> +	if (!acpi_disabled)

Why?

> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +#endif

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
