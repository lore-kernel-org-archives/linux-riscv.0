From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:24:43 -0700
Subject: [PATCH v3 04/12] RISC-V: Disable preemption before enabling
 interrupts
In-Reply-To: <1536221135-182613-5-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-5-git-send-email-atish.patra@wdc.com>
Message-ID: <20180910112443.GD12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 01:05:27AM -0700, Atish Patra wrote:
> Currently, irq is enabled before preemption disabling happens.
> If the scheduler fired right here and cpu is scheduled then it
> may blow up.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> [Atish: Commit text and code comment formatting update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
