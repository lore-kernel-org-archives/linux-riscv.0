Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676CDC79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsccV+Qx8PuMYluyXPxNsKCAfoE+v9yoIyhipN/H1nA=; b=cS+ukS7F+Hbxtd
	EnCQy3+5dDHJpFph/0H7Cys4lpT2ulbyki1MHWxi16lYMBbc/cCs6Tk5aSCIgecSlU9+BPsCGLIDm
	FOVT4VTTdhlbbMKIVJV0+1jRU1678S7sZMKHYeQ9mUxEzOMIeHzQ2ycUySx3DcmwMbUwU6bLDQVlO
	ZU/6j0B8/sTqGd/mCt0fKcUMK7kcdDsdrs9F8XNo8AYmo1GWyO+/m5Or4/dse28uE/dA5EWMupkaA
	pV0GaVQjrtcaz7loM8et6ln9NcbU9SHAHfdsezjuJL3W6JlsW7RXZOX3IIEuViXjigdsn95P4vmE1
	sFH0/+QLBYQJdD2uEDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3t5E-00000008m5b-2ks4;
	Tue, 08 Sep 2026 10:29:44 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3t5B-00000008m4o-3yUN
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 10:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788863382; x=1820399382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jkB1zD6Jn9zXtXuHn8a/znVZ/dAQ8s/MQdg2UsJtUY8=;
  b=lDeS1buP9YDkDYwG5IljSL5pCEY7DKeQTgboK0rqiMOybrU3fvxqOK64
   IN97RcPyjtElkfjFy55l3ol+260Ztv7k8hZTa7ArqVj/H2PYRWFbUTVcu
   Ghlpy1TWS9k5ZYYQLls0xNqFJjkF1FEzQ16OHRAh7vfXNk66RztxfSdUZ
   9Br5SftPCV467LZtoZfG5mpybwMkUqQ20SzCkmu4LQUV5OIq92Kw063F0
   5tUH1fzQiH2GxxdToIOJb4dmHkfeM1EDfWHpDLRHUWds8vJFy5rJvaBMY
   cQ2Xpk9ld4qgEB+B7lifl1++vQPcBD8lPJTh8Or1SFZm9KlbogYTxRkU1
   w==;
X-CSE-ConnectionGUID: jQ1sKdfATOuv1704zH5pCw==
X-CSE-MsgGUID: gWGBnu0UT5K2/H3UE4KIvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89017922"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89017922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:29:38 -0700
X-CSE-ConnectionGUID: pLoFB+6XSpih592zmri7pQ==
X-CSE-MsgGUID: eCKyAV6nTdKnJJfmYy0uaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="266610116"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.92])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:29:30 -0700
Date: Tue, 8 Sep 2026 13:29:27 +0300
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
	Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <ap_jh_NAqHnIlZeu@ashevche-desk.local>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907112606.465778-3-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_032942_020251_FE62F6B3 
X-CRM114-Status: GOOD (  13.87  )
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

On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 may use multiple PHYs at the
> same time. The feature is not supported by the current driver.
> So extend the PHY definition to support multiple PHY handles.

...

> +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
> +{
> +	const struct k1_pcie_device_data *data = k1->data;
> +	struct device *dev = k1->pci.dev;
> +	int count;
> +
> +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> +	if (count < 0)
> +		return count;
> +	if (count == 0 || count > data->max_phy_count)
> +		return -EINVAL;

Elsewhere we distinguish count == 0 with -ENOENT.

> +	k1->phy_count = count;
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
