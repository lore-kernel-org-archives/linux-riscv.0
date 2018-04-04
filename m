From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 04 Apr 2018 09:45:41 -0700 (PDT)
Subject: [GIT PULL] RISC-V changes for 4.17
Message-ID: <mhng-ac10695e-e25f-4443-9a68-2b7252d9e6d8@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 0adb32858b0bddf4ada5f364a84ed60b196dbcda:

  Linux 4.16 (2018-04-01 14:20:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.17-mw0

for you to fetch changes up to f6a11d9febad1f308fe4119a54b92e335e7c8032:

  RISC-V: Rename CONFIG_CMDLINE_OVERRIDE to CONFIG_CMDLINE_FORCE (2018-04-03 09:48:27 -0700)

----------------------------------------------------------------
RISC-V changes for 4.17

This tag contains the new features we'd like to incorporate into the
RISC-V port for 4.17.  We might have a bit more stuff land later in the
merge window, but I wanted to get this out earlier just so everyone can
see where we currently stand.

A short summary of the changes is:

* We've added support for dynamic ftrace on RISC-V targets.
* There have been a handful of cleanups to our atomic and locking
  routines.  They now more closely match the released RISC-V memory
  model draft.
* Our module loading support has been cleaned up and is now enabled by
  default, despite some limitations still existing.
* A patch to define COMMANDLINE_FORCE instead of COMMANDLINE_OVERRIDE so
  the generic device tree code picks up handling all our command line
  stuff.

There's more information in the merge commits for each patch set.

----------------------------------------------------------------
Alan Kao (6):
      riscv/ftrace: Add RECORD_MCOUNT support
      riscv/ftrace: Add dynamic function tracer support
      riscv/ftrace: Add dynamic function graph tracer support
      riscv/ftrace: Add ARCH_SUPPORTS_FTRACE_OPS support
      riscv/ftrace: Add DYNAMIC_FTRACE_WITH_REGS support
      riscv/ftrace: Add HAVE_FUNCTION_GRAPH_RET_ADDR_PTR support

Andrea Parri (3):
      riscv/barrier: Define __smp_{store_release,load_acquire}
      riscv/spinlock: Strengthen implementations with fences
      riscv/atomic: Strengthen implementations with fences

Palmer Dabbelt (4):
      RISC-V: Add dynamic ftrace support for RISC-V platforms
      RISC-V: Assorted memory model fixes
      RISC-V: Fixes to module loading
      RISC-V: Rename CONFIG_CMDLINE_OVERRIDE to CONFIG_CMDLINE_FORCE

Zong Li (11):
      RISC-V: Add sections of PLT and GOT for kernel module
      RISC-V: Add section of GOT.PLT for kernel module
      RISC-V: Support GOT_HI20/CALL_PLT relocation type in kernel module
      RISC-V: Support CALL relocation type in kernel module
      RISC-V: Support HI20/LO12_I/LO12_S relocation type in kernel module
      RISC-V: Support RVC_BRANCH/JUMP relocation type in kernel modulewq
      RISC-V: Support ALIGN relocation type in kernel module
      RISC-V: Support ADD32 relocation type in kernel module
      RISC-V: Support SUB32 relocation type in kernel module
      RISC-V: Enable module support in defconfig
      RISC-V: Add definition of relocation types

 arch/riscv/Kconfig                  |  12 +-
 arch/riscv/Makefile                 |   8 +
 arch/riscv/configs/defconfig        |   2 +
 arch/riscv/include/asm/atomic.h     | 417 +++++++++++++++++++++++-------------
 arch/riscv/include/asm/barrier.h    |  15 ++
 arch/riscv/include/asm/cmpxchg.h    | 391 +++++++++++++++++++++++++++------
 arch/riscv/include/asm/fence.h      |  12 ++
 arch/riscv/include/asm/ftrace.h     |  56 +++++
 arch/riscv/include/asm/module.h     | 113 ++++++++++
 arch/riscv/include/asm/spinlock.h   |  29 +--
 arch/riscv/include/uapi/asm/elf.h   |   7 +
 arch/riscv/kernel/Makefile          |   6 +-
 arch/riscv/kernel/ftrace.c          | 175 ++++++++++++++-
 arch/riscv/kernel/mcount-dyn.S      | 239 +++++++++++++++++++++
 arch/riscv/kernel/mcount.S          |  22 +-
 arch/riscv/kernel/module-sections.c | 156 ++++++++++++++
 arch/riscv/kernel/module.c          | 179 +++++++++++++++-
 arch/riscv/kernel/module.lds        |   8 +
 arch/riscv/kernel/stacktrace.c      |   6 +
 scripts/recordmcount.pl             |   5 +
 20 files changed, 1603 insertions(+), 255 deletions(-)
 create mode 100644 arch/riscv/include/asm/fence.h
 create mode 100644 arch/riscv/include/asm/module.h
 create mode 100644 arch/riscv/kernel/mcount-dyn.S
 create mode 100644 arch/riscv/kernel/module-sections.c
 create mode 100644 arch/riscv/kernel/module.lds
