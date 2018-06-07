From: schwab@suse.de (Andreas Schwab)
Date: Thu, 07 Jun 2018 12:27:27 +0200
Subject: [PATCH] RISC-V: Handle R_RISCV_32 in modules
Message-ID: <mvm7enaki28.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

With CONFIG_MODVERSIONS=y the R_RISCV_32 relocation is used by the
__kcrctab section.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/module.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 5dddba301d..1d5e9b934b 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -17,6 +17,17 @@
 #include <linux/errno.h>
 #include <linux/moduleloader.h>
 
+static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	if (v != (u32)v) {
+		pr_err("%s: value %016llx out of range for 32-bit field\n",
+		       me->name, v);
+		return -EINVAL;
+	}
+	*location = v;
+	return 0;
+}
+
 static int apply_r_riscv_64_rela(struct module *me, u32 *location, Elf_Addr v)
 {
 	*(u64 *)location = v;
@@ -265,6 +276,7 @@ static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
 
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
+	[R_RISCV_32]			= apply_r_riscv_32_rela,
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
 	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
 	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
-- 
2.17.1


-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
