From: alistair.francis@wdc.com (Alistair Francis)
Date: Mon,  6 Aug 2018 11:51:23 -0700
Subject: [PATCH 2/2] riscv/smpboot: Fix mm_grab() typo
In-Reply-To: <20180806185123.5140-1-alistair.francis@wdc.com>
References: <20180806185123.5140-1-alistair.francis@wdc.com>
Message-ID: <20180806185123.5140-2-alistair.francis@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Rename the mm_grab() function to mmgrab() to fix compilation failure.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 600cbb7f03f4..c0032304b6ee 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -165,7 +165,7 @@ asmlinkage void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 
 	/* All kernel threads share the same mm context.  */
-	mm_grab(mm);
+	mmgrab(mm);
 	current->active_mm = mm;
 
 	trap_init();
-- 
2.17.1
