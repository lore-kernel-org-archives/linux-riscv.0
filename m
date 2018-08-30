From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 29 Aug 2018 17:32:05 -0700 (PDT)
Subject: [GIT PULL] RISC-V Fixes and Cleanups for 4.19-rc2
Message-ID: <mhng-ffc7dae9-c6aa-4209-8baa-7f23a8d6d33d@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc2

for you to fetch changes up to 47d80a68f10d3290204a12f7836a9a8190dfc327:

  RISC-V: Use a less ugly workaround for unused variable warnings (2018-08-28 12:58:36 -0700)

----------------------------------------------------------------
RISC-V Fixes and Cleanups for 4.19-rc2

This tag contains a handful of patches that filtered their way in during
the merge window but just didn't make the deadline.  It includes:

* Additional documentation in the riscv,cpu-intc device tree binding
  that resulted from some feedback I missed in the original patch set.
* A build fix that provides the definition of tlb_flush() before
  including tlb.h, which fixes a RISC-V build regression introduced
  during this merge window.
* A cosmetic cleanup to sys_riscv_flush_icache().

----------------------------------------------------------------
Palmer Dabbelt (2):
      dt-bindings: riscv,cpu-intc: Cleanups from a missed review
      RISC-V: Use a less ugly workaround for unused variable warnings

Will Deacon (1):
      riscv: tlb: Provide definition of tlb_flush() before including tlb.h

 .../bindings/interrupt-controller/riscv,cpu-intc.txt      | 14 +++++++++++---
 arch/riscv/include/asm/tlb.h                              |  4 ++++
 arch/riscv/kernel/sys_riscv.c                             | 15 +--------------
 3 files changed, 16 insertions(+), 17 deletions(-)
