From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:27:59 -0700
Subject: [PATCH v3 10/12] RISC-V: Add logical CPU indexing for RISC-V
In-Reply-To: <1536221135-182613-11-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-11-git-send-email-atish.patra@wdc.com>
Message-ID: <20180910112759.GI12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 01:05:33AM -0700, Atish Patra wrote:
> Currently, both linux cpu id and hardware cpu id are same.
> This is not recommended as it will lead to discontinuous cpu
> indexing in Linux. Moreover, kdump kernel will run from CPU0
> which would be absent if we follow existing scheme.
> 
> Implement a logical mapping between Linux cpu id and hardware
> cpuid to decouple these two. Always mark the boot processor as
> cpu0 and all other cpus get the logical cpu id based on their
> booting order.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by  : Anup Patel <anup@brainfault.org>

drop the two spaces before the ":", please.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
