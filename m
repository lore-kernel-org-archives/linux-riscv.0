From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 11 Sep 2018 13:05:31 -0700
Subject: [PATCH v4 04/12] RISC-V: Comment on the TLB flush in smp_callin()
In-Reply-To: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
References: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1536696339-15204-5-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Palmer Dabbelt <palmer@sifive.com>

This isn't readily apparent from reading the code.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: code comment formatting update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 56abab6a..712e9ca8 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -106,6 +106,10 @@ asmlinkage void __init smp_callin(void)
 	trap_init();
 	notify_cpu_starting(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
+	/*
+	 * Remote TLB flushes are ignored while the CPU is offline, so emit
+	 * a local TLB flush right now just in case.
+	 */
 	local_flush_tlb_all();
 	local_irq_enable();
 	preempt_disable();
-- 
2.7.4
