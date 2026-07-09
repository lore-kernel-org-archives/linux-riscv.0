Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCB1C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOrYWvzrSRIDq/f+xRIYps3hQYEhalVD1Wrs3ax+kSY=; b=DKvQYY7Vfd3QhK
	s8zyTJgenyq/SDWW8Qq4aoyFE9K42sRJfyoT9adnXyU4peGmY5C4lKWDJdYzM/VvkJf7bTCbn64xC
	+DmY8WrZuO+tkdEkTZrweEjOBlaZPr74EKeRKoJJ81bBu2PCacLvVxioOeBlYQa+li9T2FhSpQsLY
	1aghufNVxJGdiUTPpp7uRLlirkW9CAPety+03zmYe2eYY8MZdttvYuo1ShjQj5Tmh8XhIhTY7ziw6
	WBmzwl+TqKmRdt+ckLgKZGLZSlv6MTsx2gZh57ADUg12P2oLLeKnF08vOdYEqFJ/Lnr0lj8h8822U
	0D74LKZYL0OagJ3CUCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj4c-00000001GRw-2ah0;
	Thu, 09 Jul 2026 07:21:30 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj4Z-00000001GRV-2JqA
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783581687; x=1815117687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5H4IhXLZzOH5Ha9ASFgpDI9HdBv56YUDrwZoMEH/IOo=;
  b=A0GL9i25BCWVRckwgiNOcmczs2lNpnn+CHo/7SnOLHpZN35wV3QFpk9U
   TqA5cPoQ6NJeyZXiGwkRiXfuLCzDt2v5ewb4vpLGx0ggRqJUJ5rdp9k6I
   iTAtFmSO4qN3HddoI07nAKBUbZou4K8CwF5NJmQPB0nnbkYUhw/59Wb74
   J8O0MtlcZ3Wxu26+5HfgZ+zMcn0QGpdPo6mqrn/UXrsFr7N/bPJhYhWeh
   byTh3S2EjthH3sHh9Tz0ZqatDrvOmqSacAHnr4PTj2Su6SFA/GrzzJD8m
   601JZOmPR3Ogt7vQYtGm6eKDbaaD/hgymj8RbenVK4x92kUr6HLh9OI/+
   g==;
X-CSE-ConnectionGUID: Zg28M/ymS+SkxRSfGL/K4g==
X-CSE-MsgGUID: vYuY1RcmQFCVXb1S9BAFyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84367179"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84367179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:21:26 -0700
X-CSE-ConnectionGUID: q4RcSDcZRd2GSX+oXmPy3g==
X-CSE-MsgGUID: w8q0zeu0RTKucseODByeZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259412572"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:21:20 -0700
Date: Thu, 9 Jul 2026 10:21:18 +0300
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
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <ak9L7k-_aivk1_Uu@ashevche-desk.local>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709040027.958400-7-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_002127_611015_6F60361A 
X-CRM114-Status: GOOD (  13.49  )
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

On Thu, Jul 09, 2026 at 12:00:26PM +0800, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> DesignWare PCIe IP with extra link and reset control. Unlike
> the PCIe controller on K1, this controller supports external MSI
> interrupt controller and can use multiple PHYs at the same time.
> 
> Add driver to support PCIe controller on Spacemit K3 PCIe.

...

> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> +	usleep_range(1000, 2000);

fsleep(1 * USEC_PER_MSEC)

> +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> +
> +	msleep(PCIE_T_PVPERL_MS);

If PCIE_T_PVPERL_MS is too small, msleep() maybe not a good choice,
perhaps

fsleep(PCIE_T_PVPERL_MS * USEC_PER_MSEC)

...

> +	val = u32_replace_bits(val, BIT(7),
> +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);

It's perfectly a single line.

...

>  static const struct of_device_id k1_pcie_of_match_table[] = {
>  	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},

Missed space.

>  	{ }
>  };

I don't see (and haven't checked) the context, do you have
MODULE_DEVICE_TABLE() for this?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
