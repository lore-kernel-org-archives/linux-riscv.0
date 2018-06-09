From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Sat,  9 Jun 2018 02:33:51 +0200
Subject: [PATCH] riscv: split the declaration of __copy_user
In-Reply-To: <mhng-d06d9c63-3188-4e2e-abe6-2f62e3b35d48@palmer-si-x1c4>
References: <mhng-d06d9c63-3188-4e2e-abe6-2f62e3b35d48@palmer-si-x1c4>
Message-ID: <20180609003351.25979-1-luc.vanoostenryck@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

We use a single __copy_user assembly function to copy memory both from
and to userspace. While this works, it triggers sparse errors because
we're implicitly casting between the kernel and user address spaces by
calling __copy_user.

This patch splits the C declaration into a pair of functions,
__asm_copy_{to,from}_user, that have sane semantics WRT __user. This
split make things fine from sparse's point of view. The assembly
implementation keeps a single definition but add a double ENTRY() for it,
one for __asm_copy_to_user and another one for __asm_copy_from_user.
The result is a spare-safe implementation that pays no performance
or code size penalty.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/riscv/include/asm/uaccess.h | 8 +++++---
 arch/riscv/kernel/riscv_ksyms.c  | 3 ++-
 arch/riscv/lib/uaccess.S         | 6 ++++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 14b0b22fb..473cfc84e 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -392,19 +392,21 @@ do {								\
 })
 
 
-extern unsigned long __must_check __copy_user(void __user *to,
+extern unsigned long __must_check __asm_copy_to_user(void __user *to,
+	const void *from, unsigned long n);
+extern unsigned long __must_check __asm_copy_from_user(void *to,
 	const void __user *from, unsigned long n);
 
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	return __copy_user(to, from, n);
+	return __asm_copy_to_user(to, from, n);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	return __copy_user(to, from, n);
+	return __asm_copy_from_user(to, from, n);
 }
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index 551734248..f247d6d21 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -13,6 +13,7 @@
  * Assembly functions that may be used (directly or indirectly) by modules
  */
 EXPORT_SYMBOL(__clear_user);
-EXPORT_SYMBOL(__copy_user);
+EXPORT_SYMBOL(__asm_copy_to_user);
+EXPORT_SYMBOL(__asm_copy_from_user);
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 58fb2877c..f8e6440ca 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -13,7 +13,8 @@ _epc:
 	.previous
 	.endm
 
-ENTRY(__copy_user)
+ENTRY(__asm_copy_to_user)
+ENTRY(__asm_copy_from_user)
 
 	/* Enable access to user memory */
 	li t6, SR_SUM
@@ -63,7 +64,8 @@ ENTRY(__copy_user)
 	addi a0, a0, 1
 	bltu a1, a3, 5b
 	j 3b
-ENDPROC(__copy_user)
+ENDPROC(__asm_copy_to_user)
+ENDPROC(__asm_copy_from_user)
 
 
 ENTRY(__clear_user)
-- 
2.17.1
