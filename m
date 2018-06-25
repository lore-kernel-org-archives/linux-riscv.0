From: zong@andestech.com (Zong Li)
Date: Mon, 25 Jun 2018 16:49:36 +0800
Subject: [PATCH v2 0/4] Building for 32-bit RISC-V kernel
Message-ID: <cover.1529915117.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

These patches for building 32-bit RISC-V kernel.
 - Fix the compile errors and warnings on RV32I.
 - Fix some incompatible problem on RV32I.
 - Add format.h for compatible of print format.

The fixed width integer types format for Elf_Addr will move to
generic header by another patch. For now, there are some warning
about unexpected argument of type on RV32I.

Change in v1:
 - Fix some error in v1
 - Remove implementation of fixed width integer types format for Elf_Addr.

Zong Li (4):
  RISC-V: Add conditional macro for zone of DMA32
  RISC-V: Select GENERIC_UCMPDI2 on RV32I
  RISC-V: Add definiion of extract symbol's index and type for 32-bit
  RISC-V: Change variable type for 32-bit compatible

 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/uapi/asm/elf.h |  9 +++++++--
 arch/riscv/kernel/module.c        | 22 +++++++++++-----------
 arch/riscv/mm/init.c              |  2 ++
 4 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.16.1
