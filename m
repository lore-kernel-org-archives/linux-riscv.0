From: alankao@andestech.com (Alan Kao)
Date: Wed, 18 Apr 2018 10:12:01 +0800
Subject: [PATCH v4 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
Message-ID: <1524017523-25076-1-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This implements the baseline PMU for RISC-V platforms.

To ease future PMU portings, a guide is also written, containing
perf concepts, arch porting practices and some hints.

Changes in v4:
 - Fix several compilation errors.  Sorry for that.
 - Raise a warning in the write_counter body.

Changes in v3:
 - Fix typos in the document.
 - Change the initialization routine from statically assigning PMU to
   device-tree-based methods, and set default to the PMU proposed in
   this patch.

Changes in v2:
 - Fix the bug reported by Alex, which was caused by not sufficient
   initialization.  Check https://lkml.org/lkml/2018/3/31/251 for the
   discussion.

Alan Kao (2):
  perf: riscv: preliminary RISC-V support
  perf: riscv: Add Document for Future Porting Guide

 Documentation/riscv/pmu.txt         | 249 ++++++++++++++
 arch/riscv/Kconfig                  |  13 +
 arch/riscv/include/asm/perf_event.h |  79 ++++-
 arch/riscv/kernel/Makefile          |   1 +
 arch/riscv/kernel/perf_event.c      | 482 ++++++++++++++++++++++++++++
 5 files changed, 820 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/riscv/pmu.txt
 create mode 100644 arch/riscv/kernel/perf_event.c

-- 
2.17.0
