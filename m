From: hch@lst.de (Christoph Hellwig)
Date: Sat, 4 Aug 2018 12:11:51 +0200
Subject: [PATCH 1/3] PCI: add a callback to struct pci_host_bridge for
 adding a new device
In-Reply-To: <20180802165430.GA13725@red-moon>
References: <20180801151403.20660-1-hch@lst.de>
 <20180801151403.20660-2-hch@lst.de> <20180802165430.GA13725@red-moon>
Message-ID: <20180804101151.GA12948@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 02, 2018 at 05:54:30PM +0100, Lorenzo Pieralisi wrote:
> while at it, IMHO it would be good to match the current
> pcibios_add_device() prototype (ie returning an int error value)
> so that this change can pave the way to removing yet another
> pcibios call.

Replacing pcibios_add_device sounds like a good idea.  But then
again we can't actually handle the error of that one either
right now..
