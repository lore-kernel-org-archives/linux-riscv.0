From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 28 May 2018 17:50:51 -0700
Subject: [PATCH]  RISCV: Disable timer interrupt in handler to fix nohz.
Message-ID: <1527555051-166186-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The timer interrupt pending bit is cleared in bbl while
reprogramming the timer. This works fine unless we are
in nohz mode. In nohz mode, the timer is not reprogrammed.
Thus, the pending bits are not cleared leading to continuous
timer interrupt firing and cpu stalls.

Disable timer interrupt in interrupt handler to ignore
the pending bit until next interrupt. Timer interrupt
is enabled again before next timer event is set.

The details of the stalls can be found in
https://github.com/riscv/riscv-linux/issues/127

Other possible ideas discussion:
https://github.com/riscv/riscv-pk/pull/108

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/time.c          | 6 ++++++
 drivers/clocksource/riscv_timer.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 67709cb..0bffb8c 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -35,6 +35,12 @@ void riscv_timer_interrupt(void)
 	 */
 	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
 
+	/*
+	 * There are no direct SBI calls to clear pending timer interrupt bit.
+	 * Disable timer interrupt to ignore pending interrupt until next
+	 * interrupt.
+	 */
+	csr_clear(sie, SIE_STIE);
 	evdev->event_handler(evdev);
 #endif
 }
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 38867bd..f7ea2d3 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -36,6 +36,7 @@ static int next_event(unsigned long delta, struct clock_event_device *ce)
 	 * harts.
 	 */
 	BUG_ON(ce != this_cpu_ptr(&riscv_clock_event));
+	csr_set(sie, SIE_STIE);
 	sbi_set_timer(get_cycles64() + delta);
 	return 0;
 }
-- 
2.7.4
