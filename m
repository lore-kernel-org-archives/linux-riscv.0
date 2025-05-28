Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8A7C5B543
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVetphSWEhxonS+KX8JLcADsRj0UB94hvJkYxNilXSk=; b=y1eYswKLPI+Rwz
	Z721nlUug+J027W6S0m2sKB0B8MSTy5e4We9rWik/rSpw40wrjoLUssU2sK5ZciuYD+IAmTdOx3cg
	32sY43n5oQEHz30FhBYZfccPGcKRV9ZO2tEtK+P/BdC5Q1PNPDLAB34ahTC3I5fIdpx6ruFk+MoQb
	yI0OjopW1Efxyw6pZAhJ6ba0kwv83U1ZBAWUb3RdCoVuP4k+tDrgETiX0g9j6Plhu1E537AOH5u+0
	BHB+ZYGZVR29Klbm6krpDE8JrY4hr5xLOGr0mEsD+5fh4BliJ4vbOiJkJiLQkuOec03Iu1IA83xT6
	Me0QpPAlPTpYFhTjWUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFkr-0000000D5WB-0SgK;
	Wed, 28 May 2025 12:19:39 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEbT-0000000CwIG-3kXH
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 11:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748430348; x=1779966348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToQEsJtK6Rkp6PB1avzmO5rYbaGHvKv6ChVjnjuWW+Q=;
  b=OIpV+zmTe4lulThsr7kX7lVTlDXlDLPGBRKq7c22JZKF2Pmabad2YTKW
   s7psPfWLT966i2DiSS7aj5qTwL5+R1cpnJV037tLaC+a/JurlArzhv4Qi
   YXWAleKYexICDdeqXDQ8NpRbVvd+vfRGTpbYV90AHJvKfTv8aJZs7gzXA
   KO5DeB/ZFSjXrD5UTPjTbWtdyoFFnPgmf8CEPAxvmv+oqSkxFMbhQX9rI
   oKhHPRZcp8mogw5+UcAuUYlJXm9nNB82AKooe8vS+2Ii/uJ5y+8zYr5VM
   F8WKSVRU/ATI4GLmQZOwYdjdIJqqGzE8SQ3pB9fnWce+DNePcpBuaO4iA
   g==;
X-CSE-ConnectionGUID: qViZlSupQRy3m5CzO0px6Q==
X-CSE-MsgGUID: CEmJY/XmTxKNWrDiBJFqvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61507827"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61507827"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:05:47 -0700
X-CSE-ConnectionGUID: 8iPiFFdzQFCUu9mW66glIw==
X-CSE-MsgGUID: tz6rZrWDSXmyTaQ0KyywyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174206027"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:05:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uKEbJ-00000001QJz-0DBv;
	Wed, 28 May 2025 14:05:37 +0300
Date: Wed, 28 May 2025 14:05:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list
 in sorted order
Message-ID: <aDbuABrlO30TIrx1@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-18-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-18-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_040547_984278_9184B7E6 
X-CRM114-Status: GOOD (  12.02  )
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

On Sun, May 25, 2025 at 02:17:04PM +0530, Anup Patel wrote:
> 
> Currently, the interrupt controller list is created without any order.
> Create the list sorted with the GSI base of the interrupt controllers.

...

> -	list_add_tail(&ext_intc_element->list, &ext_intc_list);
> +	if (list_empty(&ext_intc_list)) {
> +		list_add(&ext_intc_element->list, &ext_intc_list);
> +		return 0;
> +	}

With the below done the above can be optimized (hopefully).

> +	list_for_each_entry(node, &ext_intc_list, list) {
> +		if (node->gsi_base < ext_intc_element->gsi_base)
> +			break;
> +	}
> +
> +	__list_add(&ext_intc_element->list, node->list.prev, &node->list);

Is this reimplementation of list_add_tail()? And why list debug is excluded here?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
