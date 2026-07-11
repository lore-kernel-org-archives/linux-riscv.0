Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9014C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 13:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndJgvtp/NVcfsq6Z5Q+l9F1DYgUnovfFfLJCv1NNk1M=; b=HJKk1yGcnWe1Jm
	JV1R9TJvjVDN7Abjoqrm7QLfKs9lK2g+3BgfdiGSOmuYl79ioeJqDtmbYGXYvrZ9C157R0NMNDpar
	CYLpMPLcsvoxN81PTcWIHfBsusdUBFtfMDEWJpjdtThLMDq+EY5Kh6wXgVNtUa9hGEOM+x9ob5m5g
	aElspb5Aa/Y69SyBeAKDLB1XeaHB9l0yor/lJTdxB055BKBVtlp1qrDINGxOS5+OodkOHqMgHVbCA
	XzOA4/qjOcIozcYOoK2g0BEs8hOCPbDn+nhanPch+Wyxg94YyzqkMlX2mrWtP3R1rm/80L/AwJ7cZ
	OqL5hie6PHfaKKwh6g5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXNT-00000006YfE-2DG3;
	Sat, 11 Jul 2026 13:04:19 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXNR-00000006Yei-0tvO
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 13:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783775058; x=1815311058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dh/NC1ZAMj5F/j++S19UU/UH7ttb+MchcJhoqRF0piY=;
  b=KZZefRbkKT7M5iP+USqO9uX7utDBQkYB5KgT4MLYCES8fwhThCp9IIef
   CEZ/kEtG2xtR97+O/St8EDrSoHDJCX/R9W/wAmIFAkydu8nEfzbC8eDN+
   GJsCjpg+ZzFmvlu3HCtdP+S9BdoGHyMYCMBtaBPOFRo8ooOvJ8mgkZJOo
   XAWoz4K3MIVGfeQkP42tr7YN1CVZgVAz8LrvKJKmPcCnIcLtfBclH44vR
   BDnp8Xjf02F/y4YcEXHxwA6WgwvVZ+BJuxqFJl8kq+as87QUSw82YSWIC
   nkeh4wZP8v+GM0+ArXPdWgxKHiXu4ZK7UUbl7xLubZoo63Y4PuW49jY/E
   A==;
X-CSE-ConnectionGUID: Xn1oM56YTIO1MNa3TFzKZA==
X-CSE-MsgGUID: HzsrNxVDSM+PcFIBfTQWvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84474543"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84474543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 06:04:17 -0700
X-CSE-ConnectionGUID: Bwi9OOBeQiOd5U9xEkaNew==
X-CSE-MsgGUID: qw7nWE8zQg++guoxV6gm1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285214472"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 06:04:10 -0700
Date: Sat, 11 Jul 2026 16:04:07 +0300
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
Message-ID: <alI_RxpH8E3-Hsy4@ashevche-desk.local>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <9de024d9-c7a8-4291-a79d-83acc77b261d@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9de024d9-c7a8-4291-a79d-83acc77b261d@riscstar.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_060417_301946_08817264 
X-CRM114-Status: GOOD (  15.25  )
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

On Fri, Jul 10, 2026 at 07:51:05AM -0500, Alex Elder wrote:
> On 7/9/26 2:16 AM, Andy Shevchenko wrote:

...

> > > +		if (IS_ERR(k1->phy[i])) {
> > > +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
> > > +				break;
> > > +
> > > +			return PTR_ERR(k1->phy[i]);
> > > +		}
> > 		if (PTR_ERR(k1->phy[i]) == -ENODEV)
> > 			break;
> > 		if (IS_ERR(k1->phy[i]))
> > 			return PTR_ERR(k1->phy[i]);
> 
> I'm not sure this is a huge improvement.  Checking IS_ERR()
> before using PTR_ERR() is comforting (a little along the
> lines of the other issue you mentioned--assigning a result
> before checking for an error).  Anyway, it's a little bit
> of an ugly construct no matter how you do it.

Yeah...

> Here's another possible way to do it.
> 
> 	k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
> 	if (!IS_ERR(k1->phy[i]))
> 		continue;
> 
> 	ret = PTR_ERR(k1->phy[i]);
> 	if (ret == -ENODEV)
> 		break;

In this case one can simplify to

	k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
	ret = PTR_ERR_OR_ZERO(k1->phy[i]);
	if (ret == -ENODEV)
		break;
	else if (ret)
		return ret;

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
