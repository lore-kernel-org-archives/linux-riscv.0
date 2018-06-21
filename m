From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:41:45 +0800
Subject: [PATCH 4/5] RISC-V: Change variable type for 32-bit compatible
In-Reply-To: <cover.1529506497.git.zong@andestech.com>
References: <cover.1529506497.git.zong@andestech.com>
Message-ID: <3f86f9eb853380686a86a8abe6bda0dd3720ee10.1529506497.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/module.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 29d265d0cf45..c88d2ee918a5 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -39,7 +39,7 @@ static int apply_r_riscv_64_rela(struct module *me, u32 *location, Elf_Addr v)
 static int apply_r_riscv_branch_rela(struct module *me, u32 *location,
 				     Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	u32 imm12 = (offset & 0x1000) << (31 - 12);
 	u32 imm11 = (offset & 0x800) >> (11 - 7);
 	u32 imm10_5 = (offset & 0x7e0) << (30 - 10);
@@ -52,7 +52,7 @@ static int apply_r_riscv_branch_rela(struct module *me, u32 *location,
 static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
 				  Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	u32 imm20 = (offset & 0x100000) << (31 - 20);
 	u32 imm19_12 = (offset & 0xff000);
 	u32 imm11 = (offset & 0x800) << (20 - 11);
@@ -65,7 +65,7 @@ static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
 static int apply_r_riscv_rcv_branch_rela(struct module *me, u32 *location,
 					 Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	u16 imm8 = (offset & 0x100) << (12 - 8);
 	u16 imm7_6 = (offset & 0xc0) >> (6 - 5);
 	u16 imm5 = (offset & 0x20) >> (5 - 2);
@@ -80,7 +80,7 @@ static int apply_r_riscv_rcv_branch_rela(struct module *me, u32 *location,
 static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	u16 imm11 = (offset & 0x800) << (12 - 11);
 	u16 imm10 = (offset & 0x400) >> (10 - 8);
 	u16 imm9_8 = (offset & 0x300) << (12 - 11);
@@ -98,7 +98,7 @@ static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
 static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 					 Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	s32 hi20;
 
 	if (offset != (s32)offset) {
@@ -180,7 +180,7 @@ static int apply_r_riscv_lo12_s_rela(struct module *me, u32 *location,
 static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	s32 hi20;
 
 	/* Always emit the got entry */
@@ -202,7 +202,7 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	s32 fill_v = offset;
 	u32 hi20, lo12;
 
@@ -229,7 +229,7 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 				   Elf_Addr v)
 {
-	s64 offset = (void *)v - (void *)location;
+	uintptr_t offset = (void *)v - (void *)location;
 	s32 fill_v = offset;
 	u32 hi20, lo12;
 
@@ -349,7 +349,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			unsigned int j;
 
 			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
-				u64 hi20_loc =
+				unsigned long hi20_loc =
 					sechdrs[sechdrs[relsec].sh_info].sh_addr
 					+ rel[j].r_offset;
 				u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
@@ -362,12 +362,12 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 					Elf_Sym *hi20_sym =
 						(Elf_Sym *)sechdrs[symindex].sh_addr
 						+ ELF_RISCV_R_SYM(rel[j].r_info);
-					u64 hi20_sym_val =
+					unsigned long hi20_sym_val =
 						hi20_sym->st_value
 						+ rel[j].r_addend;
 
 					/* Calculate lo12 */
-					u64 offset = hi20_sym_val - hi20_loc;
+					size_t offset = hi20_sym_val - hi20_loc;
 					if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
 					    && hi20_type == R_RISCV_GOT_HI20) {
 						offset = module_emit_got_entry(
-- 
2.16.1
