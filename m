From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 24 Aug 2018 11:22:55 -0700
Subject: [PATCH] riscv: tlb: Provide definition of tlb_flush() before
 including tlb.h
Message-ID: <1535134975-18594-1-git-send-email-linux@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Will Deacon <will.deacon@arm.com>

As of commit fd1102f0aade ("mm: mmu_notifier fix for tlb_end_vma"),
asm-generic/tlb.h now calls tlb_flush() from a static inline function,
so we need to make sure that it's declared before #including the
asm-generic header in the arch header.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: fd1102f0aade ("mm: mmu_notifier fix for tlb_end_vma")
Signed-off-by: Will Deacon <will.deacon@arm.com>
[groeck: Use forward declaration instead of moving inline function]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/riscv/include/asm/tlb.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index c229509288ea..439dc7072e05 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -14,6 +14,10 @@
 #ifndef _ASM_RISCV_TLB_H
 #define _ASM_RISCV_TLB_H
 
+struct mmu_gather;
+
+static void tlb_flush(struct mmu_gather *tlb);
+
 #include <asm-generic/tlb.h>
 
 static inline void tlb_flush(struct mmu_gather *tlb)
-- 
2.7.4
