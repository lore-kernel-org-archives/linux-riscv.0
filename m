Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE44DC3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tk8aVKBtlJ/4A/afTsmAT+DY9A7e0Q526J6r9BRThN8=; b=Lcu73K0IW3+y7V
	ROZ3eBNT58YGeWMR/kYjfFERzNGoq0C8kC6193tPvARWZ17IAvSG9eYpgF5wTraXr+zDIQ2CkrHeo
	2Yj6T6Y9N+jChRYuxg08GgNHaGvY1to1TAxX22UyAmY7FxXGmqinw0ePUNLv6GVIjNmJmaRw/lkmd
	qiT6m1EyIy9dGWAZkMVE/dPhxN95A4TfbGOq9LuG7GCLPLpBlW8wYV0rR9lktUzfQUa4Ao6zNWTZT
	Uu0mBs1yFRqMgB28zqwKzAnBInGBK6Dt5lmjSAVRRZTUYMpkXry20ykaiwbQDH1nIIGyy8zPIADxD
	6dBUaS2E3+A0ualqgnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENd7-00000008cyw-1hmy;
	Mon, 12 May 2025 07:31:17 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENd5-00000008cyA-1LJs
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 07:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747035075; x=1778571075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dpfuuOvYos686Fhw3YTd24pgbdRgiTmoR3WYG9xXogU=;
  b=K/rKlA/oeC04m92agn4/J6D4cA2mTU9hltKr5fJlNhOiDhaUa6hzUm/c
   v0ML7lsHVTK2e8Exsp8auol3sgk/co3MVskSjX9nPBWUQ9v+npXEI87oJ
   OUKQePRwkWO5ROFC6EH8OOiK5l4E6wj67PNWqhH6FJ9+ncYdJxWy0g94a
   J+W0YFjvuOcaavIV0sBDJlRZQ1TDhTeENpO+YCfLqV/P9lN+kcao8FAMe
   A1oeVQ3yBVtNW4M6vVRKnyvFEbkCzLNdiB+eVKKCHk6Vroaxr4K905O/B
   LDg1rDbHO6d6eTTSpuft6J6r2N+6AdQUX9yoNvrW8WY5jkgE133LFm+Ba
   A==;
X-CSE-ConnectionGUID: MQ33sYdzTK6pKbSho9eTww==
X-CSE-MsgGUID: wjdEOeNDSOS+TyojdMtF9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="36445001"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="36445001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:31:14 -0700
X-CSE-ConnectionGUID: 5EgLtYGkTYGl62sK56r6pA==
X-CSE-MsgGUID: V9z2TlQ/RWmDEmEo6ydWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137187634"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:31:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENcv-00000000qeS-26L1;
	Mon, 12 May 2025 10:31:05 +0300
Date: Mon, 12 May 2025 10:31:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 18/23] ACPI: RISC-V: Add support to update gsi range
Message-ID: <aCGjuc9AmZaKBGg5@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-19-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-19-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_003115_464565_6DA867A0 
X-CRM114-Status: GOOD (  17.54  )
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

On Sun, May 11, 2025 at 07:09:34PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Some RISC-V interrupt controllers like RPMI based system MSI interrupt
> controllers do not have MADT entry defined. These interrupt controllers
> exist only in the namespace. ACPI spec defines _GSB method to get the
> GSI base of the interrupt controller, However, there is no such standard
> method to get the GSI range. To support such interrupt controllers, set
> the GSI range of such interrupt controllers to non-overlapping range and
> provide API for interrupt controller driver to update it with proper
> value.

...

> +static inline int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
> +{
> +	return -1;

Why not using the defined error code?

> +}

...

> +int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
> +{
> +	struct riscv_ext_intc_list *ext_intc_element;
> +
> +	list_for_each_entry(ext_intc_element, &ext_intc_list, list) {
> +		if (gsi_base == ext_intc_element->gsi_base &&
> +		    (ext_intc_element->flag & RISCV_ACPI_INTC_FLAG_PENDING)) {
> +			ext_intc_element->nr_irqs = nr_irqs;
> +			ext_intc_element->flag &= ~RISCV_ACPI_INTC_FLAG_PENDING;
> +			return 0;
> +		}
> +	}

> +	return -1;

Ditto.

> +}

...

> +	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
> +	if (!nr_irqs) {

Make conditional positive.

> +		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
> +		ext_intc_element->nr_irqs =  U32_MAX - ext_intc_element->gsi_base;

One space too many.

> +	} else {
> +		ext_intc_element->nr_irqs = nr_irqs;
> +	}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
