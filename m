From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 04 Jul 2018 14:25:07 -0700 (PDT)
Subject: [GIT PULL] RISC-V Fixus for 4.18-rc4
Message-ID: <mhng-daf6638a-82c4-40ad-b63c-d3d205b6f556@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 021c91791a5e7e85c567452f1be3e4c2c6cb6063:

  Linux 4.18-rc3 (2018-07-01 16:04:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.18-rc4

for you to fetch changes up to 9a6a51154f8be90a76f6a8ea8809115c11cec9dd:

  RISC-V: Fix the rv32i kernel build (2018-07-04 14:12:53 -0700)

----------------------------------------------------------------
RISC-V Fixus for 4.18-rc4

This patch set contains a handful of fixes for the RISC-V port:

* A fix to R_RISCV_ADD32/R_RISCV_SUB32 relocations that allows modules
  that use these to load correctly.
* The removal of of_platform_populate(), which is obselete.
* The removal of irq-riscv-intc.h, which is obselete.
* A fix to PTRACE_SETREGSET.
* Fixes that allow the RV32I kernel to build (at least for Zong, I've
  got another patch on the mailing list that's necessary on my setup
  :)).

I've just given these a defconfig build test.

----------------------------------------------------------------
Andreas Schwab (1):
      RISC-V: fix R_RISCV_ADD32/R_RISCV_SUB32 relocations

Jim Wilson (1):
      RISC-V: Fix PTRACE_SETREGSET bug.

Palmer Dabbelt (2):
      RISC-V: Don't include irq-riscv-intc.h
      RISC-V: Fix the rv32i kernel build

Rob Herring (1):
      riscv: remove unnecessary of_platform_populate call

Zong Li (4):
      RISC-V: Add conditional macro for zone of DMA32
      RISC-V: Select GENERIC_UCMPDI2 on RV32I
      RISC-V: Add definiion of extract symbol's index and type for 32-bit
      RISC-V: Change variable type for 32-bit compatible

 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/uapi/asm/elf.h |  9 +++++++--
 arch/riscv/kernel/irq.c           |  4 ----
 arch/riscv/kernel/module.c        | 26 +++++++++++++-------------
 arch/riscv/kernel/ptrace.c        |  2 +-
 arch/riscv/kernel/setup.c         |  5 -----
 arch/riscv/mm/init.c              |  2 ++
 7 files changed, 24 insertions(+), 25 deletions(-)
