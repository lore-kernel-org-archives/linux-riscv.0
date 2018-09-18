From: zongbox@gmail.com (Zong Li)
Date: Tue, 18 Sep 2018 17:19:17 +0800
Subject: [PATCH 5/5] RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t
 in ioremap
In-Reply-To: <cover.1537260207.git.zongbox@gmail.com>
References: <cover.1537260207.git.zongbox@gmail.com>
Message-ID: <9fc325660fb1e0ef9133705f7c05784dcc12c0c2.1537260207.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Vincent Chen <vincentc@andestech.com>

For 32bit, the upper 32-bit of phys_addr_t will be flushed to zero
after AND with PAGE_MASK because the data type of PAGE_MASK is
unsigned long. To fix this problem, the page alignment is done by
subtracting the page offset instead of AND with PAGE_MASK.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
index 70ef272..bd2f2db 100644
--- a/arch/riscv/mm/ioremap.c
+++ b/arch/riscv/mm/ioremap.c
@@ -42,7 +42,7 @@ static void __iomem *__ioremap_caller(phys_addr_t addr, size_t size,
 
 	/* Page-align mappings */
 	offset = addr & (~PAGE_MASK);
-	addr &= PAGE_MASK;
+	addr -= offset;
 	size = PAGE_ALIGN(size + offset);
 
 	area = get_vm_area_caller(size, VM_IOREMAP, caller);
-- 
2.7.4
