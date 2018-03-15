From: zong@andestech.com (Zong Li)
Date: Thu, 15 Mar 2018 16:50:49 +0800
Subject: [PATCH v2 09/11] RISC-V: Support SUB32 relocation type in kernel
 module
In-Reply-To: <cover.1521103167.git.zong@andestech.com>
References: <cover.1521103167.git.zong@andestech.com>
Message-ID: <f577fe0f07e5e417c11877c714ae4c6e93249e9e.1521103173.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/module.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 73ea36c73d3b..5dddba301d0a 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -256,6 +256,13 @@ static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u32 *)location -= (*(u32 *)v);
+	return 0;
+}
+
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
@@ -275,6 +282,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
 	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
 	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
+	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.16.1
