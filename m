From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Fri,  1 Jun 2018 17:21:23 +0200
Subject: [PATCH 3/3] riscv: fix __user annotation for __copy_user()
In-Reply-To: <20180601152123.47256-1-luc.vanoostenryck@gmail.com>
References: <20180601152123.47256-1-luc.vanoostenryck@gmail.com>
Message-ID: <20180601152123.47256-4-luc.vanoostenryck@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

__copy_user() is a function, written in assembly, used to copy
memory between kernel & user space. As such its to & from args
may both take a user pointer or a kernel pointer.

However the prototype for this function declare these two args
as 'void __user *', which is no more & no less correct than
declaring them as 'void *'. In fact theer is no possible correct
annotation for such a function.

The problem is worked around here by declaring these args as
unsigned long and casting them to the right type in each of
two callers raw_copy_{to,from}_user() as some kind of cast would
be needed anyway.

Note: another solution, maybe cleaner but slightly more complex,
      would be to declare two version of __copy_user,
      either in the asm file or via an alias, each having already
      the correct typing for raw_copy_{to,from}_user().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/riscv/include/asm/uaccess.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 14b0b22fb..c7a6a4a4a 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -392,19 +392,19 @@ do {								\
 })
 
 
-extern unsigned long __must_check __copy_user(void __user *to,
-	const void __user *from, unsigned long n);
+extern unsigned long __must_check __copy_user(unsigned long to,
+	const unsigned long from, unsigned long n);
 
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	return __copy_user(to, from, n);
+	return __copy_user((unsigned long)to, (unsigned long)from, n);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	return __copy_user(to, from, n);
+	return __copy_user((unsigned long)to, (unsigned long)from, n);
 }
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
-- 
2.17.1
