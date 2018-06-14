From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 14 Jun 2018 16:26:08 -0700 (PDT)
Subject: [GIT PULL] RISC-V Updates for the 4.18 Merge Window
Message-ID: <mhng-b162bf1e-c74e-4102-976b-8a60a06afcdd@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 29dcea88779c856c7dc92040a0c01233263101d4:

  Linux 4.17 (2018-06-03 14:15:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.18-merge_window

for you to fetch changes up to 24a130ccfe58e0ef7907ce63030ad0ff7d7c633b:

  RISC-V: Add CONFIG_HVC_RISCV_SBI=y to defconfig (2018-06-11 09:16:24 -0700)

----------------------------------------------------------------
RISC-V Updates for the 4.18 Merge Window

This tag contains some small RISC-V updates I'd like to target for 4.18.
They are all fairly small this time.  Here's a short summary, there's
more info in the commits/merges.

* A fix to __clear_user to respect the passed arguments.
* Enough support for the perf subsystem to work with RISC-V's ISA
  defined performance counters.
* Support for sparse and cleanups suggested by it.
* Support for R_RISCV_32 (a relocation, not the 32-bit ISA).
* Some MAINTAINERS cleanups.
* The addition of CONFIG_HVC_RISCV_SBI to our defconfig, as it's always
  present.

I've given these a simple build+boot test.

----------------------------------------------------------------
Alan Kao (4):
      riscv: Fix the bug in memory access fixup code
      perf: riscv: preliminary RISC-V support
      perf: riscv: Add Document for Future Porting Guide
      riscv/ftrace: Export _mcount when DYNAMIC_FTRACE isn't set

Andreas Schwab (1):
      RISC-V: Handle R_RISCV_32 in modules

Luc Van Oostenryck (4):
      riscv: use NULL instead of a plain 0
      riscv: no __user for probe_kernel_address()
      riscv: split the declaration of __copy_user
      riscv: add riscv-specific predefines to CHECKFLAGS

Palmer Dabbelt (6):
      MAINTAINERS: Add myself as a maintainer for SiFive's drivers
      MAINTAINERS: Update Albert's email, he's back at Berkeley
      RISC-V: Preliminary Perf Support
      MAINTAINERS: RISC-V Updates
      RISC-V: Make our port sparse-clean
      RISC-V: Add CONFIG_HVC_RISCV_SBI=y to defconfig

 Documentation/riscv/pmu.txt         | 249 ++++++++++++++++++
 MAINTAINERS                         |  10 +-
 arch/riscv/Kconfig                  |  14 ++
 arch/riscv/Makefile                 |   3 +
 arch/riscv/configs/defconfig        |   1 +
 arch/riscv/include/asm/Kbuild       |   1 +
 arch/riscv/include/asm/cacheflush.h |   2 +-
 arch/riscv/include/asm/perf_event.h |  84 +++++++
 arch/riscv/include/asm/tlbflush.h   |   2 +-
 arch/riscv/include/asm/uaccess.h    |   8 +-
 arch/riscv/kernel/Makefile          |   2 +
 arch/riscv/kernel/mcount.S          |   2 +-
 arch/riscv/kernel/module.c          |  12 +
 arch/riscv/kernel/perf_event.c      | 485 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/riscv_ksyms.c     |   3 +-
 arch/riscv/kernel/traps.c           |   2 +-
 arch/riscv/lib/uaccess.S            |  19 +-
 17 files changed, 884 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/riscv/pmu.txt
 create mode 100644 arch/riscv/include/asm/perf_event.h
 create mode 100644 arch/riscv/kernel/perf_event.c
