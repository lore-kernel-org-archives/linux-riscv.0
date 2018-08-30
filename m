From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 07:38:53 -0700
Subject: [PATCH 2/8] RISC-V: Don't set
 cacheinfo.{physical_line_partition, attributes}
In-Reply-To: <20180827184243.25344-3-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-3-palmer@sifive.com>
Message-ID: <20180830143853.GD11544@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 27, 2018 at 11:42:37AM -0700, Palmer Dabbelt wrote:
> These are just hard coded in the RISC-V port, which doesn't make any
> sense.  We should probably be setting these from device tree entries
> when they exist, but for now I think it's saner to just leave them all
> as their default values.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>
