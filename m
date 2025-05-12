Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C02C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EahshmlKbz7azdNy7aS3Wa1NAEbMgJxJ0jU8OC0JuI=; b=V8niXYiE6u+MLi
	r+JgMiJBKy4czlmvntp/ihuCkPwruluzkaGgsvTN7wofm9+si/bDEbRmWQpEU3MP/NZxF5vZBZOHr
	OVE+M0261/RKW4BS2MMnic+R8ab8ugp1yHQIRW4hONgRKBELvLcIHKNwpxgwd9pXWvMvraAFup7s6
	6toGDO1XheklBKgETFNhhn1lZlnmsYq3eEWFo8RHFsEPUsus6R1DqXG7s9SXQcMGMdpcu0yqGzmcR
	9pfWEemyGT5fi0/4xiFgXmVIYkCU85Z48lOF5IwaLkUWDvNEnWDaBHu3o7PPlHSg4bFxKTJRaUsym
	gx+qv2BnhTHzJzunINXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOpM-00000008p6e-40cv;
	Mon, 12 May 2025 08:48:00 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOom-00000008oxW-3t9s
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747039645; x=1778575645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pOvpQydW9G7mOb+Bx1viFb769PJHsmY5rTbfQP3cF/g=;
  b=MV8Jd17956e0I6wrDoHp77t7uMKBFrq27XpeS3k6nWx7VIYoXpYsFZWJ
   IxMMqJDUXkizriVWWtIsO2wzNNzj6NxL2hsegRGsPtHvMaYR24NVCO1Na
   CeOUsfTUXDorDuQlFaILKUi+j8WAbRXd7GNoleAUUYwfn29PqQqLwLgSs
   QQaX0t20OT04AANDv5fyGGAVh/EIpWMzGX2M5vy1HZuOGknfyCBGx/hEd
   lT3EdxjPjvPhNPZergq53j/NZ1WwXYl9SKo0aa7Dy3vdmgfGKxGyNhXPI
   358KMid0x1bpIWW1/+3g3SDKRKSor6PYTOnsA+dQnmbs/SSuM6h0EivPm
   Q==;
X-CSE-ConnectionGUID: xewZIqBNTkG6IUvO7qUtEw==
X-CSE-MsgGUID: 6Lm0RpT5R46cxEKKQB5WLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48519946"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48519946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:47:24 -0700
X-CSE-ConnectionGUID: 1zLdvAZzQ9qvLMn4jpioTw==
X-CSE-MsgGUID: l8SgDcjCRKaeYnBn8vMg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137005543"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:47:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEOoc-00000000rkH-49kY;
	Mon, 12 May 2025 11:47:14 +0300
Date: Mon, 12 May 2025 11:47:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCG1kqi2w2EUKWyO@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
 <aCGjEdNVH3ughITd@smile.fi.intel.com>
 <aCGzFVXFBVRbMUKz@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCGzFVXFBVRbMUKz@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_014725_025145_2C0D54C3 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 12, 2025 at 02:06:37PM +0530, Sunil V L wrote:
> On Mon, May 12, 2025 at 10:28:17AM +0300, Andy Shevchenko wrote:
> > On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:

...

> > > +#ifdef CONFIG_ACPI
> > > +	if (!acpi_disabled)
> > 
> > Hmm... Why do you need this check? What for?
> > 
> When we boot with DT, ACPI_COMPANION(dev) will return NULL which will
> cause a crash in acpi_dev_clear_dependencies(). Let me know if I am
> missing something.

Yes, just check that the companion is NULL, rather than the above.

	struct acpi_device *adev;

	adev = ACPI_COMPANION(dev);
	if (adev)
		acpi_dev_clear_dependencies(adev);

> > > +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> > > +#endif

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
