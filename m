Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEB5EFB81B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0CF1hdApnZe8Thti2ZXkaOsmknphjfRi29HjBUgtyY=; b=mxiE53j0/otiys
	wyjqXexqTtA26QOUCibw+N1zJ6YrP60E66bpQSIN867ZSms4zDYvijUX8Ow/Qnbdr6n0n2FMQaW+x
	cukGXkQW8S91ypTxcszrNMKd+hqnC6+d7HC2kxnKjXP9ZhcYp/cejldlFUuUfQhnSap16ZAdqE4rB
	P7EgB0Fr64CdadxCtGtLCN0rQ4Xc2dkmDg2s0m6bJWjYWZBG2r3u+V0xFv3UP0q85vytVVXABrtL6
	97nacuPi9F5UdyBy6GPbZV5eJPP8RNgzA9L+GeMJ5ubzMBac/BzpXDjxkpIQhgIXmpe9amUBVg1Zx
	NBy07s9UnVfs1AwfmN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoTB-00000001iUI-0JGY;
	Tue, 24 Feb 2026 09:12:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoT8-00000001iTj-0mdF;
	Tue, 24 Feb 2026 09:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771924358; x=1803460358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sllJU41EvNnfq6cfH0Cm3WpH9/CrTwdLF2yCyQc6C20=;
  b=RA+0OU25jS5i1/hMDG1Fm9GJYRESB16dVAFYEScIOb+hVTwlU5ci3+Fs
   jq8d/5npqQT/GhcKGsKuHFxEy+ni9QianguEopDJs5D6OHGGXSAdW1Mg/
   qJYzJluxK6KAgOu7vE5VwKs3vSOtk85AgiLE05Wq9Mls3whZ3W/Ci4hS5
   QOKqY0qmd7+giX5JT5RI3SlSRvIgJvoGys5kkc6XiVVwc6YlacTegd2dP
   RqyuA0irCpTQaLyCdEQiAZM1rTaGVgqdjUWyZi3BoI3jQMeCqqp9T27lH
   O9kyaP9wYAOZcX0xEX858eqtZ5SYj9/ck//e3uau5SJBpbkPPwT/V/jgp
   Q==;
X-CSE-ConnectionGUID: HmN0+dGJTA2u4ERWP0+VZQ==
X-CSE-MsgGUID: s9vJ6xaYTEOecVyPXMF8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73039931"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73039931"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:12:35 -0800
X-CSE-ConnectionGUID: v4GiDQV6T1ycBQRHOBv6QA==
X-CSE-MsgGUID: yR3Uba70Qr6uzGgc8QUkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="219937945"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:12:17 -0800
Date: Tue, 24 Feb 2026 11:12:15 +0200
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
Message-ID: <aZ1rb8zoqmQmakDP@smile.fi.intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <6223f3cb-693f-42e7-9147-30f659f08563@hogyros.de>
 <7ca512d133f7a3bcfe00e9b0b2af5fe5f147ad77.camel@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ca512d133f7a3bcfe00e9b0b2af5fe5f147ad77.camel@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_011238_242571_5619504A 
X-CRM114-Status: GOOD (  21.60  )
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

On Tue, Feb 24, 2026 at 08:39:43AM +0100, Philipp Stanner wrote:
> On Tue, 2026-02-24 at 13:14 +0900, Simon Richter wrote:
> > On 2/24/26 12:29 AM, Shawn Lin wrote:

> > > When such a driver also uses `pcim_enable_device()`, the devres framework may
> > > attempt to free the IRQ vectors a second time upon device release, leading to
> > > a double-free. Analysis of the tree shows this hazardous pattern exists widely,
> > > while 35 other drivers correctly rely solely on the implicit cleanup.
> > 
> > Would it make sense to have a function pcim_free_irq_vectors(), to allow 
> > explicit freeing even if the device is otherwise managed, analogous to 
> > pcim_iounmap()?
> 
> We used to add those. In part because it is easier to port old users.
> 
> Nowadays I tend to think that those APIs were more on the too-complex
> than too-simple side for a long time. As an expert or as the API
> designer you wouldn't expect it, but there are actually far too many
> users who came to believe they always have to use pcim_iounmap() and
> counter parts.
> 
> If I could design it from scratch I would probably try to tell users to
> use the unmanaged versions instead of revoking the devres consequence.

+many.

> Devres is actually about your consequence always happening whenever the
> driver unloads, for whatever reason.

I believe you meant "unbinds". The device<-->driver link can be broken
without unloading the driver.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
