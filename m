Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8653C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XgoyQeUYp7VmXcQglZKUTwnKdZfCUblbssKnBQNSXI=; b=ANBb9zJYM6BH+h
	qaH0fIemQVlpWb0fQQJqDolqPGf9WqHFkkh3QNesY8nCj8GVI3OA9YHspZu4bShXaneSjRkhutZAY
	G2Gt+sMwNuklAUboPw49yap3hzKurCgx14kV077gyDrcnhkIhu2qGce1bWxrTO8C3Z2dIyDGToRIg
	hSVB2RHsh+zHd8ZtTu9MM5GMb8k0jXRYumy1bs3OQVShWoOrybOkK/vRVf1p8JUvMWm+tRFdDaRLj
	sJblJ2zfqyP8aArGmmjG1pAqWlAdzbqvXbEPK2H5i3LSOTjFcxuuvBhSOftlvAwyjm1ZBZaYAEN47
	wTNaLlhXL6dXaMq+T+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI70A-00000002sKO-10NE;
	Fri, 14 Jun 2024 13:29:58 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI707-00000002sJ0-1lZP
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 13:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718371795; x=1749907795;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hGhr++85Xsy7/ZFbcrK1+gqoOuZlCN2+fgWiO0Iosh8=;
  b=htBw4w1mBK7jiolZIN4Z+JW0b0ayAAhAuJrHn5bpodTvFUYDHCS0DSZV
   fFpNK3t9Tlvfa6IVlkCpuGSMDAvyTs90MDAWrS01NXME34hAys9LCABi7
   79OrOYCjyp1GXVsCe2O/UTGCW5YHOulAb9h7AzH3BeIDFke2xvYJ3vf8U
   4dAOCPxSQnfWt1uQC1To6j3NTp2dtA5k5wvx8POuJEJ9syaMF7djrYiAt
   vIlLisb1OKSnK42CMbmUJTMuFURheqBsB2WVfuc/Sg2x9KSPSf4v2Ej+D
   F0CcGe058ewyP3sf1BZEdKwanxbbz0x1TFGw/r5jYjsq1T/cxXPJJ3pZm
   Q==;
X-CSE-ConnectionGUID: q2I0YJ8pTYOUlZrwONiWtA==
X-CSE-MsgGUID: 4KdWWGnzTRKNJ6aS+GWnwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26652309"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="26652309"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:29:54 -0700
X-CSE-ConnectionGUID: PzWo28ocTBKdpxoIE33tFg==
X-CSE-MsgGUID: TR0IYX1bR3Sorg5VEF4dOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="71689948"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:29:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 14 Jun 2024 16:29:47 +0300 (EEST)
To: daire.mcnamara@microchip.com
cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
    conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com, 
    robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 2/3] PCI: microchip: Fix inbound address translation
 tables
In-Reply-To: <20240612112213.2734748-3-daire.mcnamara@microchip.com>
Message-ID: <7ba2a37a-6012-a0a1-a74f-e9fc83598453@linux.intel.com>
References: <20240612112213.2734748-1-daire.mcnamara@microchip.com> <20240612112213.2734748-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_062955_506290_5AC17F5C 
X-CRM114-Status: GOOD (  33.62  )
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
> On Microchip PolarFire SoC the PCIe Root Port can be behind one of three
> general purpose Fabric Interface Controller (FIC) buses that encapsulates
> an AXI-S bus. Depending on which FIC(s) the Root Port is connected
> through to CPU space, and what address translation is done by that FIC,
> the Root Port driver's inbound address translation may vary.
> 
> For all current supported designs and all future expected designs,
> inbound address translation done by a FIC on PolarFire SoC varies
> depending on whether PolarFire SoC in operating in dma-coherent mode or
> dma-noncoherent mode.
> 
> The setup of the outbound address translation tables in the root port
> driver only needs to handle these two cases.
> 
> Setup the inbound address translation tables to one of two address
> translations, depending on whether the rootport is marked as dma-coherent or
> dma-noncoherent.
> 
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 97 +++++++++++++++++++-
>  1 file changed, 92 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 853adce24492..d5021333e2aa 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -30,6 +30,9 @@
>  #define MC_PCIE_BRIDGE_ADDR			(MC_PCIE1_BRIDGE_ADDR)
>  #define MC_PCIE_CTRL_ADDR			(MC_PCIE1_CTRL_ADDR)
>  
> +#define MC_MAX_NUM_INBOUND_WINDOWS		8
> +#define MPFS_NC_BOUNCE_ADDR			0x80000000
> +
>  /* PCIe Bridge Phy Regs */
>  #define PCIE_PCI_IRQ_DW0			0xa8
>  #define  MSIX_CAP_MASK				BIT(31)
> @@ -105,6 +108,7 @@
>  #define ATR0_AXI4_SLV0_TRSL_PARAM		0x810u
>  #define  PCIE_TX_RX_INTERFACE			0x00000000u
>  #define  PCIE_CONFIG_INTERFACE			0x00000001u
> +#define  TRSL_ID_AXI4_MASTER_0			0x00000004u
>  
>  #define ATR_ENTRY_SIZE				32
>  
> @@ -931,6 +935,89 @@ static int mc_pcie_init_irq_domains(struct mc_pcie *port)
>  	return mc_allocate_msi_domains(port);
>  }
>  
> +static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr, u64 pcie_addr, size_t size)
> +{
> +	void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	u32 table_offset = window_index * ATR_ENTRY_SIZE;
> +	u32 atr_sz;
> +	u32 val;
> +
> +	atr_sz = ilog2(size) - 1;
> +	atr_sz &= GENMASK(5, 0);
> +	val = lower_32_bits(pcie_addr) & GENMASK(31, 12);

ALIGN_DOWN(, SZ_xx) ?

> +	val |= (atr_sz << ATR_SIZE_SHIFT);

This looks like a named define + FIELD_PREP() would be more appropriate 
here.

> +	val |= ATR_IMPL_ENABLE;
> +	writel(val, bridge_base_addr + table_offset + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> +
> +	writel(upper_32_bits(pcie_addr), bridge_base_addr + table_offset +
> +	       ATR0_PCIE_WIN0_SRC_ADDR);
> +
> +	writel(lower_32_bits(axi_addr), bridge_base_addr + table_offset +
> +	       ATR0_PCIE_WIN0_TRSL_ADDR_LSB);
> +	writel(upper_32_bits(axi_addr), bridge_base_addr + table_offset +
> +	       ATR0_PCIE_WIN0_TRSL_ADDR_UDW);
> +
> +	writel(TRSL_ID_AXI4_MASTER_0, bridge_base_addr + table_offset +
> +	       ATR0_PCIE_WIN0_TRSL_PARAM);

Having a table_addr local variable instead would make these much less 
repetitive and shorter.

> +}
> +
> +static int mc_pcie_setup_inbound_ranges(struct platform_device *pdev, struct mc_pcie *port)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *dn = dev->of_node;
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	int atr_index = 0;
> +
> +	/*
> +	 * MPFS PCIe root port is 32-bit only, behind a Fabric Interface
> +	 * Controller FPGA logic block which contains the AXI-S interface.
> +	 *
> +	 * From the point of view of the PCIe root port, There are only
> +	 * two supported Root Port configurations
> +	 *
> +	 * Configuration 1: for use with fully coherent designs; supports a
> +	 * window from 0x0 (CPU space) to specified PCIe space.
> +	 *
> +	 * Configuration 2: for use with non-coherent designs; supports two
> +	 * 1 Gb wide windows to CPU space; one mapping cpu space 0 to pcie
> +	 * space 0x80000000 and mapping cpu space 0x40000000 to pcie
> +	 * space 0xc0000000. This cfg needs two windows because of how
> +	 * the MSI space is allocated in the AXI-S range on MPFS.
> +	 *
> +	 * The FIC interface outside the PCIe block *must* complete the inbound
> +	 * address translation as per MCHP MPFS FPGA design guidelines.
> +	 */
> +	if (device_property_read_bool(dev, "dma-noncoherent")) {
> +		/*
> +		 * Always need same two tables in this case.  Need two tables
> +		 * due to hardware interactions between address and size.
> +		 */
> +		mc_pcie_setup_inbound_atr(0, 0, MPFS_NC_BOUNCE_ADDR, SZ_1G);
> +		mc_pcie_setup_inbound_atr(1, SZ_1G, MPFS_NC_BOUNCE_ADDR + SZ_1G, SZ_1G);
> +	} else {
> +		/* Find any dma-ranges */
> +		if (of_pci_dma_range_parser_init(&parser, dn)) {
> +			/* No dma-range property - setup default */
> +			mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
> +			return 0;
> +		}
> +
> +		for_each_of_range(&parser, &range) {
> +			if (atr_index >= MC_MAX_NUM_INBOUND_WINDOWS) {
> +				dev_err(dev, "too many inbound ranges; %d available tables\n",
> +					MC_MAX_NUM_INBOUND_WINDOWS);
> +				return -EINVAL;

You don't need to rollback anything when this error is encountered?

> +			}
> +			mc_pcie_setup_inbound_atr(atr_index, 0, range.pci_addr, range.size);
> +			atr_index++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  				 phys_addr_t axi_addr, phys_addr_t pci_addr,
>  				 u64 size)
> @@ -962,11 +1049,6 @@ static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  	val = upper_32_bits(pci_addr);
>  	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
>  	       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
> -
> -	val = readl(bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> -	val |= (ATR0_PCIE_ATR_SIZE << ATR0_PCIE_ATR_SIZE_SHIFT);
> -	writel(val, bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> -	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
>  }
>  
>  static int mc_pcie_setup_windows(struct platform_device *pdev,
> @@ -1129,6 +1211,11 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	if (ret)
>  		return ret;
>  
> +	/* Configure inbound translation tables */

IMO, this comment adds 0 value over what the code tells all by itself so 
it would be best to drop it.

> +	ret = mc_pcie_setup_inbound_ranges(pdev, port);
> +	if (ret)
> +		return ret;
> +
>  	/* Address translation is up; safe to enable interrupts */
>  	ret = mc_init_interrupts(pdev, port);
>  	if (ret)
> 

-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
