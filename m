From: atish.patra@wdc.com (Atish Patra)
Date: Thu,  6 Sep 2018 01:05:27 -0700
Subject: [PATCH v3 04/12] RISC-V: Disable preemption before enabling interrupts
In-Reply-To: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1536221135-182613-5-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Currently, irq is enabled before preemption disabling happens.
If the scheduler fired right here and cpu is scheduled then it
may blow up.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: Commit text and code comment formatting update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 712e9ca8..670749ec 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -111,7 +111,11 @@ asmlinkage void __init smp_callin(void)
 	 * a local TLB flush right now just in case.
 	 */
 	local_flush_tlb_all();
-	local_irq_enable();
+	/*
+	 * Disable preemption before enabling interrupts, so we don't try to
+	 * schedule a CPU that hasn't actually started yet.
+	 */
 	preempt_disable();
+	local_irq_enable();
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
 }
-- 
2.7.4
