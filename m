Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B88EC8303F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lzj6Xlq2lD2qXfIwpo2H9dDjJMCiMfWp55DXZ1ARVOw=; b=GDQwtU+LPUfDtI
	GtdfQiPzra+gBXOfu0R5P5UYldo4KbH/rRjKRSBOnGPBTU8J92w4RiJShMGg6Vd05a9GNFDkt8ygQ
	HeWeNdZAUvyucktpBvMcnAzEoZAteSoHe5eHSdOOAQgt2yo4oGOCA9Y/c+r/9enlyyHvvPfLKJkA8
	ZmCN2/8PsRCmdmCs1KCS/5W0uPtcawlLXOJh5CJp+9eKAx5vOi1BiNJ8/PfHwZC0prpmNF7nibER8
	Jnqcyu1LQgr8y0jdczX2SbiKD++3pF5gl1IMCQEiPFH5lyV5CmiF2hEyVqid//NzgmbpiQGuoJRrw
	ffZXfV9YbhbjWwbUARuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqZ-00000008Lhe-1Tlj;
	Wed, 02 Jul 2025 12:45:57 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwdS-00000008KhF-03F3
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751459542; x=1782995542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PfZ54BR/DQeTkZbbJMQYs5PKz2moe77bxCc/RiZ+xB0=;
  b=lHyKwge784i79aDH2xwJOSKES+CwvHUWa0VNPz1btI9vGucIgJoo0h48
   p89n8o6tdqX/QHgrH+9RsmVsQzvGvwfKGb6y0VsjBFL8JSwtZscfhIg6A
   rrL4MN+LzaMd3ItWx794PDxQySqFIPQi71F1TmBUuGAQ0eKHYOWMMKSlg
   e8iQSUxC7BxfiNOwunmnISlfa+L0dvbWfeOo8PR3Cx9LDTglI9l+xuoQq
   zUKHBj1TIONlpj4FADVJXsgZ1WCkQ2eXYYUm31CTW57DAM8PB2N0BDlct
   QqcG6SCG3OmAz1nD0W3KGnpNDBniUw95yXQNjLLUTCY7MTqnkJkNidbza
   A==;
X-CSE-ConnectionGUID: mxUpi3oQQ3uaK6nIiJAx3g==
X-CSE-MsgGUID: tsqi0PBqRWWrE24g4ffSHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65207577"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="65207577"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:32:21 -0700
X-CSE-ConnectionGUID: la87R4sVRIqU5y8Oay7TYw==
X-CSE-MsgGUID: Al/ue6ziSIGLMd4nKgkYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158629264"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:32:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWwdF-0000000BuxV-4C67;
	Wed, 02 Jul 2025 15:32:10 +0300
Date: Wed, 2 Jul 2025 15:32:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 05/24] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aGUmyeUMgBPVlxPh@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-6-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_053222_096535_89713E38 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 10:43:26AM +0530, Anup Patel wrote:
> Introduce optional fw_node() callback which allows a mailbox controller
> driver to provide controller specific mapping using fwnode.
> 
> The Linux OF framework already implements fwnode operations for the
> Linux DD framework so the fw_xlate() callback works fine with device
> tree as well.

Looks okay to me, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
