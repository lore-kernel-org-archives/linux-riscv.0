From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:12 -0500
Subject: [PATCH 3/9] RISC-V: Support RISCV_CALL relocations for non-PIC
 modules.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-4-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Only PIC objects have RISCV_CALL_PLT relocations.

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/kernel/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 8ad24bdf69de..0db01486a357 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -94,7 +94,7 @@ static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
 	return 0;
 }
 
-static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
+static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
 	s64 offset = (void *)v - (void *)location;
@@ -129,7 +129,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
 	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
-	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
+	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
 };
 
-- 
2.16.1
