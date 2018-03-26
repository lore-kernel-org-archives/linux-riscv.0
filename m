From: alankao@andestech.com (Alan Kao)
Date: Mon, 26 Mar 2018 15:57:53 +0800
Subject: [PATCH 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
Message-ID: <1522051075-6442-1-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This implements the baseline PMU for RISC-V platforms.

To ease the future PMU portings, a guide is also written, containing
perf concepts, arch porting practices and some hints.

Alan Kao (2):
  perf: riscv: preliminary RISC-V support
  perf: riscv: Add Document for Future Porting Guide

 Documentation/riscv/pmu.txt         | 250 +++++++++++++++++++
 arch/riscv/Kconfig                  |  12 +
 arch/riscv/include/asm/perf_event.h |  76 +++++-
 arch/riscv/kernel/Makefile          |   1 +
 arch/riscv/kernel/perf_event.c      | 469 ++++++++++++++++++++++++++++++++++++
 5 files changed, 804 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/riscv/pmu.txt
 create mode 100644 arch/riscv/kernel/perf_event.c

-- 
2.16.2
