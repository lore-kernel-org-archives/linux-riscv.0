Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7D6C83030
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIDAOOLEmtrz2YBlGpHE7LQbXyZnW5xNH8s5EAYr7IQ=; b=JtGYjMR9/anXn8
	gLvgIaLimLW2w6brYq53ceq2G8SzvYbgLxyrqR37z8WP6NYMj9xeG8RmViyNXFWXgFgV/lipFrXhg
	am46ex/tqGuyNht9dRvNzNDz6YEhlGJcKHQ0G8VKiPpOoKdMDq0bJ4mkX4xkzAy07NbIVBg44kk54
	dSv0hxHq8UYK6P/T9brQH9Sr6FC1drHNAdifHPuxQbK82HpfSnzoTGfhQW6awW3cWoBASvv4cIeOE
	G3GmXLsghStHzcYobx2vxQn3jk7CR+d6HId2z0Zno2u7TwWOajGSzBBvAQkc6YSdyfbg2EwFP44yd
	NX9+uKzFreFijZxHL0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYscT-00000003YHB-2suS;
	Mon, 07 Jul 2025 20:39:21 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYscQ-00000003YGq-3xVL
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 20:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751920759; x=1783456759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kcrB6F2mxoqFMPRnDijT6o6h3KVvHamrCsmEhzHfJiQ=;
  b=KLTE6RNMEZ+V0tvv43NXm7FZDttKrVS6kF5n5wR9OnvPCJID1FTYVbq0
   DRSG8kZNsdA6PYUfY+DG6Wa3xYbx8In6SBguoB8HZJGBxoYkpEXNF/at1
   KxjEH32/nkNABScx+joHpl9lbr/LIsx5FJB7D7rI2Lg0lGrwGywwYeGA0
   vBfoQZrBk6OYX+G6gvPZ5FHyvOBbS5aiGS5II0yuuF0eIaDxS26VZM+/9
   iQAspWxunefE0KugiRA5urdyeTPgCwoZLfeQUkw2RfNuZ4mQNctdZ7V2g
   TVtd8HiPF1OBjPMxnCws7yTeccg/cWXEzNkKFbDGyUwz653stjMf/CDcE
   A==;
X-CSE-ConnectionGUID: wYRZHZAlQNOykrCDksn5gw==
X-CSE-MsgGUID: eFI/polITDi+YuvRx/IDjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64397518"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="64397518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 13:39:16 -0700
X-CSE-ConnectionGUID: vD4xfab6Q4iMgufgeuM4pw==
X-CSE-MsgGUID: i1AYe1TLR5CbsO1FTsLDjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="192494134"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 13:39:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uYscD-0000000DOQV-12J7;
	Mon, 07 Jul 2025 23:39:05 +0300
Date: Mon, 7 Jul 2025 23:39:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v8 14/24] ACPI: property: Refactor
 acpi_fwnode_get_reference_args() to support nargs_prop
Message-ID: <aGwwaGmiIxdElk1Y@smile.fi.intel.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
 <20250704070356.1683992-15-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704070356.1683992-15-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_133919_033446_93B4117E 
X-CRM114-Status: GOOD (  14.47  )
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

On Fri, Jul 04, 2025 at 12:33:46PM +0530, Anup Patel wrote:
> 
> Currently, acpi_fwnode_get_reference_args() delegates to the internal
> function __acpi_node_get_property_reference() to retrieve property
> references. However, this function does not handle the nargs_prop (cells
> property) parameter, and instead expects the number of arguments (nargs)
> to be known or hardcoded.
> 
> As a result, when fwnode_property_get_reference_args() is used with a
> valid nargs_prop, the ACPI backend ignores it, whereas the Device Tree
> (DT) backend uses the #*-cells property from the reference node to
> determine the number of arguments dynamically.
> 
> To support the nargs_prop in ACPI, refactor the code as follows:
> 
> - Move the implementation from __acpi_node_get_property_reference()
>   into acpi_fwnode_get_reference_args().
> 
> - Update __acpi_node_get_property_reference() to call the (now updated)
>   acpi_fwnode_get_reference_args() passing NULL as nargs_prop to keep
>   the behavior of __acpi_node_get_property_reference() intact.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
