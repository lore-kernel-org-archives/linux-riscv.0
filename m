From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon,  5 Nov 2018 15:26:02 +0100
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
Message-ID: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Marcin Juszkiewicz reported issues while generating syscall table for riscv
using 4.20-rc1. The patch refactors our unistd.h files to match some other
architectures.

- Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT
- Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
- Adjust kernel asm/unistd.h

So now asm/unistd.h UAPI header should show all syscalls for riscv.

Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
generated asm/unistd.h UAPI header thus user didn't see:

- __NR_riscv_flush_icache
- __NR_newfstatat
- __NR_fstat

which are supported by riscv kernel.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Fixes: 67314ec7b025
---
 arch/riscv/include/asm/unistd.h               |  5 ++--
 .../include/uapi/asm/{syscalls.h => unistd.h} | 24 +++++++++++++------
 2 files changed, 19 insertions(+), 10 deletions(-)
 rename arch/riscv/include/uapi/asm/{syscalls.h => unistd.h} (54%)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index eff7aa9aa163..fef96f117b4d 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -13,10 +13,9 @@
 
 /*
  * There is explicitly no include guard here because this file is expected to
- * be included multiple times.  See uapi/asm/syscalls.h for more info.
+ * be included multiple times.
  */
 
-#define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
+
 #include <uapi/asm/unistd.h>
-#include <uapi/asm/syscalls.h>
diff --git a/arch/riscv/include/uapi/asm/syscalls.h b/arch/riscv/include/uapi/asm/unistd.h
similarity index 54%
rename from arch/riscv/include/uapi/asm/syscalls.h
rename to arch/riscv/include/uapi/asm/unistd.h
index 206dc4b0f6ea..5545f498071d 100644
--- a/arch/riscv/include/uapi/asm/syscalls.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -1,13 +1,23 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright (C) 2017-2018 SiFive
+ * Copyright (C) 2018 David Abdurachmanov <david.abdurachmanov@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * There is explicitly no include guard here because this file is expected to
- * be included multiple times in order to define the syscall macros via
- * __SYSCALL.
- */
+#define __ARCH_WANT_NEW_STAT
+
+#include <asm-generic/unistd.h>
 
 /*
  * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
-- 
2.19.1
