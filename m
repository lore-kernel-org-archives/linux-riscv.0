Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC65C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Be/ZIiRJrn96gh3vGJ3vFwgWddfTBWMKy2Ywap0VSzk=; b=1r8KQTkt8vKz4X
	+Y+5BcSB26SwLpfYWr6vAPszVuPLSfh2tuSWNJZMZ64iHgHcgXsAQkbRoSIJ9Z8DaLENkyhuTG1wI
	B7U+6lAk6NF0VJ3FRO9vJv387KksBlYt70bh4I/AVZDozvrvsupPi2wodm/a5x1exWd37cRCU5gmJ
	i6B6qZOXgZFR7uhprULTz78RI822eRLL+wfMsrjkj54Oguk7mGPs/LV/hgaoAUH6Ox8k8op/XiHY3
	+VQb0tClUXDSrUNZKdFtjg16tNAwieaxVJi/Q+cGLAfROWcJDjpxan7Oi9DZEcuujwt0WkmaG8Iot
	0Ewi5zSV6Zn8BEFX23Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI6of-00000002qlK-2CSI;
	Fri, 14 Jun 2024 13:18:05 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI6ob-00000002qkM-1nCr
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 13:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718371082; x=1749907082;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=B/szTGuEIXbe/8epPrqiJ3Kbj5OfTgwv1AwgTjgi5WY=;
  b=KIbnr90pXHH3k63WmBjPLa6N0+MSU+GtFkpqHeHX4TrO0lISO6188GH3
   3MCVfrVqG6fM4acwFiTKKsfJw5Q1y7PWRXt3b2MGpAhZ1hbvuMhIPLw21
   pHVKGJeH+Osby2C+YaRzuNTVNEnh8nmtEXZiOYWM9R2GdY8BiX038KkTR
   wMs/ecJ3vqjqEFYjW0k079LQNX7Lk2cZ3B+1XyKKSRawEV0f5fZB47E2S
   vxAYDYg2UeN8mqNKYuWqWeH8GW9wfOmQjoQ9J5vf6mbonlzYhBirSel8v
   /2vhzrSeh+PvooBiNQodGB9pBIH+yenwG+gNeiyEDawUA+pde6sbM4jrl
   g==;
X-CSE-ConnectionGUID: bT5nHFmFTxm0tviSeTKRkw==
X-CSE-MsgGUID: vOToDUKjQrmU+7f17UNaSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15089935"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15089935"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:18:01 -0700
X-CSE-ConnectionGUID: 2MiM/vp9TiOzq8Zrdxi7qQ==
X-CSE-MsgGUID: R1elhJSqTf6qenCl6V9I7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="44911915"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.222])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:17:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 14 Jun 2024 16:17:53 +0300 (EEST)
To: daire.mcnamara@microchip.com
cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
    conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com, 
    robh@kernel.org, bhelgaas@google.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 1/3] PCI: microchip: Fix outbound address translation
 tables
In-Reply-To: <20240612112213.2734748-2-daire.mcnamara@microchip.com>
Message-ID: <77415307-f80c-a34b-b84f-a0febe6f2641@linux.intel.com>
References: <20240612112213.2734748-1-daire.mcnamara@microchip.com> <20240612112213.2734748-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_061801_533420_291F35A8 
X-CRM114-Status: GOOD (  21.45  )
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

On Wed, 12 Jun 2024, daire.mcnamara@microchip.com wrote:

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

Don't leave spaces between tag lines.

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

I don't see how this is related to what is described by the commit 
message.

If there's need for this change it should be justified properly and 
it looks to me that resource_size_t would be more appropriate here given 
the callers use resource_size() to determine this parameter?

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

Given your commit message, it would be more obvious to the code reader if 
the literal is replaced with something like RP_OUTBOUND_TRANS_TBL_MASK 
(that is GENMASK(31, 0)). Feel free to come up better name if I didn't 
understand all the details right based on your commit message.

-- 
 i.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
