Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700FCCD37AA
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Cc0WeUCwNVkHkBz89xnncY6H6HSCkZjcsvrRQ329ChU=; b=gRvaG9ZnVZUOBo
	HKXaX49a6mlg7qvTNxYH6KIsdWTFI7G9mE/y1i+NkS6bOwnMQkRnWeahkB9JWB2sfHwaqgoIpEVgo
	/hnOPowISc3M8/9adUTNtiIVZTtdHQhoMQX6rBMwgeB/sme21kNr9RqiEZC+Ona0UOa6v8pMtV3p+
	FJyopPuuwxcMNSOJvCgFqkbz5458HXhn1qcbUd1F2Hcyec+9sXkRDVug1MXcYQZO3QkPqbKKZoui/
	vPsSzIcp20flbqBWUoluQGbCkU0+vpFD41Gn11qAouaa7mG+/ALYvAob/66xRL9/GUXSd4krcS+KZ
	UhozwEP2cK9+rG6XiimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL7QD-000000054h5-2KBG;
	Thu, 07 May 2026 22:42:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL7QC-000000054gs-1bCe
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 22:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64E366057A;
	Thu,  7 May 2026 22:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED86C2BCB2;
	Thu,  7 May 2026 22:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778193739;
	bh=J0kRFG9bUaWTTHIU1f8/BZmV72pbWWRzeSv5tn2IJ+Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pZ8OJoJDjVp74T5HTAFYAW24ULTzTS5u6XyQpEYzf/fwJ5askHm4Fepx+Mb8uIuBh
	 TTWkblCiS9WBse7RVNTyWkBEd6TQDKcRX4EFPjrBJ1/wnrNBYScemGuDwm5uQmWla2
	 F/28EibEfFcTpulfbdWpo4wOhiE4GwjNtSEVwOK9iKai27Zxp2rvtKUTNoPQ+UJR9B
	 N7G5SWN8B3xOPKcvsiFMQTUaj/25gFtPjx0RFsJAuhRUmDrSRJg5R0nF0XDYF1LUdZ
	 saU/G2E92XATlbrCE6iN3x0H4Jfxqq+T1rAzFc+lQSLeDTrl0JYmf65tvMbU+dZE+U
	 or2kQaRwQdKVA==
Date: Thu, 7 May 2026 17:42:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <20260507224217.GA48780@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260502101319.2364052-6-inochiama@gmail.com>
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

On Sat, May 02, 2026 at 06:13:18PM +0800, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> Designware PCIe IP with extra link and reset control. Unlike
> the PCIe controller on K1, this controller supports external MSI
> interrupt controller and can use multiple phy at the same time.
> 
> Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Sashiko had some good questions:
https://sashiko.dev/#/patchset/20260502101319.2364052-1-inochiama%40gmail.com

Looks like the CONFIG_PCIE_SPACEMIT_K1 menu item and help text
drivers/pci/controller/dwc/Kconfig should be updated to include K3.

The "CONFIG_PCIE_SPACEMIT_K1" name itself should stay the same.

s/Designware/DesignWare/, also in 4/5 commit log
s/phy/PHY/ here and other patches and subject lines
s/msi/MSI/ in 3/5 subject and commit log when it's a stand-alone word
s/pci:/PCI:/ in 4/5 subject to match history (and patch 3/5)

> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c

> +#define INTR_STATUS				0x0010
> +
>  #define INTR_ENABLE				0x0014
>  #define MSI_CTRL_INT			BIT(11)
> +#define RDLH_LINK_UP_INT		BIT(20)
> +
> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> +
> +#define K3_PHY_AHB_IRQENABLE_SET_INTX		0x000c
> +#define LEG_EP_INTERRUPTS		(BIT(6) | BIT(7) | BIT(8) | BIT(9))

Would be nicer to use "INTX" rather than "LEG" here since we use
"INTX" in K3_PHY_AHB_IRQENABLE_SET_INTX, in the comments, etc.

> +#define K3_PHY_AHB_IRQENABLE_SET_MSI		0x0014
> +/* MSI defined as BIT(11) in existing INTR_ENABLE, reusing */
> +
> +#define K3_ADDR_INTR_STATUS1			0x0018
> +
> +#define K3_ADDR_INTR_ENABLE1			0x001C

You're using a mix of upper- and lower-case hex here.  Be consistent
and match the existing code.

Seems a little weird to have a mix of "IRQ" names (e.g.,
K1_PHY_AHB_IRQ_EN, K3_PHY_AHB_IRQSTATUS_INTX,
K3_PHY_AHB_IRQENABLE_SET_INTX) and "INTR" names (e.g., INTR_STATUS,
INTR_ENABLE, K3_ADDR_INTR_STATUS1, K3_ADDR_INTR_ENABLE1) when I think
they're really talking about the same concept.

And why do the new K3 names have "ADDR" in the middle when the
existing "INTR_ENABLE" names don't?  It's obvious these are addresses
(well, actually I think they're *offsets*, but no need to be that
detailed).

> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> ...
> +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> +	val &= ~(0xffff << 8);
> +	val |= ((0x1 << 4) << 8);

Can you use FIELD_MODIFY and some #defines here?

> +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> +
> +	/* Set the PCI vendor and device ID */

Superfluous comment since the code is obvious.

> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K3);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	/* Finally, as a workaround, disable ASPM L1 */

I guess this means a device erratum?  It advertises L1 but it doesn't
actually work?

> +	k1_pcie_disable_aspm_l1(k1);

> +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
> +{
> ...
> +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> +	val |= (0xf << 11);

FIELD_MODIFY and some #defines here?

> +static int k3_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> +	u32 val;
> +
> +	k1_pcie_start_link(pci);
> +
> +	/* Enable INTx */
> +	val = readl_relaxed(k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
> +	val |= LEG_EP_INTERRUPTS;
> +	writel_relaxed(val, k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
> +
> +	/* Enable MSI/MSIX specific to K3 */

s/MSIX/MSI-X/ to match spec usage.

> +	val = readl_relaxed(k1->link + K3_ADDR_INTR_ENABLE1);
> +	val |= (MSI_INT | MSIX_INT);
> +	writel_relaxed(val, k1->link + K3_ADDR_INTR_ENABLE1);

Generally speaking I think the interrupt setup belongs somewhere other
than .start_link().  Usually .start_link() only enables LTSSM.

> +	return 0;
> +}

> +static irqreturn_t k3_pcie_irq_thread(int irq, void *data)
> +{
> +	struct k1_pcie *k1 = data;
> +	struct dw_pcie_rp *pp = &k1->pci.pp;
> +	struct device *dev = k1->pci.dev;
> +	u32 status0, status1, status2;
> +
> +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
> +
> +	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	writel_relaxed(status1, k1->link + INTR_STATUS);
> +	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	if (FIELD_GET(RDLH_LINK_UP_INT, status1)) {
> +		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +		/* Rescan the bus to enumerate endpoint devices */
> +		pci_lock_rescan_remove();
> +		pci_rescan_bus(pp->bridge->bus);

This is the *only* driver that uses pci_rescan_bus() this way, which
automatically makes it suspicous.  Maybe it's the first hardware that
implements or is willing to use RDLH_LINK_UP_INT for this, but somehow
I doubt it.

> +		pci_unlock_rescan_remove();
> +	} else if (!status0 && !status1 && !status2)
> +		dev_WARN_ONCE(dev, true,
> +			      "Received unknown event. status0=0x%08x status1=0x%08x status2=0x%08x\n",
> +			      status0, status1, status2);
> +
> +	return IRQ_HANDLED;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
