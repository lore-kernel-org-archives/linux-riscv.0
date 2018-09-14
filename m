From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 14 Sep 2018 14:54:53 -0700
Subject: [RFC 0/3] Timer code cleanup 
Message-ID: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch series address some required timer cleanups in RISC-V.

Atish Patra (2):
  RISC-V:Support per-hart timebase-frequency
  RISC-V: Remove per cpu clocksource

Palmer Dabbelt (1):
  dt-bindings: Correct RISC-V's timebase-frequency

 Documentation/devicetree/bindings/riscv/cpus.txt |  4 +++-
 arch/riscv/kernel/time.c                         |  9 +--------
 drivers/clocksource/riscv_timer.c                | 22 ++++++++++++++++++----
 3 files changed, 22 insertions(+), 13 deletions(-)

-- 
2.7.4
