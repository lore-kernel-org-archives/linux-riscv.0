From: atish.patra@wdc.com (Atish Patra)
Date: Thu, 26 Jul 2018 16:38:43 -0700
Subject: RFC: simplified RISC-V interrupt and clocksource handling
In-Reply-To: <20180726143723.16585-1-hch@lst.de>
References: <20180726143723.16585-1-hch@lst.de>
Message-ID: <dc346650-0b48-3c2b-9190-b87ea6987e37@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 7/26/18 7:37 AM, Christoph Hellwig wrote:
> This series tries adds support for interrupt handling and timers
> for the RISC-V architecture.
> 
> The basic per-hart interrupt handling implemented by the scause
> and sie CSRs is extremely simple and implemented directly in
> arch/riscv/kernel/irq.c.  In addition there is a irqchip driver
> for the PLIC external interrupt controller, which is called through
> the set_handle_irq API, and a clocksource driver that gets its
> timer interrupt directly from the low-level interrupt handling.
> 
> Compared to previous iterations this version does not try to use an
> irqchip driver for the low-level interrupt handling.  This saves
> a couple indirect calls and an additional read of the scause CSR
> in the hot path, makes the code much simpler and last but not least
> avoid the dependency on a device tree for a mandatory architectural
> feature.
> 
I agree that this code is much simpler than HLIC code.
Few doubts though

1. As per my understanding, timer interrupt now can't be registered as a 
Linux IRQ now. Thus, /proc/interrupts will not be automatically 
populated for timer interrupt stats. Am I wrong in my assumption?

2. The future version of local interrupt controller known as Core Level 
Interrupt Controller aka CLIC. Do we have to change the current design
again for CLIC in future?

Here are the docs:
https://github.com/sifive/clic-spec/blob/master/clic.adoc

Regards,
Atish
> A git tree is available here (contains a few more patches before
> the ones in this series)
> 
>      git://git.infradead.org/users/hch/riscv.git riscv-irq-simple
> 
> Gitweb:
> 
>      http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple
> 
