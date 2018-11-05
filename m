From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon,  5 Nov 2018 15:40:04 +0100
Subject: [PATCH] riscv: fix spacing in struct pt_regs
Message-ID: <20181105144004.28267-1-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Replace 8 spaces with tab to match styling.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/include/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index 2c5df945d43c..bbe1862e8f80 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -56,8 +56,8 @@ struct pt_regs {
 	unsigned long sstatus;
 	unsigned long sbadaddr;
 	unsigned long scause;
-        /* a0 value before the syscall */
-        unsigned long orig_a0;
+	/* a0 value before the syscall */
+	unsigned long orig_a0;
 };
 
 #ifdef CONFIG_64BIT
-- 
2.19.1
