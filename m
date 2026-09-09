Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD49C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzBduy3oF3W5/7Bo+tpdtpf3oqS+EF5BMndaIG4of8s=; b=d8vIgssUkZhSOx
	z8ylFoe2r7UL7APil/lU8NXYVu9BltlzMHIU6cL+RxR7+PuljOXam1bkf8+FGjgGHH3jmGeh9VwFw
	eG0BbPzafQXX3Xm7a49/SWKHAqNCvXMtsrodUvgdp3kdVV2EnOUK0v6u9BxHiuJkLJi10NqW7sFnQ
	Ny/H5GwTG+eFGX3ADOCzNP4CLSNMGPMxjrGIh0llMaNIqidnw+gvyercJnde7cBWBIOaOnyFG5EX6
	MAu2TvDkpjlwtHDjGHksHe/XH9WxRHQyrQ/gAfzHH9ytmbwtc/HwLgnKiDlAsG/pow3d63FjcuvwN
	FbPm2BZ2FXfBZUN5Qgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JGg-0000000By7S-1Ih0;
	Wed, 09 Sep 2026 14:27:18 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JGd-0000000By6H-3LSm
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 14:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788964035; x=1820500035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xzc9CDaEataSODX3+D8tIBpZnqAi1qMg/rSgS+n+z2s=;
  b=hpCzk5Y0BdH966YP/VSV4n07VtcZ0ptkt5AfDCluym00s/AanVEh9+vd
   tZxCkPyngRBsJeSh2XlOEhrHcHKR1f4KA/4Pn1iF0IbXCSqH5DGOfG7NW
   Q98biVB9dlPR28ViOAhMiXCFLhig96P5p5ngDX30WYeLTEGy5Fgm5jxy6
   4Hu33uGcRr66U0R27CBh9xwL+2kolmVAv7YThszhbgnPvZvAQj7tTPvI2
   p8ZxIyiC3mQ9RJqFsSZM1ILlYy9EV1x7H1o0wU31HgcjqMKYyz+p71cMK
   ZG9EOcpjrDYZgePZmXF6roiAMoXIxK9EAabTPzuuqiEtjB1vOtvTVJ0tx
   Q==;
X-CSE-ConnectionGUID: SJ+M+vR1QTeuPBNbvkpt4A==
X-CSE-MsgGUID: e3JlQLlJRoyRWujfBGqg7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106908370"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="106908370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:27:14 -0700
X-CSE-ConnectionGUID: O1CZCFz7Qyap+OeL8wYAUA==
X-CSE-MsgGUID: 8DeSi4z3Shev8h1HQmYGKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="301221372"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.249])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:27:06 -0700
Date: Wed, 9 Sep 2026 17:27:03 +0300
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
Message-ID: <aqFst9QH9YTFlY3X@ashevche-desk.local>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
 <aqEQnkrPSKB-3fam@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqEQnkrPSKB-3fam@inochi.infowork>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_072715_859514_886EA588 
X-CRM114-Status: GOOD (  14.24  )
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

On Wed, Sep 09, 2026 at 04:00:15PM +0800, Inochi Amaoto wrote:
> On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:

...


> > > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > > +	if (count < 0)
> > > +		return count;
> > > +	if (count == 0 || count > data->max_phy_count)
> > > +		return -EINVAL;
> > 
> > Elsewhere we distinguish count == 0 with -ENOENT.
> 
> Is there is an example? I think it is suitable for its internal check 
> to translate -ENOENT to count 0, because no phys property means no
> phy. For a get helper with optional semantics. I think it is fine
> to return 0.

This the brief list of what I roughly grepped with word "count" in the name.

gpiod_count()
of_hte_req_count()
i2c_acpi_resource_count()
ice_sriov_set_msix_vec_count()
reset_control_get_count()

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
