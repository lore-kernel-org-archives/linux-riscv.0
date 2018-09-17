From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 17 Sep 2018 07:08:16 -0700
Subject: [PATCH] RISCV: Fix end PFN for low memory
In-Reply-To: <1536690618-9157-1-git-send-email-atish.patra@wdc.com>
References: <1536690618-9157-1-git-send-email-atish.patra@wdc.com>
Message-ID: <20180917140816.GA28689@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 11, 2018 at 11:30:18AM -0700, Atish Patra wrote:
> Use memblock_end_of_DRAM which provides correct last low memory
> PFN. Without that, DMA32 region becomes empty resulting in zero
> pages being allocated for DMA32.
> 
> This patch is based on earlier patch from palmer which never
> merged into 4.19. I just edited the commit text to make more
> sense.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

Palmer, can you queue this up for 4.19?
