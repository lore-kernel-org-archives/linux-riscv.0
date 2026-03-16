Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897AEF53D9A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8HguwEKKfAxaqvHKi/yTZco0lmBuWuFUUc/HKAHbUZo=; b=f3YrkF5dqvuz0S
	XKUYG7vbBwqZLFD1T+Pf60TXXFdujK39/eEoBhFb4wgmAJUjHk1t0aF69BgRXObhJveEwaxqzU/5u
	eFmA0bIRuSf0gXbvd1O01ASLS2LPC+eKljZDHH3yIhKo1nO7O6G0vVCIbztIFZmzX1k5r3teT4LlI
	qx9ig29NCOGfWf8B3+VGIeW48aCy5Jc+CnV3mi/arJDjG08Wzr0OGLwa05rkvKTbkn6SxtE6Bh89c
	e9pGmfIxzek4gcJZ2glngEl9uzmzfrCyB/Vry+wJzh259FwWk/sNy7M1sz3R5laDcN45XEb+qaodl
	nuBYYNG1y7WarDha2TJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Et1-00000004qS2-1KKP;
	Mon, 16 Mar 2026 20:50:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Esy-00000004qRI-3mgR
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 20:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D27194195F;
	Mon, 16 Mar 2026 20:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853B1C19421;
	Mon, 16 Mar 2026 20:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773694199;
	bh=VyX54W89shXL5ZHcR5Ba0Rlr48RPKhTHtTOzkF6KJg4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WRrNeqSFkHSdFxlwfCoAWa1OzDA7OClDnXdqNJMyMuUcu8Eiau+kMwT7fyJgBnxQ/
	 vEVLsdL86XSK7gxWYKePK0F5F1lApQOexKFdrTA0fb8SDPFAolD8pE3OEpKQmbU7Hf
	 GkJk9UizipXVbZayxXDVeYWWuI7nW1yZQ/WNZQK8E3vh7JB1X409Rlix0SIh/zta29
	 rslZGMOaxwrvsE4KCwfE3L9RUK8aB+Np3aXtA5A6vYph8n88s+jXiQ8uctmnlZM6AM
	 Q6nSZ8p1d9q2EEAV4PTL0iDet1zqNMTcjfPKn4HOFEpLJhXBjYPTjzr11F++TVkU79
	 7rAP/lz0xr74w==
Date: Mon, 16 Mar 2026 15:49:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: wangjia@ultrarisc.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] PCI: dwc: Add UltraRISC DP1000 PCIe rc driver
Message-ID: <20260316204958.GA23965@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316-ultrarisc-pcie-v1-4-ef2946ede698@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135000_991882_A353FC8F 
X-CRM114-Status: GOOD (  36.18  )
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

In subject, s/dwc/ultrarisc/ or whatever tag we're going to use for
this driver, e.g.,

  PCI: ultrarisc: Add UltraRISC DP1000 PCIe Root Complex driver

On Mon, Mar 16, 2026 at 03:07:00PM +0800, Jia Wang via B4 Relay wrote:
> From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
> 
> Add DP1000 soc PCIe rc driver.

s/soc/SoC/
s/rc/RC/ or Root Complex (also in subject)

> Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  drivers/pci/controller/dwc/Kconfig           |  15 ++
>  drivers/pci/controller/dwc/Makefile          |   1 +
>  drivers/pci/controller/dwc/pcie-designware.h |  22 +++
>  drivers/pci/controller/dwc/pcie-ultrarisc.c  | 202 +++++++++++++++++++++++++++
>  4 files changed, 240 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index d0aa031397fa..0a33891bf7ef 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -548,4 +548,19 @@ config PCIE_VISCONTI_HOST
>  	  Say Y here if you want PCIe controller support on Toshiba Visconti SoC.
>  	  This driver supports TMPV7708 SoC.
>  
> +config PCIE_ULTRARISC
> +	bool "UltraRISC PCIe host controller"
> +	depends on ARCH_ULTRARISC || COMPILE_TEST
> +	select PCIE_DW_HOST
> +	select PCI_MSI
> +	default y if ARCH_ULTRARISC
> +	help
> +	  Enables support for the PCIe controller in the UltraRISC SoC.
> +	  This driver supports UR-DP1000 SoC. When selected, it automatically
> +	  enables both `PCIE_DW_HOST` and `PCI_MSI`, ensuring proper support
> +	  for MSI-based interrupt handling in the PCIe controller.

I don't think the PCIE_DW_HOST and PCI_MSI explanation is relevant for
Kconfig help.

> +	  By default, this symbol is enabled when `ARCH_ULTRARISC` is active,
> +	  requiring no further configuration on that platform.
> +
> +

Remove spurious blank line.

>  endmenu
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index 67ba59c02038..884c46b78e01 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
>  obj-$(CONFIG_PCIE_SPACEMIT_K1) += pcie-spacemit-k1.o
>  obj-$(CONFIG_PCIE_STM32_HOST) += pcie-stm32.o
>  obj-$(CONFIG_PCIE_STM32_EP) += pcie-stm32-ep.o
> +obj-$(CONFIG_PCIE_ULTRARISC) += pcie-ultrarisc.o
>  
>  # The following drivers are for devices that use the generic ACPI
>  # pci_root.c driver but don't support standard ECAM config access.
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index ae6389dd9caa..8f2ed86cb5c5 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -69,6 +69,8 @@
>  
>  /* Synopsys-specific PCIe configuration registers */
>  #define PCIE_PORT_FORCE			0x708
> +/* Bit[7:0] LINK_NUM: Link Number. Not used for endpoint */
> +#define PORT_LINK_NUM_MASK		GENMASK(7, 0)
>  #define PORT_FORCE_DO_DESKEW_FOR_SRIS	BIT(23)
>  
>  #define PCIE_PORT_AFR			0x70C
> @@ -96,6 +98,26 @@
>  #define PCIE_PORT_LANE_SKEW		0x714
>  #define PORT_LANE_SKEW_INSERT_MASK	GENMASK(23, 0)
>  
> +/*
> + * PCIE_TIMER_CTRL_MAX_FUNC_NUM: Timer Control and Max Function Number Register.
> + * This register holds the ack frequency, latency, replay, fast link scaling timers,
> + * and max function number values.

Wrap to fit in 80 columns like the rest of the file.

> + * Bit[30:29] FAST_LINK_SCALING_FACTOR: Fast Link Timer Scaling Factor.
> + *   0x0 (SF_1024):Scaling Factor is 1024 (1ms is 1us).
> + *     When the LTSSM is in Config or L12 Entry State, 1ms
> + *     timer is 2us, 2ms timer is 4us and 3ms timer is 6us.
> + *   0x1 (SF_256): Scaling Factor is 256 (1ms is 4us)
> + *   0x2 (SF_64): Scaling Factor is 64 (1ms is 16us)
> + *   0x3 (SF_16): Scaling Factor is 16 (1ms is 64us)
> + */
> +#define PCIE_TIMER_CTRL_MAX_FUNC_NUM    0x718
> +#define PORT_FLT_SF_MASK    GENMASK(30, 29)
> +#define PORT_FLT_SF(n)      FIELD_PREP(PORT_FLT_SF_MASK, n)
> +#define PORT_FLT_SF_1024    PORT_FLT_SF(0x0)
> +#define PORT_FLT_SF_256     PORT_FLT_SF(0x1)
> +#define PORT_FLT_SF_64      PORT_FLT_SF(0x2)
> +#define PORT_FLT_SF_16      PORT_FLT_SF(0x3)
> +
>  #define PCIE_PORT_DEBUG0		0x728
>  #define PORT_LOGIC_LTSSM_STATE_MASK	0x3f
>  #define PORT_LOGIC_LTSSM_STATE_L0	0x11
> diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
> new file mode 100644
> index 000000000000..64cbf16d3ff7
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DWC PCIe RC driver for UltraRISC DP1000 SoC
> + *
> + * Copyright (C) 2023 UltraRISC
> + *

Remove spurious blank line.  Maybe you want "(C) 2026"?

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/of_device.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/resource.h>
> +#include <linux/types.h>
> +#include <linux/regmap.h>

Order alphabetically.

> +#include "pcie-designware.h"
> +
> +#define PCIE_CUS_CORE          0x400000
> +
> +#define LTSSM_ENABLE           BIT(7)
> +#define FAST_LINK_MODE         BIT(12)
> +#define HOLD_PHY_RST           BIT(14)
> +#define L1SUB_DISABLE          BIT(15)
> +
> +struct ultrarisc_pcie {
> +	struct dw_pcie  *pci;

s/dw_pcie  /dw_pcie / (single space to match irq_mask below)

> +	u32 irq_mask[MAX_MSI_CTRLS];
> +};
> +
> +static const struct of_device_id ultrarisc_pcie_of_match[];

This declaration looks unnecessary.

> +static struct pci_ops ultrarisc_pci_ops = {
> +	.map_bus = dw_pcie_own_conf_map_bus,
> +	.read = pci_generic_config_read32,
> +	.write = pci_generic_config_write32,

I guess this hardware has the defect that it can only do 32-bit
writes?

> +};
> +
> +static int ultrarisc_pcie_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct pci_host_bridge *bridge = pp->bridge;
> +
> +	/* Set the bus ops */

Drop spurious comment.

> +	bridge->ops = &ultrarisc_pci_ops;
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops ultrarisc_pcie_host_ops = {
> +	.init = ultrarisc_pcie_host_init,
> +};
> +
> +static int ultrarisc_pcie_establish_link(struct dw_pcie *pci)
> +{
> +	u32 val;
> +	u8 cap_exp;
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_CUS_CORE);
> +	val &= ~FAST_LINK_MODE;
> +	dw_pcie_writel_dbi(pci, PCIE_CUS_CORE, val);
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_TIMER_CTRL_MAX_FUNC_NUM);
> +	val &= ~PORT_FLT_SF_MASK;
> +	val |= PORT_FLT_SF_64;

FIELD_MODIFY() here and below.

> +	dw_pcie_writel_dbi(pci, PCIE_TIMER_CTRL_MAX_FUNC_NUM, val);
> +
> +	cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCTL2);
> +	val &= ~PCI_EXP_LNKCTL2_TLS;
> +	val |= PCI_EXP_LNKCTL2_TLS_16_0GT;
> +	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCTL2, val);
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> +	val &= ~PORT_LINK_NUM_MASK;
> +	dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> +
> +	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_DEVCTL2);
> +	val &= ~PCI_EXP_DEVCTL2_COMP_TIMEOUT;
> +	val |= 0x6;
> +	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_DEVCTL2, val);
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_CUS_CORE);
> +	val &= ~(HOLD_PHY_RST | L1SUB_DISABLE);
> +	val |= LTSSM_ENABLE;
> +	dw_pcie_writel_dbi(pci, PCIE_CUS_CORE, val);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_ops dw_pcie_ops = {
> +	.start_link = ultrarisc_pcie_establish_link,

s/ultrarisc_pcie_establish_link/ultrarisc_pcie_start_link/
to match member name and other drivers.

> +};
> +
> +static int ultrarisc_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ultrarisc_pcie *ultrarisc_pcie;

"ultrarisc_pcie" is a pretty long name that will be used for
parameters when you add more functionality.  Several drivers just use
"pcie", some use the equivalent of "ultrarisc", etc.

> +	struct dw_pcie *pci;
> +	struct dw_pcie_rp *pp;
> +	int ret;
> +
> +	ultrarisc_pcie = devm_kzalloc(dev, sizeof(*ultrarisc_pcie), GFP_KERNEL);
> +	if (!ultrarisc_pcie)
> +		return -ENOMEM;
> +
> +	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
> +	if (!pci)
> +		return -ENOMEM;
> +
> +	pci->dev = dev;
> +	pci->ops = &dw_pcie_ops;
> +
> +	/* Set a default value suitable for at most 16 in and 16 out windows */
> +	pci->atu_size = SZ_8K;
> +
> +	ultrarisc_pcie->pci = pci;
> +
> +	pp = &pci->pp;
> +
> +	platform_set_drvdata(pdev, ultrarisc_pcie);
> +
> +	pp->irq = platform_get_irq(pdev, 1);
> +	if (pp->irq < 0)
> +		return pp->irq;
> +
> +	pp->num_vectors = MAX_MSI_IRQS;
> +	pp->ops = &ultrarisc_pcie_host_ops;
> +
> +	ret = dw_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize host\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ultrarisc_pcie_suspend(struct platform_device *pdev, pm_message_t state)

If you use generic power management, this will be:

  static int ultrarisc_pcie_suspend(struct device *dev)

> +{
> +	struct ultrarisc_pcie *ultrarisc_pcie = platform_get_drvdata(pdev);
> +	struct dw_pcie *pci = ultrarisc_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	int num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
> +	unsigned long flags;
> +	int ctrl;
> +
> +	raw_spin_lock_irqsave(&pp->lock, flags);
> +
> +	for (ctrl = 0; ctrl < num_ctrls; ctrl++)
> +		ultrarisc_pcie->irq_mask[ctrl] = pp->irq_mask[ctrl];
> +
> +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ultrarisc_pcie_resume(struct platform_device *pdev)
> +{
> +	struct ultrarisc_pcie *ultrarisc_pcie = platform_get_drvdata(pdev);
> +	struct dw_pcie *pci = ultrarisc_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	int num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
> +	unsigned long flags;
> +	int ctrl;
> +
> +	raw_spin_lock_irqsave(&pp->lock, flags);
> +
> +	for (ctrl = 0; ctrl < num_ctrls; ctrl++) {
> +		pp->irq_mask[ctrl] = ultrarisc_pcie->irq_mask[ctrl];
> +		dw_pcie_writel_dbi(pci,
> +				   PCIE_MSI_INTR0_MASK +
> +				   ctrl * MSI_REG_CTRL_BLOCK_SIZE,
> +				   pp->irq_mask[ctrl]);
> +	}
> +
> +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ultrarisc_pcie_of_match[] = {
> +	{
> +		.compatible = "ultrarisc,dp1000-pcie",
> +	},
> +	{},
> +};
> +
> +static struct platform_driver ultrarisc_pcie_driver = {
> +	.driver = {
> +		.name	= "ultrarisc-pcie",
> +		.of_match_table = ultrarisc_pcie_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = ultrarisc_pcie_probe,
> +	.suspend = ultrarisc_pcie_suspend,
> +	.resume = ultrarisc_pcie_resume,

Use generic driver PM instead of the platform_driver.suspend/resume.

> +};
> +builtin_platform_driver(ultrarisc_pcie_driver);
> 
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
