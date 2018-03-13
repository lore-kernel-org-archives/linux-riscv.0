From: zong@andestech.com (Zong Li)
Date: Tue, 13 Mar 2018 16:35:12 +0800
Subject: [PATCH 07/11] RISC-V: Support ALIGN relocation type in kernel module
In-Reply-To: <cover.1520928420.git.zong@andestech.com>
References: <cover.1520928420.git.zong@andestech.com>
Message-ID: <64e85dd0127ae1566864e23cbfdacd45d0f31f87.1520928420.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Just ignore align type. The nop instructions cannot be removed in
kernel module. Kernel modules is not doing relax.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/module.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index e23c051dfc62..351bf2a518ee 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -240,6 +240,12 @@ static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_align_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	return 0;
+}
+
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
@@ -257,6 +263,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
+	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.16.1
