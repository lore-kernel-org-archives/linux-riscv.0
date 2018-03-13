From: mdf@kernel.org (Moritz Fischer)
Date: Mon, 12 Mar 2018 20:26:09 -0700
Subject: [RFC/PATCH] risc-v: Fix issue ignoring CONFIG_CMDLINE_OVERRIDE
Message-ID: <20180313032609.405-1-mdf@kernel.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Fix issue where CONFIG_CMDLINE_OVERRIDE is being
ignored.

Signed-off-by: Trung Tran <trung.tran@ettus.com>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---

Hi all,

not sure this is the right fix, hopefully someone
can chime in and come up with the correct solution.

Thanks,

Moritz
---
 arch/riscv/kernel/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 09f7064e898c..e24191a0c244 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -38,6 +38,8 @@
 #include <asm/tlbflush.h>
 #include <asm/thread_info.h>
 
+static char default_command_line[COMMAND_LINE_SIZE] __initdata = CONFIG_CMDLINE;
+
 #ifdef CONFIG_DUMMY_CONSOLE
 struct screen_info screen_info = {
 	.orig_video_lines	= 30,
@@ -194,7 +196,11 @@ static void __init setup_bootmem(void)
 
 void __init setup_arch(char **cmdline_p)
 {
+#if defined(CONFIG_CMDLINE_OVERRIDE)
+	*cmdline_p = default_command_line;
+#else
 	*cmdline_p = boot_command_line;
+#endif
 
 	parse_early_param();
 
-- 
2.16.2
