From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 21 Sep 2018 00:00:59 -0700
Subject: [PATCH 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
In-Reply-To: <9fc325660fb1e0ef9133705f7c05784dcc12c0c2.1537260207.git.zongbox@gmail.com>
References: <cover.1537260207.git.zongbox@gmail.com>
 <9fc325660fb1e0ef9133705f7c05784dcc12c0c2.1537260207.git.zongbox@gmail.com>
Message-ID: <20180921070059.GD8401@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 18, 2018 at 05:19:17PM +0800, Zong Li wrote:
> From: Vincent Chen <vincentc@andestech.com>
> 
> For 32bit, the upper 32-bit of phys_addr_t will be flushed to zero
> after AND with PAGE_MASK because the data type of PAGE_MASK is
> unsigned long. To fix this problem, the page alignment is done by
> subtracting the page offset instead of AND with PAGE_MASK.
> 
> Signed-off-by: Vincent Chen <vincentc@andestech.com>

Looks fine,

Reviewed-by: Christoph Hellwig <hch@lst.de>
