From: tiny.windzz@gmail.com (Yangtao Li)
Date: Tue, 20 Nov 2018 09:11:02 -0500
Subject: [PATCH] RISC-V: add of_node_put()
Message-ID: <20181120141102.20534-1-tiny.windzz@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

use of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 arch/riscv/kernel/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1911c8f6b8a6..40470e669a35 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -26,6 +26,7 @@ void __init time_init(void)
 	cpu = of_find_node_by_path("/cpus");
 	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
 		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
+	of_node_put(cpu);
 	riscv_timebase = prop;
 
 	lpj_fine = riscv_timebase / HZ;
-- 
2.17.0
