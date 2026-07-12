Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968A1C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfNNIYFAD4EXWM4r/PtiK7SWFy9Z5tanbbCGllBxo4I=; b=eMH1FmvIUnW04M
	z8zsaOUWtyHsYBa0lRZVBQJzwpTYmnVmkbja803WFZRGSsAx0xWjjMOmbGfH1DlU0w8n900wuVOgK
	uuRWyxc/D8ZSM8bPs1tD0qt1XFFTzRH4grnJKsb4dt5wMXs35jEKoQDj/azLgfZI+gJA8ZvtemgrJ
	6QuZkFBqIbMsekbPzIoI8zMiqAyKEv7e5motZFnE6zNrVOX9EWGRf4E42y5tFrPfcf3NXbddjpo8F
	yfXejCKXjtWJWC/gYPJLrTkSciJ4KEkYsiFJCqZ+aM2+wUwzVjJelrF7ikqgE7rd7gbmgagK6CoHI
	waYO+sZg4qvxJAkdvPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqay-00000007Iqu-18QJ;
	Sun, 12 Jul 2026 09:35:32 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqav-00000007IqU-2h3R
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 09:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783848930; x=1815384930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mGp1bq6AA1K85gaOp9+XDByvUL2SultskddshE44Syk=;
  b=PNBzr2iHt1hOLl0/cxuxLOBEf0iuIAE9mSgwRQPMABAUmGRqVhw3uZw/
   WjxVkpsQHdbRsLPwXdfJ67o3jTc44LbF/HBMQlKaiuvsrnwuLg32IT1C8
   wz1VKYp61IZL1SseIEfkaWpxJYWQ1PAjwgMIFJvp2hAmZ4J5rnUrDt4Qq
   XAKMszpeD6VrXi5Saw2FPDFvMTeHecLn+jdBn5dyrQzKEp0F41jzDDkGH
   LZkTFlwtpCD7fRoZWB4jKTiCDCWNCsHqIpQhJTTKGIbjm7oP4taHXcwJX
   wCyQ1QMTJ9TDdkCK99AATdvyLT6d2fj8PyH+rvCgPfGzvrDZMBF00hhjZ
   w==;
X-CSE-ConnectionGUID: YHCgLoL0TIavvDOCv77jMg==
X-CSE-MsgGUID: 1WBTvmCbTeWiRcVVG7uTiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="102038663"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="102038663"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 02:35:26 -0700
X-CSE-ConnectionGUID: 9iJqSNd8TrO9jHI70RXUgg==
X-CSE-MsgGUID: yangtqhOTzKX89W8YnrRww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259587848"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 02:35:19 -0700
Date: Sun, 12 Jul 2026 12:35:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <alNf1OoBtscauPXV@ashevche-desk.local>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local>
 <alDNlfb0_T9g-ATO@inochi.infowork>
 <alI6ml4xQboFOgxG@ashevche-desk.local>
 <alMmkHrfgWoN8RqS@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alMmkHrfgWoN8RqS@inochi.infowork>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_023529_717110_8F7786FC 
X-CRM114-Status: GOOD (  27.45  )
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

On Sun, Jul 12, 2026 at 01:41:25PM +0800, Inochi Amaoto wrote:
> On Sat, Jul 11, 2026 at 03:44:10PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 10, 2026 at 06:55:10PM +0800, Inochi Amaoto wrote:
> > > On Fri, Jul 10, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> > > > On Fri, Jul 10, 2026 at 09:57:05AM +0800, Inochi Amaoto wrote:
> > > > > On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> > > > > > On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:

...

> > Then the counted_by will be incorrect as it may access valid memory, but
> > unused by the driver.
> 
> After some search I found a requirement in GCC patch:
> https://gcc.gnu.org/pipermail/gcc-patches/2024-May/653123.html
> 
> It seems like the array can have more elements than the counter.
> Some I guess the reallocation is not necessary and the counter
> is still correct. Correct me if I am wrong.

There will be no problem from memory accesses point of view, but there are two
disadvantages:
- the waste of memory for unused items
- the memory accesses beyond used items, which may lead to or show the subtle
  issues in the code elsewhere

Better to be correct. It might help debugging as well in some other cases.

...

> > > > > > > +	for (i = 0; i < k1->phy_count; i++)
> > > > > > 
> > > > > > 	for (unsigned int i = 0; i < k1->phy_count; i++)
> > > > > 
> > > > > I agree with the unsigned int, but I guess this definition is not
> > > > > allowed in linux.
> > > > 
> > > > It's allowed and it's encouraged even by Linus. As long as iterator is local,
> > > > use this syntax sugar and reduce its scope. It hardens the code.
> > > 
> > > Could you give me a reference url to check,
> > 
> > Sure, there are two (one for integers and one for pointers)
> > https://lore.kernel.org/lkml/CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com/
> > https://lore.kernel.org/lkml/CAHk-=wgy8p4is8ApEQCT5NS7XFb+NXeo-TKz7jRRZVksLLBSrQ@mail.gmail.com/
> > 
> > > I have not found this on the coding-style.
> > > https://www.kernel.org/doc/html/latest/process/coding-style.html
> > 
> > Feel free to update the documentation.
> 
> Good to know thanks.

Are you going to update documentation? I can review it.

> > > > > > > +		phy_exit(k1->phy[i]);

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
