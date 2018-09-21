From: hch@lst.de (Christoph Hellwig)
Date: Fri, 21 Sep 2018 08:43:21 +0200
Subject: [PATCH] RISC-V: remove the unused return_to_handler export
Message-ID: <20180921064321.21817-1-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This export is not only not needed, but also breaks symbol versioning
due to being an undeclared assembly export.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/mcount.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 5721624886a1..8a5593ff9ff3 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -75,7 +75,6 @@ ENTRY(return_to_handler)
 	RESTORE_RET_ABI_STATE
 	jalr	a1
 ENDPROC(return_to_handler)
-EXPORT_SYMBOL(return_to_handler)
 #endif
 
 #ifndef CONFIG_DYNAMIC_FTRACE
-- 
2.18.0
