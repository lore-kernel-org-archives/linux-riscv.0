Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5CCC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svdtbiF3f7rlSJ648LNHgPamba+X2m6NIDUeav1zduo=; b=QS9pk5uzrLetSx
	8u95TQZ11vP2Lrja/TuzEvwNGn9FzLrU5D/HIK0AvuCVxxfwttXeFg5EUVQoz1tusgl0/QbpeGMx9
	3TZBN5P8Pgzj8kcGP7LdiG5ZpeBzb+BYkq7u+y+uktR0uK36wNb5R/9QLpzrurVo2501XF05mQj7b
	AQjpXxv6rX8Dad/a4vplbf7TLpDqjhcVYOJG4pDLavrr1tWMrUKvNM1A6Lgrc9Zg1Z9LYug2DmFcr
	cuhJkCNHJyfsi3iJkM/QPqslTsl3f7BTithEwrjGmhgkGDhjyTsJ2KLrvNIFdzNdz2hpNgWc6j9Y3
	H9+E4ho2LUIMKQxgX/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCgy-0000000FNeW-2A7i;
	Fri, 27 Jun 2025 17:16:48 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBSy-0000000FC7q-39pn
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 15:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751039897; x=1782575897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u+XL7v8/9OOtA8g6d2DdeYD79b4YpzBpJvua/vnySUU=;
  b=NObpgm7aZPdfJpOGiPcvcyY1tF1JnOLIrL+JYWZVZWqoCORkUInvzhxc
   59lOPPTYOpfJkZGUkTGc/YhaA8v7OrD/ILUJtvAi98EuKoy87n5dm6r5+
   vcb0iqlILsqb7JndackgIRJ8DAs9GReQxG9ufJjL7I236HX0a9SVGKhwJ
   vyLL7SozKtFcPn5oIEAsYER4FRZf94JwVgE9Lc033frdJ8qJmgqotfC5o
   JoOeKkdiPUY8UC58XUm80Zzh565LQm6Mye/t3BDOMhYTnlhZKoV0YDsfE
   jrlxpdW5qAFSNfjDBPCdrTakph4k1zOkJsoh3cIJR3+3VM4NidOraxG2E
   A==;
X-CSE-ConnectionGUID: ZPpcj7s8TCaGKXRCFfD1wA==
X-CSE-MsgGUID: jTWkrrQSROeivm+veVAS/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57164083"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57164083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:58:16 -0700
X-CSE-ConnectionGUID: KVJGX7g6S5KEfnZwEuHcqg==
X-CSE-MsgGUID: yIZt5dr4Q5yFAGa7IG6/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="176516514"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:58:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uVBSo-0000000AWqQ-09Od;
	Fri, 27 Jun 2025 18:58:06 +0300
Date: Fri, 27 Jun 2025 18:58:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aF6_jVJYCXeKZfXo@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com>
 <aFkZJKnweqBi64b8@smile.fi.intel.com>
 <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com>
 <aF1UWNzWhheLNTky@smile.fi.intel.com>
 <CA+Oz1=bAsykB=qAk3r8FV8K8cnPEVT4Ow7L4SWBvrc_3DsyaWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Oz1=bAsykB=qAk3r8FV8K8cnPEVT4Ow7L4SWBvrc_3DsyaWw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_085816_825225_5644AD49 
X-CRM114-Status: GOOD (  27.14  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 27, 2025 at 08:36:41PM +0530, Rahul Pathak wrote:

...

> > > > > +     if (ret || rx.status)
> > > > > +             return 0;
> > > >
> > > > Why rx.status can't be checked before calling to a sending message?
> > > > Sounds like the rpmi_mbox_init_send_with_response() links rx to msg somehow.
> > > > If this is the case, use msg here, otherwise move the check to be in the
> > > > correct place.
> > >
> > > Yes, the rpmi_mbox_init_send_with_response is a helper function which links
> > > the rx to msg. It's a very simple function which only performs assignments.
> > >
> > > Using msg instead of rx directly will require additional typecasting
> > > which will only clutter
> > > I can add a comment if that helps wherever the rpmi_mbox_init_send_with_response
> > > is used.
> >
> > This is besides harder-to-read code is kinda of layering violation.
> > If you afraid of a casting, add a helper to check for the status error.
> > Comment won't help much as making code better to begin with.
> 
> Why using rx is the issue in the first place when it's the same layer
> which links the rx with msg using the helper function and then
> uses it directly?  Infact using rx directly avoids unnecessary code
> which is only increasing redundant code which ultimately results in
> same thing. Even if I add a helper function that will require additional
> pointer passing with NULL checking which all is currently avoided.
> And, we are not just talking about rx.status but a lot of other fields.

Because it's simply bad code, look at the simplified model:

	int foo, bar;
	int ret;

	func_1(..., &foo, &bar);
	ret = func_2(&foo);
	if (ret || bar)
		...do something...

When one reads this code the immediate reaction will be like mine.
This is also (without deeper understanding) tempting to someone
who even thinks that the code can be simplified (w/o knowing that it
may not) to change it as

	func_1(..., &foo, &bar);
	if (bar)
		...do something...

	ret = func_2(&foo);
	if (ret)
		...do something...

Using msg is the right thing to do. In that way there is no questions asked
and everything is clear. Also why layering violation? Because the conditional
requires to know the guts of rx in the code which doesn't use rx that way
(or rather using it as semi-opaque object).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
