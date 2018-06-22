From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 22 Jun 2018 16:20:04 -0700
Subject: [PATCH 1/3] RISC-V: Don't include irq-riscv-intc.h
In-Reply-To: <20180622232006.12158-1-palmer@sifive.com>
References: <20180622232006.12158-1-palmer@sifive.com>
Message-ID: <20180622232006.12158-2-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This file has never existed in the upstream kernel, but it's guarded by
an #ifdef that's also never existed in the upstream kernel.  As a part
of our interrupt controller refactoring this header is no longer
necessary, but this reference managed to sneak in anyway.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/irq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index b74cbfbce2d0..7bcdaed15703 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -16,10 +16,6 @@
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 
-#ifdef CONFIG_RISCV_INTC
-#include <linux/irqchip/irq-riscv-intc.h>
-#endif
-
 void __init init_IRQ(void)
 {
 	irqchip_init();
-- 
2.16.4
