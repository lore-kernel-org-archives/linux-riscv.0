From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Fri,  1 Jun 2018 17:21:21 +0200
Subject: [PATCH 1/3] riscv: use NULL instead of a plain 0
In-Reply-To: <20180601152123.47256-1-luc.vanoostenryck@gmail.com>
References: <20180601152123.47256-1-luc.vanoostenryck@gmail.com>
Message-ID: <20180601152123.47256-2-luc.vanoostenryck@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

sbi_remote_sfence_vma() & sbi_remote_fence_i() takes
a pointer as first argument but some macros call them with
a plain 0 which, while legal C, is frowned upon in the kernel.

Change this by replacing the 0 by NULL.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/riscv/include/asm/cacheflush.h | 2 +-
 arch/riscv/include/asm/tlbflush.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index efd89a88d..8f1307441 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -47,7 +47,7 @@ static inline void flush_dcache_page(struct page *page)
 
 #else /* CONFIG_SMP */
 
-#define flush_icache_all() sbi_remote_fence_i(0)
+#define flush_icache_all() sbi_remote_fence_i(NULL)
 void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 7b209aec3..85c2d8bae 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -49,7 +49,7 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 
 #include <asm/sbi.h>
 
-#define flush_tlb_all() sbi_remote_sfence_vma(0, 0, -1)
+#define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
 #define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
 #define flush_tlb_range(vma, start, end) \
 	sbi_remote_sfence_vma(mm_cpumask((vma)->vm_mm)->bits, \
-- 
2.17.1
