From: alistair.francis@wdc.com (Alistair Francis)
Date: Mon,  6 Aug 2018 15:10:09 -0700
Subject: [PATCH 4/4] irq-riscv-plic: Update function name
In-Reply-To: <20180806221009.12466-1-alistair.francis@wdc.com>
References: <20180806221009.12466-1-alistair.francis@wdc.com>
Message-ID: <20180806221009.12466-4-alistair.francis@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Update the function riscv_of_processor_hart() name to the new
riscv_of_processor_hartid() name.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/irqchip/irq-riscv-plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-plic.c b/drivers/irqchip/irq-riscv-plic.c
index 99e79713abc6..9a94646fcd53 100644
--- a/drivers/irqchip/irq-riscv-plic.c
+++ b/drivers/irqchip/irq-riscv-plic.c
@@ -343,7 +343,7 @@ static int plic_init(struct device_node *node, struct device_node *parent)
 		/* skip any contexts that lead to inactive harts */
 		if (of_device_is_compatible(parent.np, "riscv,cpu-intc") &&
 		    parent.np->parent &&
-		    riscv_of_processor_hart(parent.np->parent) < 0)
+		    riscv_of_processor_hartid(parent.np->parent) < 0)
 			continue;
 
 		parent_irq = irq_create_of_mapping(&parent);
-- 
2.17.1
