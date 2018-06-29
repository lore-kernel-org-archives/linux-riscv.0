From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 29 Jun 2018 11:01:21 -0700
Subject: [RFC PATCH 0/2] Local timer interrupt fix
Message-ID: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patchset introduces per cpu based local timer interrupt.
1st patch is device tree documentation while the 2nd patch
contains the actual interrupt registration and handling.

It requires device tree modifications as well which is
available at 

https://github.com/riscv/riscv-pk/pull/112

FYI: These patches alone without bbl changes will fail to boot. 

Atish Patra (2):
  dt-binding: RISC-V local timer docs.
  riscv: Introduce per cpu based local timer interrupt

 Documentation/devicetree/bindings/riscv/timer.txt | 35 +++++++++++++
 arch/riscv/include/asm/irq.h                      |  2 -
 arch/riscv/kernel/time.c                          | 21 --------
 drivers/clocksource/riscv_timer.c                 | 61 +++++++++++++++++++++--
 drivers/irqchip/irq-riscv-intc.c                  | 11 ++--
 5 files changed, 99 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/timer.txt

-- 
2.7.4
