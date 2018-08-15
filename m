From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 15 Aug 2018 16:56:16 -0700
Subject: [RFC PATCH 4/5] RISC-V: Move interrupt cause declarations to irq.h
In-Reply-To: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1534377377-70108-5-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

CPU hotplug code in smpboot requires interrupt cause
to identify the cause of cpu wakeup.

Move the IRQ cause declarations to appropriate header
file.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/irq.h | 7 +++++++
 arch/riscv/kernel/irq.c      | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 996b6fbe..abf2e4e3 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -20,6 +20,13 @@
 void riscv_timer_interrupt(void);
 void riscv_software_interrupt(void);
 
+/*
+ * Possible interrupt causes:
+ */
+#define INTERRUPT_CAUSE_SOFTWARE    1
+#define INTERRUPT_CAUSE_TIMER       5
+#define INTERRUPT_CAUSE_EXTERNAL    9
+
 #include <asm-generic/irq.h>
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 0cfac48a..0dd2df01 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -10,13 +10,6 @@
 #include <linux/irqdomain.h>
 
 /*
- * Possible interrupt causes:
- */
-#define INTERRUPT_CAUSE_SOFTWARE    1
-#define INTERRUPT_CAUSE_TIMER       5
-#define INTERRUPT_CAUSE_EXTERNAL    9
-
-/*
  * The high order bit of the trap cause register is always set for
  * interrupts, which allows us to differentiate them from exceptions
  * quickly.  The INTERRUPT_CAUSE_* macros don't contain that bit, so we
-- 
2.7.4
