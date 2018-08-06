From: lorenzo.pieralisi@arm.com (Lorenzo Pieralisi)
Date: Mon, 6 Aug 2018 14:40:43 +0100
Subject: [PATCH 2/3] PCI/xilinx: Work-around for hardware DMA limit (32
 bits)
In-Reply-To: <20180806123527.GB6997@lst.de>
References: <20180804101402.10022-1-hch@lst.de>
 <20180804101402.10022-3-hch@lst.de>
 <CAMgXwTgr572J_HH396tfvT7Zj8Jj0fefKOSmVw2+Gwn8qcPR1g@mail.gmail.com>
 <20180806123527.GB6997@lst.de>
Message-ID: <20180806134043.GD18685@e107981-ln.cambridge.arm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 06, 2018 at 02:35:27PM +0200, Christoph Hellwig wrote:
> On Sun, Aug 05, 2018 at 01:02:58PM -0700, Wesley Terpstra wrote:
> > FYI, This Xilinx PCIe IP 32-bit cap only applies to SOME instances of
> > the IP. The Ultrascale+ version of Xilinx PCIe hard IP does support
> > 64-bit or 32-bit. The Virtex7 version only supports 32-bit. The
> > pcie-xilinx driver woks with both of these root complexes. So probably
> > there should be a conditional hook in the DTS that triggers the
> > work-around behaviour.
> 
> Either we'll need to able to detect which version we use based on
> registrs, or we will indeed need firmware information.
> 
> Note that we already have the mechanism for firmware directed dma limits
> in place, it is called the dma-ranges DT property.  If we can get the
> SiFive firmware to set it up properly the RISC-V swiotlb code will
> just do the right thing.

It would do the right thing without patches 1 and 2 (I would
consider merging patch 1 anyway - see pcibios_add_device()
removal).

It seems to me that the best course of action consists in patching
firmware, that would remove the need for patch 2 (I will merge patch
1 anyway - even if that's for a "different" purpose, see
pcibios_add_device() removal), please let us know.

Thanks,
Lorenzo
