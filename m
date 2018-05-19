From: hch@lst.de (Christoph Hellwig)
Date: Sat, 19 May 2018 08:35:34 +0200
Subject: add swiotlb support for riscv
In-Reply-To: <mhng-268a981e-4623-4e88-baf3-09cb0fbaca25@palmer-si-x1c4>
References: <20180516144302.823-1-hch@lst.de>
 <mhng-268a981e-4623-4e88-baf3-09cb0fbaca25@palmer-si-x1c4>
Message-ID: <20180519063534.GA17809@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, May 18, 2018 at 04:31:36PM -0700, Palmer Dabbelt wrote:
>>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/riscv-swiotlb
>
> Ah, great!  This is much cleaner than our current implementation, which 
> isn't based on the generic stuff :).  I'm happy to have these through that 
> tree if it makes the merging easier, feel free to add an
>
>    Acked-by: Palmer Dabbelt <palmer@sifive.com>
>
> and/or a
>
>    Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> on all 3 of these patches if that helps.  I'm going to park them on my 
> next-swiotlb branch so I can use them, but I won't submit them myself 
> unless someone says something.

I think it is indeed easiest if I pull them into the dma-mapping tree.

Feel free the keep them in a riscv branch as well, but remember that
they depend on other patches in the dma-mapping tree that consolidate
the SWIOTLB Kconfig symbol.
