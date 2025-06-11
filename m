Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C43C71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGLVO2Hiwrabuw8PqSDOCbhheYFldBKIGibMS9HyndY=; b=h8o7WrzX948jOm
	RvVgbUgcys/c1NpGywNXCHPpMA+t12Zv2fiN6X5yDpy5ibja593m4jENgkp1cG002ZTbqo0gmtqSY
	FPB//wqaX6g04ZqcXdz49wdu40+ELDXV+db8WxrKJd5f0nhea0pcJuHgjXROmNL4O362YuKQ5zQfL
	m92WIM+BAqkBiOn1jH8loL9/9JHHMq93x0oLyy/sTydA/M+LxY+yOPy/ygepylvk+R8cRGw/Giqb+
	ybGoO3dIxnflyEt4aVMQDSxjCr/C2wlE8uRQEaGWXWGRcq1dti2lN9CazMNHzyaPRzT4GVcpCCt63
	wmTDUY0lEqHfk0NfDOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwH-00000009HqF-0OzU;
	Wed, 11 Jun 2025 08:36:05 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGi7-00000009FWg-0z95
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749630087; x=1781166087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0DOFaEYP8MagS1qPDHfS05rAbYBRe1MWToUpeNj/fE=;
  b=QnPeFUnVMmqEJpFaWOfC/YRwyeP4OQWtaqgE+W7k5h98gicgU/Of8Bcy
   bRg7uCf7F/mqsyA3GZkJcu+Luxo/n5ek1aKV3/ldmOErG7Z53UYpwpN/f
   cKhNCf2AgWAQvR/z36aJCPs4OacYgwov8z2sbMIEhaAiXrWB0Nd6I1BSK
   1CdGlcEr1n6iIyUP0coQDGLi3Mo+45LiLQPyBRp7pdDNbcOYmbtNrFLUN
   qbJ4aH6R17aVcrhOzcTMY9fgi2QYkYwF8qyEZsDmCtWn3oR6cHhLjMaBT
   /rcRlDV6fFTKWgOcQNZMWmKXrFjCxwCY3fH3LsQbLUfeWKanwkblDoxhh
   A==;
X-CSE-ConnectionGUID: /GiSgxayTsCzBkkZjlXYiA==
X-CSE-MsgGUID: cepXSD7VRx+2NYeNoEcjVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51909765"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51909765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:21:26 -0700
X-CSE-ConnectionGUID: We/pXEkUSQaqbugsgC45UA==
X-CSE-MsgGUID: cibwTyIiQ4qpfhSF5CLNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="152089121"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:21:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPGhv-00000005aDU-2vxY;
	Wed, 11 Jun 2025 11:21:15 +0300
Date: Wed, 11 Jun 2025 11:21:15 +0300
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
Subject: Re: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list
 in sorted order
Message-ID: <aEk8e6CQa2gE893v@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-18-apatel@ventanamicro.com>
 <aDbuABrlO30TIrx1@smile.fi.intel.com>
 <aEe3m23wIDM1I-AH@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEe3m23wIDM1I-AH@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012127_316753_E502ABE8 
X-CRM114-Status: GOOD (  13.80  )
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

On Tue, Jun 10, 2025 at 10:12:03AM +0530, Sunil V L wrote:
> On Wed, May 28, 2025 at 02:05:36PM +0300, Andy Shevchenko wrote:
> > On Sun, May 25, 2025 at 02:17:04PM +0530, Anup Patel wrote:

...

> > > +	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
> > 
> > Is this reimplementation of list_add_tail()? And why list debug is excluded here?
> > 
> Sure. Let me use list_add_tail() itself in the next revision.

Thanks,

> However, I didn't understand the list debug question. IIUC, list_add_tail()
> is a wrapper around __list_add() and doesn't exclude the list debug, right?

You are right, it's not about debug, it's about using internal function as per
__list_add() documentation:

  * This is only for internal list manipulation where we know
  * the prev/next entries already!


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
