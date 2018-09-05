From: linux@roeck-us.net (Guenter Roeck)
Date: Wed,  5 Sep 2018 07:36:06 -0700
Subject: [PATCH -next] RISC-V: Request newstat syscalls
Message-ID: <1536158166-3397-1-git-send-email-linux@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Since commit 82b355d161c9 ("y2038: Remove newstat family from default
syscall set"), riscv images fail to boot with the following error.

/sbin/init: error while loading shared libraries: libc.so.6:
	cannot stat shared object: Error 38
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00

Explicitly request newstat syscalls to fix the problem.

Fixes: 82b355d161c9 ("y2038: Remove newstat family from default syscall set")
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I would suggest to merge this patch with the offending patch.

 arch/riscv/include/asm/unistd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 0caea01d5cca..eff7aa9aa163 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -16,6 +16,7 @@
  * be included multiple times.  See uapi/asm/syscalls.h for more info.
  */
 
+#define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
 #include <uapi/asm/unistd.h>
 #include <uapi/asm/syscalls.h>
-- 
2.7.4
