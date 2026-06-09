Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95103CD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B94xvRKC50UWji+tsZtkjKiBUkKUmlcf79nwfTW5HEA=; b=ABHsRosIffyMc0
	6uUm7zmgn073qgVsJ50gKGmHj/AbveIhgJ9gsCP+uqa2q2D8r/aAZOJ5eUTaEwKu5tlgX6fY7nVt6
	g20PNPEmXQQKUwM4zHp76dc6rojKP0EJbuQqN1yzF6fufq4c1XQyBuGqEmZShdJe1B618jUXih9eG
	faob4jhwSDMybQl5gwph/mgGAyaXqfFb1KErMm8e3vSTDdXt7b88sZSRUeQeVnPBWxt9UQsXzN/57
	TQ+ZS+skQuifX77sqIm1bFm2auvz9eJMbOKhUBobE6mJXI9Bc84X3tmW+RgEru7/930lUVcItY/O1
	WJZ4JWONW7+LR4uzP4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxln-00000005pBZ-2ohi;
	Tue, 09 Jun 2026 14:49:36 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxll-00000005pB1-0S7i
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 14:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781016574; x=1812552574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Z2e8ukGc3KhQzq9CXL9zA+rmMjw439SLKHDG9lz3kA=;
  b=dWde64V7BEMuAMat7h68IOaF3/V9LnDEWMn5+mefFiHprlyk29uUk3a0
   QvqsOoxG2GjoZ5X8MIp+x2pIiW83BVU/6y4UHlpYDLOoMqlQEovj5WT1d
   HxGC670XcwhFQWUX7XW0MYk62Zjn+d8USNLK1PLvNP1W/lYi/yNeL2ElP
   bfXamy9ZMaggpV83Q1FiHnc6K4EbHqjc3E4F5oWstrHaFxaby80PSXElX
   tcUWmFUAdfl43SsJSe2IDAaffOqgRWFvt24zTcI6Eq/VIw1TiKtIMG4hr
   9dze4oxKCmS88jccmat6FbNw8Ps/gynGVTur24JxMQEe/AW1xQHrXpp1N
   Q==;
X-CSE-ConnectionGUID: QDBfs3lbQZSYCTyTRTkTWQ==
X-CSE-MsgGUID: WXBP/M5GSsCoMcHa2WYxFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81527065"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81527065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:49:33 -0700
X-CSE-ConnectionGUID: Vor5LSMvR1y7lXA9Z9vPLg==
X-CSE-MsgGUID: JO+VAp6lR9Kw7gZOYCCT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="242923218"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:49:26 -0700
Date: Tue, 9 Jun 2026 17:49:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>, Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <aign88JV3k_wn2HK@ashevche-desk.local>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-6-inochiama@gmail.com>
 <wztjdv4t5cn7djj3jyvheest7rn5nr2g3efzwods2fz3yy5wn2@hbl644sd6fst>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wztjdv4t5cn7djj3jyvheest7rn5nr2g3efzwods2fz3yy5wn2@hbl644sd6fst>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_074933_276168_16B8B9ED 
X-CRM114-Status: GOOD (  17.95  )
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

On Tue, Jun 09, 2026 at 07:48:12PM +0530, Manivannan Sadhasivam wrote:
> On Sun, May 17, 2026 at 09:48:40AM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.

...

> > +static int k3_pcie_enable_phy(struct k1_pcie *pcie)
> > +{
> > +	int i, ret;

No need to have i signed.

> > +
> > +	for (i = 0; i < pcie->phy_count; i++) {
> > +		ret = phy_init(pcie->phy[i]);
> > +		if (ret)
> > +			goto err_phy;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_phy:
> > +	while (--i >= 0)

	while (i--)

is shorter form of the same.

> > +		phy_exit(pcie->phy[i]);
> > +

...

> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> > +	usleep_range(1000, 2000);

fsleep(1 * USEC_PER_MSEC)

> > +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> > +
> > +	msleep(PCIE_T_PVPERL_MS);

...

> > +	int i;

Why is 'i' signed?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
