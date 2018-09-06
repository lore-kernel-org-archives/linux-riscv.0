From: anup@brainfault.org (Anup Patel)
Date: Thu,  6 Sep 2018 18:06:46 +0530
Subject: [PATCH v2 0/5] New RISC-V Local Interrupt Controller Driver
Message-ID: <20180906123651.28500-1-anup@brainfault.org>
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
  5:       1256       1269       1276       1262  RISC-V INTC   5  riscv_timer
  8:          6         15          7         16  SiFive PLIC   8  virtio0
 10:         22         12         12         21  SiFive PLIC  10  ttyS0

The patchset is based up Linux-4.19-rc2 and can be found at
riscv_intc_v2 branch of:
https://github.com/avpatel/linux.git

Changes since v1:
 - Removed changes related to puggable IPI triggering
 - Separate patch for self-contained IPI handling routine
 - Removed patch for GENERIC_IRQ kconfig options
 - Added patch to remove do_IRQ() function
 - Rebased upon Atish's SMP patches

Anup Patel (5):
  RISC-V: self-contained IPI handling routine
  RISC-V: No need to pass scause as arg to do_IRQ()
  irqchip: RISC-V Local Interrupt Controller Driver
  clocksource: riscv_timer: Make timer interrupt as a per-CPU interrupt
  RISC-V: Remove do_IRQ() function

 arch/riscv/Kconfig                |   1 +
 arch/riscv/include/asm/irq.h      |  17 +++-
 arch/riscv/include/asm/smp.h      |   3 +
 arch/riscv/kernel/entry.S         |   5 +-
 arch/riscv/kernel/irq.c           |  47 +---------
 arch/riscv/kernel/smp.c           |  11 ++-
 drivers/clocksource/riscv_timer.c |  78 ++++++++++++----
 drivers/irqchip/Kconfig           |  15 ++-
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-riscv-intc.c  | 148 ++++++++++++++++++++++++++++++
 drivers/irqchip/irq-sifive-plic.c |  20 +++-
 include/linux/cpuhotplug.h        |   1 +
 12 files changed, 273 insertions(+), 74 deletions(-)
 create mode 100644 drivers/irqchip/irq-riscv-intc.c

-- 
2.17.1
