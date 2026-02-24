Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788FDE9B249
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7i1doCOrNpcrUNSyiXGyv+rUwY4YCxeqrk+Zc/IBBA=; b=jZp26yzyEdy+RZ
	tyftGpzfiIgjYZYrSGn3WPng3RzMSro2JdY650P1WtC2VhBMixFYwYFSGnVwiXdzsJdq2ThxXi0fg
	0Z6V/47c9BpmGIeUiL1NO/BDXc/dpS1u797BRHEgYubhItnQkqzkMZpT2vCefpCQHjgDLk99QpbHw
	ivabPQ77s4KJfJjT9DK2NPX2NUA4ZQt9Mfb+ppEDKQguyvHFoNMGHwgyoEv1p4eyzm9LWE6gLk7fJ
	kd56fdQI794XBp4OtjNTQJ+7AfITCgrh+o9XXzI8R7+Dx+9Qjq/pGXSATskySYl912LEmRrcxIuWu
	CWx1P0yY17Elo3eWB20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuppl-00000001rsA-1UHp;
	Tue, 24 Feb 2026 10:40:05 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuppi-00000001rrL-0lhN;
	Tue, 24 Feb 2026 10:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771929603; x=1803465603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKaZi+5e3r7u58UMALFBdqyb3F151mM8t+8ODkTnkmk=;
  b=Ggw1KY85J8NXlV6YnpXh0cL7UgxX1Mw+8XRqacBqt/VfMqsj3t8+S4DV
   SRvdyMvIHPvAcDtVWX0O7sscChMIwUf6nXLc13pLIziQmfck/nysO6BMw
   Th8iuU0y1QCxRqOa7VjM+0Wv9h1VceWnBLAN9d3oAqUtLYkb76X0cQUIy
   0OQaXGftXDVfLlB2WkOQZaBYvLNvBx0KwV7L6N/d6cO0bASy5yybGp51/
   ecBXbkBDHakkPTDu2GbpUCof49jNMgWiODcWTnDJ1oKWJNYa4H5znVHL4
   t+mkHnzrHIVrFgtacjvEMenS1b1UmDGFOHiVejpz7hmh0IOJV8JGWy0c5
   g==;
X-CSE-ConnectionGUID: FDwajAbDRGe/hovcGNwA7A==
X-CSE-MsgGUID: rFKEiU1hRuehLiLXXEACAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95556115"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="95556115"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 02:40:01 -0800
X-CSE-ConnectionGUID: 2vh5u/4QSUOjYuKUxqshOA==
X-CSE-MsgGUID: IM2dRI81S8i45s0yX8WRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214955497"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 02:39:43 -0800
Date: Tue, 24 Feb 2026 12:39:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: phasta@kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>,
	Jijie Shao <shaojijie@huawei.com>,
	Jian Shen <shenjian15@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Raag Jadav <raag.jadav@intel.com>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-i3c@lists.infradead.org,
	dmaengine@vger.kernel.org, netdev@vger.kernel.org,
	nic_swsd@realtek.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
	mhi@lists.linux.dev, Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	linux-spi@vger.kernel.org,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
Message-ID: <aZ1_7IwDYfiLbfQE@smile.fi.intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <6223f3cb-693f-42e7-9147-30f659f08563@hogyros.de>
 <7ca512d133f7a3bcfe00e9b0b2af5fe5f147ad77.camel@mailbox.org>
 <aZ1rb8zoqmQmakDP@smile.fi.intel.com>
 <48297cc524736e7452def05448ece84260a4fd83.camel@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48297cc524736e7452def05448ece84260a4fd83.camel@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024002_309777_1BC316A3 
X-CRM114-Status: GOOD (  17.52  )
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

On Tue, Feb 24, 2026 at 11:30:28AM +0100, Philipp Stanner wrote:
> On Tue, 2026-02-24 at 11:12 +0200, Andy Shevchenko wrote:
> > On Tue, Feb 24, 2026 at 08:39:43AM +0100, Philipp Stanner wrote:
> > > On Tue, 2026-02-24 at 13:14 +0900, Simon Richter wrote:

...

> > > If I could design it from scratch I would probably try to tell users to
> > > use the unmanaged versions instead of revoking the devres consequence.
> > 
> > +many.

> hm?

I'm supporting you with many hands up (more than I possess)!

> > > Devres is actually about your consequence always happening whenever the
> > > driver unloads, for whatever reason.
> > 
> > I believe you meant "unbinds". The device<-->driver link can be broken
> > without unloading the driver.
> 
> Yes, thx for pointing that out. Greg KH AFAIK always calls it "driver
> detach".

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
