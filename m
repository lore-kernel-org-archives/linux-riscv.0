From: zong@andestech.com (Zong Li)
Date: Thu, 15 Mar 2018 16:50:51 +0800
Subject: [PATCH v2 11/11] RISC-V: Add definition of relocation types
In-Reply-To: <cover.1521103167.git.zong@andestech.com>
References: <cover.1521103167.git.zong@andestech.com>
Message-ID: <6146832f0456fab33271f87fca2ef31b7d923188.1521103174.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/include/uapi/asm/elf.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index a510edfa8226..5cae4c30cd8e 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -79,5 +79,12 @@ typedef union __riscv_fp_state elf_fpregset_t;
 #define R_RISCV_TPREL_I		49
 #define R_RISCV_TPREL_S		50
 #define R_RISCV_RELAX		51
+#define R_RISCV_SUB6		52
+#define R_RISCV_SET6		53
+#define R_RISCV_SET8		54
+#define R_RISCV_SET16		55
+#define R_RISCV_SET32		56
+#define R_RISCV_32_PCREL	57
+
 
 #endif /* _UAPI_ASM_ELF_H */
-- 
2.16.1
