From: alankao@andestech.com (Alan Kao)
Date: Thu, 2 Aug 2018 13:39:47 +0800
Subject: [PATCH v3 0/4] riscv: Add support to no-FPU systems
Message-ID: <1533188391-5932-1-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patchset adds an option, CONFIG_FPU, to enable/disable floating-
point procedures.

Changes in v3:
 - Refactor the whole patch into independent ones.

Changes in v2:
 - Various code cleanups and style fixes.

Alan Kao (4):
  Extract FPU context operations from entry.S
  Refactor FPU codes in signal setup/return procedures
  Cleanup ISA string setting
  Add an option to support no-FPU systems

 arch/riscv/Kconfig                 |   9 +++
 arch/riscv/Makefile                |  19 +++---
 arch/riscv/include/asm/switch_to.h |  12 ++++
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/entry.S          |  87 ------------------------
 arch/riscv/kernel/fpu.S            | 105 +++++++++++++++++++++++++++++
 arch/riscv/kernel/process.c        |   4 +-
 arch/riscv/kernel/signal.c         |  70 +++++++++++--------
 8 files changed, 181 insertions(+), 126 deletions(-)
 create mode 100644 arch/riscv/kernel/fpu.S

-- 
2.18.0
