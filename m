From: lorenzo.pieralisi@arm.com (Lorenzo Pieralisi)
Date: Mon, 6 Aug 2018 12:23:10 +0100
Subject: [PATCH 1/3] PCI: add a callback to struct pci_host_bridge for
 adding a new device
In-Reply-To: <20180804101402.10022-2-hch@lst.de>
References: <20180804101402.10022-1-hch@lst.de>
 <20180804101402.10022-2-hch@lst.de>
Message-ID: <20180806112310.GB18685@e107981-ln.cambridge.arm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Aug 04, 2018 at 12:14:00PM +0200, Christoph Hellwig wrote:
> There is currently no way for a PCIe bridge to impose constraints on
> devices added to it.  For example, the Xilinx PCIe host bridge only
> supports 32-bit physical addresses (due to a limitation on the AXI
> port's address width).  Thus, even devices that claim to support 64-bit
> DMA addresses must be restricted to 32-bit addresses when attached to
> this host controller.
> 
> This patch adds a "add_device" method  to struct pci_host_bridge that
> allows the host driver to act upon acting adding devices.
> 
> Based on an earlier patch from Wesley W. Terpstra <wesley@sifive.com>.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/pci/probe.c | 6 ++++++
>  include/linux/pci.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index ac876e32de4b..452190fb05e7 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2290,6 +2290,7 @@ static void pci_set_msi_domain(struct pci_dev *dev)
>  
>  void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(bus);
>  	int ret;
>  
>  	pci_configure_device(dev);
> @@ -2328,6 +2329,11 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>  	ret = pcibios_add_device(dev);
>  	WARN_ON(ret < 0);
>  
> +	if (host->add_device) {
> +		ret = host->add_device(dev);
> +		WARN_ON(ret < 0);
> +	}

This looks fine; we could go a step further and make the hunk above
the default (weak) implementation of pcibios_add_device() that is
currently a NOP returning 0, I will remove it for v4.20.

I am fine with the patch as-is (even though I am not a big fan of
those WARN_ON but that's not a problem related to your patch, as you
said we are *not* handling the ret value in the current mainline).

Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

> +
>  	/* Set up MSI IRQ domain */
>  	pci_set_msi_domain(dev);
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index abd5d5e17aee..1524adbb30ab 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -485,6 +485,7 @@ struct pci_host_bridge {
>  			resource_size_t start,
>  			resource_size_t size,
>  			resource_size_t align);
> +	int (*add_device)(struct pci_dev *dev);
>  	unsigned long	private[0] ____cacheline_aligned;
>  };
>  
> -- 
> 2.18.0
> 
