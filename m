From: atish.patra@wdc.com (Atish Patra)
Date: Thu,  6 Sep 2018 01:05:23 -0700
Subject: [PATCH v3 00/12] SMP cleanup and new features 
Message-ID: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch series has updated the assorted cleanup series by palmer.
The original cleanup patch series can be found here.
http://lists.infradead.org/pipermail/linux-riscv/2018-August/001232.html

It also implemented following smp related features.
Some of the work has been inspired from ARM64.

1. Decouple linux logical cpu ids from hardware cpu id
2. Support cpu hotplug.

Tested on QEMU & HighFive Unleashed board with/without SMP enabled.

Both the patch series have been combined to avoid conflicts as a lot
of common code is changed in both the series. I have mostly addressed
review comments and fixed checkpatch errors from palmer's series.

Palmer: I hope it's not a problem. I would be happy to drop the patches
if you want to take over.

v1->v2:

1. Dropped cpu_ops patch.
2. Moved back IRQ cause definitions to irq.h
3. Keep boot cpu hart id and assign zero as the cpu id for boot cpu.
4. Renamed cpu id and hart id correctly.

v2-v3:

1. Added cleanup patches from palmer.
2. Moved the hotplug related functions to it's own file.
3. Updated stub functions as per coding guidelines.
4. Renamed __cpu_logical_map to a more coherent name.

Atish Patra (5):
  RISC-V: Disable preemption before enabling interrupts
  RISC-V: User WRITE_ONCE instead of direct access
  RISC-V: Add logical CPU indexing for RISC-V
  RISC-V: Use Linux logical cpu number instead of hartid
  RISC-V: Support cpu hotplug.

Palmer Dabbelt (7):
  RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
  RISC-V: Filter ISA and MMU values in cpuinfo
  RISC-V: Comment on the TLB flush in smp_callin()
  RISC-V: Provide a cleaner raw_smp_processor_id()
  RISC-V: Rename riscv_of_processor_hart to riscv_of_processor_hartid
  RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
  RISC-V: Use mmgrab()

 arch/riscv/Kconfig                 | 12 +++++-
 arch/riscv/include/asm/irq.h       |  1 +
 arch/riscv/include/asm/processor.h |  2 +-
 arch/riscv/include/asm/smp.h       | 66 +++++++++++++++++++++++++-----
 arch/riscv/include/asm/tlbflush.h  | 16 ++++++--
 arch/riscv/kernel/Makefile         |  1 +
 arch/riscv/kernel/cacheinfo.c      |  7 ----
 arch/riscv/kernel/cpu-hotplug.c    | 72 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpu.c            | 83 ++++++++++++++++++++++++++++++++------
 arch/riscv/kernel/head.S           | 17 +++++++-
 arch/riscv/kernel/irq.c            | 24 +++++++++++
 arch/riscv/kernel/setup.c          | 27 ++++++++++++-
 arch/riscv/kernel/smp.c            | 49 +++++++++++++++-------
 arch/riscv/kernel/smpboot.c        | 53 ++++++++++++++++--------
 arch/riscv/kernel/traps.c          |  6 +--
 drivers/clocksource/riscv_timer.c  | 12 ++++--
 drivers/irqchip/irq-sifive-plic.c  | 10 +++--
 17 files changed, 379 insertions(+), 79 deletions(-)
 create mode 100644 arch/riscv/kernel/cpu-hotplug.c

-- 
2.7.4
