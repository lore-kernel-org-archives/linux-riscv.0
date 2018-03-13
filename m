From: zong@andestech.com (Zong Li)
Date: Tue, 13 Mar 2018 16:35:10 +0800
Subject: [PATCH 05/11] RISC-V: Support HI20/LO12_I/LO12_S relocation type in
 kernel module
In-Reply-To: <cover.1520928420.git.zong@andestech.com>
References: <cover.1520928420.git.zong@andestech.com>
Message-ID: <390fb9c030aa83ba978070bf1df163bc4f5633e1.1520928420.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

HI20 and LO12_I/LO12_S relocate the absolute address, the range of
offset must in 32-bit.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/module.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7e85e5840b4d..654fe7dcd38d 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -92,6 +92,45 @@ static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
+				   Elf_Addr v)
+{
+	s32 hi20;
+
+	if (IS_ENABLED(CMODEL_MEDLOW)) {
+		pr_err(
+		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
+		  me->name, v, location);
+		return -EINVAL;
+	}
+
+	hi20 = ((s32)v + 0x800) & 0xfffff000;
+	*location = (*location & 0xfff) | hi20;
+	return 0;
+}
+
+static int apply_r_riscv_lo12_i_rela(struct module *me, u32 *location,
+				     Elf_Addr v)
+{
+	/* Skip medlow checking because of filtering by HI20 already */
+	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
+	s32 lo12 = ((s32)v - hi20);
+	*location = (*location & 0xfffff) | ((lo12 & 0xfff) << 20);
+	return 0;
+}
+
+static int apply_r_riscv_lo12_s_rela(struct module *me, u32 *location,
+				     Elf_Addr v)
+{
+	/* Skip medlow checking because of filtering by HI20 already */
+	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
+	s32 lo12 = ((s32)v - hi20);
+	u32 imm11_5 = (lo12 & 0xfe0) << (31 - 11);
+	u32 imm4_0 = (lo12 & 0x1f) << (11 - 4);
+	*location = (*location & 0x1fff07f) | imm11_5 | imm4_0;
+	return 0;
+}
+
 static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
@@ -176,6 +215,9 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
 	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
+	[R_RISCV_HI20]			= apply_r_riscv_hi20_rela,
+	[R_RISCV_LO12_I]		= apply_r_riscv_lo12_i_rela,
+	[R_RISCV_LO12_S]		= apply_r_riscv_lo12_s_rela,
 	[R_RISCV_GOT_HI20]		= apply_r_riscv_got_hi20_rela,
 	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
-- 
2.16.1
