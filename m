From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 8 Aug 2018 00:07:58 -0700
Subject: [PATCH v4 4/5] Allow to disable FPU support
In-Reply-To: <1533698685-18022-5-git-send-email-alankao@andestech.com>
References: <1533698685-18022-1-git-send-email-alankao@andestech.com>
 <1533698685-18022-5-git-send-email-alankao@andestech.com>
Message-ID: <20180808070758.GA27402@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 08, 2018 at 11:24:44AM +0800, Alan Kao wrote:
> FPU codes have been separated from common part in previous patches.
> This patch add the CONFIG_FPU option and some stubs, so that a no-FPU
> configuration is allowed.
> 
> Signed-off-by: Alan Kao <alankao@andestech.com>
> Cc: Greentime Hu <greentime@andestech.com>
> Cc: Vincent Chen <vincentc@andestech.com>
> Cc: Zong Li <zong@andestech.com>
> Cc: Nick Hu <nickhu@andestech.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
