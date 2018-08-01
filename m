From: wesley@sifive.com (Wesley Terpstra)
Date: Wed, 1 Aug 2018 16:02:34 -0700
Subject: add support for Xilinx PCIe root ports on RISC-V v2
In-Reply-To: <20180801151403.20660-1-hch@lst.de>
References: <20180801151403.20660-1-hch@lst.de>
Message-ID: <CAMgXwThU2h3Grm+10S0Env1ZUYK5Q7pze+ckADjjyHEUVGs7=A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

FYI, I don't believe this solution is the one we intended to merge
upstream. There is a different approach used in the riscv-linux tree
from Palmer.

On Wed, Aug 1, 2018 at 8:14 AM, Christoph Hellwig <hch@lst.de> wrote:
> Hi all,
>
> this series with patches originally from Palmer and Wesley adds support
> for the pcie-xilinx host driver on RISC-V boards.  The interesting part
> about that is that the IP blocks is limited to 32-bit DMA internally,
> which didn't seem to be an issue with the existing users, but shows
> up easily with the Sifive RISC-V boards that have physical memory
> wired up above 4G.
>
> Note that patches 1 and 2 depend on changes in the dma-mapping tree
> to add the bus_dma_mask field to struct device and would have to merge
> through the dma-mapping tree or a shared stable branch.  Patch 3 could
> be merged independently.
>
> Changes since v1:
>  - move the add_dev method to struct pci_host_bridge
>  - use the new bus_dma_mask field
