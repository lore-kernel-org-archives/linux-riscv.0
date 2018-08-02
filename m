From: hch@lst.de (Christoph Hellwig)
Date: Thu,  2 Aug 2018 13:49:57 +0200
Subject: simplified RISC-V interrupt and clocksource handling v2
Message-ID: <20180802115008.4031-1-hch@lst.de>
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

    git://git.infradead.org/users/hch/riscv.git riscv-irq-simple.2

Gitweb:

    http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple.2

Changes since v1:
 - rename the plic driver to irq-sifive-plic
 - switch to a default compatible of sifive,plic0 (still supporting the
   riscv,plic0 name for compatibility)
 - add a reference for the SiFive PLIC register layout
 - fix plic_toggle addressing for large numbers of hwirqs
 - remove the call to ack_bad_irq
 - use a raw spinlock for plic_toggle_lock
 - use the irq_desc cpumask in the plic enable/disable methods
 - add back OF contexid parsing in the plic driver
 - don't allow COMPILE_TEST builds of the clocksource driver, as it
   depends on <asm/sbi.h>
 - default the clocksource driver to y
 - clean up naming in the clocksource driver
 - remove the MINDELTA and MAXDELTA #defines
 - various DT binding fixes
