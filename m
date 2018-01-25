From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 24 Jan 2018 23:46:58 -0800
Subject: [PATCH v2 4/4] RISC-V: Move to the new generic IRQ handler
In-Reply-To: <20180125030756.21787-5-palmer@sifive.com>
References: <20180125030756.21787-1-palmer@sifive.com>
 <20180125030756.21787-5-palmer@sifive.com>
Message-ID: <20180125074658.GD14162@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jan 24, 2018 at 07:07:56PM -0800, Palmer Dabbelt wrote:
> The old mechanism for handling IRQs on RISC-V was pretty ugly: the arch
> code looked at the Kconfig entry for our first-level irqchip driver and
> called into it directly.
> 
> This patch uses the new 0generic IRQ handling infastructure, which
> essentially just deletes a bunch of code.  This does add an additional
> load to the interrupt latency, but there's a lot of tuning left to be
> done there on RISC-V so I think it's OK for now.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
