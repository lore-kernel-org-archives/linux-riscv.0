From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 11:42:41 -0700
Subject: [PATCH 6/8] RISC-V: Use mmgrab()
In-Reply-To: <20180827184243.25344-1-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
Message-ID: <20180827184243.25344-7-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

f1f1007644ff ("mm: add new mmgrab() helper") added a helper that we
missed out on.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index e1f6a5ad0416..5437a04babcd 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -30,6 +30,7 @@
 #include <linux/irq.h>
 #include <linux/of.h>
 #include <linux/sched/task_stack.h>
+#include <linux/sched/mm.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
@@ -79,8 +80,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	 * the spinning harts that they can continue the boot process.
 	 */
 	smp_mb();
-	__cpu_up_stack_pointer[cpu] = task_stack_page(tidle) + THREAD_SIZE;
-	__cpu_up_task_pointer[cpu] = tidle;
+	WRITE_ONCE(__cpu_up_stack_pointer[cpu], task_stack_page(tidle) + THREAD_SIZE);
+	WRITE_ONCE(__cpu_up_task_pointer[cpu], tidle);
 
 	while (!cpu_online(cpu))
 		cpu_relax();
@@ -100,7 +101,7 @@ asmlinkage void __init smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 
 	/* All kernel threads share the same mm context.  */
-	atomic_inc(&mm->mm_count);
+	mmgrab(mm);
 	current->active_mm = mm;
 
 	trap_init();
-- 
2.16.4
