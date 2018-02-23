From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:17 -0500
Subject: [PATCH 8/9] RISC-V: Support RISCV_ALIGN relocations in modules.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-9-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

While legal, this noop implementation may be inefficient.

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/kernel/module.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 4f3e15e7995b..827cf1211360 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -150,8 +150,8 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 	return 0;
 }
 
-static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
-				    Elf_Addr v)
+static int apply_r_riscv_noop_rela(struct module *me, u32 *location,
+				   Elf_Addr v)
 {
 	return 0;
 }
@@ -181,7 +181,8 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
 	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
-	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
+	[R_RISCV_RELAX]			= apply_r_riscv_noop_rela,
+	[R_RISCV_ALIGN]			= apply_r_riscv_noop_rela,
 	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
 	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
 };
-- 
2.16.1
