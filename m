Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D90FC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbG5bY7fUDbZo/7Gr3IF4tNj54x/+NRr5MufgOVfGhw=; b=YnGK1LuXzGcbdb
	nyrwXXVoJNY9/DOC+yZgWueMiIRg0ZkmpAhJUOFenP9pqQO0pjJAG+yQYBucoQ73zUwvQsd7iYm47
	EFmx9BRZgvnxhqhh4g55lXyGFBzawibNMENpDuW8cNTz3M98rzUfKGqJnz7FMYuOpb+CJgYXqCZLp
	FdWhHiYKXVSlUgN0Win4YeD8NKgFKSXP6RqzskcEjpTiKkzmQCk9D9AMdIR71sOUElUL6fNo6W8qS
	RDM5IP+qCOrjRNwYybPA3+2yEN3Fj2ReLTimoDWlojKUZxAUHafMbAuM2ZuR8QerZ/ZU/B/WHoUND
	T8qpnhAgHYn4eR95nQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM7g-0000000BsSA-0Rri;
	Thu, 03 Jul 2025 15:45:16 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKOS-0000000BYf5-3Ih6
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 13:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751550869; x=1783086869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hkynFXqBgMDhBIacDm9GkRDPLniP47vYUeHzZhSjqPE=;
  b=Er/doTmq+I//GgxyCwj8QJlRhDIjetHNh3HtYwB4LoNgL+GhjETmIp45
   pOcrMYecDo0X+r5JunXyBzXlzlJJp/BGtDF9bphGfc3AfVuzRD4PGVmmK
   snWGx5S6ooykpJ+Kjb1/ai0YjJeDLK6T3ThqlHgRPFXPbmowmeQ4H3jEb
   vb1guWGAIC+jTvxN0lDbVsHx5KGbIiOCeO7g+UBLqSzCFgrTmpinCeWhC
   Qduh4w+FGe5cgegHA4lq/qxtYSaue5SfQaFXL/ycsSMx6WtBDFx/nniBb
   ZAxGYUe0H92DfThV8LUkl7vzPNjgHCFGiCnygyA2i/brtSs7tBfGX9/xT
   w==;
X-CSE-ConnectionGUID: nhhwajLRQwidLsgkIUWwRA==
X-CSE-MsgGUID: q65pr7S6Q/iBCxCtl2MT6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57686389"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="57686389"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:54:27 -0700
X-CSE-ConnectionGUID: Sz8pfLTHRumN6SVidx2zkw==
X-CSE-MsgGUID: LlSnEty4TaS4oZ+RxqLYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="153790365"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:54:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uXKOG-0000000CDjq-1Yoc;
	Thu, 03 Jul 2025 16:54:16 +0300
Date: Thu, 3 Jul 2025 16:54:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aGaLiK0eW8Mc1YC3@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com>
 <aGUl_S9irfhlHmy2@smile.fi.intel.com>
 <aGZhWlxxQG0Z8awP@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGZhWlxxQG0Z8awP@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_065428_865925_9E254005 
X-CRM114-Status: GOOD (  19.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 03, 2025 at 04:24:18PM +0530, Sunil V L wrote:
> On Wed, Jul 02, 2025 at 03:28:45PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 02, 2025 at 10:43:42AM +0530, Anup Patel wrote:

...

> > > -		if (dev_of_node(dev))
> > > +		if (is_of_node(fwnode)) {
> > >  			of_msi_configure(dev, dev_of_node(dev));
> > > +		} else if (is_acpi_device_node(fwnode)) {
> > > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > > +							      DOMAIN_BUS_PLATFORM_MSI);
> > > +			dev_set_msi_domain(dev, msi_domain);
> > > +		}
> > 
> > Actually you don't need to have the if-else-if if I am not mistaken.
> > The OF does almost the same as it's done in the second branch for ACPI case.
> > How many MSI parents this may have?
> > 
> OF already has a well defined interface to configure the MSI domain. The
> mechanisms existing today are different for DT vs ACPI to find out the
> fwnode of the MSI controller. So, it is done differently.

I don't see how. The only difference I see is that OF iterates over all listed
parents, if any, ACPI tries only one.

So, perhaps it's a time to have a common API somewhere for this to be agnostic?
Something like fwnode_msi_configure() in somewhere of IRQ MSI core?

> In RISC-V case at least, there will be only one MSI parent.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
