Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69498C44501
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aNw6M8fvdMr2C7X7Q8RuDWBh5FZKGnl1MXr5xRGQG0=; b=fsHcftwiRPlE4W
	z2D3DLjYWv+llXDzg3rzjI25AlEuDHbSsvCh/AiAANHFpbeYNZBHqQSzixYfxEM8CGM0vDcn1IzwD
	nkDaZF3kwlQMV9fVF4sjm5VnzovLo5hJPuPfOCOhH9sp2KlYW9ZSJkQuKiJdGu2FilkxMm1lWsrGs
	l4fWHYQrhfHYtGbE/WMAAG0BY1ARivTGNracy0NTkf3/YH462A+gmcHALX4DAnEZQvbQRwewPvCuM
	zSU8OSNxqa6UTz63mBX9zgHLnyQrEjuKTZKPMGwaPXT5Y4aktzeAqgKHXhqXOVjJ77z2wBdJHJtLM
	zl42L9+vcmxAUosdapMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXKe-00000006YW7-0frm;
	Sat, 11 Jul 2026 13:01:24 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXKb-00000006YVi-1Des
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 13:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783774882; x=1815310882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gDyYXc0xkS1qjYwLDld4FPWvWyjEMY3IdZ86KmQ4NSU=;
  b=CALQbsrI4bF8jHT8Kl8LRez3YAV1xRSTHB9p3oxKOIrfm2MNqxsMtiaO
   12mA1BxsA9k6YYdf3eWgHj8IMK1sbYpF7CHKD1oGa0noSwR0hlPwMc5Tk
   Tjx+/FhTxbt8xQT0yNB9/IBvd4UCwPD4mI0/Z1A+jHwZQaUL5LAiMl5to
   13004Fu1Wt091qGT2A9tQHVK+lL3wC7GBx00ipV5xAvDwyzoCDxIGjLks
   gSdZ520pZWePUG6LpwZcwrsxVz2ypc2f8oQUXWUGam7GHLvb5Xi3I9cdK
   cQW0NAkpl09FMAF5itKjFaEoSsikbmivbbkOCkuG5GOLkNSBmmj8aRGcj
   Q==;
X-CSE-ConnectionGUID: poV5TvcoTzC87uSh5N3LzQ==
X-CSE-MsgGUID: Hj7ofggKTuqV1XWnGPzyxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84474374"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84474374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 06:01:20 -0700
X-CSE-ConnectionGUID: H7u5/OdeQhypTaspD0rwew==
X-CSE-MsgGUID: QEf1nTayQUOEsvaa1qOQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285214246"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 06:01:13 -0700
Date: Sat, 11 Jul 2026 16:01:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
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
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <alI-lmctZShbXCHs@ashevche-desk.local>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local>
 <alDNlfb0_T9g-ATO@inochi.infowork>
 <3cece33f-375f-4cb2-b07d-e75f065fe5ea@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cece33f-375f-4cb2-b07d-e75f065fe5ea@riscstar.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_060121_365644_092635A3 
X-CRM114-Status: GOOD (  24.59  )
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

On Fri, Jul 10, 2026 at 07:42:18AM -0500, Alex Elder wrote:
> On 7/10/26 5:55 AM, Inochi Amaoto wrote:
> > > > > > +	k1->phy_count = i;
> > > > > > +	if (k1->phy_count == 0)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	return 0;
> > > > > This doesn't seem correct to me, I would expect phy_count to be assigned only
> > > > > when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
> > > > > different 0 in this case.)
> > > > I guess you think 0 is a valid number? I can not understand what you thing
> > > > Assign this to 0 if there is no phy is fine to me, which shows there is 0
> > > > vaild phy found.
> > > Isn't it already 0? Semantically code is wrong in a flow (not in the result).
> > > 
> > In fact it is already 0 here. But I am not understand why you thing is wrong.
> > Could you explain it in detail? (Maybe you think it is not good to return
> > -EINVAL?)
> 
> What Andy is saying is that assigning the value of phy_count
> before checking that it is valid is not the expected order of
> things.
> 
> The point is about best practice, not about the end result.
> 
> Best practice would be "don't touch anything if the return
> value will indicate an error."

Yes, precisely.

> And therefore, better coding practice would be to check for
> a bad value, and only after that has been done should you
> assign the k1->phy_count value.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
