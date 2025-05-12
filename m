Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669DAC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 07:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+t6f/2ZGDhQofPpp/NgGo1o5/WWvDHpVVUAmtLZeqos=; b=XvN2sh9H/fHQcq
	SPlqoBDK5ygAjev8xwbrXHMhNnXLUG0G2w44w02e8K6O1NON8FZaG/N8Afsw79AzowTYJCQ5VXYgE
	Uyq3+L3QRJ0Y/qVco++TLzHwgVnkz8d6527oOaF9jjEXDl4ltqrmkL4GYRnnQSrwHdxPX2SGcW1p+
	3LuoUdn5tSbZ+id9r39axveR5jwFG548LN9gkQzwMd5fKH3plPv4Q2SgmNUzj3mbXAV/XW6tu+foY
	5xQP7Uy50fKZNeucbMyM+du6SupLLz9zUz5nBr1eTY403JdZhfQ54kHF0AFtUMQLJXz7BJlWKjnW6
	WqrAF2KwalZ1dFfpyjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENaS-00000008cgA-0Qne;
	Mon, 12 May 2025 07:28:32 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENaP-00000008cfp-3Dyf
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 07:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747034910; x=1778570910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OpwhBIBLUR7KZYGf1JS5ByHHeMy5ALtXFWlVVlrs1UM=;
  b=XT5gRSmexnimeQyPr+k9wXeDU2YDRnyih8AUfNjitJTGym6CrWl+XNir
   PvP+D+gh8lz64A6qjxczQejzj7UaJ2h3dilMHo4xNih1My69hLn6encHc
   LQURQKNdM5C45ZX1E1AXmUzdHW6yz8GFlDc6pQDt6I/p3sB3ctlXsnPHz
   TI5pFP7cIIp8PY6S5Kzh3/ufrXMqL9TiiGy+Vy3FEe0jZJbpViqm77g4G
   +FsurS9M4i8VXwQYYQJBxVCqwhQkHMzEZBcZA8S1t7Jib31hmxW0s1dsI
   WLGKeLtaGg1o2nZYYtx/sOkYbwgHGx9gJ0MgIPiWmnjrtRC1BuN/RPIPI
   A==;
X-CSE-ConnectionGUID: R2AwfKIyS3mG2w2PENSa3w==
X-CSE-MsgGUID: bN/Z+3AdSgebMPGiPO2DVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48742598"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48742598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:28:28 -0700
X-CSE-ConnectionGUID: 5/o3CDCpRq2+Y+cxe+xc2g==
X-CSE-MsgGUID: d8OohKBWTZ+rtZbLD8aoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142246382"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:28:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENaD-00000000qbV-3rOo;
	Mon, 12 May 2025 10:28:17 +0300
Date: Mon, 12 May 2025 10:28:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCGjEdNVH3ughITd@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-21-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_002829_833473_69E1A000 
X-CRM114-Status: GOOD (  12.66  )
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

On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> mailbox driver.

...

> -		if (is_of_node(dev_fwnode(dev)))
> +		if (is_of_node(dev_fwnode(dev))) {
>  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +		} else {

You probably want to have this as

		} else if (is_acpi_..._node()) { // you should decide if it is data, device or any type of ACPI node you match with

> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);
> +			dev_set_msi_domain(dev, msi_domain);
> +		}
>  	}

...

> +#ifdef CONFIG_ACPI
> +	if (!acpi_disabled)

Hmm... Why do you need this check? What for?

> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +#endif

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
