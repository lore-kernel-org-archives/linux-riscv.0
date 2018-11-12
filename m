From: zongbox@gmail.com (Zong Li)
Date: Mon, 12 Nov 2018 12:07:42 +0800
Subject: [PATCH 0/2] Fix some issue on RV32
Message-ID: <cover.1541995312.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patches fix the build fail and kernel module install failed on RV32.

Zong Li (2):
  RISC-V: Request stat64 on RV32
  RISC-V: Support MODULE_SECTIONS mechanism on RV32

 arch/riscv/Kconfig                  |  2 +-
 arch/riscv/include/asm/module.h     | 28 +++++++++++++++-------------
 arch/riscv/include/asm/unistd.h     |  1 +
 arch/riscv/kernel/module-sections.c | 30 ++++++++++++++++--------------
 4 files changed, 33 insertions(+), 28 deletions(-)

-- 
2.7.4
