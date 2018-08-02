From: hch@lst.de (Christoph Hellwig)
Date: Thu,  2 Aug 2018 13:50:03 +0200
Subject: [PATCH 06/11] RISC-V: remove INTERRUPT_CAUSE_* defines from asm/irq.h
In-Reply-To: <20180802115008.4031-1-hch@lst.de>
References: <20180802115008.4031-1-hch@lst.de>
Message-ID: <20180802115008.4031-7-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

These are only of use to the local irq controller driver, so add them in
that driver implementation instead, which will be submitted soon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/irq.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index c871661c9df4..996b6fbe17a6 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -17,10 +17,6 @@
 
 #define NR_IRQS         0
 
-#define INTERRUPT_CAUSE_SOFTWARE    1
-#define INTERRUPT_CAUSE_TIMER       5
-#define INTERRUPT_CAUSE_EXTERNAL    9
-
 void riscv_timer_interrupt(void);
 void riscv_software_interrupt(void);
 
-- 
2.18.0
