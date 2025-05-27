Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20176C54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VT5Ng7+6iTbBLyNEjQjvqTc4U8VoqrdQ5kTG9uAEfK4=; b=kRPe3uY6HexFho
	9laUUfVKTAnMjNxeUumVutHWtjnparn/WdyXuMF1YfnVvJaHLVbVvP0YLvpRbpnH0psAvbtbeiPYG
	1B/10goR3tcm63daCK4bYA4D6MSNG/NutrQkoEy8KdQcUOihOhY+hhYg8CNmSLD6F29Q3IA83WcZk
	y6WBwcFzsHzlzMyhmLxcJs5i7u+lEW/ulgb9rdC8kbTHmDI+hU+nWhMiZ6lerMxv163ueUclrA3lY
	9JB30uy3btl1i7BflDFF61143b6vTeLbnSOOArTFwRyNlc00vFxHvHbDGuBL8OqBfZ3ouYzBSXxDx
	248t9i9Ao8z77GCXpmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsIU-0000000AYAo-2Pwv;
	Tue, 27 May 2025 11:16:42 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsIS-0000000AYAM-1Va6
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 11:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748344600; x=1779880600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EjudQlGVvEOYUmNh3s6EppvuvaihZA4yyvfSDP84JIY=;
  b=RaeEzJ4isCmrnRiSP4/U3CiVh/Ke4EmNI9CyYoNPmtaPk8n3qRVoL+/s
   TNS2g3tX7Jn9kKjJyAKd9F2kNBrF+GdeNYlu4DRdOuwc21Xl8YU3Sck2w
   BkKIEuishVcxnT3uH7ZLUGA2dgfWiKsl/o1HqBN/XXsAd5KMuKt2z7B06
   g8to1wBdUrQxJNu1kis3HTi68tt8540uqlhzThQlBmilQ/Ybkf5lCuRSR
   cIpmM1ZSymf+P1ez7w8rpWWtNXztsLxIoARXsCswrUPvWE0uHMndDU8XH
   iQMQ9xgFuM25pBtjrtziIPqkfHGRIz5Nzj0bHHdgL7lJocs7se9Jpni22
   A==;
X-CSE-ConnectionGUID: SWYXU7MJSFSJUZyLs9QTBw==
X-CSE-MsgGUID: HP6BIshbSKOjiD/cwkWY9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="72861603"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="72861603"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:16:39 -0700
X-CSE-ConnectionGUID: Bthi2lKHStCiZp2BfkKx3w==
X-CSE-MsgGUID: E2k9PfJMRXCzgCXjmF9wIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="142775629"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:16:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJsIH-000000019FZ-3o0T;
	Tue, 27 May 2025 14:16:29 +0300
Date: Tue, 27 May 2025 14:16:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 05/23] mailbox: Add common header for RPMI messages
 sent via mailbox
Message-ID: <aDWfDZ_rmdZeuvX3@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-6-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_041640_461412_4897AC5F 
X-CRM114-Status: GOOD (  13.24  )
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

On Sun, May 25, 2025 at 02:16:52PM +0530, Anup Patel wrote:
> The RPMI based mailbox controller drivers and mailbox clients need to
> share defines related to RPMI messages over mailbox interface so add
> a common header for this purpose.

...

> +#include <linux/mailbox_client.h>

This is not even closer to the list of the headers the header is using.
E.g., types.h is missing.

> +/* RPMI version encode/decode macros */
> +#define RPMI_VER_MAJOR(__ver)		(((__ver) >> 16) & 0xffff)
> +#define RPMI_VER_MINOR(__ver)		((__ver) & 0xffff)

Same comment as per previous patch.

...

> +	RPMI_ERR_NO_DATA		= -14,
> +	RPMI_ERR_RESERVED_START		= -15,
> +	RPMI_ERR_RESERVED_END		= -127,
> +	RPMI_ERR_VENDOR_START		= -128

Leave the trailing comma, as it doesn't sound like a terminator.

...

> +		return -ETIMEDOUT;
> +		return -ECOMM;
> +		return -EOPNOTSUPP;

+ errno.h

...

> +/* RPMI linux mailbox attribute IDs */
> +enum rpmi_mbox_attribute_id {
> +	RPMI_MBOX_ATTR_SPEC_VERSION = 0,

Why do you need an explicit initialiser? If it's a HW requirement, all of them
should be explicitly defined. This makes code robust against potential changes.

> +	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
> +	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
> +	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
> +	RPMI_MBOX_ATTR_MAX_ID
> +};

...

> +/* RPMI linux mailbox message types */

linux --> Linux
(everywhere)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
