From: linux@roeck-us.net (Guenter Roeck)
Date: Sat, 01 Sep 2018 17:44:08 -0000
Subject: [PATCH] y2038: Remove newstat family from default syscall set
Message-ID: <20180901174353.GA14271@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Arnd,

On Fri, Apr 13, 2018 at 11:50:12AM +0200, Arnd Bergmann wrote:
> We have four generations of stat() syscalls:
> - the oldstat syscalls that are only used on the older architectures
> - the newstat family that is used on all 64-bit architectures but
>   lacked support for large files on 32-bit architectures.
> - the stat64 family that is used mostly on 32-bit architectures to
>   replace newstat
> - statx() to replace all of the above, adding 64-bit timestamps among
>   other things.
> 
> We already compile stat64 only on those architectures that need it,
> but newstat is always built, including on those that don't reference
> it. This adds a new __ARCH_WANT_NEW_STAT symbol along the lines of
> __ARCH_WANT_OLD_STAT and __ARCH_WANT_STAT64 to control compilation of
> newstat. All architectures that need it use an explict define, the
> others now get a little bit smaller, and future architecture (including
> 64-bit targets) won't ever see it.
> 

This patch causes my riscv boot tests to crash in -next

sbin/init: error while loading shared libraries: libc.so.6: cannot stat shared object: Error 38
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00

The following change fixes the problem for me, but of course I have no idea
if it is correct. Copying RISC-V maintainers for input.

Guenter

---
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
