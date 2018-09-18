From: zongbox@gmail.com (Zong Li)
Date: Tue, 18 Sep 2018 17:19:12 +0800
Subject: [PATCH 0/5] Fix some bugs on RV32 build fail and issue.
Message-ID: <cover.1537260207.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patches fix up the building fail, less function and other issue on RV32.

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
 lib/udivmoddi4.c          | 291 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c             |  16 +++
 8 files changed, 318 insertions(+), 2 deletions(-)
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c

-- 
2.7.4
