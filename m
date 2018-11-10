From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 10 Nov 2018 03:02:44 +0200
Subject: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
Message-ID: <20181110010244.5837-1-mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Add a menu to chose how the built-in command line will be
used and add CMDLINE_EXTEND for compatibility with FDT code.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/Kconfig | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..81f884164b52 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,39 +227,42 @@ endmenu
 
 menu "Boot options"
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
+config CMDLINE
+	string "Built-in kernel command line"
 	help
 	  For most platforms, it is firmware or second stage bootloader
 	  that by default specifies the kernel command line options.
 	  However, it might be necessary or advantageous to either override
-	  the default kernel command line or add a few extra options to it.
-	  For such cases, this option allows hardcoding command line options
-	  directly into the kernel.
+	  the provided kernel command line or add a few extra options to it.
+	  For such cases, it is possible to define a built-in command line
+	  here and chose how the kernel should use it later on.
 
-	  For that, choose 'Y' here and fill in the extra boot parameters
-	  in CONFIG_CMDLINE.
+choice
+	prompt "Built-in command line usage" if CMDLINE != ""
+	default CMDLINE_FALLBACK
+	help
+	  Chose how the kernel will handle the provided built-in command
+	  line.
 
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
+config CMDLINE_FALLBACK
+	bool "Fallback"
+	help
+	  Use the built-in command line as fallback in case we get nothing
+	  from the boot loader.
 
-config CMDLINE
-	string "Built-in kernel command string"
-	depends on CMDLINE_BOOL
-	default ""
+config CMDLINE_EXTEND
+	bool "Extension"
 	help
-	  Supply command-line options at build time by entering them here.
+	  Use the built-in command line as an extension of the command line
+	  provided by the boot loader.
 
 config CMDLINE_FORCE
-	bool "Built-in command line overrides bootloader arguments"
-	depends on CMDLINE_BOOL
+	bool "Forced"
 	help
-	  Set this option to 'Y' to have the kernel ignore the bootloader
-	  or firmware command line.  Instead, the built-in command line
-	  will be used exclusively.
+	  Use the built-in command line in place of the command line
+	  provided by the boot loader.
 
-	  If you don't know what to do here, say N.
+endchoice
 
 endmenu
 
-- 
2.16.4
