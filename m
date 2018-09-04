From: anup@brainfault.org (Anup Patel)
Date: Tue,  4 Sep 2018 18:15:09 +0530
Subject: [RFC PATCH 0/5] New RISC-V Local Interrupt Controller Driver
Message-ID: <20180904124514.6290-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patchset provides a new RISC-V Local Interrupt Controller Driver
for managing per-CPU local interrupts. The overall approach is inspired
from the way per-CPU local interrupts are handled by Linux ARM64 and
ARM GICv3 driver.

Few advantages of having this new driver are as follows:
1. It registers all local interrupts as per-CPU interrupts
2. We can develop drivers for devices with per-CPU local interrupts
without changing arch code or this driver
3. It allows local interrupt controller DT node under each CPU DT node
as well as single system-wide DT node for local interrupt controller.

With this patchset, output of "cat /proc/interrupts" looks as follows:
           CPU0       CPU1       CPU2       CPU3       
  5:        995       1012        997       1015  RISC-V INTC   5 Edge      riscv_timer
  8:         23          6         10          7  SiFive PLIC   8 Edge      virtio0
 10:          9         10          5          4  SiFive PLIC  10 Edge      ttyS0

The patchset is based up Linux-4.19-rc2 and can be found at
riscv_intc_v1 branch of:
https://github.com/avpatel/linux.git

Anup Patel (5):
  RISC-V: Make IPI triggering flexible
  RISC-V: No need to pass scause as arg to do_IRQ()
  RISC-V: Select useful GENERIC_IRQ kconfig options
  irqchip: RISC-V Local Interrupt Controller Driver
  clocksource: riscv_timer: Make timer interrupt as a per-CPU interrupt

 arch/riscv/Kconfig                |   4 +
 arch/riscv/include/asm/irq.h      |  16 ++-
 arch/riscv/include/asm/smp.h      |  10 ++
 arch/riscv/kernel/entry.S         |   1 -
 arch/riscv/kernel/irq.c           |  45 +--------
 arch/riscv/kernel/smp.c           |  23 ++++-
 drivers/clocksource/riscv_timer.c |  76 ++++++++++++---
 drivers/irqchip/Kconfig           |  15 ++-
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-riscv-intc.c  | 156 ++++++++++++++++++++++++++++++
 drivers/irqchip/irq-sifive-plic.c |  21 +++-
 include/linux/cpuhotplug.h        |   1 +
 12 files changed, 301 insertions(+), 68 deletions(-)
 create mode 100644 drivers/irqchip/irq-riscv-intc.c

-- 
2.17.1
