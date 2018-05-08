From: alankao@andestech.com (Alan Kao)
Date: Tue, 8 May 2018 10:59:33 +0800
Subject: [PATCH] riscv: Fix the bug in memory access fixup code
Message-ID: <1525748373-3841-1-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

A piece of fixup code is currently shared by __copy_user and
__clear_user.  It first disables the access to user-space memory
and then returns the "n" argument, which represents #(bytes not processed).
However,__copy_user's "n" is in register a2, while __clear_user's in a1,
and thus it causes errors for programs like setdomainname02 testcase in LTP.

This patch fixes this issue by separating their fixup code and returning
the right value for the kernel to handle a relative fault properly.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/lib/uaccess.S | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 58fb2877c865..0173ea296baa 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -84,7 +84,7 @@ ENTRY(__clear_user)
 	bgeu t0, t1, 2f
 	bltu a0, t0, 4f
 1:
-	fixup REG_S, zero, (a0), 10f
+	fixup REG_S, zero, (a0), 11f
 	addi a0, a0, SZREG
 	bltu a0, t1, 1b
 2:
@@ -96,12 +96,12 @@ ENTRY(__clear_user)
 	li a0, 0
 	ret
 4: /* Edge case: unalignment */
-	fixup sb, zero, (a0), 10f
+	fixup sb, zero, (a0), 11f
 	addi a0, a0, 1
 	bltu a0, t0, 4b
 	j 1b
 5: /* Edge case: remainder */
-	fixup sb, zero, (a0), 10f
+	fixup sb, zero, (a0), 11f
 	addi a0, a0, 1
 	bltu a0, a3, 5b
 	j 3b
@@ -109,9 +109,14 @@ ENDPROC(__clear_user)
 
 	.section .fixup,"ax"
 	.balign 4
+	/* Fixup code for __copy_user(10) and __clear_user(11) */
 10:
 	/* Disable access to user memory */
 	csrs sstatus, t6
-	sub a0, a3, a0
+	mv a0, a2
+	ret
+11:
+	csrs sstatus, t6
+	mv a0, a1
 	ret
 	.previous
-- 
2.17.0
