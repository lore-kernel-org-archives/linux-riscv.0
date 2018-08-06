From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 6 Aug 2018 15:54:13 +0200
Subject: [PATCH 1/3] PCI: add a callback to struct pci_host_bridge for
 adding a new device
In-Reply-To: <20180806123051.GA6997@lst.de>
References: <20180804101402.10022-1-hch@lst.de>
 <20180804101402.10022-2-hch@lst.de>
 <20180806112310.GB18685@e107981-ln.cambridge.arm.com>
 <20180806123051.GA6997@lst.de>
Message-ID: <CAK8P3a0XyK+j4Z+xhxOYKa=5gHmFnWd7=fU=6A3=VkBXxWjSsw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 6, 2018 at 2:25 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Aug 06, 2018 at 12:23:10PM +0100, Lorenzo Pieralisi wrote:
> > >     pci_configure_device(dev);
> > > @@ -2328,6 +2329,11 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
> > >     ret = pcibios_add_device(dev);
> > >     WARN_ON(ret < 0);
> > >
> > > +   if (host->add_device) {
> > > +           ret = host->add_device(dev);
> > > +           WARN_ON(ret < 0);
> > > +   }
> >
> > This looks fine; we could go a step further and make the hunk above
> > the default (weak) implementation of pcibios_add_device() that is
> > currently a NOP returning 0, I will remove it for v4.20.
>
> I'd love to see pcibios_add_device go away entirely.  But I wonder how to
> get setup the pci_host_bridge pointer for the remaining architectures that
> still implement it.  I did look for any easy way but couldn't find one.
> But then I don't really know this area of the PCI code too well.

If the platform doesn't already have a pointer to its pci_host_bridge
structure, it can call pci_find_host_bridge(bus->dev) to get it.

Ideally, platforms (either arch specific code or drivers/pci/controller)
should call pci_alloc_host_bridge()/pci_register_host_bridge()
instead of the traditional pci_create_root_bus() that is less flexible.
That way, the driver specific structure can get allocated together with
the host bridge.

         Arnd
