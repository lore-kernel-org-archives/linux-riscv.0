From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:16 -0500
Subject: [PATCH 7/9] RISC-V: Support RISCV_SUB32 relocations in modules.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-8-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/kernel/module.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 25b4aae5b8de..4f3e15e7995b 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -163,6 +163,13 @@ static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*location -= v;
+	return 0;
+}
+
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
@@ -176,6 +183,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
 	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
+	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.16.1
