From: atish.patra@wdc.com (Atish Patra)
Date: Tue,  2 Oct 2018 12:14:53 -0700
Subject: [PATCH v6 00/14] SMP cleanup and new features
Message-ID: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch series now has evolved to contain several related changes.

1. Updated the assorted cleanup series by palmer.
The original cleanup patch series can be found here.
http://lists.infradead.org/pipermail/linux-riscv/2018-August/001232.html

2. Implemented decoupling linux logical CPU ids from hart id.
Some of the work has been inspired from ARM64.
Tested on QEMU & HighFive Unleashed board with/without SMP enabled.

3. Included Anup's cleanup and IPI stat patch.

All the patch series have been combined to avoid conflicts as a lot
of common code is changed different patch sets. I have mostly addressed
review comments and fixed checkpatch errors from palmer's and anup's series.

v1->v2:

1. Dropped cpu_ops patch.
2. Moved back IRQ cause definitions to irq.h
3. Keep boot CPU hart id and assign zero as the CPU id for boot CPU.
4. Renamed CPU id and hart id correctly.

v2-v3:

1. Added cleanup patches from palmer.
2. Moved the hotplug related functions to it's own file.
3. Updated stub functions as per coding guidelines.
4. Renamed __cpu_logical_map to a more coherent name.

v3-v4:

1. Addressed minor typos in commit text and code.
2. Included Anup's do_IRQ patch.
3. Dropped CPU hotplug patch. As there are some concerns
   about approach, I will submit it separately.

v4->v5:

1. Minor typo fixes in commit text.

v5->v6:
1. Included Anup's IPI stat and cpuinfo patch.
2. Fixed a typo cpuid_to_hardid_map->cpuid_to_hartid_map 


Anup Patel (3):
  RISC-V: No need to pass scause as arg to do_IRQ()
  RISC-V: Show CPU ID and Hart ID separately in /proc/cpuinfo
  RISC-V: Show IPI stats

Atish Patra (4):
  RISC-V: Disable preemption before enabling interrupts
  RISC-V: Use WRITE_ONCE instead of direct access
  RISC-V: Add logical CPU indexing for RISC-V
  RISC-V: Use Linux logical CPU number instead of hartid

Palmer Dabbelt (7):
  RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
  RISC-V: Filter ISA and MMU values in cpuinfo
  RISC-V: Comment on the TLB flush in smp_callin()
  RISC-V: Provide a cleaner raw_smp_processor_id()
  RISC-V: Rename riscv_of_processor_hart to riscv_of_processor_hartid
  RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
  RISC-V: Use mmgrab()

 arch/riscv/include/asm/processor.h |  2 +-
 arch/riscv/include/asm/smp.h       | 47 +++++++++++++++-----
 arch/riscv/include/asm/tlbflush.h  | 16 +++++--
 arch/riscv/kernel/cacheinfo.c      |  7 ---
 arch/riscv/kernel/cpu.c            | 87 ++++++++++++++++++++++++++++++++------
 arch/riscv/kernel/entry.S          |  1 -
 arch/riscv/kernel/head.S           |  4 +-
 arch/riscv/kernel/irq.c            | 12 +++++-
 arch/riscv/kernel/setup.c          | 10 +++++
 arch/riscv/kernel/smp.c            | 82 ++++++++++++++++++++++++++++-------
 arch/riscv/kernel/smpboot.c        | 46 ++++++++++++++------
 drivers/clocksource/riscv_timer.c  | 12 ++++--
 drivers/irqchip/irq-sifive-plic.c  | 10 +++--
 13 files changed, 259 insertions(+), 77 deletions(-)

-- 
2.7.4
