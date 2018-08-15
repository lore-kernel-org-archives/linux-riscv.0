From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 15 Aug 2018 16:56:12 -0700
Subject: [RFC PATCH 0/5] RISC-V: Improve smp functionality & support cpu
 hotplug
Message-ID: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch series implements following smp related features.
Some of the work has been inspired from ARM64.

1. Decouple linux logical cpu ids from hardware cpu id
2. Introduce cpu_operations structure for better flexibility &
  extesnability of future smp enablement methods. It also makes it
  easier to implement different booting algorithms later.
3. Support cpu hotplug.

Tested on QEMU & HighFive Unleashed board with/without SMP enabled.

Atish Patra (5):
  RISC-V: Add logical CPU indexing for RISC-V
  RISC-V: Use Linux logical cpu number instead of hartid
  RISC-V: Add cpu_operatios structure
  RISC-V: Move interrupt cause declarations to irq.h
  RISC-V: Support cpu hotplug.

 arch/riscv/Kconfig                |  12 ++-
 arch/riscv/include/asm/irq.h      |   7 ++
 arch/riscv/include/asm/smp.h      |  42 +++++++++-
 arch/riscv/include/asm/tlbflush.h |  17 +++-
 arch/riscv/kernel/cpu.c           |   4 +-
 arch/riscv/kernel/head.S          |  13 +++
 arch/riscv/kernel/irq.c           |   7 --
 arch/riscv/kernel/process.c       |   7 ++
 arch/riscv/kernel/setup.c         |  27 +++++++
 arch/riscv/kernel/smp.c           |  51 +++++++++---
 arch/riscv/kernel/smpboot.c       | 161 +++++++++++++++++++++++++++++++++-----
 arch/riscv/kernel/traps.c         |   6 +-
 drivers/clocksource/riscv_timer.c |  12 ++-
 drivers/irqchip/irq-sifive-plic.c |  11 ++-
 14 files changed, 325 insertions(+), 52 deletions(-)

-- 
2.7.4
