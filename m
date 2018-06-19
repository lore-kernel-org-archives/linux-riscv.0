From: arnd@arndb.de (Arnd Bergmann)
Date: Tue, 19 Jun 2018 16:31:06 +0200
Subject: [PATCH 1/3] PCI: Add hooks for bus/bridge-specific fixups
In-Reply-To: <20180619141700.7842-2-hch@lst.de>
References: <20180619141700.7842-1-hch@lst.de>
 <20180619141700.7842-2-hch@lst.de>
Message-ID: <CAK8P3a2PzaDaug5XHeGHjurVU5mAsHstxOm7cDJf44LoPdmipQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Jun 19, 2018 at 4:16 PM, Christoph Hellwig <hch@lst.de> wrote:
> From: "Wesley W. Terpstra" <wesley@sifive.com>

> index 340029b2fb38..ea9609fc44fc 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -662,6 +662,7 @@ static inline int pcibios_err_to_errno(int err)
>  struct pci_ops {
>         int (*add_bus)(struct pci_bus *bus);
>         void (*remove_bus)(struct pci_bus *bus);
> +       void (*add_dev)(struct pci_dev *dev, struct pci_bus *bus);
>         void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>         int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>         int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);

We are a bit inconsistent about adding callbacks to pci_ops or pci_host_bridge.
I would argue this should be part of pci_host_bridge, and the other two should
probably be there as well, or possibly moved into a separate
'pci_host_bridge_ops'
structure referenced from pci_host_bridge along with the other callbacks there.

One of the things we discussed in the past (but never implemented) is that
many of the current '__weak' functions in the PCI core can be turned into
host_bridge specific operations.

Some config space operations by contrast are currently shared across host
bridge drivers (see pci_bus_set_ops, or drivers/pci/ecam.c) and probably
better left out of the host bridge.

      Arnd
