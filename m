From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:14 -0500
Subject: [PATCH 5/9] RISC-V: Support RISCV_RVC_JUMP relocations in modules.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-6-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/kernel/module.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 49ebfd4a7026..30b29c5b6600 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -67,6 +67,25 @@ static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
+				       Elf_Addr v)
+{
+	s64 offset = (void *)v - (void *)location;
+	u32 imm11 = (offset & 0x800) << (12 - 11);
+	u32 imm10 = (offset & 0x400) >> (10 - 8);
+	u32 imm9_8 = (offset & 0x300) << (10 - 9);
+	u32 imm7 = (offset & 0x80) >> (7 - 6);
+	u32 imm6 = (offset & 0x40) << (7 - 6);
+	u32 imm5 = (offset & 0x20) >> (5 - 2);
+	u32 imm4 = (offset & 0x10) << (11 - 4);
+	u32 imm3_1 = (offset & 0xe) << (5 - 3);
+
+	u16 *short_location = (u16 *) location;
+
+	*short_location = (*short_location & 0xe003) | imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1;
+	return 0;
+}
+
 static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 					 Elf_Addr v)
 {
@@ -143,6 +162,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
 	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
 	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
+	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
 	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
 	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
-- 
2.16.1
