Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14D7C83030
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 20:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuMWdVV2d4g8cqxa+nuiNIyoFbMvaKqzYLj6dLzrY2c=; b=wy81yOydjij+UD
	sCncxQl87QAldb5NxAso9D1zocsU2nyeJjot2BDhUXY0LH57Cj/NSu+V3k1D5LTKkZ14deD9ucQvO
	iMbMEvocFoynEKExF6n+0xp03tL3spLXgLj7ao2M8o+PfIv2Y5NkQ/IsrA1to5U7k42D4Xo6PQ6UV
	vWxt0n7Ka/f5GFPkLo8WVXO0VpcWgYN5r9mMHCDxRfNrb2ZR2aToEAXQ7BCVH0mPXDj7lDE11l4G4
	kgTkBO5nmObz0F+CxPoG7NQAn9InEmMnnaEF5+uEVWjqCwg7zJmcPziyNl0RlsEIzIZKNsr1CD44a
	htDYEaWNqNxbWhtNgTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYsej-00000003YbJ-1gXY;
	Mon, 07 Jul 2025 20:41:41 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYseh-00000003Yam-1xXM
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 20:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751920899; x=1783456899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZGQ4IAp72CD0dvJdEiopEpJnXGG+TmleeD6jQxCqY6s=;
  b=VkGJrlBcFhH7TCo06YhgYSTziVz2KXlUbYTpLpHlJq11m44n8mmPaooV
   K+FJ0F7MtvBD3j1HQvZfAp+fMGLqV4wtTozga0m6hFjLlmoBACc7FoZkE
   vOziOgK2VZdmjNTtPsTgaFpC6sHNjj2msD94ssT9p2rXMdTUogQ79vpO8
   VQNk1qVkQuA5p/Aa9gKwR5BOBOqsmhAsFMD+ua4QE0GM9hPYUusKxlQp4
   ruf/dayiGMM0nDcTmxp0PS5oacfjkBJNxfP9Azdajqz+aJZ9pQChPzymR
   r77wXnR90FeoDRoTGM1J+OOtv61UdiK1yVhC15DIeilzDpyEdU+al/xO5
   g==;
X-CSE-ConnectionGUID: ppkndx3PQbew/+FB2+ptDw==
X-CSE-MsgGUID: OXDEh7W5Q5SochEPlNN8MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79582761"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="79582761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 13:41:36 -0700
X-CSE-ConnectionGUID: 6ZV0IcV6Tc++xPaC45N/Cw==
X-CSE-MsgGUID: G755qW21QSO3Gx55MFvZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="186342805"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 13:41:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uYseS-0000000DORp-3aM4;
	Mon, 07 Jul 2025 23:41:24 +0300
Date: Mon, 7 Jul 2025 23:41:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v8 15/24] ACPI: Add support for nargs_prop in
 acpi_fwnode_get_reference_args()
Message-ID: <aGww9GWPdwTFw2kl@smile.fi.intel.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
 <20250704070356.1683992-16-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704070356.1683992-16-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_134139_549081_FA6F666A 
X-CRM114-Status: GOOD (  14.84  )
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

On Fri, Jul 04, 2025 at 12:33:47PM +0530, Anup Patel wrote:
> 
> Currently, ACPI does not support the use of a nargs_prop (e.g.,
> associated with a reference in fwnode_property_get_reference_args().
> Instead, ACPI expects the number of arguments (nargs) to be explicitly
> passed or known.
> 
> This behavior diverges from Open Firmware (OF), which allows the use of
> a #*-cells property in the referenced node to determine the number of
> arguments. Since fwnode_property_get_reference_args() is a common
> interface used across both OF and ACPI firmware paradigms, it is
> desirable to have a unified calling convention that works seamlessly for
> both.
> 
> Add the support for ACPI to parse a nargs_prop from the referenced
> fwnode, aligning its behavior with the OF backend. This allows drivers
> and subsystems using fwnode_property_get_reference_args() to work in a
> firmware-agnostic way without having to hardcode or special-case
> argument counts for ACPI.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
