From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Fri,  1 Jun 2018 17:21:22 +0200
Subject: [PATCH 2/3] riscv: no __user for probe_kernel_address()
In-Reply-To: <20180601152123.47256-1-luc.vanoostenryck@gmail.com>
References: <20180601152123.47256-1-luc.vanoostenryck@gmail.com>
Message-ID: <20180601152123.47256-3-luc.vanoostenryck@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

In is_valid_bugaddr(), probe_kernel_address() is called with
the PC casted to (bug_inst_t __user *) but this function
only take a plain void* as argument, not a __user pointer.

Fix this by removing the unnneded __user in the cast.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/riscv/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 93132cb59..4c92e5af8 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -160,7 +160,7 @@ int is_valid_bugaddr(unsigned long pc)
 
 	if (pc < PAGE_OFFSET)
 		return 0;
-	if (probe_kernel_address((bug_insn_t __user *)pc, insn))
+	if (probe_kernel_address((bug_insn_t *)pc, insn))
 		return 0;
 	return (insn == __BUG_INSN);
 }
-- 
2.17.1
