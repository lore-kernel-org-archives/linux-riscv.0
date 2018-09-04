From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 4 Sep 2018 11:50:22 -0700
Subject: [RFC PATCH 2/5] RISC-V: No need to pass scause as arg to do_IRQ()
In-Reply-To: <20180904124514.6290-3-anup@brainfault.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-3-anup@brainfault.org>
Message-ID: <20180904185022.GB25119@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 04, 2018 at 06:15:11PM +0530, Anup Patel wrote:
> The scause is already part of pt_regs so no need to pass
> scause as separate arg to do_IRQ().
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>

Looks fine,

Reviewed-by: Christoph Hellwig <hch@lst.de>
