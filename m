From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 18 May 2018 16:31:36 -0700 (PDT)
Subject: add swiotlb support for riscv
In-Reply-To: <20180516144302.823-1-hch@lst.de>
Message-ID: <mhng-268a981e-4623-4e88-baf3-09cb0fbaca25@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 16 May 2018 07:42:59 PDT (-0700), Christoph Hellwig wrote:
> Current 64-bit RISC-V cores don't have any iommu support, so they need
> iommu support when used with more than 4GB DRAM (or even just address
> space depending on the SBI).  This wires the support up based on
> earlier patches from Palmer.

Yep: the FU540-C000 has a feature where DRAM is always mapped at 2GiB physical, 
so if we have more than 2GiB of DRAM (we have 8GiB on the only board it'll 
probably ever be attached to) then we need swiotlb to do 32-bit DMA.

> Note that the patches are on to of the dma mapping tree as they require
> the swiotlb Kconfig consolidation, and should probably merged through
> that tree as well.
>
> Git tree:
>
>     git://git.infradead.org/users/hch/misc.git riscv-swiotlb
>
> Gitweb:
>
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/riscv-swiotlb

Ah, great!  This is much cleaner than our current implementation, which isn't 
based on the generic stuff :).  I'm happy to have these through that tree if it 
makes the merging easier, feel free to add an

    Acked-by: Palmer Dabbelt <palmer@sifive.com>

and/or a

    Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

on all 3 of these patches if that helps.  I'm going to park them on my 
next-swiotlb branch so I can use them, but I won't submit them myself unless 
someone says something.
