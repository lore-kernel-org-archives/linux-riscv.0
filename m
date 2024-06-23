Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE63C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jun 2024 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zACDNoyah7It7vu3MHok9OgMZZ5Fi6RpcNdRmvoMxZo=; b=2W3oiyvd60EBsH
	qW3l1M/xB+Syu+hlHljHxmTRRF7Fdv+R+fIBID1Ds1Rx/xGaihprHzqsYtVhc06qEagdR1gz8tsx0
	BAcd0oAAuokQ6yT05Z4rK2Eg+WA+f6erU54lxUNneV1QsjKnmVZi4T2DZOBpeTBqLV2Z/KjVRh+Fs
	YwK+NRxu8IzhTp5lIf8zAp06mRF6TSK2LAo3d7MGEbMhgU3tUsUDW2IbEwBxUx50XDVcIz2wDVqN/
	kDlJQ3uyUxPEPZMGxTcMVABic0uyHqu9VJD6pTYi5tJj5+AUfxAo/Twr4WXTUWAQOi23Lr1rDi+ZV
	ixH50TTQMErMXRp3hA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLQc8-0000000EQsq-0CCX;
	Sun, 23 Jun 2024 17:02:52 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLQc4-0000000EQsJ-3Iih
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jun 2024 17:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719162169; x=1750698169;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zfODlBOh97OBvCy1FrENRxxZBTPeLPsVTYAwdmU+/oU=;
  b=Jt+vAQ2LYmB43g1IuaQ8swbSSP4Vy7VIcShgPLhUuZJq7ln4gpJGR8ZX
   Sv7oh//wq5jxgTM6VvvQTwJfXOQQNi5BU1O4t5RjQRxG2ypcKCj6dgtHt
   vzmMX4tjmYtT2Z+OoCPLrE1HMbzXaZpj98ZOOtcx1Oy54LESLHwUAjd48
   N0rfNVLyfbLdF9Oyw8Eh39MLpEDD4oBcTn5ImJIGlu9wUV2R/fJ+C+etJ
   9KP3jF4618UPHPq6iDkI20bQAF43qoxnFQ8RU48icWVd7qp0rKdNeKnkg
   lb32KorXef2zg19GlKGDa86vsLQIczCdSmxaIPxDncAxEfEC0MYsZLV7S
   A==;
X-CSE-ConnectionGUID: oZOh1tRDSii6ITXEvRcw2w==
X-CSE-MsgGUID: bpjcPJcBRviUrdIZb1jfRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26721864"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="26721864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 10:02:43 -0700
X-CSE-ConnectionGUID: tzYSooFGRHKN41oXEJJ4tw==
X-CSE-MsgGUID: lgVTm9aTTAiZOiOe5cfh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="42972002"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.55])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 10:02:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 23 Jun 2024 20:02:35 +0300 (EEST)
To: daire.mcnamara@microchip.com
cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
    conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com, 
    robh@kernel.org, bhelgaas@google.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 1/3] PCI: microchip: Fix outbound address translation
 tables
In-Reply-To: <20240621112915.3434402-2-daire.mcnamara@microchip.com>
Message-ID: <395f27f6-d263-71d3-acbd-b1872bc48fa3@linux.intel.com>
References: <20240621112915.3434402-1-daire.mcnamara@microchip.com> <20240621112915.3434402-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_100248_935891_DB53159F 
X-CRM114-Status: GOOD (  18.46  )
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

On Fri, 21 Jun 2024, daire.mcnamara@microchip.com wrote:

> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
> three general-purpose Fabric Interface Controller (FIC) buses that
> encapsulate an AXI-M interface. That FIC is responsible for managing
> the translations of the upper 32-bits of the AXI-M address. On MPFS,
> the Root Port driver needs to take account of that outbound address
> translation done by the parent FIC bus before setting up its own
> outbound address translation tables.  In all cases on MPFS,
> the remaining outbound address translation tables are 32-bit only.
> 
> Limit the outbound address translation tables to 32-bit only.
> 
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 137fb8570ba2..853adce24492 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -933,7 +933,7 @@ static int mc_pcie_init_irq_domains(struct mc_pcie *port)
>  
>  static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  				 phys_addr_t axi_addr, phys_addr_t pci_addr,
> -				 size_t size)
> +				 u64 size)
>  {
>  	u32 atr_sz = ilog2(size) - 1;
>  	u32 val;
> @@ -983,7 +983,8 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
>  		if (resource_type(entry->res) == IORESOURCE_MEM) {
>  			pci_addr = entry->res->start - entry->offset;
>  			mc_pcie_setup_window(bridge_base_addr, index,
> -					     entry->res->start, pci_addr,
> +					     entry->res->start & 0xffffffff,
> +					     pci_addr,
>  					     resource_size(entry->res));
>  			index++;
>  		}
> @@ -1117,9 +1118,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	int ret;
>  
>  	/* Configure address translation table 0 for PCIe config space */
> -	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
> -			     cfg->res.start,
> -			     resource_size(&cfg->res));
> +	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
> +			     0, resource_size(&cfg->res));
>  
>  	/* Need some fixups in config space */
>  	mc_pcie_enable_msi(port, cfg->win);

I had some comments for this patch too none of which are addressed by the 
the v4?

-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
