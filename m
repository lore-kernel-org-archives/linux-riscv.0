From: olof@lixom.net (Olof Johansson)
Date: Tue, 30 Oct 2018 23:47:08 -0700
Subject: [PATCH 2/3] RISC-V: lib: minor asm cleanup
In-Reply-To: <20181031064709.30981-1-olof@lixom.net>
References: <20181031064709.30981-1-olof@lixom.net>
Message-ID: <20181031064709.30981-3-olof@lixom.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Fix tab/space conversion and use ENTRY/ENDPROC macros.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/lib/tishift.S | 59 +++++++++++++++++++++++++-----------------------
 arch/riscv/lib/udivdi3.S | 42 ++++++++++++++++++----------------
 2 files changed, 53 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/lib/tishift.S b/arch/riscv/lib/tishift.S
index 69abb1277234..237bc9fd0763 100644
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
diff --git a/arch/riscv/lib/udivdi3.S b/arch/riscv/lib/udivdi3.S
index cb01ae5b181a..7f1c0af182a3 100644
--- a/arch/riscv/lib/udivdi3.S
+++ b/arch/riscv/lib/udivdi3.S
@@ -11,28 +11,30 @@
  *   GNU General Public License for more details.
  */
 
-  .globl __udivdi3
-__udivdi3:
-  mv    a2, a1
-  mv    a1, a0
-  li    a0, -1
-  beqz  a2, .L5
-  li    a3, 1
-  bgeu  a2, a1, .L2
+#include <linux/linkage.h>
+
+ENTRY(__udivdi3)
+	mv	a2, a1
+	mv	a1, a0
+	li	a0, -1
+	beqz	a2, .L5
+	li	a3, 1
+	bgeu	a2, a1, .L2
 .L1:
-  blez  a2, .L2
-  slli  a2, a2, 1
-  slli  a3, a3, 1
-  bgtu  a1, a2, .L1
+	blez	a2, .L2
+	slli	a2, a2, 1
+	slli	a3, a3, 1
+	bgtu	a1, a2, .L1
 .L2:
-  li    a0, 0
+	li	a0, 0
 .L3:
-  bltu  a1, a2, .L4
-  sub   a1, a1, a2
-  or    a0, a0, a3
+	bltu	a1, a2, .L4
+	sub	a1, a1, a2
+	or	a0, a0, a3
 .L4:
-  srli  a3, a3, 1
-  srli  a2, a2, 1
-  bnez  a3, .L3
+	srli	a3, a3, 1
+	srli	a2, a2, 1
+	bnez	a3, .L3
 .L5:
-  ret
+	ret
+ENDPROC(__udivdi3)
-- 
2.11.0
