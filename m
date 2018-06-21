From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:41:40 +0800
Subject: [PATCH 0/5] Building for 32-bit RISC-V kernel
Message-ID: <cover.1529506497.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

These patches are for building 32-bit RISC-V kernel.
 - Fix the compile errors and warnings on RV32I.
 - Fix some incompatible problem on RV32I.
 - Add format.h for compatible of print format.


Zong Li (5):
  RISC-V: Add conditional macro for zone of DMA32
  RISC-V: Select GENERIC_UCMPDI2 on RV32I
  RISC-V: Add definiion of extract symbol's index and type for 32-bit
  RISC-V: Change variable type for 32-bit compatible
  RISC-V: Use fixed width integer types for 32-bit compatible

 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/format.h   | 20 ++++++++++++++++++++
 arch/riscv/include/uapi/asm/elf.h |  9 +++++++--
 arch/riscv/kernel/module.c        | 35 ++++++++++++++++++-----------------
 arch/riscv/mm/init.c              |  3 +++
 5 files changed, 49 insertions(+), 19 deletions(-)
 create mode 100644 arch/riscv/include/asm/format.h

-- 
2.16.1
