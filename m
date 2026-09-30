Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA7FCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbqs+ePuxzuVm7d/ySGjiQqOu+VO6sBI+o+SV0OylEs=; b=O0HkMS/6nBAWx2
	TqVymdK94lEZLjA95izV7Xd99J2PC5fp5kG0QbImCz3Kfxo7Escu2YEtkOoRHn5sup3aLszSvzdQ3
	fDxOsCGHZJPI4sXK8qmaVVDS1z407NPPpFBUwNHepXUIkRAoyQXlqrZ0F6Aww5/RUaYQMcP36NtFK
	RGTuSiDvCn/OQiopVbGG+JgseLmQSHPoWzCPPgQNZvB1ThQj6dlL2LVoVfLEft/3gFQCpo1rBn8Aa
	ZESNucvgUJKI7FQujvPfrlEbCcGAc4FaNgGhF+SSENTnbw5oiQU9BmjYDxxAKDfkBpe5egMEGFE1G
	YRo4cdFfXK4IOYcMgMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp8n-00000005LnE-0qqJ;
	Wed, 30 Sep 2026 07:54:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp8l-00000005Lma-1LlQ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 07:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790754851; x=1822290851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bp4reCZPd2XicV3CZCU05AoXT61eeQMuU3TMTWKtudM=;
  b=ZsvQoenGSXuj+4sZfap/tgcp5WbI4NeXzbp3MTzcY3O9jtUitRIqwD5P
   YpE8KIbMFHTkzGm+3E2jmWbYPm92OYtKqTn2KrT0G4vp7r7s2hqlHVLwc
   9sIgdS9tHhenDYFFHtSdGPLW0TjILAVM2Ezcgx6yFr+7KKLDYC0Q+mtHB
   5r3bzpBho5MYvHFfRwudXBKYNPL2eisDbPKGiuiRzElimd+8En7flBtQi
   yKrMzLT5AWmWwIncs1JoQmoUNjkS70H/r/vhM59BVFmXSnlnUCAybDhze
   OkWO/c+kwMQ8rwNGdCR35cw5GIHWuGjZhejSEPCLtz2RASCGzRrNwP8Pa
   Q==;
X-CSE-ConnectionGUID: E6hTCixfT1Gyma3Ji3fOwA==
X-CSE-MsgGUID: dehG6kZiSrasqkf9m5cNCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90346981"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90346981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:54:10 -0700
X-CSE-ConnectionGUID: KyEvnr4UQQ6q6aJZsLT+gg==
X-CSE-MsgGUID: VBbluRZLSkqZAQgOMC+6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278823387"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:54:03 -0700
Date: Wed, 30 Sep 2026 10:54:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <arzAGOKLOustEW7F@ashevche-desk.local>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929083755.458238-7-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_005411_573100_0A471C64 
X-CRM114-Status: GOOD (  16.70  )
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

On Tue, Sep 29, 2026 at 04:37:52PM +0800, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> DesignWare PCIe IP with extra link and reset control. Unlike
> the PCIe controller on K1, this controller supports external MSI
> interrupt controller and can use multiple PHYs at the same time.
> 
> Add driver to support PCIe controller on Spacemit K3 PCIe.

...

> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> +	u32 val;
> +	int ret;
> +
> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> +
> +	k1_pcie_toggle_soft_reset(k1);
> +
> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);

Would it make sense to define permutations

  PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE

for here...

> +	ret = k1_pcie_enable_resources(k1);
> +	if (ret)
> +		goto failed_resources;
> +
> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> +
> +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> +	if (ret)
> +		goto failed_phy_init;
> +
> +	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
> +	if (ret)
> +		goto failed_phy_power_on;
> +
> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);

...and

  PCIE_PERSTN_OUT | PCIE_PERSTN_OE

for here and elsewhere?

> +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);

> +	val = u32_replace_bits(val, BIT(7),
> +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);

It's perfectly a single line. Check your editor settings (I believe I have
commented on a such in one of the previous rounds).

> +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> +
> +	k1_pcie_set_device_id(k1);
> +
> +	/* Finally, as a workaround, disable ASPM L1 */
> +	k1_pcie_disable_aspm_l1(k1);
> +
> +	return 0;
> +
> +failed_phy_power_on:
> +	phy_bulk_exit(k1->phy_count, k1->phys);
> +failed_phy_init:
> +	k1_pcie_disable_resources(k1);
> +failed_resources:
> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE,
> +			   PCIE_PERSTN_OE);
> +
> +	return ret;
> +}

...

You checked everything but regmap IO. Why? Do you except it won't ever fail?
Perhaps to add a note about this (if not yet) to the cover letter?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
