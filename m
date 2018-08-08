From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 8 Aug 2018 00:43:12 -0700
Subject: [PATCH 1/2] pcie-microsemi: Add support for the Vera-board root
 complex
In-Reply-To: <CY4PR11MB1832A0C69637C6208A88C7B396270@CY4PR11MB1832.namprd11.prod.outlook.com>
References: <CY4PR11MB1832A0C69637C6208A88C7B396270@CY4PR11MB1832.namprd11.prod.outlook.com>
Message-ID: <20180808074312.GA3705@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Aug 07, 2018 at 05:16:23PM +0000, Daire.McNamara at microchip.com wrote:
> Hi all,
> 
> I wrote this code and think this patch was submitted under Wesley's name accidentally.? I'd like to take it over going forwards.? 

Great!  A few comments on the code below.  And as Palmer said this
should go to the linux-pci list as the main receipient.

> index 000000000000..50d5dba3695f
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-microsemi.c
> @@ -0,0 +1,778 @@
> +/*
> + * PCIe host controller driver for Microsemi AXI PCIe Bridge
> + *
> + * Copyright (c) 2018 - Microsemi.
> + *
> + * Based on:
> + *? pcie-rcar.c
> + *? pcie-xilinx.c
> + *? pcie-altera.c
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.

Please add a SPDX tag as the first line of the file instead of the
license boilerplate, for this case that would be:

// SPDX-License-Identifier: GPL-2.0+

> +static inline bool microsemi_pcie_link_up(struct microsemi_pcie_port *port)
> +{
> +??????? void *base_addr;
> +
> +??????? if(port->bridge == 0)
> +??????????? base_addr = port->axi_base_addr + MICROSEMI_PCIE0_CTRL_ADDR;
> +??????? else
> +??????????? base_addr = port->axi_base_addr + MICROSEMI_PCIE1_CTRL_ADDR;
> +
> +??????? return (readl(base_addr + MICROSEMI_LTSSM_STATE)
> +??????????????? & MICROSEMI_LTSSM_L0_STATE) ? 1 : 0;
> +}

Some odd formatting here, please always use tabs for indentation
and align operators at the end of the previous line.

Also no need for the ? : operator, as conversion to bool do that
implicitly.

You can run the scripts/checkpatch.pl scripe over the patch to check
for most of these coding style nits, so I'll stop mentioning them again.

> +??????? int pos;
> +
> +??????? pos = find_first_zero_bit(msi_irq_in_use, MICROSEMI_NUM_MSI_IRQS);
> +??????? if (pos < MICROSEMI_NUM_MSI_IRQS)
> +?????????????? ?set_bit(pos, msi_irq_in_use);
> +??????? else
> +??????????????? return -ENOSPC;
> +
> +??????? return pos;

This could be simplified to:

	pos = find_first_zero_bit(msi_irq_in_use, MICROSEMI_NUM_MSI_IRQS);
	if (pos >= MICROSEMI_NUM_MSI_IRQS)
		return -ENOSPC;
	set_bit(pos, msi_irq_in_use);
	return pos;

> +static irqreturn_t microsemi_pcie_intr_handler(int irq, void *data)
> +{
> +??????? struct microsemi_pcie_port *port = (struct microsemi_pcie_port *) data;

No need for explicit casts to or from void pointers.

> +??????? if(port->bridge == 0) {
> +??????????????? bridge_base_addr =? port->axi_base_addr + MICROSEMI_PCIE0_BRIDGE_ADDR;
> +??????? } else {
> +??????????????? bridge_base_addr =? port->axi_base_addr + MICROSEMI_PCIE1_BRIDGE_ADDR;
> +??????? }

There are quite a few places that calculate addresses based on bridge 0
vs 1, I wonder if it might be worth to factor those into helpers?

> +??????? //writel(upper_32_bits(regs.start),
> +??????? //??? bridge_base_addr + MICROSEMI_ATR0_AXI4_SLV0_SRC_ADDR);

For a driver submission please remove dead commented out code.
