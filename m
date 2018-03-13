From: zong@andestech.com (Zong Li)
Date: Tue, 13 Mar 2018 16:35:16 +0800
Subject: [PATCH 11/11] RISC-V: Add definition of relocation types
In-Reply-To: <cover.1520928420.git.zong@andestech.com>
References: <cover.1520928420.git.zong@andestech.com>
Message-ID: <d6c92ef3a09a8fa763d5da384744cf48fdcfb9bb.1520928420.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/include/uapi/asm/elf.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index a510edfa8226..5111c7c35e8b 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -79,5 +79,29 @@ typedef union __riscv_fp_state elf_fpregset_t;
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
+/* NDS V5*/
+#define R_RISCV_ALIGN_BTB		240
+#define R_RISCV_10_PCREL		241
+#define R_RISCV_DATA			242
+#define R_RISCV_LALO_HI20		243
+#define R_RISCV_LALO_LO12_I		244
+#define R_RISCV_RELAX_ENTRY		245
+#define R_RISCV_LGP18S0			246
+#define R_RISCV_LGP17S1			247
+#define R_RISCV_LGP17S2			248
+#define R_RISCV_LGP17S3			249
+#define R_RISCV_SGP18S0			250
+#define R_RISCV_SGP17S1			251
+#define R_RISCV_SGP17S2			252
+#define R_RISCV_SGP17S3			253
+#define R_RISCV_RELAX_REGION_BEGIN	254
+#define R_RISCV_RELAX_REGION_END	255
 
 #endif /* _UAPI_ASM_ELF_H */
-- 
2.16.1
