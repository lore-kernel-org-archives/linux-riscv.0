From: jimw@sifive.com (Jim Wilson)
Date: Sat, 14 Jul 2018 17:34:39 -0700
Subject: [PATCH] RISC-V: Don't increment sepc after breakpoint.
Message-ID: <20180715003442.32216-1-jimw@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Adding 4 to sepc is pointless, and is wrong if we executed a 2-byte
compressed breakpoint.  This plus a corresponding gdb patch allows
compressed breakpoints to work in gdb.  Gdb maintainers have already
agreed that this is the right approach.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/kernel/traps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 14fcec5bdd24..ae323071c786 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -150,7 +150,6 @@ asmlinkage void do_trap_break(struct pt_regs *regs)
 #endif /* CONFIG_GENERIC_BUG */
 
 	do_trap_siginfo(SIGTRAP, TRAP_BRKPT, regs->sepc, current);
-	regs->sepc += 0x4;
 }
 
 #ifdef CONFIG_GENERIC_BUG
-- 
2.17.1
