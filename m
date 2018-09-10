From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 06:52:31 -0700
Subject: Memory allocation failure using GFP_DMA32 in 4.19-rc2
In-Reply-To: <3aa15803-e86a-7aa2-e57c-93e43c3d046f@wdc.com>
References: <3aa15803-e86a-7aa2-e57c-93e43c3d046f@wdc.com>
Message-ID: <20180910135231.GA19320@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Sep 07, 2018 at 02:50:52PM -0700, Atish Patra wrote:
> Hi,
> I got Radeon HD6450 GPU with Microsemi expansion board working on 4.17
> kernel + all required out of tree patches (drivers/dma). However, I moved to
> 4.19-rc2 and faces following error. It seems that kernel couldn't allocate
> memory using GFP_DMA32. Other than this, kernel can boot and even detect
> SATA devices.

Please take a look at /proc/zoneinfo how much memory there is in
ZONE_DMA32.  Or send the file out if it looks too confusing.

> 
> | * | 1847e725 DMA cleanups (by Palmer Dabbelt 5 months ago)
> | * | ee247f86 riscv: support for broken PCIe controllers (by Wesley W.
> Terpstra 6 months ago)
> | * | 9b994793 riscv: add DMA mappings suitable for a pure 64-bit system (by
> Palmer Dabbelt 7 months ago)
> 
> Any suggestions/pointers what might be wrong ?

None of the above should be needed for mainline.  Also try without them.
