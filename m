Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61F4C021B5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 23:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xWzLys2I2sQJVI7nBWmZs0ddnyLmDJASiyW04O1z+k0=; b=sN4oXaBZgrA89u
	1lsqMqVlKevq4TIk4y/Gtop8MMJTG7UOhW4GnigA3bAc4trLwlTkKzeN1I/bwMJ7Cz8QllY9k5t7D
	EGtFj/kysgZjQqlN14DgiHto/2LIweWVOo79TeMnqTJsOhPreNqv/xrZJ6BJeNglGnuP5v/YJnyAf
	OAv7HEfd/a9d1haLUf08PPBeA9HNYGvgkpvC/z+CCjJWG5NULIzrMUc5sKLU4bpHF8SBdlIJhNjqW
	OCOT0zP7/5ULc7V3YZ3lX2Ing74s5g7R4+8ZQnSpKV/LodJj4jhF5xWkMG+TXZJ9q6LUIP2wnPY/7
	gYj64Ejhdz8C3Shd30Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcmQ-00000007AXh-07v5;
	Fri, 21 Feb 2025 23:50:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcmO-00000007AXD-3Vno
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 23:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4783168316;
	Fri, 21 Feb 2025 23:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5E9C4CED6;
	Fri, 21 Feb 2025 23:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181799;
	bh=7nyMY4mFAeqXaY4AyfMQMXfQBWFBvvYOoJjP9MhKH6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ebzXRD7fV/Ixvgj7XqgttlHaThg3WUGKW8yUnOnyCWMx2md84LfMFxeaxPr5BKc12
	 FGB2wrsPt3Uwg65UNNG/nb95tdPXbew7VdMIhM00g1Dn0pDeuAiSr1aUFI1d0z8gbq
	 iWILf7txi/VGSlSsYX1hNot9bKuVUnL/W/cEyw/fIKp9P3f95HELNiew7T3Y4vhMtV
	 r0D98tM4UbWejYZIvR2VB+SrrRySlhP1f/iFaKnMFmoyBeMSq5Du6WuwgHvQcT15Rm
	 HIkLrKamIw0mDTxFcbe4I1DWWPYkR9yY2S8zwwwQ8mM6DcSDpKkpc5NSCq2xYowVTT
	 nb2P3yw3NxN5Q==
Date: Fri, 21 Feb 2025 17:49:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <20250221234958.GA372914@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221013758.370936-3-inochiama@gmail.com>
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

On Fri, Feb 21, 2025 at 09:37:56AM +0800, Inochi Amaoto wrote:
> Add support for DesignWare-based PCIe controller in SG2044 SoC.

> @@ -341,6 +341,16 @@ config PCIE_ROCKCHIP_DW_EP
>  	  Enables support for the DesignWare PCIe controller in the
>  	  Rockchip SoC (except RK3399) to work in endpoint mode.
>  
> +config PCIE_SOPHGO_DW
> +	bool "SOPHGO DesignWare PCIe controller"

What's the canonical styling of "SOPHGO"?  I see "Sophgo" in the
subject line and in Chen Wang's SG2042 series.  Pick the official
styling and use it consistently.

Reorder this so the menuconfig menu items remain alphabetically
sorted.

> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	depends on PCI_MSI
> +	depends on OF
> +	select PCIE_DW_HOST
> +	help
> +	  Enables support for the DesignWare PCIe controller in the
> +	  SOPHGO SoC.
> +
>  config PCI_EXYNOS
>  	tristate "Samsung Exynos PCIe controller"
>  	depends on ARCH_EXYNOS || COMPILE_TEST

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCIe host controller driver for Sophgo SoCs.

Looks too generic, since Chen Wang's series says Sophgo SG2042 SoC is
Cadence-based, so this driver apparently doesn't cover all Sophgo
SoCs.

> + *

Spurious blank line.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/property.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include "pcie-designware.h"
> +
> +#define to_sophgo_pcie(x)		dev_get_drvdata((x)->dev)
> +
> +#define PCIE_INT_SIGNAL			0xc48
> +#define PCIE_INT_EN			0xca0
> +
> +#define PCIE_SIGNAL_INTX_SHIFT		5
> +#define PCIE_INT_EN_INTX_SHIFT		1

Define masks with GENMASK() and get rid of the _SHIFT #defines.

> +#define PCIE_INT_EN_INT_SII		BIT(0)
> +#define PCIE_INT_EN_INT_INTA		BIT(1)
> +#define PCIE_INT_EN_INT_INTB		BIT(2)
> +#define PCIE_INT_EN_INT_INTC		BIT(3)
> +#define PCIE_INT_EN_INT_INTD		BIT(4)

These are unused, drop them.

> +#define PCIE_INT_EN_INT_MSI		BIT(5)
> +
> +struct sophgo_pcie {
> +	struct dw_pcie pci;
> +	void __iomem *app_base;
> +	struct clk_bulk_data *clks;
> +	unsigned int clk_cnt;
> +	struct reset_control *rst;
> +	struct irq_domain *irq_domain;

Indent the member names to align vertically as most other drivers do.

> +};
> +
> +static int sophgo_pcie_readl_app(struct sophgo_pcie *sophgo, u32 reg)
> +{
> +	return readl_relaxed(sophgo->app_base + reg);
> +}
> +
> +static void sophgo_pcie_writel_app(struct sophgo_pcie *sophgo, u32 val, u32 reg)
> +{
> +	writel_relaxed(val, sophgo->app_base + reg);
> +}
> +
> +static void sophgo_pcie_intx_handler(struct irq_desc *desc)
> +{
> +	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> +	unsigned long hwirq = PCIE_SIGNAL_INTX_SHIFT;
> +	unsigned long reg;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	reg = sophgo_pcie_readl_app(sophgo, PCIE_INT_SIGNAL);
> +
> +	for_each_set_bit_from(hwirq, &reg, PCI_NUM_INTX + PCIE_SIGNAL_INTX_SHIFT)

Use FIELD_GET() here and iterate through PCI_NUM_INTX.  Then you don't
need for_each_set_bit_from() and shouldn't need PCIE_SIGNAL_INTX_SHIFT
here and below.

> +		generic_handle_domain_irq(sophgo->irq_domain,
> +					  hwirq - PCIE_SIGNAL_INTX_SHIFT);
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void sophgo_intx_mask(struct irq_data *d)
> +{
> +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> +	unsigned long flags;
> +	u32 val;
> +
> +	raw_spin_lock_irqsave(&pp->lock, flags);
> +
> +	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
> +	val &= ~BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);

FIELD_PREP().

> +	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
> +
> +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> +};
> +
> +static void sophgo_intx_unmask(struct irq_data *d)
> +{
> +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> +	unsigned long flags;
> +	u32 val;
> +
> +	raw_spin_lock_irqsave(&pp->lock, flags);
> +
> +	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
> +	val |= BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);

Ditto.

> +	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
> +
> +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> +};
> +
> +static void sophgo_intx_eoi(struct irq_data *d)
> +{
> +}
> +
> +static struct irq_chip sophgo_intx_irq_chip = {
> +	.name			= "INTx",
> +	.irq_mask		= sophgo_intx_mask,
> +	.irq_unmask		= sophgo_intx_unmask,
> +	.irq_eoi		= sophgo_intx_eoi,

Name these ending with the irq_chip field names, e.g.,
sophgo_intx_irq_mask(), to make them easier to find with grep.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
