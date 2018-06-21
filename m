From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:41:44 +0800
Subject: [PATCH 3/5] RISC-V: Add definiion of extract symbol's index and type
 for 32-bit
In-Reply-To: <cover.1529506497.git.zong@andestech.com>
References: <cover.1529506497.git.zong@andestech.com>
Message-ID: <3081ab2d2c70e3b1826a9930c90eac33dacce7d2.1529506497.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Use generic marco to get the index and type of symbol.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/include/uapi/asm/elf.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index 5cae4c30cd8e..1e0dfc36aab9 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -21,8 +21,13 @@ typedef struct user_regs_struct elf_gregset_t;
 
 typedef union __riscv_fp_state elf_fpregset_t;
 
-#define ELF_RISCV_R_SYM(r_info) ((r_info) >> 32)
-#define ELF_RISCV_R_TYPE(r_info) ((r_info) & 0xffffffff)
+#if __riscv_xlen == 64
+#define ELF_RISCV_R_SYM(r_info)		ELF64_R_SYM(r_info)
+#define ELF_RISCV_R_TYPE(r_info)	ELF64_R_TYPE(r_info)
+#else
+#define ELF_RISCV_R_SYM(r_info)		ELF32_R_SYM(r_info)
+#define ELF_RISCV_R_TYPE(r_info)	ELF32_R_TYPE(r_info)
+#endif
 
 /*
  * RISC-V relocation types
-- 
2.16.1
