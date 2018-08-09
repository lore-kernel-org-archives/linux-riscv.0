From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 9 Aug 2018 01:02:48 -0700
Subject: [PATCH v6 5/5] Auto-detect whether a FPU exists
In-Reply-To: <1533800680-3653-1-git-send-email-alankao@andestech.com>
References: <1533800680-3653-1-git-send-email-alankao@andestech.com>
Message-ID: <20180809080248.GA7600@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 09, 2018 at 03:44:40PM +0800, Alan Kao wrote:
> We expect that a kernel with CONFIG_FPU=y can still support no-FPU
> machines. To do so, the kernel should first examine the existence of a
> FPU, then do nothing if a FPU does exist; otherwise, it should
> disable/bypass all FPU-related functions.
> 
> In this patch, a new global variable, has_fpu, is created and determined
> when parsing the hardware capability from device tree during booting.
> This variable is used in those FPU-related functions.
> 
> Signed-off-by: Alan Kao <alankao@andestech.com>
> Cc: Greentime Hu <greentime@andestech.com>
> Cc: Vincent Chen <vincentc@andestech.com>
> Cc: Zong Li <zong@andestech.com>
> Cc: Nick Hu <nickhu@andestech.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
