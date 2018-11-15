From: olof@lixom.net (Olof Johansson)
Date: Wed, 14 Nov 2018 16:27:55 -0800
Subject: [PATCH] RISC-V: Fix raw_copy_{to,from}_user()
Message-ID: <20181115002755.24195-1-olof@lixom.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Sparse highlighted it, and appears to be a pure bug (from vs to).

./arch/riscv/include/asm/uaccess.h:403:35: warning: incorrect type in argument 1 (different address spaces)
./arch/riscv/include/asm/uaccess.h:403:39: warning: incorrect type in argument 2 (different address spaces)
./arch/riscv/include/asm/uaccess.h:409:37: warning: incorrect type in argument 1 (different address spaces)
./arch/riscv/include/asm/uaccess.h:409:41: warning: incorrect type in argument 2 (different address spaces)

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 473cfc84e412f..8c3e3e3c8be12 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -400,13 +400,13 @@ extern unsigned long __must_check __asm_copy_from_user(void *to,
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	return __asm_copy_to_user(to, from, n);
+	return __asm_copy_from_user(to, from, n);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	return __asm_copy_from_user(to, from, n);
+	return __asm_copy_to_user(to, from, n);
 }
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
-- 
2.11.0
