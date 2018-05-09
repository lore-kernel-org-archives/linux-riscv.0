From: atish.patra@wdc.com (Atish Patra)
Date: Wed,  9 May 2018 15:02:20 -0700
Subject: [PATCH v2 0/2] Fix timer initialization and Add support hotplug.
Message-ID: <1525903342-191948-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The patch (1/2)fixes issues around timer initialization. This fix is
required for CPU hotplug to work. That's why they are clubbed into one
series. I can separate them if required.

Changes from v1 to v2:
1. Removed compiler warnings about unused variables.

Atish Patra (2):
  RISCV: Register clocksource and events correctly
  RISCV: Support cpu hotplug.

 arch/riscv/Kconfig                | 11 ++++++-
 arch/riscv/include/asm/csr.h      |  1 +
 arch/riscv/include/asm/smp.h      |  9 ++++--
 arch/riscv/kernel/head.S          | 12 +++++++
 arch/riscv/kernel/process.c       |  7 +++++
 arch/riscv/kernel/setup.c         | 17 ++++++++++
 arch/riscv/kernel/smpboot.c       | 66 +++++++++++++++++++++++++++++++++++++--
 arch/riscv/kernel/time.c          |  9 +-----
 arch/riscv/kernel/traps.c         |  6 ++--
 drivers/clocksource/riscv_timer.c | 44 +++++++++++++++++---------
 include/linux/cpuhotplug.h        |  1 +
 11 files changed, 150 insertions(+), 33 deletions(-)

-- 
2.7.4
