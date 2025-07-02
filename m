Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52CEC83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSuq5bW5uyNgR2i/ZK3OEomALGCM17sDe7cD3qGeGvw=; b=lGllP2GvL8v80a
	W90eU/hSnssXMbgxvf9uK0V7kLeiGNvEpglfosyKlOpARg/jioqMDeJUCYu0/f38AUpMgNn9KLr1q
	FmU1VMWCHbTprdmC6XQaud8owBK+bHBw40rzb4mVlndcvo219C3LgYyv84aHrXh//AJt7GbIeYMQg
	MacF5k+8kycVRGacO9DyRz6w9duMvMytu9mvZL+NEX4O48bPATCR/WAyOjRpUncq71CeLSpLUvq62
	YVC5CBkv04Q8fQWw2r83HC/2nDNIRR4lh6+9xqrvufbhHKFQCiUn/T5Sl6+qyHRDV5pPcCi7w5xHh
	6TOPXTrCI5CLLyi6FTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqM-00000008LX0-3t0K;
	Wed, 02 Jul 2025 12:45:42 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwBZ-00000008ErK-3Ck0
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751457814; x=1782993814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ejD2BbOWhhH2C3aYM/UenuDYs6xR5HBlVSofSY5zouA=;
  b=JNHwal9f2KB7zlNMY6Me6280RZL1B09WCY3bJSYEtSyaYg9zm1I6KrD1
   Kx/QnH9VZOJ42EFSSRhl4TE7/l5ZtLY8SOam3SeKuX6BGI2I1YgT1jLqL
   7//YPVBFHsRjdR9bJH3N35cOYe5IgEgbJh2ez027CuvprzQrr7LOSSTcP
   I8QqmgKKvTNrT3KbSUB1DdjL5xVep696X56M7x+q0WofGTWIPSmFVZdfJ
   8FRQHteFL8A9lI7riIZbAtyeU1I2USsNjU0nm1Azdyf24MLMalGgP/Boo
   SHsS9pY8Zmslvn/vPhv5GLwPf1lUqwqkkvQvscnI+yuH0uYUW5j1U6UYn
   Q==;
X-CSE-ConnectionGUID: 2l4DVWIFQx68XI0JrQXZPw==
X-CSE-MsgGUID: IaZhRiZ+TSeFSAgeU88NlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="41376317"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="41376317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:03:33 -0700
X-CSE-ConnectionGUID: y/UVNBj2THGcJc/iCveI0A==
X-CSE-MsgGUID: TLSUro/aQVGE2wGprEhSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154536438"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:03:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWwBN-0000000BuWY-1IDx;
	Wed, 02 Jul 2025 15:03:21 +0300
Date: Wed, 2 Jul 2025 15:03:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 03/24] RISC-V: Add defines for the SBI message proxy
 extension
Message-ID: <aGUgCeDvNv4RxCwv@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-4-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_050333_810638_F6D329AE 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Atish Patra <atishp@rivosinc.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 10:43:24AM +0530, Anup Patel wrote:
> Add defines for the new SBI message proxy extension which is part
> of the SBI v3.0 specification.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
