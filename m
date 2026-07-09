Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB53C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CtLw9LB6OKQycZ2+YWqlAwc+kmJRrP3QtTrkU5C+As=; b=cjUGtTmhIdemd9
	jRPRp5UU6jqxt7+O/Gr+Cju+AvXiFv4fyJsai7KnwxQUNkcP8Ahn7ZbyPq0HezxL+swguJPMoph3u
	fDSxTTpj/pQMgg3CWvdMThg7DCbWZHUllrbejseH4YMLt2QvColoYWY82IZ4M8HTOVqEeSacUkN5B
	BKBwq2wir5OpLvzU2yJOqdPA532FQ1ZcDB7sK0llxhJxBNdY7CMknPQ6YnfGmPDMbU44loDFKStwC
	Yh2fdtPw1OUvw9edEOhmR92TxliNwxgnLTfWL0aSWzMu5D5khtDD6+tcCd841sfBLRaCYs4HT87ua
	6s9QRES9vjCaq2l/pkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whizw-00000001FgJ-1UmT;
	Thu, 09 Jul 2026 07:16:40 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whizt-00000001Ffm-3u3f
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783581398; x=1815117398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dvT1QZNOdjtOMYfMH1zYDVT1RPz7VJjAh7dTKE2ZvSM=;
  b=IDiDsm7lOK922AKAkRXrMfCNeWhqnHA7PBzpGBgB/5nB8YpzQlZ9xrHU
   V9uhoH4UIcJBBn8Azs2bogZRGWNg28oR1xhPvuh2O6/ff8Zoi76j8MVih
   iLL56KhGzWgcL42VgEMSrWnEQ/VdI+HmtehciG/kdLxu7amL5LjTnYXow
   iULW69lt5vAQdyZFFVchVNC+wHRCkZjTC7YZPaFxqDqZ+0NUMiVcNHv9+
   vceqQLM34OgSCCW/nMV1W3wDSSPn7eyPVh8Dix7CsnPcXfnVZSI0d4py2
   13qGZYcF0senIokauwFrFjRTTJka9CzRr/8XP9XF0lJgcKH2MX6+LK8CE
   w==;
X-CSE-ConnectionGUID: 2cmJQHneQBinroqJrawDXA==
X-CSE-MsgGUID: uPxbcHBLTPeBPYYr4pkZmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="86797419"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="86797419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:16:37 -0700
X-CSE-ConnectionGUID: rigr31JtQJ6eedVSCMiIKw==
X-CSE-MsgGUID: KgjB/8nlRJSPDPGa3kZGXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278894335"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:16:31 -0700
Date: Thu, 9 Jul 2026 10:16:28 +0300
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
Message-ID: <ak9KzNFF26B0Kttz@ashevche-desk.local>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709040027.958400-3-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_001637_981971_BC2AABAA 
X-CRM114-Status: GOOD (  23.03  )
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

On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 may use multiple PHYs at the
> same time. The feature is not support by the current driver.
> So extend the PHY definition to support multiple PHY handles.

...

>  struct k1_pcie {
>  	struct dw_pcie pci;
>  	const struct k1_pcie_device_data *data;
> -	struct phy *phy;
> +	struct phy **phy;

Should it be annotated by __counted_by_ptr() ?

> +	unsigned int phy_count;

Ah, you allocate much more memory than possible PHYs... Can you redesign and
use the above annotation?

>  	void __iomem *link;
>  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
>  	u32 pmu_off;

>  }

...

> +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
> +{
> +	const struct k1_pcie_device_data *data = k1->data;
> +	struct device *dev = k1->pci.dev;
> +	unsigned int i;
> +
> +	k1->phy = devm_kmalloc_array(dev, data->max_phy_count,
> +				     sizeof(*k1->phy), GFP_KERNEL);
> +	if (!k1->phy)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->max_phy_count; i++) {
> +		k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);

> +		if (IS_ERR(k1->phy[i])) {
> +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
> +				break;
> +
> +			return PTR_ERR(k1->phy[i]);
> +		}

		if (PTR_ERR(k1->phy[i]) == -ENODEV)
			break;
		if (IS_ERR(k1->phy[i]))
			return PTR_ERR(k1->phy[i]);


> +	}

> +	k1->phy_count = i;
> +	if (k1->phy_count == 0)
> +		return -EINVAL;
> +
> +	return 0;

This doesn't seem correct to me, I would expect phy_count to be assigned only
when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
different 0 in this case.)

See also above. Do we have some PHY API that just counts provided PHYs?
If not, that what you should probably add first, before this patch.

> +}
> +
> +static int k1_pcie_enable_phy(struct k1_pcie *k1)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < k1->phy_count; i++) {
> +		ret = phy_init(k1->phy[i]);
> +		if (ret)
> +			goto err_phy;
> +	}
> +
> +	return 0;
> +
> +err_phy:
> +	while (i--)
> +		phy_exit(k1->phy[i]);
> +
> +	return ret;
> +}

...

> static void k1_pcie_deinit(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct k1_pcie *k1 = to_k1_pcie(pci);

> +	int i;
>  
>  	/* Assert fundamental reset (drive PERST# low) */
>  	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>  			PCIE_RC_PERST);
>  
> -	phy_exit(k1->phy);

> +	for (i = 0; i < k1->phy_count; i++)

	for (unsigned int i = 0; i < k1->phy_count; i++)

> +		phy_exit(k1->phy[i]);
>  
>  	k1_pcie_disable_resources(k1);
>  }

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
