From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 2 Oct 2018 07:51:16 -0700
Subject: [PATCH v3 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
In-Reply-To: <54849b9d9a709525640011814872155eafa7a9d7.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
 <54849b9d9a709525640011814872155eafa7a9d7.1538470103.git.zongbox@gmail.com>
Message-ID: <20181002145116.GE3889@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 02, 2018 at 04:52:31PM +0800, Zong Li wrote:
> From: Vincent Chen <vincentc@andestech.com>
> 
> For 32bit, the upper 32-bit of phys_addr_t will be flushed to zero
> after AND with PAGE_MASK because the data type of PAGE_MASK is
> unsigned long. To fix this problem, the page alignment is done by
> subtracting the page offset instead of AND with PAGE_MASK.
> 
> Signed-off-by: Vincent Chen <vincentc@andestech.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

(and I'm pretty sure I reviewed this before..)
