From: zong@andestech.com (Zong Li)
Date: Tue, 13 Mar 2018 16:35:13 +0800
Subject: [PATCH 08/11] RISC-V: Support ADD32 relocation type in kernel module
In-Reply-To: <cover.1520928420.git.zong@andestech.com>
References: <cover.1520928420.git.zong@andestech.com>
Message-ID: <f3aff15700228c8edea16b482486bca25beb50cc.1520928420.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/module.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 351bf2a518ee..2d14dff22861 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -246,6 +246,13 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u32 *)location += (*(u32 *)v);
+	return 0;
+}
+
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
@@ -264,6 +271,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
 	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
+	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.16.1
