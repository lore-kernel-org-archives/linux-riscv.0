From: hch@lst.de (Christoph Hellwig)
Date: Thu, 26 Jul 2018 16:37:14 +0200
Subject: RFC: simplified RISC-V interrupt and clocksource handling
Message-ID: <20180726143723.16585-1-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This series tries adds support for interrupt handling and timers
for the RISC-V architecture.

The basic per-hart interrupt handling implemented by the scause
and sie CSRs is extremely simple and implemented directly in
arch/riscv/kernel/irq.c.  In addition there is a irqchip driver
for the PLIC external interrupt controller, which is called through
the set_handle_irq API, and a clocksource driver that gets its
timer interrupt directly from the low-level interrupt handling.

Compared to previous iterations this version does not try to use an
irqchip driver for the low-level interrupt handling.  This saves
a couple indirect calls and an additional read of the scause CSR
in the hot path, makes the code much simpler and last but not least
avoid the dependency on a device tree for a mandatory architectural
feature.

A git tree is available here (contains a few more patches before
the ones in this series)

    git://git.infradead.org/users/hch/riscv.git riscv-irq-simple

Gitweb:

    http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple
