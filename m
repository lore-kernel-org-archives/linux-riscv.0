Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609C8C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LccVK6zdDaE0KFFZ3aMCbLSw47B6YklZufDyw0EehQc=; b=wJDp8aBaOY5QbJ
	Rc1TEQCayrNADtnMMorXQXsuVJ6RBKQpp7CgQPDHMIB4YDKiIQjQDKMc6t3Pb2xT1cjRIEe2GiTSY
	AyMf9eIlEnqMtOAwlfL2d9GztSVkTP0tnm0Wbd3grbqj6l6cQ5IRBu7/2UFjlJEFQVZPMiGsoMIAn
	SRAhCXsgCSia9qrnezHsl5zYTidP2mzkSNeEnonroRmf46YZdEWCzIenepIy9RblSI5IRbQi42kL+
	s0JQG1cWvXLsde66aZ1PgZREE7xkCKXChV44BOAldbkfw1M56iPCPpdAWT70zxB3Ji2HSBZpwi+eO
	OaZ5raUmaX4NkEMnbE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesys-0000000F1aP-49ze;
	Mon, 03 Feb 2025 09:43:02 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesud-0000000F16A-1uPX
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 09:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738575519; x=1770111519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yzcEf9XDeWs1+TWet4F73GS6w+CZnG1Zty9st7dcxC8=;
  b=S6UivAanUui0kyUBtdxVOVzwBNe3he+i86gNTihChWhpLJFXHbbOW0O9
   SMTbqICaJxHtGDK1RfPzcE8XXUprbBFhJcDFDNo/hc9rQa+9c16BsqtTE
   r/J4ICRxnhkfT92BSrXrv9YE9fFkN1zftt+71uWAPeo4sKyAub1cNirKv
   5Q/VKrVnZIa2lXsins8gh4CdaBI3WjAnLC9PkWGG1kTudO0E0baRvtZen
   AW5n3ccrF72VDQBHHMXL+rHMBdUjJIPzfDAqHojmjKS3OmEsgRiCc3Wpo
   2u/jX8lcwA1gTV3Fl1SAih5o0K9vnhQ1GAjhlEtk+qcZKqlZnRBQBcqib
   w==;
X-CSE-ConnectionGUID: sw44RU4GRM+TfC9SAwM2Yw==
X-CSE-MsgGUID: f/sVoUMPRoO4Kc/rYBJLDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="56490773"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56490773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:38:38 -0800
X-CSE-ConnectionGUID: Mq/u/9GNRaa9iE7TfMDyKA==
X-CSE-MsgGUID: 2wZUv19MQAWqsA9gvk0/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="141110698"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:38:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tesuS-00000007mqV-1ub0;
	Mon, 03 Feb 2025 11:38:28 +0200
Date: Mon, 3 Feb 2025 11:38:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <Z6COlL_5n2AfRADL@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-17-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-17-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013839_541927_54EA31A5 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 03, 2025 at 02:19:05PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

...

> +	if (!is_of_node(dev->fwnode)) {

Please, use dev_fwnode(),

But why do you need this? Can't the below simply become a no-op without
this check?

> +		rc = riscv_acpi_get_gsi_info(dev->fwnode, &priv->gsi_base, &id,

Ditto.

> +					     &priv->nr_irqs, NULL);
> +		if (rc) {
> +			dev_err(dev, "failed to find GSI mapping\n");
> +			return rc;
> +		}
> +	}

...

>  		 * then we need to set it explicitly before using any platform
>  		 * MSI functions.
>  		 */
> -		if (is_of_node(dev->fwnode))
> +		if (is_of_node(dev->fwnode)) {
>  			of_msi_configure(dev, to_of_node(dev->fwnode));
> +		} else {
> +			struct irq_domain *msi_domain;
> +
> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);

> +			if (msi_domain)

Hmm... The OF case above assumes this check is not needed. Why is it special
otherwise?

> +				dev_set_msi_domain(dev, msi_domain);
> +		}
>  
>  		if (!dev_get_msi_domain(dev))

Even here you have a check for NULL, so I believe the conditional is simply
redundant.

...

> +#ifdef CONFIG_ACPI

> +	if (!acpi_disabled)

Why?

> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +#endif

...

> +#ifdef CONFIG_ACPI

Drop this ugly ifdeffery along with ACPI_PTR(). They are more harmful than
useful.

...

> +static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
> +	{ "RSCV0006", 0 },

Drop ', 0' part as it may be converted to a pointer in the future.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
> +#endif

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
