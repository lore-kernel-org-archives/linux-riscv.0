From: olof@lixom.net (Olof Johansson)
Date: Tue, 30 Oct 2018 17:04:13 -0700
Subject: [PATCH] RISC-V: lib: Fix build error for 64-bit
Message-ID: <20181031000413.30123-1-olof@lixom.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Fixes the following build error from tinyconfig:

riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
fair.c:(.text+0x70): undefined reference to `__lshrti3'
riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
clocksource.c:(.text+0x334): undefined reference to `__lshrti3'

Fixes: 7f47c73b355f ("RISC-V: Build tishift only on 64-bit")
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/lib/Makefile  |  2 +-
 arch/riscv/lib/tishift.S | 59 +++++++++++++++++++++++++-----------------------
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 5739bd05d289e..4e2e600f7d538 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,6 @@ lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
 
-lib-(CONFIG_64BIT) += tishift.o
+lib-$(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
diff --git a/arch/riscv/lib/tishift.S b/arch/riscv/lib/tishift.S
index 69abb1277234b..237bc9fd07636 100644
--- a/arch/riscv/lib/tishift.S
+++ b/arch/riscv/lib/tishift.S
@@ -10,33 +10,36 @@
  *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *   GNU General Public License for more details.
  */
-  .globl __lshrti3
-__lshrti3:
-  beqz  a2, .L1
-  li    a5,64
-  sub   a5,a5,a2
-  addi  sp,sp,-16
-  sext.w a4,a5
-  blez  a5, .L2
-  sext.w a2,a2
-  sll   a4,a1,a4
-  srl   a0,a0,a2
-  srl   a1,a1,a2
-  or    a0,a0,a4
-  sd    a1,8(sp)
-  sd    a0,0(sp)
-  ld    a0,0(sp)
-  ld    a1,8(sp)
-  addi  sp,sp,16
-  ret
+
+#include <linux/linkage.h>
+
+ENTRY(__lshrti3)
+	beqz	a2, .L1
+	li	a5,64
+	sub	a5,a5,a2
+	addi	sp,sp,-16
+	sext.w	a4,a5
+	blez	a5, .L2
+	sext.w	a2,a2
+	sll	a4,a1,a4
+	srl	a0,a0,a2
+	srl	a1,a1,a2
+	or	a0,a0,a4
+	sd	a1,8(sp)
+	sd	a0,0(sp)
+	ld	a0,0(sp)
+	ld	a1,8(sp)
+	addi	sp,sp,16
+	ret
 .L1:
-  ret
+	ret
 .L2:
-  negw  a4,a4
-  srl   a1,a1,a4
-  sd    a1,0(sp)
-  sd    zero,8(sp)
-  ld    a0,0(sp)
-  ld    a1,8(sp)
-  addi  sp,sp,16
-  ret
+	negw	a4,a4
+	srl	a1,a1,a4
+	sd	a1,0(sp)
+	sd	zero,8(sp)
+	ld	a0,0(sp)
+	ld	a1,8(sp)
+	addi	sp,sp,16
+	ret
+ENDPROC(__lshrti3)
-- 
2.11.0
