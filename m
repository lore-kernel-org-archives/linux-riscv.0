Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48D0C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04LRCquQ89g0fsYjKaLOmlxgZehGU7h62vuVVg/pr5A=; b=ZD8C6z8HO/iXe7
	LNVk2nFAagsWmPjOfekkIbXaGcOa37t1zjDhcAqUkhQVera+b4uxwifKq8gtr6enXzFCJs19qNPkx
	RnEDifCONkIfXJAZEHbCZBSX4Bi00JQcNQ+9iiC410e+9GeRkSDPAH8BDVcDbkT9VoX1UCjj6Sxms
	b2mf+L6Ef/lL+ZsH/0sMuaG8uyNaGZyD9mTzSG7kp1NvueXCjUMeia1hX/vdAMqVT/NlIkaHQJe4y
	qv4XS5OKwBcvbN3FKaawPF8ZECpy7tTQsOG6F/iAl1TmzLa0m/N1cx/To3HTpzaj5UVW9tSQVRCtN
	GRy2kPvUHT+idEcfqPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpYy-00000009yqN-33MK;
	Wed, 21 Aug 2024 17:56:04 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpYw-00000009ypi-3tCr
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 17:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724262963; x=1755798963;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5rjtecgTLe61TDiP1Qutb2BjskSqEw4NOTWaKKSmqGM=;
  b=b2tq4iDoe1GcjlwnNB3kvtTnvtYXCt7L82prJXnjV2cG+YIKYLTRTAOB
   hxGunghb4s4YACi8kEFZD2hpH47gqfYchCKqFa7bzyuvlbMAmQSD547d9
   3GdC+64gfIX5QGd/LKb0TYSD0obK7SEQDUeucpIMxmjt9uLbPFQVdbheF
   mQuvYr6067OBS+4DQprCIMpkQgu/WsmRdPqNbopBkJ4FJfZlodaY6zm07
   JqTf5m2kB3rRbW9ZEUdy34sCZYyt6Ncd0djKCqwCvDbKsZB+grKMRhZCd
   AuR9oI4lDsZ44OKnCpBbLAfSo2N6pyZ3EM3FaX2zaC80UZnOZ5l6P6U9U
   A==;
X-CSE-ConnectionGUID: AGiD83nCQZ239A+EKCXwyA==
X-CSE-MsgGUID: WGiZxNZVTBKY6nkn4Oj+hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48035552"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="48035552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:52:20 -0700
X-CSE-ConnectionGUID: ojB2pnmJT526RXpL0G9esA==
X-CSE-MsgGUID: vzwY+38oRJ6Z3u7wngf2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65369743"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:52:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Aug 2024 20:52:13 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: daire.mcnamara@microchip.com, linux-pci@vger.kernel.org, 
    devicetree@vger.kernel.org, conor.dooley@microchip.com, 
    lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
    LKML <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 1/3] PCI: microchip: Fix outbound address translation
 tables
In-Reply-To: <20240821170330.GA256147@bhelgaas>
Message-ID: <62e20d95-1ab8-dbc2-41c6-21ca48d56c6f@linux.intel.com>
References: <20240821170330.GA256147@bhelgaas>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_105603_007374_B163E06A 
X-CRM114-Status: GOOD (  29.94  )
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

On Wed, 21 Aug 2024, Bjorn Helgaas wrote:

> On Wed, Aug 21, 2024 at 02:02:15PM +0100, daire.mcnamara@microchip.com wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> > 
> > On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
> > three general-purpose Fabric Interface Controller (FIC) buses that
> > encapsulate an AXI-M interface. That FIC is responsible for managing
> > the translations of the upper 32-bits of the AXI-M address. On MPFS,
> > the Root Port driver needs to take account of that outbound address
> > translation done by the parent FIC bus before setting up its own
> > outbound address translation tables.  In all cases on MPFS,
> > the remaining outbound address translation tables are 32-bit only.
> > 
> > Limit the outbound address translation tables to 32-bit only.
> > 
> > This necessitates changing a size_t in mc_pcie_setup_window
> > to a u64 to avoid a compile error on 32-bit platforms.
> 
> I don't see this size_t change in this patch.  Add "()" after function
> name if there's a relevant function here.

It looks that change was still present in v7 but also "u64" is not correct 
either because it was changed to resource_size_t.

> > Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  .../pci/controller/plda/pcie-microchip-host.c | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> > index 48f60a04b740..da766de347bd 100644
> > --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> > +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> > @@ -21,6 +21,8 @@
> >  #include "../../pci.h"
> >  #include "pcie-plda.h"
> >  
> > +#define MC_OUTBOUND_TRANS_TBL_MASK		GENMASK(31, 0)
> > +
> >  /* PCIe Bridge Phy and Controller Phy offsets */
> >  #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
> >  #define MC_PCIE1_CTRL_ADDR			0x0000a000u
> > @@ -612,6 +614,27 @@ static void mc_disable_interrupts(struct mc_pcie *port)
> >  	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
> >  }
> >  
> > +int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
> > +			   struct plda_pcie_rp *port)
> > +{
> > +	void __iomem *bridge_base_addr = port->bridge_addr;
> > +	struct resource_entry *entry;
> > +	u64 pci_addr;
> > +	u32 index = 1;
> > +
> > +	resource_list_for_each_entry(entry, &bridge->windows) {
> > +		if (resource_type(entry->res) == IORESOURCE_MEM) {
> > +			pci_addr = entry->res->start - entry->offset;
> > +			plda_pcie_setup_window(bridge_base_addr, index,
> > +					       entry->res->start & MC_OUTBOUND_TRANS_TBL_MASK,
> > +					       pci_addr, resource_size(entry->res));
> > +			index++;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int mc_platform_init(struct pci_config_window *cfg)
> >  {
> >  	struct device *dev = cfg->parent;
> > @@ -622,15 +645,14 @@ static int mc_platform_init(struct pci_config_window *cfg)
> >  	int ret;
> >  
> >  	/* Configure address translation table 0 for PCIe config space */
> > -	plda_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
> > -			       cfg->res.start,
> > -			       resource_size(&cfg->res));
> > +	plda_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & MC_OUTBOUND_TRANS_TBL_MASK,
> > +			       0, resource_size(&cfg->res));
> >  
> >  	/* Need some fixups in config space */
> >  	mc_pcie_enable_msi(port, cfg->win);
> >  
> >  	/* Configure non-config space outbound ranges */
> > -	ret = plda_pcie_setup_iomems(bridge, &port->plda);
> > +	ret = mc_pcie_setup_iomems(bridge, &port->plda);
> >  	if (ret)
> >  		return ret;
> >  
> > -- 
> > 2.34.1
> > 
> 

-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
