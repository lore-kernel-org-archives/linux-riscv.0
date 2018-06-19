From: hch@lst.de (Christoph Hellwig)
Date: Tue, 19 Jun 2018 19:32:40 +0200
Subject: [PATCH 1/3] PCI: Add hooks for bus/bridge-specific fixups
In-Reply-To: <CAK8P3a2PzaDaug5XHeGHjurVU5mAsHstxOm7cDJf44LoPdmipQ@mail.gmail.com>
References: <20180619141700.7842-1-hch@lst.de>
 <20180619141700.7842-2-hch@lst.de>
 <CAK8P3a2PzaDaug5XHeGHjurVU5mAsHstxOm7cDJf44LoPdmipQ@mail.gmail.com>
Message-ID: <20180619173240.GA19081@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Jun 19, 2018 at 04:31:06PM +0200, Arnd Bergmann wrote:
> We are a bit inconsistent about adding callbacks to pci_ops or pci_host_bridge.
> I would argue this should be part of pci_host_bridge, and the other two should
> probably be there as well, or possibly moved into a separate
> 'pci_host_bridge_ops'
> structure referenced from pci_host_bridge along with the other callbacks there.

How do we find the proper pci_host_bridge from an arbitrary
device deep down the hierachy below it?
