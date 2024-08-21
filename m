Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E09C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2mQLPcwDjpNaX0cpjziBXOO7PQcsESVXgxaZrvx352A=; b=XNSZLBT8ntUMNb
	Zl5DweluUc+PAvTZGiPgm8ORxW65aXtUHhpFg8ojOnwe9/Z9KUA9kdC2nybBBrC3COSiAvxICxImm
	Y4buBmoxHmL1G+jr78/BkaE6lqbJkiEE3rjCh5E4wF4+KRgO/i1jk4MqAkoRLKv9mK1LcqA6tgCsh
	uXlCwaxfektAkEmeaxqA8c4OfEJgPJbnRFf2g7YWg/KtUhuTWcq4tlos+NjTrdNQIYk9S5n9egmfo
	jUogvbXj9HSqHD8zmtE9SbvlMTqyId9w4ZA47Uaw7dwk/vHH1U6I79E8u0TT45gb3DHC0SKrm6t2r
	fyhDBxW45NCywosL1AKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgokC-00000009rKu-3zrv;
	Wed, 21 Aug 2024 17:03:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgokA-00000009rJy-03RN
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 17:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00C8561062;
	Wed, 21 Aug 2024 17:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557C0C32781;
	Wed, 21 Aug 2024 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724259812;
	bh=BvNszQGq5G9jdxQKhTqBAUqUetCwogf6wGt+WiFSgUA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PS3RBA2eI/GwPkD3GbZL6gNIXuoNovk+sCjNbEtbVy5jmg8PQ7oWwLJ5BR2XKsk1C
	 5ofhwvg6TlEfASU7ASnJ4H8t8i/JtYA+WUAuv6OctQY9J9nOxQR1z1/BWl1FiPoPvs
	 aEZKw8XwIC6UefAlkAWUFn3m+IG5pOtvGjiSi7KVDJlyv57XYYFjqVSAm/pA3zEuEa
	 /i3B2IQFGR/BahB+imHfnow+CFVC8+AqdO5eelkgfE+WU2Lzun9vBNTB7+7qq/xvfa
	 o+d6RiwbfBrTlnjSraiAU9gStXI2ZbaHNvwED8UYr4MgA9egG2xjw2fN4CMokxuKT/
	 SzW6jhxYfhyDQ==
Date: Wed, 21 Aug 2024 12:03:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v8 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <20240821170330.GA256147@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821130217.957424-2-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_100334_247337_5D7CCEBB 
X-CRM114-Status: GOOD (  25.60  )
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

On Wed, Aug 21, 2024 at 02:02:15PM +0100, daire.mcnamara@microchip.com wrote:
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
> This necessitates changing a size_t in mc_pcie_setup_window
> to a u64 to avoid a compile error on 32-bit platforms.

I don't see this size_t change in this patch.  Add "()" after function
name if there's a relevant function here.

> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> index 48f60a04b740..da766de347bd 100644
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
> +int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
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
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
