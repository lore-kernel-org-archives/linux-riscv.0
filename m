From: hch@lst.de (Christoph Hellwig)
Date: Thu, 28 Jun 2018 15:06:21 +0200
Subject: ERROR: "swiotlb_dma_ops" [...] undefined!
In-Reply-To: <mvmzhzhg1aq.fsf@suse.de>
References: <mvmzhzhg1aq.fsf@suse.de>
Message-ID: <20180628130621.GA8438@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Jun 26, 2018 at 02:49:49PM +0200, Andreas Schwab wrote:
> swiotlb_dma_ops is not an exported symbol, thus any module using
> functions from dma-mapping.h will get an undefined reference to it.

I'll send a patch to Linus to export it.  Thanks for the report.
