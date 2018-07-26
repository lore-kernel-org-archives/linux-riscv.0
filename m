From: hch@lst.de (Christoph Hellwig)
Date: Thu, 26 Jul 2018 16:37:15 +0200
Subject: [PATCH 1/9] RISC-V: remove timer leftovers
In-Reply-To: <20180726143723.16585-1-hch@lst.de>
References: <20180726143723.16585-1-hch@lst.de>
Message-ID: <20180726143723.16585-2-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This code is currently unused and will be added back later in a different
place with the real interrupt and clocksource support.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/time.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 2463fcca719e..0df9b2cbd645 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -13,32 +13,11 @@
  */
 
 #include <linux/clocksource.h>
-#include <linux/clockchips.h>
 #include <linux/delay.h>
-
-#ifdef CONFIG_RISCV_TIMER
-#include <linux/timer_riscv.h>
-#endif
-
 #include <asm/sbi.h>
 
 unsigned long riscv_timebase;
 
-DECLARE_PER_CPU(struct clock_event_device, riscv_clock_event);
-
-void riscv_timer_interrupt(void)
-{
-#ifdef CONFIG_RISCV_TIMER
-	/*
-	 * FIXME: This needs to be cleaned up along with the rest of the IRQ
-	 * handling cleanup.  See irq.c for more details.
-	 */
-	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
-
-	evdev->event_handler(evdev);
-#endif
-}
-
 void __init init_clockevent(void)
 {
 	timer_probe();
-- 
2.18.0
