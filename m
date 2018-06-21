From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:40:07 +0800
Subject: [PATCH] RISC-V: Add the directive for alignment of stvec's value
Message-ID: <1529545207-26999-1-git-send-email-zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The stvec's value must be 4 byte alignment by specification definition.
This directive avoids to stvec be set the non-alignment value by the
following code in head.S

 /* Point stvec to virtual address of intruction after satp write */
la a0, 1f
add a0, a0, a1
csrw stvec, a0

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 396ec7b349ce..ae7b204f531c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -94,6 +94,7 @@ relocate:
 	or a0, a0, a1
 	sfence.vma
 	csrw sptbr, a0
+.align 2
 1:
 	/* Set trap vector to spin forever to help debug */
 	la a0, .Lsecondary_park
-- 
2.16.1
