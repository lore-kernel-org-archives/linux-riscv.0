Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33411C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOI4UmMPa3Xwc0r2v5nOZPoowcWGr63HOdGSE5UqYew=; b=ZNAiJCc9Di8UBM
	mLkHsfC2nRVlbNLxDV9ks1TNZ+/U2bWt2Nw0CkLVaOK2MsbTHVobPabzoXAv0ZKF+KTAaKwG7HnYx
	6Gpv6RbURqJzTMydR3hOp+f2Q2dsAHhyRUg+/6CWM/VBIRGe57x8dgWyDzItefkiIhp2e4+B6p5QK
	i7UWCBo0u7EtIlCOxvzZvinkP9N9fu1HBeWDsiq0OZQv2YvUQH5TFDuXozUHkvQ3Ij0sMF4LNYcy4
	GfqSdafXUHJ94FL3dAoFWI3VQP/hobnwSwD1ld+3v+NjKDUC8uLLqXfsr3JSCpAxUozJy/An66ISh
	45nM8ZDGIPu0AHYR/3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkQd-00000003EhN-1RDf;
	Mon, 08 Jul 2024 09:12:59 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkQa-00000003Eh0-2YFi
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 09:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720429977; x=1751965977;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CAaJk++tecrLaptH+16hNaBiNTEIQYH3fzlW19fwgC8=;
  b=HhhjHDwhanIM/ZBn5ioqv2C28DFo+wddg4yG1JRLUmvBUVuhxyWO+Gbx
   bO8RN/poSBl7rBMwTVUooYN2Xg9XBxuU3oZiuDt8k+22mn+qpH1N2Uo3a
   cOxELzChgI3/4YtKiaM5TgZaNs2j9VErEVoayNg0/BbZy4QeCWTvVJGzL
   LvWc8xAQ1THl7M34xHXdmWlvv8PM76sxYnMGSx2k3LPI7ilRqJD6wIw0Z
   UlHqaWZc1MbgYk6EbkkT0AQhW0fb9N4PNAqms+wGSF+KPk3S25ah/HU+W
   9qQ5vvGUZECv9R3x1SdjFlAyk1kOaWpOp9iLr67tIRtae7bk9kvqDblVw
   g==;
X-CSE-ConnectionGUID: nh+YalO8RqaRALnP9MjL+A==
X-CSE-MsgGUID: gT3Rv00mQuy+pc14567J/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17436553"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17436553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 02:12:56 -0700
X-CSE-ConnectionGUID: Bri5CEPIQAqx34xgx/2URQ==
X-CSE-MsgGUID: WSwuHQr9TZyy0hw2Fm3MbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47509006"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.115])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 02:12:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jul 2024 12:12:46 +0300 (EEST)
To: daire.mcnamara@microchip.com
cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
    conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com, 
    robh@kernel.org, bhelgaas@google.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v6 2/3] PCI: microchip: Fix inbound address translation
 tables
In-Reply-To: <20240628115923.4133286-3-daire.mcnamara@microchip.com>
Message-ID: <addb88b3-1318-d337-052e-088c832bc088@linux.intel.com>
References: <20240628115923.4133286-1-daire.mcnamara@microchip.com> <20240628115923.4133286-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_021256_719198_523D7D6D 
X-CRM114-Status: GOOD (  31.53  )
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

On Fri, 28 Jun 2024, daire.mcnamara@microchip.com wrote:

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

Please improve the use of capital letters in general.

DMA x2

> 
> The setup of the outbound address translation tables in the root port

Root Port

> driver only needs to handle these two cases.
> 
> Setup the inbound address translation tables to one of two address
> translations, depending on whether the rootport is marked as dma-coherent or
> dma-noncoherent.

DMA x2

> 
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 106 +++++++++++++++++--
>  1 file changed, 97 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 47c397ae515a..27bfa3b7a187 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -7,16 +7,20 @@
>   * Author: Daire McNamara <daire.mcnamara@microchip.com>
>   */
>  
> +#include <linux/align.h>
>  #include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <linux/pci-ecam.h>
>  #include <linux/platform_device.h>
> +#include <linux/wordpart.h>
>  
>  #include "../pci.h"
>  
> @@ -32,6 +36,9 @@
>  #define MC_PCIE_BRIDGE_ADDR			(MC_PCIE1_BRIDGE_ADDR)
>  #define MC_PCIE_CTRL_ADDR			(MC_PCIE1_CTRL_ADDR)
>  
> +#define MC_MAX_NUM_INBOUND_WINDOWS		8
> +#define MPFS_NC_BOUNCE_ADDR			0x80000000
> +
>  /* PCIe Bridge Phy Regs */
>  #define PCIE_PCI_IRQ_DW0			0xa8
>  #define  MSIX_CAP_MASK				BIT(31)
> @@ -99,14 +106,15 @@
>  
>  /* PCIe AXI slave table init defines */
>  #define ATR0_AXI4_SLV0_SRCADDR_PARAM		0x800u
> -#define  ATR_SIZE_SHIFT				1
> -#define  ATR_IMPL_ENABLE			1
> +#define  ATR_SIZE_MASK				GENMASK(6, 1)
> +#define  ATR_IMPL_ENABLE			BIT(0)
>  #define ATR0_AXI4_SLV0_SRC_ADDR			0x804u
>  #define ATR0_AXI4_SLV0_TRSL_ADDR_LSB		0x808u
>  #define ATR0_AXI4_SLV0_TRSL_ADDR_UDW		0x80cu
>  #define ATR0_AXI4_SLV0_TRSL_PARAM		0x810u
>  #define  PCIE_TX_RX_INTERFACE			0x00000000u
>  #define  PCIE_CONFIG_INTERFACE			0x00000001u
> +#define  TRSL_ID_AXI4_MASTER_0			0x00000004u
>  
>  #define ATR_ENTRY_SIZE				32
>  
> @@ -933,6 +941,86 @@ static int mc_pcie_init_irq_domains(struct mc_pcie *port)
>  	return mc_allocate_msi_domains(port);
>  }
>  
> +static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr, u64 pcie_addr, u64 size)
> +{
> +	void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	u32 table_offset = window_index * ATR_ENTRY_SIZE;
> +	void __iomem *table_addr = bridge_base_addr + table_offset;
> +	u32 atr_sz;
> +	u32 val;
> +
> +	atr_sz = ilog2(size) - 1;
> +
> +	val = ALIGN_DOWN(lower_32_bits(pcie_addr), SZ_4K);
> +	val |= FIELD_PREP(ATR_SIZE_MASK, atr_sz);
> +	val |= ATR_IMPL_ENABLE;
> +
> +	writel(val, table_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> +
> +	writel(upper_32_bits(pcie_addr), table_addr + ATR0_PCIE_WIN0_SRC_ADDR);
> +
> +	writel(lower_32_bits(axi_addr), table_addr + ATR0_PCIE_WIN0_TRSL_ADDR_LSB);
> +	writel(upper_32_bits(axi_addr), table_addr + ATR0_PCIE_WIN0_TRSL_ADDR_UDW);
> +
> +	writel(TRSL_ID_AXI4_MASTER_0, table_addr + ATR0_PCIE_WIN0_TRSL_PARAM);
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

, There -> , there

Root Port

> +	 * two supported Root Port configurations

Terminate with either : or .

> +	 *
> +	 * Configuration 1: for use with fully coherent designs; supports a
> +	 * window from 0x0 (CPU space) to specified PCIe space.
> +	 *
> +	 * Configuration 2: for use with non-coherent designs; supports two
> +	 * 1 Gb wide windows to CPU space; one mapping cpu space 0 to pcie

Gb means gigabits?? GB is for gigabytes.

CPU
PCIe

> +	 * space 0x80000000 and mapping cpu space 0x40000000 to pcie

Ditto.

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

DMA

> +		if (of_pci_dma_range_parser_init(&parser, dn)) {
> +			/* No dma-range property - setup default */

DMA

> +			mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
> +			return 0;
> +		}
> +
> +		for_each_of_range(&parser, &range) {
> +			if (atr_index >= MC_MAX_NUM_INBOUND_WINDOWS) {
> +				dev_err(dev, "too many inbound ranges; %d available tables\n",
> +					MC_MAX_NUM_INBOUND_WINDOWS);
> +				return -EINVAL;
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
>  				 resource_size_t size)
> @@ -948,8 +1036,9 @@ static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
>  	       ATR0_AXI4_SLV0_TRSL_PARAM);
>  
> -	val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
> -			    ATR_IMPL_ENABLE;
> +	val = ALIGN_DOWN(lower_32_bits(axi_addr), SZ_4K);
> +	val |= FIELD_PREP(ATR_SIZE_MASK, atr_sz);
> +	val |= ATR_IMPL_ENABLE;
>  	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
>  	       ATR0_AXI4_SLV0_SRCADDR_PARAM);
>  
> @@ -964,11 +1053,6 @@ static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
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
> @@ -1131,6 +1215,10 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	if (ret)
>  		return ret;
>  
> +	ret = mc_pcie_setup_inbound_ranges(pdev, port);
> +	if (ret)
> +		return ret;
> +
>  	/* Address translation is up; safe to enable interrupts */
>  	ret = mc_init_interrupts(pdev, port);
>  	if (ret)
> 

The code change itself looks fine for the extent I understand it.

-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
