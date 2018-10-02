From: zongbox@gmail.com (Zong Li)
Date: Tue,  2 Oct 2018 16:52:26 +0800
Subject: [PATCH v3 0/5] Fix some bugs on RV32 build fail and issue
Message-ID: <cover.1538387524.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patches contain the modificaion as follows:
1. Fix up the building fail on RV32.
2. Add umoddi3 and udivmoddi4 functions for RV32.
3. Fix ioremap problem on RV32.

Changes in v3:
 - Change the copyright notices to GPLv2 from  gcc 4.2.1.

Changes in v2:
 - Retain the copyright notices from libgcc in umoddi3.c and udivmoddi4.c.

Vincent Chen (1):
  RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap

Zong Li (4):
  RISC-V: Build tishift only on 64-bit
  RISC-V: Use swiotlb on RV64 only
  lib: Add umoddi3 and udivmoddi4 of GCC library routines
  RISC-V: Select GENERIC_LIB_UMODDI3 on RV32

 arch/riscv/Kconfig        |   1 +
 arch/riscv/kernel/setup.c |   3 +
 arch/riscv/lib/Makefile   |   3 +-
 arch/riscv/mm/ioremap.c   |   2 +-
 lib/Kconfig               |   3 +
 lib/Makefile              |   1 +
 lib/udivmoddi4.c          | 310 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c             |  32 +++++
 8 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c

-- 
2.7.4
