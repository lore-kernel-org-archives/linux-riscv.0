From: alankao@andestech.com (Alan Kao)
Date: Mon, 27 Aug 2018 09:07:50 +0800
Subject: [PATCH v7 0/5] riscv: Add support to no-FPU systems
Message-ID: <1535332075-5727-1-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patchset adds an option, CONFIG_FPU, to enable/disable floating-
point procedures.

Kernel's new behavior will be as follows:

* with CONFIG_FPU=y
  All FPU codes are reserved.  If no FPU is found during booting, a
  global flag will be set, and those functions will be bypassed with
  condition check to that flag.

* with CONFIG_FPU=n
  No floating-point instructions in kernel and all related settings
  are excluded.

Changes in v7:
 - Remove "fd" attribute from KBUILD_CFLAGS.

Changes in v6 (PATCH 0005 only):
 - Make the flag checking neater.

Changes in v5:
 - Invert the polarity of checking flag from no_fpu to has_fpu.

Changes in v4:
 - Append a new patch to detect existence of FPU and followups.
 - Add SPDX header to newly created fpu.S.
 - Fix a build error, sorry for that.
 - Fix wording, style, etc.

Changes in v3:
 - Refactor the whole patch into independent ones.

Changes in v2:
 - Various code cleanups and style fixes.


Alan Kao (5):
  Extract FPU context operations from entry.S
  Refactor FPU code in signal setup/return procedures
  Cleanup ISA string setting
  Allow to disable FPU support
  Auto-detect whether a FPU exists

 arch/riscv/Kconfig                 |   9 +++
 arch/riscv/Makefile                |  19 +++---
 arch/riscv/include/asm/switch_to.h |  12 +++-
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/cpufeature.c     |   8 +++
 arch/riscv/kernel/entry.S          |  87 -----------------------
 arch/riscv/kernel/fpu.S            | 106 +++++++++++++++++++++++++++++
 arch/riscv/kernel/process.c        |   6 +-
 arch/riscv/kernel/signal.c         |  75 ++++++++++++--------
 9 files changed, 196 insertions(+), 127 deletions(-)
 create mode 100644 arch/riscv/kernel/fpu.S

-- 
2.18.0
