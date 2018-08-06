From: alistair.francis@wdc.com (Alistair Francis)
Date: Mon,  6 Aug 2018 15:10:08 -0700
Subject: [PATCH 3/4] riscv/smpboot: Add missing include
In-Reply-To: <20180806221009.12466-1-alistair.francis@wdc.com>
References: <20180806221009.12466-1-alistair.francis@wdc.com>
Message-ID: <20180806221009.12466-3-alistair.francis@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Add missing mm header include.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index c0032304b6ee..e30727bdc467 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/sched.h>
+#include <linux/sched/mm.h>
 #include <linux/kernel_stat.h>
 #include <linux/notifier.h>
 #include <linux/cpu.h>
-- 
2.17.1
