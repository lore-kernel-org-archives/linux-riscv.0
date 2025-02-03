Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4E7C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MRh2LxRzb77YA12QUbEAdzwbHmkzgERdHuPfLhuHkY=; b=r/OMvqoBJMf7mr
	qJGoyREuM85DI5DrvsyuUvh6+IWmMLE6STdW9Ejdq6oNze0I5xKOcGi2zhVgE7S8WbVOhDw+IY7v2
	p7rXU2mLuOsLouD2bQSohGn6nB+aFujNszQmGCpXjVfj4e6n/WoDfB37/gQTaFpaEBf5HCkd8aabC
	nWc7wZitHZkBy50nqmYy79/659v+7hnwgi8qy0YECF3JXDHtSVqhSorJQbH5xn7C8f7exZzfZ1EgO
	av1x7wBIOD7DQ+bcHmDEr6XR18ajEcd21Xf7f6ejnTSSEPtwgGEqGqM9l18VLZygolYiaxS0OnXDh
	K+LNEBBFCFUaCJCT/UTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetxb-0000000F9ZN-2ANO;
	Mon, 03 Feb 2025 10:45:47 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teszR-0000000F1iV-0KCY
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 09:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738575817; x=1770111817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aQY5nT189S5QUoHa13vFWQRg/WET3r3m2ffZ4yejuzQ=;
  b=eHBh3SPcLRimgSFdiQ6rrfE69oukDuc5ycUmeQOgmy6xsuisuCYdrG4S
   P5DoKIXNN+z4isPK86fiW9M6S9Z6W8uHEMoFtqN+d5tLWKCgtKoeJuPmW
   QO/1T5WN3isxcSmLoz1wkhqIktExv8Yhy35hUAFyv5JeA4tzzVnW4y5Gc
   80l1JihWYInQEQPstxD4pRvlvDctSn/eF4Fkdc2gAmqNw5jIf4Lb9FO0R
   RRkNqIowTYQ6m8muPZE1vMQmsutQqbS2kqroRd9IhCb0BbPhEuIQDmyc1
   oKgwcT0SsrMRb9CQmoxP6NAgGYC3Gv5RHIR2eOkwWnFoFaFBfdGVeZxkf
   g==;
X-CSE-ConnectionGUID: c8rJ5zJLS5SinlqZ6pKvQg==
X-CSE-MsgGUID: WSXZatp2SCKMYNOaf8E14A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50476125"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50476125"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:43:36 -0800
X-CSE-ConnectionGUID: LLrcAqr0Rlm/ruY5605yCQ==
X-CSE-MsgGUID: oFZ70KHIRg+AEWH/Kc4nCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115392397"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:43:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1teszG-00000007mu6-17QX;
	Mon, 03 Feb 2025 11:43:26 +0200
Date: Mon, 3 Feb 2025 11:43:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <Z6CPvteWv89Xo70j@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-13-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_014337_132038_0C0717BD 
X-CRM114-Status: GOOD (  14.31  )
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

On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> fwnode_get_reference_args() which is common for both DT and ACPI passes
> a property name like #mbox-cells which needs to be fetched from the
> reference node to determine the number of arguments needed for the
> property. However, the ACPI version of this function doesn't support
> this and simply ignores the parameter passed from the wrapper function.
> Add support for dynamically finding number of arguments by reading the
> nargs property value. Update the callers to pass extra parameter.

I don't like this (implementation).

It seems that we basically have two parameters which values are duplicating
each other. This is error prone API and confusing in the cases when both are
defined. If you want property, add a new API that takes const char *nargs
and relies on the property be present.

Your patch becomes much simpler, and solution is robust against potential
confusion on how to treat the corner cases.

Note, Rafael might have different opinion and his has the last word. But
here just my view on the implementation details.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
