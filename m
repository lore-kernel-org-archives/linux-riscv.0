Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B50AE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cRl1XXdwYT8V6WA5zfPera7uQtlbDdWTNBkYOhzLxGQ=; b=KI/1D2ufWzqU/j
	Taa4xP2RBJB/8Bwv5Du6zVFnyvtOSsPID5iAI8R7FTRSyCP7ZNjww/Uk/h97kvJjDanM5+c/9L9KE
	ivQ+X3y6nmRGXLgssJgcJYJkIY/Yt5lBCXRYRzjDNDcCCIHe0YwJSfWZ2mXyszTir8xzLsOuUVtiX
	k8pAr6UuvIsxeXKTm3CkONckVN8LIVtba09kxcQR56+lIm7ULgv2KSskZswx3Q+1hpL7NLMNANYdF
	WnSyxRYmCnKBRSybYJLOsH94eTYbcO/Xlz6Wxud3EVjzQMI/h+UyMRrvglY1X08lbz1Vc64e/3aGZ
	dENIrKXJiWA5cT5BUnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4BA-0000000CIgv-11lK;
	Tue, 10 Dec 2024 17:37:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL450-0000000CHMz-3A0G
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 17:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47A3DA41786;
	Tue, 10 Dec 2024 17:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9F5C4CEDD;
	Tue, 10 Dec 2024 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733851885;
	bh=DuBdlT+k6TDL3ybELXaf3EyWiycHlo9VKr61ZHOmzqI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=u7rwvAvrDmwsGVeL9KORiux9PdU5c0Jz5MVI/MTPKUOA/8/SA2I5FiDLLrcyssx2m
	 TTTRY1hm2x5TzBu//inrGvww2OTIK4/q4vRJh6+xbkIzMzK6YKdNnU56B5MC2/fSUz
	 jLoDp8Zt7LdKbXQFipYs4Ss1g7S/wbYXMDJxiFrVG2OHhuJItj2s/Ph1cS2fGQSrF0
	 UvKGW94k3B/dXFvKP/owrasdIEnx48Wd/vIahARjJNkbd5TPzxWWD+AwnEdSYo+UYQ
	 W9jbhPX0IuGvTjGEwjtWzn9jIudc/8TAwVJhX/IrAWay6OcR9dquLF9BbhTS6vLCoJ
	 6DJV/yhON5qOw==
Date: Tue, 10 Dec 2024 11:31:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, unicorn_wang@outlook.com,
	conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
	krzk+dt@kernel.org, lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: Re: [PATCH v2 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <20241210173123.GA3247614@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d82eff3670f60df24228e5c83cf663c6dd61eaf.1733726572.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093126_915643_BC3BD844 
X-CRM114-Status: GOOD (  18.99  )
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

On Mon, Dec 09, 2024 at 03:19:57PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add support for PCIe controller in SG2042 SoC. The controller
> uses the Cadence PCIe core programmed by pcie-cadence*.c. The
> PCIe controller will work in host mode only.

> +++ b/drivers/pci/controller/cadence/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
>  obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
>  obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
>  obj-$(CONFIG_PCI_J721E) += pci-j721e.o
> +obj-$(CONFIG_PCIE_SG2042) += pcie-sg2042.o
> \ No newline at end of file

Add the newline.

> +++ b/drivers/pci/controller/cadence/pcie-sg2042.c

> +#include "../../../irqchip/irq-msi-lib.h"

This is the only file outside drivers/irqchip/ that includes this.
What's special about this driver?  Maybe this is a hint that something
here belongs in drivers/irqchip/?

> +#ifdef CONFIG_SMP

No other drivers test CONFIG_SMP, why should this be different?

> +static int sg2042_pcie_msi_irq_set_affinity(struct irq_data *d,
> +					    const struct cpumask *mask,
> +					    bool force)
> +{
> +	if (d->parent_data)
> +		return irq_chip_set_affinity_parent(d, mask, force);
> +
> +	return -EINVAL;
> +}
> +#endif /* CONFIG_SMP */

> +static int sg2042_pcie_init_msi_data(struct sg2042_pcie *pcie)
> +{
> +	struct device *dev = pcie->cdns_pcie->dev;
> +	u32 value;
> +	int ret;
> +
> +	raw_spin_lock_init(&pcie->msi_lock);
> +
> +	/*
> +	 * Though the PCIe controller can address >32-bit address space, to
> +	 * facilitate endpoints that support only 32-bit MSI target address,
> +	 * the mask is set to 32-bit to make sure that MSI target address is
> +	 * always a 32-bit address
> +	 */
> +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));

Not sure this is needed.  Does DT dma-ranges not cover this?

> +static int sg2042_pcie_setup_msi(struct sg2042_pcie *pcie, struct device_node *msi_node)

Wrap to fit in 80 columns like the rest.

> +/*
> + * SG2042 only support 4-byte aligned access, so for the rootbus (i.e. to read
> + * the PCIe controller itself, read32 is required. For non-rootbus (i.e. to read

s/PCIe controller/Root Port/

> + * the PCIe peripheral registers, supports 1/2/4 byte aligned access, so
> + * directly use read should be fine.

s/use read/using read/

> +static int sg2042_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct pci_host_bridge *bridge;
> +	struct device_node *np_syscon;
> +	struct device_node *msi_node;
> +	struct cdns_pcie *cdns_pcie;
> +	struct sg2042_pcie *pcie;
> +	struct cdns_pcie_rc *rc;
> +	struct regmap *syscon;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_PCIE_CADENCE_HOST))
> +		return -ENODEV;

I don't think this is needed since CONFIG_PCIE_SG2042 selects
PCIE_CADENCE_HOST.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
