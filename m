From: hch@lst.de (Christoph Hellwig)
Date: Wed, 16 May 2018 16:42:59 +0200
Subject: add swiotlb support for riscv
Message-ID: <20180516144302.823-1-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Current 64-bit RISC-V cores don't have any iommu support, so they need
iommu support when used with more than 4GB DRAM (or even just address
space depending on the SBI).  This wires the support up based on
earlier patches from Palmer.

Note that the patches are on to of the dma mapping tree as they require
the swiotlb Kconfig consolidation, and should probably merged through
that tree as well.

Git tree:

    git://git.infradead.org/users/hch/misc.git riscv-swiotlb

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/riscv-swiotlb
