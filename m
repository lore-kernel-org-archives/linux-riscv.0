From: olof@lixom.net (Olof Johansson)
Date: Tue, 30 Oct 2018 23:47:09 -0700
Subject: [PATCH 3/3] RISC-V: Silence some module warnings on 32-bit
In-Reply-To: <20181031064709.30981-1-olof@lixom.net>
References: <20181031064709.30981-1-olof@lixom.net>
Message-ID: <20181031064709.30981-4-olof@lixom.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Fixes:

arch/riscv/kernel/module.c: In function 'apply_r_riscv_32_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:23:27: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_pcrel_hi20_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:104:23: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_hi20_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:146:23: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_got_hi20_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:190:60: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_call_plt_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:214:24: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_call_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:236:23: note: format string is defined here

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/kernel/module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 3303ed2cd419..7dd308129b40 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -21,7 +21,7 @@ static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
 {
 	if (v != (u32)v) {
 		pr_err("%s: value %016llx out of range for 32-bit field\n",
-		       me->name, v);
+		       me->name, (long long)v);
 		return -EINVAL;
 	}
 	*location = v;
@@ -102,7 +102,7 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 	if (offset != (s32)offset) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
@@ -144,7 +144,7 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 	if (IS_ENABLED(CMODEL_MEDLOW)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
@@ -188,7 +188,7 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 	} else {
 		pr_err(
 		  "%s: can not generate the GOT entry for symbol = %016llx from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
@@ -212,7 +212,7 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 		} else {
 			pr_err(
 			  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-			  me->name, v, location);
+			  me->name, (long long)v, location);
 			return -EINVAL;
 		}
 	}
@@ -234,7 +234,7 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 	if (offset != fill_v) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
-- 
2.11.0
