From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 11:42:43 -0700
Subject: [PATCH 8/8] RISC-V: Disable preemption before enabling interrupts
 when booting secondary harts
In-Reply-To: <20180827184243.25344-1-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
Message-ID: <20180827184243.25344-9-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I'm not sure, but I think this was a bug: if the scheduler fired right
here then I believe it would blow up.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/smpboot.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 953bc540207d..45515cc70181 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -110,7 +110,9 @@ asmlinkage void __init smp_callin(void)
 	/* Remote TLB flushes are ignored while the CPU is offline, so emit a local
 	 * TLB flush right now just in case. */
 	local_flush_tlb_all();
-	local_irq_enable();
+	/* Disable preemption before enabling interrupts, so we don't try to
+	 * schedule a CPU that hasn't actually started yet. */
 	preempt_disable();
+	local_irq_enable();
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
 }
-- 
2.16.4
