From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 13 Apr 2018 14:49:32 -0700
Subject: [RFC PATCH 0/2] Fix timer initialization and Add support hotplug.
Message-ID: <1523656174-249811-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The patch (1/2)fixes issues around timer initialization. This fix is
required for CPU hotplug to work. That's why they are clubbed into one
series. I can separate them if required.


Atish Patra (2):
  RISCV: Register clocksource and events correctly
  RISCV: Support cpu hotplug.

 arch/riscv/Kconfig                | 11 +++++-
 arch/riscv/include/asm/csr.h      |  1 +
 arch/riscv/include/asm/smp.h      |  9 +++--
 arch/riscv/kernel/head.S          | 12 +++++++
 arch/riscv/kernel/process.c       |  7 ++++
 arch/riscv/kernel/setup.c         | 17 ++++++++++
 arch/riscv/kernel/smpboot.c       | 70 +++++++++++++++++++++++++++++++++++++--
 arch/riscv/kernel/time.c          |  9 +----
 arch/riscv/kernel/traps.c         |  6 ++--
 drivers/clocksource/riscv_timer.c | 44 +++++++++++++++---------
 include/linux/cpuhotplug.h        |  1 +
 11 files changed, 154 insertions(+), 33 deletions(-)

-- 
2.7.4
