From: wesley@sifive.com (Wesley Terpstra)
Date: Mon, 6 Aug 2018 09:21:40 -0700
Subject: [PATCH 2/3] PCI/xilinx: Work-around for hardware DMA limit (32
 bits)
In-Reply-To: <20180806123527.GB6997@lst.de>
References: <20180804101402.10022-1-hch@lst.de>
 <20180804101402.10022-3-hch@lst.de>
 <CAMgXwTgr572J_HH396tfvT7Zj8Jj0fefKOSmVw2+Gwn8qcPR1g@mail.gmail.com>
 <20180806123527.GB6997@lst.de>
Message-ID: <CAMgXwTjcjdiBN9yksL9zuZQyGjckC+F+qwzSm32RjjFSWHFCPQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 6, 2018 at 5:35 AM, Christoph Hellwig <hch@lst.de> wrote:
> Note that we already have the mechanism for firmware directed dma limits
> in place, it is called the dma-ranges DT property.  If we can get the
> SiFive firmware to set it up properly the RISC-V swiotlb code will
> just do the right thing.

Does this mean we only need to set the dma-ranges property inside the
pci DTS node? No changes to the driver needed?
