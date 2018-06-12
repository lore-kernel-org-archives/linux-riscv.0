From: schwab@suse.de (Andreas Schwab)
Date: Tue, 12 Jun 2018 19:26:36 +0200
Subject: [PATCH] RISC-V: fix R_RISCV_ADD32/R_RISCV_SUB32 relocations
Message-ID: <mvmh8m7ex0z.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The R_RISCV_ADD32/R_RISCV_SUB32 relocations should add/subtract the
address of the symbol (without overflow check), not its contents.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 29d265d0cf..46aacf6148 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -265,14 +265,14 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
-	*(u32 *)location += (*(u32 *)v);
+	*(u32 *)location += (u32)v;
 	return 0;
 }
 
 static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
-	*(u32 *)location -= (*(u32 *)v);
+	*(u32 *)location -= (u32)v;
 	return 0;
 }
 
-- 
2.17.1


-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
