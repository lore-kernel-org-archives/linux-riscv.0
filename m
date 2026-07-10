Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC08C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUE48XWeIAULm54OUHOY7c80cafINcVUE53EG1HKHFE=; b=zaJzr/uC7g3JS3
	aWeZDIIO2BeXsnUvDrGyBMtqGsudHxa2DOXAC21OxZNejVuRrkCM4Zc9oCZpSRdei+dp73+krDs24
	tA8TSU26UD8fmYlX2JItGxA92tOK0a/AGahbmaTUwdKz3I502GbHMf59dkTNDSGwMx106KOr6dAeA
	t/iDv3UWIuam3Pyuh/Nqk51nEutNH8FyYZuxtrnHbYwko6cupaCgEc53LhvplqXa3gI1Ypj3m2A0q
	aWd+06LboNrcsauJDjg0Pq7PyGQ5n21Jt8zLZEoIOa1tYLFOV3Q3aog5/mXvcfAYrt4faoEVQyshF
	TTNudJSHIeqCI219CQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6H7-00000004QDV-1E2v;
	Fri, 10 Jul 2026 08:07:57 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6H5-00000004QCK-2GZp
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 08:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783670876; x=1815206876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=naUIyFM2ineqBmx6cpwvg+5iO9MPbuiQdUMA+z7fCpA=;
  b=JOUplMr1ujHhKexuHtb+MZyZwQsmykhDkPVOwF4IF3M5OG1a1axYRD3p
   AAkJrYO2YYo+euptSDjqHd9+p2mYsKOv/RIPvCz3DFcXH97zKitTHqzya
   qOfPMFaQtNAHCNsC+NyyrQ1X99B8PfyRmqUXeQetLeEc2AfkUZkH49JFc
   d8WAyCOHsEVIWmBj0b2/3HZEestLrXCg60ExZwDZm5znjgGeBgLKLuFbT
   mR9rXSxYFhejAhA21/VyJ7cc2lR8aLRbumdckRPbsYyQWR6qjjECd07zy
   iM7o6ptehv+AsFc1UKCqcjU8/oeaxwd6uhPPHlrYBZOdc2Mi1HZRZnFlj
   w==;
X-CSE-ConnectionGUID: Yo4/Z32kRyq/IlLgSgY4wQ==
X-CSE-MsgGUID: lifKt1cSQBm20ajc9c4xzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84467114"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84467114"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 01:07:55 -0700
X-CSE-ConnectionGUID: k7BT+p0WS6GXZTFCbLFfbQ==
X-CSE-MsgGUID: ZEvW6qjkTVuzuBJ7QTu3sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253089844"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 01:07:47 -0700
Date: Fri, 10 Jul 2026 11:07:40 +0300
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
Message-ID: <alCoTEDUY8AO9OzD@ashevche-desk.local>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alBNXgMAwXPKwiJ2@inochi.infowork>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_010755_653147_1E2A5A27 
X-CRM114-Status: GOOD (  33.10  )
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

On Fri, Jul 10, 2026 at 09:57:05AM +0800, Inochi Amaoto wrote:
> On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> > On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:

...

> > >  struct k1_pcie {
> > >  	struct dw_pcie pci;
> > >  	const struct k1_pcie_device_data *data;
> > > -	struct phy *phy;
> > > +	struct phy **phy;
> > 
> > Should it be annotated by __counted_by_ptr() ?
> 
> Yes, I think it can, this is something I have missed.
> 
> > > +	unsigned int phy_count;
> > 
> > Ah, you allocate much more memory than possible PHYs... Can you redesign and
> > use the above annotation?
> 
> IIRC use the annotation does not reduce this memory usage...

It's about how you allocate it, the code uses max_phy_count instead of
phy_count.

> > >  	void __iomem *link;
> > >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> > >  	u32 pmu_off;
> > 
> > >  }

...

> > > +	k1->phy_count = i;
> > > +	if (k1->phy_count == 0)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > 
> > This doesn't seem correct to me, I would expect phy_count to be assigned only
> > when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
> > different 0 in this case.)
> 
> I guess you think 0 is a valid number? I can not understand what you thing
> Assign this to 0 if there is no phy is fine to me, which shows there is 0
> vaild phy found.

Isn't it already 0? Semantically code is wrong in a flow (not in the result).

> > See also above. Do we have some PHY API that just counts provided PHYs?
> > If not, that what you should probably add first, before this patch.
> 
> I have not found any api for this. But the actual problem is, how the api
> is designed. I have checked both the array bulk api for reset and clock,
> it seems like it is much more than this patch...

Yeah, I looked at the phy-core and I think it will be hard to implement.
So, the idea is then is to reallocate the pointer each time you get a new PHY.
In this case the phy_count will reflect the actual memory consumption by phy.

...

> > > +	for (i = 0; i < k1->phy_count; i++)
> > 
> > 	for (unsigned int i = 0; i < k1->phy_count; i++)
> > 
> 
> I agree with the unsigned int, but I guess this definition is not
> allowed in linux.

It's allowed and it's encouraged even by Linus. As long as iterator is local,
use this syntax sugar and reduce its scope. It hardens the code.

> > > +		phy_exit(k1->phy[i]);

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
