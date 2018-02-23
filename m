From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:15 -0500
Subject: [PATCH 6/9] RISC-V: Support RISCV_ADD32 relocations in modules.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-7-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/kernel/module.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 30b29c5b6600..25b4aae5b8de 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -156,6 +156,13 @@ static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*location += v;
+	return 0;
+}
+
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
@@ -168,6 +175,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
+	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.16.1
