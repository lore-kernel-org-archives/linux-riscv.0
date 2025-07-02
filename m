Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2882C8303F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8sGJBRRu20/40q0wKIFvJlUHD4IqrochiV2gy2uDP8=; b=x7vmTNATbMKPre
	UMBNGcyzod4fGnOgRWECu0DQRZr22ZYqlVBO9smXqtRcnK3uTVM0LAuQb1ZeSD90cRzKDduAL21Ve
	kqKNKXDHEgp8WbzZ+/+nWZ4fTv6SoOxpnYaJyEhUadumID5BpiJwMn4I7qJ56Bcr8pnWasbhf03j5
	0Bf2K+sOZN2zOg38BQ9fM9N5Rxz4iU33bhQxa8h0aH2XlO+/F55MgUKQnxYEjDuDghXWFL6UUgCsm
	AIN+cbRKPiSlzCc8qNNEP49DiqreWPkJhfM07O8YS5sErZ6RC/7TLeOuSG0DUYvph4hhurbetEbVn
	i3bP8s3HkW7Ti3xphF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqW-00000008LdD-0yVg;
	Wed, 02 Jul 2025 12:45:52 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwa9-00000008KG4-1A8y
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751459338; x=1782995338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zoqxa8Dth/WIL+RSmgjM63YP+N6qBvdpGWSiRdatsBg=;
  b=aimjaRiNhIDq/ud/a1Ouq7G6B8K1Rjec3heqITU4bucRJOzy6IY3cWL1
   H7l1L81zaDSgFWQjCvN31AtBqhwW5fY2mMoGkBMYb42U11SrVnnlAMFi1
   GLIQUzvR3V2BwihCUaZXYotR44YMUl84LYgjogeuc1dAveqsLZtJFe4+S
   3fMwYvyh8MUy1rNdYTgeidK4Wwcd28+VmjFlb0HdTBmZ1ZPryqfnU+VMQ
   neeAuvUM9mEWqbkr07nKNjUNjKQx+m09y8YX8PhHi//Hw3+bJ/wWhFAHZ
   pFO1aRfl5OdHrQKH1kDnXU8vntw7XG9tAk5Asdz7gRmG3WS9+8K3D8UGv
   w==;
X-CSE-ConnectionGUID: VcdUZvvpQa67S10PEo9Dqw==
X-CSE-MsgGUID: RdEDirptQfeTypNwx187BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57426624"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57426624"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:28:57 -0700
X-CSE-ConnectionGUID: ZYzfy1TaTmSmBpS29OqyAg==
X-CSE-MsgGUID: c4FjoOfOQgG2bv26Z60xAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153839670"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:28:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWwZx-0000000Buum-1vQU;
	Wed, 02 Jul 2025 15:28:45 +0300
Date: Wed, 2 Jul 2025 15:28:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aGUl_S9irfhlHmy2@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-22-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_052857_365792_9C542AA6 
X-CRM114-Status: GOOD (  13.03  )
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

On Wed, Jul 02, 2025 at 10:43:42AM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> mailbox driver.

...

> -		if (dev_of_node(dev))
> +		if (is_of_node(fwnode)) {
>  			of_msi_configure(dev, dev_of_node(dev));
> +		} else if (is_acpi_device_node(fwnode)) {
> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);
> +			dev_set_msi_domain(dev, msi_domain);
> +		}

Actually you don't need to have the if-else-if if I am not mistaken.
The OF does almost the same as it's done in the second branch for ACPI case.
How many MSI parents this may have?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
