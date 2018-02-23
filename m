From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:13 -0500
Subject: [PATCH 4/9] RISC-V: Support RISCV_RVC_BRANCH relocations in modules.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-5-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/kernel/module.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 0db01486a357..49ebfd4a7026 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -38,6 +38,22 @@ static int apply_r_riscv_branch_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_rvc_branch_rela(struct module *me, u32 *location,
+					 Elf_Addr v)
+{
+	s64 offset = (void *)v - (void *)location;
+	u32 imm8 = (offset & 0x100) << (12 - 8);
+	u32 imm7_6 = (offset & 0xc0) >> (7 - 6);
+	u32 imm5 = (offset & 0x20) >> (5 - 2);
+	u32 imm4_3 = (offset & 0x18) << (11 - 4);
+	u32 imm2_1 = (offset & 0x6) << (4 - 2);
+
+	u16 *short_location = (u16 *) location;
+
+	*short_location = (*short_location & 0xe383) | imm8 | imm7_6 | imm5 | imm4_3 | imm2_1;
+	return 0;
+}
+
 static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
 				  Elf_Addr v)
 {
@@ -125,6 +141,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
 	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
+	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
 	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
 	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
-- 
2.16.1
