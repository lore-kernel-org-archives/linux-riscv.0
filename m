Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA9DC02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPNXsQboq7iewU0bUJi+cVcuaNUyY2IIhwrJr+YQZOU=; b=4jHJpRypQ1aPZO
	cCL9jR/OEm2pfdTFNWAT3V5RXU4VPzzsckasHb9j0O3e3NQAB/clVGW4/lqunW21kD6Aq86CvDp/y
	UvcS02VbFfY1cyPqSiQT6cRQHgsbHO5QAtHAbn/uTiY1Y73ymxn8KVxpM+vqpfM0RkVyQpsxF/Ea5
	DgEuNakDEGqcUP8QboWBeqL03VSJiUpZ/6h4spovRhLFGP09ozbIxbbR2wTu3g3/eryyogInI6Fx8
	ioEPlhojel7dsTUe2DICfeON2ZRlnppabnLw8NPhhMTG4EHqDxA1zm8wgE/B4hsAIFRtFVuc1fbvh
	ru4r0nqiYKyuU2bUUfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tet1f-0000000F2O3-3E4E;
	Mon, 03 Feb 2025 09:45:55 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tet1c-0000000F2NA-2j1p
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 09:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738575952; x=1770111952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rstTH4HxPCJrnbCU4UITudFVvJpWca+YiZPY4gaILw8=;
  b=YlH8P9xXA4Uaiew0d9a6HA293w7y89CGAYuCirsJLCpouZl1BMDNoM6n
   csR6mi2V0hiFTC3pSpYPIFxlr8HBTMGrqTZ7N/iuvWB77Bl/Bq7uiRH+L
   2zZC76QDbWLKnbrZHMkn0G+7/YKdVu4u/uYD3rSKZsed6usLKlka0mbef
   8yuQO4z/kxWWa7aQeiSak9J8xhV0gU4HMS06JeqcrGez0nc+NFHp9/VU/
   8s5+KJwrJo86TosJFeyULHPGnr2z8yZxs3AJraOlk8zMh+hn+TXit2T+f
   u1DjCQuVISIzXKMdKvnWZID9aVApgjD6FLuPU1cTXlFG7+tQO3wej/oMH
   A==;
X-CSE-ConnectionGUID: EGkB58uIQviHn7F/DcBM8A==
X-CSE-MsgGUID: kffCvpz4QqmVHRB+UD8JxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="41894394"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="41894394"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:45:52 -0800
X-CSE-ConnectionGUID: QlEalOV5SXWFrYoa7tlydw==
X-CSE-MsgGUID: +zqACfbiSdGiFD7VLplOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109997448"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:45:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tet1R-00000007mwP-3nns;
	Mon, 03 Feb 2025 11:45:41 +0200
Date: Mon, 3 Feb 2025 11:45:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 15/17] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <Z6CQRU4uCNBwVStY@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-16-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-16-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_014552_697306_CCE2D444 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 03, 2025 at 02:19:04PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> mailbox driver.

Ah, here are the same comments are applicable as per patch 16.
Haven't noticed there are two similarly looking changes.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
