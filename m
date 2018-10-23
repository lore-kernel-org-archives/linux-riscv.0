From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 22 Oct 2018 18:20:11 -0700 (PDT)
Subject: [PULL RFC] RISC-V Patches for the 4.20 Merge Window, Part 1
Message-ID: <mhng-737b95bd-3a5b-44c7-ac14-3af4bbcca32e@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 84df9525b0c27f3ebc2ebb1864fa62a97fdedb7d:

  Linux 4.19 (2018-10-22 07:37:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-mw0

for you to fetch changes up to d26c4bbf992463c043fdee4b3e5efa3f08990862:

  RISC-V: SMP cleanup and new features (2018-10-22 17:41:43 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.20 Merge Window, Part 1

This patch set contains a lot (at least, for me) of improvements to the
RISC-V kernel port:

* The removal of some cacheinfo values that were bogus.
* On systems with F but without D the kernel will not show the F
  extension to userspace, as it isn't actually supported.
* Support for futexes.
* Removal of some unused code.
* Cleanup of some menuconfig entries.
* Support for systems without a floating-point unit, and for building
  kernels that will never use the floating-point unit.
* More fixes to the RV32I port, which regressed again.  It's really time
  to get this into a regression test somewhere so I stop breaking it.
  Thanks to Zong for resurrecting it again!
* Various fixes that resulted from a year old review of our original
  patch set that I finally got around to.
* Various improvements to SMP support, largely based around having
  switched to logical hart numbering, as well as some interrupt
  improvements.  This one is in the same patch set as above, thanks to
  Atish for sheparding everything though as my patch set was a bit of a
  mess.

I'm pretty sure this is our largest patch set since the original kernel
contribution, and it's certainly the one with the most contributors.
While I don't have anything else I know I'm going to submit for the
merge window, I would be somewhat surprised if I didn't screw anything
up.

Thanks for the help, everyone!

----------------------------------------------------------------
Alan Kao (5):
      Extract FPU context operations from entry.S
      Refactor FPU code in signal setup/return procedures
      Cleanup ISA string setting
      Allow to disable FPU support
      Auto-detect whether a FPU exists

Anup Patel (3):
      RISC-V: No need to pass scause as arg to do_IRQ()
      RISC-V: Show CPU ID and Hart ID separately in /proc/cpuinfo
      RISC-V: Show IPI stats

Atish Patra (4):
      RISC-V: Disable preemption before enabling interrupts
      RISC-V: Use WRITE_ONCE instead of direct access
      RISC-V: Add logical CPU indexing for RISC-V
      RISC-V: Use Linux logical CPU number instead of hartid

Christoph Hellwig (1):
      RISC-V: remove the unused return_to_handler export

Jim Wilson (2):
      RISC-V: Add FP register ptrace support for gdb.
      RISC-V: Add futex support.

Masahiro Yamada (1):
      riscv: move GCC version check for ARCH_SUPPORTS_INT128 to Kconfig

Nick Kossifidis (1):
      RISC-V: Cosmetic menuconfig changes

Palmer Dabbelt (12):
      RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
      RISC-V: Filter ISA and MMU values in cpuinfo
      RISC-V: Comment on the TLB flush in smp_callin()
      RISC-V: Provide a cleaner raw_smp_processor_id()
      RISC-V: Rename riscv_of_processor_hart to riscv_of_processor_hartid
      RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
      RISC-V: Use mmgrab()
      RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
      RISC-V: Mask out the F extension on systems without D
      riscv: Add support to no-FPU systems
      RISC-V: Fix some RV32 bugs and build failures
      RISC-V: SMP cleanup and new features

Vincent Chen (1):
      RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap

Zong Li (4):
      RISC-V: Build tishift only on 64-bit
      RISC-V: Use swiotlb on RV64 only
      lib: Add umoddi3 and udivmoddi4 of GCC library routines
      RISC-V: Select GENERIC_LIB_UMODDI3 on RV32

 arch/riscv/Kconfig                 |  52 ++++++-
 arch/riscv/Kconfig.debug           |  35 -----
 arch/riscv/Makefile                |  21 +--
 arch/riscv/include/asm/Kbuild      |   1 -
 arch/riscv/include/asm/futex.h     | 128 +++++++++++++++
 arch/riscv/include/asm/processor.h |   2 +-
 arch/riscv/include/asm/smp.h       |  47 ++++--
 arch/riscv/include/asm/switch_to.h |  12 +-
 arch/riscv/include/asm/tlbflush.h  |  16 +-
 arch/riscv/include/uapi/asm/elf.h  |   3 +
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/cacheinfo.c      |   7 -
 arch/riscv/kernel/cpu.c            |  87 +++++++++--
 arch/riscv/kernel/cpufeature.c     |  15 ++
 arch/riscv/kernel/entry.S          |  88 -----------
 arch/riscv/kernel/fpu.S            | 106 +++++++++++++
 arch/riscv/kernel/head.S           |   4 +-
 arch/riscv/kernel/irq.c            |  12 +-
 arch/riscv/kernel/mcount.S         |   1 -
 arch/riscv/kernel/process.c        |   6 +-
 arch/riscv/kernel/ptrace.c         |  52 +++++++
 arch/riscv/kernel/setup.c          |  13 ++
 arch/riscv/kernel/signal.c         |  75 +++++----
 arch/riscv/kernel/smp.c            |  82 ++++++++--
 arch/riscv/kernel/smpboot.c        |  46 ++++--
 arch/riscv/lib/Makefile            |   3 +-
 arch/riscv/mm/ioremap.c            |   2 +-
 drivers/clocksource/riscv_timer.c  |  12 +-
 drivers/irqchip/irq-sifive-plic.c  |  10 +-
 lib/Kconfig                        |   3 +
 lib/Makefile                       |   1 +
 lib/udivmoddi4.c                   | 310 +++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c                      |  32 ++++
 33 files changed, 1039 insertions(+), 246 deletions(-)
 create mode 100644 arch/riscv/include/asm/futex.h
 create mode 100644 arch/riscv/kernel/fpu.S
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c
