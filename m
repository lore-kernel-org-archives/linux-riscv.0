From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 11:42:42 -0700
Subject: [PATCH 7/8] RISC-V: Comment on the TLB flush in smp_callin()
In-Reply-To: <20180827184243.25344-1-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
Message-ID: <20180827184243.25344-8-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This isn't readily apparent from reading the code.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 5437a04babcd..953bc540207d 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -107,6 +107,8 @@ asmlinkage void __init smp_callin(void)
 	trap_init();
 	notify_cpu_starting(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
+	/* Remote TLB flushes are ignored while the CPU is offline, so emit a local
+	 * TLB flush right now just in case. */
 	local_flush_tlb_all();
 	local_irq_enable();
 	preempt_disable();
-- 
2.16.4
