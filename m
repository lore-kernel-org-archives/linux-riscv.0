From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 31 Oct 2018 16:07:13 -0700 (PDT)
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 2 v2
Message-ID: <mhng-ddfcf75a-ffa5-43b1-a785-23da232023ad@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit d26c4bbf992463c043fdee4b3e5efa3f08990862:

  RISC-V: SMP cleanup and new features (2018-10-22 17:41:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-mw2

for you to fetch changes up to ef70696a63c773280ef46f5764a6cda39ef2f383:

  lib: Remove umoddi3 and udivmoddi4 (2018-10-31 12:13:54 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.20 Merge Window, Part 2 v2

This tag contains the follow-on patches I'd like to target for the 4.20
merge window.  I'm being somewhat conservative here, as while there are
a few patches on the mailing list that were posted early in the merge
window I'd like to let those bake for another round -- this was a fairly
big release as far as RISC-V is concerened, and we need to walk before
we can run.

As far as the patches that made it go:

* A patch to ignore offline CPUs when calculating AT_HWCAP.  This should
  fix GDB on the HiFive unleashed, which has an embedded core for hart
  0 which is exposed to Linux as an offline CPU.
* A move of EM_RISCV to elf-em.h, which is where it should have been to
  begin with.
* I've also removed the 64-bit divide routines.  I know I'm not really
  playing by my own rules here because I posted the patches this
  morning, but since they shouldn't be in the kernel I think it's better
  to err on the side of going too fast here.

I don't anticipate any more patch sets for the merge window.

Changes since v1:

* Use a consistent base to merge from so the history isn't a mess.

----------------------------------------------------------------
Andreas Schwab (1):
      RISC-V: properly determine hardware caps

Palmer Dabbelt (4):
      Revert "RISC-V: Select GENERIC_LIB_UMODDI3 on RV32"
      Revert "lib: Add umoddi3 and udivmoddi4 of GCC library routines"
      Move EM_RISCV into elf-em.h
      lib: Remove umoddi3 and udivmoddi4

 arch/riscv/Kconfig             |   1 -
 arch/riscv/include/asm/elf.h   |   3 -
 arch/riscv/kernel/cpufeature.c |   8 +-
 include/uapi/linux/elf-em.h    |   1 +
 lib/Kconfig                    |   3 -
 lib/Makefile                   |   1 -
 lib/udivmoddi4.c               | 310 -----------------------------------------
 lib/umoddi3.c                  |  32 -----
 8 files changed, 6 insertions(+), 353 deletions(-)
 delete mode 100644 lib/udivmoddi4.c
 delete mode 100644 lib/umoddi3.c
