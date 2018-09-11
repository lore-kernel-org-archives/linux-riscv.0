From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 11 Sep 2018 13:05:37 -0700
Subject: [PATCH v4 10/12] RISC-V: User WRITE_ONCE instead of direct access
In-Reply-To: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
References: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1536696339-15204-11-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The secondary harts spin on couple of per cpu variables until both of
these are non-zero so it's not necessary to have any ordering here.
However, WRITE_ONCE should be used to avoid tearing.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 17e74831..1e478615 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -81,8 +81,9 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	 * the spinning harts that they can continue the boot process.
 	 */
 	smp_mb();
-	__cpu_up_stack_pointer[cpu] = task_stack_page(tidle) + THREAD_SIZE;
-	__cpu_up_task_pointer[cpu] = tidle;
+	WRITE_ONCE(__cpu_up_stack_pointer[cpu],
+		  task_stack_page(tidle) + THREAD_SIZE);
+	WRITE_ONCE(__cpu_up_task_pointer[cpu], tidle);
 
 	while (!cpu_online(cpu))
 		cpu_relax();
-- 
2.7.4
