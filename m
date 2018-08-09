From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu,  9 Aug 2018 15:19:52 -0700
Subject: [PATCH v3 2/2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180809221952.24260-1-palmer@sifive.com>
References: <20180809221952.24260-1-palmer@sifive.com>
Message-ID: <20180809221952.24260-3-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This file is expected to be included multiple times in the same file in
order to allow the __SYSCALL macro to generate system call tables.  With
a global include guard we end up missing __NR_riscv_flush_icache in the
syscall table, which results in icache flushes that escape the vDSO call
to not actually do anything.

The fix is to move to per-#define include guards, which allows the
system call tables to actually be populated.  Thanks to Macrus Comstedt
for finding and fixing the bug!

I also went ahead and fixed the SPDX header to use a //-style comment,
which I've been told is the canonical way to do it.

Cc: Marcus Comstedt <marcus@mc.pp.se>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/unistd.h        |  5 +++++
 arch/riscv/include/uapi/asm/syscalls.h | 15 +++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 080fb28061de..0caea01d5cca 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -11,6 +11,11 @@
  *   GNU General Public License for more details.
  */
 
+/*
+ * There is explicitly no include guard here because this file is expected to
+ * be included multiple times.  See uapi/asm/syscalls.h for more info.
+ */
+
 #define __ARCH_WANT_SYS_CLONE
 #include <uapi/asm/unistd.h>
 #include <uapi/asm/syscalls.h>
diff --git a/arch/riscv/include/uapi/asm/syscalls.h b/arch/riscv/include/uapi/asm/syscalls.h
index 818655b0d535..690beb002d1d 100644
--- a/arch/riscv/include/uapi/asm/syscalls.h
+++ b/arch/riscv/include/uapi/asm/syscalls.h
@@ -1,10 +1,13 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2017 SiFive
+ * Copyright (C) 2017-2018 SiFive
  */
 
-#ifndef _ASM__UAPI__SYSCALLS_H
-#define _ASM__UAPI__SYSCALLS_H
+/*
+ * There is explicitly no include guard here because this file is expected to
+ * be included multiple times in order to define the syscall macros via
+ * __SYSCALL.
+ */
 
 /*
  * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
@@ -20,7 +23,7 @@
  * caller.  We don't currently do anything with the address range, that's just
  * in there for forwards compatibility.
  */
+#ifndef __NR_riscv_flush_icache
 #define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
-__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
-
 #endif
+__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
-- 
2.16.4
