From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:29:09 -0700
Subject: [PATCH v3 11/12] RISC-V: Use Linux logical cpu number instead of
 hartid
In-Reply-To: <1536221135-182613-12-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-12-git-send-email-atish.patra@wdc.com>
Message-ID: <20180910112909.GJ12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 01:05:34AM -0700, Atish Patra wrote:
> Setup the cpu_logical_map during boot. Moreover, every SBI call
> and PLIC context are based on the physical hartid. Use the logical
> cpu to hartid mapping to pass correct hartid to respective functions.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by  : Anup Patel <anup@brainfault.org>

Same whitespace issue here.

Otherwise looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>
