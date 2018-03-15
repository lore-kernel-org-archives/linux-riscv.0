From: zong@andestech.com (Zong Li)
Date: Thu, 15 Mar 2018 16:50:44 +0800
Subject: [PATCH v2 04/11] RISC-V: Support CALL relocation type in kernel module
In-Reply-To: <cover.1521103167.git.zong@andestech.com>
References: <cover.1521103167.git.zong@andestech.com>
Message-ID: <9b02b60c51c87f144e7e24aefd9754e32883ca8a.1521103172.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/module.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index be717bd7cea7..3f2730840c25 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -141,6 +141,27 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_call_rela(struct module *me, u32 *location,
+				   Elf_Addr v)
+{
+	s64 offset = (void *)v - (void *)location;
+	s32 fill_v = offset;
+	u32 hi20, lo12;
+
+	if (offset != fill_v) {
+		pr_err(
+		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
+		  me->name, v, location);
+		return -EINVAL;
+	}
+
+	hi20 = (offset + 0x800) & 0xfffff000;
+	lo12 = (offset - hi20) & 0xfff;
+	*location = (*location & 0xfff) | hi20;
+	*(location + 1) = (*(location + 1) & 0xfffff) | (lo12 << 20);
+	return 0;
+}
+
 static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -157,6 +178,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
 	[R_RISCV_GOT_HI20]		= apply_r_riscv_got_hi20_rela,
 	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
+	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
 };
 
-- 
2.16.1
