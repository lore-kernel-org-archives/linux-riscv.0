Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133BC3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 07:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtfGbgfDBx7/ftsBQxY2zLfQI5No7YRdZiycNgn81js=; b=D8JVaHzSGYJTPi
	VNtRyETy0+llIY7zRqP978JpYUlgijqN2cleDo3tSx3NvgnQUKf9vqX4JggVtJADKYVSJYbWS7Pzo
	En1l8sSFXRj7LnAph3udg4b0i8l8RaWDhiGfxsCurAZ7WaJGgpfqmqZLqs0p2iYLBIlWanlrMjFdX
	mB+3V8VtTajBY9iNjYDgK23FkpM5cqbxVAcyFUqXTxJadf2H/ayZeqtgUdHHrj6bWVgKhykCYbfjt
	llqbUOQjrE9r1FHa+3DV/yJDgNBkws3xbAAgvms8ynS/iT8nrOa4BoIJn+wbKYrzOBMgEDwIA5wNJ
	8t3xGYTctS+gFE0fCwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENPN-00000008bl0-4Bdy;
	Mon, 12 May 2025 07:17:06 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENPL-00000008bk6-0GpY
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 07:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747034223; x=1778570223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhSkgYhOgYnJveTzTY3zf3sNJ9lxN064UAaKeMMZTKQ=;
  b=Ceo/HOqitkuX46tL38cn2qEGlEAjsrmRmD+263VpSqHXMcWpsE+2UxJN
   YmS4DfU9m6lANqsSzYYQ3lA7yxK4CvmWSq2kywnzia7SGV1LCgED4k/ur
   3N3Y4el9YW53uY4lh/tlbUXaHU0+DdFNJz/uq9NHTTDPPACTbWY0aomWo
   ceJqID9yHDRqvcXPy6HMdpfng/yYlJsVLg6PE3lYTSNW/Fmq2mPudw4NR
   T682bybtUs5QomLVInwdiF0j/jQYglEIT9KMFa2/12T8oY2QPAY07xa2h
   NKQnM2xb4+/E26lnSxMYg1vrSyvC7sc47LPARcR36/HmdUfJvIRESrvWP
   Q==;
X-CSE-ConnectionGUID: pmLe3coeTRWtBmsk/G26sg==
X-CSE-MsgGUID: WX6LR2WzQpi6oO6FAvMGCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48511042"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48511042"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:17:02 -0700
X-CSE-ConnectionGUID: p5INCGhZSRuJg4+0ALt83g==
X-CSE-MsgGUID: 2I1NM1htTvWRbkgxgOe3ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137183989"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:16:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENPA-00000000qRb-2YWK;
	Mon, 12 May 2025 10:16:52 +0300
Date: Mon, 12 May 2025 10:16:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 15/23] ACPI: property: Add support for cells property
Message-ID: <aCGgZPJUQdAnWa-z@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-16-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-16-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_001703_145258_562EA079 
X-CRM114-Status: GOOD (  16.15  )
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

On Sun, May 11, 2025 at 07:09:31PM +0530, Anup Patel wrote:
> 
> Currently, ACPI doesn't support cells property when
> fwnode_property_get_reference_args() is called. ACPI always expects the
> number of arguments to be passed. However,
> fwnode_property_get_reference_args() being a common interface for OF and
> ACPI, it is better to have single calling convention which works for
> both. Hence, add support for cells property on the reference device to
> get the number of arguments dynamically.

You can reformat above to make it deviate less (in terms of line lengths):

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects
the number of arguments to be passed. However, the above mentioned
call being a common interface for OF and ACPI, it is better to have
single calling convention which works for both. Hence, add support
for cells property on the reference device to get the number of
arguments dynamically.

...

> +			if (nargs_prop) {
> +				if (!acpi_dev_get_property(device, nargs_prop,
> +							   ACPI_TYPE_INTEGER, &obj)) {
> +					args_count = obj->integer.value;
> +				}
> +			}
> +

> +			if (nargs_prop) {
> +				device = to_acpi_device_node(ref_fwnode);
> +				if (!acpi_dev_get_property(device, nargs_prop,
> +							   ACPI_TYPE_INTEGER, &obj)) {
> +					args_count = obj->integer.value;
> +				}
> +			}

These two seems to me enough duplicative to have a common helper:

static unsigned int ...(struct acpi_dev *adev, ...)
{
	// define an obj variable?

	if (!nargs_prop)
		return 0;

	if (acpi_dev_get_property(adev, nargs_prop, ACPI_TYPE_INTEGER, &obj))
		return 0;

	return obj->integer.value;
}

Yes, the nember of LoCs most likely will increase, but the point here is better
maintenance experience.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
