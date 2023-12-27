Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E17C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM0dFm0XKAVyDEbcPBptWzNdzixrdLlFkPHc/h9meSU=; b=rk4KxcZN8GS2Zg
	Tk0qpX8Y+xsrK8S5guBDht3ggrKFNBtK+9VIFAjRfb9JzxrayWMY/gkMVDph5FQEgh6LNqXVoffrf
	hNl0EmHmVEjbebos+q6XmPVQRnyC3cZDHgidmBJEz0BKneZSI/LzDnOCHQHXZx5NzRuFp5osRdEWu
	Qqqd0WFS6fVvjWk1/iIH1W9M1DvD57ojibgYz/pPydsYHTuxp9U/2WlqYCOxW20MJIfTCILRfLGj7
	ZFkecPTUw7W2X247OJIC1f1rH/sgl+WKWzpyikMDaH7oYar77HnGDQC+qU32YDHNkImIWc/lojrUR
	Lg/nLT4GeQo+iBvUU6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWAQ-00EzAD-1g;
	Wed, 27 Dec 2023 15:49:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWAN-00Ez9P-1a
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 15:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9AEF5CE1296;
	Wed, 27 Dec 2023 15:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98F6C433C7;
	Wed, 27 Dec 2023 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703692191;
	bh=Zua2vzIUrgjZ1GUGu3AvKQH8bB9ctvVTMaz/oag9MJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNGyTSkprmDcLEhXrNOFJ/gGHCmfRrMt6tU84NNltzBBngYFTZA4lHgy+7pWMLKny
	 wZPxg+ZRvRywxctoDfJYs2nM1GqbqsFy+8c6S/h/sM8LfJH4ruZRrang5kCAfOVW0x
	 KQC6L4TsubSbFf++gLZmGxkjLN6FjJyftKmqfysDMsv1A96B32rmfSAhJJvzD6r4nH
	 d+uj+XsY1TBKeum+9UNHQP6htZafTTGgUji3t/6jkf9o9zWI+b4nYkIBeaFnNXOiXl
	 zZAOck0mwBir+dP6L2SVP5WBQx35zcXiefgBprRu97A7ppPrs0O8gmK0NAOd9dVJoi
	 4quEdObtHDexA==
Date: Wed, 27 Dec 2023 16:49:43 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v13 09/21] PCI: microchip: Move setup functions to
 pcie-plda-host.c
Message-ID: <ZYxHl+R40b7t4Xn2@lpieralisi>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <20231214072839.2367-10-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214072839.2367-10-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_074955_883719_907BA570 
X-CRM114-Status: GOOD (  24.92  )
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

On Thu, Dec 14, 2023 at 03:28:27PM +0800, Minda Chen wrote:
> Move setup functions to common pcie-plda-host.c. So these two functions
> can be re-used.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/plda/Kconfig           |  4 +
>  drivers/pci/controller/plda/Makefile          |  1 +
>  .../pci/controller/plda/pcie-microchip-host.c | 59 --------------
>  drivers/pci/controller/plda/pcie-plda-host.c  | 80 +++++++++++++++++++
>  drivers/pci/controller/plda/pcie-plda.h       |  5 ++
>  5 files changed, 90 insertions(+), 59 deletions(-)
>  create mode 100644 drivers/pci/controller/plda/pcie-plda-host.c
> 
> diff --git a/drivers/pci/controller/plda/Kconfig b/drivers/pci/controller/plda/Kconfig
> index 5cb3be4fc98c..e54a82ee94f5 100644
> --- a/drivers/pci/controller/plda/Kconfig
> +++ b/drivers/pci/controller/plda/Kconfig
> @@ -3,10 +3,14 @@
>  menu "PLDA-based PCIe controllers"
>  	depends on PCI
>  
> +config PCIE_PLDA_HOST
> +	bool
> +
>  config PCIE_MICROCHIP_HOST
>  	tristate "Microchip AXI PCIe controller"
>  	depends on PCI_MSI && OF
>  	select PCI_HOST_COMMON
> +	select PCIE_PLDA_HOST
>  	help
>  	  Say Y here if you want kernel to support the Microchip AXI PCIe
>  	  Host Bridge driver.
> diff --git a/drivers/pci/controller/plda/Makefile b/drivers/pci/controller/plda/Makefile
> index e1a265cbf91c..4340ab007f44 100644
> --- a/drivers/pci/controller/plda/Makefile
> +++ b/drivers/pci/controller/plda/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PCIE_PLDA_HOST) += pcie-plda-host.o
>  obj-$(CONFIG_PCIE_MICROCHIP_HOST) += pcie-microchip-host.o
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> index 31ca8d44ee2a..2e79bcc7c0a5 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -838,65 +838,6 @@ static int mc_pcie_init_irq_domains(struct plda_pcie_rp *port)
>  	return mc_allocate_msi_domains(port);
>  }
>  
> -static void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
> -				   phys_addr_t axi_addr, phys_addr_t pci_addr,
> -				   size_t size)
> -{
> -	u32 atr_sz = ilog2(size) - 1;
> -	u32 val;
> -
> -	if (index == 0)
> -		val = PCIE_CONFIG_INTERFACE;
> -	else
> -		val = PCIE_TX_RX_INTERFACE;
> -
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_TRSL_PARAM);
> -
> -	val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
> -			    ATR_IMPL_ENABLE;
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_SRCADDR_PARAM);
> -
> -	val = upper_32_bits(axi_addr);
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_SRC_ADDR);
> -
> -	val = lower_32_bits(pci_addr);
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_TRSL_ADDR_LSB);
> -
> -	val = upper_32_bits(pci_addr);
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
> -
> -	val = readl(bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> -	val |= (ATR0_PCIE_ATR_SIZE << ATR0_PCIE_ATR_SIZE_SHIFT);
> -	writel(val, bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> -	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
> -}
> -
> -static int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> -				  struct plda_pcie_rp *port)
> -{
> -	void __iomem *bridge_base_addr = port->bridge_addr;
> -	struct resource_entry *entry;
> -	u64 pci_addr;
> -	u32 index = 1;
> -
> -	resource_list_for_each_entry(entry, &bridge->windows) {
> -		if (resource_type(entry->res) == IORESOURCE_MEM) {
> -			pci_addr = entry->res->start - entry->offset;
> -			plda_pcie_setup_window(bridge_base_addr, index,
> -					       entry->res->start, pci_addr,
> -					       resource_size(entry->res));
> -			index++;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static inline void mc_clear_secs(struct mc_pcie *port)
>  {
>  	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
> diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
> new file mode 100644
> index 000000000000..19131181897f
> --- /dev/null
> +++ b/drivers/pci/controller/plda/pcie-plda-host.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PLDA PCIe XpressRich host controller driver
> + *
> + * Copyright (C) 2023 Microchip Co. Ltd
> + *
> + * Author: Daire McNamara <daire.mcnamara@microchip.com>
> + */
> +
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/msi.h>
> +#include <linux/of_address.h>
> +#include <linux/of_pci.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci-ecam.h>
> +#include <linux/platform_device.h>

Do you really require these headers ? Not in this patch,
in later patches and that's why every header should be
added when it is really needed.

Lorenzo

> +
> +#include "pcie-plda.h"
> +
> +void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
> +			    phys_addr_t axi_addr, phys_addr_t pci_addr,
> +			    size_t size)
> +{
> +	u32 atr_sz = ilog2(size) - 1;
> +	u32 val;
> +
> +	if (index == 0)
> +		val = PCIE_CONFIG_INTERFACE;
> +	else
> +		val = PCIE_TX_RX_INTERFACE;
> +
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_TRSL_PARAM);
> +
> +	val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
> +			    ATR_IMPL_ENABLE;
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_SRCADDR_PARAM);
> +
> +	val = upper_32_bits(axi_addr);
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_SRC_ADDR);
> +
> +	val = lower_32_bits(pci_addr);
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_TRSL_ADDR_LSB);
> +
> +	val = upper_32_bits(pci_addr);
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
> +
> +	val = readl(bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> +	val |= (ATR0_PCIE_ATR_SIZE << ATR0_PCIE_ATR_SIZE_SHIFT);
> +	writel(val, bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> +	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
> +}
> +EXPORT_SYMBOL_GPL(plda_pcie_setup_window);
> +
> +int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
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
> +					       entry->res->start, pci_addr,
> +					       resource_size(entry->res));
> +			index++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(plda_pcie_setup_iomems);
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
> index 363fcbbaf6ec..3deefd35fa5a 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -120,4 +120,9 @@ struct plda_pcie_rp {
>  	void __iomem *bridge_addr;
>  };
>  
> +void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
> +			    phys_addr_t axi_addr, phys_addr_t pci_addr,
> +			    size_t size);
> +int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> +			   struct plda_pcie_rp *port);
>  #endif
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
