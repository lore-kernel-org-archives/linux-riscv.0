From: deepa.kernel@gmail.com (Deepa Dinamani)
Date: Thu,  5 Jul 2018 14:36:00 -0700
Subject: [PATCH v2 3/7] riscv: Include asm-generic/compat.h
In-Reply-To: <20180705213604.18883-1-deepa.kernel@gmail.com>
References: <20180705213604.18883-1-deepa.kernel@gmail.com>
Message-ID: <20180705213604.18883-4-deepa.kernel@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

riscv does not enable CONFIG_COMPAT in default configurations:
defconfig, allmodconfig and nomodconfig.
And hence does not inlude definitions for compat data types.

Now that time syscalls are being reused in non CONFIG_COMPAT
modes, include asm-generic definitions for riscv.

Alternative would be to make compat_time.h to be conditional on
CONFIG_COMPAT_32BIT_TIME. But, since riscv is already has an
asm/compat.h include the generic version instead.

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: palmer at sifive.com
Cc: linux-riscv at lists.infradead.org
---
 arch/riscv/include/asm/compat.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
index 044aecff8854..e78c5054e178 100644
--- a/arch/riscv/include/asm/compat.h
+++ b/arch/riscv/include/asm/compat.h
@@ -15,6 +15,9 @@
  */
 #ifndef __ASM_COMPAT_H
 #define __ASM_COMPAT_H
+
+#include <asm-generic/compat.h>
+
 #ifdef CONFIG_COMPAT
 
 #if defined(CONFIG_64BIT)
-- 
2.17.1
