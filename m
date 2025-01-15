Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABE9E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 00:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=U2TeOzfEaegBvR1o2qqiT3/uUsa7H+wxvn0BSC/alDQ=; b=upRa6WnA6SPDKP
	pkQNYjJC16pchHWbil0q9rxgJYuosljJZRC34CnOlnEKCN+BDtPZCirpRdre8tIfo35RKC/WjgoIN
	EBYgqI81J59lrshP1y852j6oVZBRfZxQYRW1puIzvr8QC6piDl1dc5PZa1d90vPKRDKtZqjfHMUBE
	N07Yxj6RGXNZKXPjS2c6a9QquWjoV8SKGjp64FfhPv96TtmwAeeM5xJccH4kqYwWq1EOXBgcGrNgo
	cWFQT+y9FaEgUiCHMcdGRJ7H75vqr5rNeNCWIKILW1DTtclcVqo2P4xrcoFJCnPh9IZdRm3qWdO9u
	zM8V19n6F3qUHlerTCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXr22-0000000AB84-3OA2;
	Wed, 15 Jan 2025 00:13:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXr1z-0000000AB7f-44XG
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 00:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC48CA41E78;
	Wed, 15 Jan 2025 00:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB06C4CEDD;
	Wed, 15 Jan 2025 00:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736899990;
	bh=QCdx+7T6KB4BIkX67bM4rEWTwO+57c4nzW6/2P/N9iI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ijJ0wii/pQrY1T35xNhRorMcOPQM+Mr0TZNZoCO4Tb8WKxiheHAY3fTnW5O9NRkWE
	 QSoOEsFZfWh0cgUcP7i2IGvOzKQXt6b9gCQdbhGnsEEg/igjbY9dSCPh9eHXlJ+mQL
	 P+iaMNzmSXG70Lsh9BDhQe4zj0KZLNTVEC7WLxOBqvF1A/x9l0j/G9J64RkvHfvFYR
	 UBXkU7uMSM/IXGnB2YAqvUco1FydsKp5isMa4m6RVHXXuSYx7Ubw8Xycz3LZu4/YdX
	 s6bJc6sOFxSPTjbYsI9HD15Z5k8rw+Exa+hHMwjTYhquwh7gISQcUP8r/J2QS3SLxU
	 WhC+Hcdd1elpg==
Date: Tue, 14 Jan 2025 18:13:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	kevin.xie@starfivetech.com
Subject: Re: [PATCH v10 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <20250115001309.GA508227@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241011140043.1250030-2-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_161312_155494_7504ECE1 
X-CRM114-Status: GOOD (  26.76  )
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

On Fri, Oct 11, 2024 at 03:00:41PM +0100, daire.mcnamara@microchip.com wrote:
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

I don't quite understand what this is saying.  It seems like the code
keeps only the low 32 bits of a PCI address and throws away any
address bits above the low 32.

If that's what the FIC does, I wouldn't describe the FIC as
"translating the upper 32 bits" since it sounds like the translation
is just truncation.

I guess it must be more complicated than that?  I assume you can still
reach BARs that have PCI addresses above 4GB using CPU loads/stores?

The apertures through the host bridge for MMIO access are described by
DT ranges properties, so this must be something that can't be
described that way?

> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> index 48f60a04b740..fa4c85be21f0 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -21,6 +21,8 @@
>  #include "../../pci.h"
>  #include "pcie-plda.h"
>  
> +#define MC_OUTBOUND_TRANS_TBL_MASK		GENMASK(31, 0)
> +
>  /* PCIe Bridge Phy and Controller Phy offsets */
>  #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
>  #define MC_PCIE1_CTRL_ADDR			0x0000a000u
> @@ -612,6 +614,27 @@ static void mc_disable_interrupts(struct mc_pcie *port)
>  	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
>  }
>  
> +static int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
> +			   struct plda_pcie_rp *port)
> +{
> +	void __iomem *bridge_base_addr = port->bridge_addr;
> +	struct resource_entry *entry;
> +	u64 pci_addr;
> +	u32 index = 1;
> +
> +	resource_list_for_each_entry(entry, &bridge->windows) {
> +		if (resource_type(entry->res) == IORESOURCE_MEM) {
> +			pci_addr = entry->res->start - entry->offset;
> +			plda_pcie_setup_window(bridge_base_addr, index,
> +					       entry->res->start & MC_OUTBOUND_TRANS_TBL_MASK,
> +					       pci_addr, resource_size(entry->res));
> +			index++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int mc_platform_init(struct pci_config_window *cfg)
>  {
>  	struct device *dev = cfg->parent;
> @@ -622,15 +645,14 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	int ret;
>  
>  	/* Configure address translation table 0 for PCIe config space */
> -	plda_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
> -			       cfg->res.start,
> -			       resource_size(&cfg->res));
> +	plda_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & MC_OUTBOUND_TRANS_TBL_MASK,
> +			       0, resource_size(&cfg->res));
>  
>  	/* Need some fixups in config space */
>  	mc_pcie_enable_msi(port, cfg->win);
>  
>  	/* Configure non-config space outbound ranges */
> -	ret = plda_pcie_setup_iomems(bridge, &port->plda);
> +	ret = mc_pcie_setup_iomems(bridge, &port->plda);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
