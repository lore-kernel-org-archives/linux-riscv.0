From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 24 Jan 2018 23:45:11 -0800
Subject: [PATCH v2 1/4] arm: Make set_handle_irq and handle_arch_irq
 generic
In-Reply-To: <20180125030756.21787-2-palmer@sifive.com>
References: <20180125030756.21787-1-palmer@sifive.com>
 <20180125030756.21787-2-palmer@sifive.com>
Message-ID: <20180125074511.GA14162@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jan 24, 2018 at 07:07:53PM -0800, Palmer Dabbelt wrote:
> It looks like this same irqchip registration mechanism has been copied
> into a handful of ports, including aarch64 and openrisc.  I want to use
> this in the RISC-V port, so I thought it would be good to make this
> generic instead.
> 
> This patch simply moves set_handle_irq and handle_arch_irq from arch/arm
> to kernel/irq/handle.c.

The two important changes here are that:

 a) the handle_arch_irq defintion is moved from assembly to C code
 b) it is now marked __ro_after_init

Those should be prominently mentioned in the changelog, and for a
we probably need an explicit ACK from the ARM folks.
