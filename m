From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 22 Jun 2018 15:18:14 -0700
Subject: [PATCH] RISC-V: Add early printk support via the SBI console
Message-ID: <20180622221814.29025-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This code lives entirely within the RISC-V arch code.  I've left it
within an "#ifdef CONFIG_EARLY_PRINTK" despite always having
EARLY_PRINTK support on RISC-V just in case someone wants to remove
it.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/setup.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index ee44a48faf79..494c15ba4610 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -39,6 +39,27 @@
 #include <asm/tlbflush.h>
 #include <asm/thread_info.h>
 
+#ifdef CONFIG_EARLY_PRINTK
+static void sbi_console_write(struct console *co, const char *buf,
+			      unsigned int n)
+{
+	int i;
+
+	for (i = 0; i < n; ++i) {
+		if (buf[i] == '\n')
+			sbi_console_putchar('\r');
+		sbi_console_putchar(buf[i]);
+	}
+}
+
+struct console riscv_sbi_early_console_dev __initdata = {
+	.name	= "early",
+	.write	= sbi_console_write,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
+	.index	= -1
+};
+#endif
+
 #ifdef CONFIG_DUMMY_CONSOLE
 struct screen_info screen_info = {
 	.orig_video_lines	= 30,
@@ -195,6 +216,12 @@ static void __init setup_bootmem(void)
 
 void __init setup_arch(char **cmdline_p)
 {
+#if defined(CONFIG_EARLY_PRINTK)
+       if (likely(early_console == NULL)) {
+               early_console = &riscv_sbi_early_console_dev;
+               register_console(early_console);
+       }
+#endif
 	*cmdline_p = boot_command_line;
 
 	parse_early_param();
-- 
2.16.4
